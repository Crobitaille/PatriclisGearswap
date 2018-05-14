function load_gear_sets()
    load_vars()
    load_utility()
    load_precast()
    load_midcast()
    load_engaged()
    load_idle()
end

function load_vars()
    sets.BlueMagic = {}
    
    RosmertasCape = {}
    RosmertasCape.TP = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%', }}
    RosmertasCape.Savage = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon Skill Damage+10', }}
    
    AyanmoHead = "Ayanmo Zucchetto +2"
    AyanmoBody = "Ayanmo Corazza +1"
    AyanmoHands = "Ayanmo Manopolas +1"
    AyanmoLegs = "Ayanmo Cosciales +1"
    AyanmoFeet = "Ayanmo Gambieras +1"
    
    JhakriHead = "Jhakri Coronal +1"
    JhakriBody = "Jhakri Robe +1"
    JhakriHands = "Jhakri Cuffs +1"
    JhakriLegs = "Jhakri Slops +1"
    JhakriFeet = "Jhakri Pigaches +1"
    
    ArtifactHead = "Magus Keffiyeh"
    ArtifactBody = "Magus Jubbah"
    ArtifactHands = "Magus Bazubands"
    ArtifactLegs = "Magus Shalwar"
    ArtifactFeet = "Magus Charuqs"
    
    RelicHead = "Mirage Keffiyeh"
    RelicBody = "Mirage Jubbah"
    RelicHands = "Mirage Bazubands"
    RelicLegs = "Mirage Shalwar"
    RelicFeet = "Luhlaza Charuqs"
    
    EmpyreanHead = ""
    EmpyreanBody = "Hashishin Mintan"
    EmpyreanHands = "Hashishin Bazubands"
    EmpyreanLegs = ""
    EmpyreanFeet = ""
    
    AdhemarHead = {}
    AdhemarHead.Accuracy = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHead.Attack = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    AdhemarBody = {}
    AdhemarBody.Accuracy = {}
    AdhemarBody.Attack = {}
    
    AdhemarHands = {}
    AdhemarHands.TP = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHands.Weaponskill = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    Colada = {name = "Colada", augments = {'Crit.hit rate+2', 'AGI+3', 'Accuracy+11', 'Attack+18', 'DMG:+15', }}
    
    Vampirism = {}
    Vampirism.One = {name = "Vampirism", augments = {'STR+9', 'INT+8', '"Occult Acumen"+9', 'DMG:+13'}}
    
    PsyclothLegs = {}
    PsyclothLegs.FastCast = {name = "Psycloth Lappas", augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7', }}
    
    CarmineLegs = {}
    CarmineLegs.Accuracy = {name = "Carmine Cuisses +1", augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6', }}
    
    CarmineFeet = {}
    CarmineFeet.Accuracy = {name = "Carmine Greaves +1"}
    
    LeylineGloves = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3', }}
    
    SamnuhaCoat = {name = "Samnuha Coat", augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+5', '"Dual Wield"+5', }}
    
    SamnuhaTights = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1', }}
    
    MediumsSabots = {name = "Medium's Sabots", augments = {'MP+50', 'MND+8', '"Conserve MP"+6', '"Cure" potency +3%', }}
    LengoPants = {name = "Lengo Pants", augments = {'INT+7', 'Mag. Acc.+8', '"Mag.Atk.Bns."+7', }}
    
    HerculeanLegs = {}
    HerculeanLegs.TP = {name = "Herculean Trousers"}
    
    HerculeanFeet = {}
    HerculeanFeet.TP = {name = "Herculean Boots", augments = {'Accuracy+15 Attack+15', '"Triple Atk."+3', 'AGI+10', 'Accuracy+9', }}
    HerculeanFeet.CDC = {name = "Herculean Boots", augments = {'Accuracy+18 Attack+18', 'Crit. hit damage +3%', 'DEX+9', 'Attack+11', }}
    
    HerculeanHead = {}
    HerculeanHead.Savage = {name = "Herculean Helm", augments = {'Accuracy+1', 'Weapon skill damage +4%', 'INT+4', 'Attack+10', }}
    
    DespairHead = {}
    DespairHead.Cure = {name = "Despair Helm"}
    
    DespairBody = {}
    DespairBody.Cure = {name = "Despair Mail"}
    
    DespairHands = {}
    DespairHands.Cure = {name = "Despair Finger Gauntlets"}
    
    DespairLegs = {}
    DespairLegs.Cure = {name = "Despair Cuisses", augments = {'HP+50', 'VIT+10', 'Potency of "Cure" effect received +5%', }}
    
    DespairFeet = {}
    DespairFeet.Cure = {name = "Despair Greaves", augments = {'HP+50', 'VIT+10', 'Potency of "Cure" effect received +5%', }}
    
    RawhideBody = {}
    RawhideBody.TripleAttack = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }}
    
    CornflowerCape = {name = "Cornflower Cape", augments = {'MP+24', 'DEX+4', 'Blue Magic skill +10', }}
    
    CapacityCape = {name = "Mecisto. Mantle", augments = {'Cap. Point+25%', 'MND+1', 'DEF+3', }}
end

function load_utility()
    sets.weapons = {}
    
    sets.weapons.melee = {
        main = "Sequence",
        sub = Colada
    }
    
    sets.weapons.magic = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel"
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
    
    sets.precast.magic = {
        main = "Vampirism", -- 7
        sub = "Tanmogayi +1", -- 6
        ammo = "Sapience Orb", -- 2
        head = "Haruspex Hat", -- 8
        left_ear = "Loquacious Earring", -- 2
        left_ring = "Prolix Ring", -- 2
        body = SamnuhaCoat, -- 5
        legs = PsyclothLegs.FastCast, -- 7
        feet = CarmineFeet.Accuracy, -- 8
        back = "Swith Cape", -- 2
        hands = LeylineGloves, -- 8
        neck = "Voltsurge Torque", -- 4
    }
    
    sets.precast["BlueMagic"] =
    set_combine(sets.precast.magic, {
        body = EmpyreanBody, --12
    })
    
    sets.precast["WeaponSkill"] = {
        ammo = "Vanir Battery",
        head = JhakriHead,
        neck = "Asperity Necklace",
        right_ear = "Bladeborn Earring",
        left_ear = "Steelflash Earring",
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
        head = AdhemarHead.Attack,
        neck = "Fotia Gorget",
        right_ear = "Bladeborn Earring",
        left_ear = "Steelflash Earring",
        body = "Abnoba Kaftan",
        hands = AdhemarHands.Weaponskill,
        right_ring = "Begrudging Ring",
        left_ring = "Epona's Ring",
        back = RosmertasCape.TP,
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = AyanmoFeet
    }
    
    sets.precast["Vorpal Blade"] = sets.precast["Chant du Cygne"]
    
    sets.precast["Savage Blade"] = {
        ammo = "Vanir Battery",
        head = JhakriHead,
        neck = "Asperity Necklace",
        right_ear = "Bladeborn Earring",
        left_ear = "Steelflash Earring",
        body = JhakriBody,
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
        right_ear = "Friomisi Earring",
        left_ear = "Hecate's Earring",
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
        right_ear = "Bladeborn Earring",
        left_ear = "Steelflash Earring",
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

function load_midcast()
    sets.midcast = {}
    sets.midcast.buff = {}
    
    sets.midcast.magic = {
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
        feet = CarmineFeet.Accuracy
    }
    
    sets.midcast["BlueMagic"] = sets.midcast.magic
    
    sets.midcast["Physical_STR"] = {
        main = "Sequence",
        sub = Colada,
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        neck = "Sanctity Necklace",
        right_ear = "Telos Earring",
        left_ear = "Ghillie Earring",
        body = JhakriBody,
        hands = AdhemarHands.Weaponskill,
        right_ring = "Apate Ring",
        left_ring = "Rufescent Ring",
        back = RosmertasCape.Savage,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet,
    }
    
    sets.midcast["Physical_DEX"] = {
        main = "Sequence",
        sub = Colada,
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = "Abnoba Kaftan",
        hands = AdhemarHands.Weaponskill,
        legs = CarmineLegs.Accuracy,
        feet = HerculeanFeet.CDC,
        neck = "Sanctity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Thunder Pearl",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Rajas Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Physical_VIT"] = {
        main = "Sequence",
        sub = Colada,
        ammo = "Ginsen",
        head = DespairHead.Cure,
        body = DespairBody.Cure,
        hands = DespairHands.Cure,
        legs = DespairLegs.Cure,
        feet = DespairFeet.Cure,
        neck = "Fortitude Torque",
        waist = "Warwolf Belt",
        left_ear = "Genmei Earring",
        right_ear = "Telos Earring",
        left_ring = "Supershear Ring",
        right_ring = "Spiral Ring",
        back = RosmertasCape.Savage
    }
    
    sets.midcast["Physical_AGI"] = {
        main = "Sequence",
        sub = Colada,
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AyanmoHands,
        legs = HerculeanLegs.TP,
        feet = HerculeanFeet.TP,
        neck = "Arctier's Torque",
        waist = "Grunfeld Rope",
        left_ear = "Infused Earring",
        right_ear = "Telos Earring",
        left_ring = "Solemn Ring",
        right_ring = "Apate Ring",
        back = RosmertasCape.TP
    }
    
    sets.midcast["Physical_ACC"] = {
        main = "Sequence",
        sub = Colada,
        ammo = "Honed Tathlum",
        head = AyanmoHead,
        body = AyanmoBody,
        hands = AyanmoHands,
        legs = CarmineLegs.Accuracy,
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
    sets.midcast["Magic Hammer"] = set_combine(sets.midcast.magic, {hands = EmpyreanHands})
    sets.midcast["Magic_Eerth"] = set_combine(sets.midcast["Magic_INT"], {neck = "Quanpur Necklace"})
    
    sets.midcast["Breath"] = sets.midcast["Magic_ACC"]
    sets.midcast["Buffs"] = sets.midcast.magic
    sets.midcast["Skill"] = {
        ammo = "Mavi Tathlum",
        head = RelicHead,
        body = ArtifactBody,
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
        head = DespairHead.Cure,
        body = DespairBody.Cure,
        hands = DespairHands.Cure,
        legs = DespairLegs.Cure,
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
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
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
    
    sets.midcast.buff["Chain Affinity"] = set_combine(sets.precast["Chain Affinity"], sets.skillchain)
    sets.midcast.buff["Burst Affinity"] = sets.precast["Burst Affinity"]
    sets.midcast.buff["Efflux"] = sets.precast["Efflux"]
    sets.midcast.buff["Diffusion"] = sets.precast["Diffusion"]
end

function load_engaged()
    sets.engaged = {}
    sets.engaged["DW0"] = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TP,
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
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TP,
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
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TP,
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
        head = HerculeanHead.Savage,
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
        legs = CarmineLegs.Accuracy,
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
        head = HerculeanHead.Savage,
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
        legs = CarmineLegs.Accuracy,
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

