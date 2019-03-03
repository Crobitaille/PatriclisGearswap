function get_sets()
    include('Gear/GEO.lua')
    include('Maps/GEO.lua')
    include('Libs/TextBoxLib.lua')
    include('Libs/HelperFunctions.lua')
    include('Libs/MoteLibs/Modes.lua')
    init_gear_sets()
    load_geo_maps()
    job_setup()
end

function job_setup()
    lock_weapons = false
    lock_cape = false
    lock_defense = false
    auto_echo = true
    movespeed = false
    burst = false
    obi = true    
    
    weapon_lock(false)
    
    idle_mode = M{}
    cast_mode = M{}
    combat_mode = M{}
    combat_mode["TP"] = M{}
    combat_mode["PDT"] = M{}
    combat_mode["MDT"] = M{}
    
    idle_mode:options("Luopan", "Hybrid", "PDT", "MDT", "MEVA", "Refresh")
    cast_mode:options("Matk", "Macc")  
    combat_mode:options("TP", "MDT", "PDT")
    combat_mode["TP"]:options("DW0")
    combat_mode["PDT"]:options("PDT")
    combat_mode["MDT"]:options("MDT", "MEVA")
      
    --Keybinds--
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    send_command('bind @f10 gs c LockDefense') --Toggles locking when in defense mode
    send_command('bind @f11 gs c Movespeed') --Toggles keeping fast pants on all idle sets
    send_command('bind @f12 gs c LockCape') --Toggles CP cape

    send_command('bind !f12 gs c CAST')
    send_command('bind !f11 gs c BURST')
    send_command('bind !f10 gs c ECHO')
    send_command('bind !f9 gs c OBI')

    local str = 'GEO Info\n' ..
    '--------------------------\n' ..
    'Combat Mode  : ${cbmode|(None)}\n' ..
    'Cast Mode    : ${castmode|(None)}\n' ..
    'Idle Mode    : ${idlemode|(None)}\n' ..
    'Weapon Lock  : ${weaponlock|(None)}\n' ..
    'Defense Lock : ${defenselock|(None)}\n' ..
    'Cape Lock    : ${capelock|(None)}\n' ..
    'Movespeed    : ${movespeed|(None)}\n' ..
    'Magic Burst  : ${magicburstmode|(None)}\n' ..
    'Obi Mode     : ${obimode|(None)}'
    textbox = CreateTextBox(str, 1190, 700)
    textbox:show()
    update_info_box()


    define_geomancy_values()
end

function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')

    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')

    send_command('unbind !f9')
    send_command('unbind !f10')
    send_command('unbind !f11')
    send_command('unbind !f12')
end

function pretarget(spell, action)
    if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
        cancel_spell()
        if auto_echo == true then
            send_command('input /item "Echo Drops" <me>')
        end
    elseif spell.type == "WeaponSkill" and spell.target.distance > 5 and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
        cancel_spell()
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        return
    end
end

function precast(spell, action)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
            equip(sets.precast.cure)
        else
            handle_default_precast(spell)
        end
        display_geomancy_info(spell)
        cancel_conflicting_buffs(spell)
    end
end

function midcast(spell, action)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if spell.type == "Geomancy" then
            if spell.english:startswith('Indi') then
                equip(sets.midcast.Indicolure)
            else
                equip(sets.midcast.Geocolure)
            end
        elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
            equip(sets.midcast.Cure)
        elseif spell.skill == "Elemental Magic" then
            equip(sets.midcast.Nuke[cast_mode.current])
            if Burst == true then
                equip(sets.midcast.MagicBurst)
            end
        elseif spell.english:startswith('Regen') then
            equip(sets.midcast['Regen'])
        elseif spell.english:startswith('Aspir') or spell.english:startswith('Drain') then
            equip(sets.midcast.DrainAspir)
        elseif GeoMaps.EnfeeblingMND:contains(spell.english) then
            equip(sets.midcast.EnfeebleMND)
        elseif GeoMaps.EnfeeblingINT:contains(spell.english) then
            equip(sets.midcast.EnfeebleINT)
        elseif GeoMaps.EnhancingSkill:contains(spell.english) then
            equip(sets.midcast.EnhancingSkill)
        elseif GeoMaps.FastRecast:contains(spell.english) then
            equip(sets.midcast.FastRecast)
        else
            handle_default_midcast(spell)
        end
        
        if obi and (world.day_element == spell.element or world.weather_element == spell.element) then
            if spell.skill == "Dark Magic" or spell.skill == "Elemental Magic" or spell.skill == "Enfeebling Magic" then 
                equip(sets.midcast.NukeObi)
            elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
                equip(sets.midcast.LightCure)
            end
        end
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
    elseif (command == "CAST") then
        cast_mode:cycle()
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
    elseif (command == 'OBI') then
        obi = not obi
    elseif (command == 'BURST') then
        burst = not burst
    elseif (command == 'ECHO') then
        auto_echo = not auto_echo
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
            equip({feet = GeomancyFeet})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_mode[combat_mode.current].current])
    end
    if buffactive['Reive Mark'] then
        equip(sets.reive)
    end
end

function define_geomancy_values()
    geomancy = {
        Frailty = {bonus = "Defense Down"},
        Torpor = {bonus = "Evasion Down"},
        Languor = {bonus = "Magic Evasion Down"},
        Focus = {bonus = "Magic Accuracy"},
        Malaise = {bonus = "Magic Defense Down"},
        Precision = {bonus = "Accuracy"},
        Refresh = {bonus = "Refresh"},
        Fade = {bonus = "Magic Attack Down"},
        Wilt = {bonus = "Attack Down"},
        Vex = {bonus = "Magic Accuracy Down"},
        Slip = {bonus = "Accuracy Down"},
        Acumen = {bonus = "Magic Attack"},
        Fend = {bonus = "Magic Defense"},
        Fury = {bonus = "Attack"},
        Attunement = {bonus = "Magic Evasion"},
        Voidance = {bonus = "Evasion"},
        Barrier = {bonus = "Defense"},
    Haste = {bonus = "Haste"}}
end

function display_geomancy_info(spell)
    geoType = nil
    string.gsub(spell.english.."-", "-(.-)-", function(geo) geoType = geo end)
    geoInfo = geomancy[geoType]
    if geoInfo then
        add_to_chat(158, spell.english..' = '..tostring(geoInfo.bonus))
    end
end

windower.register_event('zone change', function()
    if Town:contains(world.zone) then
        equip(sets.idle.Town)
    else
        equip(sets.idle[idle_mode.current])
    end
end)

function update_info_box()
    textbox.cbmode = combat_mode[combat_mode.current].current
    textbox.castmode = cast_mode.current
    textbox.idlemode = idle_mode.current
    textbox.weaponlock = bool_to_string(lock_weapons)
    textbox.capelock = bool_to_string(lock_cape)
    textbox.movespeed = bool_to_string(movespeed)
    textbox.autoecho = bool_to_string(auto_echo)
    textbox.defenselock = bool_to_string(lock_defense)
    textbox.magicburstmode = bool_to_string(burst)
    textbox.obimode = bool_to_string(obi)
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