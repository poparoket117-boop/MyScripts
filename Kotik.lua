-- DrunixHub v10 (Круглая кнопка + мемный кот)
local Players=game:GetService("Players")
local Tween=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local lp=Players.LocalPlayer
local gui=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))

-- ===== КРУГЛАЯ КНОПКА ВХОДА (С МЕМНЫМ КОТОМ) =====
local enter=Instance.new("ImageButton",gui)
enter.Size=UDim2.new(0,80,0,80)
enter.Position=UDim2.new(0.5,-40,0.5,-40)
enter.Image="rbxassetid://6019171376" -- кот (можно заменить на любой мем)
enter.BackgroundColor3=Color3.fromRGB(255,165,0)
enter.BackgroundTransparency=0.2
enter.BorderSizePixel=0
-- Делаем круглым
local corner=Instance.new("UICorner",enter)
corner.CornerRadius=UDim.new(1,0)

-- Текст поверх (необязательно)
local label=Instance.new("TextLabel",enter)
label.Size=UDim2.new(1,0,1,0)
label.Text="Войти"
label.TextColor3=Color3.new(1,1,1)
label.TextScaled=true
label.Font=Enum.Font.ComicSans
label.BackgroundTransparency=1
label.ZIndex=2

-- ===== ПЕРЕТАСКИВАНИЕ КНОПКИ =====
local drag=false
local startPos
enter.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        drag=true
        startPos=i.Position
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
end)
UIS.InputChanged:Connect(function(i)
    if drag and i.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=i.Position-startPos
        local pos=enter.Position
        enter.Position=UDim2.new(pos.X.Scale,pos.X.Offset+delta.X,pos.Y.Scale,pos.Y.Offset+delta.Y)
    end
end)

-- ===== МЕНЮ (СКРЫТО) =====
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

-- ===== МЕМНЫЙ КОТ В МЕНЮ =====
local cat=Instance.new("ImageLabel",white)
cat.Size=UDim2.new(0,60,0,60)
cat.Position=UDim2.new(0.5,-30,0.05,0)
cat.Image="rbxassetid://6019171376"
cat.BackgroundTransparency=1

local title=Instance.new("TextLabel",white)
title.Size=UDim2.new(0.8,0,0.08,0)
title.Position=UDim2.new(0.1,0,0.2,0)
title.Text="😺 DrunixHub"
title.TextColor3=Color3.fromRGB(255,140,0)
title.TextScaled=true
title.Font=Enum.Font.ComicSans
title.BackgroundTransparency=1

-- ===== ТРИ КНОПКИ =====
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

-- ===== ЛОГИКА =====
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
end)

-- F9 показать/скрыть
UIS.InputBegan:Connect(function(i)
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
