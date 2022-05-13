require("click")
require("brain")
require("keyboard")
require("menu")

function love.load()
    controller:load()
    menu:load()
    math.randomseed(os.time())

    devtools = 0
    status = "not run"
    ScreenWidth = love.graphics.getWidth()
    ScreenHeight = love.graphics.getHeight()

    color={}
    color.default = {1,1,1}
    color.red = {1,0,0}
    color.green = {0,1,0}
    color.blue = {0,0,1}
    color.yellow = {1,0.83529411764,0}
    color.orange = {1,0.51764705882,0}
    color.black = {0,0,0}
    color.nimja = color.default

    bridge={}
    bridge.height=150
    bridge.width=ScreenWidth
    bridge.x=0
    bridge.y=(ScreenHeight-bridge.height)

    nimja={}
    nimja.height=64
    nimja.width=32
    nimja.spacing=5
    nimja.x = (ScreenWidth/2)-(nimja.width/2)
    nimja.y = (ScreenHeight-bridge.height)-(nimja.height+nimja.spacing)
    nimja.flow = 0
    nimja.mojo = 100
    nimja.MaxMojo = 100
    nimja.rest = 0

    Mojo = {}
    Mojo.redBar = nimja.width-4

    onies={}

    gameState = 0
    score = 0
    Gigachad = 0
    maxTime = 2
    timer = maxTime
    decreaseTime = 0.99

    position = {}
    position.one = 123
    position.two = 123
    
    input = "Spawn Timer: "..timer

    PrevClick = {}
    PrevClick.x = 0
    PrevClick.y = 0
end

function love.update(dt)
    controller:update(dt)
    brain:update(dt)
    menu:update(dt)
    bick()
    
    input = "Spawn Timer: "..Round(timer,2)


    if gameState == 2 then
        timer = timer - dt
        if timer <= 0 then
            spawnOni()
            maxTime = decreaseTime * maxTime
            timer = maxTime
        end
        if nimja.flow >= 1 and nimja.mojo >= 1 and nimja.rest == 0 then
            nimja.mojo = nimja.mojo - 1
        elseif nimja.flow == 0 and nimja.mojo <= 99.5 and nimja.rest == 0 then
            nimja.mojo = nimja.mojo + 0.5
        elseif nimja.flow >=1 and nimja.mojo <= 0 then
            if nimja.rest <= 0 then
                nimja.rest = nimja.rest + 100
                color.nimja = color.red
                nimja.flow = 0
            end
            color.nimja = color.red
            nimja.flow = 0
        elseif nimja.flow == 0 and nimja.mojo <= 0 and nimja.rest >= 1 then
            if nimja.rest <= 0 then
                nimja.rest = nimja.rest + 100
                color.nimja = color.orange
            end
            color.nimja = color.orange
        elseif nimja.flow == 0 and nimja.mojo >= 1 and nimja.rest == 0 then
            color.nimja = color.default
        end
        
        if nimja.rest >= 1 then
            nimja.rest = nimja.rest - 1
        end
    end

    for i,z in ipairs(onies) do
        if gameState == 2 then
            z.x = z.x + (math.cos( zombiePlayerAngle(z) ) * z.speed * dt)
            z.y = z.y + (math.sin( zombiePlayerAngle(z) ) * z.speed * dt)
        end

        if distanceBetween(z.x, z.y, nimja.x, nimja.y) < 30 and nimja.flow == z.color then
            z.dead = true
            nimja.mojo = nimja.mojo + 5
            score = score + 1
        elseif distanceBetween(z.x, z.y, nimja.x, nimja.y) < 30 and nimja.flow ~= z.color then
            gameState = 3
            z.dead = true
        end
    end

    for i=#onies,1,-1 do
        local z = onies[i]
        if z.dead == true then
            table.remove(onies, i)
        end
    end
end


function love.draw()
    menu:draw()
    if devtools == 1 then
        love.graphics.print(status)
    end
    if gameState == 2 then
        for i,z in ipairs(onies) do
            if z.color == 1 then
                love.graphics.setColor(color.yellow)
            elseif z.color == 2 then
                love.graphics.setColor(color.green)
            elseif z.color == 3 then
                love.graphics.setColor(color.blue)
            end
            love.graphics.rectangle("fill", z.x, z.y, nimja.width, nimja.height)
        end
        love.graphics.setColor(color.nimja)
        love.graphics.rectangle("line", nimja.x, nimja.y, nimja.width, nimja.height)
        love.graphics.setColor(color.default)
        love.graphics.rectangle("line", bridge.x,bridge.y, bridge.width, bridge.height)
        love.graphics.rectangle("line", nimja.x, nimja.y-25, nimja.width, 16)
        love.graphics.rectangle("fill", nimja.x+2, nimja.y-23, (Mojo.redBar*nimja.mojo-4)/100, 12)
        love.graphics.print(score, ScreenWidth/2,ScreenHeight/2)
        if spawnDisplay == "on" then
            love.graphics.print(input)
        end
        for i,z in ipairs(onies) do
            if z.color == 1 then
                love.graphics.setColor(color.yellow)
            elseif z.color == 2 then
                love.graphics.setColor(color.green)
            elseif z.color == 3 then
                love.graphics.setColor(color.blue)
            end
            position.one = (i-1) * 10
            position.two = nimja.x + position.one
            love.graphics.print(z.color,position.two, nimja.y-50)
            if gamerStats == "on" then
                if i == 1 then
                    if distanceBetween(z.x*1.04,z.y*1.04,nimja.x*1.04,nimja.y*1.05) <= 100 then
                        love.graphics.setColor(color.red)
                    else
                        love.graphics.setColor(color.default)
                    end
                    love.graphics.line(z.x*1.04,z.y*1.04,nimja.x*1.04,nimja.y*1.05)
                    love.graphics.print(Round(distanceBetween(z.x*1.04,z.y*1.04,nimja.x*1.04,nimja.y*1.05), 0), midpointof(z.x,z.y,nimja.x*1.04,nimja.y*1.05))
                end
            end
        end
    end
    if gameState == 3 then
        if Gigachad < score then
            love.graphics.print("New High Score: "..score,(ScreenWidth/2)+150,(ScreenHeight/2)-25)
            Gigachad = score
        elseif Gigachad >= score then
            love.graphics.print("Your Score: "..score,(ScreenWidth/2)+150,((ScreenHeight/2)-30))
            love.graphics.print("High Score: "..Gigachad,(ScreenWidth/2)+150,((ScreenHeight/2)-50))
        end
        love.graphics.setColor(color.green)
        love.graphics.print("Game Over!",(ScreenWidth/2)+150,(ScreenHeight/2)-10)
        love.graphics.rectangle("line",(ScreenWidth/2)+150,(ScreenHeight/2)-10,90,30)
    end
    if gameState == 1 then
        love.graphics.setColor(color.yellow)
        love.graphics.print("Paused...",(ScreenWidth/2)+150,(ScreenHeight/2)-10)
        love.graphics.rectangle("line",(ScreenWidth/2)+150,(ScreenHeight/2)-10,90,30)
    end
end

function spawnOni()
    local Oni = {}
    Oni.x = 0
    Oni.y = 0
    Oni.speed = math.ceil(math.random(150,200))
    Oni.dead = false
    Oni.color = math.ceil(math.random(1,3))
    local side = math.random(1, 2)
    if side == 1 then
        Oni.x = -30
        Oni.y = math.random(0, love.graphics.getHeight())
    elseif side == 2 then
        Oni.x = love.graphics.getWidth() + 30
        Oni.y = math.random(0, love.graphics.getHeight())
    end

    table.insert(onies, Oni)
end

function playerMouseAngle()
    return math.atan2( nimja.y - love.mouse.getY(), nimja.x - love.mouse.getX() ) + math.pi
end

function zombiePlayerAngle(enemy)
    return math.atan2( nimja.y - enemy.y, nimja.x - enemy.x )
end

function GameReset()
    math.randomseed(os.time())
    ScreenWidth = love.graphics.getWidth()
    ScreenHeight = love.graphics.getHeight()

    nimja={}
    nimja.height=64
    nimja.width=32
    nimja.spacing=5
    nimja.x = (ScreenWidth/2)-(nimja.width/2)
    nimja.y = (ScreenHeight-bridge.height)-(nimja.height+nimja.spacing)
    nimja.flow = 0
    nimja.mojo = 100
    nimja.MaxMojo = 100
    nimja.rest = 0

    Mojo = {}
    Mojo.redBar = nimja.width-4

    onies={}

    score = 0
    maxTime = 2
    timer = maxTime
    decreaseTime = 0.99

    position = {}
    position.one = 123
    position.two = 123
end

