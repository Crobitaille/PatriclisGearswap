function get_sets()
    -- include('BLU/BLUGear.lua')
    -- include('BLU/BLUMaps.lua')
    include('PatLibs/TextBoxLib.lua')
    include('PatLibs/HelperFunctions.lua')
    
    job_setup()
end

function job_setup()
    --Combat Mode Stuff--
    combat_mode = "TP"
    combat_modes = {}
    combat_modes["TP"] = {"DW10", "DW15", "DW20", "DW25", "ACC1200", "ACC1300"}
    combat_modes["PDT"] = {"PDT"}
    combat_modes["MDT"] = {"MDT", "MEVA"}
    combat_mode_indexes = {}
    combat_mode_indexes["TP"] = 1
    combat_mode_indexes["PDT"] = 1
    combat_mode_indexes["MDT"] = 1
    
    send_command('bind f12 gs c IDLE')
    send_command('bind f11 gs c MDT')
    send_command('bind f10 gs c PDT')
    send_command('bind f9 gs c TP')
    
    --Textbox Stuff--
    local str = 'BLU Info\n' ..
    '-------------------------\n' ..
    'Combat Mode: ${cbmode|(None)}\n'
    textbox = CreateTextBox(str, 1200, 750)
    textbox:show()
    update_info_box()
end

function user_unload()
    send_command('unbind f12')
    send_command('unbind f11')
    send_command('unbind f10')
    send_command('unbind f9')
    
    -- DeleteTextBox(boxname)
end

function self_command(command)
    local modes = {"TP", "PDT", "MDT"}
    for k in pairs(modes) do
        if command == modes[k] then
            if combat_mode == modes[k] then
                combat_mode_indexes[modes[k]] = cycle(combat_modes[modes[k]], combat_mode_indexes[modes[k]])
            else
                combat_mode = modes[k]
            end
            -- sets.engaged = sets.combat_modes[combat_modes[combat_mode][combat_mode_indexes[combat_mode]]]
            break
        end
    end
    update_info_box()
end

function update_info_box()
    textbox.cbmode = combat_modes[combat_mode][combat_mode_indexes[combat_mode]]
end

function blu_textbox()
    
end
