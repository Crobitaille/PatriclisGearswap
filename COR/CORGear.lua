    -- Sets. = {
    --     main="",
    --     sub="",
    --     range="",
    --     ammo="",
    --     head="",
    --     neck="",
    --     ear1="",
    --     ear2="",
    --     body="",
    --     hands="",
    --     ring1="",
    --     ring2="",
    --     back="",
    --     waist="",
    --     legs="",
    --     feet=""
    -- }

function LoadGearSets()
    Sets = {}

    init_wskill_Sets()
    init_idle_Sets()
    init_precast_Sets()
    init_ranged_Sets()
    init_ability_Sets()
    init_engaged_Sets()
    init_utility_Sets()
end

function init_wskill_Sets()

    Sets.wskill = {}

    Sets.leaden = {
    head="Pixie Hairpin +1",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Meg. Chausses +1",
    feet={ name="Taeon Boots", augments={'Accuracy+11',}},
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Vertigo Ring",
    back="Gunslinger's Cape",
    }

    Sets.last_stand = {}

    Sets.wildfire = {}

    Sets.savage_blade = {}

    Sets.requiescat = {}
end

function init_idle_Sets()
    Sets.idle = {}

    Sets.idleStandard = {
        head="Meghanada Visor +1",
        body="Meghanada Cuirie +1",
        hands="Meg. Gloves +1",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Meg. Jam. +1",
        neck="Bathy Choker +1",
        waist="Flume Belt",
        left_ear="Merman's Earring",
        right_ear="Merman's Earring",
        left_ring="Vocane Ring",
        right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%',}},
        back="Solemnity Cape",
    }

    Sets.idle_main = {}

    Sets.idle_mdt = {}

    Sets.idle_pdt = {
        head="Meghanada Visor +1",
        body="Meghanada Cuirie +1",
        hands="Meg. Gloves +1",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Meg. Jam. +1",
        neck="Bathy Choker +1",
        waist="Flume Belt",
        left_ear="Merman's Earring",
        right_ear="Merman's Earring",
        left_ring="Vocane Ring",
        right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -4%',}},
        back="Solemnity Cape",
    }
end

function init_precast_Sets()
    Sets.precast_generic = {}

    Sets.precast_shadows = {}

    Sets.snapshot = {}
end

function init_ranged_Sets()
    Sets.ranged = {}

    Sets.ranged_acc = {}

    Sets.ranged_dmg = {}
end

function init_ability_Sets()
    Sets['Phantom Roll'] = {
        ring1="Barataria Ring",
        ring2="Luzaf's Ring"
    }
    
    Sets.Quickdraw = {
        head="Taeon Chapeau"
    }

    Sets.QuickdrawMacc = {}


    Sets['Wild Card'] = {}
    Sets['Random Deal'] = {}
    Sets['Fold'] = {}
    Sets['Triple Shot'] = {}
    Sets['Snake Eye'] = {}
    Sets['Crooked Cards'] = {}
    Sets['Cutting Cards'] = {}

    Sets['Curing Waltz'] = {}
    Sets['Self Curing Waltz'] = {}

    Sets['Animated Flourish'] = {}

    Sets['Step'] = {}

end

function init_engaged_Sets()
    Sets.engaged = {}
    Sets.one_weapon = {
        name="one_weapon",
    }
    Sets.one_weapon_1100 = {
        name="one_weapon1100",
    }
    Sets.one_weapon_1200 = {
        name="one_weapon1200",
    }

    Sets.dual_wieldII = {
        name="dual_wieldII",
        head={ name="Dampening Tam", augments={'DEX+1','Accuracy+7','Mag. Acc.+5',}},
        body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
        hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Rawhide Boots", augments={'STR+10','Attack+15','"Store TP"+5',}},
        neck="Lissome Necklace",
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back="Atheling Mantle",
    }
    Sets.dual_wieldII_1100 = {
        name="dual_wieldII_1100",
    }
    Sets.dual_wieldII_1200 = {
        name="dual_wieldII_1200",
    }

    Sets.dual_wieldIII = {
        name="dual_wieldIII",
    }
    Sets.dual_wieldIII_1100 = {
        name="dual_wieldIII_1100",
    }
    Sets.dual_wieldIII_1200 = {
        name="dual_wieldIII_1200",
    }
end

function init_utility_Sets()
    Sets.FastPants = {
        legs="Carmine Cuisses +1"
    }

    Sets.weather = {
        waist="Hachirin-no-obi"
    }

    Sets.recast = {}
end