function load_pld_maps() 
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
             "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
             "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}

    pld_maps = {}

    pld_maps.Cures = S{
        'Cure','Cure II', 'Cure III', 'Cure IV',
        'Curaga', 'Curaga II', 'Cura', 'Cura II'
    }

    pld_maps.Removal = S{
        'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Cursna', 'Erase',
    }

    pld_maps.EnhancingSkill = S{
        'Barstonra', 'Barwatera', 'Baraera', 'Barfira', 'Barthundra', 'Barblizzara',
        'Barstone', 'Barwater', 'Baraero', 'Barfire', 'Barthunder', 'Barblizzard',
        'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra',
        'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia'
    }

    pld_maps.Phalanx = S{
        'Phalanx'
    }

    pld_maps.Enlight = S{
        'Enlight', 'Enlight II'
    }

    pld_maps.Reprisal = S{
        'Reprisal'
    }

    pld_maps.Flash = S{
        'Flash'
    }

    pld_maps.ConserveMP = S{
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
        'Dia', 'Dia II', 'Diaga',
        'Haste', 'Regen', 'Regen II', 'Warp', 'Warp II',
        'Crusade'
    }

    pld_maps.Banish = S{
        'Banish', 'Banish II', 'Banish III',
        'Banishga', 'Banishga II'
    }

    pld_maps.Holy = S{
        'Holy', 'Holy II'
    }

    pld_maps.SureCast = S{
        'Reprisal', 'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Phalanx', 'Crusade', 'Utsusemi: Ichi', 'Utsusemi: Ni'
    }

    pld_maps.Shadow = S{
       'Utsusemi: Ichi', 'Utsusemi: Ni'
    }

    pld_maps.BluCure = S{
        'Healing Breeze', 'Wild Carrot'
    }

    pld_maps.BluEnmity = S{
        'Blank Gaze', 'Sheep Song', 'Soporific', 'Jettatura', 'Wild Oats', 'Screwdriver'
    }

    pld_maps.BluSurecast = S{
        'Cocoon','Refueling'
    }

    pld_maps.Cancel = S{
    'Utsusemi: Ichi'
    }
end