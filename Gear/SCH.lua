-- sets. = {
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

function init_gear_sets()
    init_item_vars()
    init_precast_sets()
    init_utility_sets()
    init_job_ability_sets()
    init_healing_sets()
    init_enhancing_sets()
    init_enfeeble_sets()
    init_elemental_sets()
    init_dark_sets()
    init_idle_sets()
end

function init_item_vars()
    VanyaHood = {}
    VanyaHood.FC = {name = "Vanya Hood", augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}}
    VanyaHood.CMP = {name = "Vanya Hood", augments = {'MND+10', 'Spell interruption rate down +15%', '"Conserve MP"+6'}}
    VanyaHood.CP = {name = "Vanya Hood", augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}}

    DarkRing = {}
    DarkRing.physical = {name = "Dark Ring", augments = {'Phys. dmg. taken -5%', 'Breath dmg. taken -4%'}}
    DarkRing.magical = {name = "Dark Ring", augments = {'Phys. dmg. taken -4%', 'Magic dmg. taken -4%', 'Breath dmg. taken -3%'}}

    MerlinicJubbah = {}
    MerlinicJubbah.MBD = {name = "Merlinic Jubbah", augments = {'Mag. Acc.+10 "Mag.Atk.Bns."+10', 'Magic burst mdg.+10%', 'MND+7', 'Mag. Acc.+10', '"Mag.Atk.Bns."+5',}}
    MerlinicShalwar = {}
    MerlinicShalwar.Aspir = {name = "Merlinic Shalwar", augments = {'Mag. Acc.+25 "Mag.Atk.Bns."+25', '"Drain" and "Aspir" potency +8', 'INT+2', 'Mag. Acc.+13', '"Mag.Atk.Bns."+3',}}

    ChironicPants = {}
    ChironicPants.Macc = {name = "Chironic Hose", augments = {'Mag. Acc.+23 "Mag.Atk.Bns."+23', '"Resist Silence"+3', 'CHR+6', 'Mag. Acc.+15', '"Mag.Atk.Bns."+3',}}
end

function init_job_ability_sets()
    sets.Perpetuance = {
        hands = "Savant's Bracers +2"
    }

    sets.Ebullience = {
        head = "Savant's Bonnet +2"
    }

end

function init_utility_sets()
    sets.recast = {
        main = "Nibiru Staff",
        sub = "Achaq grip",
        ammo = "Sapience Orb",
        head = VanyaHood.FC,
        neck = "Reti Pendant",
        ear1 = "Gifted Earring",
        ear2 = "Loquacious Earring",
        body = MerlinicJubbah.MBD,
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Vanya Clogs"
    }

    sets.cmp = {
        main = "Rubicundity",
        sub = "Genmei Shield",
        ammo = "Clarus stone",
        head = VanyaHood.CMP,
        neck = "Reti Pendant",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity cape",
        waist = "Austerity Belt",
        legs = "Vanya Slops",
        feet = "Vanya Clogs"
    }

    sets.weather = {
        back = "Twilight Cape",
        waist = "Hachirin-no-obi"
    }

    sets.weatherObi = {
        waist = "Hachirin-no-obi"
    }

    sets.Myrkr = {
        ammo = "Ghastly Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Sanctity Necklace",
        ear1 = "Mendicant's Earring",
        ear2 = "Gifted Earring",
        body = MerlinicJubbah.MBD,
        hands = "Bokwus Gloves",
        ring1 = "Fortified Ring",
        ring2 = "Lebeche Ring",
        back = "Vates Cape",
        waist = "Salire Belt",
        legs = "Psycloth Lappas",
        feet = "Medium's Sabots"
    }
end

function init_precast_sets()
    -- 15% RDM
    -- 53%
    -- 10% Arts
    -- 78% Best Case
    sets.precast = {
        main = "Nibiru Staff", --4
        sub = "Niobid Strap",
        ammo = "Sapience Orb", --2
        neck = "Voltsurge Torque", --4
        head = VanyaHood.FC, --10
        ear2 = "Loquacious Earring", --2
        body = "Anhur Robe", --10
        hands = "Repartie Gloves", --2
        ring1 = "Lebeche Ring",
        ring2 = "Prolix Ring", --2
        back = "Perimede Cape",
        waist = "Witful Belt", --3
        legs = "Psycloth Lappas", --7
        feet = "Regal Pumps +1" --7
    }

    sets.precastNoFast = {
        main = "Nibiru Staff", --4
        sub = "Niobid Strap",
        ammo = "Sapience Orb", --2
        head = VanyaHood.FC, --10
        ear2 = "Loquacious Earring", --2
        body = "Anhur Robe", --10
        hands = "Repartie Gloves", --2
        ring2 = "Prolix Ring", --2
        back = "Swith Cape", --2
        waist = "Channeler's Stone",
        legs = "Psycloth Lappas", --7
        feet = "Regal Pumps +1" --7
    }

    sets.precast.Cures =
    set_combine(sets.precast, {
        ear1 = "Mendicant's Earring",
    feet = "Vanya Clogs"})

end

function init_enhancing_sets()
    sets.Enhancing =
    set_combine(sets.cmp, {
        head = "Savant's Bonnet +2",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        legs = "Scholar's Pants",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Perimede Cape"
    })

    sets.Aquaveil =
    set_combine(sets.cmp, {
        main = "Vadose Rod",
        sub = "Genmei Shield",
        waist = "Emphatikos Rope",
    })

    sets.Stoneskin =
    set_combine(sets.recast, {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
    })

    sets.Regen =
    set_combine(sets.cmp, {
        back = "Lugh's cape"
    })

end

function init_healing_sets()
    sets.Cures = {
        main = "Surya's Staff +2",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Telchine gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity Cape",
        waist = "Pythia Sash",
        legs = "Vanya Slops",
        feet = "Vanya Clogs"
    }

    sets.Curagas = {
        main = "Surya's Staff +2",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Telchine gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity Cape",
        waist = "Pythia Sash",
        legs = "Vanya Slops",
        feet = "Vanya Clogs"
    }

    sets.WeatherCures = {
        main = "Chatoyant Staff",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.ConserveMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Bokwus Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-obi",
        legs = "Vanya Slops",
        feet = "Vanya Clogs"
    }

    sets.WeatherCuragas = {
        main = "Chatoyant Staff",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CP,
        neck = "Nodens Gorget",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Bokwus Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-obi",
        legs = "Vanya Slops",
        feet = "Vanya Clogs"
    }

    sets.Cursna =
    set_combine(sets.recast, {
        neck = "Incanter's Torque",
        ring1 = "Ephedra Ring",
        ring2 = "Ephedra Ring",
        feet = "Vanya Clogs"
    })
end

function init_enfeeble_sets()
    sets.Intfeeble = {
        main = "Akademos",
        sub = "Mephitis Grip",
        ammo = "Quartz Tatlhum +1",
        head = "Jhakri Coronal +2",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = ChironicPants.Macc,
        feet = "Medium's Sabots"
    }

    sets.Mndfeeble = {
        main = "Akademos",
        sub = "Mephitis Grip",
        ammo = "Quartz Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = ChironicPants.Macc,
        feet = "Medium's Sabots"
    }

end

function init_elemental_sets()
    sets.MAB = {
        main = "Akademos",
        sub = "Niobid Strap",
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        neck = "Sanctity Necklace",
        ear1 = "Friomisi Earring",
        ear2 = "Hecate's Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Vertigo Ring",
        ring2 = "Acumen Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = MerlinicShalwar.Aspir,
        feet = "Jhakri pigaches +1"
    }

    sets.MACC =
    set_combine(sets.MAB, {
        sub = "Niobid Strap",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring"
    })

    -- Gear  : 40 %
    -- Total : 40 %
    -- II    : 10 %
    -- Trai  : 07 %
    -- JP    : 03 %
    -- Final : 60 %

    sets.MB = {
        main = "Akademos", --10
        sub = "Niobid Strap",
        body = MerlinicJubbah.MBD, --10
        neck = "Mizukage-no-Kubikazari", --10
        hands = "Amalric Gages", -- 5 II
        feet = "Jhakri Pigaches +1", --5
        ring1 = "Mujin Band", -- 5 II
        ring2 = "Locus Ring"
    }
end

function init_dark_sets()
    sets.Drain =
    set_combine(sets.MACC, {
        main = "Rubicundity",
        sub = "Genmei shiEld",
        head = "Pixie Hairpin +1",
        ring2 = "Evanescence Ring",
        legs = MerlinicShalwar.Aspir,
        waist = "Fucho-no-obi"
    })

    sets.Dark =
    set_combine(sets.MACC, {
        head = "Pixie Hairpin +1",
        ring2 = "Evanescence Ring"
    })
end

function init_idle_sets()
    sets.idle = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Homiliary",
        head = "Befouled Crown",
        neck = "Twilight Torque",
        ear1 = "Genmei Earring",
        ear2 = "Merman's earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Vocane Ring",
        ring2 = DarkRing.physical,
        back = "Solemnity Cape",
        waist = "Fucho-no-obi",
        legs = "Assiduity Pants +1",
        feet = "Battlecast Gaiters"
    }

    sets.idle.town =
    set_combine(sets.idle, {
        body = "Councilor's Garb"
    })

    sets.idle.pdt =
    set_combine(sets.idle, {
        head = "Welkin Crown",
        hands = "Umithi Gloves",
        feet = "Battlecast Gaiters"
    })

    sets.idle.mdt =
    set_combine(sets.idle, {
        head = "Welkin Crown",
        ear1 = "Merman's earring",
        ear2 = "Merman's earring",
        body = "Artsieq jubbah",
        hands = "Leyline Gloves",
        ring2 = DarkRing.magical,
        feet = "Chironic slippers"
    })

    sets.LatentRefresh = {
        waist = "Fucho-no-obi"
    }

    sets.Heralds = {
        feet = "Herald's Gaiters"
    }
end
