function get_sets()
    include('./Gear/CommonGear.lua')
    include('Gear/COR.lua')
    include('Maps/COR.lua')
    include('./Libs/MoteLibs/Modes.lua')
    include('./Libs/HelperFunctions.lua')
    include('./Libs/TextBoxLib.lua')
    
    load_gear_sets()
    load_cor_maps()
    job_setup()
end

function job_setup()
    define_roll_values()
    
    state = {}
    state.Buff = {}
    state.Buff["Sneak Attack"] = buffactive["Sneak Attack"] or false
    state.Buff["Trick Attack"] = buffactive["Trick Attack"] or false
    state.Buff["Feint"] = buffactive["Feint"] or false
    
    lock_cape = false
    lock_defense = false
    movespeed = false
    lock_th = false
    
    idle_mode = M{}
    combat_mode = M{}
    combat_mode["TP"] = M{}
    combat_mode["PDT"] = M{}
    combat_mode["MDT"] = M{}
    
    idle_mode:options("Default", "PDT", "MDT", "MEVA")
    combat_mode:options("TP", "MDT", "PDT")
    combat_mode["TP"]:options("DW0", "DW7", "DW12", "DW11-Acc")
    combat_mode["PDT"]:options("PDT")
    combat_mode["MDT"]:options("MDT", "MEVA")
    
    send_command('bind f9 gs c TP') --Equips / Toggles TP Sets
    send_command('bind f10 gs c PDT') --Equips / Toggles PDT Sets
    send_command('bind f11 gs c MDT') --Equips / Toggles MDT Sets
    send_command('bind f12 gs c IDLE') --Toggles Idle Sets
    
    send_command('bind @f9 gs c LockWeapons') --Toggles weapon switching
    send_command('bind @f10 gs c LockDefense') --Toggles locking when in defense mode
    send_command('bind @f12 gs c LockCape') --Toggles CP cape
    send_command('bind @f11 gs c Movespeed') --Toggles keeping fast pants on all idle sets
    
    --Textbox Stuff--
    local str = 'COR Info\n' ..
    '----------------------------\n' ..
    'Combat Mode     : ${cbmode|(None)}\n' ..
    'Idle Mode       : ${idlemode|(None)}\n' ..
    'Defense Lock    : ${defenselock|(None)}\n' ..
    'Cape Lock       : ${capelock|(None)}\n' ..
    'Movement Speed  : ${movespeed|(None)}\n'
    textbox = CreateTextBox(str, 1190, 770)
    textbox:show()
    update_info_box()
end

function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    
    send_command('unbind @f9')
    send_command('unbind @f10')
    send_command('unbind @f11')
    send_command('unbind @f12')
end

function precast(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if (string.find(spell.name, "Waltz") and spell.name ~= "Healing Waltz") then
            if spell.target.type == "SELF" then
                equip(sets.precast.waltz.self)
            else
                equip(sets.precast.waltz)
            end
        elseif string.find(spell.name, "Utsusemi") then
            equip(sets.precast.utsusemi)
        else
            handle_default_precast(spell)
            reive()
        end
    end
    display_roll_info(spell)
end

function midcast(spell)
    cancel_conflicting_buffs(spell)
    if combat_mode ~= "PDT" and combat_mode ~= "MDT" and lock_defense ~= true then
        if string.find(spell.name, "Utsusemi") then
            cancel_conflicting_buffs(spell)
            equip(sets.midcast.utsusemi)
        else
            handle_default_midcast(spell)
        end
    end
end

function aftercast(spell, action)
    status_change(player.status)
end

function status_change(new, tab, old)
    if new == 'Idle' then
        equip(sets.idle[idle_mode.current])
        if Town:contains(world.zone) then
            equip(sets.idle.town)
        end
        if movespeed == true then
            equip({legs = "Carmine Cuisses +1"})
        end
    elseif new == 'Engaged' then
        equip(sets.engaged[combat_mode[combat_mode.current].current])
    end
    reive()
    update_info_box()
end

function self_command(command)
    if (combat_mode:contains(command)) then
        if (combat_mode.current == command) then
            combat_mode[combat_mode.current]:cycle()
        else
            combat_mode:set(command)
        end
    elseif (command == "IDLE") then
        idle_mode:cycle()
    elseif (command == "LockCape") then
        lock_cape = not lock_cape
        if (lock_cape) then
            equip({back = CapacityCape})
            disable("back")
        else
            enable("back")
        end
    elseif (command == "LockDefense") then
        lock_defense = not lock_defense
    elseif (command == "Movespeed") then
        movespeed = not movespeed
    end
    update_info_box()
    status_change(player.status)
end

function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    if spell.english == 'Utsusemi: Ichi' then
        send_command('@wait 1; cancel copy image')
        send_command('@wait 1; cancel copy image (2)')
        send_command('@wait 1; cancel copy image (3)')
    end
end

function define_roll_values()
    rolls = {
        ["Corsair's Roll"] = {lucky = 5, unlucky = 9, bonus = "Experience Points"},
        ["Ninja Roll"] = {lucky = 4, unlucky = 8, bonus = "Evasion"},
        ["Hunter's Roll"] = {lucky = 4, unlucky = 8, bonus = "Accuracy"},
        ["Chaos Roll"] = {lucky = 4, unlucky = 8, bonus = "Attack"},
        ["Magus's Roll"] = {lucky = 2, unlucky = 6, bonus = "Magic Defense"},
        ["Healer's Roll"] = {lucky = 3, unlucky = 7, bonus = "Cure Potency Received"},
        ["Puppet Roll"] = {lucky = 4, unlucky = 7, bonus = "Pet Magic Accuracy/Attack"},
        ["Choral Roll"] = {lucky = 2, unlucky = 6, bonus = "Spell Interruption Rate"},
        ["Monk's Roll"] = {lucky = 3, unlucky = 7, bonus = "Subtle Blow"},
        ["Beast Roll"] = {lucky = 4, unlucky = 8, bonus = "Pet Attack"},
        ["Samurai Roll"] = {lucky = 2, unlucky = 6, bonus = "Store TP"},
        ["Evoker's Roll"] = {lucky = 5, unlucky = 9, bonus = "Refresh"},
        ["Rogue's Roll"] = {lucky = 5, unlucky = 9, bonus = "Critical Hit Rate"},
        ["Warlock's Roll"] = {lucky = 4, unlucky = 8, bonus = "Magic Accuracy"},
        ["Fighter's Roll"] = {lucky = 5, unlucky = 9, bonus = "Double Attack Rate"},
        ["Drachen Roll"] = {lucky = 3, unlucky = 7, bonus = "Pet Accuracy"},
        ["Gallant's Roll"] = {lucky = 3, unlucky = 7, bonus = "Defense"},
        ["Wizard's Roll"] = {lucky = 5, unlucky = 9, bonus = "Magic Attack"},
        ["Dancer's Roll"] = {lucky = 3, unlucky = 7, bonus = "Regen"},
        ["Scholar's Roll"] = {lucky = 2, unlucky = 6, bonus = "Conserve MP"},
        ["Bolter's Roll"] = {lucky = 3, unlucky = 9, bonus = "Movement Speed"},
        ["Caster's Roll"] = {lucky = 2, unlucky = 7, bonus = "Fast Cast"},
        ["Courser's Roll"] = {lucky = 3, unlucky = 9, bonus = "Snapshot"},
        ["Blitzer's Roll"] = {lucky = 4, unlucky = 9, bonus = "Attack Delay"},
        ["Tactician's Roll"] = {lucky = 5, unlucky = 8, bonus = "Regain"},
        ["Allies's Roll"] = {lucky = 3, unlucky = 10, bonus = "Skillchain Damage"},
        ["Miser's Roll"] = {lucky = 5, unlucky = 7, bonus = "Save TP"},
        ["Companion's Roll"] = {lucky = 2, unlucky = 10, bonus = "Pet Regain and Regen"},
        ["Avenger's Roll"] = {lucky = 4, unlucky = 8, bonus = "Counter Rate"},
    }
end

function update_info_box()
    textbox.cbmode = combat_mode[combat_mode.current].current
    textbox.idlemode = idle_mode.current
    textbox.capelock = bool_to_string(lock_cape)
    textbox.movespeed = bool_to_string(movespeed)
    textbox.defenselock = bool_to_string(lock_defense)
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = 'Large' --(state.LuzafRing.value and 'Large') or 'Small'
    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky) .. ', Unlucky roll is '..tostring(rollinfo.unlucky) .. '.')
    end
end

windower.register_event('zone change', function()
    status_change(player.status)
end)
