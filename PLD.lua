function get_sets()
    include('Gear/PLD.lua')
    include('Maps/PLD.lua')
    include('./Libs/HelperFunctions.lua')
    init_gear_sets()
    load_pld_maps()
    job_setup()
end

function job_setup()
    state = {}
    state.Buff = {}
    state.Buff['Divine Emblem'] = buffactive['Divine Emblem'] or false
    state.Buff['Shell'] = buffactive['Shell'] or false

    -- KEY BINDS --
    send_command('bind f12 gs c IDLE')
    send_command('bind f11 gs c MDT')
    send_command('bind f10 gs c PDT')
    send_command('bind f9 gs c TP')

    send_command('bind !f11 gs c MDTM')
    send_command('bind !f12 gs c FP')

    send_command('bind !` gs c Inter')
    send_command('bind ^` gs c Enmity')

    send_command('bind ^f10 gs c DW')
    send_command('bind ^f11 gs c Coh')
    send_command('bind ^f12 gs c Cmh')

    -- State Triggers --
    fast_pants = true
    enmity_mode = false
    spell_interrupt = false
    mdt_mode = 'NoShell'


    -- Weapon Modes --
    allow_dual_wield = false
    main_hand_index = 1
    main_hand_size = tablelength(MainHand)
    off_hand_index = 1
    off_hand_size = tablelength(OffHand)

    --Combat/Engaged Modes--
    combat_mode = "TP"
    tp_modes = {sets.Normal, sets.Acc1100}
    dw_modes = {sets.DW, sets.DWAcc1100}
    tp_mode_index = 1
    tp_mode_size = tablelength(tp_modes)

    pdt_modes = {sets.PDT, sets.HP}
    pdt_mode_index = 1
    pdt_mode_size = tablelength(pdt_modes)
    mdt_modes = {sets.MDT, sets.MEVA}
    mdt_mode_index = 1
    mdt_mode_size = tablelength(mdt_modes)

    idle_modes = {sets.idleRefresh, sets.idlePDT, sets.idleMDT, sets.idleMEVA}
    idle_mode_index = 1
    idle_mode_size = tablelength(idle_modes)
    sets.Idle = idle_modes[idle_mode_index]

    if DWOffHands:contains(player.equipment.sub) then
        add_to_chat(104, '<-- TP MODE: ' .. dw_modes[tp_mode_index].name .. ' -->')
        sets.Engaged = dw_modes[tp_mode_index]
        allow_dual_wield = true
        OffHand = AllOffHands
        off_hand_size = tablelength(OffHand)
        add_to_chat(104, "<-- Allowing Dual Wield -->")
    else
        add_to_chat(104, '<-- TP MODE: ' .. tp_modes[tp_mode_index].name .. ' -->')
        sets.Engaged = tp_modes[tp_mode_index]
        allow_dual_wield = false
        OffHand = ShieldOnly
        off_hand_size = tablelength(OffHand)
        add_to_chat(104, "<-- Disallowing Dual Wield -->")
    end
end

function user_unload()
    send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
    send_command('unbind f9')

    send_command('unbind !f11')
    send_command('unbind !f12')

    send_command('unbind !`')
    send_command('unbind ^`')

    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')
end

function aftercast(spell,action)
    status_change(player.status)
end

function precast(spell)
    if spell.type == 'JobAbility' then        
        if spell.english == 'Shield Bash' then
            equip(sets.ShieldBash)
            add_to_chat(104, '<-- Shield Bash Set -->')
        elseif spell.english == 'Holy Circle' then
            equip(sets.HolyCircle)
            add_to_chat(104, '<-- Holy Circle Set -->')
        elseif spell.english == 'Sentinel' then
            equip(sets.Sentinel)
            add_to_chat(104, '<-- Sentinel Set -->')
        elseif spell.english == 'Cover' then
            equip(sets.Cover)
            add_to_chat(104, '<-- Cover Set -->')
        elseif spell.english == 'Rampart' then
            if enmity_mode == true then
                equip(sets.Enmity)
                add_to_chat(104, '<-- Enmity Rampart Set -->')
            else
                equip(sets.Vitality)
                add_to_chat(104, '<-- Vitality Rampart Set -->')
            end
            equip(sets.Rampart)
        elseif spell.english == 'Fealty' then
            equip(sets.Fealty)
            add_to_chat(104, '<-- Fealty Set -->')
        elseif spell.english == 'Chivalry' then
            equip(sets.Chivalry)
            add_to_chat(104, '<-- Chivalry Set -->')
        elseif spell.english == 'Divine Emblem' then
            equip(sets.DivineEmblem)
            add_to_chat(104, '<-- Divine Emblem Set -->')
        else
            equip(sets.Enmity)
            add_to_chat(104, '<-- Enmity Set -->')
        end
    elseif spell.type == 'WeaponSkill' then
        if spell.english == 'Chant Du Cygne' then
            equip(sets.ChantDuCygne)
            add_to_chat(104, '<-- Chant Du Cygne Set -->')
        elseif spell.english == 'Requiescat' then
            equip(sets.Requiescat)
            add_to_chat(104, '<-- Requiescat Set -->')
        elseif spell.english == 'Atonement' then
            equip(sets.Atonement)
            add_to_chat(104, '<-- Atonement Set -->')
        elseif spell.english == 'Savage Blade' then
            equip(sets.SavageBlade)
            add_to_chat(104, '<-- Savage Blade Set -->')
        else
            equip(sets.WeaponSkill)
            add_to_chat(104, '<-- Weaponskill Set -->')
        end
    elseif pld_maps.Cures:contains(spell.name) then
        equip(sets.precast.Cures)
        add_to_chat(104, '<-- Equipping Cure Precast -->')
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.precast.EnhancingMagic)
        add_to_chat(104, '<-- Equipping Enhancing Precast -->')
    else
        equip(sets.precast)
        add_to_chat(104, '<-- Equipping Generic Fast Cast -->')
    end
end

function midcast(spell)
    cancel_conflicting_buffs(spell)
    if spell.skill == 'Enhancing Magic' then
        if pld_maps.Phalanx:contains(spell.name) then
            equip(sets.Phalanx)
            add_to_chat(104, '<-- Phalanx Set -->')
        elseif pld_maps.EnhancingSkill:contains(spell.name) then
            equip(sets.Enhancing)
            add_to_chat(104, '<-- Enhancing Set -->')
        elseif pld_maps.Reprisal:contains(spell.name) then
            equip(sets.Reprisal)
            add_to_chat(104, '<-- Reprisal Set -->')
        else
            equip(sets.ConserveMP)
            add_to_chat(104, '<-- Conserve MP Set -->')
        end
    elseif spell.skill == 'Healing Magic' then
        if pld_maps.Cures:contains(spell.name) then
            if spell.target.type == 'SELF' then
                equip(sets.CureSelf)
                add_to_chat(104, '<-- Self Cure Set -->')
            else
                equip(sets.Cures)
                add_to_chat(104, '<-- Cure Set -->')
            end
            if spell.element == world.weather_element or spell.element == world.day_element then
                equip(sets.Weather)
                add_to_chat(104, '<-- Overlaying Weather Set -->')
            end
        else
            equip(sets.ConserveMP)
            add_to_chat(104, '<-- Conserve MP Set -->')
        end
    elseif spell.skill == 'Divine Magic' then
        if pld_maps.Flash:contains(spell.name) then
            equip(sets.Flash)
            add_to_chat(104, '<-- Flash Set -->')
        elseif pld_maps.Enlight:contains(spell.name) then
            equip(sets.Enlight)
            add_to_chat(104, '<-- Enlight Set -->')
        elseif pld_maps.Banish:contains(spell.name) then
            equip(sets.Banish)
            add_to_chat(104, '<-- Banish Set -->')
            if spell.element == world.weather_element or spell.element == world.day_element then
                equip(sets.Weather)
                add_to_chat(104, '<-- Overlaying Weather Set -->')
            end
        elseif pld_maps.Holy:contains(spell.name) then
            equip(sets.Holy)
            add_to_chat(104, '<-- Holy Set -->')
            if spell.element == world.weather_element or spell.element == world.day_element then
                equip(sets.Weather)
                add_to_chat(104, '<-- Overlaying Weather Set -->')
            end
        else
            equip(sets.ConserveMP)
            add_to_chat(104, '<-- Conserve MP Set -->')
        end
        if state.Buff['Divine Emblem'] then
            equip(sets.DivineEmblemCast)
            add_to_chat(104, '<-- Overlaying Divine Emblem Set -->')
        end
    elseif spell.skill == 'Blue Magic' then
        if pld_maps.BluCure:contains(spell.name) then
            if spell.target.type == 'SELF' then
                equip(sets.CureSelf)
                add_to_chat(104, '<-- Self Cure Set -->')
            else
                equip(sets.Cures)
                add_to_chat(104, '<-- Cure Set -->')
            end
        elseif pld_maps.BluEnmity:contains(spell.name) then
            equip(sets.Enmity)
            add_to_chat(104, '<-- Enmity Set -->')
        else
            equip(sets.PDT)
            equip(sets.SureCast)
            add_to_chat(104, '<-- Equipping Spell Interruption Rate-% Set -->')
        end
    elseif  pld_maps.Shadow:contains(spell.name) then
        equip(sets.shadow)
    elseif spell.type == 'WeaponSkill' then
    elseif spell.type == 'JobAbility' then
    else
        equip(sets.ConserveMP)
        add_to_chat(104, '<-- Conserve MP Set -->')
    end
    if spell_interrupt == true and pld_maps.SureCast:contains(spell.name) then
        equip(sets.SureCast)
        add_to_chat(104, '<-- Equipping Spell Interruption Rate-% Set -->')
    end
end

function status_change(new,tab,old)
    if new == 'Idle' and old ~= 'Idle' then
        if Town:contains(world.zone) then
            equip(sets.IdleTown)
        else
            add_to_chat(104, '<-- Idle -->')
            equip(sets.Idle)
        end
        if player.mpp < 50 then
            equip(sets.LatentRefresh)
        end
        if fast_pants == true then
            equip(sets.FastPants)
        end
    elseif new == 'Engaged' then
        equip(sets.Engaged)
    end
end

function self_command(command)
    handle_combat_mode(command)
    handle_weapon_switching(command)
    if command == 'Inter' then
        spell_interrupt = not spell_interrupt
        add_to_chat(122, '<-- Spell Interrupt Mode: ' .. string.upper(tostring(spell_interrupt)) ..' -->')
    elseif command == 'Enmity' then
        enmity_mode = not enmity_mode
        add_to_chat(122, '<-- Enmity Mode: ' .. string.upper(tostring(enmity_mode)) ..' -->')
    elseif command == 'FP' then
        fast_pants = not fast_pants
        add_to_chat(122, '<-- Kiting Mode: ' .. string.upper(tostring(fast_pants)) ..' -->')
    elseif command == 'MDTM' then
        if mdt_mode == 'NoShell' then
            mdt_mode = 'Shell4'
            mdt_modes = {sets.MDTShell4, sets.MEVA}
            idle_modes = {sets.idleRefresh, sets.idlePDT, sets.MDTShell4, sets.idleMEVA}
            add_to_chat(104, '<-- MDT Mode is Shell 4 -->')
        elseif mdt_mode == 'Shell4' then
            mdt_mode = 'Shell5'
            mdt_modes = {sets.MDTShell5, sets.MEVA}
            idle_modes = {sets.idleRefresh, sets.idlePDT, sets.MDTShell5, sets.idleMEVA}
            add_to_chat(104, '<-- MDT Mode is Shell 5 -->')
        else
            mdt_mode = 'NoShell'
            mdt_modes = {sets.MDTNoShell, sets.MEVA}
            idle_modes = {sets.idleRefresh, sets.idlePDT, sets.MDTNoShell, sets.idleMEVA}
            add_to_chat(104, '<-- MDT Mode is No Shell -->')
        end
    end
    status_change(player.status)
end

function handle_combat_mode(command) 
    if command == 'TP' then
        if combat_mode == 'TP' then
            if (tp_mode_index < tp_mode_size) then
                tp_mode_index = tp_mode_index + 1
            else
                tp_mode_index = 1
            end
        else
            combat_mode = 'TP'
            add_to_chat(104, '<-- TP MODE ON! -->')
        end
        add_to_chat(104, (player.equipment.sub))
        if DWOffHands:contains(player.equipment.sub) then

            add_to_chat(104, '<-- TP MODE: ' .. dw_modes[tp_mode_index].name .. ' -->')
            add_to_chat(104, 'DW Mode')
            sets.Engaged = dw_modes[tp_mode_index]
        else
            add_to_chat(104, '<-- TP MODE: ' .. tp_modes[tp_mode_index].name .. ' -->')
            sets.Engaged = tp_modes[tp_mode_index]
        end
        
    elseif command =='PDT' then
        if combat_mode == 'PDT' then
            if (pdt_mode_index < pdt_mode_size) then
                pdt_mode_index = pdt_mode_index + 1
            else
                pdt_mode_index = 1
            end
        else
            combat_mode = 'PDT'
            add_to_chat(104, '<-- DEFENSE MODE ON! -->')
        end
        add_to_chat(104, '<-- DEFENSE MODE: ' .. pdt_modes[pdt_mode_index].name .. ' -->')
        sets.Engaged = pdt_modes[pdt_mode_index]
    elseif command == 'MDT' then
        if combat_mode == 'MDT' then
            if (mdt_mode_index < mdt_mode_size) then
                mdt_mode_index = mdt_mode_index + 1
            else
                mdt_mode_index = 1
            end
        else
            combat_mode = 'MDT'
            add_to_chat(104, '<-- MAGIC DEFENSE MODE ON! -->')
        end
        add_to_chat(104, '<-- MAGIC DEFENSE MODE: ' .. mdt_modes[mdt_mode_index].name .. ' -->')
        sets.Engaged = mdt_modes[mdt_mode_index]
    elseif command == 'IDLE' then
        if (idle_mode_index < idle_mode_size) then
            idle_mode_index = idle_mode_index + 1
        else
            idle_mode_index = 1
        end
        add_to_chat(104, '<-- IDLE MODE: ' .. idle_modes[idle_mode_index].name .. ' -->')
        sets.Idle = idle_modes[idle_mode_index]
    end
end

function handle_weapon_switching(command)
    local weapon_flag = false
    if command == 'Cmh' then
        repeat
            if (main_hand_index < main_hand_size) then
                main_hand_index = main_hand_index + 1
            else
                main_hand_index = 1
            end
        until MainHand[main_hand_index] ~= OffHand[off_hand_index]
        add_to_chat(104, '<-- Main Hand Is Now ' .. MainHand[main_hand_index] .. ' -->')
        weapon_flag = true
    elseif command == 'Coh' then
        repeat
            if (off_hand_index < off_hand_size) then
                off_hand_index = off_hand_index + 1
            else
                off_hand_index = 1
            end
        until OffHand[off_hand_index] ~= MainHand[main_hand_index]
        add_to_chat(104, '<-- Off Hand Is Now ' .. OffHand[off_hand_index] .. ' -->')
        weapon_flag = true
    elseif command == 'DW' then
        allow_dual_wield = not allow_dual_wield
        if allow_dual_wield then
            OffHand = AllOffHands
            off_hand_size = tablelength(OffHand)
            add_to_chat(104, "<-- Allowing Dual Wield -->")
        else
            OffHand = ShieldOnly
            off_hand_size = tablelength(OffHand)
            add_to_chat(104, "<-- Disallowing Dual Wield -->")
        end
    end    
    if weapon_flag then
        sets.Weapons = {
            main = MainHand[main_hand_index],
            sub = OffHand[off_hand_index]
        }
        equip(sets.Weapons)
        if combat_mode == 'TP' then
            if DWOffHands:contains(OffHand[off_hand_index]) then
                add_to_chat(104, '<-- TP MODE: ' .. dw_modes[tp_mode_index].name .. ' -->')
                sets.Engaged = dw_modes[tp_mode_index]
            else
                add_to_chat(104, '<-- TP MODE: ' .. tp_modes[tp_mode_index].name .. ' -->')
                sets.Engaged = tp_modes[tp_mode_index]
            end
        end
    end
end

-- function buff_change(buff,gain_or_loss)
--     if buff == "Shell" then
--         if gain_or_loss then
--             mdt_modes = {sets.MDTShell4, sets.MEVA}
--             idle_modes = {sets.idleRefresh, sets.idlePDT, sets.MDTShell4, sets.idleMEVA}
--             mdt_mode = 'Shell4'
--             add_to_chat(104, '<-- MDT Mode is Shell 4 -->')
--         else
--             smdt_modes = {sets.MDTNoShell, sets.MEVA}
--             idle_modes = {sets.idleRefresh, sets.idlePDT, sets.MDTNoShell, sets.idleMEVA}
--             mdt_mode = 'NoShell'
--           add_to_chat(104, '<-- MDT Mode is No Shell -->')
--         end
--     end
-- end

windower.register_event('zone change', function()
    if Town:contains(world.zone) then
        equip(sets.IdleTown)
    else
        equip(sets.Idle)
    end
    add_to_chat(104, '<--Idle Set -->')
end)

function sub_job_change(new,old) 
    if DWOffHands:contains(player.equipment.sub) then
        add_to_chat(104, '<-- TP MODE: ' .. dw_modes[tp_mode_index].name .. ' -->')
        sets.Engaged = dw_modes[tp_mode_index]
        allow_dual_wield = true
        OffHand = AllOffHands
        off_hand_size = tablelength(OffHand)
        off_hand_index = 1
        add_to_chat(104, "<-- Allowing Dual Wield -->")
    else
        add_to_chat(104, '<-- TP MODE: ' .. tp_modes[tp_mode_index].name .. ' -->')
        sets.Engaged = tp_modes[tp_mode_index]
        allow_dual_wield = false
        OffHand = ShieldOnly
        off_hand_size = tablelength(OffHand)
        off_hand_index = 1
        add_to_chat(104, "<-- Disallowing Dual Wield -->")
    end

    sets.Weapons = {
        main = MainHand[main_hand_index],
        sub = OffHand[off_hand_index]
    }
    equip(sets.Weapons)
end

function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    if pld_maps.Cancel:contains(spell.english) then
        if spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'Abort: Spell waiting on recast.')
                eventArgs.cancel = true
                return
            end
        end
        if spell.english == 'Utsusemi: Ichi' then
            send_command('@wait 1.5; cancel copy image')
            send_command('@wait 1.5; cancel copy image (2)')
            send_command('@wait 1.5; cancel copy image (3)')
        end
    end
end

