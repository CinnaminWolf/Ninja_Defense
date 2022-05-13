
controller = {}

function controller:load()
    typeWriter = {}
    typeWriter.left = "a"
    typeWriter.up = "w"
    typeWriter.right = "d"
    typeWriter.down = "s"
    typeWriter.Altleft = "left"
    typeWriter.Altup = "up"
    typeWriter.Altright = "right"
    typeWriter.Altdown = "down"

end

function controller:update(dt)
    key = love.keyboard.isDown()
    function love.keypressed(k)
        if gameState == 0 then
            if k == "escape" then
                love.event.quit()
            end
        elseif gameState == 1 then
            --Pause Menu Return
            if k == "escape" then
                gameState = 2
            end
        elseif gameState == 2 then
            --Pause Menu Open
            if k == "escape" then
                gameState = 1
                resetOptions()
            end
            if k == "k" then
                gameState = 3
            end
        end
    end
    if gameState == 2 then
        if love.keyboard.isDown(typeWriter.left) or love.keyboard.isDown(typeWriter.Altleft) then
            color.nimja = color.yellow
            nimja.flow = 1
        elseif love.keyboard.isDown(typeWriter.up) or love.keyboard.isDown(typeWriter.Altup) then
            color.nimja = color.green
            nimja.flow = 2
        elseif love.keyboard.isDown(typeWriter.right) or love.keyboard.isDown(typeWriter.Altright) then
            color.nimja = color.blue
            nimja.flow = 3
        else
            color.nimja = color.default
            nimja.flow = 0
        end
    end
    if love.keyboard.isDown("r") then
        GameReset()
    end
end