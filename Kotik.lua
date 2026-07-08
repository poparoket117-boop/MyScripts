-- DrunixHub (Полная русская версия)
-- Адаптация FoxnameHub | Стиль: мемные коты

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ===== GUI С МЕМНЫМ КОТОМ =====
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "DrunixHub"

-- Круглая кнопка входа
local enter = Instance.new("ImageButton", gui)
enter.Size = UDim2.new(0, 80, 0, 80)
enter.Position = UDim2.new(0.5, -40, 0.5, -40)
enter.Image = "rbxassetid://6019171376" -- кот (можно заменить)
enter.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
enter.BackgroundTransparency = 0.2
local corner = Instance.new("UICorner", enter)
corner.CornerRadius = UDim.new(1, 0)

local label = Instance.new("TextLabel", enter)
label.Size = UDim2.new(1, 0, 1, 0)
label.Text = "Войти"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextScaled = true
label.Font = Enum.Font.ComicSans
label.BackgroundTransparency = 1

-- Основное меню (круглое)
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 350, 0, 450)
menu.Position = UDim2.new(0.5, -175, 0.5, -225)
menu.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
menu.BackgroundTransparency = 0.1
menu.Active = true
menu.Visible = false
local menuCorner = Instance.new("UICorner", menu)
menuCorner.CornerRadius = UDim.new(1, 0)

local white = Instance.new("Frame", menu)
white.Size = UDim2.new(0.92, 0, 0.92, 0)
white.Position = UDim2.new(0.04, 0, 0.04, 0)
white.BackgroundColor3 = Color3.new(1, 1, 1)
white.BackgroundTransparency = 0.15
local whiteCorner = Instance.new("UICorner", white)
whiteCorner.CornerRadius = UDim.new(1, 0)

-- Кот в меню
local cat = Instance.new("ImageLabel", white)
cat.Size = UDim2.new(0, 60, 0, 60)
cat.Position = UDim2.new(0.5, -30, 0.05, 0)
cat.Image = "rbxassetid://6019171376"
cat.BackgroundTransparency = 1

local title = Instance.new("TextLabel", white)
title.Size = UDim2.new(0.9, 0, 0.1, 0)
title.Position = UDim2.new(0.05, 0, 0.25, 0)
title.Text = "😺 DrunixHub"
title.TextColor3 = Color3.fromRGB(255, 140, 0)
title.TextScaled = true
title.Font = Enum.Font.ComicSans
title.BackgroundTransparency = 1

-- ===== КНОПКИ МЕНЮ =====
local function btn(text, y, cb, col)
    local b = Instance.new("TextButton", white)
    b.Size = UDim2.new(0.6, 0, 0.08, 0)
    b.Position = UDim2.new(0.2, 0, y, 0)
    b.Text = text
    b.TextColor3 = Color3.new(1, 1, 1)
    b.BackgroundColor3 = col or Color3.fromRGB(255, 120, 0)
    b.Font = Enum.Font.ComicSans
    b.TextScaled = true
    b.MouseButton1Click:Connect(cb)
    return b
end

-- Кнопки управления
local minBtn = btn("— Свернуть", 0.4, function() end)
local fullBtn = btn("⛶ На весь экран", 0.55, function() end)
local closeBtn = btn("✕ Выход", 0.7, function() end, Color3.fromRGB(200, 0, 0))

-- ===== ФУНКЦИОНАЛ (АДАПТИРОВАН ИЗ FOXNAMEHUB) =====
local killAuraEnabled = false
local killRange = 30
local targetList = {"Lost Child", "Pelt", "Deer", "PeltTrader", "Ram", "Owl"}

-- Kill Aura (переработан)
local function killAura()
    while killAuraEnabled do
        local player = lp
        local char = player.Character
        if not char then task.wait(0.5) continue end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then task.wait(0.5) continue end
        
        local weapon
        for _, child in ipairs(char:GetChildren()) do
            if child:IsA("Model") and child:GetAttribute("WeaponDamage") then
                weapon = child
                break
            end
        end
        if not weapon then task.wait(0.6) continue end
        
        for _, enemy in ipairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") then
                local isTarget = false
                for _, name in ipairs(targetList) do
                    if enemy.Name:find(name) then isTarget = true break end
                end
                if isTarget then continue end
                
                local enemyHrp = enemy.HumanoidRootPart
                if (hrp.Position - enemyHrp.Position).Magnitude <= killRange then
                    for _, tool in ipairs(lp.Backpack:GetChildren()) do
                        if tool:IsA("Tool") and tool:GetAttribute("WeaponDamage") == weapon:GetAttribute("WeaponDamage") then
                            task.spawn(function()
                                if killAuraEnabled then
                                    -- Вызов серверного метода (адаптирован)
                                    local args = {enemy, tool, "30_" .. tool:GetAttribute("Owner"), hrp.CFrame}
                                    tool.ToolDamageObject:InvokeServer(unpack(args))
                                end
                            end)
                        end
                    end
                end
            end
        end
        task.wait(0.6)
    end
end

-- ===== ЛОГИКА КНОПОК =====
enter.MouseButton1Click:Connect(function()
    enter.Visible = false
    menu.Visible = true
end)

-- Kill Aura (вкл/выкл)
local killBtn = btn("⚔️ Kill Aura", 0.85, function()
    killAuraEnabled = not killAuraEnabled
    if killAuraEnabled then
        killBtn.Text = "⚔️ Kill Aura (Вкл)"
        killBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        task.spawn(killAura)
    else
        killBtn.Text = "⚔️ Kill Aura (Выкл)"
        killBtn.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
    end
end, Color3.fromRGB(255, 120, 0))

-- Свернуть
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        menu:TweenSize(UDim2.new(0, 60, 0, 60), "Out", "Quad", 0.3, true)
        white.Visible = false
        minBtn.Text = "➕ Развернуть"
    else
        menu:TweenSize(UDim2.new(0, 350, 0, 450), "Out", "Quad", 0.3, true)
        white.Visible = true
        minBtn.Text = "— Свернуть"
    end
end)

-- Полный экран
local full = false
fullBtn.MouseButton1Click:Connect(function()
    full = not full
    if full then
        menu:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.3, true)
        menu:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.3, true)
        fullBtn.Text = "▣ Восстановить"
    else
        menu:TweenSize(UDim2.new(0, 350, 0, 450), "Out", "Quad", 0.3, true)
        menu:TweenPosition(UDim2.new(0.5, -175, 0.5, -225), "Out", "Quad", 0.3, true)
        fullBtn.Text = "⛶ На весь экран"
    end
end)

-- Выход
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ===== ПЕРЕТАСКИВАНИЕ =====
local drag = false
local startPos, startMouse

local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        drag = true
        startPos = menu.Position
        startMouse = input.Position
    end
end

local function endDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        drag = false
    end
end

local function moveDrag(input)
    if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - startMouse
        menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

menu.InputBegan:Connect(startDrag)
UIS.InputEnded:Connect(endDrag)
UIS.InputChanged:Connect(moveDrag)

-- ===== ГОРЯЧИЕ КЛАВИШИ =====
UIS.InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.F9 then
        if menu.Visible then
            menu.Visible = false
            enter.Visible = true
        else
            menu.Visible = true
            enter.Visible = false
        end
    end
end)

-- ===== АНТИ-AFK =====
local vu = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), camera.CFrame)
    wait(0.1)
    vu:Button2Up(Vector2.new(0, 0), camera.CFrame)
end)

print("DrunixHub (русская версия) загружен. Мемный кот приветствует тебя!")
