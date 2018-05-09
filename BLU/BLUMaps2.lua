function load_blu_maps()
    PhysicalSpells = S {
        'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
        'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
        'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance', 'Bloodrake',
        'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion',
        'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes', 'Barbed Crescent',
        'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage',
        'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball', 'Delta Thrust',
        'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack', 'Benthic Typhoon', 'Helldive',
        'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Heavy Strike'
    }
 
    PhysicalBlueMagic = S {
        'Asuran Claws', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
        'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
        'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch'
    }
 
    PhysicalBlueMagic_STR = S {
        'Battle Dance', 'Bloodrake', 'Death Scissors', 'Dimensional Death', 'Empty Thrash',
        'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 'Thrashing Assault', 'Vertical Cleave',
        'Whirl of Rage'
    }
 
    PhysicalBlueMagic_DEX = S {
        'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
        'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Paralyzing Triad', 'Seedspray',
        'Vanity Dive'
    }
 
    PhysicalBlueMagic_VIT = S {
        'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
        'Sprout Smack'
    }
 
    PhysicalBlueMagic_AGI = S {
        'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats'
    }
 
    BlueMagic_PhysicalAcc = S {
        'Heavy Strike'
    }
 
    MagicalSpells = S {
        'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
        'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge',
        'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm',
        'Spectral Floe', 'Subduction', 'Sudden Lunge', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Mighty Guard',
        'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me', 'Blazing Bound',
        'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush', 'Blinding Fulgor', 'Diffusion Ray', 'Ice Break',
        'Magic Hammer', 'Rail Cannon', 'Retinal Glare', 'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray'
    }
 
    BlueMagic_INT = S {
        'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
        'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
        'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
        'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb'
    }
 
    BlueMagic_Dark = S {
        'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
        'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
    }

    BlueMagic_Light = S {
        'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
    }
 
    --- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
    BlueMagic_Earth = S {
        'Embalming Earth', 'Entomb', 'Sandspin'
    }
 
    BlueMagic_Accuracy = S {
        '1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
        'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
        'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
        'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
        'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
        'Sub-zero Smash', 'Triumphant Roar', 'Venom Shell', 'Voracious Trunk', 'Yawn'
    }
 
    BlueMagic_Breath = S {
        'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
        'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
    }
 
    BlueMagic_Buffs = S {
        'Barrier Tusk', 'Carcharian Verve', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
        'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat',
        'Feather Barrier','Refueling','Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification'
    }
 
    BlueMagic_Skill = S {
        'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation',
    }
 
    BlueMagic_Healing = S {
        'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot'
    }
 
    BlueMagic_Stun = S {
        'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Whirl of Rage'
    }
    BlueMagic_Enmity = S {
        'Actinic Burst', 'Exuviation', 'Fantod', 'Jettatura', 'Temporal Shift'
    }
    BlueMagic_Diffusion = S {
         'Harden Shell', 'Mighty Guard'
    }
end