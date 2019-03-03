function get_sets()
    include('./Gear/CommonGear.lua')    
    include('Gear/SAM.lua')
    include('Maps/SAM.lua')
    include('Libs/TextBoxLib.lua')
    include('Libs/HelperFunctions.lua')
    include('Libs/MoteLibs/Modes.lua')
    include('Libs/PatsAutoskillchain.lua')
    
    job_setup()
    load_gear_sets()
    load_sam_maps()
end

function job_setup()
    buff = {}
    buffs = S{"Hasso", "Seigan"}
    
    buff["Hasso"] = buffactive["Hasso"] or false
    buff["Seigan"] = buffactive["Seigan"] or false
    
    -- lock_weapons = true
    lock_cape = false
    lock_defense = false
    movespeed = false
    
    idle_mode = M{}
    combat_mode = M{}
    combat_mode["TP"] = M{}
    combat_mode["PDT"] = M{}
    combat_mode["MDT"] = M{}
    
    idle_mode:options("Default", "PDT", "MDT", "MEVA")
    combat_mode:options("TP", "MDT", "PDT")
    combat_mode["TP"]:options("4Hit")
    combat_mode["PDT"]:options("PDT", "Seigan")
    combat_mode["MDT"]:options("MDT", "MEVA")
    
    --Keybinds--
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f10 gs c LockDefense') --Toggles locking when in defense mode
    send_command('bind @f12 gs c LockCape') --Toggles CP cape
    send_command('bind @f11 gs c Movespeed') --Toggles keeping fast pants on all idle sets

    --Textbox Stuff--
    local str = 'SAM Info\n' ..
    '--------------------------\n' ..
    'Combat Mode  : ${cbmode|(None)}\n' ..
    'Idle Mode    : ${idlemode|(None)}\n' ..
    'Defense Lock : ${defenselock|(None)}\n' ..
    'Cape Lock    : ${capelock|(None)}\n' ..
    'Fast Pants   : ${movespeed|(None)}\n' ..
    'Skillchain   : ${skillchainmode|(None)}'
    textbox = CreateTextBox(str, 1190, 770)
    textbox:show()
    update_info_box()
end

function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    
    send_command('unbind @f10')
    send_command('unbind @f11')
    send_command('unbind @f12')    
end

function precast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
            handle_default_precast(spell)
            HandleSkillchainPrecast(spell)
        if buffactive['Reive Mark'] then
            equip(sets.reive)
        end
    end
end

function midcast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        handle_default_midcast(spell)
    end
end

function aftercast(spell, action)
    status_change(player.status)
end

function self_command(command)
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
    else 
        CheckCommands(command)
    end
    status_change(player.status)
    update_info_box()
end

function status_change(new, tab, old)
    if new == 'Idle' then
        equip(sets.idle[idle_mode.current])
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        end
        if movespeed == true then
            equip({legs = CarmineLegs.Accuracy})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_mode[combat_mode.current].current])
    end
    if buffactive['Reive Mark'] then
        equip(sets.reive)
    end
end

function update_info_box()
    textbox.cbmode = combat_mode[combat_mode.current].current
    textbox.idlemode = idle_mode.current
    textbox.capelock = bool_to_string(lock_cape)
    textbox.movespeed = bool_to_string(movespeed)
    textbox.defenselock = bool_to_string(lock_defense)
    textbox.skillchainmode = bool_to_string(use_skillchain)
end

windower.register_event('zone change', function()
status_change(player.status)
end)
