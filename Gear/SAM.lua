function load_gear_sets()
    load_vars()
    load_common_gear()
    load_utility()
    load_skillchain()
    load_precast()
    load_midcast()
    load_engaged()
    load_idle()
end

function load_vars()
    TakahaMantle = {name = "Takaha Mantle", augments = {'STR+3', '"Zanshin"+2', '"Store TP"+2', 'Meditate eff. dur. +6', }}
    
    SmertriosMantle = {}
    SmertriosMantle.WSD = {name = "Smertrios's Mantle", augments = {'STR+20', 'Accuracy+20', 'Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
end

function load_utility()
    sets.skillchain = {}
    
    sets.reive = {neck = "Ygnas's Resolve +1"}
end

function load_skillchain()
sets.skillchain = {}
sets.skillchain["Tachi: Kasha"] = {
    sub = "Utu Grip",
    ammo = "Knobkierrie",
    head = FlammaHead,
    body = FlammaBody,
    hands = FlammaHands,
    legs = HizamaruLegs,
    feet = FlammaFeet,
    neck = "Asperity Necklace",
    waist = "Chuq'aba Belt",
    left_ear = "Brutal Earring",
    right_ear = "Telos Earring",
    left_ring = "Petrov Ring",
    right_ring = "Hetairoi Ring",
    back = SmertriosMantle.WSD
}
end

function load_precast()
    sets.precast = {}

    sets.precast["Tachi: Kasha"] = {
    sub = "Utu Grip",
    ammo = "Knobkierrie",
    head = FlammaHead,
    body = FlammaBody,
    hands = FlammaHands,
    legs = HizamaruLegs,
    feet = FlammaFeet,
    neck = "Asperity Necklace",
    waist = "Chuq'aba Belt",
    left_ear = "Brutal Earring",
    right_ear = "Telos Earring",
    left_ring = "Petrov Ring",
    right_ring = "Hetairoi Ring",
    back = SmertriosMantle.WSD
}
end

function load_midcast()
    sets.midcast = {}
end

function load_engaged()
    sets.engaged = {}
    
    sets.engaged["4Hit"] = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = FlammaHead,
        body = FlammaBody,
        hands = FlammaHands,
        legs = HizamaruLegs,
        feet = FlammaFeet,
        neck = "Asperity Necklace",
        waist = "Chuq'aba Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Hetairoi Ring",
        back = TakahaMantle
    }
    
    sets.engaged["5Hit"] = {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
        head = FlammaHead,
        body = FlammaBody,
        hands = FlammaHands,
        legs = HizamaruLegs,
        feet = FlammaFeet,
        neck = "Asperity Necklace",
        waist = "Chuq'aba Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Hetairoi Ring",
        back = TakahaMantle
    }
    
    sets.engaged["Seigan"] = {}
    sets.engaged["PDT"] = {}
    sets.engaged["MDT"] = {}
    sets.engaged["MEVA"] = {}
    
end

function load_idle()
    sets.idle = {}
    
    sets.idle["Default"] = {}
    
    sets.idle["PDT"] = {}
    
    sets.idle["MDT"] = {}
    
    sets.idle["MEVA"] = {}
end
