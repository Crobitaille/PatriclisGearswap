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
    init_divine_sets()
    init_idle_sets()
end

function init_item_vars()
    VanyaHood = {}
    VanyaHood.FC = {name = "Vanya Hood", augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}}
    VanyaHood.CMP = {name = "Vanya Hood", augments = {'MND+10', 'Spell interruption rate down +15%', '"Conserve MP"+6'}}
    VanyaHood.CP = {name = "Vanya Hood", augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}}
end

function init_job_ability_sets()
    sets.precast.Benediction = {
        body = "Piety Briault"
    }

    sets.precast.Martyr = {
        hands = "Piety Mitts"
    }

    sets.precast.Devotion = {
        head = "Piety Cap"
    }

    sets.DivineCaress = {
        hands = "Ebers Mitts",
        back = "Mending Cape"
    }
end

function init_utility_sets()
    sets.recast = {
        main = "Queller Rod",
        sub = "Thuellaic Ecu +1",
        ammo = "Sapience Orb",
        head = VanyaHood.FC,
        neck = "Orison Locket",
        ear1 = "Gifted Earring",
        ear2 = "Loquacious Earring",
        body = "Inyanga Jubbah ",
        hands = "Fanatic Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Prolix Ring",
        back = "Solemnity cape",
        waist = "Witful Belt",
        legs = "Lengo Pants",
        feet = "Regal Pumps +1"
    }

    sets.cmp = {
        main = "Queller Rod",
        sub = "Thuellaic Ecu +1",
        ammo = "Clarus stone",
        head = VanyaHood.CMP,
        neck = "Reti Pendant",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Fanatic Gloves",
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
    sets.Heralds = {
        feet = "Herald's Gaiters"
    }

end

function init_precast_sets()
    sets.precast = {
        main = "Marin Staff +1",
        sub = "Benthos Grip",
        ammo = "Impatiens",
        head = VanyaHood.FC,
        neck = "Orison Locket",
        ear2 = "Loquacious Earring",
        body = "Inyanga jubbah +1",
        hands = "Fanatic Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Prolix Ring",
        back = "Ogapepo Cape",
        waist = "Witful Belt",
        legs = "Lengo Pants",
    feet = "Regal Pumps +1"}

    sets.precast.EnhancingMagic =
    set_combine(sets.precast, {
    waist = "Siegel Sash"})

    sets.precast.HealingMagic =
    set_combine(sets.precast, {
        main = "Vadose Rod",
        sub = "Genmei Shield",
        head = "Ebers Cap",
    legs = "Ebers Pantaloons"})

    sets.precast.Cures =
    set_combine(sets.precast, {
        main = "Vadose Rod",
        sub = "Genmei Shield",
        legs = "Ebers Pantaloons",
        ear1 = "Mendicant's Earring",
        ear2 = "Nourishing Earring +1",
    feet = "Vanya Clogs"})

    sets.precast.Encumberance = {
        main = "Marin Staff +1",
        sub = "Benthos Grip",
        ammo = "Sapience Orb",
        head = VanyaHood.FC,
        neck = "Orison Locket",
        ear1 = "Genmei Earring",
        ear2 = "Loquacious Earring",
        body = "Inyanga jubbah",
        hands = "Fanatic Gloves",
        ring1 = "Vocane Ring",
        ring2 = "Defending Ring",
        back = "Disperser's Cape",
        waist = "Witful Belt",
        legs = "Lengo Pants",
        feet = "Regal Pumps +1"
    }

end

function init_enhancing_sets()
    sets.Enhancing =
    set_combine(sets.cmp, {
        main = "Beneficus",
        sub = "Thuellaic Ecu +1",
        legs = "Piety Pantaloons +1",
        feet = "Ebers Duckbills +1",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        back = "Mending Cape"
    })

    sets.EnhancingArts =
    set_combine(sets.cmp, {
        main = "Beneficus",
        sub = "Thuellaic Ecu +1",
        legs = "Piety Pantaloons +1",
        feet = "Ebers Duckbills +1",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        back = "Mending Cape"
    })

    sets.Barspell =
    set_combine(sets.cmp, {
        main = "Beneficus",
        sub = "Thuellaic Ecu +1",
        head = "Ebers Cap",
        body = "Ebers Bliaud",
        hands = "Ebers Mitts",
        legs = "Piety Pantaloons +1",
        feet = "Ebers Duckbills +1",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        back = "Mending Cape"
    })

    sets.BarspellArts =
    set_combine(sets.cmp, {
        main = "Beneficus",
        sub = "Thuellaic Ecu +1",
        head = "Ebers Cap",
        body = "Ebers Bliaud",
        hands = "Ebers Mitts",
        legs = "Piety Pantaloons +1",
        feet = "Ebers Duckbills +1",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        back = "Mending Cape"
    })

    sets.Aquaveil =
    set_combine(sets.cmp, {
        main = "Vadose Rod",
        sub = "Thuellaic Ecu +1",
        waist = "Emphatikos Rope"
    })

    sets.Regen =
    set_combine(sets.cmp, {
        main = "Bolelabunga",
        head = "Inyanga Tiara +1",
        body = "Piety Briault",
        hands = "Ebers Mitts",
        legs = "Theophany Pantaloons +1"
    })

    sets.Auspice =
    set_combine(sets.cmp, {
        feet = "Ebers Duckbills +1"
    })

    sets.ProtectraV =
    set_combine(sets.cmp, {
        --feet="Piety Duckbills"
    })

    sets.ShellraV =
    set_combine(sets.cmp, {
        legs = "Piety Pantaloons +1"
    })

    sets.Stoneskin =
    set_combine(sets.recast, {
        neck = "Nodens Gorget",
        waist = "Siegel Sash"
    })
end

function init_healing_sets()
    sets.Cures = {
        main = "Queller Rod",
        sub = "Thuellaic Ecu +1",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Ebers Bliaud",
        hands = "Fanatic Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity Cape",
        waist = "Pythia Sash",
        legs = "Ebers PAntaloons",
        feet = "Vanya Clogs"
    }

    sets.Curagas = {
        main = "Queller Rod",
        sub = "Thuellaic Ecu +1",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CMP,
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Ebers Bliaud",
        hands = "Fanatic Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Solemnity Cape",
        waist = "Pythia Sash",
        legs = "Ebers PAntaloons",
        feet = "Vanya Clogs"
    }

    sets.WeatherCures = {
        main = "Chatoyant Staff",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CP,
        neck = "Incanter's Torque",
        ear1 = "Nourishing Earring +1",
        ear2 = "Mendicant's Earring",
        body = "Ebers Bliaud",
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-obi",
        legs = "Ebers PAntaloons",
        feet = "Vanya Clogs"
    }

    sets.WeatherCuragas = {
        main = "Chatoyant Staff",
        sub = "Achaq Grip",
        ammo = "Leisure Musk +1",
        head = VanyaHood.CP,
        neck = "Incanter's Torque",
        ear1 = "Nourishing Earring +1",
        ear2 = "Mendicant's Earring",
        body = "Ebers Bliaud",
        hands = "Telchine Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Resonance Ring",
        back = "Twilight Cape",
        waist = "Hachirin-no-obi",
        legs = "Ebers Pantaloons",
        feet = "Vanya Clogs"
    }

    sets.Removal = {
        main = "Queller Rod",
        sub = "Thuellaic Ecu +1",
        ammo = "Clarus stone",
        head = "Ebers Cap",
        neck = "Jewled Collar",
        ear1 = "Gifted Earring",
        ear2 = "Mendicant's Earring",
        body = "Vanya Robe",
        hands = "Orison Mitts +2",
        back = "Solemnity cape",
        waist = "Austerity Belt",
        legs = "Ebers Pantaloons",
        feet = "Vanya Clogs"
    }

    sets.Cursna = {
        main = "Beneficus",
        sub = "Thuellaic Ecu +1",
        ammo = "Incanter stone",
        head = "Ebers Cap",
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Loquacious Earring",
        body = "Orison Bliaud +2",
        hands = "Fanatic Gloves",
        ring1 = "Ephedra Ring",
        ring2 = "Ephedra Ring",
        waist = "Witful Belt",
        back = "Alaunus's Cape",
        legs = "Theophany Pantaloons +1",
        feet = "Vanya Clogs"
    }
end

function init_enfeeble_sets()
    sets.Intfeeble = {
        main = "Marin Staff +1",
        sub = "Mephitis Grip",
        ammo = "Quartz Tathlum +1",
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        hands = "Inyanga Dastanas +1",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Ogapepo Cape",
        waist = "Ovate Rope",
        legs = "Inyanga Shalwar +1",
        feet = "Inyanga Crackows +1"
    }

    sets.Mndfeeble = {
        main = "Marin Staff +1",
        sub = "Mephitis Grip",
        ammo = "Quartz Tathlum +1",
        head = "Befouled Crown",
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        hands = "Inyanga Dastanas +1",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Ogapepo Cape",
        waist = "Ovate Rope",
        legs = "Inyanga Shalwar +1",
        feet = "Inyanga Crackows +1"
    }
end

function init_divine_sets()
    sets.DivineAcc = {
        main = "Marin Staff +1",
        sub = "Benthos Grip",
        ammo = "Kalboron Stone",
        head = VanyaHood.CMP,
        neck = "Incanter's Torque",
        ear1 = "Lifestorm Earring",
        ear2 = "Psystorm Earring",
        body = "Vanya Robe",
        hands = "Fanatic Gloves",
        ring1 = "Vertigo Ring",
        ring2 = "Solemn Ring",
        back = "Ogapepo Cape",
        waist = "Refoccilation Stone",
        legs = "Theophany Pantaloons +1",
        feet = "Medium's Sabots"
    }

    sets.Banish = sets.DivineAcc
    sets.Holy = sets.DivineAcc
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
        body = "Artsieq jubbah",
        hands = "Serpentes Cuffs",
        ring1 = "Vocane Ring",
        ring2 = "Defending Ring",
        back = "Solemnity Cape",
        waist = "Fucho-no-obi",
        legs = "Assiduity pants +1",
        feet = "Serpentes Sabots"
    }

    sets.idle.town =
    set_combine(sets.idle, {
        body = "Councilor's Garb"
    })

    sets.idle.pdt = {
        main = "Queller rod",
        sub = "Genmei Shield",
        ammo = "Homiliary",
        head = "Befouled Crown",
        neck = "Twilight Torque",
        ear2 = "Genmei Earring",
        ear1 = "Merman's earring",
        body = "Artsieq jubbah",
        hands = "Fanatic Gloves",
        ring1 = "Vocane Ring",
        ring2 = "Defending Ring",
        back = "Solemnity Cape",
        waist = "Fucho-no-obi",
        legs = "Assiduity pants +1",
        feet = "Battlecast Gaiters"
    }

    sets.idle.mdt = {
        main = "Queller rod",
        sub = "Genmei Shield",
        ammo = "Homiliary",
        head = "Inyanga Tiara +1",
        neck = "Twilight Torque",
        ear1 = "Merman's earring",
        ear2 = "Merman's earring",
        body = "Artsieq jubbah",
        hands = "Inyanga dastanas +1",
        ring1 = "Vocane Ring",
        ring2 = "Defending Ring",
        back = "Solemnity Cape",
        waist = "Fucho-no-obi",
        legs = "Assiduity pants +1",
        feet = "Inyanga Crackows +1"
    }

    sets.idle.level = sets.idle.pdt

    sets.LatentRefresh = {
        waist = "Fucho-no-obi"
    }
end
