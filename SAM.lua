function get_sets()
    mote_include_version = 2
    include('organizer-lib')
    include('Mote-Include.lua')
end

function init_gear_sets()
    SmertriosMantle = {}
    SmertriosMantle.WS = {name = "Smertrios's Mantle", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%',}}

    sets.engaged = {
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Flamma Korazin +1",
        hands = "Flam. Manopolas +1",
        legs = "Hiza. Hizayoroi +1",
        feet = "Flam. Gambieras +1",
        neck = "Lissome Necklace",
        waist = "Cetl Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Flamma Ring",
        back = "Takaha Mantle",
    }

    sets.precast.WS = {
        ammo = "Seething Bomblet",
        head = "Valorous Mask",
        body = "Flamma Korazin +1",
        hands = "Flam. Manopolas +1",
        legs = "Hiza. Hizayoroi +1",
        feet = "Flam. Gambieras +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Flamma Ring",
        back = SmertriosMantle.WS,
    }

    sets.idle = {
        ammo = "Ginsen",
        head = "Flam. Zucchetto +2",
        body = "Flamma Korazin +1",
        hands = "Flam. Manopolas +1",
        legs = "Hiza. Hizayoroi +1",
        feet = "Danzo Sune-ate",
        neck = "Asperity Necklace",
        waist = "Cetl Belt",
        left_ear = "Brutal Earring",
        right_ear = "Telos Earring",
        left_ring = "Petrov Ring",
        right_ring = "Flamma Ring",
        back = "Takaha Mantle",
    }

    sets.precast.JA.Meditate = {head = "Myochin Kabuto", hands = "Saotome Kote", back = SmertriosMantle.WS}
end

function precast(spell)

end
