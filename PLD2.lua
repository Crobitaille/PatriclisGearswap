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
    
end

--[[
-- Overridden from gearswap.
-- Is called before the player takes one of the following actions:
-- Casting a spell, using an ability, using an item.
]]--
function precast(spell)
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

function midcast(spell, action)
end
