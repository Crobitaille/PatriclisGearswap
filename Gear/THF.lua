function load_gear_sets()
    load_vars()
    load_utility()
    load_precast()
    load_midcast()
    load_engaged()
    load_idle()
    
end

function load_vars()
    ArtifactHead = "Rogue's Bonnet"
    ArtifactBody = "Rogue's Vest"
    ArtifactHands = "Rogue's Armlets +1"
    ArtifactLegs = "Rogue's Culottes"
    ArtifactFeet = "Rogue's Poulaines"
    
    RelicHead = "Assassin's Bonnet"
    RelicBody = "Assassin's Vest"
    RelicHands = "Plunderer's Armlets"
    RelicLegs = "Assassin's Culottes"
    RelicFeet = "Assassin's Poulaines"
    
    EmpyreanHead = "Raider's Bonnet +2"
    EmpyreanBody = "Raider's Vest +2"
    EmpyreanHands = "Raider's Armlets +2"
    EmpyreanLegs = "Raider's Culottes +2"
    EmpyreanFeet = "Skulker's Poulaines +1"
    
    MeghanadaHead = "Meghanada Visor +1"
    MeghanadaBody = "Meghanada Cuirie +1"
    MeghanadaHands = "Meghanada Gloves +1"
    MeghanadaLegs = "Meghanada Chausses +1"
    MeghanadaFeet = "Meghanada Jambeaux +1"
    
    MummuHead = "Mummu Bonnet +1"
    MummuBody = "Mummu Jacket +1"
    MummuHands = "Mummu Wrists +1"
    MummuLegs = "Mummu Kecks +1"
    MummuFeet = "Mummu Gamashes +1"
    
    AdhemarHead = {}
    AdhemarHead.Accuracy = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHead.Attack = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    AdhemarBody = {}
    AdhemarBody.Accuracy = {}
    AdhemarBody.Attack = {}
    
    AdhemarHands = {}
    AdhemarHands.TP = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHands.Weaponskill = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    RawhideBody = {}
    RawhideBody.TripleAttack = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }}
    
    SamnuhaCoat = {name = "Samnuha Coat", augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+5', '"Dual Wield"+5', }}
    
    SamnuhaTights = {name = "Samnuha Tights", augments = {'STR+9', 'DEX+8', '"Dbl.Atk."+2', '"Triple Atk."+2', }}
    
    FloralGauntlets = {name = "Floral Gauntlets", augments = {'Rng.Acc.+11', 'Accuracy+5', '"Triple Atk."+2', }}
    
    DampeningTam = {name = "Dampening Tam", augments = {'DEX+1', 'Accuracy+7', 'Mag. Acc.+5', }}
    
    HerculeanLegs = {}
    HerculeanLegs.TP = {name = "Herculean Trousers"}
    HerculeanLegs.WS = { name="Herculean Trousers", augments={'Weapon skill damage +3%','Pet: STR+9','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
    
    HerculeanFeet = {}
    HerculeanFeet.TP = {name = "Herculean Boots", augments = {'Accuracy+15 Attack+15', '"Triple Atk."+3', 'AGI+10', 'Accuracy+9', }}
    HerculeanFeet.Rudras = {name = "Herculean Boots", augments = {'Accuracy+18 Attack+18', 'Crit. hit damage +3%', 'DEX+9', 'Attack+11', }}
    
    HerculeanHead = {}
    HerculeanHead.Savage = {name = "Herculean Helm", augments = {'Accuracy+1', 'Weapon skill damage +4%', 'INT+4', 'Attack+10', }}

    QaaxoFeet = {}
    QaaxoFeet.DoubleAttack = {name = "Qaaxo Leggings", augments = {'Attack+15', 'Evasion+15', '"Dbl.Atk."+2', }}
    
    RawhideFeet = {}
    RawhideFeet.DW = {name = "Rawhide Boots", augments = {'STR+10', 'Attack+15', '"Store TP"+5', }}
    
    CapacityCape = {name = "Mecisto. Mantle", augments = {'Cap. Point+25%', 'MND+1', 'DEF+3', }}
    
    ToutatisCape = {}
    ToutatisCape.TP = {name = "Toutatis's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10', }}
end

function load_utility()
    sets.TreasureHunter = {
        hands = RelicHands,
        feet = EmpyreanFeet
    }
    
    sets.Main = {
        main = {name = "Shijo", augments = {'DMG:+15', 'Accuracy+15', 'Attack+15', }},
        sub = {name = "Sandung", augments = {'Accuracy+50', 'Crit. hit rate+5%', '"Triple Atk."+3', }}
    }
    
end

function load_precast()
    sets.precast = {}
    
    sets.precast["Magic"] = {
        ammo = "Sapience Orb",
        head = "Haruspex Hat",
        body = SamnuhaCoat,
        hands = LeylineGloves,
        neck = "Voltsurge Torque",
        left_ear = "Etiolation Earring",
        right_ear = "Loquac. Earring",
        right_ring = "Prolix Ring",
    }
    
    sets.precast.utsusemi = set_combine(sets.precast.magic, {
        neck = "Magoraga Beads",
        body = "Passion Jacket"
    })
    
    sets.precast["WeaponSkill"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    
    sets.precast["Aeolian Edge"] = {
        ammo="Seething Bomblet",
        head=HerculeanHead.Savage,
        body=SamnuhaCoat,
        hands=MeghanadaHands,
        legs=HerculeanLegs.WS,
        feet=HerculeanFeet.Rudras,
        neck="Sanctity Necklace",
        waist="Salire Belt",
        left_ear="Hecate's Earring",
        right_ear="Friomisi Earring",
        left_ring="Acumen Ring",
        right_ring="Apate Ring",
        back=ToutatisCape.TP
    }

    sets.precast["Rudra's Storm"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = "Abnoba Kaftan",
        hands = MeghanadaHands,
        legs = MummuLegs,
        feet = HerculeanFeet.Rudras,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Apate Ring",
        back = ToutatisCape.TP,
    }
    
    sets.precast["Evisceration"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = "Abnoba Kaftan",
        hands = MummuHands,
        legs = MummuLegs,
        feet = HerculeanFeet.Rudras,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Mummu Ring",
        back = ToutatisCape.TP,
        
    }
    
    sets.precast["Shark Bite"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    
    sets.precast["Mandalic Stab"] = {
        ammo = "Jukukik Feather",
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    
    sets.precast["Exenterator"] = {
        ammo = "Seething Bomblet",
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    
    sets.precast["Perfect Dodge"] = {
        hands = RelicHands
    }
    
    sets.precast["Steal"] = {
        ammo = "Barathrum", --TODO: Get this
        neck = "Pentalagus charm", --TODO: Get this
        hands = AdhemarHands, --Thief's Kote would be better but would also drop ilvl. Not sure of the effect on steal accuracy
        legs = RelicLegs,
        feet = ArtifactFeet,
        
    }
    
    sets.precast["Sneak Attack"] = {
        hands = EmpyreanHands
    }
    
    sets.precast["Flee"] = {
        feet = ArtifactFeet
    }
    
    sets.precast["Trick Attack"] = {
        hands = ArtifactHands
    }
    
    sets.precast["Mug"] = {
        head = RelicHead
    }
    
    sets.precast["Hide"] = {
        body = ArtifactBody
    }
    
    sets.precast["Accomplice"] = {
        head = EmpyreanHead
    }
    
    sets.precast["Collaborator"] = {
        head = EmpyreanHead
    }
    
    sets.precast["Assassin's Charge"] = {
        feet = RelicFeet
    }
    
    sets.precast["Feint"] = {
        legs = RelicLegs
    }
    
    sets.precast["Despoil"] = {
        legs = EmpyreanLegs,
        feet = EmpyreanFeet,
        ammo = "Barathrum" --TODO: Get this
    }
    
    sets.precast["Conspirator"] = {
        body = EmpyreanBody
    }
    
    sets.precast["Bully"] = {}
    
    sets.precast["Larceny"] = {}
    
    sets.precast.waltz = {
        ammo = "Ginsen",
        head = MeghanadaBody,
        body = "Passion Jacket",
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = "Jute Boots +1",
        neck = "Reti Pendant",
    }
    
    sets.precast.waltz.self = {
        ammo = "Ginsen",
        head = MummuHead,
        body = "Passion Jacket",
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = "Jute Boots +1",
        neck = "Reti Pendant",
        waist = "Warwolf Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Genmei Earring",
        left_ring = "Spiral Ring",
        right_ring = "Supershear Ring",
        back = "Engulfer Cape +1",
    }
end

function load_midcast()
    sets.midcast = {}
    sets.midcast.buff = {}
    sets.midcast.buff["Sneak Attack"] = {
        ammo = "Jukukik Feather",
        head = AdhemarHead.Accuracy,
        body = "Abnoba Kaftan",
        hands = MeghanadaHands,
        legs = MummuLegs,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Pixie Earring",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Petrov Ring",
        back = ToutatisCape.TP,
    }
    sets.midcast.buff["Trick Attack"] = {
        ammo = "Seething Bomblet",
        head = AdhemarHead.Accuracy,
        body = "Abnoba Kaftan",
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Asperity Necklace",
        waist = "Grunfeld Rope",
        left_ear = "Pixie Earring",
        right_ear = "Telos Earring",
        left_ring = "Apate Ring",
        right_ring = "Petrov Ring",
        back = ToutatisCape.TP,
    }
    --TODO: UTSUSEMI
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
        neck = "Lissome Necklace",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
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
        back = ToutatisCape.TP,
    }
    sets.engaged["DW12"] = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = AdhemarHands.TP,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TP,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    sets.engaged["DW17"] = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = FloralGauntlets,
        legs = SamnuhaTights,
        feet = HerculeanFeet.TP,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    sets.engaged["DW20"] = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TripleAttack,
        hands = FloralGauntlets,
        legs = SamnuhaTights,
        feet = RawhideFeet.DW,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    sets.engaged["DW25"] = {
        ammo = "Ginsen",
        head = AdhemarHead.Accuracy,
        body = SamnuhaCoat,
        hands = FloralGauntlets,
        legs = SamnuhaTights,
        feet = RawhideFeet.DW,
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Hetairoi Ring",
        right_ring = "Epona's Ring",
        back = ToutatisCape.TP,
    }
    -- sets.engaged["ACC1200"] = sets.engaged["DW0"]
    -- sets.engaged["ACC1300"] = sets.engaged["DW0"]
    sets.engaged["PDT"] = {
        ammo = "Ginsen",
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "Solemnity Cape",
    }
    
    sets.engaged["MDT"] = {
        ammo = "Vanir Battery",
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
        ammo = "Vanir Battery",
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
        back = "Solemnity Cape",
    }
end

function load_idle()
    sets.idle = {}
    
    sets.idle["Default"] = {
        ammo = "Ginsen",
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = "Umuthi Gloves",
        legs = MeghanadaLegs,
        feet = "Jute Boots +1",
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Genmei Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "Solemnity Cape",
    }
    
    sets.idle.town = {body = "Councilor's Garb"}
    
    sets.idle["PDT"] = {
        ammo = "Ginsen",
        head = MeghanadaHead,
        body = MeghanadaBody,
        hands = MeghanadaHands,
        legs = MeghanadaLegs,
        feet = HerculeanFeet.TP,
        neck = "Twilight Torque",
        waist = "Kentarch Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Defending Ring",
        right_ring = "Vocane Ring",
        back = "Solemnity Cape",
    }
    
    sets.idle["MDT"] = {
        ammo = "Vanir Battery",
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
    
    sets.idle["MEVA"] = {
        ammo = "Vanir Battery",
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
        back = "Solemnity Cape",
    }
    
end

