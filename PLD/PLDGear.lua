function init_gear_sets()
    init_item_vars()
    init_utility_sets()
    init_item_arrays()
    init_job_ability_sets()
    init_precast_sets()
    init_weaponskill_sets()
    init_defensive_sets()
    init_healing_sets()
    init_enhancing_sets()
    init_divine_sets()
    
    init_melee_sets()
    init_idle_sets()
end

function init_item_vars()
   
    ArtifactHead = "Reverence Coronet +1"
    ArtifactBody = "Reverence Surcoat +1"
    ArtifactHands = "Reverence Gauntlets"
    ArtifactLegs = "Reverence Breeches +1"
    ArtifactFeet = "Reverence Leggings +2"
    
    RelicHead = "Caballarius Coronet"
    RelicBody = "Caballarius Surcoat"
    RelicHands = "Caballarius Gauntlets"
    RelicLegs = "Caballarius Breeches"
    RelicFeet = "Caballarius Leggings"
    
    EmpyreanHead = "Chevalier's Armet"
    EmpyreanBody = "Chevalier's Cuirass"
    EmpyreanHands = "Chevalier's Gauntlets"
    EmpyreanLegs = "Chevalier's Cuisses"
    EmpyreanFeet = "Creed Sabatons +2"
    
    LeylineGloves = {}
    LeylineGloves.FC = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3', }}
    
    EschiteHelm = {}
    EschiteHelm.CP = {name = "Eschite Helm", augments = {'STR+10', 'VIT+7', '"Cure" potency +7%', }}
    
    EschiteCuisses = {}
    EschiteCuisses.FC = {name = "Eschite Cuisses", augments = {'"Mag.Atk.Bns."+25', '"Conserve MP"+6', '"Fast Cast"+5', }}
    EschiteCuisses.CMP = {name = "Eschite Cuisses", augments = {'"Mag.Atk.Bns."+25', '"Conserve MP"+6', '"Fast Cast"+5', }}
    
    EschiteGreaves = {}
    EschiteGreaves.Enmity = {name = "Eschite Greaves", augments = {'Mag. Evasion+13', 'Spell interruption rate down +13%', 'Enmity+6', }}
    
    DespairCuisses = {}
    DespairCuisses.CureRec = {name = "Despair Cuisses", augments = {'HP+50', 'VIT+10', 'Potency of "Cure" effect received +5%', }}
    
    DespairGreaves = {}
    DespairGreaves.CureRec = {name = "Despair Greaves", augments = {'HP+50', 'VIT+10', 'Potency of "Cure" effect received +5%', }}
    
    OdysseanGreaves = {}
    OdysseanGreaves.FC = {name = "Odyssean Greaves", augments = {'"Fast Cast"+4', 'Attack+2', }}
    
    OdysseanChestplate = {}
    OdysseanChestplate.FC = {name = "Odyss. Chestplate", augments = {'Accuracy+24', '"Fast Cast"+3', 'Attack+3', }}
    
    CarmineCuisses = {}
    CarmineCuisses.DW = {name = "Carmine Cuisses +1", augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6', }}
    
    RudianosMantle = {}
    RudianosMantle.FC = {name = "Rudianos's Mantle", augments = {'"Fast Cast"+10', }}
    RudianosMantle.DPS = {name = "Rudianos's Mantle", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', 'Haste+10', 'Damage taken-5%', }}
    
    NuevoCoselete = {name = "Nuevo Coselete", augments = {'Enmity+5', '"Fast Cast"+5', }}
    
    FoundersHose = {}
    FoundersHose.SpellIntRate = {name = "Founder's Hose", augments = {'MND+10', 'Attack+15', 'Mag. Acc.+15', 'Breath dmg. taken-5%'}}
    
    FoundersCorona = {}
    FoundersCorona.MDT = {name = "Founder's Corona", augments = {'DEX+8', 'Accuracy+15', 'Mag. Acc.+14', 'Magic dmg. taken -3%', }}
    
    FounersGreaves = {}
    FounersGreaves.MEVA = {name = "Founder's Greaves", augments = {'VIT+5', 'Accuracy+7', '"Mag.Atk.Bns."+10', 'Mag. Evasion+13', }}
    
    DarkRing = {}
    
    SouveranSchaller = {}
    SouveranSchaller.CureRec = {name = "Souveran Schaller", augments = {'HP+80', 'Enmity+7', 'Potency of "Cure" effect received +10%', }}
    
    SouveranHands = {}
    SouveranHands.PDT = {name = "Souv. Handschuhs", augments = {'HP+50', 'Shield skill +10', 'Phys. dmg. taken -3', }}
    
    SouveranLegs = {}
    SouveranLegs.CureRec = {name = "Souveran Diechlings", augments = {'HP+80', 'Enmity+7', 'Potency of "Cure" effect received +10%', }}
    
    SouveranFeet = {}
    SouveranFeet.CureRec = {name = "Souveran Schuhs", augments = {'HP+80', 'Enmity+7', 'Potency of "Cure" effect received +10%', }}
    
    LustratioHarness = {}
    LustratioHarness.B = {name = "Lustratio Harness", augments = {'Accuracy+15', 'DEX+5', 'Crit. hit rate+2%', }}
end

function init_item_arrays()
    sets.Weapons = {}
    DWOffHands = S{'Colada', 'Demers. Degen +1', 'Vampirism'}
    MainHand = {'Sequence', 'Nixxer', 'Demers. Degen +1', 'Vampirism'}
    OffHand = {'Aegis', 'Priwen'}
    ShieldOnly = {'Aegis', 'Priwen'}
    AllOffHands = {'Aegis', 'Priwen', 'Colada', 'Nibiru Blade', 'Demers. Degen +1', 'Vampirism'}
end

function init_utility_sets()
    sets.FastPants = {
        legs = "Carmine Cuisses +1"
    }
    
    sets.ConserveMP = {
        ammo = "Impatiens",
        head = "Souveran Schaller",
        body = ArtifactBody,
        hands = "Sulev. Gauntlets +1",
        legs = EschiteCuisses.CMP,
        feet = EschiteGreaves.Enmity,
        neck = "Reti Pendant",
        waist = "Austerity Belt",
        left_ear = "Knightly Earring",
        right_ear = "Mendi. Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = "Solemnity Cape",
    }
    
    sets.SureCast = {
        ammo = "Impatiens",
        head = SouveranSchaller.CureRec,
        legs = FoundersHose.SpellIntRate,
        feet = OdysseanGreaves.FC,
        waist = "Silver Obi +1",
        left_ear = "Knightly Earring",
    }
    
    sets.Enmity = {
        ammo = "Sapience Orb",
        head = "Loess Barbuta +1",
        body = ArtifactBody,
        hands = "Macabre Gaunt. +1",
        legs = SouveranLegs.CureRec,
        feet = EschiteGreaves.Enmity,
        neck = "Warder's Charm",
        waist = "Creed Baudrier",
        left_ring = "Apeile Ring +1",
        right_ring = "Apeile Ring",
        ear2 = "Friomisi Earring",
        back = "Valor Cape",
    }
    
    sets.Vitality =
    set_combine(sets.Enmity, {
        head = SouveranSchaller.CureRec,
        body = "Sulevia's Plate. +1",
        hands = "Sulev. Gauntlets +1",
        legs = "Sulevi. Cuisses +2",
        feet = "Sulev. Leggings +1",
        neck = "Apathy Gorget",
        waist = "Warwolf Belt",
        left_ring = "Supershear Ring",
        right_ring = "Spiral Ring",
        back = "Valor Cape",
    })
    
    sets.weather = {
        back = "Twilight Cape",
        waist = "Hachirin-no-obi"
    }
    
    sets.LatentRefresh = {
        waist = "Fucho-no-obi"
    }
end

function init_job_ability_sets()
    sets.ShieldBash =
    set_combine(sets.Enmity, {
        ear1 = "Knightly Earring",
        hands = RelicHands
    })
    sets.HolyCircle =
    set_combine(sets.Enmity, {
        feet = ArtifactFeet
    })
    sets.Sentinel =
    set_combine(sets.Enmity, {
        feet = RelicFeet
    })
    sets.Cover =
    set_combine(sets.Enmity, {
        head = ArtifactHead
    })
    sets.MaintainCover = {
        body = RelicBody
    }
    sets.Rampart = {
        head = RelicHead
    }
    sets.Fealty =
    set_combine(sets.Enmity, {
        body = RelicBody
    })
    sets.Chivalry =
    set_combine(sets.Enmity, {
        ammo = "Quartz Tathlum +1",
        head = ArtifactHead,
        body = "Sulevia's Plate. +1",
        hands = RelicHands,
        legs = "Sulevi. Cuisses +2",
        feet = "Sulev. Leggings +1",
        neck = "Asperity Necklace",
        waist = "Pythia Sash",
        left_ear = "Nourish. Earring +1",
        right_ear = "Nourish. Earring",
        left_ring = "Vertigo Ring",
        right_ring = "Rufescent Ring"
    })
    sets.DivineEmblem =
    set_combine(sets.Enmity, {
        feet = EmpyreanFeet
    })
    sets.DivineEmblemCast = {
        feet = EmpyreanFeet
    }
end

function init_precast_sets()
    sets.precast = {
        ammo = "Impatiens",
        head = EmpyreanHead,
        hands = LeylineGloves.FC,
        legs = EschiteCuisses.FC,
        body = OdysseanChestplate.FC,
        feet = "Carmine Greaves +1",
        right_ear = "Loquacious Earring",
        left_ring = "Prolix Ring",
        right_ring = "Lebeche Ring",
        back = RudianosMantle.FC,
        neck = "Voltsurge Torque",
        left_ear = "Genmei Earring",
        waist = "Flume Belt"
    }
    
    sets.precast.Cures =
    set_combine(sets.precast, {
        ear1 = "Nourishing Earring +1",
        ear2 = "Mendicant's Earring",
        body = "Jumalik Mail"
    })
    
    sets.precast.EnhancingMagic =
    set_combine(sets.precast, {
        waist = "Siegel Sash"
    })
end

function init_weaponskill_sets()
    sets.ChantDuCygne = {
        ammo = "Jukukik Feather",
        head = "Flam. Zucchetto +2",
        body = "Vatic Byrnie",
        hands = "Flam. Manopolas +1",
        legs = "Sulevi. Cuisses +2",
        feet = "Flam. Gambieras +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Bladeborn Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Petrov Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.Requiescat = {
        ammo = "Quartz Tathlum +1",
        head = "Flam. Zucchetto +2",
        body = "Vatic Byrnie",
        hands = "Sulev. Gauntlets +1",
        legs = "Sulevi. Cuisses +2",
        feet = "Flam. Gambieras +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Lifestorm Earring",
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Solemn Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.SavageBlade = {
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = LustratioHarness.B,
        hands = "Sulev. Gauntlets +1",
        legs = "Sulevi. Cuisses +2",
        feet = "Sulevia's leggings +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Bladeborn Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Petrov Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.Atonement = {
        ammo = "Sapience Orb",
        head = "Valorous Mask",
        body = ArtifactBody,
        hands = "Odyssean Gauntlets",
        legs = ArtifactLegs,
        feet = "Sulev. Leggings +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Supershear Ring",
        right_ring = "Apeile Ring",
        back = "Valor Cape",
    }
    
    sets.WeaponSkill = {
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Vatic Byrnie",
        hands = "Sulev. Gauntlets +1",
        legs = "Sulevi. Cuisses +2",
        feet = "Flam. Gambieras +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Bladeborn Earring",
        left_ring = "Rajas Ring",
        right_ring = "Petrov Ring",
        back = RudianosMantle.DPS,
    }
end

function init_defensive_sets()
    sets.PDT = {
        name = "PDT",
        ammo = "Egoist's Tathlum",
        head = "Loess Barbuta +1",
        body = ArtifactBody,
        hands = SouveranHands.PDT,
        legs = SouveranLegs.CureRec,
        feet = ArtifactFeet,
        neck = "Diemer Gorget",
        waist = "Flume Belt",
        left_ear = "Buckler Earring",
        right_ear = "Creed Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.shadow = set_combine(sets.PDT, {
        head = EmpyreanHead,
        hands = LeylineGloves.FC,
        legs = EschiteCuisses.FC,
        body = OdysseanChestplate.FC,
        feet = OdysseanGreaves.FC,
        right_ear = "Loquacious Earring",
        left_ring = "Prolix Ring",
        back = RudianosMantle.FC,
        neck = "Voltsurge Torque",
        left_ear = "Genmei Earring",
        waist = "Cetl Belt"
    })
    
    sets.HP = {
        name = "HP",
        ammo = "Egoist's Tathlum",
        head = SouveranSchaller.CureRec,
        body = "Jumalik Mail",
        hands = SouveranHands.PDT,
        legs = SouveranLegs.CureRec,
        feet = SouveranFeet.CureRec,
        neck = "Bathy Choker +1",
        waist = "Creed Baudrier",
        left_ear = "Oneiros Earring",
        right_ear = "Creed Earring",
        left_ring = "Supershear Ring",
        right_ring = "Meridian Ring",
        back = "Xucau Mantle",
    }
    
    sets.MDTShell4 = {
        name = "MDT Shell 4",
        ammo = "Vanir Battery",
        head = FoundersCorona.MDT,
        body = "Jumalik Mail",
        hands = "Redan Gloves",
        legs = "Sulevi. Cuisses +2",
        feet = "Flamma Gambieras +1",
        neck = "Warder's Charm",
        waist = "Asklepian belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Lunette Ring +1",
        right_ring = "Meridian Ring",
        back = "Engulfer Cape +1"
    }
    sets.MDTShell5 = {
        name = "MDT Shell 5",
        ammo = "Vanir Battery",
        head = FoundersCorona.MDT,
        body = "Jumalik Mail",
        hands = "Redan Gloves",
        legs = "Sulevi. Cuisses +2",
        feet = "Flamma Gambieras +1",
        neck = "Warder's Charm",
        waist = "Asklepian belt",
        left_ear = "Merman's Earring",
        right_ear = "Psystorm Earring",
        left_ring = "Lunette Ring +1",
        right_ring = "Meridian Ring",
        back = "Engulfer Cape +1"
    }
    
    sets.MDTNoShell = {
        name = "MDT No Shell",
        ammo = "Vanir Battery",
        head = "Loess Barbuta +1",
        body = ArtifactBody,
        hands = SouveranHands.PDT,
        legs = "Sulevi. Cuisses +2",
        feet = EschiteGreaves.Enmity,
        neck = "Warder's Charm",
        waist = "Asklepian belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = "Engulfer Cape +1",
    }
    
    sets.MDT = sets.MDTNoShell
    
    sets.MEVA = {
        name = "MEVA",
        ammo = "Vanir Battery",
        head = FoundersCorona.MDT,
        body = "Jumalik Mail",
        hands = "Flam. Manopolas +1",
        legs = "Flamma Dirs +1",
        feet = FounersGreaves.MEVA,
        neck = "Warder's Charm",
        waist = "Asklepian Belt",
        left_ear = "Merman's Earring",
        right_ear = "Volunt. Earring",
        left_ring = "Vocane Ring",
        right_ring = "Defending Ring",
        back = "Solemnity Cape",
    }
end

function init_healing_sets()
    sets.Cures =
    set_combine(sets.Enmity, {
        head = EschiteHelm.CP,
        body = "Jumalik Mail",
        hands = "Macabre Gaunt. +1",
        neck = "Incanter's Torque",
        left_ear = "Nourish. Earring +1",
        right_ear = "Mendi. Earring",
        back = "Solemnity Cape",
    })
    
    sets.CureSelf = {
        ammo = "Egoist's Tathlum",
        head = SouveranSchaller.CureRec,
        body = "Jumalik Mail",
        hands = "Macabre Gaunt. +1",
        legs = SouveranLegs.CureRec,
        feet = SouveranFeet.CureRec,
        neck = "Incanter's Torque",
        waist = "Chuq'aba Belt",
        left_ear = "Nourish. Earring +1",
        right_ear = "Mendi. Earring",
        left_ring = "Vocane Ring",
        right_ring = "Meridian Ring",
        back = "Solemnity Cape"
    }
end

function init_enhancing_sets()
    sets.Enhancing =
    set_combine(sets.Enmity, {
        ammo = "Impatiens",
        head = SouveranSchaller.CureRec,
        legs = CarmineCuisses.DW,
        feet = OdysseanGreaves.FC,
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Knightly Earring",
        right_ear = "Mendi. Earring",
        right_ring = "Evanescence Ring",
    })
    
    sets.Phalanx =
    set_combine(sets.Enhancing, {
        back = "Weard Mantle",
        hands = SouveranHands.PDT,
        feet = SouveranFeet.CureRec
    })
    
    sets.Reprisal =
    set_combine(sets.HP, {
        head = SouveranSchaller.CureRec,
        ear1 = "Loquacious Earring",
        body = ArtifactBody,
        hands = LeylineGloves.FC,
        legs = EschiteCuisses.FC,
        feet = OdysseanGreaves.FC,
        waist = "Chuq'aba Belt",
        back = RudianosMantle.FC
    })
end

function init_divine_sets()
    sets.Flash =
    set_combine(sets.Enmity, {
        head = SouveranSchaller.CureRec,
        ear1 = "Loquacious Earring",
        body = ArtifactBody,
        hands = LeylineGloves.FC,
        legs = EschiteCuisses.FC,
        feet = OdysseanGreaves.FC,
        waist = "Chuq'aba Belt",
        back = RudianosMantle.FC
    })
    
    sets.Enlight = {
        ammo = "Impatiens",
        head = "Jumalik Helm",
        body = ArtifactBody,
        hands = "Eschite Gauntlets",
        legs = FoundersHose.SpellIntRate,
        feet = OdysseanGreaves.FC,
        neck = "Incanter's Torque",
        waist = "Asklepian Belt",
        left_ear = "Knightly Earring",
        right_ear = "Beatific Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Boxer's Mantle",
    }
    
    sets.Banish = {
        ammo = "Impatiens",
        head = "Jumalik Helm",
        body = ArtifactBody,
        hands = "Eschite Gauntlets",
        legs = FoundersHose.SpellIntRate,
        feet = OdysseanGreaves.FC,
        neck = "Incanter's Torque",
        waist = "Asklepian Belt",
        left_ear = "Lifestorm Earring",
        right_ear = "Psystorm Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Boxer's Mantle",
    }
    
    sets.Holy = {
        ammo = "Impatiens",
        head = "Jumalik Helm",
        body = ArtifactBody,
        hands = "Eschite Gauntlets",
        legs = FoundersHose.SpellIntRate,
        feet = OdysseanGreaves.FC,
        neck = "Incanter's Torque",
        waist = "Asklepian Belt",
        left_ear = "Lifestorm Earring",
        right_ear = "Psystorm Earring",
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = "Boxer's Mantle",
    }
end

function init_melee_sets()
    sets.Engaged = {}
    sets.Normal = {
        name = "Sword 'n' Board Normal",
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Sulevia's Plate. +1",
        hands = "Sulev. Gauntlets +1",
        legs = "Sulev. Cuisses +2",
        feet = "Loyalist Sabatons",
        neck = "Asperity Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Rajas Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.Acc1100 = {
        name = "Sword 'n' Board Acc1100",
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Sulevia's Plate. +1",
        hands = "Sulev. Gauntlets +1",
        legs = CarmineCuisses.DW,
        feet = "Flam. Gambieras +1",
        neck = "Lissome Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Cacoethic Ring",
        right_ring = "Supershear Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.DW = {
        name = "Dual Wield Normal",
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Flamma Korazin +1",
        hands = "Sulev. Gauntlets +1",
        legs = CarmineCuisses.DW,
        feet = "Carmine greaves +1",
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Petrov Ring",
        right_ring = "Rajas Ring",
        back = RudianosMantle.DPS,
    }
    
    sets.DWAcc1100 = {
        name = "Dual Wield Acc1100",
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Flamma Korazin +1",
        hands = "Sulev. Gauntlets +1",
        legs = CarmineCuisses.DW,
        feet = "Carmine greaves +1",
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Cacoethic Ring",
        right_ring = "Supershear Ring",
        back = RudianosMantle.DPS,
    }
    
end

function init_idle_sets()
    
    sets.idlePDT = sets.PDT
    sets.idleMDT = sets.MDTNoShell
    sets.idleMEVA = sets.MEVA
    sets.idleRefresh = {
        name = "Idle Refresh",
        ammo = "Homiliary",
        head = "Valorous Mask",
        body = ArtifactBody,
        hands = SouveranHands.PDT,
        legs = CarmineCuisses.DW,
        feet = "Sulev. Leggings +1",
        neck = "Coatl Gorget +1",
        waist = "Chuq'aba Belt",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Paguroidea Ring",
        right_ring = "Sheltered Ring",
        back = "Xucau Mantle",
    }
    sets.IdleTown =
    set_combine(sets.idleRefresh, {
        name = "Idle Town",
        body = "Councilor's Garb"
    })
    sets.Idle = idleRefresh
end
