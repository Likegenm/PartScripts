local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KillauraGUI"
ScreenGui.Parent = Player.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 150)
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
TitleLabel.Text = "Killaura Control"
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
ToggleButton.Size = UDim2.new(0, 220, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "KILLAURA: OFF"
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.Parent = ContentFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

local RangeLabel = Instance.new("TextLabel")
RangeLabel.Size = UDim2.new(0, 100, 0, 20)
RangeLabel.Position = UDim2.new(0, 10, 0, 60)
RangeLabel.BackgroundTransparency = 1
RangeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
RangeLabel.Text = "Range: 15"
RangeLabel.Font = Enum.Font.Gotham
RangeLabel.TextSize = 12
RangeLabel.TextXAlignment = Enum.TextXAlignment.Left
RangeLabel.Parent = ContentFrame

local RangeBox = Instance.new("TextBox")
RangeBox.Size = UDim2.new(0, 50, 0, 20)
RangeBox.Position = UDim2.new(0, 120, 0, 60)
RangeBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RangeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
RangeBox.Text = "15"
RangeBox.Font = Enum.Font.Gotham
RangeBox.TextSize = 12
RangeBox.Parent = ContentFrame

local RangeCorner = Instance.new("UICorner")
RangeCorner.CornerRadius = UDim.new(0, 4)
RangeCorner.Parent = RangeBox

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Size = UDim2.new(0, 220, 0, 20)
KeyLabel.Position = UDim2.new(0, 10, 0, 90)
KeyLabel.BackgroundTransparency = 1
KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
KeyLabel.Text = "Key = K | Weapon: Bat | Auto Attack"
KeyLabel.Font = Enum.Font.Gotham
KeyLabel.TextSize = 10
KeyLabel.Parent = ContentFrame

local MinimizedButton = Instance.new("TextButton")
MinimizedButton.Size = UDim2.new(0, 40, 0, 40)
MinimizedButton.Position = UDim2.new(0, 10, 0, 10)
MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizedButton.Text = "K"
MinimizedButton.Font = Enum.Font.GothamBold
MinimizedButton.TextSize = 14
MinimizedButton.Visible = false
MinimizedButton.Parent = ScreenGui

local MinimizedCorner = Instance.new("UICorner")
MinimizedCorner.CornerRadius = UDim.new(0, 8)
MinimizedCorner.Parent = MinimizedButton

local killauraEnabled = false
local isMinimized = false
local killauraConnection

local attackRange = 15

local function animateOpen()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(Frame, tweenInfo, {Size = UDim2.new(0, 250, 0, 150)})
    local posTween = TweenService:Create(ContentFrame, tweenInfo, {Position = UDim2.new(0, 0, 0, 25)})
    Frame.Visible = true
    sizeTween:Play()
    posTween:Play()
end

local function animateClose()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local sizeTween = TweenService:Create(Frame, tweenInfo, {Size = UDim2.new(0, 250, 0, 25)})
    local posTween = TweenService:Create(ContentFrame, tweenInfo, {Position = UDim2.new(0, 0, 0, -150)})
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

local function updateValues()
    attackRange = tonumber(RangeBox.Text) or 15
    RangeLabel.Text = "Range: " .. attackRange
end

local function findBatTool()
    if Character then
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") and string.lower(tool.Name) == "bat" then
                return tool
            end
        end
    end
    return nil
end

local function equipBat()
    local bat = findBatTool()
    if bat then
        bat.Parent = Character
        bat:Activate()
        return true
    end
    return false
end

local function simulateMouseClick()
    if Character then
        local bat = findBatTool()
        if bat then
            bat:Activate()
        end
    end
end

local function checkPlayers()
    if not killauraEnabled or not Character or not Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    local myPosition = Character.HumanoidRootPart.Position
    local playerInRange = false
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = player.Character.HumanoidRootPart.Position
            local distance = (playerPosition - myPosition).Magnitude
            
            if distance <= attackRange then
                playerInRange = true
                break
            end
        end
    end
    
    if playerInRange then
        if equipBat() then
            simulateMouseClick()
        end
    end
end

local function toggleKillaura()
    killauraEnabled = not killauraEnabled
    
    if killauraEnabled then
        ToggleButton.Text = "KILLAURA: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        updateValues()
        
        killauraConnection = RunService.Heartbeat:Connect(function()
            checkPlayers()
        end)
        
    else
        ToggleButton.Text = "KILLAURA: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        if killauraConnection then
            killauraConnection:Disconnect()
            killauraConnection = nil
        end
    end
end

ToggleButton.MouseButton1Click:Connect(toggleKillaura)
MinimizedButton.MouseButton1Click:Connect(toggleMinimize)
MinimizeButton.MouseButton1Click:Connect(toggleMinimize)

RangeBox.FocusLost:Connect(function()
    updateValues()
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    if killauraConnection then
        killauraConnection:Disconnect()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.K then
        toggleKillaura()
    end
end)

warn("Not Discord Join")

Player.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    
    if killauraEnabled then
        killauraEnabled = false
        ToggleButton.Text = "KILLAURA: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        MinimizedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        if killauraConnection then
            killauraConnection:Disconnect()
            killauraConnection = nil
        end
    end
end)

Player.PlayerRemoving:Connect(function()
    if ScreenGui then
        ScreenGui:Destroy()
    end
    if killauraConnection then
        killauraConnection:Disconnect()
    end
end)

print("Likegenm scripts Killaura")
