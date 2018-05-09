function get_sets()
    -- include('BLU/BLUGear.lua')
    -- include('BLU/BLUMaps.lua')
    include('PatLibs/TextBoxLib.lua')
    include('PatLibs/HelperFunctions.lua')
    
    job_setup()
end

function job_setup()
    --Buffs--
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    --Weapon Lock--
    lock_weapons = true
    disable("main")
    disable("sub")
    
    --Combat Mode Stuff--
    combat_mode = "TP"   -- The current combatmode
    combat_modes = {}
    combat_modes["TP"] = {"DW0", "DW10", "DW15", "DW20", "DW25", "ACC1200", "ACC1300"} --Table of all available TP Modes
    combat_modes["PDT"] = {"PDT"} --Table of all available PDT Modes
    combat_modes["MDT"] = {"MDT", "MEVA"} --Table of all available MDT Modes
    combat_mode_indexes = {}
    combat_mode_indexes["TP"] = 2 --Index of the current TP mode
    combat_mode_indexes["PDT"] = 1 --Index of the current PDT mode
    combat_mode_indexes["MDT"] = 1 --Index of the current MDT mode
    
    --Idle Mode Stuff--
    idle_modes = {"Default", "PDT", "MDT", "Refresh"}
    idle_mode_index = 1
    
    --Keybinds--
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    
    send_command('bind @9 gs c MELEE') --Equips Melee Weapons and disables weapon switching
    send_command('bind @0 gs c MAGIC') --Equips Magic Weapons and enables weapon switching
    
    --Textbox Stuff--
    local str = 'BLU Info\n' ..
    '-------------------------\n' ..
    'Combat Mode : ${cbmode|(None)}\n'
    'Idle Mode   : ${idlemode|(None)}\n'
    'Weapon Lock : ${weaponlock|(None)}\n'
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
    if spell.action_type ~= 'Item' then --Extra handling to make sure we don't call gearswap on item use.
        if (string.find(spell.name, "Waltz") and spell.name ~= "Healing Waltz") then
            if (spell.target.type == 'SELF') then
                equip(sets.precast.self_waltz)
            else
                equip(sets.precast.waltz)
            end
        else
            handle_default_precast(spell)
        end
    end
end

function midcast(spell) 


    
end


function self_command(command)
    local modes = {"TP", "PDT", "MDT"}
    if (modes:contains(command))
        for k in pairs(modes) do
            if command == modes[k] then
                if combat_mode == modes[k] then
                    combat_mode_indexes[modes[k]] = cycle(combat_modes[modes[k]], combat_mode_indexes[modes[k]])
                else
                    combat_mode = modes[k]
                end
                -- sets.engaged = sets.combat_modes[combat_modes[combat_mode][combat_mode_indexes[combat_mode]]]
                break
            end
        end
    elseif (command == "IDLE")
        idle_mode_index = cycle(idle_modes)
    elseif (command == "LockWeapons")
        lock_weapons == not lock_weapons
    elseif (command == "MELEE")
        enable("main")
        enable("sub")
        equip(sets.weapons.melee)
        lock_weapons == true
    elseif (command == "MAGIC")
        enable("main")
        enable("sub")
        equip(sets.weapons.magic)
        lock_weapons == true
    end
    
    status_change(player.status)
    update_info_box()
end

function status_change(status)
    if (lock_weapons)
        disable("main")
        disable("sub")
    else
        enable("main")
        enable("sub")
    end
end

function update_info_box()
    textbox.cbmode = combat_modes[combat_mode][combat_mode_indexes[combat_mode]]
    textbox.idlemode = idle_modes[idle_mode_index]
    testbox.weaponlock = lock_weapons
end
