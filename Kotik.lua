-- DrunixHub v9.0 (Минимальное меню)
local Players=game:GetService("Players")
local Tween=game:GetService("TweenService")
local lp=Players.LocalPlayer
local gui=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))

-- Кнопка входа
local enter=Instance.new("TextButton",gui)
enter.Size=UDim2.new(0,120,0,50)
enter.Position=UDim2.new(0.5,-60,0.5,-25)
enter.Text="🐱 Войти"
enter.TextColor3=Color3.new(1,1,1)
enter.BackgroundColor3=Color3.fromRGB(255,140,0)
enter.Font=Enum.Font.ComicSans
enter.TextScaled=true

-- Меню (скрыто)
local menu=Instance.new("Frame",gui)
menu.Size=UDim2.new(0,400,0,500)
menu.Position=UDim2.new(0.5,-200,0.5,-250)
menu.BackgroundColor3=Color3.fromRGB(255,165,0)
menu.BackgroundTransparency=0.1
menu.Active=true
menu.Draggable=true
menu.Visible=false

local white=Instance.new("Frame",menu)
white.Size=UDim2.new(0.96,0,0.93,0)
white.Position=UDim2.new(0.02,0,0.035,0)
white.BackgroundColor3=Color3.new(1,1,1)
white.BackgroundTransparency=0.15

local header=Instance.new("Frame",white)
header.Size=UDim2.new(1,0,0,60)
header.BackgroundTransparency=1

local title=Instance.new("TextLabel",header)
title.Size=UDim2.new(0.8,0,1,0)
title.Position=UDim2.new(0.1,0,0,0)
title.Text="😺 DrunixHub"
title.TextColor3=Color3.fromRGB(255,140,0)
title.TextScaled=true
title.Font=Enum.Font.ComicSans
title.BackgroundTransparency=1

-- Три кнопки (свернуть, полный экран, выход)
local function btn(text,x,cb,col)
    local b=Instance.new("TextButton",menu)
    b.Size=UDim2.new(0,30,0,30)
    b.Position=UDim2.new(x,0,0.01,0)
    b.Text=text
    b.TextColor3=Color3.new(1,1,1)
    b.BackgroundColor3=col or Color3.fromRGB(80,80,80)
    b.Font=Enum.Font.ComicSans
    b.TextScaled=true
    b.MouseButton1Click:Connect(cb)
    return b
end

local minBtn=btn("—",0.82,function()end)
local fullBtn=btn("⛶",0.88,function()end)
local closeBtn=btn("✕",0.94,function()end,Color3.fromRGB(200,0,0))

-- Текст по центру
local info=Instance.new("TextLabel",white)
info.Size=UDim2.new(0.85,0,0.5,0)
info.Position=UDim2.new(0.075,0,0.2,0)
info.Text="🐾 DrunixHub\nПросто меню\nБез функций\n\n— Наслаждайся"
info.TextColor3=Color3.fromRGB(40,40,40)
info.TextScaled=true
info.Font=Enum.Font.ComicSans
info.BackgroundTransparency=1

-- Логика
enter.MouseButton1Click:Connect(function()
    enter.Visible=false
    menu.Visible=true
end)

local minimized=false
minBtn.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then
        menu:TweenSize(UDim2.new(0,60,0,60),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0.01,0,0.01,0),"Out","Quad",0.3,true)
        white.Visible=false
        minBtn.Text="➕"
    else
        menu:TweenSize(UDim2.new(0,400,0,500),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0.5,-200,0.5,-250),"Out","Quad",0.3,true)
        white.Visible=true
        minBtn.Text="—"
    end
end)

local full=false
fullBtn.MouseButton1Click:Connect(function()
    full=not full
    if full then
        menu:TweenSize(UDim2.new(1,0,1,0),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0,0,0,0),"Out","Quad",0.3,true)
        fullBtn.Text="▣"
    else
        menu:TweenSize(UDim2.new(0,400,0,500),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0.5,-200,0.5,-250),"Out","Quad",0.3,true)
        fullBtn.Text="⛶"
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
    print("DrunixHub отключён")
end)

-- F9 скрыть/показать
game:GetService("UserInputService").InputBegan:Connect(function(i)
    if i.KeyCode==Enum.KeyCode.F9 then
        if menu.Visible then
            menu.Visible=false
            enter.Visible=true
        else
            menu.Visible=true
            enter.Visible=false
        end
    end
end)
