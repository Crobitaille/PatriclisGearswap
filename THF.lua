-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime
--]]

-- Initialization function for this job file.

function get_sets()

    mote_include_version = 2
    include('organizer-lib')
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    
    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Mod')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Windbuffet Belt +1"
    gear.AugQuiahuiz = {name = "Quiahuiz Trousers", augments = {'Haste+2', '"Snapshot"+2', 'STR+8'}}

    -- Additional local binds
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {hands = "Plunderer's armlets", feet = "Skulker's poulaines"}
    sets.ExtraRegen = {head = "Ocelomeh Headpiece"}
    sets.Kiting = {feet = "Jute Boots +1"}

    sets.buff['Sneak Attack'] = {
        ammo = "Qirmiz Tathlum", head = "Meghanada Visor +1", neck = "Rancor Collar", ear1 = "Thunder Pearl", ear2 = "Pixie Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Airy Ring",
    back = "Toutatis's cape", waist = "Warwolf Belt", legs = "Meghanada chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.buff['Trick Attack'] = {
        ammo = "Qirmiz Tathlum", head = "Meghanada Visor +1", neck = "Rancor Collar", ear1 = "Drone Earring", ear2 = "Drone Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Breeze Ring", ring2 = "Solemn Ring",
    back = "Cavaros Mantle", waist = "Warwolf Belt", legs = "Meghanada chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.precast.Waltz = {ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Asperity Necklace", ear1 = "Brutal Earring", ear2 = "Suppanomimi",
        body = "Passion Jacket", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Meghanada Chausses +1", feet = "Taeon Boots"}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head = "Raider's Bonnet +2"}
    sets.precast.JA['Accomplice'] = {head = "Raider's Bonnet +2"}
    sets.precast.JA['Flee'] = {feet = "Rogue's Poulaines"}
    sets.precast.JA['Hide'] = {} --{body="Rogue's Vest"}
    sets.precast.JA['Conspirator'] = {body = "Raider's Vest +2"}
    sets.precast.JA['Steal'] = {head = "Rogue's Bonnet", hands = "Thief Gloves", legs = "Assassin's Poulaines", feet = "Rogue's Poulaines"}
    sets.precast.JA['Despoil'] = {legs = "Raider's Culottes +2", feet = "Skulker's Poulaines +2"}
    sets.precast.JA['Perfect Dodge'] = {hands = "Plunderer's Armlets"}
    sets.precast.JA['Feint'] = {} --{legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head = "Meghanada Visor +1", neck = "Apathy Gorget",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Airy Ring", ring2 = "Spiral Ring",
    waist = "Warwolf Belt", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {ear2 = "Loquacious Earring", ammo = "Sapience Orb"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body = "Passion jacket", neck = "Magoraga Beads"})

    -- Ranged snapshot gear
    sets.precast.RA = {hands = "Alruna's Gloves"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Seething Bomblet", head = "Adhemar Bonnet", neck = "Fotia Gorget", ear1 = "Pixie Earring", ear2 = "Thunder Pearl",
        body = "Abnoba Kaftan", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Apate Ring",
    back = "Toutatis's Cape", waist = "Fotia Belt", legs = "Samnuha Tights", feet = "Meghanada Jambeaux +1"}
    
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo = "Honed Tathlum", back = "Letalis Mantle", ring2 = "Rufescent Ring"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
    head = "Adhemar Bonnet", ammo = "Qirmiz Tathlum", neck = "Rancor Collar", back = "Toutatis's Cape"})

    sets.precast.WS['Aeolian Edge'] = {
        ammo = "Jukukik Feather", head = "Wayfarer Circlet", ear1 = "Moldavite Earring", ear2 = "Hecate's Earring",
        body = "Wayfarer Robe", hands = "Wayfarer Cuffs", ring1 = "Snow Ring", ring2 = "Spiral Ring",
    waist = gear.ElementalBelt, legs = "Wayfarer Slops", feet = "Wayfarer Clogs"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head = "Meghanada Visor +1", ear2 = "Loquacious Earring", neck = "Evasion Torque",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1",
    back = "Toutatis's Cape", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1", waist = "Twilight Belt"}

    -- Specific spells -- Should add more evasion to utsusemi
    sets.midcast.Utsusemi = sets.midcast.FastRecast
    

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head = "Ocelomeh Headpiece", neck = "Bathy Choker +1"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        ammo = "Ginsen",
        head = "Ocelomeh Headpiece", neck = "Bathy Choker +1", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Windbuffet Belt +1", legs = "Meghanada Chausses +1", feet = "Jute Boots +1"}

    -- Defense sets

    sets.defense.Evasion = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Evasion Torque", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Windbuffet Belt +1", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.defense.PDT = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Twilight Torque", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Vocane Ring", ring2 = gear.DarkRing.physical,
    back = "Toutatis's Cape", waist = "Windbuffet Belt +1", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.defense.MDT = {
        ammo = "Sihirik",
        head = "Meghanada Visor +1", neck = "Twilight Torque", ear1 = "Merman's Earring", ear2 = "Merman's Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Vocane Ring", ring2 = gear.DarkRing.magical,
    back = "Lamia Mantle +1", waist = "Windbuffet Belt +1", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
        head = "Adhemar Bonnet",
        body = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2',}},
        hands = {name = "Floral Gauntlets", augments = {'Rng.Acc.+12', 'Accuracy+8', '"Triple Atk."+1',}},
        legs = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1',}},
        feet = {name = "Rawhide Boots", augments = {'STR+10', 'Attack+15', '"Store TP"+5',}},
        neck = "Asperity Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = "Toutatis's Cape"
    }
    
    sets.engaged.Acc = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Asperity Necklace", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Samnuha Tights", feet = "Meghanada Jambeaux +1"}
    
    sets.engaged.Evasion = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Asperity Necklace", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.engaged.Acc.Evasion = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Asperity Necklace", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Rajas Ring", ring2 = "Epona's Ring",
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.engaged.PDT = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Twilight Torque", ear1 = "Bladeborn Earring", ear2 = "Steelflash Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = "Vocane Ring", ring2 = gear.DarkRing.physical,
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

    sets.engaged.Acc.PDT = {
        ammo = "Ginsen",
        head = "Meghanada Visor +1", neck = "Twilight Torque", ear1 = "Merman's Earring", ear2 = "Merman's Earring",
        body = "Meghanada Cuirie +1", hands = "Meghanada Gloves +1", ring1 = gear.DarkRing.magical, ring2 = "Merman's Ring",
    back = "Toutatis's Cape", waist = "Twilight Belt", legs = "Meghanada Chausses +1", feet = "Meghanada Jambeaux +1"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english == 'Sneak Attack' or spell.english == 'Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
    
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end

function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

    return idleSet
end

function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end

-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end
