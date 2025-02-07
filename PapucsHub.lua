-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Make Frame Draggable
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Create Buttons
local function createButton(text, position, itemName)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        if itemName == "Cat1" then
            -- Execute the loadstring script for Cat1
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
        elseif itemName == "Cat2" then
            -- Execute the loadstring script for Cat2
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
        elseif itemName == "Cat3" then
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-invisible-Script-25057"))()
        elseif itemName == "Cat4" then
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Credits"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a new Frame
local Frame = Instance.new("Frame")
Frame.Name = "CreditsFrame"
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

-- Create a new TextLabel
local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "CreditsText"
TextLabel.Size = UDim2.new(1, 0, 0, 25)
TextLabel.Text = "Created by papucsevo"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 16
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Parent = Frame

-- Create a new ImageLabel
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "AvatarImage"
ImageLabel.Size = UDim2.new(0, 80, 0, 80)
ImageLabel.Position = UDim2.new(0.5, -40, 0.3, 0)
ImageLabel.Parent = Frame

-- Get the user ID of papucsevo
local userId = game.Players:GetUserIdFromNameAsync("papucsevo")

-- Get the avatar image of papucsevo
local content, _ = game.Players:GetUser ThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
ImageLabel.Image = content
        end
    end)
end

createButton("Fly V2", UDim2.new(0, 10, 0, 10), "Cat1")
createButton("Zero Gravity", UDim2.new(0, 10, 0, 60), "Cat2")
createButton("Invis", UDim2.new(0, 10, 0, 110), "Cat3")
createButton("Credits", UDim2.new(0, 10, 0, 110), "Cat4")

-- Hide/Show UI with RightShift
local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift then
        frame.Visible = not frame.Visible
    end
end)
