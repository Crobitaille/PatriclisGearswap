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
