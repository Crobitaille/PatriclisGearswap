function get_sets()
    include('GEO/GEOGear.lua')
    include('GEO/GEOMaps.lua')
    include('HelperFunctions.lua')
    init_gear_sets()
    load_geo_maps()
    job_setup()
end

function job_setup()
    QuickMagic = false
    MoveSpeed = true
    AutoEcho = false
    Burst = false
    Obi = true

    MaccIndex = 1
    IdleIndex = 1

    PDT = false
    MDT = false

    MaccArray = {"LowAcc", "MedAcc", "HighAcc"}
    IdleArray = {"Luopan", "Refresh"}

    send_command('bind f9 gs c Macc')
    send_command('bind f10 gs c PDT')
    send_command('bind f11 gs c MDT')
    send_command('bind f12 gs c Idle')
    
    send_command('bind ^f9 gs c AutoEcho')
    send_command('bind ^f10 gs c Burst')
    send_command('bind ^f11 gs c Obi')
    send_command('bind ^f12 gs c MoveSpeed')

    send_command('bind !f9 gs c QuickMagic')

    --sets the default idle mode to refresh

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
        if AutoEcho == true then
            send_command('input /item "Echo Drops" <me>')
        end
    elseif spell.type == "WeaponSkill" and spell.target.distance > 5 and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
        cancel_spell()
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        return
    end
end

function precast(spell, action)
    if spell.action_type == 'Magic' then
        Precast = {}
        if spell.type == "Geomancy" then
            Precast = sets.Precast['Geomancy']
            display_geomancy_info(spell)
        elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
            Precast = sets.Precast.Cure
        elseif sets.Precast[spell.english] then -- If a set exists specificly for that spell i.e if sets.Precast['Blink'] exists, it would use that set here
            Precast = sets.Precast[spell.english]
        elseif sets.Precast[spell.skill] then -- If a set exists specificly for that skill i.e if sets.Precast['Enhancing Magic'] exists, it would use that set here
            Precast = sets.Precast[spell.skill]
        else
            Precast = sets.Precast.FastCast
        end
        if QuickMagic then
            Precast = set_combine(Precast, sets.Precast.QuickMagic)
        end
        if spell.english == "Stoneskin" then
            if buffactive.Stoneskin then
                send_command('cancel stoneskin')
            end
        end
        equip(Precast)
    elseif spell.type == 'JobAbility' then
        if sets.Precast[spell.english] then -- If a set exists specificly for that ability i.e if sets.Precast['Blaze of Glory'] exists, it would use that set here
            add_to_chat(104, '<--' .. spell.english .. ' Precast-->')
            equip(sets.Precast[spell.english])
        end
    elseif spell.type == 'Weaponskill' then
        if sets.Precast[spell.english] then -- If a set exists specificly for that Weapskill i.e if sets.Precast['True Strike'] exists, it would use that set here
            add_to_chat(104, '<--' .. spell.english .. ' Precast-->')
            equip(sets.Precast[spell.english])
        else
            equip(sets.Precast.Weaponskill)
        end
    end
end

function midcast(spell, action)
    if spell.action_type == 'Magic' then
        Gear = {}
        if spell.type == "Geomancy" then
            if spell.english:startswith('Indi') then
                equip(sets.Midcast.Indicolure)
            else
                equip(sets.Midcast.Geocolure)
            end
        elseif spell.skill == "Elemental Magic" then
            Gear = sets.Midcast.Nuke[MaccArray[MaccIndex]]
            add_to_chat(104, '<--Elemental Magic ' .. MaccArray[MaccIndex] .. ' Midcast-->')
            if Burst == true then
                Gear = set_combine(Gear, sets.Midcast.MagicBurst)
            end
        elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
            Gear = sets.Midcast.Cure
            if (world.day_element == spell.element or world.weather_element == spell.element) then
                Gear = sets.Midcast.LightCure
            else
            end
        elseif spell.english:startswith('Regen') then
            Gear = sets.Midcast['Regen']
        elseif spell.english:startswith('Aspir') or spell.english:startswith('Drain') then
            Gear = sets.Midcast.DrainAspir
        elseif GeoMaps.EnfeeblingMND:contains(spell.english) then
            Gear = sets.Midcast.EnfeebleMND
        elseif GeoMaps.EnfeeblingINT:contains(spell.english) then
            Gear = sets.Midcast.EnfeebleINT
        elseif GeoMaps.FastRecast:contains(spell.english) then
            Gear = sets.Midcast.FastRecast
        elseif GeoMaps.EnhancingSkill:contains(spell.english) then
            Gear = sets.Midcast.EnhancingSkill
        elseif sets.Midcast[spell.english] then
            Gear = sets.Midcast[spell.english]
        elseif sets.Midcast[spell.skill] then
            Gear = sets.Midcast[spell.skill]
        else
            Gear = sets.Midcast.ConserveMP
        end
        if Obi and (world.day_element == spell.element or world.weather_element == spell.element) and spell.skill ~= "Enhancing Magic" and spell.skill ~= "Healing Magic" then
            Gear = set_combine(Gear, sets.Midcast.NukeObi)
        end
        equip(Gear)
    end
end

function aftercast(spell, action)
    status_change(player.status)
end

function self_command(command)
    if command == 'QuickMagic' then
        QuickMagic = not QuickMagic
        add_to_chat(104, '<-- Quick Magic Mode: ' .. tostring(QuickMagic) .. ' -->')
    elseif command == 'MoveSpeed' then
        MoveSpeed = not MoveSpeed
        add_to_chat(104, '<-- Movespeed Mode: ' .. tostring(MoveSpeed) .. ' -->')
    elseif command == 'AutoEcho'then
        AutoEcho = not AutoEcho
        add_to_chat(104, '<-- Auto Echo Drops Mode: ' .. tostring(AutoEcho) .. ' -->')
    elseif command == 'Obi' then
        Obi = not Obi
        add_to_chat(104, '<-- Obi Mode: ' .. tostring(Obi) .. ' -->')
    elseif command == 'Burst' then
        Burst = not Burst
        add_to_chat(104, '<-- Magic Burst Mode: ' .. tostring(Burst) .. ' -->')
    elseif command == 'Idle' then
        if MDT or PDT then
            MDT = false
            PDT = false
        else
            IdleIndex = (IdleIndex % #IdleArray) + 1
        end
        add_to_chat(104, 'Idle Set: '..IdleArray[IdleIndex])
    elseif command == 'Macc' then
        MaccIndex = (MaccIndex % #MaccArray) + 1
        add_to_chat(104, 'Magic Accuracy Level: '..MaccArray[MaccIndex])
    elseif command == 'PDT' then
        PDT = not PDT
        MDT = false
        add_to_chat(104, '<--PDT Mode: '..tostring(PDT) .. '-->')
    elseif command == 'MDT' then
        MDT = not MDT
        PDT = false
        add_to_chat(104, '<--MDT Mode: '..tostring(MDT) .. '-->')
    end
    status_change(player.status)
end

function status_change(new, tab, old)
    if new == 'Idle' and old ~= 'Idle' then
        idle = {}
        if Town:contains(world.zone) then
            idle = set_combine(sets.Idle[IdleArray[IdleIndex]], sets.Idle.Town)
        elseif PDT then
            idle = sets.Idle['PDT']
        elseif MDT then
            idle = sets.Idle['MDT']
        else
            idle = sets.Idle[IdleArray[IdleIndex]]
        end
        if MoveSpeed == true then
            idle = set_combine(idle, sets.Idle.MoveSpeed)
        end
        equip(idle)
    elseif new == 'Engaged' then
        if PDT then
            equip(sets.Idle['PDT'])
        elseif MDT then
            equip(sets.Idle['MDT'])
        else
            equip(sets.Idle[IdleArray[IdleIndex]])
        end
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
        equip(sets.Idle.Town)
    else
        equip(sets.Idle)
    end
end)
