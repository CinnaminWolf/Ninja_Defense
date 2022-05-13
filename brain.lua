brain = {}

function vTwo(x1,y1,x2,y2,width,height)
    if x2 < x1 and x1 < x2+width and y2 < y1 and y1 < y2+height then
        return true
    else
        return false
    end
end

function Round(num, dp)
    --[[
    Credit: https://stackoverflow.com/a/67917761

    round a number to so-many decimal of places, which can be negative, 
    e.g. -1 places rounds to 10's,  
    
    examples
        173.2562 rounded to 0 dps is 173.0
        173.2562 rounded to 2 dps is 173.26
        173.2562 rounded to -1 dps is 170.0
    ]]--
    local mult = 10^(dp or 0)
    return math.floor(num * mult + 0.5)/mult
end

function brain:update(dt)
    function midpointof(x1,x2,y1,y2)
        local midpoint = {} 
        midpoint.x = ((x1+x2)/2)
        midpoint.y = ((y1+y2)/2)
        return midpoint.x,midpoint.y
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end