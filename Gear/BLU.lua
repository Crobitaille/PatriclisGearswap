function load_gear_sets()
    load_vars()
    load_common_gear()    
    load_utility()
    load_precast()
    load_skillchains()
    load_midcast()
    load_engaged()
    load_idle()
end

function load_vars()
    sets.BlueMagic = {}
    
    RosmertasCape = {}
    RosmertasCape.TP = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%', }}
    RosmertasCape.Savage = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', }}
    RosmertasCape.CDC = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Crit.hit rate+10', }}
    
    ArtifactHead = "Magus Keffiyeh"
    ArtifactBody = "Assimilator's Jubbah +2"
    ArtifactHands = "Magus Bazubands"
    ArtifactLegs = "Magus Shalwar"
    ArtifactFeet = "Assimilator's Charuqs +2"
    
    RelicHead = "Mirage Keffiyeh"
    RelicBody = "Mirage Jubbah"
    RelicHands = "Mirage Bazubands"
    RelicLegs = "Mirage Shalwar"
    RelicFeet = "Luhlaza Charuqs"
    
    EmpyreanHead = "Hashishin Kavuk +1"
    EmpyreanBody = "Hashishin Mintan"
    EmpyreanHands = "Hashishin Bazubands"
    EmpyreanLegs = "Hashishin Tayt"
    EmpyreanFeet = ""
    
    CornflowerCape = {name = "Cornflower Cape", augments = {'MP+24', 'DEX+4', 'Blue Magic skill +10', }}
    
    CapacityCape = {name = "Mecisto. Mantle", augments = {'Cap. Point+25%', 'MND+1', 'DEF+3', }}
end

function load_utility()
    sets.weapons = {}
    
    sets.weapons.slashing = {
        main = "Sequence",
        sub = Colada
    }
    
    sets.weapons.piercing = {
        main = "Sequence",
        sub = Vampirism.One
    }
    
    sets.weapons.blunt = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel"
    }
    
    sets.weapons.magic = {
        main = "Iris",
        sub = "Iris",
    }
    
    sets.weather = {
        waist = "Hachirin-no-obi",
        back = "Twilight Cape"
    }
    
    sets.skillchain = {
        head = JhakriHead
    }
    
    sets.reive = {neck = "Ygnas's Resolve +1"}
end



function load_precast()
    sets.precast = {}
    
    sets.precast["Magic"] = {
        main = "Vampirism", -- 7
        sub = "Tanmogayi +1", -- 7
        ammo = "Sapience Orb", -- 2
        head = "Haruspex Hat", -- 8
        left_ear = "Loquacious Earring", -- 2
        left_ring = "Prolix Ring", -- 2
        body = SamnuhaCoat, -- 5
        legs = PsyclothLegs.PathD, -- 7
        feet = CarmineFeet.PathB, -- 8
        back = "Swith Cape", -- 2
        hands = LeylineGloves, -- 8
        neck = "Voltsurge Torque", -- 4
    }
    
    sets.precast["BlueMagic"] =
    set_combine(sets.precast["Magic"], {
        main = "Iris", -- 7
        sub = "Iris", -- 7
        body = EmpyreanBody, --12
    })
    
    sets.precast["WeaponSkill"] = {
        ammo = "Vanir Battery",
        head = JhakriHead,
        neck = "Asperity Necklace",
        right_ear = MoonshadeEarring,
        left_ear = "Brutal Earring",
        body = JhakriBody,
        hands = JhakriHands,
        right_ring = "Rajas Ring",
        left_ring = "Epona's Ring",
        back = RosmertasCape.Savage,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast["Chant du Cygne"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.PathA,
        neck = "Fotia Gorget",
        right_ear = MoonshadeEarring,
        left_ear = "Brutal Earring",
        body = "Abnoba Kaftan",
        hands = AdhemarHands.PathA,
        right_ring = "Begrudging Ring",
        left_ring = "Epona's Ring",
        back = RosmertasCape.CDC,
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = AyanmoFeet
    }
    
    sets.precast["Vorpal Blade"] = sets.precast["Chant du Cygne"]
    
    sets.precast["Savage Blade"] = {
        ammo = "Vanir Battery",
        head = HerculeanHead.WSD,
        neck = "Asperity Necklace",
        right_ear = MoonshadeEarring,
        left_ear = "Brutal Earring",
        body = ArtifactBody,
        hands = JhakriHands,
        right_ring = "Rajas Ring",
        left_ring = "Epona's Ring",
        back = RosmertasCape.Savage,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast["Expiacion"] = sets.precast["Savage Blade"]
    
    sets.precast["Sanguine Blade"] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Sanctity Necklace",
        right_ear = MoonshadeEarring,
        left_ear = "Friomisi Earring",
        body = JhakriBody,
        hands = JhakriHands,
        right_ring = "Snow Ring",
        left_ring = "Spiral Ring",
        back = RosmertasCape.Savage,
        waist = "Salire Belt",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast["Requiescat"] = {
        ammo = "Quartz Tathlum +1",
        head = JhakriHead,
        neck = "Fotia Gorget",
        right_ear = MoonshadeEarring,
        left_ear = "Brutal Earring",
        body = JhakriBody,
        hands = JhakriHands,
        right_ring = "Rufescent Ring",
        left_ring = "Epona's Ring",
        back = RosmertasCape.Savage,
        waist = "Fotia Belt",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast["Azure Lore"] = {
        hands = RelicHands
    }
    
    sets.precast["Burst Affinity"] = {
        legs = ArtifactLegs,
        feet = EmpyreanFeet
    }
    
    sets.precast["Chain Affinity"] = {
        head = EmpyreanHead,
        feet = ArtifactFeet
    }
    
    sets.precast["Convergence"] = {
        head = RelicHead
    }
    
    sets.precast["Diffusion"] = {
        feet = RelicFeet
    }
    
    sets.precast["Efflux"] = {
        legs = EmpyreanLegs,
        back = RosmertasCape.Savage
    }
end

function load_skillchains()
    sets.skillchain = {}

    sets.skillchain["WeaponSkill"] = set_combine(sets.precast["WeaponSkill"], {
        head=JhakriHead,
        right_ring="Mujin Band",
        feet=ArtifactFeet
        })

    sets.skillchain["Chant du Cygne"] = set_combine(sets.precast["Chant du Cygne"], {
        head=JhakriHead,
        left_ring="Mujin Band",
        feet=ArtifactFeet
        })
    
    sets.skillchain["Vorpal Blade"] = sets.skillchain["Chant du Cygne"]
    
    sets.skillchain["Savage Blade"] = set_combine(sets.precast["Savage Blade"], {
        head=JhakriHead,
        right_ring="Mujin Band",
        feet=ArtifactFeet
        })

    sets.skillchain["Expiacion"] = sets.skillchain["Savage Blade"]
    
    sets.skillchain["Sanguine Blade"] = sets.precast["Sanguine Blade"]
    
    sets.skillchain["Requiescat"] = set_combine(sets.precast["Requiescat"], {
        head=JhakriHead,
        right_ring="Mujin Band",
        feet=ArtifactFeet
        })

end

function load_midcast()
    sets.midcast = {}
    sets.midcast.buff = {}
    
    sets.midcast["Magic"] = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Pemphredo Tathlum",
        head = "Laurel Wreath",
        neck = "Reti Pendant",
        right_ear = "Gifted Earring",
        left_ear = "Mendicant's Earring",
        body = AyanmoBody,
        hands = EmpyreanHands,
        left_ring = "Defending Ring",
        right_ring = "Evanescence Ring",
        back = "Solemnity Cape",
        waist = "Austerity Belt",
        legs = "Lengo Pants",
        feet = CarmineFeet.PathB
    }
    
    sets.midcast["BlueMagic"] = sets.midcast["Magic"]
    
    sets.midcast["Physical_STR"] = {
        main = "Iris",
        sub = Iris,
        ammo = "Ginsen",
        head = AdhemarHead.PathA,
        neck = "Sanctity Necklace",
        right_ear = "Telos Earring",
        left_ear = "Ghillie Earring",
        body = JhakriBody,
        hands = AdhemarHands.PathA,
        right_ring = "Apate Ring",
        left_ring = "Rufescent Ring",
        back = RosmertasCape.Savage,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet,
    }
    
    sets.midcast["Physical_DEX"] = {
        main = "Iris",
        sub = Iris,
        ammo = "Jukukik Feather",
        head = AdhemarHead.PathA,
        body = "Abnoba Kaftan",
        hands = AdhemarHands.PathA,
        legs = CarmineLegs.PathD,
        feet = HerculeanFeet.Crit,
        neck = "Sanctity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Thunder Pearl",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Rajas Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Physical_VIT"] = {
        main = "Iris",
        sub = Iris,
        ammo = "Ginsen",
        head = DespairHead.PathD,
        body = DespairBody.PathD,
        hands = DespairHands.PathD,
        legs = DespairLegs.PathD,
        feet = DespairFeet.PathD,
        neck = "Fortitude Torque",
        waist = "Warwolf Belt",
        left_ear = "Genmei Earring",
        right_ear = "Telos Earring",
        left_ring = "Supershear Ring",
        right_ring = "Spiral Ring",
        back = RosmertasCape.Savage
    }
    
    sets.midcast["Physical_AGI"] = {
        main = "Iris",
        sub = Iris,
        ammo = "Ginsen",
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AyanmoHands,
        legs = HerculeanLegs.WSD,
        feet = HerculeanFeet.TripleAttack,
        neck = "Arctier's Torque",
        waist = "Grunfeld Rope",
        left_ear = "Infused Earring",
        right_ear = "Telos Earring",
        left_ring = "Solemn Ring",
        right_ring = "Apate Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Physical_ACC"] = {
        main = "Iris",
        sub = Iris,
        ammo = "Honed Tathlum",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = CarmineLegs.PathD,
        feet = AyanmoFeet,
        neck = "Sanctity Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Assuage Earring",
        right_ear = "Telos Earring",
        left_ring = "Cacoethic Ring",
        right_ring = "Enlivened Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Magic_ACC"] = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Pemphredo Tathlum",
        head = JhakriHead,
        body = JhakriBody,
        hands = JhakriHands,
        legs = JhakriLegs,
        feet = JhakriFeet,
        neck = "Sanctity Necklace",
        waist = "Salire Belt",
        left_ear = "Lifestorm Earring",
        right_ear = "Psystorm Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = CornflowerCape,
    }
    sets.midcast["Magic_INT"] = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Pemphredo Tathlum",
        head = JhakriHead,
        body = JhakriBody,
        hands = JhakriHands,
        legs = JhakriLegs,
        feet = JhakriFeet,
        neck = "Sanctity Necklace",
        waist = "Salire Belt",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Acumen Ring",
        right_ring = "Snow Ring",
        back = CornflowerCape,
    }
    
    sets.midcast["Magic_Dark"] = set_combine(sets.midcast["Magic_INT"], {head = "Pixie Hairpin +1"})
    sets.midcast["Magic_Light"] = sets.midcast["Magic_INT"]
    sets.midcast["Magic_Earth"] = set_combine(sets.midcast["Magic_INT"], {neck = "Quanpur Necklace"})
    sets.midcast["Magic Hammer"] = set_combine(sets.midcast["Magic_ACC"], {hands = EmpyreanHands})
    
    sets.midcast["Breath"] = sets.midcast["Magic_ACC"]
    sets.midcast["Buffs"] = sets.midcast.magic
    sets.midcast["Skill"] = {
        ammo = "Mavi Tathlum",
        head = RelicHead,
        body = ArtifactBody,
        hands = "Rawhide Gloves",
        feet = RelicFeet,
        neck = "Incanter's Torque",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = CornflowerCape
    }
    
    sets.midcast["Healing"] = set_combine(sets.midcast.magic, {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        feet = MediumsSabots,
        neck = "Incanter's Torque",
        left_ear = "Mendi. Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Solemnity Cape",
    })
    
    sets.midcast["Healing"].self = set_combine(sets.midcast["Healing"], {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Egoist's Tathlum",
        head = DespairHead.PathD,
        body = DespairBody.PathD,
        hands = DespairHands.PathD,
        legs = DespairLegs.PathD,
        feet = MediumsSabots,
        neck = "Incanter's Torque",
        left_ear = "Mendi. Earring",
        right_ear = "Assuage Earring",
        left_ring = "Vocane Ring",
        right_ring = "Stikini Ring",
        back = "Solemnity Cape",
        waist = "Chuq'aba Belt"
    })
    
    sets.midcast["Stun"] = {
        main = "Iris",
        sub = "Iris",
        ammo = "Pemphredo Tathlum",
        head = JhakriHead,
        body = JhakriBody,
        hands = JhakriHands,
        legs = JhakriLegs,
        feet = JhakriFeet,
        neck = "Sanctity Necklace",
        waist = "Twilight Belt",
        right_ear = "Telos Earring",
        left_ear = "Hermetic Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Battery Charge"] = sets.midcast.magic
    sets.midcast["Refresh"] = sets.midcast["Battery Charge"]
    
    sets.midcast["Aquaveil"] = set_combine(sets.midcast.magic, {waist = "Emphatikos Rope"})
    
    sets.midcast.buff["Chain Affinity"] = sets.precast["Chain Affinity"]
    sets.midcast.buff["Burst Affinity"] = sets.precast["Burst Affinity"]
    sets.midcast.buff["Efflux"] = sets.precast["Efflux"]
    sets.midcast.buff["Diffusion"] = sets.precast["Diffusion"]
end

function load_engaged()
    sets.engaged = {}
    sets.engaged["DW0"] = {
        ammo = "Ginsen",
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Asperity Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    sets.engaged["DW7"] = {
        ammo = "Ginsen",
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    sets.engaged["DW12"] = {
        ammo = "Ginsen",
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Asperity Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    -- sets.engaged["DW15"] = {}
    -- sets.engaged["DW20"] = {}
    -- sets.engaged["DW25"] = {}
    -- sets.engaged["DW30"] = {}
    sets.engaged["ACC1200"] = sets.engaged["DW0"]
    sets.engaged["ACC1300"] = sets.engaged["DW0"]
    sets.engaged["PDT"] = {
        ammo = "Ginsen",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = AyanmoLegs,
        feet = "Battlecast Gaiters",
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Genmei Earring",
        right_ear = "Brutal Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = RosmertasCape.TP
    }
    
    sets.engaged["MDT"] = {
        ammo = "Vanir Battery",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = AyanmoLegs,
        feet = AyanmoFeet,
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = RosmertasCape.TP
    }
    
    sets.engaged["MEVA"] = {
        ammo = "Vanir Battery",
        head = HerculeanHead.WSD,
        body = "Passion Jacket",
        hands = LeylineGloves,
        legs = LengoPants,
        feet = MediumsSabots,
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Volunt. Earring",
        left_ring = "Defending Ring",
        right_ring = "Vengeful Ring",
        back = "Solemnity Cape",
    }
end

function load_idle()
    sets.idle = {}
    
    sets.idle["Default"] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Vanir Battery",
        head = "Rawhide Mask",
        body = JhakriBody,
        hands = AyanmoHands,
        legs = CarmineLegs.PathD,
        feet = "Battlecast Gaiters",
        neck = "Bathy Choker +1",
        waist = "Fucho-no-Obi",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Sheltered Ring",
        back = RosmertasCape.TP
    }
    
    sets.idle.town = {body = "Councilor's Garb"}
    
    sets.idle["PDT"] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Vanir Battery",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = AyanmoLegs,
        feet = "Battlecast Gaiters",
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = RosmertasCape.TP
    }
    
    sets.idle["MDT"] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Vanir Battery",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = AyanmoLegs,
        feet = AyanmoFeet,
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = RosmertasCape.TP
    }
    
    sets.idle["MEVA"] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Vanir Battery",
        head = HerculeanHead.WSD,
        body = "Passion Jacket",
        hands = LeylineGloves,
        legs = LengoPants,
        feet = MediumsSabots,
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Volunt. Earring",
        left_ring = "Defending Ring",
        right_ring = "Vengeful Ring",
        back = "Solemnity Cape",
    }
    
    sets.idle["Refresh"] = {
        main = "Bolelabunga",
        sub = "Genmei Shield",
        ammo = "Vanir Battery",
        head = "Rawhide Mask",
        body = JhakriBody,
        hands = "Serpentes Cuffs",
        legs = CarmineLegs.PathD,
        feet = "Serpentes Sabots",
        neck = "Bathy Choker +1",
        waist = "Fucho-no-Obi",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Sheltered Ring",
        back = RosmertasCape.TP
    }
    
end

