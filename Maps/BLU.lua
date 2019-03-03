function load_blu_maps()
    Town = S{"Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno", "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
        "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks", "Aht Urhgan Whitegate",
    "Tavnazian Safehold", "Nashmau", "Selbina", "Mhaura", "Norg", "Eastern Adoulin", "Western Adoulin", "Kazham", "Heavens Tower"}
    
    PhysicalBlu = S{
        'Asuran Claws', 'Bilgestorm', 'Battle Dance', 'Bludgeon', 'Bloodrake', 'Death Scissors',
        'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill',
        'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Saurian Slide', 'Sinal Cleave',
        'Paralyzing Triad', 'Mandibular Bite', 'Power Attack', 'Ram Charge', 'Screwdriver', 'Smite of Rage',
        'Spinal Cleave', 'Queasyshroom', 'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
        'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Seedspray',
        'Vanity Dive', 'Sickle Slash', 'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
        'Sprout Smack', 'Body Slam', 'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
        'Spiral Spin', 'Feather Storm', 'Heavy Strike'
    }
    
    BluMaps = {}
    
    BluMaps["Physical_STR"] = S {
        'Asuran Claws', 'Bilgestorm', 'Battle Dance', 'Bludgeon', 'Bloodrake', 'Death Scissors',
        'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill',
        'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Saurian Slide', 'Sinal Cleave',
        'Paralyzing Triad', 'Mandibular Bite', 'Power Attack', 'Ram Charge', 'Screwdriver', 'Smite of Rage',
        'Spinal Cleave', 'Queasyshroom'
    }
    
    BluMaps["Physical_DEX"] = S {
        'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
        'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Seedspray',
        'Vanity Dive', 'Sickle Slash'
    }
    
    BluMaps["Physical_VIT"] = S {
        'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
        'Sprout Smack', 'Body Slam'
    }
    
    BluMaps["Physical_AGI"] = S {
        'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
        'Spiral Spin', 'Feather Storm'
    }
    
    BluMaps["Physical_ACC"] = S {
        'Heavy Strike'
    }
    
    BluMaps["Magic_INT"] = S {
        'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
        'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
        'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
        'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb', 'Ice Break', 'Blazing Bound'
    }
    
    BluMaps["Magic_Dark"] = S {
        'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
        'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
    }
    
    BluMaps["Magic_Light"] = S {
        'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
    }
    
    --- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
    BluMaps["Magic_Earth"] = S {
        'Embalming Earth', 'Entomb', 'Sandspin'
    }
    
    BluMaps["Magic_ACC"] = S {
        '1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
        'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
        'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
        'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
        'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
        'Sub-zero Smash', 'Triumphant Roar', 'Venom Shell', 'Voracious Trunk', 'Yawn', 'Jettatura', 'Actinic Burst'
    }
    
    BluMaps["Breath"] = S {
        'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
        'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
    }
    
    BluMaps["Buffs"] = S {
        'Barrier Tusk', 'Carcharian Verve', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
        'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat',
        'Feather Barrier', 'Refueling', 'Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification', 'Fantod',
        'Harden Shell', 'Mighty Guard'
    }
    
    BluMaps["Skill"] = S {
        'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation'
    }
    
    BluMaps["Healing"] = S {
        'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot', 'Exuviation',
    }
    
    BluMaps["Stun"] = S {
        'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Whirl of Rage', 'Temporal Shift'
    }
end
