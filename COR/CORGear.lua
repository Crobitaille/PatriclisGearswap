-- Sets. = {
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

function LoadGearSets()
    Sets = {}
    
    init_wskill_Sets()
    init_idle_Sets()
    init_precast_Sets()
    init_ranged_Sets()
    init_ability_Sets()
    init_engaged_Sets()
    init_utility_Sets()
end

function variables()
    
    MeghanadaHead = "Meghanada visor +1"
    MeghanadaBody = "Meghanada cuirie +1"
    MeghanadaHands = "Meghanada gloves +1"
    MeghanadaLegs = "Meghanada chausses +1"
    MeghanadaFeet = "Meghanada jambeaux +1"
    
    ArtifactHead = ""
    ArtifactBody = ""
    ArtifactHands = ""
    ArtifactLegs = ""
    ArtifactFeet = ""
    
    RelicHead = "Commodore Tricorne"
    RelicBody = ""
    RelicHands = ""
    RelicLegs = ""
    RelicFeet = ""
    
    EmpyreanHead = ""
    EmpyreanBody = ""
    EmpyreanHands = "Navarch's gants +2"
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
    
    CarmineLegs = {}
    CarmineLegs.Accuracy = {name = "Carmine Cuisses +1", augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6', }},
    
    CarmineFeet = {}
    CarmineFeet.Accuracy = {name = "Carmine Greaves +1"}
    
    LeylineGloves = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3', }}
    
    SamnuhaCoat = {name = "Samnuha Coat", augments = {'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+5', '"Dual Wield"+5', }}
    
    HerculeanFeet = {}
    HerculeanFeet.TP = {name = "Herculean Boots", augments = {'Accuracy+15 Attack+15', '"Triple Atk."+3', 'AGI+10', 'Accuracy+9', }}
    HerculeanFeet.CDC = {name = "Herculean Boots", augments = {'Accuracy+15 Attack+15', '"Triple Atk."+3', 'AGI+10', 'Accuracy+9', }}
    
    HerculeanHead = {}
    HerculeanHead.Savage = {name = "Herculean Helm", augments = {'Accuracy+1', 'Weapon skill damage +4%', 'INT+4', 'Attack+10', }}
    
    RawhideBody = {}
    RawhideBody.TP = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }}
    
    SamnuhaLegs = {}
    SamnuhaLegs = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1', }}
    
end

function init_wskill_Sets()
    
    Sets.wskill = {}
    
    Sets.leaden = {
        head = "Pixie Hairpin +1",
        body = {name = "Samnuha Coat", augments = {'Mag. Acc.+13', '"Mag.Atk.Bns."+14', '"Fast Cast"+3', '"Dual Wield"+4', }},
        hands = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3', }},
        legs = "Meg. Chausses +1",
        feet = {name = "Taeon Boots", augments = {'Accuracy+11', }},
        neck = "Sanctity Necklace",
        waist = "Salire Belt",
        left_ear = "Friomisi Earring",
        right_ear = "Hecate's Earring",
        left_ring = "Acumen Ring",
        right_ring = "Vertigo Ring",
        back = "Gunslinger's Cape",
    }
    
    Sets.last_stand = {}
    
    Sets.wildfire = {}
    
    Sets.savage_blade = {}
    
    Sets.requiescat = {}
end

function init_idle_Sets()
    Sets.idle = {}
    
    Sets.idleStandard = {
        head = "Meghanada Visor +1",
        body = "Meghanada Cuirie +1",
        hands = "Meg. Gloves +1",
        legs = {name = "Carmine Cuisses +1", augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6', }},
        feet = "Meg. Jam. +1",
        neck = "Bathy Choker +1",
        waist = "Flume Belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = {name = "Dark Ring", augments = {'Phys. dmg. taken -5%', 'Breath dmg. taken -4%', }},
        back = "Solemnity Cape",
    }
    
    Sets.idle_main = {}
    
    Sets.idle_mdt = {}
    
    Sets.idle_pdt = {
        head = "Meghanada Visor +1",
        body = "Meghanada Cuirie +1",
        hands = "Meg. Gloves +1",
        legs = {name = "Carmine Cuisses +1", augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6', }},
        feet = "Meg. Jam. +1",
        neck = "Bathy Choker +1",
        waist = "Flume Belt",
        left_ear = "Merman's Earring",
        right_ear = "Merman's Earring",
        left_ring = "Vocane Ring",
        right_ring = {name = "Dark Ring", augments = {'Phys. dmg. taken -5%', 'Breath dmg. taken -4%', }},
        back = "Solemnity Cape",
    }
end

function init_precast_Sets()
    Sets.precast_generic = {}
    
    Sets.precast_shadows = {}
    
    Sets.snapshot = {}
end

function init_ranged_Sets()
    Sets.ranged = {}
    
    Sets.ranged_acc = {}
    
    Sets.ranged_dmg = {}
end

function init_ability_Sets()
    Sets['Phantom Roll'] = {
        ring1 = "Barataria Ring",
        ring2 = "Luzaf's Ring"
    }
    
    Sets.Quickdraw = {
        head = "Taeon Chapeau"
    }
    
    Sets.QuickdrawMacc = {}
    
    Sets['Wild Card'] = {}
    Sets['Random Deal'] = {}
    Sets['Fold'] = {}
    Sets['Triple Shot'] = {}
    Sets['Snake Eye'] = {}
    Sets['Crooked Cards'] = {}
    Sets['Cutting Cards'] = {}
    
    Sets['Curing Waltz'] = {}
    Sets['Self Curing Waltz'] = {}
    
    Sets['Animated Flourish'] = {}
    
    Sets['Step'] = {}
    
end

function init_engaged_Sets()
    Sets.engaged = {}
    Sets.TP = {
        name = "TP",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TP
        hands = AdhemarHands.TP,
        legs = SamnuhaLegs
        feet = CarmineFeet
        neck = "Asperity Necklace",
        waist = "Kentarch Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = "Relucent cape",
    }
    Sets.DW = {
        name = "DW",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TP
        hands = AdhemarHands.TP,
        legs = SamnuhaLegs
        feet = CarmineFeet
        neck = "Asperity Necklace",
        waist = "Kentarch Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = "Relucent cape",
    }
    Sets.DWII = {
        name = "DWII",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TP
        hands = AdhemarHands.TP,
        legs = SamnuhaLegs
        feet = CarmineFeet
        neck = "Asperity Necklace",
        waist = "Reiki Yotai",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Rajas Ring",
        right_ring = "Epona's Ring",
        back = "Relucent cape",
    }
    
    Sets.one_weapon = {
        name = "one_weapon",
    }
    Sets.one_weapon_1100 = {
        name = "one_weapon1100",
    }
    Sets.one_weapon_1200 = {
        name = "one_weapon1200",
    }
    
    Sets.dual_wieldII = {
        name = "dual_wieldII",
        head = AdhemarHead.Accuracy,
        body = RawhideBody.TP
        hands = AdhemarHands.TP,
        legs = SamnuhaLegs
        feet = CarmineFeet
        neck = "Lissome Necklace",
        waist = "Reiki Yotai",
        left_ear = "Suppanomimi",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "Atheling Mantle",
    }
    Sets.dual_wieldII_1100 = {
        name = "dual_wieldII_1100",
    }
    Sets.dual_wieldII_1200 = {
        name = "dual_wieldII_1200",
    }
    
    Sets.dual_wieldIII = {
        name = "dual_wieldIII",
    }
    Sets.dual_wieldIII_1100 = {
        name = "dual_wieldIII_1100",
    }
    Sets.dual_wieldIII_1200 = {
        name = "dual_wieldIII_1200",
    }
end

function init_utility_Sets()
    Sets.FastPants = {
        legs = "Carmine Cuisses +1"
    }
    
    Sets.weather = {
        waist = "Hachirin-no-obi"
    }
    
    Sets.recast = {}
end
