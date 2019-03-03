function load_whm_maps() 
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
             "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
             "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}

    whm_maps = {}

    whm_maps.Cures = S{
        'Cure','Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI'
    }

    whm_maps.Curagas = S{
        'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V', 'Curaga VI',
        'Cura', 'Cura II', 'Cura III'
    }

    whm_maps.Removal = S{
        'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Cursna', 'Erase'
    }

    whm_maps.SpecRemoval = S{
        'Esuna', 'Sacrifice'
    }

    whm_maps.Boost = S{
        'Boost-STR', 'Boost-DEX', 'Boost-VIT', 'Boost-AGI', 'Boost-INT', 'Boost-VIT', 'Boost-CHR'
    }

    whm_maps.BarElement = S{
        'Barstonra', 'Barwatera', 'Baraera', 'Barfira', 'Barthundra', 'Barblizzara'
    }

    whm_maps.BarStatus = S{
        'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra'
    }

    whm_maps.Regen = S{
        'Regen', 'Regen II', 'Regen III', 'Regen IV'
    }

    whm_maps.Enhancing = S{
        'Flurry'
    }

    whm_maps.FastRecast = S{
        'Haste', 'Stun'
    }

    whm_maps.ConserveMP = S{
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

    whm_maps.EnfeeblingMND = S{
        'Paralyze', 'Slow', 'Addle', 'Silence'
    }

    whm_maps.EnfeeblingINT = S{
        'Dispel', 'Blind', 'Poison', 'Frazzle', 'Distract', 'Sleep', 'Sleepga', 'Sleep II'
    }

    whm_maps.DivineAcc = S{
        'Repose'
    }

    whm_maps.Banish = S{
        'Banish', 'Banish II', 'Banish III',
        'Banishga', 'Banishga II'
    }

    whm_maps.Holy = S{
        'Holy', 'Holy II'
    }

end