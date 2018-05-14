function init_gear_sets()
    init_gear_variables()
    init_precast_sets()
    init_utility_sets()
    init_geomancy_sets()
    init_healing_sets()
    init_enhancing_sets()
    init_enfeebling_sets()
    init_dark_sets()
    init_elemental_sets()
    init_idle_sets()
    init_misc_sets()
end

function init_gear_variables()
    
    GeomancyHead = "Geomancy Galero +1"
    GeomancyBody = "Geomancy Tunic +1"
    GeomancyHands = "Geomancy Mitaines +1"
    GeomancyLegs = "Geomancy Pants +1"
    GeomancyFeet = "Geomancy Sandals +1"
    
    BaguaHead = {name = "Bagua Galero +1", augments = {'Enhances "Primeval Zeal" effect'}}
    BaguaBody = {name = "Bagua Tunic +1", augments = {'Enhances "Bolster" effect'}}
    BaguaHands = {name = "Bagua Mitaines +1", augments = {'Enhances "Curative Recantation" effect'}}
    BaguaLegs = {name = "Bagua Pants +1", augments = {'Enhances "Mending Halation" effect'}}
    BaguaFeet = {name = "Bagua Sandals +1", augments = {'Enhances "Radial Arcana" effect'}}
    
    AzimuthHead = "Azimuth Hood +1"
    AzimuthBody = "Azimuth Coat +1"
    AzimuthHands = "Azimuth Gloves"
    AzimuthLegs = "Azimuth Tights +1"
    AzimuthFeet = "Azimuth Gaiters +1"
    
    VanyaHead = {}
    VanyaHead.FastCast = {name = "Vanya Hood", augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}}
    VanyaHead.ConserveMP = {name = "Vanya Hood", augments = {'MND+10', 'Spell interruption rate down +15%', '"Conserve MP"+6'}}
    VanyaHead.CurePotency = {name = "Vanya Hood", augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}}
    
    VanyaBody = {}
    VanyaBody.ConserveMP = {name = "Vanya Robe", augments = {'MND+10', 'Spell interruption rate down +15%', '"Conserve MP"+6'}}
    
    VanyaLegs = {}
    VanyaLegs.ConserveMP = {name = "Vanya Slops", augments = {'MND+10', 'Spell interruption rate down +15%', '"Conserve MP"+6'}}
    
    VanyaFeet = {}
    VanyaFeet.CureSpeed = {name = "Vanya Clogs", augments = {'"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6'}}
    
    MerlinicBody = {}
    MerlinicBody.MagicBurst = {name = "Merlinic Jubbah", augments = {'Mag. Acc.+10 "Mag.Atk.Bns."+10', 'Magic burst dmg.+10%', 'MND+7', 'Mag. Acc.+10', '"Mag.Atk.Bns."+5', }}
    
    MerlinicLegs = {}
    MerlinicLegs.MagicAttack = {name = "Merlinic Shalwar", augments = {'Mag. Acc.+25 "Mag.Atk.Bns."+25', '"Drain" and "Aspir" potency +8', 'INT+2', 'Mag. Acc.+13', '"Mag.Atk.Bns."+3', }}
    
    MerlinicFeet = {}
    MerlinicFeet.MagicAttack = {name = "Merlinic Crackows"}
    
    PsyclothLegs = {}
    PsyclothLegs.PetDT = {name = "Psycloth Lappas", augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7', }}
    
    NantosueltaCape = {}
    NantosueltaCape.Idle = {name = "Nantosuelta's Cape", augments = {'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Pet: Damage taken -5%', }}
    
    LifestreamCape = {}
    LifestreamCape.Geomancy = {name = "Lifestream Cape", augments = {'Geomancy Skill +9', 'Indi. eff. dur. +17', }}
    
    Rubicundity = {}
    Rubicundity.ConserveMP = {name = "Rubicundity", augments = {'Mag. Acc.+4', '"Mag.Atk.Bns."+5', 'Dark magic skill +2', '"Conserve MP"+3', }}
    
    MediumsSabots = {name = "Medium's Sabots", augments = {'MP+50', 'MND+8', '"Conserve MP"+6', '"Cure" potency +3%', }}
    
    DarkRing = {}
    DarkRing.DamageTaken = {name = "Dark Ring", augments = {'Breath dmg. taken -3%', 'Magic dmg. taken -4%', 'Phys. dmg. taken -4%', }}
    
end

function init_precast_sets()
    
    sets.Precast = {}
    sets.Precast.FastCast = {
        main = 'Marin Staff +1',
        sub = 'Niobid Strap',
        ammo = 'Sapience Orb',
        head = VanyaHead.FastCast,
        neck = 'Voltsurge Torque',
        ear2 = 'Loquacious Earring',
        body = 'Anhur Robe',
        hands = 'Repartie Gloves',
        ring2 = 'Prolix Ring',
        back = LifestreamCape.Geomancy,
        waist = 'Channeler\'s Stone',
        legs = GeomancyLegs,
        feet = 'Regal Pumps +1'
    }
    
    sets.Precast.Cure = set_combine(sets.Precast.FastCast, {
        main = 'Vadose Rod',
        sub = 'Genmei Shield',
        ear1 = 'Mendicant\'s Earring',
        feet = VanyaFeet.CureSpeed
    })
    
    sets.Precast['Geomancy'] = {
        main = 'Marin Staff +1',
        sub = 'Niobid Strap',
        range = 'Dunna',
        head = VanyaHead.FastCast,
        neck = 'Voltsurge Torque',
        ear2 = 'Loquacious Earring',
        body = 'Anhur Robe',
        hands = 'Repartie Gloves',
        ring2 = 'Prolix Ring',
        back = LifestreamCape.Geomancy,
        waist = 'Channeler\'s Stone',
        legs = GeomancyLegs,
        feet = 'Regal Pumps +1'
    }
    
    sets.Precast['Elemental Magic'] = set_combine(sets.Precast.FastCast, {
        hands = BaguaHands,
        ring1 = "Mallquis ring"
    })
    
    sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast, {
        waist = 'Siegel Sash'
    })
    
    sets.Precast['Dark Magic'] = sets.Precast.FastCast
    sets.Precast['Healing Magic'] = sets.Precast.FastCast
    sets.Precast['Enfeebling Magic'] = sets.Precast.FastCast
    
    sets.Precast.QuickMagic = {
        ring1 = 'Lebeche Ring',
        waist = 'Witful Belt',
        back = 'Perimede Cape'
    }
    
    sets.Precast['Life Cycle'] = {
        body = GeomancyBody,
        back = NantosueltaCape.Idle
    }
    sets.Precast['Bolster'] = {
        body = BaguaBody
    }
    sets.Precast['Full Circle'] = {
        head = AzimuthHead,
        hands = BaguaHands
    }
    sets.Precast['Mending Halation'] = {--I Don't have this merited. Here for posterity
        legs = BaguaLegs
    }
    sets.Precast['Radial Arcana'] = {
        feet = BaguaFeet
    }
    
    sets.Precast.Weaponskill = {}
end

function init_utility_sets()
    sets.Midcast = {}
    
    sets.Midcast.ConserveMP = {
        main = Rubicundity.ConserveMP,
        sub = "Genmei Shield",
        ammo = "Clarus stone",
        head = VanyaHead.ConserveMP,
        neck = "Reti Pendant",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = VanyaBody.ConserveMP,
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity cape",
        waist = "Austerity Belt",
        legs = VanyaLegs.ConserveMP,
        feet = VanyaFeet.ConserveMP
    }
    
    sets.Midcast.FastRecast = {
        main = 'Marin Staff +1',
        sub = "Achaq grip",
        ammo = "Sapience Orb",
        head = VanyaHead.FastCast,
        neck = "Reti Pendant",
        ear1 = "Gifted Earring",
        ear2 = "Loquacious Earring",
        body = MerlinicBody.MagicBurst,
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Swith cape",
        waist = "Witful Belt",
        legs = GeomancyLegs,
        feet = "Regal Pumps +1"
    }
end

function init_geomancy_sets()
    sets.Midcast.Indicolure = {
        main = Rubicundity.ConserveMP,
        sub = "Genmei Shield",
        range = "Dunna",
        head = AzimuthHead,
        body = BaguaBody,
        hands = GeomancyHands,
        legs = BaguaLegs,
        feet = MediumsSabots, --Once I have over 905 skill, need to change these to azimuth feet for duration+
        neck = "Incanter's Torque",
        waist = "Austerity Belt",
        left_ear = "Mendi. Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = LifestreamCape.Geomancy
    }
    
    sets.Midcast.Geocolure = {
        main = Rubicundity.ConserveMP,
        sub = "Genmei Shield",
        range = "Dunna",
        head = AzimuthHead,
        body = BaguaBody,
        hands = GeomancyHands,
        legs = AzimuthLegs,
        feet = MediumsSabots,
        neck = "Incanter's Torque",
        waist = "Austerity Belt",
        left_ear = "Mendi. Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = LifestreamCape.Geomancy
    }
end

function init_healing_sets()
    sets.Midcast.Cure = {
        main = "Surya's Staff +2",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHead.ConserveMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = VanyaBody.ConserveMP,
        hands = "Telchine gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity Cape",
        waist = "Pythia Sash",
        legs = VanyaLegs.ConserveMP,
        feet = VanyaFeet.CureSpeed
    }
    sets.Midcast.LightCure = {
        main = "Chatoyant Staff",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHead.ConserveMP,
        neck = "Nodens gorget",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = VanyaBody.ConserveMP,
        hands = "Bokwus Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-obi",
        legs = VanyaLegs.ConserveMP,
        feet = VanyaFeet.CureSpeed
    }
    
end

function init_enhancing_sets()
    sets.Midcast['Enhancing Magic'] = sets.Midcast.ConserveMP
    
    sets.Midcast['Regen'] = set_combine(sets.Midcast.ConserveMP, {
        main = "Bolelabunga"
    })
    
    sets.Midcast['Refresh'] = set_combine(sets.Midcast.ConserveMP, {
        main = "Bolelabunga"
    })
    
    sets.Midcast.EnhancingSkill = set_combine(sets.Midcast['Enhancing Magic'], {
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        legs = "Scholar's Pants",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Perimede Cape"
    })
    
    sets.Midcast['Aquaveil'] = set_combine(sets.Midcast['Enhancing Magic'], {
        main = "Vadose Rod",
        sub = "Genmei Shield",
        waist = "Emphatikos Rope",
    })
    
    sets.Midcast['Stoneskin'] = set_combine(sets.Midcast['Enhancing Magic'], {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
    })
    
    sets.Midcast['Blink'] = sets.Midcast['Enhancing Magic']
end

function init_enfeebling_sets()
    sets.Midcast.EnfeebleINT = {
        main = "Marin Staff +1",
        sub = "Mephitis grip",
        ammo = "Quartz Tathlum +1",
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = VanyaBody.ConserveMP,
        hands = AzimuthHands,
        ring1 = "Stikini Ring",
        back = LifestreamCape.Geomancy,
        waist = "Rumination Sash",
        legs = MerlinicLegs.MagicAttack,
        feet = MediumsSabots,
        ring2 = "Stikini Ring",
    }
    
    sets.Midcast.EnfeebleMND = {
        main = "Marin Staff +1",
        sub = "Mephitis grip",
        ammo = "Quartz Tathlum +1",
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = VanyaBody.ConserveMP,
        hands = AzimuthHands,
        ring1 = "Stikini Ring",
        back = LifestreamCape.Geomancy,
        waist = "Rumination Sash",
        legs = MerlinicLegs.MagicAttack,
        feet = MediumsSabots,
        ring2 = "Stikini Ring",
    }
end

function init_dark_sets()
    sets.Midcast['Dark Magic'] = {
        main = "Marin Staff +1",
        sub = "Niobid Strap",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +1",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        ring1 = "Stikini Ring",
        ring2 = "Evanescence Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = AzimuthPants,
        feet = "Jhakri pigaches +1"
    }
    sets.Midcast.DrainAspir = set_combine(sets.Midcast['Dark Magic'], {
        main = "Rubicundity",
        sub = "Genmei shiEld",
        head = BaguaHead,
        ring2 = "Evanescence Ring",
        legs = MerlinicLegs.MagicAttack,
        waist = "Fucho-no-obi"
    })
end

function init_elemental_sets()
    --Geomancy Galero For NUking ... Cardinal CHant+2 ... Worth it?
    --Only for Magic Burst Set?
    
    sets.Midcast.Nuke = {}
    
    sets.Midcast.Nuke['LowAcc'] = {
        main = "Contemplator",
        sub = "Niobid Strap",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +1",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        legs = MerlinicLegs.MagicAttack,
        feet = "Jhakri Pigaches +1",
        neck = "Sanctity Necklace",
        waist = "Refoccilation Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Hecate's Earring",
        left_ring = "Mallquis Ring",
        right_ring = "Acumen Ring",
        back = "Ogapepo Cape",
    }
    sets.Midcast.Nuke['MedAcc'] = sets.Midcast.Nuke['LowAcc']
    sets.Midcast.Nuke['HighAcc'] = sets.Midcast.Nuke['LowAcc']
    
    sets.Midcast.NukeObi = {
        waist = 'Fucho-no-obi',
        back = 'Twilight Cape'
    }
    
    sets.Midcast.MagicBurst = {
        body = MerlinicBody.MagicBurst, --10
        neck = "Mizukage-no-Kubikazari", --10
        hands = "Amalric Gages", -- 5 II
        feet = "Jhakri Pigaches +1", --5
        ring1 = "Mujin Band", -- 5 II
        ring2 = "Locus Ring" -- 5
    }
    
end

function init_idle_sets()
    sets.Idle = {}
    sets.Idle.MoveSpeed = {
        feet = GeomancyFeet
    }
    sets.Idle.Town = {
        name = "Idle Town",
        body = "Councilor's Garb"
    }
    sets.Idle['Luopan'] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        range = "Dunna",
        head = AzimuthHead,
        body = "Jhakri Robe +1",
        hands = GeomancyHands,
        legs = PsyclothLegs.PetDT,
        feet = BaguaFeet,
        neck = "Twilight Torque",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Handler's Earring +1",
        left_ring = "Vocane Ring",
        right_ring = DarkRing.DamageTaken,
        back = NantosueltaCape.Idle
    }
    sets.Idle['Refresh'] = set_combine(sets.Idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Befouled Crown",
        body = "Jhakri Robe +1",
        hands = BaguaHands,
        legs = "Assid. Pants +1",
        waist = "Fucho-no-Obi"
    })
    
    sets.Idle['PDT'] = set_combine(sets.Idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Jhakri Coronal +1",
        hands = GeomancyHands,
        feet = AzimuthFeet,
        neck = "Twilight Torque",
        left_ear = "Genmei Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = DarkRing.DamageTaken,
        back = "Solemnity Cape"
    })
    
    sets.Idle['MDT'] = set_combine(sets.Idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Jhakri Coronal +1",
        neck = "Twilight Torque",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = DarkRing.DamageTaken,
        back = "Solemnity Cape",
    })
end

function init_misc_sets()
    sets.Naked = {
        main = empty,
        sub = empty,
        range = empty,
        ammo = empty,
        head = empty,
        neck = empty,
        ear1 = empty,
        ear2 = empty,
        body = empty,
        hands = empty,
        ring1 = empty,
        ring2 = empty,
        back = empty,
        waist = empty,
        legs = empty,
        feet = empty,
    }
    
end
