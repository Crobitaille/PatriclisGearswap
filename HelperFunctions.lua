--[[
-- Helperfunctions.lua
-- Functions that perform small, repeatable tasks. 
-- I keep these in a seperate file for the sake of readability
-- and so I can re-use them in other gearswap lua files.
-- 
-- Author:  Patriclis
-- Created: 03/05/2018 
-- License: GNU General Public License
]]--

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
return count
end

--[[
-- Default spell precast handling 
]]--
function handle_default_precast(spell)
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif string.find(spell.prefix, "magic") then
        if (sets.precast[spell.skill]) then
            equip(sets.precast[spell.skill])
        else
            equip(sets.precast.magic)
        end
    elseif (spell.type == "JobAbility" or spell.type == "WeaponSkill") then        
        equip(sets.precast[spell.type])
    end
end
