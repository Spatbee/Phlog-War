Color = {r = 1, g = 1, b = 1}

function Color:new (o)
    local o = o or {}
    setmetatable(o, {__index = self})
    o.r = o.r / 255.0
    o.g = o.g / 255.0
    o.b = o.b / 255.0
    return o
end

function Color:getRed ()
    return self.r
end

function Color:getGreen ()
    return self.g
end

function Color:getBlue ()
    return self.b
end

MENU_BACKGROUND_COLOR = Color:new{r = 78, g = 88, b = 92}
MENU_BUTTON_COLOR = Color:new{r = 225, g = 238, b = 242}
MENU_BUTTON_HOVER_COLOR = Color:new{r = 218, g = 227, b = 230}
MENU_BUTTON_TEXT_COLOR =  Color:new{r = 0, g = 0, b = 0}