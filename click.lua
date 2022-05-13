function love.mousepressed(x, y, button, istouch)
    PrevClick.x = x
    PrevClick.y = y
    if button == 1 and gameState == 0 then
        if Scene == 0 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                GameReset()
                gameState = 2
                Scene = 0
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
            if vTwo(x,y,MBone.x,MBthr.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 4
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) and button == 1 then
                love.event.quit()
            end
        elseif Scene == 1 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 2
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 3
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        elseif Scene == 2 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 3 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 4 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                if gamerStats == "on" then
                    gamerStats = "off"
                elseif gamerStats == "off" then
                    gamerStats = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                if spawnDisplay == "on" then
                    spawnDisplay = "off"
                elseif spawnDisplay == "off" then
                    spawnDisplay = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        end
    end
    if button == 1 and gameState == 1 then
        if Scene == 0 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                gameState = 2
                Scene = 0
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                GameReset()
                resetOptions()
                gameState = 0
                Scene = 0
            end
            if vTwo(x,y,MBone.x,MBthr.y,MBone.width,MBone.height) then
                Scene = 1
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) and button == 1 then
                love.event.quit()
            end
        elseif Scene == 1 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 2
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 3
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        elseif Scene == 2 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 3 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 4 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                if gamerStats == "on" then
                    gamerStats = "off"
                elseif gamerStats == "off" then
                    gamerStats = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                if spawnDisplay == "on" then
                    spawnDisplay = "off"
                elseif spawnDisplay == "off" then
                    spawnDisplay = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        end
    end
    if button == 1 and gameState == 3 then 
        if Scene == 0 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                GameReset()
                resetOptions()
                gameState = 2
                Scene = 0
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                Scene = 1
            end
            if vTwo(x,y,MBone.x,MBthr.y,MBone.width,MBone.height) then
                Scene = 4
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                status = "done!"
                resetOptions()
                gameState = 0
                Scene = 0
            end
        elseif Scene == 1 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 2
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 3
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        elseif Scene == 2 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 3 then
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 1
            end
        elseif Scene == 4 then
            if vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
                if gamerStats == "on" then
                    gamerStats = "off"
                elseif gamerStats == "off" then
                    gamerStats = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
                if spawnDisplay == "on" then
                    spawnDisplay = "off"
                elseif spawnDisplay == "off" then
                    spawnDisplay = "on"
                end
            end
            if vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
                resetOptions()
                Scene = 0
            end
        end
    end
end

function bick() 
    if love.mouse.isDown(1) then
        MouseX,MouseY = love.mouse.getPosition()
        
        if gameState == 0 then
            if Scene == 2 then
                if vTwo(PrevClick.x,PrevClick.y,BarSlider.x,BarSlider.y,BarSlider.width,BarSlider.height) or Hold == 1 then
                    local Brew = MouseX-(BarSlider.width/2)
                    if Brew > Slider.x+Slider.width-10 then
                        Brew = Slider.x+Slider.width-10
                    elseif Brew < Slider.x then
                        Brew = Slider.x+(BarSlider.width/2)
                    else
                        BarSlider.x = Brew
                        Slider.adjust = distanceBetween(Slider.x,Slider.y+(Slider.height/2),BarSlider.x,BarSlider.y+(BarSlider.height/2))
                        Hold = 1
                    end
                end
            end
        end
    else
        Hold = 0
    end
end