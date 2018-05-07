-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
        include('organizer-lib')

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end



-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'FullPDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    sets.precast.Warcry = {head="Warrior's Mask"}
    sets.precast.BloodRage = {body="Ravager's lorica +2"}
    sets.precast.Aggressor = {body="Warrior's Lorica"}
    sets.precast.Restraint = {hands="Ravager's Mufflers +1"}
    sets.precast.Retaliation = {feet="Ravager's Calligae +1"}
    sets.precast.Berserk = {"Warrior's Calligae"}
    
    sets.precast.WS = {
        ammo="Ravager's Orb", head="Despair Helm", neck="Asperity Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring",
        body="Sulevia's platemail +1", hands="Chevalier's Gauntlets", ring1="Rufescent Ring", ring2="Rajas Ring",
        back="Atheling Mantle", waist=gear.ElementalBelt, legs="Yorium Cuisses", feet="Sulevia's leggings +1"}
    sets.precast.WS.Acc = {
        ammo="Ginsen", head="Sulevia's Mask +1", neck="Lissome Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring",
        body="Sulevia's platemail +1", hands="Sulevia's Gauntlets +1", ring1="Rufescent Ring", ring2="Rajas Ring",
        back="Atheling Mantle", waist=gear.ElementalBelt, legs="Sulevia's Cuisses +1", feet="Sulevia's leggings +1"}


    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Ravager's Orb",
        head="Acro helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Yorium Cuirass",hands="Acro Gauntlets",ring1="Rajas Ring",ring2="Spiral Ring",
        back="Atheling Mantle",waist="Cetl Belt",legs="Yorium Cuisses",feet="Eschite greaves"}

    sets.idle = {
        ammo="Ginsen", head="Sulevia's Mask +1", neck="Twilight Torque", ear1="Genmei Earring", ear2="Brutal Earring",
        body="Sulevia's platemail +1",hands="Sulevia's gauntlets +1",ring1=gear.DarkRing.physical, ring2="Vocane Ring",
        back=gear.Rudi.DPS, waist="Chuq'aba Belt", legs="Sulevia's cuisses +1", feet="Sulevia's leggings +1"}

    sets.defense.PDT = {ammo="Ravager's Orb",
        head="Acro helm",neck="Twilight Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Yorium Cuirass",hands="Acro Gauntlets",ring1="Vocane Ring",ring2=gear.DarkRing.physical,
        back="Atheling Mantle",waist="Cetl Belt",legs="Yorium Cuisses",feet="Eschite greaves"}

    sets.defense.MDT = {ammo="Sihirik",
        head="Acro helm",neck="Twilight Torque",ear1="Merman's Earring",ear2="Merman's Earring",
        body="Yorium Cuirass",hands="Acro Gauntlets",ring1="Vocane Ring",ring2=gear.DarkRing.magical,
        back="Atheling Mantle",waist="Cetl Belt",legs="Yorium Cuisses",feet="Eschite greaves"}

    sets.engaged = {
        ammo="Ginsen", head="Acro Helm", neck="Asperity Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring",
        body="Ravager's Lorica +2", hands="Sulevia's Gauntlets +1", ring1="Hoard Ring", ring2="Rajas Ring",
        back="Atheling Mantle", waist="Cetl Belt", legs="Yorium Cuisses", feet="Despair greaves"}
    
    sets.engaged.Acc = {
        ammo="Ginsen", head="Sulevia's mask +1", neck="Lissome Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring",
        body="Sulevia's platemail +1", hands="Sulevia's Gauntlets +1", ring1="Supershear Ring", ring2="Rajas Ring",
        back="Atheling Mantle",waist="Dynamic Belt",legs="Sulevia's Cuisses +1",feet="Sulevia's Leggings +1"}

    sets.engaged.PDT = 
        set_combine(sets.engaged, {
            neck="Twilight Torque", ring1=gear.DarkRing.physical, ring2="Vocane Ring",})
        
    sets.engaged.FullPDT = {
        ammo="Ginsen", head="Sulevia's Mask +1", neck="Twilight Torque", ear1="Genmei Earring", ear2="Brutal Earring",
        body="Sulevia's platemail +1",hands="Sulevia's gauntlets +1",ring1=gear.DarkRing.physical, ring2="Vocane Ring",
        back="Atheling Mantle", waist="Chuq'aba Belt", legs="Sulevia's cuisses +1", feet="Sulevia's leggings +1"}

    sets.engaged.Acc.PDT = 
        set_combine(sets.engaged.Acc, {
            neck="Twilight Torque", ring1=gear.DarkRing.physical, ring2="Vocane Ring"})

    sets.engaged.Acc.FullPDT = {
        ammo="Ginsen", head="Sulevia's Mask +1", neck="Twilight Torque", ear1="Genmei Earring", ear2="Buckler Earring",
        body="Sulevia's platemail +1",hands="Sulevia's gauntlets +1",ring1=gear.DarkRing.physical, ring2="Vocane Ring",
        back="Atheling Mantle", waist="Chuq'aba Belt", legs="Sulevia's cuisses +1", feet="Sulevia's leggings +1"}
end


function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end