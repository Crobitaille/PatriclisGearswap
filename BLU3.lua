function get_sets()
    include('organizer-lib')
    mote_include_version = 2
    
    include('BLU/BLUGear.lua')
    include('BLU/BLUMaps.lua')
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
end

function user_setup()
    select_default_macro_book()
    state.OffenseMode:options('Normal', 'DW', 'DW2')
    state.HybridMode:options('Normal', 'Acc1100', 'Acc1150', 'AccMax')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant', 'PL')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT', 'MEVA')
    state.IdleMode:options('Normal', 'PDT', 'PL')

    send_command('bind @1 input /ma "Sudden Lunge" <t>')
    send_command('bind @2 input /ma "Blank Gaze" <t>')
    send_command('bind @8 gs equip sets.meleeP')
    send_command('bind @9 gs equip sets.melee')
    send_command('bind @0 gs equip sets.magic')

    load_blu_maps();
end
 
function user_unload()
    send_command('unbind @1')
    send_command('unbind @2')
    send_command('unbind @8')
    send_command('unbind @9')
    send_command('unbind @0')
end

function job_precast(spell, action, spellMap, eventArgs)    
    if (state.CastingMode.value == 'PL') then 
        equip(sets.precast.weapons)
    end

    if spell.skill == 'Healing Magic' or BlueMagic_Healing:contains(spell.english) then
        if spell.target.type == 'SELF' then
            gear.default.obi_waist = "Chuq'aba Belt"
        else
            gear.default.obi_waist = "Austerity Belt"
        end
    elseif spell.english == 'White Wind' then
        gear.default.obi_waist = "Chuq'aba Belt"
    else
        gear.default.obi_waist = "Salire Belt"
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if (state.CastingMode.value == 'PL' or state.CastingMode.value == 'Resistant') then 
        equip(sets.magic)
    end
    if spell.skill == 'Healing Magic' then
        if spell.target.type == 'SELF' then
            equip(sets.BlueMagic.SelfCures)
        else
            equip(sets.BlueMagic.Cures)
        end
    end
    if spell.skill == 'Enhancing Magic' then
        if spell.english == 'Refresh' then
            equip(sets.BlueMagic.Battery)
        elseif string.find(spell.english,'Shell') then
            equip(sets.Utility.ProShell)
        else
            equip(sets.Enhancing)
        end
    elseif spell.skill == 'Blue Magic' then
        if spell.english == 'Battery Charge' then
            equip(sets.BlueMagic.Battery)
        elseif spell.english == 'Regeneration' or string.find(spell.english,'Regen') then
            equip(sets.BlueMagic.Regeneration)
        elseif PhysicalSpells:contains(spell.english) then
            if PhysicalBlueMagic_STR:contains(spell.english) then
                equip(sets.BlueMagic.STR)
            elseif PhysicalBlueMagic_DEX:contains(spell.english) then
                equip(sets.BlueMagic.STRDEX)
            elseif PhysicalBlueMagic_VIT:contains(spell.english) then
                equip(sets.BlueMagic.STRVIT)
            elseif PhysicalBlueMagic_AGI:contains(spell.english) then
                equip(sets.BlueMagic.AGI)
            elseif PhysicalBlueMagic:contains(spell.english) then
                equip(sets.BlueMagic.STR)
            elseif BlueMagic_PhysicalAcc:contains(spell.english) then
                equip(sets.BlueMagic.HeavyStrike)
            end
        elseif MagicalSpells:contains(spell.english) then
            if BlueMagic_INT:contains(spell.english) then
                equip(sets.BlueMagic.MAB)
            elseif BlueMagic_Dark:contains(spell.english) then
                equip(sets.BlueMagic.DarkNuke)
            elseif BlueMagic_Light:contains(spell.english) then
                equip(sets.BlueMagic.LightNuke)
            elseif BlueMagic_Earth:contains(spell.english) then
                equip(sets.BlueMagic.MAB)
            end
        end

        if BlueMagic_Accuracy:contains(spell.english) then
            equip(sets.BlueMagic.MagicAccuracy)
        elseif BlueMagic_Stun:contains(spell.english) then
            equip(sets.BlueMagic.Stun)
        elseif BlueMagic_Enmity:contains(spell.english) or spell.english == 'Flash' then
            equip(sets.BlueMagic.Enmity)
        elseif BlueMagic_Buffs:contains(spell.english) then
            equip(sets.BlueMagic.Buffs)
        elseif BlueMagic_Skill:contains(spell.english) then
            equip(sets.BlueMagic.Skill)
        elseif spell.english == 'White Wind' then
            equip(sets.BlueMagic.WhiteWind)
        elseif BlueMagic_Healing:contains(spell.english) or spell.english == 'Cure IV' or spell.english == 'Cure III' then
            if spell.target.type == 'SELF' then
                equip(sets.BlueMagic.SelfCures)
            else
                equip(sets.BlueMagic.Cures)
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    end
end

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function select_default_macro_book()
end

