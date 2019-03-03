function load_gear_sets()
    load_vars()
    load_common_gear()
    load_utility()
    load_precast()
    load_midcast()
    load_engaged()
    load_idle()
end

function load_vars()
    ArtifactHead = ""
    ArtifactBody = ""
    ArtifactHands = ""
    ArtifactLegs = ""
    ArtifactFeet = ""
    
    RelicHead = "Lanun Tricorne"
    RelicBody = ""
    RelicHands = ""
    RelicLegs = ""
    RelicFeet = ""
    
    EmpyreanHead = "Nvrch. Tricorne +1"
    EmpyreanBody = ""
    EmpyreanHands = "Chasseur's Gants +1"
    EmpyreanLegs = ""
    EmpyreanFeet = "Nvrch. Bottes +1"
    
    CamulusMantle = {}
    CamulusMantle.TP = {name = "Camulus's Mantle", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+8', '"Dbl.Atk."+10', 'Damage taken-5%', }}
    CamulusMantle.MagicWSD = {name = "Camulus's Mantle", augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', }}
    CamulusMantle.PhysWSD = {name = "Camulus's Mantle", augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', }}
    
    GunslingerCape = {name = "Gunslinger's Cape", augments = {'Enmity-1', '"Mag.Atk.Bns."+5', '"Phantom Roll" ability delay -2', }}
end

function load_utility()
end

function load_precast()
    sets.precast = {}
    
    sets.precast["Ranged Attack"] = {
        head=EmpyreanHead,
        body="Mirke Wardecors",
        hands="Carmine Fin. Ga.",
        feet=MeghanadaFeet,
        waist="Impulse Belt",
        back="Navarch's Mantle",
    }
    
    sets.precast["Wild Card"] = {
        feet = RelicFeet
    }
    
    --CorsairRoll == Phantom Roll
    sets.precast["CorsairRoll"] = {
        head = RelicHead,
        hands = EmpyreanHands,
        left_ring = "Barataria Ring",
        right_ring = "Luzaf's Ring",
        back = CamulusMantle.TP
    }
    
    sets.precast["Double Up"] = sets.precast["CorsairRoll"]
    
    --CorsairShot == QuickDraw
    sets.precast["CorsairShot"] = {
        head = HerculeanHead.WSD,
        neck = "Sanctity Necklace",
        left_ear = "Friomisi Earring",
        right_ear = "Hecate's Earring",
        body = "Mirke Wardecors",
        hands = LeylineGloves,
        left_ring = "Apate Ring",
        right_ring = "Acumen Ring",
        back = GunslingerCape,
        waist = "Salire Belt",
        legs = {name = "Herculean Trousers", augments = {'Weapon skill damage +3%', 'Pet: STR+9', 'Mag. Acc.+4 "Mag.Atk.Bns."+4', }},
        feet = EmpyreanFeet
    }

    sets.precast["Random Deal"] = {}
    sets.precast["Snake Eye"] = {}
    sets.precast["Fold"] = {}
    sets.precast["Triple Shot"] = {}
    sets.precast["Crooked Cards"] = {}
    sets.precast["Cutting Cards"] = {}
    
    sets.precast.utsusemi = {}
    sets.precast.waltz = {}
    sets.precast.waltz.self = {}
    
    sets.precast["Light Shot"] = {}
    
    sets.precast["Dark Shot"] = set_combine(sets.precast["Light Shot"], {
        head = "Pixie Hairpin +1"
    })
    
    sets.precast["WeaponSkill"] = {
        head = HerculeanHead.WSD,
        neck = "Asperity Necklace",
        left_ear = MoonshadeEarring,
        right_ear = "Brutal Earring",
        body = MeghanadaBody,
        hands = MeghanadaHands,
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = CamulusMantle.PhysWSD,
        waist = "Grunfeld Rope",
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TripleAttack
    }
    
    sets.precast["Savage Blade"] = {
        head = HerculeanHead.WSD,
        neck = "Asperity Necklace",
        left_ear = MoonshadeEarring,
        right_ear = "Brutal Earring",
        body = MeghanadaBody,
        hands = MeghanadaHands,
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = CamulusMantle.PhysWSD,
        waist = "Grunfeld Rope",
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TripleAttack
    }
    
    sets.precast["Leaden Salute"] = {
        head = HerculeanHead.WSD,
        neck = "Sanctity Necklace",
        left_ear = MoonshadeEarring,
        right_ear = "Friomisi Earring",
        body = SamnuhaCoat,
        hands = LeylineGloves,
        left_ring = "Apate Ring",
        right_ring = "Acumen Ring",
        back = CamulusMantle.MagicWSD,
        waist = "Salire Belt",
        legs = {name = "Herculean Trousers", augments = {'Weapon skill damage +3%', 'Pet: STR+9', 'Mag. Acc.+4 "Mag.Atk.Bns."+4', }},
        feet = HerculeanFeet.TripleAttack
    }
    
    sets.precast["Wildfire"] = {
        -- head = "",
        -- neck = "",
        -- left_ear = "",
        -- right_ear = "",
        -- body = "",
        -- hands = "",
        -- left_ring = "",
        -- right_ring = "",
        -- back = CamulusMantle.MagicWSD,
        -- waist = "",
        -- legs = "",
        -- feet = ""
    }
    
    sets.precast["Last Stand"] = {
        head = MeghanadaHead,
        neck = "Fotia Gorget",
        left_ear = MoonshadeEarring,
        right_ear = "Telos Earring",
        body = MeghanadaBody,
        hands = MeghanadaHands,
        left_ring = "Apate Ring",
        right_ring = "Solemn Ring",
        back = CamulusMantle.PhysWSD,
        waist = "Fotia Belt",
        legs = MeghanadaLegs,
        feet = MeghanadaFeet
    }
end

function load_midcast()
    sets.midcast = {}
    
    sets.midcast["Ranged Attack"] = {
        head=MeghanadaHead,
        body=MummuBody,
        hands=AdhemarHands.PathA,
        legs=SamnuhaTights,
        feet=MeghanadaFeet,
        neck="Lissome Necklace",
        waist="Kentarch Belt +1",
        left_ear="Enervating Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Rajas Ring",
        back=GunslingerCape,
    }
    
    sets.midcast.utsusemi = {}
end

function load_engaged()
    sets.engaged = {}
    sets.engaged["DW0"] = {
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Lissome Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "CamulusMantle.TP",
    }
    sets.engaged["DW7"] = {
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "CamulusMantle.TP",
    }
    sets.engaged["DW11-Acc"] = {
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = CarmineLegs.PathD,
        feet = HerculeanFeet.TripleAttack,
        neck = "Lissome Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Suppanomimi",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "CamulusMantle.TP",
    }
    sets.engaged["DW12"] = {
        head = AdhemarHead.PathA,
        body = RawhideBody.PathD,
        hands = AdhemarHands.PathA,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TripleAttack,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Suppanomimi",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "CamulusMantle.TP",
    }
    
    -- sets.engaged["ACC1200"] = sets.engaged["DW0"]
    -- sets.engaged["ACC1300"] = sets.engaged["DW0"]
    sets.engaged["PDT"] = {
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TripleAttack,
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "CamulusMantle.TP",
    }
    
    sets.engaged["MDT"] = {
        head = DampeningTam,
        body = "Onca Suit",
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Etiolation Earring",
        right_ear = "Merman's Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "Solemnity Cape",
    }
    
    sets.engaged["MEVA"] = {
        head = HerculeanHead.WSD,
        body = "Passion Jacket",
        hands = LeylineGloves,
        legs = SamnuhaTights,
        feet = "Jute Boots +1",
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Volunt. Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "Solemnity Cape",
    }
end

function load_idle()
    sets.idle = {}
    
    sets.idle["Default"] = {
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = "Umuthi Gloves",
        legs = "Carmine Cuisses +1",
        feet = HerculeanFeet.TripleAttack,
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "CamulusMantle.TP",
    }
    
    sets.idle.town = {body = "Councilor's Garb"}
    
    sets.idle["PDT"] = {
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TripleAttack,
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "CamulusMantle.TP",
    }
    
    sets.idle["MDT"] = {
        head = DampeningTam,
        body = "Onca Suit",
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Etiolation Earring",
        right_ear = "Merman's Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "CamulusMantle.TP",
    }
    
    sets.idle["MEVA"] = {
        head = HerculeanHead.Savage,
        body = "Passion Jacket",
        hands = LeylineGloves,
        legs = SamnuhaTights,
        feet = "Jute Boots +1",
        neck = "Twilight Torque",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Volunt. Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "CamulusMantle.TP",
    }
end
