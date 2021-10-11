require "mainMenu"
state="mainMenu"

function love.draw()
    if state == "mainMenu" then
        drawMainMenu()
    end
end

function love.mousepressed(x, y, button, istouch)
    if state == "mainMenu" then
        mousePressedMainMenu(button)
    end
end

function love.mousereleased(x, y, button, istouch)
    if state == "mainMenu" then
        mouseReleasedMainMenu(button)
    end
end

function love.update(dt)
    
end

