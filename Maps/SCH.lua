function load_sch_maps() 
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
             "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
             "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}

    sch_maps = {}

    sch_maps.Cures = S{
        'Cure','Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI'
    }

    sch_maps.Curagas = S{
        'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V', 'Curaga VI',
        'Cura', 'Cura II', 'Cura III'
    }

    sch_maps.Removal = S{
        'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Cursna', 'Erase'
    }

    sch_maps.SpecRemoval = S{
        'Esuna', 'Sacrifice'
    }

    sch_maps.Boost = S{
        'Boost-STR', 'Boost-DEX', 'Boost-VIT', 'Boost-AGI', 'Boost-INT', 'Boost-VIT', 'Boost-CHR',
        'Gain-STR', 'Gain-DEX', 'Gain-VIT', 'Gain-AGI', 'Gain-INT', 'Gain-VIT', 'Gain-CHR'
    }

    sch_maps.BarElement = S{
        'Barstonra', 'Barwatera', 'Baraera', 'Barfira', 'Barthundra', 'Barblizzara',
        'Barstone', 'Barwater', 'Baraero', 'Barfire', 'Barthunder', 'Barblizzard'
    }

    sch_maps.BarStatus = S{
        'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra',
        'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia'
    }

    sch_maps.Regen = S{
        'Regen', 'Regen II', 'Regen III', 'Regen IV', 'Regen V'
    }

    sch_maps.Enhancing = S{
        'Flurry', 'Flurry II', 'Temper', 'Temper II'
    }

    sch_maps.Refresh = S{
        'Refresh','Refresh II', 'Refresh III'
    }

    sch_maps.FastRecast = S{
        'Haste', 'Haste II', 'Stun'
    }

    sch_maps.ConserveMP = S{
        'Protect', 'Protect II', 'Protect III', 'Protect IV', 'Protect V',
        'Protectra', 'Protectra II', 'Protectra III', 'Protectra IV', 'Protectra V',
        'Shell', 'Shell II', 'Shell III', 'Shell IV', 'Shell V',
        'Shellra', 'Shellra II', 'Shellra III', 'Shellra IV', 'Shellra V',
        'Raise', 'Raise II', 'Raise III', 'Arise',
        'Reraise', 'Reraise II', 'Reraise III', 'Reraise IV',
        'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm', 'Voidstorm', 'Aurorastorm',
        'Teleport-Dem', 'Teleport-Holla', 'Teleport-Mea', 'Teleport-Yhoat', 'Teleport-Vahzl', 'Teleport-Altep', 
        'Invisible', 'Sneak', 'Deodorize', 
        'Klimaform', 'Blink',
        'Dia', 'Dia II', 'Diaga'
    }

    sch_maps.EnfeeblingMND = S{
        'Paralyze', 'Paralyze II', 'Slow', 'Slow II', 'Addle', 'Silence', 'Inundation'
    }

    sch_maps.EnfeeblingINT = S{
        'Dispel', 'Blind', 'Blind II','Poison', 'Poison II', 'Frazzle', 'Distract', 'Sleep', 'Sleepga', 'Sleep II',
        'Frazzle II', 'Frazzle III', 'Distract II', 'Distract III', 'Break', 'Bind', 'Dispel', 'Gravity', 'Gravity II',
    }

    sch_maps.Drain = S{
        'Drain', 'Aspir', 'Aspir II'
    }

    sch_maps.Dark = S{
        'Bio', 'Bio II'
    }

    sch_maps.DivineAcc = S{
        'Repose'
    }

    sch_maps.Banish = S{
        'Banish', 'Banish II', 'Banish III',
        'Banishga', 'Banishga II'
    }

    sch_maps.Holy = S{
        'Holy', 'Holy II'
    }

    sch_maps.Nukes = S{
        'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stone IV', 'Water IV', 'Aero IV', 'Fire IV', 'Blizzard IV', 'Thunder IV',
        'Stone V', 'Water V', 'Aero V', 'Fire V', 'Blizzard V', 'Thunder V',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'
    }

    sch_maps.Helix = S{
        'Geohelix', 'Hydrohelix', 'Anemohelix', 'Pyrohelix', 'Cryohelix', 'Ionohelix', 'Luminohelix', 'Noctohelix'
    }

    sch_maps.Spikes = S{
        "Blaze Spikes", "Ice Spikes", "Shock Spikes"
    }

    sch_maps.SwordSpells = S{
        'Enstone', 'Enwater', 'Enaero', 'Enfire', 'Enblizzard', 'Enthunder',
        'Enstone II', 'Enwater II', 'Enaero II', 'Enfire II', 'Enblizzard II', 'Enthunder II',
    }

end