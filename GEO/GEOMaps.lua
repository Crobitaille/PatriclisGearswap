function load_geo_maps()
    Town = S{"Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno", "Port Windurst", "Windurst Waters", "Windurst Woods", "Windurst Walls", "Heavens Tower",
        "Port San d'Oria", "Northern San d'Oria", "Southern San d'Oria", "Port Bastok", "Bastok Markets", "Bastok Mines", "Metalworks", "Aht Urhgan Whitegate",
    "Tavnazian Safehold", "Nashmau", "Selbina", "Mhaura", "Norg", "Eastern Adoulin", "Western Adoulin", "Kazham", "Heavens Tower"}

    GeoMaps = {}

    GeoMaps.NoObi = S{
        'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Cursna', 'Erase', 'Esuna', 'Sacrifice',
        'Arise', 'Raise I', 'Raise II', 'Raise III', 'Reraise I', 'Reraise II', 'Reraise II', 'Reraise IV',
        'Burn', 'Choke', 'Drown', 'Frost', 'Rasp', 'Shock', 'Impact', 'Anemohelix', 'Cryohelix',
    'Geohelix', 'Hydrohelix', 'Ionohelix', 'Luminohelix', 'Noctohelix', 'Pyrohelix'}

    GeoMaps.EnfeeblingMND = S{
        'Paralyze', 'Paralyze II', 'Slow', 'Slow II', 'Addle', 'Silence', 'Inundation'
    }

    GeoMaps.EnfeeblingINT = S{
        'Dispel', 'Blind', 'Blind II', 'Poison', 'Poison II', 'Frazzle', 'Distract', 'Sleep', 'Sleepga', 'Sleep II',
        'Frazzle II', 'Frazzle III', 'Distract II', 'Distract III', 'Break', 'Bind', 'Dispel', 'Gravity', 'Gravity II',
    }

    GeoMaps.EnhancingSkill = S{
        'Barsleepra', 'Barpoisonra', 'Barparalyzra', 'Barblindra', 'Barsilencera', 'Barpetra', 'Barvira', 'Baramnesra',
        'Barsleep', 'Barpoison', 'Barparalyze', 'Barblind', 'Barsilence', 'Barpetrify', 'Barvirus', 'Baramnesia',
        'Barstonra', 'Barwatera', 'Baraera', 'Barfira', 'Barthundra', 'Barblizzara',
        'Barstone', 'Barwater', 'Baraero', 'Barfire', 'Barthunder', 'Barblizzard',
        'Flurry',
    }

    GeoMaps.FastRecast = S{
        'Haste', 'Haste II', 'Stun'
    }

end
