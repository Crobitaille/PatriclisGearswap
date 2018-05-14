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
    init_equipment_variables()
    init_wskill_sets()
    init_idle_sets()
    init_engaged_sets()
    init_magic_sets()
    init_blu_phys_sets()
    init_blu_nuke_sets()
    init_blu_magic_sets()
    init_precast_sets()
    init_misc_sets()
end

function init_equipment_variables()
    sets.BlueMagic = {}
    
    RosmertasCape = {}
    RosmertasCape.TP = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%', }}
    RosmertasCape.WS = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon Skill Damage+10', }}
    
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
    CarmineLegs.Accuracy = {}
    
    CarmineFeet = {}
    CarmineFeet.Accuracy = {name = "Carmine Greaves +1"}
    
    LeylineGloves = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3', }}
    
    SamnuhaCoat = {name = "Samnuha Coat", augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+5', '"Dual Wield"+5', }}
    
    SamnuhaPants = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1', }}
    
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

function init_idle_sets()
    sets.idle = {
        ammo = "Ginsen",
        head = "Rawhide Mask",
        neck = "Bathy Choker +1",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        body = "Jhakri Robe +1",
        hands = "Serpentes Cuffs",
        left_ring = "Paguroidea Ring",
        right_ring = "Sheltered Ring",
        back = RosmertasCape.TP,
        waist = "Twilight Belt",
        legs = "Carmine Cuisses +1",
        feet = "Serpentes sabots"
    }
    
    sets.idle.PL = {
        main = "Sequence",
        sub = "Genmei Shield",
        ammo = "Ginsen",
        head = "Rawhide Mask",
        neck = "Twilight Torque",
        ear1 = "Genmei Earring",
        ear2 = "Merman's Earring",
        body = "Jhakri Robe +1",
        hands = "Umuthi Gloves",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = "Solemnity Cape",
        waist = "Twilight Belt",
        legs = "Carmine Cuisses +1",
        feet = "Battlecast Gaiters"
    }
    
    sets.idle.PDT = {
        ammo = "Ginsen",
        neck = "Twilight Torque",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        head = "Ayanmo Zucchetto +2",
        body = "Ayanmo Corazza +1",
        hands = "Umuthi Gloves",
        legs = "Ayanmo Cosciales +1",
        feet = "Battlecast Gaiters",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = "Solemnity Cape",
        waist = "Twilight Belt"
    }
    
    sets.idle.Town = {
        ammo = "Ginsen",
        head = "Rawhide Mask",
        neck = "Bathy Choker +1",
        ear1 = "Genmei Earring",
        ear2 = "Merman's Earring",
        body = "Jhakri Robe +1",
        hands = "Serpentes Cuffs",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = RosmertasCape.TP,
        waist = "Twilight Belt",
        legs = "Carmine Cuisses +1",
        feet = "Serpentes sabots"
    }
    
    sets.latent_refresh = {waist = "Fucho-no-obi"}
end

function init_engaged_sets()
    sets.engaged = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaPants,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Kentarch Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    sets.engaged.DW = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaPants,
        feet = HerculeanFeet.TP,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    sets.engaged.DW2 = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaPants,
        feet = HerculeanFeet.TP,
        neck = "Ainia Collar",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.Acc1100 = {
        ammo = "Falcon Eye",
        head = "Adhemar Bonnet",
        body = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }},
        hands = "Adhemar Wristbands",
        legs = "Samnuha tights",
        feet = HerculeanFeet.TP,
        neck = "Sanctity Necklace",
        waist = "Dynamic Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        right_ring = "Epona's Ring",
        left_ring = "Rajas Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.DW.Acc1100 = {
        ammo = "Falcon Eye",
        head = "Adhemar Bonnet",
        body = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }},
        hands = "Adhemar Wristbands",
        legs = "Samnuha tights",
        feet = HerculeanFeet.TP,
        neck = "Sanctity Necklace",
        waist = "Twilight Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.Acc1150 = {
        ammo = "Falcon Eye",
        head = "Adhemar Bonnet",
        body = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }},
        hands = "Adhemar Wristbands",
        legs = "Carmine Cuisses +1",
        feet = "Ayanmo gambieras +1",
        neck = "Sanctity Necklace",
        waist = "Cetl Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.DW.Acc1150 = {
        ammo = "Falcon Eye",
        head = "Adhemar Bonnet",
        body = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }},
        hands = "Adhemar Wristbands",
        legs = "Carmine Cuisses +1",
        feet = "Ayanmo gambieras +1",
        neck = "Sanctity Necklace",
        waist = "Dynamic Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Epona's Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.AccMax = {
        ammo = "Falcon Eye",
        head = "Ayanmo zucchetto +2",
        body = "Ayanmo Corazza +1",
        hands = "Adhemar Wristbands",
        legs = "Carmine Cuisses +1",
        feet = "Ayanmo gambieras +1",
        neck = "Subtlety Spec.",
        waist = "Dynamic Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Supershear Ring",
        back = RosmertasCape.TP,
    }
    
    sets.engaged.DW.AccMax = {
        ammo = "Falcon Eye",
        head = "Ayanmo zucchetto +2",
        body = "Ayanmo Corazza +1",
        hands = "Jhakri Cuffs +1",
        legs = "Carmine Cuisses +1",
        feet = "Ayanmo gambieras +1",
        neck = "Subtlety Spec.",
        waist = "Dynamic Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Bladeborn Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Supershear Ring",
        back = RosmertasCape.TP,
    }
    
    sets.melee = {
        main = "Sequence",
        sub = "Colada"
    }
    
    sets.meleeP = {
        main = "Sequence",
        sub = "Vampirism"
    }
    
    sets.magic = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel"
    }
end

function init_wskill_sets()
    sets.precast.WS = {
        ammo = "Vanir Battery",
        head = HerculeanHead.Savage,
        neck = "Asperity Necklace",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Rajas Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.WS,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS.Acc = {
        ammo = "Vanir Battery",
        head = HerculeanHead.Savage,
        neck = "Asperity Necklace",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Rajas Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.WS,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS['Chant Du Cygne'] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Attack,
        neck = "Fotia Gorget",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = "Abnoba Kaftan",
        hands = AdhemarHands.Weaponskill,
        ring1 = "Begrudging Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.TP,
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = HerculeanFeet.CDC
    }
    
    sets.precast.WS['Chant Du Cygne'].Acc = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Attack,
        neck = "Fotia Gorget",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = "Abnoba Kaftan",
        hands = AdhemarHands.Weaponskill,
        ring1 = "Begrudging Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.TP,
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = HerculeanFeet.CDC
    }
    
    sets.precast.WS['Savage Blade'] = {
        ammo = "Vanir Battery",
        head = HerculeanHead.Savage,
        neck = "Asperity Necklace",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Rajas Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.WS,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS['Savage Blade'].Acc = {
        ammo = "Vanir Battery",
        head = HerculeanHead.Savage,
        neck = "Asperity Necklace",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Rajas Ring",
        ring2 = "Epona's Ring",
        back = RosmertasCape.WS,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS['Requiscat'] = {
        ammo = "Quartz Tathlum +1",
        head = JhakriHead,
        neck = "Fotia Gorget",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Epona's Ring",
        ring2 = "Rufescent Ring",
        back = RosmertasCape.WS,
        waist = "Fotia Belt",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS['Requiscat'].Acc = {
        ammo = "Quartz Tathlum +1",
        head = JhakriHead,
        neck = "Fotia Gorget",
        ear1 = "Bladeborn Earring",
        ear2 = "Steelflash Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Epona's Ring",
        ring2 = "Rufescent Ring",
        back = RosmertasCape.WS,
        waist = "Fotia Belt",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
    
    sets.precast.WS['Sanguine Blade'] = {
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Sanctity Necklace",
        ear1 = "Friomisi Earring",
        ear2 = "Hecate's Earring",
        body = JhakriBody,
        hands = JhakriHands,
        ring1 = "Snow Ring",
        ring2 = "Spiral Ring",
        back = RosmertasCape.WS,
        waist = "Salire Belt",
        legs = JhakriLegs,
        feet = JhakriFeet
    }
end

function init_magic_sets()
    sets.Enhancing =
    set_combine(
    sets.BlueMagic.Buffs, {neck = "Incanter's Torque"})    
end

function init_blu_phys_sets()
    sets.BlueMagic.STR = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        neck = "Sanctity Necklace",
        ear1 = "Telos Earring",
        ear2 = "Ghillie Earring",
        body = JhakriBody,
        hands = AdhemarHands.Weaponskill,
        ring1 = "Rajas Ring",
        ring2 = "Rufescent Ring",
        back = RosmertasCape.Weaponskill,
        waist = "Grunfeld Rope",
        legs = JhakriLegs,
        feet = JhakriFeet,
    }
    
    sets.BlueMagic.STRDEX =
    set_combine(sets.BlueMagic.STR, {})
    
    sets.BlueMagic.STRVIT =
    set_combine(sets.BlueMagic.STR, {})
    
    sets.BlueMagic.STRMND =
    set_combine(sets.BlueMagic.STR, {})
    
    sets.BlueMagic.AGI =
    set_combine(sets.BlueMagic.STR, {})
    
    sets.BlueMagic.Stun = {
        ammo = "Ginsen",
        head = "Jhakri Coronal +1",
        neck = "Sanctity Necklace",
        ear1 = "Ghillie Earring",
        ear2 = "Pixie Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        ring1 = "Spiral Ring",
        ring2 = "Rajas Ring",
        back = RosmertasCape.TP,
        waist = "Warwolf Belt",
        legs = "Jhakri Slops +1",
        feet = "Jhakri pigaches +1"
    }
    
    sets.BlueMagic.HeavyStrike = {
        ammo = "Falcon Eye",
        head = "Jhakri Coronal +1",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +1",
        neck = "Sanctity Necklace",
        waist = "Dynamic Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Bladeborn Earring",
        left_ring = "Enlivened Ring",
        right_ring = "Supershear Ring",
        back = RosmertasCape.TP
    }
end

function init_blu_nuke_sets()
    sets.BlueMagic.MAB = {
        ammo = "Ghastly Tathlum",
        head = "Jhakri Coronal +1",
        neck = "Sanctity Necklace",
        ear1 = "Friomisi Earring",
        ear2 = "Hecate's Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        ring1 = "Vertigo Ring",
        ring2 = "Acumen Ring",
        back = "Cornflower Cape",
        waist = gear.ElementalObi,
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +1"
    }
    
    -- sets.BlueMagic.MAB = {
    --     ammo="Mavi Tathlum",
    --     head="Jhakri Coronal +1",
    --     neck="Sanctity Necklace",
    --     ear1="Lifestorm Earring",
    --     ear2="Psystorm Earring",
    --     body="Jhakri Robe +1",
    --     hands="Jhakri Cuffs +1",
    --     ring1="Vertigo Ring",
    --     ring2="Acumen Ring",
    --     back="Cornflower Cape",
    --     waist="Salire Belt",
    --     legs="Jhakri Slops +1",
    --     feet="Jhakri Pigaches +1"
    -- }
    
    sets.BlueMagic.LightNuke =
    set_combine(sets.BlueMagic.MAB, {
    })
    
    sets.BlueMagic.DarkNuke =
    set_combine(sets.BlueMagic.MAB, {
        head = "Pixie Hairpin +1",
    })
    
    sets.BlueMagic.MagicAccuracy = {
        ammo = "Mavi Tathlum",
        head = "Jhakri Coronal +1",
        neck = "Sanctity Necklace",
        ear1 = "Friomisi Earring",
        ear2 = "Hermetic Earring",
        body = "Jhakri Robe +1",
        hands = "Jhakri Cuffs +1",
        ring1 = "Vertigo Ring",
        ring2 = "Stikini Ring",
        back = "Cornflower Cape",
        waist = gear.ElementalObi,
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +1"
    }
end

function init_blu_magic_sets()
    sets.BlueMagic.Cures = {
        ammo = "Egoist's tathlum",
        head = "Jhakri Coronal +1",
        neck = "Incanter's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Lifestorm Earring",
        body = "Jhakri Robe +1",
        hands = "Telchine gloves",
        ring1 = "Vertigo Ring",
        ring2 = "Sirona's Ring",
        back = "Solemnity Cape",
        waist = gear.ElementalObi,
        legs = "Lengo Pants",
        feet = "Medium's Sabots"
    }
    
    sets.BlueMagic.SelfCures = {
        ammo = "Egoist's tathlum",
        head = "Despair Helm",
        neck = "Incanter's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Lifestorm Earring",
        body = "Despair Mail",
        hands = "Telchine gloves",
        ring1 = "Vertigo Ring",
        ring2 = "Vocane Ring",
        back = "Solemnity Cape",
        waist = gear.ElementalObi,
        legs = "Despair cuisses",
        feet = "Medium's Sabots"
    }
    
    sets.BlueMagic.Buffs = {
        ammo = "Mavi Tathlum",
        head = "Laurel Wreath",
        neck = "Incanter's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Gifted Earring",
        body = "Magus Jubbah",
        hands = "Telchine Gloves",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = "Cornflower Cape",
        waist = "Austerity Belt",
        legs = "Lengo Pants",
        feet = "Medium's Sabots"
    }
    
    sets.BlueMagic.Battery =
    set_combine(sets.BlueMagic.Buffs, {
    })
    
    --Telchine Regen+ potency augments--
    sets.BlueMagic.Regeneration =
    set_combine(sets.BlueMagic.Buffs, {
    })
    
    sets.BlueMagic.WhiteWind = {
        ammo = "Egoist's tathlum",
        head = "Despair Helm",
        neck = "Bathy Choker +1",
        ear1 = "Mendicant's Earring",
        ear2 = "Lifestorm Earring",
        body = "Despair Mail",
        hands = "Despair Finger Gauntlets",
        ring1 = "Supershear Ring",
        ring2 = "Meridian Ring",
        back = "Solemnity Cape",
        waist = gear.ElementalObi,
        legs = "Despair cuisses",
        feet = "Despair Greaves"
    }
    
    sets.BlueMagic.Skill = {
        ammo = "Mavi Tathlum",
        head = "Jhakri Coronal +1",
        neck = "Incanter's Torque",
        ear1 = "Mendicant's Earring",
        ear2 = "Gifted Earring",
        body = "Magus Jubbah",
        hands = "Rawhide Gloves",
        ring1 = "Vocane Ring",
        ring2 = "Defending Ring",
        back = "Cornflower Cape",
        waist = "Austerity Belt",
        legs = "Lengo Pants",
        feet = "Medium's Sabots"
    }
    
    sets.BlueMagic.Enmity = {
        ammo = "Sapience Orb",
        ring1 = "Supershear Ring",
    }
end

function init_precast_sets()
    sets.precast.FC = {
        ammo = "Sapience Orb", -- 2
        head = "Haruspex hat", -- 8
        ear2 = "Loquacious Earring", -- 2
        body = "Hashishin Mintan", --12
        waist = "Witful Belt", -- 3
        legs = "psycloth lappas", -- 7
        feet = "Carmine Greaves +1", -- 8
        back = "Perimede Cape",
        hands = "Leyline Gloves", -- 7
        ring1 = "Lebeche Ring", -- 0
        neck = "Voltsurge Torque" -- 4
    } --52
    
    sets.precast.weapons = {
        main = "Vampirism",
        sub = "Tanmogayi +1"
    }
    
    -- sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    -- sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    -- sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet = "Luhlaza Charuqs"}
    -- sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {back = "Rosmerta's cape"}
    
    sets.precast.Provoke =
    set_combine(sets.BlueMagic.Enmity, {})
    
    sets.precast.Warcry =
    set_combine(sets.BlueMagic.Enmity, {})
end

function init_misc_sets()
    sets.ProShell = set_combine(sets.BlueMagic.Buffs, {
        ring2 = "Sheltered Ring"
    })
    
    sets.defense.PDT = {
        ammo = "Ginsen",
        neck = "Twilight Torque",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        head = "Ayanmo Zucchetto +2",
        body = "Ayanmo Corazza +1",
        hands = "Umuthi Gloves",
        legs = "Ayanmo Cosciales +1",
        feet = "Battlecast Gaiters",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = RosmertasCape.TP,
        waist = "Flume Belt"
    }
    
    sets.defense.MDT = {
        ammo = "Demonry Stone",
        head = "Dampening Tam",
        neck = "Twilight Torque",
        ear1 = "Merman's Earring",
        ear2 = "Merman's Earring",
        body = "Onca Suit",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = "Solemnity Cape",
        waist = "Twilight Belt"
    }
    
    --Telchine with proper ball busting augments is the best for magic evasion--
    sets.defense.MEVA = {
        ammo = "Ginsen",
        head = "Rawhide Mask",
        neck = "Twilight Torque",
        ear1 = "Merman's Earring",
        ear2 = "Merman's Earring",
        body = "Onca Suit",
        ring1 = "Defending Ring",
        ring2 = "Vocane Ring",
        back = "Solemnity Cape",
        waist = "Twilight Belt"
    }
    
    sets.naked = {
        main = "None",
        sub = "None",
        range = "None",
        ammo = "None",
        head = "None",
        neck = "None",
        ear1 = "None",
        ear2 = "None",
        body = "None",
        hands = "None",
        ring1 = "None",
        ring2 = "None",
        back = "None",
        waist = "None",
        legs = "None",
        feet = "None"
    }
end

