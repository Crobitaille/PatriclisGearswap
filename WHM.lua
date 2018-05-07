function get_sets()
    include('WHM/WHMGear.lua')
    include('WHM/WHMMaps.lua')
    job_setup()
    load_whm_maps()
    init_gear_sets()
end

function job_setup()
    state = {}
    state.Buff = {}
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
    state.Buff['Divine Caress'] = buffactive['Divine Caress'] or false
    state.Buff['Light Arts'] = buffactive['Light Arts'] or false

    -- KEY BINDS --
    send_command('bind f12 gs c C12')
    send_command('bind !f12 gs c Kite')

    send_command('bind @` input /item "Echo Drops" <me>')
    send_command('bind @1 input /ja "Accession" <me>')
    send_command('bind @2 input /ja "Divine Seal" <me>')
    send_command('bind @3 input /ja "Divine Caress" <me>')
    send_command('bind @4 input /ja "Sublimation" <me>')
    send_command('bind @5 input /ja "Sacrosanctity" <me>')

    send_command('bind @7 input /ja "Dark Arts" <me>')
    send_command('bind @8 input /ja "Afflatus Misery" <me>')
    send_command('bind @9 input /ja "Afflatus Solace" <me>')
    send_command('bind @0 input /ja "Light Arts" <me>')

    --MODES--
    idle_mode = 'IDLE'
    heralds = true

end

function user_unload()
    send_command('unbind f12')

    send_command('unbind @`')
    send_command('unbind @1')
    send_command('unbind @2')
    send_command('unbind @3')
    send_command('unbind @4')
    send_command('unbind @5')
    send_command('unbind @7')
    send_command('unbind @8')
    send_command('unbind @9')
    send_command('unbind @0')
end

function precast(spell)
    if whm_maps.Cures:contains(spell.name) or whm_maps.Curagas:contains(spell.name) then
        equip(sets.precast.Cures)
        -- add_to_chat(104, '<--Equipping Cure Precast-->')
    elseif whm_maps.Removal:contains(spell.name) or whm_maps.SpecRemoval:contains(spell.name) then
        equip(sets.precast.HealingMagic)
        -- add_to_chat(104, '<--Equipping Healing Precast-->')
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.precast.EnhancingMagic)
        -- add_to_chat(104, '<--Equipping Enhancing Precast-->')
    else
        equip(sets.precast)
        -- add_to_chat(104, '<--Equipping Generic Fast Cast-->')
    end
end

function midcast(spell)
    if whm_maps.Cures:contains(spell.name) then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.WeatherCures)
            -- add_to_chat(104, '<--Cure + Weather Set-->')
        else
            equip(sets.Cures)
            -- add_to_chat(104, '<--Cure Set-->')
        end
    elseif whm_maps.Curagas:contains(spell.name) then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.WeatherCuragas)
            -- add_to_chat(104, '<--Curaga + Weather Set-->')
        else
            equip(sets.Curagas)
            -- add_to_chat(104, '<--Curaga Set-->')
        end
    elseif whm_maps.Removal:contains(spell.name) then
        if spell.english == 'Cursna' then
            equip(sets.Cursna)
            -- add_to_chat(104, '<--Cursna Set-->')
        else
            equip(sets.Removal)
            -- add_to_chat(104, '<--Status Removal Set-->')
        end
        if buffactive['Divine Caress'] and spell.english ~= 'Erase' then
            equip(sets.DivineCaress)
            -- add_to_chat(104, '<--Divine Caress Set-->')
        end
    elseif whm_maps.SpecRemoval:contains(spell.name) then
        equip(sets.recast)
        -- add_to_chat(104, '<--Special Removal Set-->')
    elseif whm_maps.Boost:contains(spell.name) or whm_maps.Enhancing:contains(spell.name)then
        if state.Buff['Light Arts'] ~= false then
            equip(sets.EnhancingArts)
            -- add_to_chat(104, '<--Enhancing + Light Arts Set-->')
        else
            equip(sets.Enhancing)
            -- add_to_chat(104, '<--Enhancing Set-->')
        end
    elseif whm_maps.BarElement:contains(spell.name) or whm_maps.BarStatus:contains(spell.name) then
        if state.Buff['Light Arts'] ~= false then
            equip(sets.BarspellArts)
            -- add_to_chat(104, '<--Barspell + Light Arts Set-->')
        else
            equip(sets.Barspell)
            -- add_to_chat(104, '<--Barspell Set-->')
        end
    elseif whm_maps.EnfeeblingMND:contains(spell.name) then
        equip(sets.Mndfeeble)
        -- add_to_chat(104, '<--Mnd Enfeebling Set-->')
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weather)
            -- add_to_chat(104, '<--Overlaying Weather Gear-->')
        end
    elseif whm_maps.EnfeeblingINT:contains(spell.name) then
        equip(sets.Intfeeble)
        -- add_to_chat(104, '<--Int Enfeebling Set-->')
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weather)
            -- add_to_chat(104, '<--Overlaying Weather Gear-->')
        end
    elseif whm_maps.DivineAcc:contains(spell.name) then
        equip(sets.DivineAcc)
        -- add_to_chat(104, '<--Divine Accuracy Set-->')
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weather)
            -- add_to_chat(104, '<--Overlaying Weather Gear-->')
        end
    elseif whm_maps.Banish:contains(spell.name) then
        equip(sets.Banish)
        -- add_to_chat(104, '<--Banish Set-->')
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weather)
            -- add_to_chat(104, '<--Overlaying Weather Gear-->')
        end
    elseif whm_maps.Holy:contains(spell.name) then
        equip(sets.Holy)
        -- add_to_chat(104, '<--Holy Set-->')
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weather)
            -- add_to_chat(104, '<--Overlaying Weather Gear-->')
        end
    elseif whm_maps.Regen:contains(spell.name) then
        equip(sets.Regen)
        -- add_to_chat(104, '<--Regen Set-->')
    elseif spell.english == "Protectra V" then
        equip(sets.ProtectraV)
        -- add_to_chat(104, '<--Protectra Set-->')
    elseif spell.english == "Shellra V" then
        equip(sets.ShellraV)
        -- add_to_chat(104, '<--Shellra Set-->')
    elseif spell.english == "Auspice" then
        equip(sets.Auspice)
        -- add_to_chat(104, '<--Auspice Set-->')
    elseif spell.english == "Stoneskin" then
        equip(sets.Stoneskin)
        -- add_to_chat(104, '<--Stoneskin Set-->')
    elseif spell.english == "Aquaveil" then
        equip(sets.Aquaveil)
        -- add_to_chat(104, '<--Aquaveil Set-->')
    elseif whm_maps.ConserveMP:contains(spell.name) then
        equip(sets.cmp)
        -- add_to_chat(104, '<--Conserve MP Set-->')
    elseif whm_maps.FastRecast:contains(spell.name) then
        equip(sets.recast)
        -- add_to_chat(104, '<--Fast Recast Set-->')
    end
end

function aftercast(spell,action)
    status_change(player.status)   
end

function status_change(new,tab,old)
    if new == 'Idle' then      
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        elseif idle_mode == 'IDLE' then
            equip(sets.idle)
        elseif idle_mode == 'MDT' then
            equip(sets.idle.mdt)
        elseif idle_mode == 'PDT' then
            equip(sets.idle.pdt)
        end
        -- add_to_chat(104, '<--Idle Set-->')
    end
    if heralds == true then
        equip(sets.Heralds)
    end
    if player.mpp < 50 then
        equip(sets.LatentRefresh)
        -- add_to_chat(104, '<--Overlaying Latent Refresh-->')
    end
end

function self_command(command)
    if command == 'C12' then
        if idle_mode == 'IDLE' then
            idle_mode = 'PDT'
            add_to_chat(104, '<--Idle Mode Now PDT-->')
            equip(sets.idle.pdt)
        elseif idle_mode == 'PDT' then
            idle_mode = 'MDT'
            add_to_chat(104, '<--Idle Mode Now MDT-->')
            equip(sets.idle.mdt)
        elseif idle_mode == 'MDT' then
            idle_mode = 'IDLE'
            add_to_chat(104, '<--Idle Mode Now IDLE-->')
            equip(sets.idle)
        end
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        end
    elseif command == "Kite" then
        heralds = not heralds
        add_to_chat(122, '<-- Kiting Mode: ' .. string.upper(tostring(heralds)) ..' -->')
    end
end

windower.register_event('zone change', function()
    if Town:contains(world.zone) then
        equip(sets.idle.town)
    end
    if heralds == true then
        equip(sets.Heralds)
    end
    -- add_to_chat(104, '<--Idle Set-->')
end)