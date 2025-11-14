local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FloatGUI"
ScreenGui.Parent = Player.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 100)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 25)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Text = "Float Control"
TitleLabel.Font = Enum.Font.Gotham
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -40, 0, 2)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 14
MinimizeButton.Parent = TitleBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -15, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 12
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -25)
ContentFrame.Position = UDim2.new(0, 0, 0, 25)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = Frame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 180, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "FLOAT: OFF"
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.Parent = ContentFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Size = UDim2.new(0, 180, 0, 20)
KeyLabel.Position = UDim2.new(0, 10, 0, 55)
KeyLabel.BackgroundTransparency = 1
KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
KeyLabel.Text = "Key = Q | Jump = Space"
KeyLabel.Font = Enum.Font.Gotham
KeyLabel.TextSize = 12
KeyLabel.Parent = ContentFrame

local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Size = UDim2.new(0, 40, 0, 40)
MinimizedButton.Position = UDim2.new(0, 10, 0, 10)
MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizedButton.Text = "F"
MinimizedButton.Font = Enum.Font.GothamBold
MinimizedButton.TextSize = 14
MinimizedButton.Visible = false
MinimizedButton.Parent = ScreenGui

local MinimizedCorner = Instance.new("UICorner")
MinimizedCorner.CornerRadius = UDim.new(0, 8)
MinimizedCorner.Parent = MinimizedButton

local floatEnabled = false
local isMinimized = false
local floatConnection

local function animateOpen()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(Frame, tweenInfo, {Size = UDim2.new(0, 220, 0, 100)})
    local posTween = TweenService:Create(ContentFrame, tweenInfo, {Position = UDim2.new(0, 0, 0, 25)})
    Frame.Visible = true
    sizeTween:Play()
    posTween:Play()
end

local function animateClose()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(Frame, tweenInfo, {Size = UDim2.new(0, 220, 0, 25)})
    local posTween = TweenService:Create(ContentFrame, tweenInfo, {Position = UDim2.new(0, 0, 0, -100)})
    sizeTween:Play()
    posTween:Play()
    wait(0.3)
    Frame.Visible = false
end

local function toggleMinimize()
    isMinimized = not isMinimized
    if isMinimized then
        animateClose()
        MinimizedButton.Visible = true
    else
        MinimizedButton.Visible = false
        animateOpen()
    end
end

local function infJump()
    if floatEnabled and Character and Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = Character.HumanoidRootPart
        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, 50, rootPart.Velocity.Z)
    end
end

local function toggleFloat()
    floatEnabled = not floatEnabled
    
    if floatEnabled then
        ToggleButton.Text = "FLOAT: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        floatConnection = RunService.Heartbeat:Connect(function()
            if floatEnabled and Character and Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = Character.HumanoidRootPart
                local currentVelocity = rootPart.Velocity
                
                if currentVelocity.Y < 0 then
                    rootPart.Velocity = Vector3.new(
                        currentVelocity.X,
                        currentVelocity.Y / 20,
                        currentVelocity.Z
                    )
                end
            end
        end)
        
    else
        ToggleButton.Text = "FLOAT: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        if floatConnection then
            floatConnection:Disconnect()
            floatConnection = nil
        end
    end
end

ToggleButton.MouseButton1Click:Connect(toggleFloat)
MinimizedButton.MouseButton1Click:Connect(toggleMinimize)
MinimizeButton.MouseButton1Click:Connect(toggleMinimize)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    if floatConnection then
        floatConnection:Disconnect()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q then
        toggleFloat()
    end
    
    if input.KeyCode == Enum.KeyCode.Space then
        infJump()
    end
end)

warn("Not Discord Join")

Player.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    
    if floatEnabled then
        floatEnabled = false
        ToggleButton.Text = "FLOAT: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        if floatConnection then
            floatConnection:Disconnect()
            floatConnection = nil
        end
    end
end)

Player.PlayerRemoving:Connect(function()
    if ScreenGui then
        ScreenGui:Destroy()
    end
    if floatConnection then
        floatConnection:Disconnect()
    end
end)

print("Likegenm scripts Float")
