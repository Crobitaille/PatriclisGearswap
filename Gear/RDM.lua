function init_gear_sets()
    init_item_vars()
    init_precast_sets()
    init_utility_sets()
    init_job_ability_sets()
    init_healing_sets()
    init_enhancing_sets() 
    init_enfeeble_sets()
    init_elemental_sets()
    init_dark_sets()
    init_idle_sets()
end

function init_item_vars() 
    VanyaHood = {}
    VanyaHood.FC  = {name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%'}}
    VanyaHood.CMP  = {name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6'}}
    VanyaHood.CP = {name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6'}}

    VanyaRobe = {}
    VanyaRobe.CMP = { name="Vanya Robe", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}}
    
    DarkRing = {}

    MerlinicJubbah = {}
    MerlinicJubbah.MBD = { name="Merlinic Jubbah", augments={'Mag. Acc.+10 "Mag.Atk.Bns."+10','Magic burst mdg.+10%','MND+7','Mag. Acc.+10','"Mag.Atk.Bns."+5',}}
    MerlinicShalwar = {}
    MerlinicShalwar.Aspir = { name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +8','INT+2','Mag. Acc.+13','"Mag.Atk.Bns."+3',}}

    KaykausHands = {}
    KaykausHands.Enfeeble = { name="Kaykaus Cuffs", augments={'MP+60','MND+10','Mag. Acc.+15',}}
   
    ChironicPants = {}
    ChironicPants.Macc = { name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+3','CHR+6','Mag. Acc.+15','"Mag.Atk.Bns."+3',}}

    Sucellos = {}
    Sucellos.Nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+3','"Mag.Atk.Bns."+10',}}
    Sucellos.Enfeeble = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Haste+10',}}

end

function init_job_ability_sets()
    sets.Chainspell = {
        body="Vitiation Tabard"
    }

    sets.Saboteur = {
        hands="Estoqueur's Gantherots +2"
    }

    sets.ComposureOther = {
        body="Estoqueur's Sayon +2",
        legs="Estoqueur's Fuseau +2",
        feet="Estoqueur's Houseaux +2"
    }
end

function init_utility_sets()
    sets.recast = {
        main="Vampirism",
        sub="Genmei Shield",
        ammo="Sapience Orb",
        head= VanyaHood.FC,
        neck="Jewled Earring",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Vitiation Tabard",
        hands="Leyline Gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Swith Cape",
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet="Vanya Clogs"
    }

    sets.cmp = {
        main="Rubicundity",
        sub="Thuellaic Ecu +1",
        ammo="Clarus stone",
        head=VanyaHood.CMP,
        neck="Reti Pendant",
        ear1="Gifted Earring",
        ear2="Mendicant's Earring",
        body="Vanya Robe",
        hands="Telchine Gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Solemnity cape",
        waist="Austerity Belt",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }

    sets.weather = {
        back="Twilight Cape",
        waist="Hachirin-no-obi"
    }

    sets.weatherObi = {
        waist="Hachirin-no-obi"
    }
end

function init_precast_sets()
-- 32% Base
    sets.precast = {
        main="Emissary",  --7
        sub="Genmei Shield",
        ammo="Sapience Orb",  --2
        head="Warlock's Chapeau",  --10
        ear1="Etiolation Earring",
        ear2="Loquacious Earring",  --2
        body="Vitiation Tabard",  --12
        hands="Leyline Gloves",  --7
        ring1="Lebeche Ring",
        back="Perimede Cape",
        waist="Witful Belt",  --3
        legs="Psycloth Lappas", --7
        feet="Carmine Greaves +1"
    }

    sets.precast.Cures = 
        set_combine(sets.precast, {
            ear1="Mendicant's Earring",
            feet="Vanya Clogs"})

end

function init_enhancing_sets() 
    sets.Enhancing = 
        set_combine(sets.cmp, {
            neck="Incanter's Torque",
            body="Vitiation Tabard",
            hands="Atrophy Gloves +1",
            back=Sucellos.Enfeeble,
            waist="Olympus Sash",
            ring1="Stikini Ring",
            ring2="Stikini Ring",
            legs="Carmine Cuisses +1",
            feet="Estoqueur's houseaux +2",
    })

    sets.Duration = {
        back=Sucellos.Enfeeble,
        hands="Atrophy Gloves +1",
        feet="Estoqueur's houseaux +2"
    }

    sets.Aquaveil = 
        set_combine(sets.cmp, {
            main="Vadose Rod",
            sub="Thuellaic Ecu +1",
            waist="Emphatikos Rope",
            back=Sucellos.Enfeeble,
            hands="Atrophy Gloves +1",
            feet="Estoqueur's houseaux +2"
    })

    sets.Stoneskin = 
        set_combine(sets.recast, {
            neck="Nodens Gorget",
            waist="Siegel Sash",
            back=Sucellos.Enfeeble,
            hands="Atrophy Gloves +1",
            feet="Estoqueur's houseaux +2"
    })

    sets.Refresh = 
        set_combine(sets.cmp, {
            legs="Estoqueur's Fuseau +2",
            back=Sucellos.Enfeeble,
            hands="Atrophy Gloves +1",
            feet="Estoqueur's houseaux +2"
    })

    sets.Spikes = 
        set_combine(sets.Enhancing, {
            legs="Duelist's Tights +2",
            back=Sucellos.Enfeeble,
            hands="Atrophy Gloves +1",
            feet="Estoqueur's houseaux +2"
    })
end

function init_healing_sets()
    sets.Cures = {
        main="Surya's Staff +2",
        sub="Achaq Grip",
        ammo="Leisure Musk +1",
        head=VanyaHood.CMP, 
        neck="Incanter's Torque", 
        ear1="Gifted Earring", 
        ear2="Mendicant's Earring",
        body="Vanya Robe", 
        hands="Telchine gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Solemnity Cape",
        waist="Pythia Sash",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }

    sets.Curagas = {
        main="Surya's Staff +2",
        sub="Achaq Grip",
        ammo="Leisure Musk +1",
        head=VanyaHood.CMP, 
        neck="Incanter's Torque", 
        ear1="Gifted Earring", 
        ear2="Mendicant's Earring",
        body="Vanya Robe", 
        hands="Telchine gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Solemnity Cape",
        waist="Pythia Sash",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }

    sets.WeatherCures = {
        main="Chatoyant Staff",
        sub="Achaq Grip",
        ammo="Leisure Musk +1",
        head=VanyaHood.CP, 
        neck="Incanter's Torque", 
        ear1="Gifted Earring", 
        ear2="Mendicant's Earring",
        body="Vanya Robe", 
        hands="Bokwus Gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Twilight Cape",
        waist="Hachirin-no-obi",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }

    sets.WeatherCuragas = {
        main="Chatoyant Staff",
        sub="Achaq Grip",
        ammo="Leisure Musk +1",
        head=VanyaHood.CP,
        neck="Nodens Gorget",
        ear1="Gifted Earring",
        ear2="Mendicant's Earring",
        body="Vanya Robe",
        hands="Bokwus Gloves",
        ring1="Lebeche Ring",
        ring2="Resonance Ring",
        back="Twilight Cape",
        waist="Hachirin-no-obi",
        legs="Vanya Slops",
        feet="Vanya Clogs"
    }

    sets.Cursna = 
        set_combine(sets.recast, {
        neck="Malison Medallion",
        body="Vitiation Tabard",
        ring1="Ephedra Ring",
        ring2="Ephedra Ring",
        feet="Vanya Clogs"
    })
end

function init_enfeeble_sets()
    sets.Intfeeble = {
        main="Marin Staff +1",
        sub="Mephitis grip",
        ammo="Quartz Tathlum +1",
        head="Befouled Crown",
        neck="Incanter's Torque",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        body=VanyaRobe.CMP,
        hands=KaykausHands.Enfeeble,
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        back=Sucellos.Enfeeble,
        waist="Ovate Rope",
        legs=ChironicPants.Macc,
        feet="Medium's Sabots"
    }

    sets.Mndfeeble = {
        main="Marin Staff +1",
        sub="Mephitis grip",
        ammo="Quartz Tathlum +1",
        head="Befouled Crown",
        neck="Incanter's Torque",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        body=VanyaRobe.CMP,
        hands=KaykausHands.Enfeeble,
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        back=Sucellos.Enfeeble,
        waist="Ovate Rope",
        legs=ChironicPants.Macc,
        feet="Medium's Sabots"
    }

    sets.VitiationChap = {
        head="Vitiation Chapeau"
    }
end

function init_elemental_sets()
    sets.MAB = {
        main="Contemplator",
        sub="Niobid Strap",
        ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",
        neck="Sanctity Necklace",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
        body="Jhakri Robe +1",
        hands="Jhakri Cuffs +2",
        ring1="Vertigo Ring",
        ring2="Acumen Ring",
        back=Sucellos.Nuke,
        waist="Refoccilation Stone",
        legs=MerlinicShalwar.Aspir,
        feet="Jhakri pigaches +1"
    }

    sets.MACC = 
        set_combine(sets.MAB, {
            sub="Niobid Strap",
            ear1="Lifestorm Earring",
            ear2="Psystorm Earring",
            ring1="Stikini Ring",
            ring2="Stikini Ring"
        })

    sets.MB = {
        body=MerlinicJubbah.MBD, --10
        neck="Mizukage-no-Kubikazari", --10
        hands="Amalric Gages", -- 5 II
        feet="Jhakri Pigaches +1", --5
        ring1="Mujin Band", -- 5 II
        ring2="Locus Ring"
    }
end

function init_dark_sets()
    sets.Drain = 
        set_combine(sets.MACC, {
            main="Rubicundity",
            sub="Thuellaic Ecu +1",
            head="Pixie Hairpin +1",
            ring2="Evanescence Ring",
            waist="Fucho-no-obi"
        })

    sets.Dark = 
    set_combine(sets.MACC, {
        head="Pixie Hairpin +1",
        ring2="Evanescence Ring"
    })
end

function init_idle_sets() 
    sets.engaged = {
        main="Bolelabunga",
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Vitiation Chapeau",
        neck="Twilight Torque",
        ear1="Etiolation Earring",
        ear2="Genmei Earring",
        body="Jhakri Robe +1",
        hands="Ayanmo Manopolas +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Carmine Cuisses +1",
        feet="Ayanmo Gambieras +1"
    }

    sets.idle = {
        main="Bolelabunga",
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Vitiation Chapeau",
        neck="Twilight Torque",
        ear1="Etiolation Earring",
        ear2="Genmei Earring",
        body="Jhakri Robe +1",
        hands="Ayanmo Manopolas +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Carmine Cuisses +1",
        feet="Ayanmo Gambieras +1"
    }

    sets.idle.town = 
        set_combine(sets.idle, {
            body="Councilor's Garb"
    })

    sets.idle.pdt = 
        set_combine(sets.idle, {
            main="Earth Staff",
            sub="Achaq Grip",
            head="Welkin Crown",
            hands="Umithi Gloves",
            feet="Battlecast Gaiters"
    })

    sets.idle.mdt = 
        set_combine(sets.idle, {
            head="Welkin Crown",
            ear1="Etiolation Earring",
            ear2="Merman's earring",
            body="Artsieq jubbah",
            hands="Leyline Gloves",
            ring2="Defending Ring",
            feet="Chironic slippers"
        })

    sets.LatentRefresh = {
        waist="Fucho-no-obi"
    }
end