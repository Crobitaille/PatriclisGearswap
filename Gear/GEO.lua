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
    init_engaged_sets()
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
    
    Serenity = {name = "Serenity", augments = {'MP+50', 'Enha.mag. skill +8', '"Cure" potency +3%', '"Cure" spellcasting time -9%', }}
    
    SelenianCap = {name = "Selenian Cap", augments = {'Attack+3', 'Pet: Damage taken -10%', 'Attack+3', 'Pet: "Regen"+1', }}
    
end

function init_precast_sets()
    
    sets.precast = {}
    sets.precast['Magic'] = {
        main = 'Marin Staff +1',
        sub = 'Clerisy Strap',
        ammo = 'Sapience Orb',
        head = VanyaHead.FastCast,
        neck = 'Voltsurge Torque',
        ear1 = 'Loquacious Earring',
        ear2 = 'Etiolation Earring',
        body = 'Anhur Robe',
        hands = 'Repartie Gloves',
        ring2 = 'Prolix Ring',
        back = LifestreamCape.Geomancy,
        waist = 'Channeler\'s Stone',
        legs = GeomancyLegs,
        feet = 'Regal Pumps +1'
    }
    
    sets.precast.cure = set_combine(sets.precast['Magic'], {
        main = Serenity,
        sub = "Achaq Grip",
        ear1 = 'Mendicant\'s Earring',
        feet = VanyaFeet.CureSpeed
    })
    
    sets.precast['Geomancy'] = {
        main = 'Marin Staff +1',
        sub = 'Clerisy Strap',
        range = 'Dunna',
        head = VanyaHead.FastCast,
        neck = 'Voltsurge Torque',
        ear1 = 'Loquacious Earring',
        ear2 = 'Etiolation Earring',
        body = 'Anhur Robe',
        hands = 'Repartie Gloves',
        ring2 = 'Prolix Ring',
        back = LifestreamCape.Geomancy,
        waist = 'Channeler\'s Stone',
        legs = GeomancyLegs,
        feet = 'Regal Pumps +1'
    }
    
    sets.precast['Elemental Magic'] = set_combine(sets.precast['Magic'], {
        hands = BaguaHands,
        ring1 = "Mallquis ring"
    })
    
    sets.precast['Enhancing Magic'] = set_combine(sets.precast['Magic'], {
        waist = 'Siegel Sash'
    })
    
    sets.precast.QuickMagic = {
        ring1 = 'Lebeche Ring',
        waist = 'Witful Belt',
        back = 'Perimede Cape'
    }
    
    sets.precast['Life Cycle'] = {
        body = GeomancyBody,
        back = NantosueltaCape.Idle
    }
    sets.precast['Bolster'] = {
        body = BaguaBody
    }
    sets.precast['Full Circle'] = {
        head = AzimuthHead,
        hands = BaguaHands
    }
    sets.precast['Mending Halation'] = {--I Don't have this merited. Here for posterity
        legs = BaguaLegs
    }
    sets.precast['Radial Arcana'] = {
        feet = BaguaFeet
    }
    
    sets.precast.Weaponskill = {}
end

function init_utility_sets()
    sets.midcast = {}
    
    sets.midcast['Magic'] = {
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
    
    sets.midcast.FastRecast = {
        main = 'Marin Staff +1',
        sub = "Clerisy grip",
        ammo = "Sapience Orb",
        head = VanyaHead.FastCast,
        neck = "Reti Pendant",
        ear1 = "Loquacious Earring",
        ear2 = "Gifted Earring",
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
    sets.midcast.Indicolure = {
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
    
    sets.midcast.Geocolure = {
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
    sets.midcast.Cure = {
        main = Serenity,
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
    sets.midcast.LightCure = {
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
    sets.midcast['Enhancing Magic'] = sets.midcast['Magic']
    
    sets.midcast['Regen'] = set_combine(sets.midcast['Magic'], {
        main = "Bolelabunga",
        sub = "Genmei Shield"
    })
    
    sets.midcast.EnhancingSkill = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        legs = "Scholar's Pants",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Perimede Cape"
    })
    
    sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Vadose Rod",
        sub = "Genmei Shield",
        waist = "Emphatikos Rope",
    })
    
    sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
    })
    
    sets.midcast['Blink'] = sets.midcast['Enhancing Magic']
end

function init_enfeebling_sets()
    sets.midcast.EnfeebleINT = {
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
    
    sets.midcast.EnfeebleMND = {
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
    sets.midcast['Dark Magic'] = {
        main = "Marin Staff +1",
        sub = "Niobid Strap",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Stikini Ring",
        ring2 = "Evanescence Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = AzimuthPants,
        feet = "Jhakri pigaches +1"
    }
    sets.midcast.DrainAspir = set_combine(sets.midcast['Dark Magic'], {
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
    
    sets.midcast.Nuke = {}
    
    sets.midcast.Nuke['Matk'] = {
        main = "Contemplator",
        sub = "Niobid Strap",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
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
    sets.midcast.Nuke['Macc'] = sets.midcast.Nuke['Matk']
    
    sets.midcast.NukeObi = {
        waist = 'Hachirin-no-obi',
        back = 'Twilight Cape'
    }
    
    sets.midcast.MagicBurst = {
        body = MerlinicBody.MagicBurst, --10
        neck = "Mizukage-no-Kubikazari", --10
        hands = "Amalric Gages", -- 5 II
        feet = "Jhakri Pigaches +1", --5
        ring1 = "Mujin Band", -- 5 II
        ring2 = "Locus Ring" -- 5
    }
    
end

function init_idle_sets()
    sets.idle = {}
    sets.idle.town = {
        body = "Councilor's Garb"
    }
    sets.idle['Luopan'] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        range = "Dunna",
        head = SelenianCap,
        body = "Jhakri Robe +1",
        hands = GeomancyHands,
        legs = PsyclothLegs.PetDT,
        feet = BaguaFeet,
        neck = "Twilight Torque",
        waist = "Isa Belt",
        left_ear = "Rimeice Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = NantosueltaCape.Idle
    }
    
    sets.idle['Hybrid'] = {
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
        right_ring = "Defending Ring",
        back = NantosueltaCape.Idle
    }
    
    sets.idle['Refresh'] = set_combine(sets.idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Befouled Crown",
        body = "Jhakri Robe +1",
        hands = BaguaHands,
        legs = "Assid. Pants +1",
        waist = "Fucho-no-Obi"
    })
    
    sets.idle['PDT'] = set_combine(sets.idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Jhakri Coronal +2",
        hands = GeomancyHands,
        feet = AzimuthFeet,
        neck = "Twilight Torque",
        left_ear = "Genmei Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = "Solemnity Cape"
    })
    
    sets.idle['MDT'] = set_combine(sets.idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Jhakri Coronal +2",
        neck = "Twilight Torque",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = "Solemnity Cape",
    })
    
    sets.idle['MEVA'] = set_combine(sets.idle.Luopan, {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        head = "Jhakri Coronal +2",
        neck = "Twilight Torque",
        left_ear = "Merman's Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
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

function init_engaged_sets()
    sets.engaged = {}
    
    sets.engaged.DW0 = {}
end
