function love.conf(t)
    t.identity = nil                    
    t.appendidentity = false            
    t.version = "11.3"                  
    t.console = false                   
    t.accelerometerjoystick = true      
    t.externalstorage = false           
    t.gammacorrect = false              

    t.audio.mic = false                 
    t.audio.mixwithsystem = true        

    t.window.title = "ウォリアーディフェンス - Arcade Block"         -- Warrior Defense
    t.window.icon = "/assets/nimja.png" 
    t.window.width = 800                
    t.window.height = 600               
    t.window.borderless = false         
    t.window.resizable = false          
    t.window.minwidth = 1               
    t.window.minheight = 1              
    t.window.fullscreen = false         
    t.window.fullscreentype = "desktop" 
    t.window.vsync = 1                  
    t.window.msaa = 0                   
    t.window.depth = nil                
    t.window.stencil = nil              
    t.window.display = 1                
    t.window.highdpi = false            
    t.window.usedpiscale = true         
    t.window.x = nil                    
    t.window.y = nil             
end