texts = require("texts")

function CreateTextBox(s, px, py)
    local textsettings = {
        text = {size = 12, font = 'Consolas'},
        bg = {alpha = 180, red = 0, green = 0, blue = 0, visible = true},
        flags = {draggable = true, bold=true},
    pos = {x = px, y = py}}
    
    return texts.new(s, textsettings)
end

function DisplayText(name, text)
    windower.text.set_text(name, text)
end

function DeleteTextBox(name)
    windower.text.delete(name)
end

--Formats a boolean for friendly string output
--I have no excuse for why this function uses underscores instead of PascalCase.
--What was I on?!??!
function bool_to_string(b) 
    if b then
        return "True"
    else
        return "False"
    end
end
