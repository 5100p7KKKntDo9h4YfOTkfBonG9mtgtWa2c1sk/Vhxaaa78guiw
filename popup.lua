local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DISCORD_ICON_ASSET_ID = ""
local discordLink = "https://discord.gg/uAMwhmzAcA"

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VolcanoHubX"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
screenGui.DisplayOrder = 100

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.35, 0)
frame.Size = UDim2.new(0.45, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(35, 39, 52)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local outerStroke = Instance.new("UIStroke")
outerStroke.Color = Color3.fromRGB(255, 70, 70)
outerStroke.Thickness = 3
outerStroke.Parent = frame

local innerStroke = Instance.new("UIStroke")
innerStroke.Color = Color3.fromRGB(255, 50, 50)
innerStroke.Thickness = 1
innerStroke.Transparency = 0.5
innerStroke.Parent = frame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Volcano Hub X"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.TextWrapped = true
title.Parent = frame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(205, 40, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 70, 70))
}
gradient.Parent = title

task.spawn(function()
    while title.Parent do
        for rot = 0, 360, 2 do
            gradient.Rotation = rot            
            title.TextColor3 = Color3.fromHSV((rot%360)/360, 0.7, 1)
            task.wait(0.02)
        end
    end
end)

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, 0, 0.2, 0)
subtitle.Position = UDim2.new(0, 0, 0.27, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Join our Discord for Script Updates"
subtitle.TextColor3 = Color3.fromRGB(255, 70, 70)
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 17
subtitle.TextWrapped = true
subtitle.Parent = frame

local subtitleShimmer = TweenService:Create(subtitle, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {TextTransparency = 0.3})
subtitleShimmer:Play()

local copyBtn = Instance.new("TextButton")
copyBtn.Name = "CopyButton"
copyBtn.Size = UDim2.new(0.43, 0, 0.23, 0)
copyBtn.Position = UDim2.new(0.07, 0, 0.62, 0)
copyBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.Font = Enum.Font.GothamSemibold
copyBtn.TextSize = 15
copyBtn.Text = "Copy Discord Link"
copyBtn.BorderSizePixel = 0
copyBtn.Parent = frame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 8)
copyCorner.Parent = copyBtn

local icon = Instance.new("ImageLabel")
icon.Name = "DiscordIcon"
icon.Size = UDim2.new(0, 22, 0, 22)
icon.Position = UDim2.new(0, 8, 0.5, -11)
icon.BackgroundTransparency = 1
icon.Image = DISCORD_ICON_ASSET_ID
icon.Parent = copyBtn

local exitBtn = Instance.new("TextButton")
exitBtn.Name = "ExitButton"
exitBtn.Size = UDim2.new(0.43, 0, 0.23, 0)
exitBtn.Position = UDim2.new(0.5, 0, 0.62, 0)
exitBtn.Text = "Exit"
exitBtn.Visible = false
exitBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
exitBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
exitBtn.Font = Enum.Font.GothamSemibold
exitBtn.TextSize = 15
exitBtn.BorderSizePixel = 0
exitBtn.Parent = frame

local exitCorner = Instance.new("UICorner")
exitCorner.CornerRadius = UDim.new(0, 8)
exitCorner.Parent = exitBtn

local waitBtn = Instance.new("TextButton")
waitBtn.Name = "WaittoExit"
waitBtn.Size = UDim2.new(0.43, 0, 0.23, 0)
waitBtn.Position = UDim2.new(0.5, 0, 0.62, 0)
waitBtn.Text = "Please wait..."
waitBtn.Visible = true
waitBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
waitBtn.TextColor3 = Color3.fromRGB(255, 110, 110)
waitBtn.Font = Enum.Font.GothamSemibold
waitBtn.TextSize = 15
waitBtn.BorderSizePixel = 0
waitBtn.Parent = frame

local waitCorner = Instance.new("UICorner")
waitCorner.CornerRadius = UDim.new(0, 8)
waitCorner.Parent = waitBtn

local fallbackBox = Instance.new("TextBox")
fallbackBox.Name = "FallbackCopyBox"
fallbackBox.Size = UDim2.new(1, 0, 0.18, 0)
fallbackBox.Position = UDim2.new(0, 0, 0.85, 0)
fallbackBox.Visible = false
fallbackBox.ClearTextOnFocus = false
fallbackBox.Text = ""
fallbackBox.Font = Enum.Font.Gotham
fallbackBox.TextSize = 14
fallbackBox.TextColor3 = Color3.fromRGB(30, 30, 30)
fallbackBox.BackgroundColor3 = Color3.fromRGB(240, 242, 245)
fallbackBox.BorderSizePixel = 0
fallbackBox.Parent = frame

local fbCorner = Instance.new("UICorner")
fbCorner.CornerRadius = UDim.new(0, 8)
fbCorner.Parent = fallbackBox

task.delay(4.5, function()
    waitBtn.Visible = false
    exitBtn.Visible = true
end)

copyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        pcall(function()
            setclipboard(discordLink)
        end)
        copyBtn.Text = "✔ Copied!"
        TweenService:Create(copyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90, 220, 60)}):Play()
        for i = 1, 12 do
            copyBtn.TextTransparency = i*0.07
            task.wait(0.03)
        end
        copyBtn.Text = "Copy Discord Link"
        TweenService:Create(copyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 60, 60)}):Play()
        copyBtn.TextTransparency = 0
    else
        fallbackBox.Text = discordLink
        fallbackBox.Visible = true
        pcall(function() fallbackBox:CaptureFocus() end)
    end
end)

exitBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Escape then
        screenGui.Enabled = false
    end
end)

local pulseTweenInfo = TweenInfo.new(
    1.2,
    Enum.EasingStyle.Sine,
    Enum.EasingDirection.InOut,
    -1,
    true
)
local biggerSize = UDim2.new(0.46, 0, 0.36, 0)
local pulseTween = TweenService:Create(frame, pulseTweenInfo, {Size = biggerSize})
pulseTween:Play()

local outerStrokeTween = TweenService:Create(outerStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Thickness = 6})
outerStrokeTween:Play()

local function addHover(btn, color)
    local originalSize = btn.Size
    local hoverSize = UDim2.new(originalSize.X.Scale + 0.02, originalSize.X.Offset, originalSize.Y.Scale + 0.03, originalSize.Y.Offset)
    local hoverInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local leaveInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, hoverInfo, {Size = hoverSize}):Play()
        TweenService:Create(btn, hoverInfo, {BackgroundColor3 = color:Lerp(Color3.new(1,1,1), 0.1)}):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, leaveInfo, {Size = originalSize}):Play()
        TweenService:Create(btn, leaveInfo, {BackgroundColor3 = color}):Play()
    end)
end

addHover(copyBtn, Color3.fromRGB(220, 60, 60))
addHover(waitBtn, Color3.fromRGB(60, 60, 60))
addHover(exitBtn, Color3.fromRGB(60, 60, 60))
