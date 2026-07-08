-- DrunixHub v11 (Круглое меню + сенсорное управление)
local Players=game:GetService("Players")
local Tween=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local lp=Players.LocalPlayer
local gui=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))

-- ===== КРУГЛАЯ КНОПКА ВХОДА =====
local enter=Instance.new("ImageButton",gui)
enter.Size=UDim2.new(0,80,0,80)
enter.Position=UDim2.new(0.5,-40,0.5,-40)
enter.Image="rbxassetid://6019171376"
enter.BackgroundColor3=Color3.fromRGB(255,165,0)
enter.BackgroundTransparency=0.2
local corner=Instance.new("UICorner",enter)
corner.CornerRadius=UDim.new(1,0)

local label=Instance.new("TextLabel",enter)
label.Size=UDim2.new(1,0,1,0)
label.Text="Войти"
label.TextColor3=Color3.new(1,1,1)
label.TextScaled=true
label.Font=Enum.Font.ComicSans
label.BackgroundTransparency=1

-- ===== ПЕРЕТАСКИВАНИЕ КНОПКИ (СЕНСОРНОЕ) =====
local drag=false
local startPos,startMouse
enter.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        drag=true
        startPos=enter.Position
        startMouse=i.Position
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        drag=false
    end
end)
UIS.InputChanged:Connect(function(i)
    if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local delta=i.Position-startMouse
        enter.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)

-- ===== КРУГЛОЕ МЕНЮ =====
local menu=Instance.new("Frame",gui)
menu.Size=UDim2.new(0,300,0,300)
menu.Position=UDim2.new(0.5,-150,0.5,-150)
menu.BackgroundColor3=Color3.fromRGB(255,165,0)
menu.BackgroundTransparency=0.1
menu.Active=true
menu.Visible=false
-- Делаем меню круглым
local menuCorner=Instance.new("UICorner",menu)
menuCorner.CornerRadius=UDim.new(1,0)

-- Белый круг внутри
local white=Instance.new("Frame",menu)
white.Size=UDim2.new(0.9,0,0.9,0)
white.Position=UDim2.new(0.05,0,0.05,0)
white.BackgroundColor3=Color3.new(1,1,1)
white.BackgroundTransparency=0.15
local whiteCorner=Instance.new("UICorner",white)
whiteCorner.CornerRadius=UDim.new(1,0)

-- ===== МЕМНЫЙ КОТ В МЕНЮ =====
local cat=Instance.new("ImageLabel",white)
cat.Size=UDim2.new(0,80,0,80)
cat.Position=UDim2.new(0.5,-40,0.1,0)
cat.Image="rbxassetid://6019171376"
cat.BackgroundTransparency=1

local title=Instance.new("TextLabel",white)
title.Size=UDim2.new(0.8,0,0.12,0)
title.Position=UDim2.new(0.1,0,0.4,0)
title.Text="😺 DrunixHub"
title.TextColor3=Color3.fromRGB(255,140,0)
title.TextScaled=true
title.Font=Enum.Font.ComicSans
title.BackgroundTransparency=1

-- Кнопки в круге
local function btn(text,y,cb,col)
    local b=Instance.new("TextButton",white)
    b.Size=UDim2.new(0.5,0,0.08,0)
    b.Position=UDim2.new(0.25,0,y,0)
    b.Text=text
    b.TextColor3=Color3.new(1,1,1)
    b.BackgroundColor3=col or Color3.fromRGB(255,120,0)
    b.Font=Enum.Font.ComicSans
    b.TextScaled=true
    b.MouseButton1Click:Connect(cb)
    return b
end

local minBtn=btn("—",0.6,function()end)
local fullBtn=btn("⛶",0.72,function()end)
local closeBtn=btn("✕",0.84,function()end,Color3.fromRGB(200,0,0))

-- ===== ЛОГИКА =====
enter.MouseButton1Click:Connect(function()
    enter.Visible=false
    menu.Visible=true
end)

-- Перетаскивание меню (сенсорное)
local menuDrag=false
local menuStartPos,menuStartMouse
menu.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        menuDrag=true
        menuStartPos=menu.Position
        menuStartMouse=i.Position
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        menuDrag=false
    end
end)
UIS.InputChanged:Connect(function(i)
    if menuDrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local delta=i.Position-menuStartMouse
        menu.Position=UDim2.new(menuStartPos.X.Scale,menuStartPos.X.Offset+delta.X,menuStartPos.Y.Scale,menuStartPos.Y.Offset+delta.Y)
    end
end)

-- Свернуть
local minimized=false
minBtn.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then
        menu:TweenSize(UDim2.new(0,60,0,60),"Out","Quad",0.3,true)
        white.Visible=false
        minBtn.Text="➕"
    else
        menu:TweenSize(UDim2.new(0,300,0,300),"Out","Quad",0.3,true)
        white.Visible=true
        minBtn.Text="—"
    end
end)

-- Полный экран
local full=false
fullBtn.MouseButton1Click:Connect(function()
    full=not full
    if full then
        menu:TweenSize(UDim2.new(1,0,1,0),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0,0,0,0),"Out","Quad",0.3,true)
        fullBtn.Text="▣"
    else
        menu:TweenSize(UDim2.new(0,300,0,300),"Out","Quad",0.3,true)
        menu:TweenPosition(UDim2.new(0.5,-150,0.5,-150),"Out","Quad",0.3,true)
        fullBtn.Text="⛶"
    end
end)

-- Выход
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- F9
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
