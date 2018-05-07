function get_sets()

    include('RDM/rdmGear.lua')
    include('RDM/rdmMaps.lua')
        include('organizer-lib')

    job_setup()
    load_rdm_maps()
    init_gear_sets()
end

function job_setup()
    state = {}
    state.Buff = {}
    state.Buff['Saboteur'] = buffactive['Saboteur'] or false
    state.Buff['Composure'] = buffactive['Composure'] or false
    state.Buff['Light Arts'] = buffactive['Light Arts'] or false

    -- KEY BINDS --
    send_command('bind f12 gs c C12')
    send_command('bind f11 gs c C11')
    send_command('bind !` gs c CMB')

    send_command('bind @` input /item "Remedy" <me>')
    send_command('bind @1 input /ja "Accession" <me>')    
    send_command('bind @2 input /ja "Stymie" <me>')
    send_command('bind @3 input /ja "Elemental Seal" <me>')
    send_command('bind @4 input /ja "Saboteur" <me>')
    send_command('bind @5 input /ja "Composure" <me>')

    send_command('bind @7 input /ja "Addendum: Black" <me>')
    send_command('bind @8 input /ja "Dark Arts" <me>')
    send_command('bind @9 input /ja "Addendum: White" <me>')
    send_command('bind @0 input /ja "Light Arts" <me>')

    --MODES--
    idle_mode = 'IDLE'
    nuking_mode = 'MAB'
    magic_burst = 'F'
end

function user_unload()
    send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind !`')

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
    if rdm_maps.Cures:contains(spell.name) or rdm_maps.Curagas:contains(spell.name) then
        equip(sets.precast.Cures)
        -- add_to_chat(104, '<--Equipping Cure Precast-->')
    else
        equip(sets.precast)
        -- add_to_chat(104, '<--Equipping Generic Fast Cast-->')
    end
end

function midcast(spell)
    if spell.skill == 'Enhancing Magic' then
        if rdm_maps.Boost:contains(spell.name) or rdm_maps.Enhancing:contains(spell.name) or 
           rdm_maps.BarElement:contains(spell.name) or rdm_maps.BarStatus:contains(spell.name) then
                equip(sets.Enhancing)
                -- add_to_chat(104, '<--Enhancing Set-->')
        elseif spell.english == "Stoneskin" then
            equip(sets.Stoneskin)
            -- add_to_chat(104, '<--Stoneskin Set-->')
        elseif spell.english == "Aquaveil" then
            equip(sets.Aquaveil)
            -- add_to_chat(104, '<--Aquaveil Set-->')
        elseif rdm_maps.Refresh:contains(spell.name) then
            equip(sets.refresh)
            -- add_to_chat(104, '<--Refresh Set-->')
        elseif rdm_maps.FastRecast:contains(spell.name) then
            equip(sets.refresh)
            -- add_to_chat(104, '<--Fast Recast Set-->')
            equip(sets.Duration)
            -- add_to_chat(104, '<--Overlaying Duration Set-->')
        else
            equip(sets.cmp)
            -- add_to_chat(104, '<--Conserve MP Set-->')
            equip(sets.Duration)
            -- add_to_chat(104, '<--Overlaying Duration Set-->')
        end
        if state.Buff['Composure'] ~= false then
            equip(sets.ComposureOther)
            -- add_to_chat(104, '<--Overlaying Composure Set-->')
        end
    elseif spell.skill == 'Healing Magic' then
        if rdm_maps.Cures:contains(spell.name) then
            if spell.element == world.weather_element or spell.element == world.day_element then
                equip(sets.WeatherCures)
                -- add_to_chat(104, '<--Cure + Weather Set-->')
            else
                equip(sets.Cures)
                -- add_to_chat(104, '<--Cure Set-->')
            end
        elseif rdm_maps.Curagas:contains(spell.name) then
            if spell.element == world.weather_element or spell.element == world.day_element then
                equip(sets.WeatherCuragas)
                -- add_to_chat(104, '<--Curaga + Weather Set-->')
            else
                equip(sets.Curagas)
                -- add_to_chat(104, '<--Curaga Set-->')
            end
        elseif rdm_maps.Removal:contains(spell.name) then
            if spell.english == 'Cursna' then
                equip(sets.Cursna)
                -- add_to_chat(104, '<--Cursna Set-->')
            else
                equip(sets.Removal)
                -- add_to_chat(104, '<--Status Removal Set-->')
            end
        elseif rdm_maps.FastRecast:contains(spell.name) then
            equip(sets.recast)
            -- add_to_chat(104, '<--Fast Recast Set-->')
        else
            equip(sets.cmp)
            -- add_to_chat(104, '<--Conserve MP Set-->')
        end
    elseif spell.skill == 'Elemental Magic' then
        if nuking_mode == 'MAB' then
            equip(sets.MAB)
            -- add_to_chat(104, '<--Nuking MAB Set-->')
        elseif nuking_mode == 'MACC' then
            equip(sets.MACC)
            -- add_to_chat(104, '<--Nuking MACC Set-->')
        end
        if magic_burst == 'T' then
            equip(sets.MB)
            -- add_to_chat(104, '<--Overlaying Magic Burst Set-->')
        end
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weatherObi)
            -- add_to_chat(104, '<--Overlaying Weather Obi-->')
        end
    elseif spell.skill == 'Dark Magic' then
        if rdm_maps.Drain:contains(spell.name) then
            equip(sets.Drain)
            -- add_to_chat(104, '<--Drain/Aspir Set-->')
        else
            equip(sets.Dark)
            -- add_to_chat(104, '<--Dark Magic Set-->')
        end
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weatherObi)
            -- add_to_chat(104, '<--Overlaying Weather Obi-->')
        end
    elseif spell.skill == 'Divine Magic' then
        equip(sets.cmp)
        -- add_to_chat(104, '<--Conserve MP Set-->')
    elseif spell.skill == 'Enfeebling Magic' then
        if rdm_maps.EnfeeblingMND:contains(spell.name) then
            equip(sets.Mndfeeble)
            -- add_to_chat(104, '<--Mnd Enfeebling Set-->')
        elseif rdm_maps.EnfeeblingINT:contains(spell.name) then
            equip(sets.Intfeeble)
            -- add_to_chat(104, '<--Int Enfeebling Set-->')
        elseif rdm_maps.FastRecast:contains(spell.name) then
            equip(sets.recast)
            -- add_to_chat(104, '<--Fast Recast Set-->')
        else
            equip(sets.cmp)
            -- add_to_chat(104, '<--Conserve MP Set-->')
        end
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.weatherObi)
            -- add_to_chat(104, '<--Overlaying Weather Obi-->')
        end
        if state.Buff['Saboteur'] ~= false then
            equip(sets.Saboteur)
            -- add_to_chat(104, '<--Overlaying Saboteur Set-->')
        end
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
    elseif command == 'C11' then
        if nuking_mode == 'MAB' then
            nuking_mode = 'MACC'
            add_to_chat(104, '<--Nuking mode now Magic Accuracy-->')
        else
            nuking_mode = 'MAB'
            add_to_chat(104, '<--Nuking mode now Magic Attack-->')
        end
    elseif command == 'CMB' then
        if magic_burst == 'T' then
            magic_burst = 'F'
            add_to_chat(104, '<--Magic Burst Mode Deactivated-->')
        else
            magic_burst = 'T'
            add_to_chat(104, '<--Magic Burst Mode Activated-->')
        end

    end
end

windower.register_event('zone change', function()
    if Town:contains(world.zone) then
        equip(sets.idle.town)
    end
end)