function get_sets()
    include('COR/CORGear.lua')
    include('COR/CORMaps.lua')
    include('HelperFunctions.lua')

    LoadGearSets()
    LoadCorsairMaps()
    job_setup()
end

function job_setup()
    state = {}
    state.Buff = {}
    define_roll_values()

    -- KEY BINDS --
    send_command('bind f12 gs c IDLE')
    send_command('bind f11 gs c MDT')
    send_command('bind f10 gs c PDT')
    send_command('bind f9 gs c TP')

    send_command('bind ^f10 gs c WSMode')
    send_command('bind ^f9 gs c RangedMode')

    -- State Triggers --
    fast_pants = true

    -- Weapon Modes --
    combat_mode = "TP"
    tp_modes = {Sets.TP, Sets.DW, Sets.DWII}
    tp_mode_index = 1
    tp_mode_size = tablelength(tp_modes)

    pdt_modes = {Sets.PDT, Sets.HP}
    pdt_mode_index = 1
    pdt_mode_size = tablelength(pdt_modes)
    mdt_modes = {Sets.MDT, Sets.MEVA}
    mdt_mode_index = 1
    mdt_mode_size = tablelength(mdt_modes)

    idle_modes = {Sets.idleStandard, Sets.idlePDT, Sets.idleMDT, Sets.idleMEVA}
    idle_mode_index = 1
    idle_mode_size = tablelength(idle_modes)
    Sets.Idle = idle_modes[idle_mode_index]

end

function user_unload()
    send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
    send_command('unbind f9')

    send_command('unbind ^f10')
    send_command('unbind ^f9')
end

function aftercast(spell,action)
    status_change(player.status)
end

function precast(spell)
    if (spell.type == 'JobAbility') then
        if CorsairMaps.waltz:contains(spell.english) then
            if spell.target.type == 'SELF' then
                equip(Sets.curing_waltz.self)
            else
                equip(Sets.curing_waltz)
            end
        elseif CorsairMaps.flourish:contains(spell.english) then
            equip(Sets.flourish)
        elseif CorsairMaps.steps:contains(spell.english) then
            equip(Sets.steps)
        else
            add_to_chat(123, spell.english);
            equip(Sets[spell.english]);
        end
    elseif (spell.type == 'CorsairRoll' or spell.english == "Double Up") then
            equip(Sets.phantom_roll)
            display_roll_info(spell)
    elseif spell.type == 'CorsairShot' then
        if CorsairMaps.Aimshots:contains(spell.english) then
            equip(Sets.QuickdrawMacc)
        else
            equip(Sets.Quickdraw)
        end
    elseif spell.type == 'WeaponSkill' then
        if player.equipment.ammo == "Animikii Bullet" then -- Cancel Ranged Attack or WS If You Have Animikii Bullet Equipped --
            cancel_spell()
            add_to_chat(123, spell.english .. ' Canceled: [Animikii Bullet Equipped!]')
            return
        elseif spell.english == "Leaden Salute" then
            equip(Sets.leaden)
        elseif spell.english == "Wildfire" then
            equip(Sets.wildfire)
        elseif spell.english == "Last Stand" then
            equip(Sets.last_stand)
        elseif spell.english == "Savage Blade" then
            equip(Sets.savage_blade)
        elseif spell.english == "Requiescat" then
            equip(Sets.requiescat)
        else
            equip(Sets.wskill)
        end
    elseif spell.type == 'Ranged Attack' then
        if player.equipment.ammo == "Animikii Bullet" then -- Cancel Ranged Attack or WS If You Have Animikii Bullet Equipped --
            cancel_spell()
            add_to_chat(123, spell.english .. ' Canceled: [Animikii Bullet Equipped!]')
            return
        end
        equip(Sets.snapshot)
    elseif CorsairMaps.shadow:contains(spell.english) then
        equip(Sets.precast_shadows)
    else
        equip(Sets.precast)
        add_to_chat(104, '<-- Equipping Generic Fast Cast -->')
    end
end

function midcast(spell)
    cancel_conflicting_buffs(spell)
    if spell.action_type == 'Ranged Attack' then
        equip(Sets.ranged)
    else
        equip(Sets.recast)
    end
end

function status_change(new,tab,old)
    if new == 'Idle' and old ~= 'Idle' then
        if town:contains(world.zone) then
            equip(Sets.IdleTown)
        else
            equip(Sets.Idle)
        end
        if fast_pants == true then
            equip(Sets.FastPants)
        end
    elseif new == 'Engaged' then
        equip(Sets.engaged)
    end
end

function self_command(command)
    if command == 'FP' then
        fast_pants = not fast_pants
        add_to_chat(122, '<-- Kiting Mode: ' .. string.upper(tostring(fast_pants)) ..' -->')
    elseif command == 'TP' then
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
            add_to_chat(104, '<-- TP MODE: ' .. tp_modes[tp_mode_index].name .. ' -->')
            Sets.engaged = tp_modes[tp_mode_index]
    end
    status_change(player.status)
end

windower.register_event('zone change', function()
    if town:contains(world.zone) then
        equip(Sets.IdleTown)
    else
        equip(Sets.Idle)
    end
    add_to_chat(104, '<--Idle Set -->')
end)

function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    if CorsairMaps.cancel:contains(spell.english) then
        if spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'Abort: Spell waiting on recast.')
                eventArgs.cancel = true
                return
            end
        end
        if spell.english == 'Utsusemi: Ichi' then
            send_command('@wait 1.3; cancel copy image')
            send_command('@wait 1.3; cancel copy image (2)')
            send_command('@wait 1.3; cancel copy image (3)')
        end
    end
end

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=4, unlucky=7, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = 'Large' --(state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end


