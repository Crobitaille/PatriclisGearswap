function load_gear_sets()
    load_vars()
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
    
    RelicHead = ""
    RelicBody = ""
    RelicHands = "Plunderer's Armlets"
    RelicLegs = ""
    RelicFeet = ""
    
    EmpyreanHead = ""
    EmpyreanBody = ""
    EmpyreanHands = ""
    EmpyreanLegs = ""
    EmpyreanFeet = "Skulker's Poulaines +1"
    
    MeghanadaHead = ""
    MeghanadaBody = ""
    MeghanadaHands = ""
    MeghanadaLegs = ""
    MeghanadaFeet = ""
    
    MummuHead = ""
    MummuBody = ""
    MummuHands = ""
    MummuLegs = ""
    MummuFeet = ""
    
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
    
    SamnuhaTights = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1', }}
    
    HerculeanLegs = {}
    HerculeanLegs.TP = {name = "Herculean Trousers"}
    
    HerculeanFeet = {}
    HerculeanFeet.TP = {name = "Herculean Boots", augments = {'Accuracy+15 Attack+15', '"Triple Atk."+3', 'AGI+10', 'Accuracy+9', }}
    HerculeanFeet.CDC = {name = "Herculean Boots", augments = {'Accuracy+18 Attack+18', 'Crit. hit damage +3%', 'DEX+9', 'Attack+11', }}
    
    HerculeanHead = {}
    HerculeanHead.Savage = {name = "Herculean Helm", augments = {'Accuracy+1', 'Weapon skill damage +4%', 'INT+4', 'Attack+10', }}
    
    QaaxoFeet = {}
    QaaxoFeet.DoubleAttack = {name = "Qaaxo Leggings", augments = {'Attack+15', 'Evasion+15', '"Dbl.Atk."+2', }}
    
    ToutatisCape = {}
    ToutatisCape.DoubleAttack = {name = "Toutatis's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10', }}
    
    CapacityCape = {name = "Mecisto. Mantle", augments = {'Cap. Point+25%', 'MND+1', 'DEF+3', }}
end

function load_utility()
    sets.TreasureHunter = {
        hands = RelicHands, 
        feet = EmpyreanFeet
    }
    
    
end

function load_precast()
    sets.precast = {}

    sets.precast["Rudra's Storm"] = {
        
    }
    
    sets.precast["Evisceration"] = {
        
    }
    
    sets.precast["Shark Bite"] = {
        
    }
    
    sets.precast["Mandalic Stab"] = {
        
    }
    
    sets.precast["Exenterator"] = {
        
    }
    
    sets.precast["Dancing Edge"] = {
        
    }
    
    sets.precast["Aeolean Edge"] = {
        
    }

    sets.precast["Perfect Dodge"] = {}
    
    sets.precast["Steal"] = {}
    
    sets.precast["Sneak Attack"] = {}
    
    sets.precast["Flee"] = {}
    
    sets.precast["Trick Attack"] = {}
    
    sets.precast["Mug"] = {}
    
    sets.precast["Hide"] = {}
    
    sets.precast["Accomplice"] = {}
    
    sets.precast["Collaborator"] = {}
    
    sets.precast["Assassin's Charge"] = {}
    
    sets.precast["Feint"] = {}
    
    sets.precast["Despoil"] = {}
    
    sets.precast["Conspirator"] = {}
    
    sets.precast["Bully"] = {}
    
    sets.precast["Larceny"] = {}
    
    sets.precast.Waltz = {}
    
    sets.precast.SelfWaltz = {}
end

function load_midcast()
end

function load_engaged()
    sets.engaged = {}
end

function load_idle()
end
