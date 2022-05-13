menu = {}

function menu:load()
    
    ScreenWidth = love.graphics.getWidth()
    ScreenHeight = love.graphics.getHeight()
    MBone = {}
    MBone.x = (150*ScreenWidth)/1366
    MBone.y = (150*ScreenHeight)/1000
    MBone.width = (350*ScreenWidth)/1000
    MBone.height = (75*ScreenHeight)/1000
    MBtwo = {}
    MBtwo.y = (300*ScreenHeight)/1000
    MBthr = {}
    MBthr.y = (450*ScreenHeight)/1000
    MBfor = {}
    MBfor.y = (600*ScreenWidth)/1000
    MBexit = {}
    MBexit.y = (650*ScreenWidth)/1000

    menuSize = love.graphics.newFont(24)
    DefaultSize = love.graphics.newFont(12)
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

    menuAlpha = {}
    menuAlpha.one = 1
    menuAlpha.two = 1
    menuAlpha.three = 1
    menuAlpha.four = 1
    menuAlpha.oneD = 1
    menuAlpha.twoD = 1
    menuAlpha.threeD = 1
    menuAlpha.fourD = 1

    Slider = {}
    Slider.width = 400
    Slider.height = 10
    Slider.x = MBone.x+MBone.width+10
    Slider.y = (MBone.height/2)+MBone.y-(Slider.height/2)
    Slider.adjust = 0
    BarSlider = {}
    BarSlider.x = MBone.x+MBone.width+10
    BarSlider.y = (MBone.height/2)+MBone.y-(30/2)
    BarSlider.width = 30
    BarSlider.height = 30


    Scene = 0
    gamerStats = "off"
    spawnDisplay = "off"
end

function menu:update(dt)
    local x, y = love.mouse.getPosition()
    --Color menu
    -- OP 1
    if menuAlpha.oneD == 0 then
        menuAlpha.one = 0
    elseif vTwo(x,y,MBone.x,MBone.y,MBone.width,MBone.height) then
        menuAlpha.one = 0.5
    else
        menuAlpha.one = 1
    end
    -- OP 2
    if menuAlpha.twoD == 0 then
        menuAlpha.two = 0
    elseif vTwo(x,y,MBone.x,MBtwo.y,MBone.width,MBone.height) then
        menuAlpha.two = 0.5
    else
        menuAlpha.two = 1
    end
    -- OP 3
    if menuAlpha.threeD == 0 then
        menuAlpha.three = 0
    elseif vTwo(x,y,MBone.x,MBthr.y,MBone.width,MBone.height) then
        menuAlpha.three = 0.5
    else
        menuAlpha.three = 1
    end
    -- OP 4
    if menuAlpha.fourD == 0 then
        menuAlpha.four = 0
    elseif vTwo(x,y,MBone.x,MBfor.y,MBone.width,MBone.height) then
        menuAlpha.four = 0.5
    else
        menuAlpha.four = 1
    end

    
end

function menu:draw()
    if gameState == 0 or gameState == 1 or gameState == 3 then
        love.graphics.setColor(color.default)
        --love.graphics.line(0, windowHeight, windowWidth, 0)
        love.graphics.setColor(menuAlpha.one,menuAlpha.one,menuAlpha.one)
        love.graphics.rectangle("fill", MBone.x, MBone.y, MBone.width, MBone.height)
        love.graphics.setColor(menuAlpha.two,menuAlpha.two,menuAlpha.two)
        love.graphics.rectangle("fill", MBone.x, MBtwo.y, MBone.width, MBone.height)
        love.graphics.setColor(menuAlpha.three,menuAlpha.three,menuAlpha.three)
        love.graphics.rectangle("fill", MBone.x, MBthr.y, MBone.width, MBone.height)
        love.graphics.setColor(menuAlpha.four,menuAlpha.four,menuAlpha.four)
        love.graphics.rectangle("fill", MBone.x, MBfor.y, MBone.width, MBone.height)
        love.graphics.setColor(color.default)
    end

    if gameState == 0 then
        if Scene == 0 then
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            love.graphics.print("Start", MBone.x+20,MBone.y+10)
            love.graphics.print("Settings", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Options", MBone.x+20,MBthr.y+10)
            love.graphics.print("Quit", MBone.x+20,MBfor.y+10)
        end
        if Scene == 1 then
            --Disabling "Video" until i make all the graphics size change on screen change
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            love.graphics.print("Audio", MBone.x+20,MBone.y+10)
            love.graphics.print("Controls", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Video", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 2 then
            love.graphics.setFont(menuSize)
            love.graphics.setColor(color.default)
            love.graphics.rectangle("line",Slider.x,Slider.y,Slider.width,Slider.height)
            love.graphics.rectangle("fill",BarSlider.x,BarSlider.y,BarSlider.width,BarSlider.height)
            love.graphics.rectangle("fill",Slider.x,Slider.y,Slider.adjust,Slider.height)
            love.graphics.setColor(color.black)
            love.graphics.print("Main Volume", MBone.x+20,MBone.y+10)
            love.graphics.print("SFX", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 3 then
            menuAlpha.oneD = 0 
            menuAlpha.twoD = 0 
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.default)
            love.graphics.setFont(menuSize)
            love.graphics.print("No customizable controls are available", MBone.x+20,MBone.y+10)
            love.graphics.setColor(color.black)
            love.graphics.print("SFX", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 4 then
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            if gamerStats == "on" then
                love.graphics.setColor(color.yellow)
            elseif gamerStats == "off" then
                love.graphics.setColor(color.red)
            end
            love.graphics.print("GamerStats:"..gamerStats, MBone.x+1,MBone.y+10)
            if spawnDisplay == "on" then
                love.graphics.setColor(color.yellow)
            elseif spawnDisplay == "off" then
                love.graphics.setColor(color.red)
            end
            love.graphics.print("SpawnTimer:"..spawnDisplay, MBone.x+1,MBtwo.y+10)
            love.graphics.setColor(color.black)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
    elseif gameState == 1 then 
        if Scene == 0 then
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            love.graphics.print("Return", MBone.x+20,MBone.y+10)
            love.graphics.print("Main Menu", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Settings & Options", MBone.x+20,MBthr.y+10)
            love.graphics.print("Exit Game", MBone.x+20,MBfor.y+10)
        end
    elseif gameState == 3 then
        if Scene == 0 then
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            love.graphics.print("Restart", MBone.x+20,MBone.y+10)
            love.graphics.print("Settings", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Options", MBone.x+20,MBthr.y+10)
            love.graphics.print("Exit to Menu", MBone.x+20,MBfor.y+10)

        end
        if Scene == 1 then
            --Disabling "Video" until i make all the graphics size change on screen change
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            love.graphics.print("Audio", MBone.x+20,MBone.y+10)
            love.graphics.print("Controls", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Video", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 2 then
            menuAlpha.oneD = 0 
            menuAlpha.twoD = 0 
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.default)
            love.graphics.setFont(menuSize)
            love.graphics.print("No audio output is on or available", MBone.x+20,MBone.y+10)
            love.graphics.setColor(color.black)
            love.graphics.print("SFX", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 3 then
            menuAlpha.oneD = 0 
            menuAlpha.twoD = 0 
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.default)
            love.graphics.setFont(menuSize)
            love.graphics.print("No customizable controls are available", MBone.x+20,MBone.y+10)
            love.graphics.setColor(color.black)
            love.graphics.print("SFX", MBone.x+20,MBtwo.y+10)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
        if Scene == 4 then
            menuAlpha.threeD = 0 
            love.graphics.setColor(color.black)
            love.graphics.setFont(menuSize)
            if gamerStats == "on" then
                love.graphics.setColor(color.yellow)
            elseif gamerStats == "off" then
                love.graphics.setColor(color.red)
            end
            love.graphics.print("GamerStats:"..gamerStats, MBone.x+1,MBone.y+10)
            if spawnDisplay == "on" then
                love.graphics.setColor(color.yellow)
            elseif spawnDisplay == "off" then
                love.graphics.setColor(color.red)
            end
            love.graphics.print("SpawnTimer:"..spawnDisplay, MBone.x+1,MBtwo.y+10)
            love.graphics.setColor(color.black)
            love.graphics.print("Music", MBone.x+20,MBthr.y+10)
            love.graphics.print("Back", MBone.x+20,MBfor.y+10)
        end
    end
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(DefaultSize)
end

function resetOptions()
    menuAlpha.oneD = 1 
    menuAlpha.twoD = 1 
    menuAlpha.threeD = 1 
    menuAlpha.fourD = 1 
end