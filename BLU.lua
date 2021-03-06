function get_sets()
    include('./Gear/CommonGear.lua')    
    include('Gear/BLU.lua')
    include('Maps/BLU.lua')
    include('Libs/TextBoxLib.lua')
    include('Libs/HelperFunctions.lua')
    include('Libs/MoteLibs/Modes.lua')
    include('Libs/PatsAutoskillchain.lua')
    
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
    movespeed = false
    
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
    send_command('bind @f11 gs c Movespeed') --Toggles keeping fast pants on all idle sets
    
    send_command('bind @7 gs c PIERCE') --Equips Melee Weapons and disables weapon switching
    send_command('bind @8 gs c BLUNT') --Equips Melee Weapons and disables weapon switching
    send_command('bind @9 gs c SLASH') --Equips Melee Weapons and disables weapon switching
    send_command('bind @0 gs c MAGIC') --Equips Magic Weapons and enables weapon switching
    
    --Textbox Stuff--
    local str = 'BLU Info\n' ..
    '--------------------------\n' ..
    'Combat Mode  : ${cbmode|(None)}\n' ..
    'Idle Mode    : ${idlemode|(None)}\n' ..
    'Weapon Lock  : ${weaponlock|(None)}\n' ..
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
    
    send_command('unbind @f9')
    send_command('unbind @f10')
    send_command('unbind @f11')
    send_command('unbind @f12')
    
    send_command('unbind @7')
    send_command('unbind @8')
    send_command('unbind @9')
    send_command('unbind @0')
end

function precast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
    if (spell.type == 'WeaponSkill' and (player.tp < 1000 or spell.target.distance > 5)) then
        cancel_spell()
    elseif not HandleSkillchainPrecast(spell) then
            handle_default_precast(spell)
        end
        if buffactive['Reive Mark'] then
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
    if (spell.type == 'WeaponSkill') then
        HandleMidcastSkillchain()
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
    elseif (command == "Movespeed") then
        movespeed = not movespeed
    elseif (command == "SLASH") then
        weapon_lock(false)
        equip(sets.weapons.slashing)
        weapon_lock(true)
    elseif (command == "PIERCE") then
        weapon_lock(false)
        equip(sets.weapons.piercing)
        weapon_lock(true)
    elseif (command == "BLUNT") then
        weapon_lock(false)
        equip(sets.weapons.blunt)
        weapon_lock(true)
    elseif (command == "MAGIC") then
        weapon_lock(false)
        equip(sets.weapons.magic)
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
    textbox.weaponlock = bool_to_string(lock_weapons)
    textbox.capelock = bool_to_string(lock_cape)
    textbox.movespeed = bool_to_string(movespeed)
    textbox.defenselock = bool_to_string(lock_defense)
    textbox.skillchainmode = bool_to_string(use_skillchain)
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

windower.register_event('zone change', function()
status_change(player.status)
end)
