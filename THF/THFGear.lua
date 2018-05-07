function LoadGearSets()
    Sets = {}
    
end

function InitItemVariables()
    
    AdhemarHead = {}
    AdhemarHead.Accuracy = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15', }}
    
    AdhemarHands = {}
    AdhemarHands.Accuracy = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15', }}
    
    RawhideBody = {}
    RawhideBody.TripleAttack = {name = "Rawhide Vest", augments = {'HP+50', '"Subtle Blow"+7', '"Triple Atk."+2', }}
    
    SamnuhaTights = {name = "Samnuha Tights", augments = {'STR+7', '"Dbl.Atk."+2', '"Triple Atk."+1', }}
    
    QaaxoFeet = {}
    QaaxoFeet.DoubleAttack = {name = "Qaaxo Leggings", augments = {'Attack+15', 'Evasion+15', '"Dbl.Atk."+2', }}
    
    ToutatisCape = {}
    ToutatisCape.DoubleAttack = {name = "Toutatis's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10', }}
    
end

function InitWeaponskillSets()
    Sets.Weaponskill = {}
    
    Sets.Weaponskill["Rudra's Storm"] = {
        
    }
    
    Sets.Weaponskill["Evisceration"] = {
        
    }
    
    Sets.Weaponskill["Shark Bite"] = {
        
    }
    
    Sets.Weaponskill["Mandalic Stab"] = {
        
    }
    
    Sets.Weaponskill["Exenterator"] = {
        
    }
    
    Sets.Weaponskill["Dancing Edge"] = {
        
    }
    
    Sets.Weaponskill["Aeolean Edge"] = {
        
    }
end

function InitAbilitySets()
    Sets.Ability = {}
    
    Sets.Ability["Perfect Dodge"] = {}
    
    Sets.Ability["Steal"] = {}
    
    Sets.Ability["Sneak Attack"] = {}
    
    Sets.Ability["Flee"] = {}
    
    Sets.Ability["Trick Attack"] = {}
    
    Sets.Ability["Mug"] = {}
    
    Sets.Ability["Hide"] = {}
    
    Sets.Ability["Accomplice"] = {}
    
    Sets.Ability["Collaborator"] = {}
    
    Sets.Ability["Assassin's Charge"] = {}
    
    Sets.Ability["Feint"] = {}
    
    Sets.Ability["Despoil"] = {}
    
    Sets.Ability["Conspirator"] = {}
    
    Sets.Ability["Bully"] = {}
    
    Sets.Ability["Larceny"] = {}
    
    Sets.Ability.Waltz = {}
    
    Sets.Ability.SelfWaltz = {}
end

function InitEngagedSets()
    Sets.Engaged = {}
    
    Sets.Engaged.DualWield = {}
    
    Sets.Engaged.DualWield[0] = {
        ammo = "Ginsen",
        head = AdhemarHead,
        body = RawhideBody,
        hands = AdhemarHands,
        legs = SamnuhaTights,
        feet = QaaxoFeet,
        neck = "Asperity Necklace",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Brutal Earring",
        left_ring = "Epona's Ring",
        right_ring = "Hetairoi Ring",
        back = ToutatisCape
    }
    
    Sets.Engaged.DualWield[5] = {
        
    }
    
    Sets.Engaged.DualWield[10] = {}
    
    Sets.Engaged.DualWield[15] = {}
    
    Sets.Engaged.DualWield[20] = {}
    
    Sets.Engaged.DualWield[25] = {}
    
    Sets.Engaged.DualWield[30] = {}
    
    Sets.Engaged.DualWield[35] = {}
    
    Sets.Engaged.DualWield[40] = {}
    
    Sets.Engaged.DualWield[45] = {}
    
    Sets.Engaged.DualWield[50] = {}
    
end
