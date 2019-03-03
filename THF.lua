--[[
    Custom commands:
    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime
--]]

-- Initialization function for this job file.

function get_sets()
    include('Gear/THF.lua')
    include('Maps/THF.lua')
    include('./Libs/MoteLibs/Modes.lua')
    include('./Libs/MoteLibs/TreasureHunter.lua')
    include('./Libs/HelperFunctions.lua')
    include('./Libs/TextBoxLib.lua')
    
    load_gear_sets()
    load_thf_maps()
    job_setup()
end

function job_setup()
    state.Buff = {}
    state.Buff["Sneak Attack"] = buffactive["Sneak Attack"] or false
    state.Buff["Trick Attack"] = buffactive["Trick Attack"] or false
    state.Buff["Feint"] = buffactive["Feint"] or false
    
    lock_cape = false
    lock_defense = false
    movespeed = false
    lock_th = false
    
    idle_mode = M{}
    combat_mode = M{}
    combat_mode["TP"] = M{}
    combat_mode["PDT"] = M{}
    combat_mode["MDT"] = M{}
    
    idle_mode:options("Default", "PDT", "MDT", "MEVA")
    combat_mode:options("TP", "MDT", "PDT")
    combat_mode["TP"]:options("DW0", "DW7", "DW12", "DW17", "DW20", "DW25")
    combat_mode["PDT"]:options("PDT")
    combat_mode["MDT"]:options("MDT", "MEVA")
    
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    send_command('bind @f10 gs c LockDefense') --Toggles locking when in defense mode
    send_command('bind @f12 gs c LockCape') --Toggles CP cape
    send_command('bind @f11 gs c Movespeed') --Toggles keeping fast pants on all idle sets
    
    send_command('bind @= gs c TH_MODE')
    send_command('bind @9 gs c MAIN')
    
    --Textbox Stuff--
    local str = 'THF Info\n' ..
    '----------------------------\n' ..
    'Combat Mode     : ${cbmode|(None)}\n' ..
    'Idle Mode       : ${idlemode|(None)}\n' ..
    'Defense Lock    : ${defenselock|(None)}\n' ..
    'Cape Lock       : ${capelock|(None)}\n' ..
    'Movement Speed  : ${movespeed|(None)}\n' ..
    'Treasure Hunter : ${treasurehunter|(None)}'
    textbox = CreateTextBox(str, 1190, 770)
    textbox:show()
    update_info_box()
end

function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    
    send_command('unbind @f9')
    send_command('unbind @f10')
    send_command('unbind @f11')
    send_command('unbind @f12')
    
    send_command('unbind @=')
end

function precast(spell)
    check_range_lock()
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if (string.find(spell.name, "Waltz") and spell.name ~= "Healing Waltz") then
            if spell.target.type == "SELF" then
                equip(sets.precast.waltz.self)
            else
                equip(sets.precast.waltz)
            end
        elseif string.find(spell.name, "Utsusemi") then
            equip(sets.precast.utsusemi)
        else
            handle_default_precast(spell)
            reive()
            if (state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime') and
                (spell.action_type == "WeaponSkill") then
                equip(sets.TreasureHunter)
            end
        end
    end
end

function midcast(spell)
    check_range_lock()
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if string.find(spell.name, "Utsusemi") then
            cancel_conflicting_buffs(spell)
            equip(sets.midcast.utsusemi)
        else
            handle_default_midcast(spell)
        end
        if (state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack') or (ThfMaps["Tagging"]:contains(spell.english)) then
            equip(sets.TreasureHunter)
        end
    end
end

function aftercast(spell, action)
    check_range_lock()
    status_change(player.status)
    check_buff()
end

function self_command(command)
    check_range_lock()
    if (combat_mode:contains(command)) then
        if (combat_mode.current == command) then
            combat_mode[combat_mode.current]:cycle()
        else
            combat_mode:set(command)
        end
    elseif (command == "IDLE") then
        idle_mode:cycle()
    elseif (command == "LockCape") then
        lock_cape = not lock_cape
        if (lock_cape) then
            equip({back = CapacityCape})
            disable("back")
        else
            enable("back")
        end
    elseif (command == "LockDefense") then
        lock_defense = not lock_defense
    elseif (command == "Movespeed") then
        movespeed = not movespeed
    elseif (command == "Mote_TH") then
        th_update(command, {handled = false})
    elseif (command == "TH_MODE") then
        state.TreasureMode:cycle()
        TH_for_first_hit()
    elseif (command == "MAIN") then
        enable("main")
        enable("sub")
        equip(sets.Main)
        disable("main")
        disable("sub")
    end
    update_info_box()
    status_change(player.status)
end

function status_change(new, tab, old)
    check_range_lock()
    if new == 'Idle' then
        equip(sets.idle[idle_mode.current])
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        end
        if movespeed == true then
            equip({feet = "Jute Boots +1"})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_mode[combat_mode.current].current])
        if state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        check_buff()
    end
    reive()
end

function buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            status_change(player.status)
        end
    end
end

-- Checks for buffs and equips relevant midcast gear.
-- Equips TH gear when relevant
function check_buff()
    for b in pairs(state.Buff) do
        if buffactive[b] then
            -- equip(sets.midcast.buff[b])
            if state.TreasureMode.value == 'SATA' then
                equip(sets.TreasureHunter)
            end
        end
    end
end

windower.register_event('zone change', function()
    status_change(player.status)
end)

function update_info_box()
    textbox.treasurehunter = state.TreasureMode.current
    textbox.cbmode = combat_mode[combat_mode.current].current
    textbox.idlemode = idle_mode.current
    textbox.capelock = bool_to_string(lock_cape)
    textbox.movespeed = bool_to_string(movespeed)
    textbox.defenselock = bool_to_string(lock_defense)
end

function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    if spell.english == 'Utsusemi: Ichi' then
        send_command('@wait 1; cancel copy image')
        send_command('@wait 1; cancel copy image (2)')
        send_command('@wait 1; cancel copy image (3)')
    end
end

function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end
