function get_sets()
    include('BLU/BLUGear2.lua')
    include('BLU/BLUMaps2.lua')
    include('PatLibs/TextBoxLib.lua')
    include('PatLibs/HelperFunctions.lua')
    include('MoteLibs/Modes.lua')
    
    job_setup()
    load_gear_sets()
    load_blu_maps()
end

function job_setup()
    buff = {}
    buffs = S{"Unbridled Learning", "Burst Affinity", "Chain Affinity", "Convergence", "Diffusion", "Efflux"}
    
    buff["Unbridled Learning"] = buffactive["Unbridled Learning"] or false
    buff["Burst Affinity"] = buffactive["Burst Affinity"] or false
    buff["Chain Affinity"] = buffactive["Chain Affinity"] or false
    buff["Convergence"] = buffactive["Convergence"] or false
    buff["Diffusion"] = buffactive["Diffusion"] or false
    buff["Efflux"] = buffactive["Efflux"] or false
    
    lock_weapons = true
    lock_cape = false
    lock_defense = false
    fast_pants = false

    weapon_lock(true)
    
    idle_mode = M{}
    combat_mode = M{}
    combat_mode["TP"] = M{}
    combat_mode["PDT"] = M{}
    combat_mode["MDT"] = M{}
    
    idle_mode:options("Default", "PDT", "MDT", "MEVA", "Refresh")
    combat_mode:options("TP", "MDT", "PDT")
    combat_mode["TP"]:options("DW0", "DW7", "DW12")
    combat_mode["PDT"]:options("PDT")
    combat_mode["MDT"]:options("MDT", "MEVA")
    
    --Keybinds--
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    send_command('bind @f10 gs c LockDefense') --Toggles locking when in defense mode
    send_command('bind @f12 gs c LockCape') --Toggles CP cape
    send_command('bind @f11 gs c FastPants') --Toggles keeping fast pants on all idle sets
    
    send_command('bind @9 gs c MELEE') --Equips Melee Weapons and disables weapon switching
    send_command('bind @0 gs c MAGIC') --Equips Magic Weapons and enables weapon switching
    
    --Textbox Stuff--
    local str = 'BLU Info\n' ..
    '-------------------------\n' ..
    'Combat Mode  : ${cbmode|(None)}\n' ..
    'Idle Mode    : ${idlemode|(None)}\n' ..
    'Weapon Lock  : ${defenselock|(None)}\n' ..
    'Defense Lock : ${fastpants|(None)}' ..
    'Cape Lock    : ${capelock|(None)}\n' ..
    'Fast Pants   : ${fastpants|(None)}' 
    textbox = CreateTextBox(str, 1200, 750)
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

    send_command('unbind @9')
    send_command('unbind @10')
end

function precast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        add_to_chat(104, 'Type: ' .. spell.type)
        add_to_chat(104, 'Action_Type: ' .. spell.action_type)
        handle_default_precast(spell)
        if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
            equip(sets.reive)
        end
    end
end

function midcast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
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
    end
    -- if world.day_element == spell.element or world.weather_element == spell.element then
    --     equip(sets.weather)
    -- end
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
    elseif (command == "LockWeapons") then
        weapon_lock(not lock_weapons)
    elseif (command == "LockDefense") then
        lock_defense = not lock_defense
    elseif (command == "FastPants") then
        fast_pants = not fast_pants
    elseif (command == "MELEE") then
        weapon_lock(false)
        equip(sets.weapons.melee)
        weapon_lock(true)
    elseif (command == "MAGIC") then
        weapon_lock(false)
        equip(sets.weapons.magic)
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
        if fast_pants == true then
            equip({legs = CarmineLegs.Accuracy})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_mode[combat_mode.current].current])
    end
    if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
        equip(sets.reive)
    end
end

function update_info_box()
    textbox.cbmode = combat_mode[combat_mode.current].current
    textbox.idlemode = idle_mode.current
    textbox.weaponlock = bool_to_string(lock_weapons)
    textbox.capelock = bool_to_string(lock_cape)
    textbox.fastpants = bool_to_string(fast_pants)
    textbox.defenselock = bool_to_string(lock_defense)
end

function weapon_lock(lock) 
    if lock then
        disable("main")
        disable("sub")
    else
        enable("main")
        enable("sub")
    end
    lock_weapons = lock
end