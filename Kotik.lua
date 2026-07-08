-- DrunixHub v7.0 "Рабочее меню + GUI"
-- Появляется по центру, перетаскивается, сворачивается, отключается

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local VirtualUser = game:GetService("VirtualUser")

-- ===== ГЛАВНЫЙ GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DrunixHub_Main"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- ===== ОСНОВНОЕ МЕНЮ (ПО ЦЕНТРУ) =====
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 500)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -250) -- строго по центру
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- встроенное перетаскивание
MainFrame.Parent = ScreenGui

-- Белая подложка
local WhitePanel = Instance.new("Frame")
WhitePanel.Size = UDim2.new(0.96, 0, 0.93, 0)
WhitePanel.Position = UDim2.new(0.02, 0, 0.035, 0)
WhitePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WhitePanel.BackgroundTransparency = 0.15
WhitePanel.BorderSizePixel = 0
WhitePanel.Parent = MainFrame

-- ===== ЗАГОЛОВОК С КОТОМ =====
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundTransparency = 1
Header.Parent = WhitePanel

local CatIcon = Instance.new("ImageLabel")
CatIcon.Size = UDim2.new(0, 50, 0, 50)
CatIcon.Position = UDim2.new(0.02, 0, 0.05, 0)
CatIcon.Image = "rbxassetid://6019171376"
CatIcon.BackgroundTransparency = 1
CatIcon.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0.15, 0, 0, 0)
Title.Text = "😺 DrunixHub"
Title.TextColor3 = Color3.fromRGB(255, 140, 0)
Title.TextScaled = true
Title.Font = Enum.Font.ComicSans
Title.BackgroundTransparency = 1
Title.Parent = Header

-- ===== КНОПКИ УПРАВЛЕНИЯ =====
-- 1. Свернуть
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(0.85, 0, 0.01, 0)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MinimizeBtn.Font = Enum.Font.ComicSans
MinimizeBtn.TextScaled = true
MinimizeBtn.Parent = MainFrame

-- 2. Отключить скрипт (крестик)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.93, 0, 0.01, 0)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.Font = Enum.Font.ComicSans
CloseBtn.TextScaled = true
CloseBtn.Parent = MainFrame

-- ===== ЦЕНТРАЛЬНОЕ ИНФО-ПОЛЕ =====
local InfoFrame = Instance.new("Frame")
InfoFrame.Size = UDim2.new(0.85, 0, 0.5, 0)
InfoFrame.Position = UDim2.new(0.075, 0, 0.2, 0)
InfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoFrame.BackgroundTransparency = 0.3
InfoFrame.BorderSizePixel = 0
InfoFrame.Parent = WhitePanel

local Mantra = Instance.new("TextLabel")
Mantra.Size = UDim2.new(0.9, 0, 0.9, 0)
Mantra.Position = UDim2.new(0.05, 0, 0.05, 0)
Mantra.Text = [[

🐾 Кот не планирует охоту.
Он спит. Когда мышь появляется — охота случается.

Твой уровень, скорость, валюты —
это просто игра. Не ищи в них смысл.

Наслаждайся моментом.
Как кот.

— DrunixHub
]]
Mantra.TextColor3 = Color3.fromRGB(40,40,40)
Mantra.TextScaled = true
Mantra.BackgroundTransparency = 1
Mantra.Font = Enum.Font.ComicSans
Mantra.Parent = InfoFrame

-- ===== СТАТУС-БАР =====
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(0.9, 0, 0.06, 0)
StatusBar.Position = UDim2.new(0.05, 0, 0.85, 0)
StatusBar.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
StatusBar.BackgroundTransparency = 0.4
StatusBar.BorderSizePixel = 0
StatusBar.Parent = WhitePanel

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.Text = "🐱 Меню активно"
StatusText.TextColor3 = Color3.fromRGB(255,255,255)
StatusText.TextScaled = true
StatusText.Font = Enum.Font.ComicSans
StatusText.BackgroundTransparency = 1
StatusText.Parent = StatusBar

-- ===== ЛОГИКА КНОПОК =====

-- Сворачивание / разворачивание
local minimized = false
local originalSize = MainFrame.Size
local originalPos = MainFrame.Position

MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        -- Сворачиваем в маленькую иконку (левый верхний угол)
        MainFrame:TweenSize(UDim2.new(0, 60, 0, 60), "Out", "Quad", 0.3, true)
        MainFrame:TweenPosition(UDim2.new(0.01, 0, 0.01, 0), "Out", "Quad", 0.3, true)
        WhitePanel.Visible = false
        MinimizeBtn.Text = "➕"
        StatusText.Text = "🐱 Меню свёрнуто"
    else
        -- Разворачиваем обратно
        MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
        MainFrame:TweenPosition(originalPos, "Out", "Quad", 0.3, true)
        WhitePanel.Visible = true
        MinimizeBtn.Text = "—"
        StatusText.Text = "🐱 Меню развёрнуто"
    end
end)

-- Полное отключение скрипта
CloseBtn.MouseButton1Click:Connect(function()
    StatusText.Text = "⏳ Отключение..."
    wait(0.5)
    ScreenGui:Destroy()
    -- Удаляем все созданные объекты (чистый выход)
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("ScreenGui") and obj.Name:find("Drunix") then
            obj:Destroy()
        end
    end
    print("DrunixHub отключён. Кот ушёл.")
end)

-- ===== ПЕРЕТАСКИВАНИЕ (ДУБЛИРУЮЩИЙ МЕХАНИЗМ) =====
-- Встроенный Draggable = true уже работает, но добавим захват за заголовок
local dragging = false
local dragStart, startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ===== ГОРЯЧИЕ КЛАВИШИ =====
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F9 then
        if minimized then
            minimized = false
            MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
            MainFrame:TweenPosition(originalPos, "Out", "Quad", 0.3, true)
            WhitePanel.Visible = true
            MinimizeBtn.Text = "—"
            StatusText.Text = "🐱 Меню развёрнуто"
        else
            MainFrame.Visible = not MainFrame.Visible
            StatusText.Text = MainFrame.Visible and "🐱 Меню видимо" or "🐱 Меню скрыто (F9)"
        end
    end
end)

-- ===== АНТИ-AFK =====
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    wait(0.1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

-- ===== АНИМАЦИЯ СТАТУСА =====
local msgs = {
    "🐱 Кот мурлычет",
    "🐾 Быть, а не казаться",
    "😺 Сон → охота → сон",
    "🌙 Интерес ведёт"
}
local idx = 1
RunService.Heartbeat:Connect(function()
    if math.floor(tick() * 0.2) % 6 == 0 and MainFrame.Visible and not minimized then
        idx = idx % #msgs + 1
        StatusText.Text = msgs[idx]
    end
end)

print("DrunixHub v7.0 загружен. Кот в центре экрана. F9 — скрыть/показать.")
