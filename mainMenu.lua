require "color"
require "button"

function newGame()
    print("starts a new game")
end

function drawMainMenu()
    playButton:draw()
end

function mousePressedMainMenu(button)
    playButton:mousePressed(button)
end

function mouseReleasedMainMenu(button)
    playButton:mouseReleased(button)
end

playButton = Button:new{
    width = 200,
    height = 100,
    text = "Play",
    onPress = newGame
}