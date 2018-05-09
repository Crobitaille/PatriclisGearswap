function init_gear_sets()
    init_equipment_variables()
    init_misc_sets()
end

function init_equipment_variables()
    sets.BlueMagic = {}
    
    RosmertasCape = {}
    RosmertasCape.TP = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%', }}
    RosmertasCape.WS = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon Skill Damage+10', }}
    
    AyanmoHead = {"Ayanmo Zucchetto +2"}
    AyanmoBody = {"Ayanmo Corazza +1"}
    AyanmoHands = {"Ayanmo Manopolas +1"}
    AyanmoLegs = {"Ayanmo Cosciales +1"}
    AyanmoFeet = {"Ayanmo Gambieras +1"}
    
    JhakriHead = {"Jhakri Coronal +1"}
    JhakriBody = {"Jhakri Robe +1"}
    JhakriHands = {"Jhakri Cuffs +1"}
    JhakriLegs = {"Jhakri Slops +1"}
    JhakriFeet = {"Jhakri Pigaches +1"}
    
    ArtifactHead = {"Magus Keffiyeh"}
    ArtifactBody = {"Magus Jubbah"}
    ArtifactHands = {"Magus Bazubands"}
    ArtifactLegs = {"Magus Shalwar"}
    ArtifactFeet = {"Magus Charuqs"}
    
    RelicHead = {"Mirage Keffiyeh"}
    RelicBody = {"Mirage Jubbah"}
    RelicHands = {"Mirage Bazubands"}
    RelicLegs = {"Mirage Shalwar"}
    RelicFeet = {"Luhlaza Charuqs"}
    
    EmpyreanHead = {}
    EmpyreanBody = {"Hashishin Mintan"}
    EmpyreanHands = {"Hashishin Bazubands"}
    EmpyreanLegs = {}
    EmpyreanFeet = {}
    
    AdhemarHead = {}
    AdhemarHead.Accuracy = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHead.Attack = {name = "Adhemar Bonnet", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    AdhemarBody = {}
    AdhemarBody.Accuracy = {}
    AdhemarBody.Attack = {}
    
    AdhemarHands = {}
    AdhemarHands.TP = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    AdhemarHands.Weaponskill = {name = "Adhemar Wristbands", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}}
    
    Colada = {name = "Colada"}
end


function init_misc_sets()
    sets.weapons.melee = {
        main="Sequence",
        sub=Colada
    }
    
    sets.weapons.magic = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel"
    }
end