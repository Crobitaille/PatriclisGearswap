function get_sets()
    include('BLU/BLUGear2.lua')
    include('BLU/BLUMaps2.lua')
    include('PatLibs/TextBoxLib.lua')
    include('PatLibs/HelperFunctions.lua')
    
    job_setup()
    load_gear_sets()
    load_blu_maps()
end

function job_setup()
    --Buffs--
    state = {}
    state.Buff = {}
    buffs = S{"Unbridled Learning", "Burst Affinity", "Chain Affinity", "Convergence", "Diffusion", "Efflux"}
    
    state.Buff["Unbridled Learning"] = buffactive['Unbridled Learning'] or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    --Weapon Lock--
    lock_weapons = true
    lock_cape = false
    fast_pants = false
    disable("main")
    disable("sub")
    
    --Combat Mode Stuff--
    combat_mode = "TP" -- The current combatmode
    combat_modes = {}
    combat_modes["TP"] = {"DW0", "DW7", "DW12"} --Table of all available TP Modes "ACC1200", "ACC1300"
    combat_modes["PDT"] = {"PDT"} --Table of all available PDT Modes
    combat_modes["MDT"] = {"MDT", "MEVA"} --Table of all available MDT Modes
    combat_mode_indexes = {}
    combat_mode_indexes["TP"] = 1 --Index of the current TP mode
    combat_mode_indexes["PDT"] = 1 --Index of the current PDT mode
    combat_mode_indexes["MDT"] = 1 --Index of the current MDT mode
    
    --Idle Mode Stuff--
    idle_modes = {"Default", "PDT", "MDT", "MEVA", "Refresh"}
    idle_mode_index = 1
    
    --Keybinds--
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    send_command('bind @f12 gs c LockCape') --Toggles weapon switching
    send_command('bind @f11 gs c FastPants') --Toggles weapon switching
    
    send_command('bind @9 gs c MELEE') --Equips Melee Weapons and disables weapon switching
    send_command('bind @0 gs c MAGIC') --Equips Magic Weapons and enables weapon switching
    
    --Textbox Stuff--
    local str = 'BLU Info\n' ..
    '-------------------------\n' ..
    'Combat Mode : ${cbmode|(None)}\n' ..
    'Idle Mode   : ${idlemode|(None)}\n' ..
    'Weapon Lock : ${weaponlock|(None)}\n' ..
    'Cape Lock   : ${capelock|(None)}\n' ..
    'Fast Pants  : ${fastpants|(None)}'
    textbox = CreateTextBox(str, 1200, 750)
    textbox:show()
    update_info_box()
end

function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    
    send_command('unbind !f9')
    
    send_command('unbind @9')
    send_command('unbind @10')
    
end

--[[
-- Overridden from gearswap.
-- Is called before the player takes one of the following actions:
-- Casting a spell, using an ability, using an item.
]]--
function precast(spell)
    -- add_to_chat(104, 'Skill: ' .. spell.skill)
    add_to_chat(104, 'Type: ' .. spell.type)
    add_to_chat(104, 'Action_Type: ' .. spell.action_type)
    handle_default_precast(spell)
    if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
        equip(sets.reive)
    end
end

function user_post_precast(spell, action, spellMap, eventArgs)
    
end

function aftercast(spell, action)
    status_change(player.status)
end

function midcast(spell)
    if sets.midcast[spell.english] then --If a set exists for the specific spell: sets.precast["Spellname"];
        equip(sets.midcast[spell.english])
    elseif (BluMaps["Healing"]:contains(spell.english)) or (string.find(spell.name, "Cur") and spell.name ~= "Cursna") then
        if spell.target.type == "SELF" then
            equip(sets.midcast["Healing"].self)
        else
            equip(sets.midcast["Healing"])
        end
    elseif spell.skill == "Blue Magic" then
        for k in pairs(BluMaps) do
            if BluMaps[k]:contains(spell.english) then
                equip(sets.midcast[k])
                break
            end
        end
    elseif (sets.midcast[spell.skill]) then --If a set exists for the specific skill: sets.precast["Enhancing Magic"];
        equip(sets.midcast[spell.skill])
    elseif (sets.midcast[spell.type]) then --If a set exists for the specific Type: sets.precast["Weaponskill"];
        equip(sets.midcast[spell.type])
    elseif (spell.action_type == "Magic") then--If the spell is magic
        equip(sets.midcast.magic) --Equip default set
    end
    if spell.skill == "Blue Magic" then
        for b in pairs(buffs) do
            if buffactive[b] then
                equip(sets.midcast.buff[b])
            end
        end
    end
    
    -- if world.day_element == spell.element or world.weather_element == spell.element then
    --     equip(sets.weather)
    -- end
end

function self_command(command)
    local modes = T{"TP", "PDT", "MDT"}
    if (modes:contains(command)) then
        for k in pairs(modes) do
            if command == modes[k] then
                if combat_mode == modes[k] then
                    combat_mode_indexes[modes[k]] = cycle(combat_modes[modes[k]], combat_mode_indexes[modes[k]])
                else
                    combat_mode = modes[k]
                end
                break
            end
        end
    elseif (command == "IDLE") then
        idle_mode_index = cycle(idle_modes, idle_mode_index)
    elseif (command == "LockCape") then
        lock_cape = not lock_cape
        if (lock_cape) then
            equip({back = CapacityCape})
            disable("back")
        else
            enable("back")
        end
    elseif (command == "LockWeapons") then
        lock_weapons = not lock_weapons
        if (lock_weapons) then
            disable("main")
            disable("sub")
        else
            enable("main")
            enable("sub")
        end
    elseif (command == "FastPants") then
        fast_pants = not fast_pants
    elseif (command == "MELEE") then
        windower.console.write("Melee")
        enable("main")
        enable("sub")
        equip(sets.weapons.melee)
        disable("main")
        disable("sub")
        lock_weapons = true
    elseif (command == "MAGIC") then
        windower.console.write("Magic")
        enable("main")
        enable("sub")
        equip(sets.weapons.magic)
        lock_weapons = false
    end
    status_change(player.status)
    update_info_box()
end

function status_change(new, tab, old)
    if new == 'Idle' then
        equip(sets.idle[idle_modes[idle_mode_index]])
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        end
        if fast_pants == true then
            equip({legs = CarmineLegs.Accuracy})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_modes[combat_mode][combat_mode_indexes[combat_mode]]])
    end
    if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
        equip(sets.reive)
    end
end

function update_info_box()
    textbox.cbmode = combat_modes[combat_mode][combat_mode_indexes[combat_mode]]
    textbox.idlemode = idle_modes[idle_mode_index]
    textbox.weaponlock = lock_weapons
    textbox.capelock = lock_cape
    textbox.fastpants = fast_pants
end
