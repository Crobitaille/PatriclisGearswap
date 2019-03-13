--[[
-- PatsAutoskillchain.lua
-- This will automagically equip skillchain gear when closing a skillchain.
-- Can be toggled on/off with f9 (changable)
-- Will use a skillchain set specific to the weaponskill 'sets.skillchain[spell.english]' , and if that doesn't exist will
-- try to use a generic skillchain set sets.skillchain["Weaponskill"]
-- Requires Ivaar's Skills.lua to function (also included in this repo)
--
-- This library was written to pair with a modified version of Ivaar's Skillchain Plugin available here:
-- https://github.com/Crobitaille/Skillchains
-- Ivaar was the original author of the Skillchain plugin, I simply forked and modified his work. (this script however is my own doing) 
--
-- Author:  Patriclis
-- Created: 03/05/2018 
-- License: GNU General Public License
]]--

ValidWeaponskills = S{}
use_skillchain = true
send_command('bind !f9 gs c UseSkillchain')

function CheckCommands(command)
    if string.find(command, "Skillchains") then
        ValidWeaponskills = S{}
        local x = 0
        for i in string.gmatch(command, "([^,]+)") do
            table.insert(ValidWeaponskills, i);
            x = x + 1
        end
        if x <= 1 then
            ValidWeaponskills = S{}
        end
    elseif command == "ClearSkillchains" then
        ValidWeaponskills = S{}
    elseif command == "UseSkillchain" then
        use_skillchain = not use_skillchain
    end
end

function HandleSkillchainPrecast(spell)
    if spell.type == 'WeaponSkill' and use_skillchain then
        for k, v in pairs(ValidWeaponskills) do
            if v == spell.english then
                if sets.skillchain[spell.english] then
                    add_to_chat(104, "Using Skillchain Set for: "..v)
                    equip(sets.skillchain[spell.english])
                    return true
                elseif sets.skillchain["Weaponskill"] then
                    add_to_chat(104, "Using Skillchain Set for: Weaponskill")
                    equip(sets.skillchain["Weaponskill"])
                    return true
                else
                    return false
                end
            end
        end
        return false
    else
        return false
    end
end

function HandleMidcastSkillchain() 
    ValidWeaponskills = S{}
end


   
