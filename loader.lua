-- CatusX - Safe Demo Key UI
-- Fictional/demo UI only. No exploit functionality.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local DEMO_KEY = "CATUS-DEMO"
local KEY_LINK = "https://example.com/get-key"

local gui = Instance.new("ScreenGui")
gui.Name = "CatusX_Demo"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(380, 270)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(70, 70, 80)
stroke.Thickness = 1
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 45)
title.Position = UDim2.fromOffset(15, 10)
title.BackgroundTransparency = 1
title.Text = "CATUSX"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -30, 0, 25)
subtitle.Position = UDim2.fromOffset(15, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "KEY SYSTEM • DEMO"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 160)
subtitle.TextSize = 12
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -30, 0, 42)
keyBox.Position = UDim2.fromOffset(15, 85)
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "Enter demo key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 14
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = main

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 8)
boxCorner.Parent = keyBox

local verify = Instance.new("TextButton")
verify.Size = UDim2.new(0.48, -20, 0, 40)
verify.Position = UDim2.fromOffset(15, 140)
verify.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
verify.BorderSizePixel = 0
verify.Text = "VERIFY KEY"
verify.TextColor3 = Color3.fromRGB(255, 255, 255)
verify.TextSize = 13
verify.Font = Enum.Font.GothamBold
verify.Parent = main

local verifyCorner = Instance.new("UICorner")
verifyCorner.CornerRadius = UDim.new(0, 8)
verifyCorner.Parent = verify

local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.48, -20, 0, 40)
getKey.Position = UDim2.new(0.52, 5, 0, 140)
getKey.BackgroundColor3 = Color3.fromRGB(75, 75, 90)
getKey.BorderSizePixel = 0
getKey.Text = "GET KEY"
getKey.TextColor3 = Color3.fromRGB(255, 255, 255)
getKey.TextSize = 13
getKey.Font = Enum.Font.GothamBold
getKey.Parent = main

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 8)
getCorner.Parent = getKey

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 55)
status.Position = UDim2.fromOffset(15, 195)
status.BackgroundTransparency = 1
status.Text = "Status: Waiting for key..."
status.TextColor3 = Color3.fromRGB(170, 170, 180)
status.TextSize = 13
status.Font = Enum.Font.Gotham
status.TextWrapped = true
status.Parent = main

-- Demo verification
verify.MouseButton1Click:Connect(function()
	if keyBox.Text == DEMO_KEY then
		status.Text = "Key verified (Demo)\nNo exploit functions are enabled."
		status.TextColor3 = Color3.fromRGB(120, 220, 140)
	else
		status.Text = "ERROR: Invalid demo key"
		status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
end)

-- Safe GET KEY behavior.
-- Opens the supplied link in supported environments.
getKey.MouseButton1Click:Connect(function()
	status.Text = "Demo key: " .. DEMO_KEY
	status.TextColor3 = Color3.fromRGB(180, 180, 190)

	if setclipboard then
		setclipboard(KEY_LINK)
		status.Text = "Link copied!\nDemo key: " .. DEMO_KEY
	end
end)

-- Example group-error display.
-- This is intentionally only a visual/demo message.
local function showGroupError()
	status.Text = "ERROR: User not in group"
	status.TextColor3 = Color3.fromRGB(255, 100, 100)
end

-- Example:
-- showGroupError()
