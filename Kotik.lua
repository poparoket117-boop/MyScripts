-- DrunixHub v5.0 "To Be, Not to Seem" (FoxnameHub Remake)
-- Оранжево-белый стиль | Мультяшный кот-философ
-- Убраны: 99 ночей, весь гринд-иллюзорный функционал
-- Оставлено: чистая механика, ESP, Speed, Fly, TP, Anti-AFK

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ===== GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DrunixHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 520)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local WhitePanel = Instance.new("Frame")
WhitePanel.Size = UDim2.new(0.96, 0, 0.93, 0)
WhitePanel.Position = UDim2.new(0.02, 0, 0.035, 0)
WhitePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WhitePanel.BackgroundTransparency = 0.1
WhitePanel.BorderSizePixel = 0
WhitePanel.Parent = MainFrame

-- ===== КОТ-ФИЛОСОФ (ЦЕНТР) =====
local CatFrame = Instance.new("Frame")
CatFrame.Size = UDim2.new(0, 70, 0, 70)
CatFrame.Position = UDim2.new(0.5, -35, 0.01, 0)
CatFrame.BackgroundTransparency = 1
CatFrame.Parent = WhitePanel

local CatImage = Instance.new("ImageLabel")
CatImage.Size = UDim2.new(1, 0, 1, 0)
CatImage.Image = "rbxassetid://6019171376" -- стандартный кот (можно заменить)
CatImage.BackgroundTransparency = 1
CatImage.Parent = CatFrame

-- Анимация кота
TweenService:Create(CatImage, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Rotation = 4,
    Size = UDim2.new(1.05, 0, 1.05, 0)
}):Play()

-- Мантра (смена текста)
local MantraLabel = Instance.new("TextLabel")
MantraLabel.Size = UDim2.new(0.8, 0, 0.07, 0)
MantraLabel.Position = UDim2.new(0.1, 0, 0.16, 0)
MantraLabel.Text = "🐾 Быть, а не казаться"
MantraLabel.TextColor3 = Color3.fromRGB(200, 100, 0)
MantraLabel.TextScaled = true
MantraLabel.Font = Enum.Font.ComicSans
MantraLabel.BackgroundTransparency = 1
MantraLabel.Parent = WhitePanel

local mantras = {
    "🐾 Быть, а не казаться",
    "😺 Сон → охота → сон",
    "🌙 Интерес ведёт, а не расчёт",
    "🎯 Я есть. Я не кажусь"
}
local mIdx = 1
RunService.Heartbeat:Connect(function()
    if math.floor(tick() * 0.2) % 6 == 0 then
        mIdx = mIdx % #mantras + 1
        MantraLabel.Text = mantras[mIdx]
    end
end)

-- ===== ЗАКРЫТИЕ =====
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(0.93, 0, 0.01, 0)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.Font = Enum.Font.ComicSans
CloseBtn.TextScaled = true
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- ===== ВКЛАДКИ (УПРОЩЁННЫЕ) =====
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, 0, 0, 32)
TabContainer.Position = UDim2.new(0, 0, 0, 0.2)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = WhitePanel

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(0.96, 0, 0.6, 0)
ContentFrame.Position = UDim2.new(0.02, 0, 0.34, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = WhitePanel

local tabs = {}
local function createTab(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.24, 0, 1, 0)
    btn.Position = UDim2.new(#tabs * 0.25 + 0.02, 0, 0, 0)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    btn.Font = Enum.Font.ComicSans
    btn.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
    btn.BorderSizePixel = 0
    btn.Parent = TabContainer
    btn.MouseButton1Click:Connect(function()
        for _, t in ipairs(tabs) do t.Button.BackgroundColor3 = Color3.fromRGB(255, 120, 0) end
        btn.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
        callback()
    end)
    table.insert(tabs, {Button = btn})
    return btn
end

local function clearContent()
    for _, child in ipairs(ContentFrame:GetChildren()) do child:Destroy() end
end

-- ===== ВКЛАДКА 1: О СЕБЕ =====
createTab("🐈 О себе", function()
    clearContent()
    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(0.9, 0, 0.85, 0)
    info.Position = UDim2.new(0.05, 0, 0.05, 0)
    info.Text = [[

    «Быть, а не казаться»

    Этот хаб — не про цифры.
    Он про состояние.

    Кот не гриндит. Кот живёт.

    — DrunixHub, версия кота

    F9 — скрыть/показать
    ПКМ — телепорт
    ]]
    info.TextColor3 = Color3.fromRGB(50,50,50)
    info.TextScaled = true
    info.BackgroundTransparency = 1
    info.Font = Enum.Font.ComicSans
    info.Parent = ContentFrame
end)

-- ===== ВКЛАДКА 2: ИГРОК =====
createTab("🎮 Игрок", function()
    clearContent()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    local currentSpeed = hum and hum.WalkSpeed or 16

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(0.6, 0, 0.12, 0)
    speedLabel.Position = UDim2.new(0.2, 0, 0.02, 0)
    speedLabel.Text = "Скорость: " .. currentSpeed
    speedLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
    speedLabel.TextScaled = true
    speedLabel.BackgroundTransparency = 1
    speedLabel.Font = Enum.Font.ComicSans
    speedLabel.Parent = ContentFrame

    local function setSpeed(val)
        local p = LocalPlayer.Character
        local h = p and p:FindFirstChild("Humanoid")
        if h then
            h.WalkSpeed = val
            speedLabel.Text = "Скорость: " .. val
        end
    end

    local speeds = {16, 50, 100, 188, 350}
    for i, spd in ipairs(speeds) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.16, 0, 0.1, 0)
        btn.Position = UDim2.new(0.04 + (i-1)*0.19, 0, 0.18, 0)
        btn.Text = tostring(spd)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
        btn.Font = Enum.Font.ComicSans
        btn.TextScaled = true
        btn.Parent = ContentFrame
        btn.MouseButton1Click:Connect(function() setSpeed(spd) end)
    end

    local catSpeedBtn = Instance.new("TextButton")
    catSpeedBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
    catSpeedBtn.Position = UDim2.new(0.25, 0, 0.35, 0)
    catSpeedBtn.Text = "😺 Как кот (рандом)"
    catSpeedBtn.TextColor3 = Color3.fromRGB(255,255,255)
    catSpeedBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
    catSpeedBtn.Font = Enum.Font.ComicSans
    catSpeedBtn.TextScaled = true
    catSpeedBtn.Parent = ContentFrame
    catSpeedBtn.MouseButton1Click:Connect(function()
        setSpeed(math.random(20, 350))
    end)

    local tpBtn = Instance.new("TextButton")
    tpBtn.Size = UDim2.new(0.6, 0, 0.12, 0)
    tpBtn.Position = UDim2.new(0.2, 0, 0.55, 0)
    tpBtn.Text = "📍 К спавну"
    tpBtn.TextColor3 = Color3.fromRGB(255,255,255)
    tpBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 0)
    tpBtn.Font = Enum.Font.ComicSans
    tpBtn.TextScaled = true
    tpBtn.Parent = ContentFrame
    tpBtn.MouseButton1Click:Connect(function()
        local spawn = workspace:FindFirstChild("SpawnLocation")
        if spawn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
        end
    end)
end)

-- ===== ВКЛАДКА 3: ФУНКЦИИ =====
createTab("⚡ Функции", function()
    clearContent()
    local states = {ESP = false, Fly = false, InfJump = false}
    local espObjects = {}
    local flySpeed = 60

    local function toggleESP()
        states.ESP = not states.ESP
        if states.ESP then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Size = Vector3.new(4,6,4)
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.fromRGB(255, 165, 0)
                    box.Transparency = 0.4
                    box.ZIndex = 10
                    box.Adornee = plr.Character.HumanoidRootPart
                    box.Parent = plr.Character
                    table.insert(espObjects, box)
                end
            end
            Players.PlayerAdded:Connect(function(plr)
                plr.CharacterAdded:Connect(function(char)
                    wait(0.5)
                    if states.ESP and char:FindFirstChild("HumanoidRootPart") then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Size = Vector3.new(4,6,4)
                        box.AlwaysOnTop = true
                        box.Color3 = Color3.fromRGB(255,165,0)
                        box.Transparency = 0.4
                        box.Adornee = char.HumanoidRootPart
                        box.Parent = char
                        table.insert(espObjects, box)
                    end
                end)
            end)
        else
            for _, obj in ipairs(espObjects) do obj:Destroy() end
            espObjects = {}
        end
    end

    local function toggleFly()
        states.Fly = not states.Fly
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = states.Fly
        end
    end

    local function toggleInfJump()
        states.InfJump = not states.InfJump
    end

    local function makeBtn(text, y, callback, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.7, 0, 0.1, 0)
        btn.Position = UDim2.new(0.15, 0, y, 0)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.BackgroundColor3 = color or Color3.fromRGB(255, 120, 0)
        btn.Font = Enum.Font.ComicSans
        btn.TextScaled = true
        btn.Parent = ContentFrame
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    makeBtn("🔶 ESP (вкл/выкл)", 0.05, toggleESP)
    makeBtn("✈️ Fly (вкл/выкл)", 0.2, toggleFly, Color3.fromRGB(255, 150, 0))
    makeBtn("🦘 Бесконечный прыжок", 0.35, toggleInfJump, Color3.fromRGB(255, 180, 0))

    -- Индикатор
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0.8, 0, 0.08, 0)
    status.Position = UDim2.new(0.1, 0, 0.55, 0)
    status.Text = "Статус: готов"
    status.TextColor3 = Color3.fromRGB(255, 140, 0)
    status.TextScaled = true
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.ComicSans
    status.Parent = ContentFrame

    -- Обновление статуса
    local function updateStatus()
        local s = {}
        if states.ESP then table.insert(s, "ESP") end
        if states.Fly then table.insert(s, "Fly") end
        if states.InfJump then table.insert(s, "InfJump") end
        status.Text = "Активно: " .. (#s > 0 and table.concat(s, ", ") or "ничего")
    end
    -- патчим кнопки для обновления
    for _, btn in ipairs(ContentFrame:GetChildren()) do
        if btn:IsA("TextButton") then
            local old = btn.MouseButton1Click
            btn.MouseButton1Click:Connect(function()
                wait(0.1)
                updateStatus()
            end)
        end
    end
end)

-- ===== АНТИ-AFK =====
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    wait(0.1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

-- ===== ТЕЛЕПОРТ ПО ПКМ =====
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        local mouse = LocalPlayer:GetMouse()
        if mouse and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 2, 0))
        end
    end
    if input.KeyCode == Enum.KeyCode.F9 then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- ===== FLY LOOP =====
RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end

    -- Fly
    if states and states.Fly then
        local move = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector * Vector3.new(1,0,1) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector * Vector3.new(1,0,1) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then
            move = move.Unit * flySpeed
        end
        hrp.Velocity = move
    end

    -- Infinite Jump
    if states and states.InfJump and hum:GetState() == Enum.HumanoidStateType.Jumping then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ===== АКТИВАЦИЯ ПЕРВОЙ ВКЛАДКИ =====
local firstTab = tabs[1]
if firstTab then
    firstTab.Button.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
    firstTab.Button.MouseButton1Click:Fire()
end

print("DrunixHub v5.0 загружен. Кот-философ приветствует тебя.")
