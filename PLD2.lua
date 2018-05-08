--[[
-- PLD.lua
-- A set of functions (mostly overrides from Gearswap) that interperit events
-- or commands from FFXI and change player equipment accordingly.
-- These scripts are called from the 'gearswap' plugin
-- 
-- Author:  Patriclis
-- Created: 03/05/2018 
-- License: GNU General Public License
]]--

--[[
-- Main entrypoint from gearswap
-- Includes files and makes calls to load spell maps & gear sets
]]--
function get_sets()
    include('PLD/PLDGear.lua')
    include('PLD/PLDMaps.lua')
    include('HelperFunctions.lua')
    
    
    
    init_gear_sets()
    load_pld_maps()
    job_setup()
end

--[[
-- Sets up variables, key-bindings, and states that are specific to this job
-- Basically an extension of get_sets() that I blocked out to have a more 
-- meaningful function name
]]--
function job_setup()
    state.Buff['Divine Emblem'] = buffactive['Divine Emblem'] or false

    auto_echo = false
    
    --COMBAT MODE HANDLING--
    one_hand_tp = {}
    dual_wield_tp = {}
    combat_mode = "TP"
    combat_modes = {}
    combat_modes["TP"] = one_hand_tp
    combat_modes["PDT"] = {"PDT1", "PDT2", "PDT3"}
    combat_modes["MDT"] = {"MDT1", "MDT2", "MDT3"}
    combat_mode_indexes = {}
    combat_mode_indexes["TP"] = 1
    combat_mode_indexes["PDT"] = 1
    combat_mode_indexes["MDT"] = 1

    --KEYBINDS--
    send_command('bind f12 gs c IDLE')
    send_command('bind f11 gs c MDT')
    send_command('bind f10 gs c PDT')
    send_command('bind f9 gs c TP')
end

function user_unload()
    send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
    send_command('unbind f9')
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
        elseif (string.find(spell.name, "Cur") and spell.name ~= "Cursna") then
            equip(sets.precast.cure)
        else
            handle_default_precast(spell)
        end
    end
end

function midcast(spell, action)
    cancel_conflicting_buffs(spell)
    if ((string.find(spell.name, "Cur") or spell.name == "Wild Carrot") and spell.name ~= "Cursna") then
        equipment = {};
        equip = set_combine(equipment, sets.midcast.cure)
        if spell.target.type == 'SELF' then
            equip = set_combine(equipment, sets.midcast.cureself)
        end
        if (world.day_element == spell.element or world.weather_element == spell.element) then
            equip = set_combine(equipment, sets.obi)
        end
        equip(equip);
    end
    if state.Buff['Divine Emblem'] and spell.type == "Divine Magic" then
        equip(sets.DivineEmblemCast)
    end
end

function self_command(command)
    local modes = {"TP", "PDT", "MDT"}
    for k in pairs(modes) do
        if command == modes[k] then
            if combat_mode == modes[k] then
                combat_mode_indexes[modes[k]] = cycle(combat_modes[modes[k]], combat_mode_indexes[modes[k]])
            else
                combat_mode = modes[k]
            end
        sets.engaged = sets.combat_modes[combat_modes[combat_mode][combat_mode_indexes[combat_mode]]]
        break
        end
    end
end

function status_change(new,tab,old)
    if new == 'Idle' and old ~= 'Idle' then
        -- if Town:contains(world.zone) then
        --     equip(sets.IdleTown)
        -- else
        --     equip(sets.Idle)
        -- end
        -- if player.mpp < 50 then
        --     equip(sets.LatentRefresh)
        -- end
        -- if fast_pants == true then
        --     equip(sets.FastPants)
        -- end
    elseif new == 'Engaged' then
        equip(sets.engaged)
    end
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
