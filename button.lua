require "color"

function defaultOnPress()
    error("button not yet implemented")
end

Button = {
    color = MENU_BUTTON_COLOR,
    hoverColor = MENU_BUTTON_HOVER_COLOR,
    textColor = MENU_BUTTON_TEXT_COLOR,
    font = love.graphics.newFont(24),
    fontHeight = 0,
    fontWidth = 0,
    offsetX = 0,
    offsetY = 0,
    width = 0,
    height = 0,
    radiusX = 20,
    radiusY = 10,
    text = "button",
    onPress = defaultOnPress,
    pressStarted = false
}

function Button:new (o)
    local o = o or {}
    setmetatable(o, {__index = self})
    o.fontWidth = o.font:getWidth(o.text)
    o.fontHeight = o.font:getHeight()
    return o
end

function Button:draw()
    local color = self.color
    if self:mouseWithin() then
        color = self.hoverColor
    end
    love.graphics.setColor(color:getRed(), color:getGreen(), color:getBlue(), 1)
    love.graphics.rectangle("fill", self.offsetX, self.offsetY, self.width, self.height, self.radiusX, self.radiusY, 10)
    love.graphics.setColor(self.textColor:getRed(), self.textColor:getGreen(), self.textColor:getBlue(), 1)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, self.offsetX + (self.width - self.fontWidth) / 2, self.offsetY + (self.height - self.fontHeight) / 2)
end

function Button:mouseWithin()
    cursorX, cursorY = love.mouse.getPosition()
    return cursorX >= self.offsetX and cursorX <= self.offsetX + self.width and cursorY >= self.offsetY and cursorY <= self.offsetY + self.height
end

function Button:mousePressed(button)
    if button == 1 then
        self.pressStarted = self:mouseWithin()
    end
end

function Button:mouseReleased(button)
    if button == 1 then
        if self.pressStarted and self:mouseWithin() then
            self.onPress();
        end
        self.pressStarted = false
    end
end