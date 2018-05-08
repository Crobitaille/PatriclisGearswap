--[[
-- PLDGear.lua
-- A group of functions which define variables relating to gearswap 'sets'
-- 
-- Author:  Patriclis
-- Created: 03/05/2018 
-- License: GNU General Public License
-- 
-- TODO: Determine which is more effective, laying out each set explicitly, or using sets_combine
-- Note: My issue with set_combine is that it requires doing calculations and combinations during a cast
-- If the system is being slow (or your casts are particularly fast) this could result in not equipping the correct equipment 
-- Fast enough. I think this is a fringe issue that doesn't happen very often, but I have seen it occur once or twice.
-- set_combine does save on memory as you can keep smaller objects in memory and combine them as needed, but I am concerned about it's 
-- effect on speed.
-- RAM is cheap and plentiful... Time is finite since we only have a limited window to equip gear.
]]--

function init_gear_sets()
    sets.engaged = {}
    
    init_precast_sets()
    init_midcast_sets()
end

function init_precast_sets()
    sets.precast = {}
    --Magic--PreCast--Magic--PreCast--Magic--PreCast--Magic--PreCast--Magic--PreCast--
    sets.precast.magic = {
        head = "Jumalik Helm"
    }
    sets.precast.cure = {}
    sets.precast["Enhancing Magic"] = {}
    --JobAbility--PreCast--JobAbility--PreCast--JobAbility--PreCast--JobAbility--PreCast--
    sets.precast["JobAbility"] = {}
    sets.precast["Invincible"] = {}
    sets.precast["Holy Circle"] = {}
    sets.precast["Shield Bash"] = {}
    sets.precast["Sentinel"] = {
        head = "Acro Helm"
    }
    sets.precast["Cover"] = {}
    sets.precast["Rampart"] = {}
    sets.precast["Fealty"] = {}
    sets.precast["Chivalry"] = {}
    sets.precast["Divine Emblem"] = {}
    sets.precast["Sepulcher"] = {}
    sets.precast["Palisade"] = {}
    sets.precast["Intervene"] = {}
    sets.precast.waltz = {}
    sets.precast.self_waltz = {}
    --WeaponSkill--PreCast--WeaponSkill--PreCast--WeaponSkill--PreCast--WeaponSkill--PreCast--
    sets.precast["WeaponSkill"] = {}
    sets.precast["Savage Blade"] = {}
    sets.precast["Atonement"] = {}
    sets.precast["Chant Du Cygne"] = {}
    sets.precast["Requiescat"] = {}
end

function init_midcast_sets()
    sets.obi = { 
        waist = 'Fucho-no-obi', 
        back = 'Twilight Cape'
    }
    
    sets.midcast = {}

    sets.midcast.magic = {}
    sets.midcast.cure = {}
    sets.midcast.cureself = {}
end

