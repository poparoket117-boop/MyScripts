-- DrunixHub v6.0 "Cat Meme Menu & 4K Wallpaper" (чистое меню)
-- Только GUI: обои с котом, мемные коты-декор, никаких пунктов.
-- Оранжево-белый стиль + философия "To Be, Not to Seem"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- ===== ГЛАВНЫЙ GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DrunixHub_Menu"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- ===== ФОН: ОБОИ 4K С КОТОМ (ИМИТАЦИЯ) =====
local Background = Instance.new("ImageLabel")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Image = "rbxassetid://6019171376" -- стандартный кот Roblox (можно заменить на любую текстуру)
Background.BackgroundTransparency = 1
Background.ImageColor3 = Color3.fromRGB(255, 200, 150) -- тёплый оранжевый оттенок
Background.ImageTransparency = 0.2 -- эффект "обоев"
Background.Parent = ScreenGui

-- Дополнительный слой для "зернистости" (эффект 4K)
local Grain = Instance.new("ImageLabel")
Grain.Size = UDim2.new(1, 0, 1, 0)
Grain.Image = "rbxassetid://5553946802" -- текстура шума (встроенная)
Grain.BackgroundTransparency = 1
Grain.ImageTransparency = 0.8
Grain.Parent = ScreenGui

-- ===== ОСНОВНАЯ ПАНЕЛЬ (МЕНЮ) =====
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 650)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -325)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- оранжевый
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Белая подложка с прозрачностью
local WhitePanel = Instance.new("Frame")
WhitePanel.Size = UDim2.new(0.96, 0, 0.94, 0)
WhitePanel.Position = UDim2.new(0.02, 0, 0.03, 0)
WhitePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WhitePanel.BackgroundTransparency = 0.15
WhitePanel.BorderSizePixel = 0
WhitePanel.Parent = MainFrame

-- ===== ЗАГОЛОВОК С МЕМНЫМ КОТОМ =====
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 80)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundTransparency = 1
Header.Parent = WhitePanel

-- Большой мемный кот (анимированный)
local MemeCat = Instance.new("ImageLabel")
MemeCat.Size = UDim2.new(0, 80, 0, 80)
MemeCat.Position = UDim2.new(0.5, -40, 0, 0)
MemeCat.Image = "rbxassetid://6019171376"
MemeCat.BackgroundTransparency = 1
MemeCat.Parent = Header

-- Анимация: кот "дышит" и слегка вращается
local catTween = TweenService:Create(MemeCat, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Size = UDim2.new(0, 85, 0, 85),
    Rotation = 3
})
catTween:Play()

-- Подпись под котом (философская)
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 1, -30)
Subtitle.Text = "😼 Быть, а не казаться"
Subtitle.TextColor3 = Color3.fromRGB(255, 140, 0)
Subtitle.TextScaled = true
Subtitle.Font = Enum.Font.ComicSans
Subtitle.BackgroundTransparency = 1
Subtitle.Parent = Header

-- ===== ДЕКОРАТИВНЫЕ МЕМНЫЕ КОТЫ (ПО УГЛАМ) =====
local function createMemeCat(posX, posY, size, rotation)
    local cat = Instance.new("ImageLabel")
    cat.Size = UDim2.new(0, size, 0, size)
    cat.Position = UDim2.new(posX, 0, posY, 0)
    cat.Image = "rbxassetid://6019171376"
    cat.BackgroundTransparency = 1
    cat.ImageColor3 = Color3.fromRGB(255, 200, 100)
    cat.ImageTransparency = 0.4
    cat.Rotation = rotation or 0
    cat.Parent = WhitePanel

    -- Лёгкое покачивание
    TweenService:Create(cat, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Rotation = (rotation or 0) + 5,
        Size = UDim2.new(0, size + 5, 0, size + 5)
    }):Play()
    return cat
end

-- Четыре мемных кота по углам
createMemeCat(0.02, 0.08, 50, -10)   -- левый верх
createMemeCat(0.88, 0.08, 50, 10)    -- правый верх
createMemeCat(0.02, 0.80, 50, 5)     -- левый низ
createMemeCat(0.88, 0.80, 50, -5)    -- правый низ

-- ===== ЦЕНТРАЛЬНОЕ ИНФОРМАЦИОННОЕ ПОЛЕ =====
local InfoFrame = Instance.new("Frame")
InfoFrame.Size = UDim2.new(0.8, 0, 0.4, 0)
InfoFrame.Position = UDim2.new(0.1, 0, 0.25, 0)
InfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoFrame.BackgroundTransparency = 0.2
InfoFrame.BorderSizePixel = 0
InfoFrame.Parent = WhitePanel

-- Текст-мантра (меняется)
local MantraLabel = Instance.new("TextLabel")
MantraLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
MantraLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
MantraLabel.Text = [[

🐾 Кот не планирует охоту.
Он спит. Когда мышь появляется — охота случается.

Твой уровень, скорость, валюты —
это просто игра. Не ищи в них смысл.

Наслаждайся моментом.
Как кот.

— DrunixHub
]]
MantraLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
MantraLabel.TextScaled = true
MantraLabel.BackgroundTransparency = 1
MantraLabel.Font = Enum.Font.ComicSans
MantraLabel.Parent = InfoFrame

-- ===== НИЖНЯЯ ПАНЕЛЬ (СТАТУС) =====
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(0.9, 0, 0.06, 0)
StatusBar.Position = UDim2.new(0.05, 0, 0.88, 0)
StatusBar.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
StatusBar.BackgroundTransparency = 0.5
StatusBar.BorderSizePixel = 0
StatusBar.Parent = WhitePanel

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.Text = "🐱 Меню загружено. Кот доволен."
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextScaled = true
StatusText.Font = Enum.Font.ComicSans
StatusText.BackgroundTransparency = 1
StatusText.Parent = StatusBar

-- ===== КНОПКА ЗАКРЫТИЯ (КРЕСТИК) =====
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(0.93, 0, 0.01, 0)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.Font = Enum.Font.ComicSans
CloseBtn.TextScaled = true
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    StatusText.Text = MainFrame.Visible and "🐱 Меню открыто" or "🐱 Меню скрыто (F9)"
end)

-- ===== ГОРЯЧАЯ КЛАВИША F9 =====
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F9 then
        MainFrame.Visible = not MainFrame.Visible
        StatusText.Text = MainFrame.Visible and "🐱 Меню открыто" or "🐱 Меню скрыто (F9)"
    end
end)

-- ===== АНИМАЦИЯ СТАТУСА (СМЕНА ТЕКСТА) =====
local statusMessages = {
    "🐱 Кот мурлычет...",
    "🐾 Быть, а не казаться",
    "😺 Сон → охота → сон",
    "🌙 Интерес ведёт, а не расчёт"
}
local msgIdx = 1
RunService.Heartbeat:Connect(function()
    if math.floor(tick() * 0.3) % 8 == 0 then
        msgIdx = msgIdx % #statusMessages + 1
        if MainFrame.Visible then
            StatusText.Text = statusMessages[msgIdx]
        end
    end
end)

-- ===== АНТИ-AFK (НА ВСЯКИЙ СЛУЧАЙ) =====
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(0.1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("DrunixHub v6.0: Чистое меню с котами загружено. Наслаждайся моментом.")
