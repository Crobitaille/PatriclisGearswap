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

function cycle(table, index)
    if (index + 1 > tablelength(table)) then
        return 1
    else
        return index + 1
    end
end

--[[
-- Default spell precast handling 
]]--
function handle_default_precast(spell)
    if sets.precast[spell.english] then --If a set exists for the specific spell: sets.precast["Spellname"];
        equip(sets.precast[spell.english])
    elseif (sets.precast[spell.skill]) then --If a set exists for the specific skill: sets.precast["Enhancing Magic"];
        equip(sets.precast[spell.skill])
    elseif (sets.precast[spell.type]) then --If a set exists for the specific Type: sets.precast["WeaponSkill"] sets.precast["BlueMagic"];
        equip(sets.precast[spell.type])
    elseif (sets.precast[spell.action_type]) then
        equip(sets.precast[spell.action_type])
    end
end

function handle_default_midcast(spell)
    if sets.midcast[spell.english] then --If a set exists for the specific spell: sets.precast["Spellname"];
        equip(sets.midcast[spell.english])
    elseif (sets.midcast[spell.skill]) then --If a set exists for the specific skill: sets.precast["Enhancing Magic"];
        equip(sets.midcast[spell.skill])
    elseif (sets.midcast[spell.type]) then --If a set exists for the specific Type: sets.precast["Weaponskill"];
        equip(sets.midcast[spell.type])
    elseif (sets.midcast[spell.action_type]) then
        equip(sets.midcast[spell.action_type])
    end
end

function reive()
    if buffactive['Reive Mark'] then
        equip(sets.reive)
    end
end


function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    local cancel_spells = S{"Stoneskin", "Sneak"}
    if spell.english == 'Utsusemi: Ichi' then
        send_command('@wait 1; cancel copy image')
        send_command('@wait 1; cancel copy image (2)')
        send_command('@wait 1; cancel copy image (3)')
    elseif cancel_spells:contains(spell.english) then
        send_command('cancel '..spell.english)
    end
end