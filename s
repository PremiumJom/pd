--[[
    JomHUB [PD PREMIUM]
    Theme: Solo Leveling (System Interface) - Modern & Safe
    Features: RGB, Perfect Alignment, Advanced ESP, Modular
]]

local I1l1I1lI1I11 = game:GetService("Players")
local IlIll11llII1 = game:GetService("TweenService")
local I1I1IIIlllII = game:GetService("RunService")
local lll1IlllIl11 = game:GetService("UserInputService")
local I1l1IlI11I1l = game:GetService("CoreGui")
local III111ll111I = game:GetService("Workspace")
local l1I11llII1lI = III111ll111I.CurrentCamera
local IlIll1IlII11 = I1l1I1lI1I11.LocalPlayer
local lIlII1lI1Ill = IlIll1IlII11:GetMouse()

-- // Configuration & Settings
local lIl1ll111Ill = {
    Theme = {
        Background = Color3.fromRGB(8, 10, 15),       -- Dark System Void
        Foreground = Color3.fromRGB(15, 18, 25),      -- Slightly lighter for panels
        Accent = Color3.fromRGB(0, 229, 255),         -- System Neon Blue
        Text = Color3.fromRGB(220, 220, 220),         -- White/Grey
        TextDark = Color3.fromRGB(130, 130, 150),     -- Muted Text
        Danger = Color3.fromRGB(255, 50, 50),         -- System Alert Red
        RGBEnabled = true
    },
    Combat = {
        Aimbot = false,
        AimPart = "Head",
        AimKey = Enum.UserInputType.MouseButton2,
            NoRecoil = false,
            InstaHit = false
        },
        Character = {
            ZoomEnabled = false,
            ZoomFOV = 20,
            ZoomKey = Enum.KeyCode.Z,
            FOV = 70    
    },
    ESP = {
        Player = { Box = false, Name = false, Distance = false, HealthBar = false, Line = false, Skeleton = false, HeadDot = false, Exposed = false },
        NPC = { Box = false, Name = false, Distance = false, HealthBar = false, Line = false, Skeleton = false, HeadDot = false, Exposed = false },
        Exit = { Box = false, Name = false, Distance = false },
        Loot = {},
        Dropped = false,
        DeadBodies = false,
        Mines = false,
        MaxDistance = 500,
        LootDistance = 500
    }
}

-- // UI Parent & Cleanup System
local function getUiParent()
    local lIIlIlI1l1Il, Il11III111ll = pcall(function() return gethui() end)
    if not lIIlIlI1l1Il or not Il11III111ll then lIIlIlI1l1Il, Il11III111ll = pcall(function() return I1l1IlI11I1l end) end
    if not lIIlIlI1l1Il or not Il11III111ll then Il11III111ll = IlIll1IlII11:WaitForChild("PlayerGui") end
    return Il11III111ll
end

for _, v in pairs(getUiParent():GetChildren()) do
    if v.Name == "JomHUB_PremiumSystem" then v:Destroy() end
end

local lI11l1IIlllI = {}
local IlIIIIIlI1ll = {}

local function RegisterConnection(conn) table.insert(lI11l1IIlllI, conn) return conn end
local function RegisterDrawing(draw) table.insert(IlIIIIIlI1ll, draw) return draw end

-- // GUI Framework Creation
local lI111IIIII11 = Instance.new("ScreenGui")
lI111IIIII11.Name = "JomHUB_PremiumSystem"
lI111IIIII11.ResetOnSpawn = false
lI111IIIII11.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
lI111IIIII11.Parent = getUiParent()

lI111IIIII11.Destroying:Connect(function()
    for _, conn in ipairs(lI11l1IIlllI) do if conn.Disconnect then conn:Disconnect() end end
    for _, draw in ipairs(IlIIIIIlI1ll) do if draw.Remove then draw:Remove() end end
end)

-- // Toggle Button
local ll111I11lIll = Instance.new("TextButton")
ll111I11lIll.Name = "OpenToggle"
ll111I11lIll.Size = UDim2.new(0, 45, 0, 45)
ll111I11lIll.Position = UDim2.new(0.5, -22, 0, 20)
ll111I11lIll.BackgroundColor3 = lIl1ll111Ill.Theme.Background
ll111I11lIll.BackgroundTransparency = 0.15
ll111I11lIll.Text = "J"
ll111I11lIll.TextColor3 = lIl1ll111Ill.Theme.Accent
ll111I11lIll.Font = Enum.Font.Code
ll111I11lIll.TextSize = 16
ll111I11lIll.BorderSizePixel = 0
ll111I11lIll.Parent = lI111IIIII11

local l1II111Illll = Instance.new("UICorner")
l1II111Illll.CornerRadius = UDim.new(0, 8)
l1II111Illll.Parent = ll111I11lIll

local IlIl1I1ll11I = Instance.new("UIStroke")
IlIl1I1ll11I.Color = lIl1ll111Ill.Theme.Accent
IlIl1I1ll11I.Thickness = 2
IlIl1I1ll11I.Parent = ll111I11lIll

local lllII1Il1lI1, IIll1llll11l, II1l1Il1Il11, l1I11l11IIlI
ll111I11lIll.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then lllII1Il1lI1 = true II1l1Il1Il11 = input.Position l1I11l11IIlI = ll111I11lIll.Position input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then lllII1Il1lI1 = false end end) end end)
ll111I11lIll.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then IIll1llll11l = input end end)
RegisterConnection(lll1IlllIl11.InputChanged:Connect(function(input) if input == IIll1llll11l and lllII1Il1lI1 then local II1I1I1IIIll = input.Position - II1l1Il1Il11 ll111I11lIll.Position = UDim2.new(l1I11l11IIlI.X.Scale, l1I11l11IIlI.X.Offset + II1I1I1IIIll.X, l1I11l11IIlI.Y.Scale, l1I11l11IIlI.Y.Offset + II1I1I1IIIll.Y) end end))

-- // Main Window
local Il1lI1IlllII = Instance.new("Frame")
Il1lI1IlllII.Name = "SystemWindow"
Il1lI1IlllII.Size = UDim2.new(0, 650, 0, 420)
Il1lI1IlllII.Position = UDim2.new(0.5, -325, 0.5, -210)
Il1lI1IlllII.BackgroundColor3 = lIl1ll111Ill.Theme.Background
Il1lI1IlllII.BackgroundTransparency = 0.15 -- Glassmorphism
Il1lI1IlllII.BorderSizePixel = 0
Il1lI1IlllII.ClipsDescendants = true
Il1lI1IlllII.Active = true
Il1lI1IlllII.Parent = lI111IIIII11

ll111I11lIll.MouseButton1Click:Connect(function()
    if Il1lI1IlllII then Il1lI1IlllII.Visible = not Il1lI1IlllII.Visible end
end)

local ll1lIIl1Ill1 = Instance.new("UICorner")
ll1lIIl1Ill1.CornerRadius = UDim.new(0, 8)
ll1lIIl1Ill1.Parent = Il1lI1IlllII

-- RGB Stroke
local IIl1lIl11lI1 = Instance.new("UIStroke")
IIl1lIl11lI1.Color = lIl1ll111Ill.Theme.Accent
IIl1lIl11lI1.Thickness = 2
IIl1lIl11lI1.Parent = Il1lI1IlllII

task.spawn(function()
    local I1111I1lI1II = 0
    while lI111IIIII11.Parent do
        if lIl1ll111Ill.Theme.RGBEnabled then
            I1111I1lI1II = I1111I1lI1II + 0.002
            if I1111I1lI1II > 1 then I1111I1lI1II = 0 end
            local ll1I1l1II1II = Color3.fromHSV(I1111I1lI1II, 1, 1)
            IIl1lIl11lI1.Color = ll1I1l1II1II
            IlIl1I1ll11I.Color = ll1I1l1II1II
        else
            IIl1lIl11lI1.Color = lIl1ll111Ill.Theme.Accent
            IlIl1I1ll11I.Color = lIl1ll111Ill.Theme.Accent
        end
        task.wait()
    end
end)

-- // Header & Dragging
local ll11l1lIIl1I = Instance.new("Frame")
ll11l1lIIl1I.Size = UDim2.new(1, 0, 0, 40)
ll11l1lIIl1I.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
ll11l1lIIl1I.BackgroundTransparency = 0.5
ll11l1lIIl1I.BorderSizePixel = 0
ll11l1lIIl1I.Parent = Il1lI1IlllII

local lIlI1Il1IllI = Instance.new("TextLabel")
lIlI1Il1IllI.Size = UDim2.new(1, -20, 1, 0)
lIlI1Il1IllI.Position = UDim2.new(0, 15, 0, 0)
lIlI1Il1IllI.BackgroundTransparency = 1
lIlI1Il1IllI.Text = "[ PREMIUM SCRIPT ]"
lIlI1Il1IllI.Font = Enum.Font.Code
lIlI1Il1IllI.TextSize = 16
lIlI1Il1IllI.TextColor3 = lIl1ll111Ill.Theme.Accent
lIlI1Il1IllI.TextXAlignment = Enum.TextXAlignment.Left
lIlI1Il1IllI.Parent = ll11l1lIIl1I

local lII1llIIl111, lII1lI1l1I11, lIllllI1IIIl, lIlIlI1lII11
ll11l1lIIl1I.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        lII1llIIl111 = true lIllllI1IIIl = input.Position lIlIlI1lII11 = Il1lI1IlllII.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then lII1llIIl111 = false end end)
    end
end)
ll11l1lIIl1I.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then lII1lI1l1I11 = input end
end)
RegisterConnection(lll1IlllIl11.InputChanged:Connect(function(input)
    if input == lII1lI1l1I11 and lII1llIIl111 then
        local II1I1I1IIIll = input.Position - lIllllI1IIIl
        Il1lI1IlllII.Position = UDim2.new(lIlIlI1lII11.X.Scale, lIlIlI1lII11.X.Offset + II1I1I1IIIll.X, lIlIlI1lII11.Y.Scale, lIlIlI1lII11.Y.Offset + II1I1I1IIIll.Y)
    end
end))

-- // Sidebar System
local l11ll1Ill1l1 = Instance.new("Frame")
l11ll1Ill1l1.Size = UDim2.new(0, 140, 1, -40)
l11ll1Ill1l1.Position = UDim2.new(0, 0, 0, 40)
l11ll1Ill1l1.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
l11ll1Ill1l1.BackgroundTransparency = 0.3
l11ll1Ill1l1.BorderSizePixel = 0
l11ll1Ill1l1.Parent = Il1lI1IlllII

local llI11lIIll1l = Instance.new("UIListLayout")
llI11lIIll1l.Padding = UDim.new(0, 5)
llI11lIIll1l.HorizontalAlignment = Enum.HorizontalAlignment.Center
llI11lIIll1l.SortOrder = Enum.SortOrder.LayoutOrder
llI11lIIll1l.Parent = l11ll1Ill1l1

local II1IllIIl11I = Instance.new("UIPadding")
II1IllIIl11I.PaddingTop = UDim.new(0, 10)
II1IllIIl11I.Parent = l11ll1Ill1l1

local lIIll1llIIlI = Instance.new("Frame")
lIIll1llIIlI.Size = UDim2.new(1, -140, 1, -40)
lIIll1llIIlI.Position = UDim2.new(0, 140, 0, 40)
lIIll1llIIlI.BackgroundTransparency = 1
lIIll1llIIlI.Parent = Il1lI1IlllII

-- // System Notifications
local function Notify(title, text, duration)
    -- Custom notification implementation here if needed
    print("[SYSTEM] " .. title .. ": " .. text)
end

-- // Tab System (Perfect Align)
local Il1Il111II1I = {}
local Il1Ill1IIl1l = nil

local function CreateTab(name, icon)
    local llI1IIllI1Il = Instance.new("TextButton")
    llI1IIllI1Il.Size = UDim2.new(0.9, 0, 0, 35)
    llI1IIllI1Il.BackgroundColor3 = lIl1ll111Ill.Theme.Background
    llI1IIllI1Il.BackgroundTransparency = 0.5
    llI1IIllI1Il.Text = name:upper()
    llI1IIllI1Il.TextColor3 = lIl1ll111Ill.Theme.TextDark
    llI1IIllI1Il.Font = Enum.Font.Code
    llI1IIllI1Il.TextSize = 13
    llI1IIllI1Il.Parent = l11ll1Ill1l1
    Instance.new("UICorner", llI1IIllI1Il).CornerRadius = UDim.new(0, 6)
    
    local lI1llIl1Il1I = Instance.new("ScrollingFrame")
    lI1llIl1Il1I.Size = UDim2.new(1, -20, 1, -20)
    lI1llIl1Il1I.Position = UDim2.new(0, 10, 0, 10)
    lI1llIl1Il1I.BackgroundTransparency = 1
    lI1llIl1Il1I.ScrollBarThickness = 2
    lI1llIl1Il1I.Visible = false
    lI1llIl1Il1I.Parent = lIIll1llIIlI
    
    -- Two perfectly aligned columns
    local l11l111lIlI1 = Instance.new("Frame")
    l11l111lIlI1.Size = UDim2.new(0.48, 0, 1, 0)
    l11l111lIlI1.BackgroundTransparency = 1
    l11l111lIlI1.Parent = lI1llIl1Il1I
    local llllII1l11lI = Instance.new("UIListLayout")
    llllII1l11lI.Padding = UDim.new(0, 8)
    llllII1l11lI.SortOrder = Enum.SortOrder.LayoutOrder
    llllII1l11lI.Parent = l11l111lIlI1
    
    local Il1I1IlII1Il = Instance.new("Frame")
    Il1I1IlII1Il.Size = UDim2.new(0.48, 0, 1, 0)
    Il1I1IlII1Il.Position = UDim2.new(0.52, 0, 0, 0)
    Il1I1IlII1Il.BackgroundTransparency = 1
    Il1I1IlII1Il.Parent = lI1llIl1Il1I
    local l11Il1lI11I1 = Instance.new("UIListLayout")
    l11Il1lI11I1.Padding = UDim.new(0, 8)
    l11Il1lI11I1.SortOrder = Enum.SortOrder.LayoutOrder
    l11Il1lI11I1.Parent = Il1I1IlII1Il
    
    local function UpdateCanvas()
        local l1II11I1ll1l = math.max(llllII1l11lI.AbsoluteContentSize.Y, l11Il1lI11I1.AbsoluteContentSize.Y)
        lI1llIl1Il1I.CanvasSize = UDim2.new(0, 0, 0, l1II11I1ll1l + 20)
    end
    llllII1l11lI:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)
    l11Il1lI11I1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)
    
    llI1IIllI1Il.MouseButton1Click:Connect(function()
        if Il1Ill1IIl1l then
            Il1Ill1IIl1l.Btn.TextColor3 = lIl1ll111Ill.Theme.TextDark
            Il1Ill1IIl1l.Frame.Visible = false
            IlIll11llII1:Create(Il1Ill1IIl1l.Btn, TweenInfo.new(0.2), {BackgroundColor3 = lIl1ll111Ill.Theme.Background}):Play()
        end
        Il1Ill1IIl1l = {Btn = llI1IIllI1Il, Frame = lI1llIl1Il1I}
        llI1IIllI1Il.TextColor3 = lIl1ll111Ill.Theme.Accent
        lI1llIl1Il1I.Visible = true
        IlIll11llII1:Create(llI1IIllI1Il, TweenInfo.new(0.2), {BackgroundColor3 = lIl1ll111Ill.Theme.Foreground}):Play()
    end)
    
    if not Il1Ill1IIl1l then
        Il1Ill1IIl1l = {Btn = llI1IIllI1Il, Frame = lI1llIl1Il1I}
        llI1IIllI1Il.TextColor3 = lIl1ll111Ill.Theme.Accent
        lI1llIl1Il1I.Visible = true
        llI1IIllI1Il.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
    end
    
    return l11l111lIlI1, Il1I1IlII1Il
end

-- // UI Component Builders
local function CreateSection(Il11III111ll, title)
    local II1IIIlII1Il = Instance.new("TextLabel")
    II1IIIlII1Il.Size = UDim2.new(1, 0, 0, 20)
    II1IIIlII1Il.BackgroundTransparency = 1
    II1IIIlII1Il.Text = title
    II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Accent
    II1IIIlII1Il.Font = Enum.Font.Code
    II1IIIlII1Il.TextSize = 14
    II1IIIlII1Il.TextXAlignment = Enum.TextXAlignment.Left
    II1IIIlII1Il.Parent = Il11III111ll
end

local function CreateToggle(Il11III111ll, text, default, callback)
    local IIll1ll1IlIl = Instance.new("TextButton")
    IIll1ll1IlIl.Size = UDim2.new(1, 0, 0, 32)
    IIll1ll1IlIl.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
    IIll1ll1IlIl.BackgroundTransparency = 0.2
    IIll1ll1IlIl.Text = ""
    IIll1ll1IlIl.AutoButtonColor = false
    IIll1ll1IlIl.Parent = Il11III111ll
    Instance.new("UICorner", IIll1ll1IlIl).CornerRadius = UDim.new(0, 4)
    
    local II1IIIlII1Il = Instance.new("TextLabel")
    II1IIIlII1Il.Size = UDim2.new(1, -40, 1, 0)
    II1IIIlII1Il.Position = UDim2.new(0, 10, 0, 0)
    II1IIIlII1Il.BackgroundTransparency = 1
    II1IIIlII1Il.Text = text
    II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Text
    II1IIIlII1Il.Font = Enum.Font.Code
    II1IIIlII1Il.TextSize = 12
    II1IIIlII1Il.TextXAlignment = Enum.TextXAlignment.Left
    II1IIIlII1Il.Parent = IIll1ll1IlIl
    
    local I1ll1l1IIlll = Instance.new("Frame")
    I1ll1l1IIlll.Size = UDim2.new(0, 16, 0, 16)
    I1ll1l1IIlll.Position = UDim2.new(1, -26, 0.5, -8)
    I1ll1l1IIlll.BackgroundColor3 = default and lIl1ll111Ill.Theme.Accent or lIl1ll111Ill.Theme.Background
    I1ll1l1IIlll.Parent = IIll1ll1IlIl
    Instance.new("UICorner", I1ll1l1IIlll).CornerRadius = UDim.new(0, 4)
    local lIIII1l1l1lI = Instance.new("UIStroke")
    lIIII1l1l1lI.Color = lIl1ll111Ill.Theme.Accent
    lIIII1l1l1lI.Parent = I1ll1l1IIlll
    
    local lIlllII1Illl = default
    IIll1ll1IlIl.MouseButton1Click:Connect(function()
        lIlllII1Illl = not lIlllII1Illl
        IlIll11llII1:Create(I1ll1l1IIlll, TweenInfo.new(0.2), {BackgroundColor3 = lIlllII1Illl and lIl1ll111Ill.Theme.Accent or lIl1ll111Ill.Theme.Background}):Play()
        callback(lIlllII1Illl)
    end)
    
    -- Run initial callback silently
    task.spawn(callback, lIlllII1Illl)
end

local function CreateSlider(Il11III111ll, text, min, l1II11I1ll1l, default, callback)
    local II11ll1l1Il1 = Instance.new("Frame")
    II11ll1l1Il1.Size = UDim2.new(1, 0, 0, 45)
    II11ll1l1Il1.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
    II11ll1l1Il1.BackgroundTransparency = 0.2
    II11ll1l1Il1.Parent = Il11III111ll
    Instance.new("UICorner", II11ll1l1Il1).CornerRadius = UDim.new(0, 4)
    
    local II1IIIlII1Il = Instance.new("TextLabel")
    II1IIIlII1Il.Size = UDim2.new(1, -10, 0, 20)
    II1IIIlII1Il.Position = UDim2.new(0, 10, 0, 2)
    II1IIIlII1Il.BackgroundTransparency = 1
    II1IIIlII1Il.Text = text .. " : " .. default
    II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Text
    II1IIIlII1Il.Font = Enum.Font.Code
    II1IIIlII1Il.TextSize = 12
    II1IIIlII1Il.TextXAlignment = Enum.TextXAlignment.Left
    II1IIIlII1Il.Parent = II11ll1l1Il1
    
    local ll11111l1II1 = Instance.new("Frame")
    ll11111l1II1.Size = UDim2.new(1, -20, 0, 6)
    ll11111l1II1.Position = UDim2.new(0, 10, 0, 28)
    ll11111l1II1.BackgroundColor3 = lIl1ll111Ill.Theme.Background
    ll11111l1II1.BorderSizePixel = 0
    ll11111l1II1.Parent = II11ll1l1Il1
    Instance.new("UICorner", ll11111l1II1).CornerRadius = UDim.new(1, 0)
    
    local l1111IlI1IIl = Instance.new("Frame")
    l1111IlI1IIl.Size = UDim2.new((default - min) / (l1II11I1ll1l - min), 0, 1, 0)
    l1111IlI1IIl.BackgroundColor3 = lIl1ll111Ill.Theme.Accent
    l1111IlI1IIl.BorderSizePixel = 0
    l1111IlI1IIl.Parent = ll11111l1II1
    Instance.new("UICorner", l1111IlI1IIl).CornerRadius = UDim.new(1, 0)
    
    local IIlI1ll1ll1l = Instance.new("TextButton")
    IIlI1ll1ll1l.Size = UDim2.new(1, 0, 1, 0)
    IIlI1ll1ll1l.BackgroundTransparency = 1
    IIlI1ll1ll1l.Text = ""
    IIlI1ll1ll1l.Parent = ll11111l1II1
    
    local lII1llIIl111 = false
    IIlI1ll1ll1l.MouseButton1Down:Connect(function() lII1llIIl111 = true end)
    RegisterConnection(lll1IlllIl11.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then lII1llIIl111 = false end end))
    RegisterConnection(lll1IlllIl11.InputChanged:Connect(function(input)
        if lII1llIIl111 and input.UserInputType == Enum.UserInputType.MouseMovement then
            local lllIl1IIl1II = math.clamp((input.Position.X - ll11111l1II1.AbsolutePosition.X) / ll11111l1II1.AbsoluteSize.X, 0, 1)
            local IIlI1IIlIIll = math.floor(min + ((l1II11I1ll1l - min) * lllIl1IIl1II))
            l1111IlI1IIl.Size = UDim2.new(lllIl1IIl1II, 0, 1, 0)
            II1IIIlII1Il.Text = text .. " : " .. IIlI1IIlIIll
            callback(IIlI1IIlIIll)
        end
    end))
end

local function CreateKeybind(Il11III111ll, text, default, callback)
    local IIll1ll1IlIl = Instance.new("TextButton")
    IIll1ll1IlIl.Size = UDim2.new(1, 0, 0, 32)
    IIll1ll1IlIl.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
    IIll1ll1IlIl.BackgroundTransparency = 0.2
    IIll1ll1IlIl.Text = ""
    IIll1ll1IlIl.AutoButtonColor = false
    IIll1ll1IlIl.Parent = Il11III111ll
    Instance.new("UICorner", IIll1ll1IlIl).CornerRadius = UDim.new(0, 4)
    
    local II1IIIlII1Il = Instance.new("TextLabel")
    II1IIIlII1Il.Size = UDim2.new(1, -10, 1, 0)
    II1IIIlII1Il.Position = UDim2.new(0, 10, 0, 0)
    II1IIIlII1Il.BackgroundTransparency = 1
    local lII111IIllll = default and (default.Name or default.UserInputType.Name) or "NONE"
    if lII111IIllll == "MouseButton2" then lII111IIllll = "RMB" elseif lII111IIllll == "MouseButton1" then lII111IIllll = "LMB" end
    II1IIIlII1Il.Text = text .. " : " .. lII111IIllll
    II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Text
    II1IIIlII1Il.Font = Enum.Font.Code
    II1IIIlII1Il.TextSize = 12
    II1IIIlII1Il.TextXAlignment = Enum.TextXAlignment.Left
    II1IIIlII1Il.Parent = IIll1ll1IlIl
    
    local l1lI11Il1l1I = false
    IIll1ll1IlIl.MouseButton1Click:Connect(function()
        if l1lI11Il1l1I then return end
        l1lI11Il1l1I = true
        II1IIIlII1Il.Text = text .. " : ..."
        II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Accent
        
        local IIll1II1l1Il
        IIll1II1l1Il = lll1IlllIl11.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType.Name:find("MouseButton") then
                IIll1II1l1Il:Disconnect()
                l1lI11Il1l1I = false
                
                local IIlI1IIlIIll = (input.UserInputType == Enum.UserInputType.Keyboard) and input.KeyCode or input.UserInputType
                local I1lI11l1IllI = IIlI1IIlIIll.Name
                if I1lI11l1IllI == "MouseButton1" then I1lI11l1IllI = "LMB"
                elseif I1lI11l1IllI == "MouseButton2" then I1lI11l1IllI = "RMB"
                elseif I1lI11l1IllI == "MouseButton3" then I1lI11l1IllI = "MMB" end
                
                II1IIIlII1Il.Text = text .. " : " .. I1lI11l1IllI
                II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Text
                callback(IIlI1IIlIIll)
            end
        end)
    end)
    task.spawn(callback, default)
end

local function CreateCycle(Il11III111ll, text, options, defaultIdx, callback)
    local IIll1ll1IlIl = Instance.new("TextButton")
    IIll1ll1IlIl.Size = UDim2.new(1, 0, 0, 32)
    IIll1ll1IlIl.BackgroundColor3 = lIl1ll111Ill.Theme.Foreground
    IIll1ll1IlIl.BackgroundTransparency = 0.2
    IIll1ll1IlIl.Text = ""
    IIll1ll1IlIl.AutoButtonColor = false
    IIll1ll1IlIl.Parent = Il11III111ll
    Instance.new("UICorner", IIll1ll1IlIl).CornerRadius = UDim.new(0, 4)
    
    local II1IIIlII1Il = Instance.new("TextLabel")
    II1IIIlII1Il.Size = UDim2.new(1, -10, 1, 0)
    II1IIIlII1Il.Position = UDim2.new(0, 10, 0, 0)
    II1IIIlII1Il.BackgroundTransparency = 1
    II1IIIlII1Il.Text = text .. " : " .. options[defaultIdx]
    II1IIIlII1Il.TextColor3 = lIl1ll111Ill.Theme.Text
    II1IIIlII1Il.Font = Enum.Font.Code
    II1IIIlII1Il.TextSize = 12
    II1IIIlII1Il.TextXAlignment = Enum.TextXAlignment.Left
    II1IIIlII1Il.Parent = IIll1ll1IlIl
    
    local Il1lIl1ll1II = defaultIdx
    IIll1ll1IlIl.MouseButton1Click:Connect(function()
        Il1lIl1ll1II = (Il1lIl1ll1II % #options) + 1
        II1IIIlII1Il.Text = text .. " : " .. options[Il1lIl1ll1II]
        callback(options[Il1lIl1ll1II])
    end)
    task.spawn(callback, options[defaultIdx])
end

-- // ESP System & Renderer
local l1ll1I1lI1II = {}

-- Create reusable Drawing objects for ESP
local function CreateESPDrawings()
    local l1Il1IIIll11 = {}
    l1Il1IIIll11.Box = RegisterDrawing(Drawing.new("Square"))
    l1Il1IIIll11.Box.Thickness = 1.5
    l1Il1IIIll11.Box.Filled = false
    
    l1Il1IIIll11.HealthBg = RegisterDrawing(Drawing.new("Line"))
    l1Il1IIIll11.HealthBg.Thickness = 6
    l1Il1IIIll11.HealthBg.Color = Color3.fromRGB(0, 0, 0)
    
    l1Il1IIIll11.HealthFill = RegisterDrawing(Drawing.new("Line"))
    l1Il1IIIll11.HealthFill.Thickness = 4
    
    l1Il1IIIll11.Name = RegisterDrawing(Drawing.new("Text"))
    l1Il1IIIll11.Name.Size = 14
    l1Il1IIIll11.Name.Center = true
    l1Il1IIIll11.Name.Outline = true
    l1Il1IIIll11.Name.Color = Color3.fromRGB(255, 255, 255)
    
    l1Il1IIIll11.Distance = RegisterDrawing(Drawing.new("Text"))
    l1Il1IIIll11.Distance.Size = 12
    l1Il1IIIll11.Distance.Center = true
    l1Il1IIIll11.Distance.Outline = true
    l1Il1IIIll11.Distance.Color = Color3.fromRGB(200, 200, 200)
    
    l1Il1IIIll11.Tracer = RegisterDrawing(Drawing.new("Line"))
    l1Il1IIIll11.Tracer.Thickness = 1
    
    l1Il1IIIll11.HeadDot = RegisterDrawing(Drawing.new("Circle"))
    l1Il1IIIll11.HeadDot.Filled = true
    l1Il1IIIll11.HeadDot.Thickness = 1
    
    l1Il1IIIll11.ExposedText = RegisterDrawing(Drawing.new("Text"))
    l1Il1IIIll11.ExposedText.Size = 13
    l1Il1IIIll11.ExposedText.Center = true
    l1Il1IIIll11.ExposedText.Outline = true
    l1Il1IIIll11.ExposedText.Color = lIl1ll111Ill.Theme.Danger

    l1Il1IIIll11.SkeletonLines = {}
    for i = 1, 14 do
        local III1IlIIllIl = RegisterDrawing(Drawing.new("Line"))
        III1IlIIllIl.Thickness = 1.5
        III1IlIIllIl.Visible = false
        table.insert(l1Il1IIIll11.SkeletonLines, III1IlIIllIl)
    end
    
    return l1Il1IIIll11
end

local function ClearDrawings(l1Il1IIIll11)
    if not l1Il1IIIll11 then return end
    l1Il1IIIll11.Box.Visible = false l1Il1IIIll11.HealthBg.Visible = false l1Il1IIIll11.HealthFill.Visible = false
    l1Il1IIIll11.Name.Visible = false l1Il1IIIll11.Distance.Visible = false l1Il1IIIll11.Tracer.Visible = false l1Il1IIIll11.HeadDot.Visible = false
    for _, III1IlIIllIl in ipairs(l1Il1IIIll11.SkeletonLines) do III1IlIIllIl.Visible = false end
end

local function RemoveDrawings(l1Il1IIIll11)
    if not l1Il1IIIll11 then return end
    l1Il1IIIll11.Box:Remove() l1Il1IIIll11.HealthBg:Remove() l1Il1IIIll11.HealthFill:Remove()
    l1Il1IIIll11.Name:Remove() l1Il1IIIll11.Distance:Remove() l1Il1IIIll11.Tracer:Remove() l1Il1IIIll11.HeadDot:Remove()
    for _, III1IlIIllIl in ipairs(l1Il1IIIll11.SkeletonLines) do III1IlIIllIl:Remove() end
end

-- ESP Target Gatherer Loop (Runs slowly to preserve FPS)
task.spawn(function()
    while lI111IIIII11.Parent do
        local lllll111lll1 = {}
        
        local IllIllll111l = lIl1ll111Ill.ESP.Player.Box or lIl1ll111Ill.ESP.Player.Name or lIl1ll111Ill.ESP.Player.Distance or lIl1ll111Ill.ESP.Player.HealthBar or lIl1ll111Ill.ESP.Player.Line or lIl1ll111Ill.ESP.Player.Skeleton or lIl1ll111Ill.ESP.Player.HeadDot
        local l1II11IllIl1 = lIl1ll111Ill.ESP.NPC.Box or lIl1ll111Ill.ESP.NPC.Name or lIl1ll111Ill.ESP.NPC.Distance or lIl1ll111Ill.ESP.NPC.HealthBar or lIl1ll111Ill.ESP.NPC.Line or lIl1ll111Ill.ESP.NPC.Skeleton or lIl1ll111Ill.ESP.NPC.HeadDot
        local Il1lI1lllllI = lIl1ll111Ill.ESP.Exit.Box or lIl1ll111Ill.ESP.Exit.Name or lIl1ll111Ill.ESP.Exit.Distance
        
        -- Players
        if IllIllll111l then
            for _, p in pairs(I1l1I1lI1I11:GetPlayers()) do
                if p ~= IlIll1IlII11 and p.Character then
                    local llIl1l11I1II = p.Character
                    local llI1I1II1Ill = llIl1l11I1II:FindFirstChild("Humanoid")
                    local ll1II1lIlIll = llIl1l11I1II:FindFirstChild("HumanoidRootPart") or llIl1l11I1II:FindFirstChild("Torso")
                    if llI1I1II1Ill and ll1II1lIlIll and llI1I1II1Ill.Health > 0 then
                        table.insert(lllll111lll1, {Obj = llIl1l11I1II, Hrp = ll1II1lIlIll, Hum = llI1I1II1Ill, Type = "Player", Name = p.Name, Color = Color3.fromRGB(0, 255, 100)})
                    end
                end
            end
        end
        
        -- Enemy NPCs
        if l1II11IllIl1 then
            local III111lII11I = { {Node = III111ll111I, Desc = false} }
            local II1I1IlI1llI = III111ll111I:FindFirstChild("AiZones")
            if II1I1IlI1llI then table.insert(III111lII11I, {Node = II1I1IlI1llI, Desc = true}) end
            
            for _, fData in ipairs(III111lII11I) do
                local l1IlIlI1111I = fData.Desc and fData.Node:GetDescendants() or fData.Node:GetChildren()
                for _, llIl1l11I1II in pairs(l1IlIlI1111I) do
                    if llIl1l11I1II:IsA("Model") and llIl1l11I1II ~= IlIll1IlII11.Character then
                        local l1l1llll1lll = (llIl1l11I1II.Name == "MI24V")
                        local llI1I1II1Ill = llIl1l11I1II:FindFirstChild("Humanoid")
                        local ll1II1lIlIll = llIl1l11I1II:FindFirstChild("HumanoidRootPart") or llIl1l11I1II:FindFirstChild("Torso") or (l1l1llll1lll and (llIl1l11I1II.PrimaryPart or llIl1l11I1II:FindFirstChildWhichIsA("BasePart", true)))
                        
                        if l1l1llll1lll and ll1II1lIlIll then
                            table.insert(lllll111lll1, {Obj = llIl1l11I1II, Hrp = ll1II1lIlIll, Hum = llI1I1II1Ill, Type = "NPC", Name = "[HELI] MI24V", Color = Color3.fromRGB(255, 50, 50)})
                        elseif llI1I1II1Ill and ll1II1lIlIll and llI1I1II1Ill.Health > 0 and not I1l1I1lI1I11:GetPlayerFromCharacter(llIl1l11I1II) then
                            table.insert(lllll111lll1, {Obj = llIl1l11I1II, Hrp = ll1II1lIlIll, Hum = llI1I1II1Ill, Type = "NPC", Name = llIl1l11I1II.Name, Color = Color3.fromRGB(255, 50, 50)})
                        end
                    end
                end
            end
        end
        
        -- Exits
        if Il1lI1lllllI then
            local Ill11I11lII1 = III111ll111I:FindFirstChild("NoCollision")
            if Ill11I11lII1 and Ill11I11lII1:FindFirstChild("ExitLocations") then
                for _, exit in pairs(Ill11I11lII1.ExitLocations:GetChildren()) do
                    table.insert(lllll111lll1, {Obj = exit, Hrp = exit, Type = "Exit", Name = "Extraction", Color = Color3.fromRGB(0, 200, 255)})
                end
            end
        end
        
        -- Loot Gatherer
        local l11IIlIlIlI1 = false
        for _, v in pairs(lIl1ll111Ill.ESP.Loot) do if v then l11IIlIlIlI1 = true break end end
        
        if l11IIlIlIlI1 then
            local lIlI1IlIl111 = {
                {Node = III111ll111I, Descendants = false},
                {Node = III111ll111I:FindFirstChild("Containers"), Descendants = true},
                {Node = III111ll111I:FindFirstChild("LootContainers"), Descendants = true}
            }
            for _, fData in ipairs(lIlI1IlIl111) do
                if fData.Node then
                    local l1IlIlI1111I = fData.Descendants and fData.Node:GetDescendants() or fData.Node:GetChildren()
                    for _, v in pairs(l1IlIlI1111I) do
                        if v:IsA("Model") or v:IsA("BasePart") then
                            local lIII1lIllI1I = nil
                            for lootName, enabled in pairs(lIl1ll111Ill.ESP.Loot) do
                                if enabled and (v.Name == lootName or string.find(v.Name, lootName)) then
                                    lIII1lIllI1I = lootName
                                    break
                                end
                            end

                            if lIII1lIllI1I then
                                local I1I1lIllIl1l = v:IsA("BasePart") and v or (v:IsA("Model") and (v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)))
                                if I1I1lIllIl1l then
                                    local IlIIlIIllI1l = ""
                                    local llllI11l11l1 = v:FindFirstChild("Inventory")
                                    if llllI11l11l1 then
                                        local l1IlIlI1111I = {}
                                        for _, item in pairs(llllI11l11l1:GetChildren()) do table.insert(l1IlIlI1111I, item.Name) end
                                        if #l1IlIlI1111I > 0 then IlIIlIIllI1l = "\n[" .. table.concat(l1IlIlI1111I, ", ") .. "]" end
                                    end
                                    
                                    local llIl1lllI1I1 = Color3.fromRGB(200, 200, 200)
                                    if lIII1lIllI1I:find("Military") or lIII1lIllI1I == "GrenadeCrate" then llIl1lllI1I1 = Color3.fromRGB(0, 255, 100)
                                    elseif lIII1lIllI1I:find("Bag") then llIl1lllI1I1 = Color3.fromRGB(255, 200, 50)
                                    elseif lIII1lIllI1I:find("SupplyDrop") or lIII1lIllI1I:find("Shipping") or lIII1lIllI1I == "LargeABPOPABox" then llIl1lllI1I1 = Color3.fromRGB(50, 150, 255) end
                                    
                                    table.insert(lllll111lll1, {Obj = v, Hrp = I1I1lIllIl1l, Type = "Loot", Name = string.format("[%s]%s", lIII1lIllI1I:upper(), IlIIlIIllI1l), Color = llIl1lllI1I1})
                                end
                            end
                        end
                    end
                end
            end
        end
        
        if lIl1ll111Ill.ESP.Dropped or lIl1ll111Ill.ESP.DeadBodies then
            local Illl1l1l1ll1 = III111ll111I:FindFirstChild("DroppedItems")
            if Illl1l1l1ll1 then
                for _, v in pairs(Illl1l1l1ll1:GetChildren()) do
                    local l1I1II1III1I = v:FindFirstChild("Humanoid") or v:FindFirstChild("Head") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("Torso")
                    local I1I1lIllIl1l = v:IsA("BasePart") and v or (v:IsA("Model") and (v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)))
                    if I1I1lIllIl1l and I1I1lIllIl1l:IsA("BasePart") then
                        if l1I1II1III1I and lIl1ll111Ill.ESP.DeadBodies then
                            table.insert(lllll111lll1, {Obj = v, Hrp = I1I1lIllIl1l, Type = "Loot", Name = string.format("[BODY: %s]", v.Name:upper()), Color = Color3.fromRGB(200, 50, 50)})
                        elseif not l1I1II1III1I and lIl1ll111Ill.ESP.Dropped then
                            table.insert(lllll111lll1, {Obj = v, Hrp = I1I1lIllIl1l, Type = "Loot", Name = string.format("[DROP: %s]", v.Name:upper()), Color = Color3.fromRGB(255, 255, 255)})
                        end
                    end
                end
            end
        end
        
        if lIl1ll111Ill.ESP.Mines then
            local Ill11I11lII1 = III111ll111I:FindFirstChild("NoCollision")
            local ll11l1lllllI = Ill11I11lII1 and Ill11I11lII1:FindFirstChild("AiZones")
            local lI11II1ll1ll = ll11l1lllllI and ll11l1lllllI:FindFirstChild("BridgeClaymores")
            if lI11II1ll1ll then
                for _, v in pairs(lI11II1ll1ll:GetChildren()) do
                    local II1IlIIIlII1 = v:FindFirstChild("SpawnedItem")
                    if II1IlIIIlII1 and II1IlIIIlII1:IsA("ObjectValue") and II1IlIIIlII1.Value then
                            local I1I1lIllIl1l = II1IlIIIlII1.Value:IsA("BasePart") and II1IlIIIlII1.Value or (II1IlIIIlII1.Value:IsA("Model") and (II1IlIIIlII1.Value.PrimaryPart or II1IlIIIlII1.Value:FindFirstChildWhichIsA("BasePart", true)))
                        if I1I1lIllIl1l and I1I1lIllIl1l:IsA("BasePart") then table.insert(lllll111lll1, {Obj = II1IlIIIlII1.Value, Hrp = I1I1lIllIl1l, Type = "Loot", Name = "[CLAYMORE]", Color = lIl1ll111Ill.Theme.Danger}) end
                    end
                end
            end
            local ll1I1l1l1lII = III111ll111I:FindFirstChild("AiZones")
            local lIIllll1lII1 = ll1I1l1l1lII and ll1I1l1l1lII:FindFirstChild("OutpostLandmines")
            if lIIllll1lII1 then
                for _, v in pairs(lIIllll1lII1:GetChildren()) do
                        local I1I1lIllIl1l = v:IsA("BasePart") and v or (v:IsA("Model") and (v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)))
                    if I1I1lIllIl1l and I1I1lIllIl1l:IsA("BasePart") then table.insert(lllll111lll1, {Obj = v, Hrp = I1I1lIllIl1l, Type = "Loot", Name = "[LANDMINE]", Color = lIl1ll111Ill.Theme.Danger}) end
                end
            end
            local IIlI1l1ll1I1 = ll1I1l1l1lII and ll1I1l1l1lII:FindFirstChild("ShipWreckClaymores")
            if IIlI1l1ll1I1 then
                for _, v in pairs(IIlI1l1ll1I1:GetChildren()) do
                    local II1IlIIIlII1 = v:FindFirstChild("SpawnedItem")
                    local llIl1l11I1II = (II1IlIIIlII1 and II1IlIIIlII1:IsA("ObjectValue") and II1IlIIIlII1.Value) or v
                    local I1I1lIllIl1l = llIl1l11I1II:IsA("BasePart") and llIl1l11I1II or (llIl1l11I1II:IsA("Model") and (llIl1l11I1II.PrimaryPart or llIl1l11I1II:FindFirstChildWhichIsA("BasePart", true)))
                    if I1I1lIllIl1l and I1I1lIllIl1l:IsA("BasePart") then table.insert(lllll111lll1, {Obj = llIl1l11I1II, Hrp = I1I1lIllIl1l, Type = "Loot", Name = "[CLAYMORE]", Color = lIl1ll111Ill.Theme.Danger}) end
                end
            end
        end

        l1ll1I1lI1II = lllll111lll1
        task.wait(1)
    end
end)

local lI11l1l1IlIl = {}

-- Core ESP Render Loop (Runs every frame)
RegisterConnection(I1I1IIIlllII.RenderStepped:Connect(function()
    local lllI11IIIIII = {}
    local III1l1llIIll = Vector2.new(l1I11llII1lI.ViewportSize.X / 2, l1I11llII1lI.ViewportSize.Y)
    local lIIII1lI1l11 = IlIll1IlII11.Character and IlIll1IlII11.Character:FindFirstChild("HumanoidRootPart") and IlIll1IlII11.Character.HumanoidRootPart.Position
    
    for _, t in ipairs(l1ll1I1lI1II) do
        if not t.Obj or not t.Obj.Parent then continue end
        
        local l1l1ll1l1ll1 = lIIII1lI1l11 and (lIIII1lI1l11 - t.Hrp.Position).Magnitude or 0
        local II1II1IlIlIl = (t.Type == "Loot") and lIl1ll111Ill.ESP.LootDistance or lIl1ll111Ill.ESP.MaxDistance
        if l1l1ll1l1ll1 > II1II1IlIlIl then continue end        
        lllI11IIIIII[t.Obj] = true
        if not lI11l1l1IlIl[t.Obj] then lI11l1l1IlIl[t.Obj] = CreateESPDrawings() end
        local l1Il1IIIll11 = lI11l1l1IlIl[t.Obj]
        
        local I11111IIll11, ll11I1lI1IIl = l1I11llII1lI:WorldToViewportPoint(t.Hrp.Position)
        
        if I11111IIll11.Z <= 0 then
            ClearDrawings(l1Il1IIIll11)
            continue
        end
        
        -- Entity specifics
        local Il1l1I1IlI11 = t.Obj:FindFirstChild("Head")
        local lll111lIIl11 = Il1l1I1IlI11 and Il1l1I1IlI11.Position + Vector3.new(0, 0.5, 0) or t.Hrp.Position + Vector3.new(0, 3, 0)
        local III1IlIIIIIl = t.Hrp.Position - Vector3.new(0, 3, 0)

        if t.Type == "Loot" then
            lll111lIIl11 = t.Hrp.Position + Vector3.new(0, 1.5, 0)
            III1IlIIIIIl = t.Hrp.Position - Vector3.new(0, 1.5, 0)
        end
        
        local l111l1IlI1Il, IIII11IlIll1 = l1I11llII1lI:WorldToViewportPoint(lll111lIIl11)
        local lIll1lIl111l, I1lIIIII1lll = l1I11llII1lI:WorldToViewportPoint(III1IlIIIIIl)
        
        local II1IIl1l11l1 = lIl1ll111Ill.ESP[t.Type]
        if t.Type == "Loot" then
            II1IIl1l11l1 = { Box = true, Name = true, Distance = true, HealthBar = false, Line = false, Skeleton = false, HeadDot = false, Exposed = false }
        end
        
        -- Optimization: Only check Z depth so ESP doesn't flicker when partially off the edge of the screen
        if l111l1IlI1Il.Z > 0 and lIll1lIl111l.Z > 0 then
            local IlII111l11lI = math.abs(lIll1lIl111l.Y - l111l1IlI1Il.Y)
            local lIlIIIll1I1I = IlII111l11lI * 0.6
            
            -- Box
            if II1IIl1l11l1 and II1IIl1l11l1.Box then
                l1Il1IIIll11.Box.Size = Vector2.new(lIlIIIll1I1I, IlII111l11lI)
                l1Il1IIIll11.Box.Position = Vector2.new(l111l1IlI1Il.X - lIlIIIll1I1I/2, l111l1IlI1Il.Y)
                l1Il1IIIll11.Box.Color = t.Color
                l1Il1IIIll11.Box.Visible = true
            else l1Il1IIIll11.Box.Visible = false end
            
            -- Health Bar
            if II1IIl1l11l1 and II1IIl1l11l1.HealthBar and t.Hum then
                local I11I1l11III1 = math.clamp(t.Hum.Health / t.Hum.MaxHealth, 0, 1)
                local lllII1llIll1 = IlII111l11lI * I11I1l11III1
                
                l1Il1IIIll11.HealthBg.From = Vector2.new(l111l1IlI1Il.X - lIlIIIll1I1I/2 - 8, l111l1IlI1Il.Y)
                l1Il1IIIll11.HealthBg.To = Vector2.new(l111l1IlI1Il.X - lIlIIIll1I1I/2 - 8, lIll1lIl111l.Y)
                l1Il1IIIll11.HealthBg.Visible = true
                
                l1Il1IIIll11.HealthFill.From = Vector2.new(l111l1IlI1Il.X - lIlIIIll1I1I/2 - 8, lIll1lIl111l.Y)
                l1Il1IIIll11.HealthFill.To = Vector2.new(l111l1IlI1Il.X - lIlIIIll1I1I/2 - 8, lIll1lIl111l.Y - lllII1llIll1)
                l1Il1IIIll11.HealthFill.Color = Color3.fromHSV(I11I1l11III1 * 0.3, 1, 1)
                l1Il1IIIll11.HealthFill.Visible = true
            else l1Il1IIIll11.HealthBg.Visible = false l1Il1IIIll11.HealthFill.Visible = false end
            
            -- Text (Name / Distance)
            if II1IIl1l11l1 and II1IIl1l11l1.Name then
                l1Il1IIIll11.Name.Text = (t.Type == "Loot" and t.Name) or string.format("[%s]", t.Name)
                l1Il1IIIll11.Name.Position = Vector2.new(l111l1IlI1Il.X, l111l1IlI1Il.Y - 18)
                l1Il1IIIll11.Name.Color = t.Color
                l1Il1IIIll11.Name.Visible = true
            else l1Il1IIIll11.Name.Visible = false end
            
            if II1IIl1l11l1 and II1IIl1l11l1.Distance then
                l1Il1IIIll11.Distance.Text = string.format("%dm", math.floor(l1l1ll1l1ll1))
                l1Il1IIIll11.Distance.Position = Vector2.new(lIll1lIl111l.X, lIll1lIl111l.Y + 2)
                l1Il1IIIll11.Distance.Visible = true
            else l1Il1IIIll11.Distance.Visible = false end
            
            -- Tracer Line
            if II1IIl1l11l1 and II1IIl1l11l1.Line then
                l1Il1IIIll11.Tracer.From = III1l1llIIll
                l1Il1IIIll11.Tracer.To = Vector2.new(lIll1lIl111l.X, lIll1lIl111l.Y)
                l1Il1IIIll11.Tracer.Color = t.Color
                l1Il1IIIll11.Tracer.Visible = true
            else l1Il1IIIll11.Tracer.Visible = false end
            
            -- Head Dot
            if II1IIl1l11l1 and II1IIl1l11l1.HeadDot and Il1l1I1IlI11 then
                local lI1l11lIlIlI, I1IlII11l111 = l1I11llII1lI:WorldToViewportPoint(Il1l1I1IlI11.Position)
                if I1IlII11l111 then
                    l1Il1IIIll11.HeadDot.Position = Vector2.new(lI1l11lIlIlI.X, lI1l11lIlIlI.Y)
                    l1Il1IIIll11.HeadDot.Radius = math.clamp(100 / l1l1ll1l1ll1, 2, 10)
                    l1Il1IIIll11.HeadDot.Color = lIl1ll111Ill.Theme.Accent
                    l1Il1IIIll11.HeadDot.Visible = true
                else l1Il1IIIll11.HeadDot.Visible = false end
            else l1Il1IIIll11.HeadDot.Visible = false end
           
            -- Exposed Status Check
            if II1IIl1l11l1 and II1IIl1l11l1.Exposed and (t.Type == "Player" or t.Type == "NPC") then
                local l1I1l1llIIl1 = Il1l1I1IlI11 and Il1l1I1IlI11.Position or t.Hrp.Position
                espRayParams.FilterDescendantsInstances = {IlIll1IlII11.Character, t.Obj}
                local Ill11lll1lIl = III111ll111I:Raycast(l1I11llII1lI.CFrame.Position, l1I1l1llIIl1 - l1I11llII1lI.CFrame.Position, espRayParams)
                local IIII1llIIlIl = not Ill11lll1lIl or Ill11lll1lIl.Instance.Transparency > 0.8 or not Ill11lll1lIl.Instance.CanCollide
                
                if IIII1llIIlIl then
                    l1Il1IIIll11.ExposedText.Text = "[EXPOSED]"
                    l1Il1IIIll11.ExposedText.Position = Vector2.new(l111l1IlI1Il.X, l111l1IlI1Il.Y - (II1IIl1l11l1.Name and 32 or 18))
                    l1Il1IIIll11.ExposedText.Visible = true
                else l1Il1IIIll11.ExposedText.Visible = false end
            else
                if l1Il1IIIll11.ExposedText then l1Il1IIIll11.ExposedText.Visible = false end
            end

            -- 3D Skeleton
            if II1IIl1l11l1 and II1IIl1l11l1.Skeleton and (t.Type == "Player" or t.Type == "NPC") then
                local II11Il1I1l11 = t.Obj:FindFirstChild("UpperTorso") ~= nil
                local IlII11lIllll = II11Il1I1l11 and {
                    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
                    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
                    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"},
                    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
                    {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"}
                } or {
                    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"},
                    {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
                }
                
                for i, p in ipairs(IlII11lIllll) do
                    local IIII11lIlI1I = t.Obj:FindFirstChild(p[1]) or t.Obj:FindFirstChild(p[1]:gsub("Upper", ""):gsub("Lower", ""))
                    local I1l1IIIllI1l = t.Obj:FindFirstChild(p[2]) or t.Obj:FindFirstChild(p[2]:gsub("Upper", ""):gsub("Lower", ""))
                    local l1II11I1111I = l1Il1IIIll11.SkeletonLines[i]
                    if IIII11lIlI1I and I1l1IIIllI1l and l1II11I1111I then
                        local IllII1l1IlIl, l111lII1l111 = l1I11llII1lI:WorldToViewportPoint(IIII11lIlI1I.Position)
                        local lIlll11lIII1, I1IlIlIlIlll = l1I11llII1lI:WorldToViewportPoint(I1l1IIIllI1l.Position)
                        if l111lII1l111 and I1IlIlIlIlll then
                            l1II11I1111I.From = Vector2.new(IllII1l1IlIl.X, IllII1l1IlIl.Y)
                            l1II11I1111I.To = Vector2.new(lIlll11lIII1.X, lIlll11lIII1.Y)
                            l1II11I1111I.Color = t.Color
                            l1II11I1111I.Visible = true
                        else l1II11I1111I.Visible = false end
                    elseif l1II11I1111I then l1II11I1111I.Visible = false end
                end
                for i = #IlII11lIllll + 1, #l1Il1IIIll11.SkeletonLines do l1Il1IIIll11.SkeletonLines[i].Visible = false end
            else
                for _, l1II11I1111I in ipairs(l1Il1IIIll11.SkeletonLines) do l1II11I1111I.Visible = false end
            end
            
        else
            ClearDrawings(l1Il1IIIll11)
        end
    end
    
    -- Stop memory leak by fully destroying inactive drawings
    local I1111I111111 = {}
    for llIl1l11I1II, l1Il1IIIll11 in pairs(lI11l1l1IlIl) do
        if not lllI11IIIIII[llIl1l11I1II] then
            RemoveDrawings(l1Il1IIIll11)
            table.insert(I1111I111111, llIl1l11I1II)
        end
    end
    for _, llIl1l11I1II in ipairs(I1111I111111) do
        lI11l1l1IlIl[llIl1l11I1II] = nil
    end
end))

-- // Combat Logic System

local IlI1lIl1l1ll = RaycastParams.new()
IlI1lIl1l1ll.FilterType = Enum.RaycastFilterType.Exclude

local function GetVisiblePoint(targetPart)
    local l1IllIII1IIl = l1I11llII1lI.CFrame.Position
    local I1llIlIII11I = targetPart.Position
    local I11l1I11lIll = targetPart.Size
    local lll11l1lIIlI = targetPart.CFrame
    
    -- Create check offsets: Center, Right half, Left half, Top half, Bottom half
    local lIlIIlI11I11 = {
        I1llIlIII11I,
        (lll11l1lIIlI * CFrame.new(I11l1I11lIll.X/2.5, 0, 0)).Position,
        (lll11l1lIIlI * CFrame.new(-I11l1I11lIll.X/2.5, 0, 0)).Position,
        (lll11l1lIIlI * CFrame.new(0, I11l1I11lIll.Y/2.5, 0)).Position,
        (lll11l1lIIlI * CFrame.new(0, -I11l1I11lIll.Y/2.5, 0)).Position,
    }
    IlI1lIl1l1ll.FilterDescendantsInstances = {IlIll1IlII11.Character, targetPart.Parent}
    for _, pt in ipairs(lIlIIlI11I11) do
        local Ill11lll1lIl = III111ll111I:Raycast(l1IllIII1IIl, pt - l1IllIII1IIl, IlI1lIl1l1ll)
        if not Ill11lll1lIl or Ill11lll1lIl.Instance.Transparency > 0.8 or not Ill11lll1lIl.Instance.CanCollide then return pt end
    end
    return I1llIlIII11I -- Fallback to center if heavily obscured
end

local function GetClosestTarget()
    local I1I1llll1IlI, l11IIIlllIIl = nil, math.huge
    local lII1lI11l1ll = lll1IlllIl11:GetMouseLocation()
    
    local I1llI11lIllI = {}
    for _, p in pairs(I1l1I1lI1I11:GetPlayers()) do if p ~= IlIll1IlII11 and p.Character then table.insert(I1llI11lIllI, p.Character) end end

        local III111lII11I = { {Node = III111ll111I, Desc = false} }
        if III111ll111I:FindFirstChild("AiZones") then table.insert(III111lII11I, {Node = III111ll111I.AiZones, Desc = true}) end
        
        for _, fData in ipairs(III111lII11I) do
            local l1IlIlI1111I = fData.Desc and fData.Node:GetDescendants() or fData.Node:GetChildren()
            for _, llIl1l11I1II in pairs(l1IlIlI1111I) do
                if llIl1l11I1II:IsA("Model") and llIl1l11I1II ~= IlIll1IlII11.Character and (llIl1l11I1II:FindFirstChild("Humanoid") or llIl1l11I1II.Name == "MI24V") and not I1l1I1lI1I11:GetPlayerFromCharacter(llIl1l11I1II) then
                    table.insert(I1llI11lIllI, llIl1l11I1II)
                end
        end
    end

    for _, char in ipairs(I1llI11lIllI) do
            local l1l1llll1lll = (char.Name == "MI24V")
            local llI1I1II1Ill = char:FindFirstChild("Humanoid")
            local I1I1lIllIl1l = char:FindFirstChild(lIl1ll111Ill.Combat.AimPart) or char:FindFirstChild("Head") or char:FindFirstChild("Torso") or (l1l1llll1lll and (char.PrimaryPart or char:FindFirstChildWhichIsA("BasePart", true)))
            if (l1l1llll1lll or (llI1I1II1Ill and llI1I1II1Ill.Health > 0)) and I1I1lIllIl1l then
            local I11111IIll11, ll11I1lI1IIl = l1I11llII1lI:WorldToViewportPoint(I1I1lIllIl1l.Position)
            if ll11I1lI1IIl then
                local l1l1ll1l1ll1 = (lII1lI11l1ll - Vector2.new(I11111IIll11.X, I11111IIll11.Y)).Magnitude
                if l1l1ll1l1ll1 < l11IIIlllIIl then
                    l11IIIlllIIl = l1l1ll1l1ll1
                    I1I1llll1IlI = I1I1lIllIl1l
                end
            end
        end
    end
    return I1I1llll1IlI
end

local III11llll1I1 = nil

RegisterConnection(I1I1IIIlllII.RenderStepped:Connect(function()

    local ll1lIIlIllll = false
    if lIl1ll111Ill.Combat.Aimbot then
        local lIl1111II1lI = lIl1ll111Ill.Combat.AimKey
        if type(lIl1111II1lI) == "userdata" then
            if tostring(lIl1111II1lI):find("MouseButton") then ll1lIIlIllll = lll1IlllIl11:IsMouseButtonPressed(lIl1111II1lI)
            else ll1lIIlIllll = lll1IlllIl11:IsKeyDown(lIl1111II1lI) end
        end
    end
        
    -- Main Aimbot Lock
    if ll1lIIlIllll then
        if not III11llll1I1 then
            III11llll1I1 = GetClosestTarget()
        end
        
        if III11llll1I1 then
            local l11II11IlI1I = III11llll1I1.Parent
            if not l11II11IlI1I or not l11II11IlI1I:FindFirstChild("Humanoid") or l11II11IlI1I.Humanoid.Health <= 0 then
                III11llll1I1 = nil
            else
                local lII1I1IIlIl1 = III11llll1I1.Position
                -- If aiming at Head, adjust position to the front of the face
                if III11llll1I1.Name == "Head" then
                    lII1I1IIlIl1 = lII1I1IIlIl1 + (III11llll1I1.CFrame.LookVector * (III11llll1I1.Size.Z / 2))
                end
                l1I11llII1lI.CFrame = CFrame.new(l1I11llII1lI.CFrame.Position, lII1I1IIlIl1)
            end
        end
    else
        III11llll1I1 = nil
    end
end))

-- Weapon Mods (No Recoil)
task.spawn(function()
    while lI111IIIII11.Parent do
        task.wait(2)
        if (lIl1ll111Ill.Combat.NoRecoil or lIl1ll111Ill.Combat.InstaHit) and getgc then
            pcall(function()
                for _, v in pairs(getgc(true)) do
                    if type(v) == "table" then
                        if lIl1ll111Ill.Combat.NoRecoil then
                            for _, k in ipairs({"Recoil", "CameraRecoil", "Kick", "KickUp", "KickDown", "KickLeft", "KickRight", "VRecoil", "HRecoil", "RecoilMin", "RecoilMax", "CamKickMin", "CamKickMax"}) do
                                local IIlI1IIlIIll = rawget(v, k)
                                if type(IIlI1IIlIIll) == "number" then rawset(v, k, 0)
                                elseif type(IIlI1IIlIIll) == "table" and #IIlI1IIlIIll > 0 then rawset(v, k, {0,0,0})
                                elseif typeof(IIlI1IIlIIll) == "Vector3" then rawset(v, k, Vector3.new(0,0,0))
                                elseif typeof(IIlI1IIlIIll) == "CFrame" then rawset(v, k, CFrame.new()) end
                            end
                        end
                        if lIl1ll111Ill.Combat.InstaHit then
                            -- Safely modify highly specific bullet keys
                            for _, k in ipairs({"BulletSpeed", "MuzzleVelocity", "ProjectileSpeed", "InitialVelocity"}) do
                                if type(rawget(v, k)) == "number" then rawset(v, k, 99999) end
                            end
                            for _, k in ipairs({"BulletDrop", "ProjectileDrop", "BulletGravity"}) do
                                if type(rawget(v, k)) == "number" then rawset(v, k, 0) end
                            end
                            
                            -- Only touch generic names ("Speed", "Gravity") if we verify this is a weapon/bullet table
                            local lIIl1ll1lI1l = rawget(v, "Damage") or rawget(v, "BaseDamage") or rawget(v, "Penetration") or rawget(v, "Hitbox")
                            if lIIl1ll1lI1l then
                                if type(rawget(v, "Speed")) == "number" then rawset(v, "Speed", 99999) end
                                if type(rawget(v, "Velocity")) == "number" then rawset(v, "Velocity", 99999) end
                                if type(rawget(v, "Gravity")) == "number" then rawset(v, "Gravity", 0) end
                                if type(rawget(v, "Drop")) == "number" then rawset(v, "Drop", 0) end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Zoom Logic
local lll1lII1lIII = false
RegisterConnection(I1I1IIIlllII.RenderStepped:Connect(function()
    if lIl1ll111Ill.Character.ZoomEnabled then
        l1I11llII1lI.FieldOfView = lIl1ll111Ill.Character.ZoomFOV
        lll1lII1lIII = true
    else
        if lll1lII1lIII then
            l1I11llII1lI.FieldOfView = lIl1ll111Ill.Character.FOV
            lll1lII1lIII = false
        elseif lIl1ll111Ill.Character.FOV ~= 70 then
            -- Smart FOV: Stop forcing the FOV when the player aims down sights (RMB)
            -- or when the game tries to heavily zoom the camera in for a scope.
            local IllI1lI1l1II = lll1IlllIl11:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
            if not IllI1lI1l1II and l1I11llII1lI.FieldOfView > 55 then
                l1I11llII1lI.FieldOfView = lIl1ll111Ill.Character.FOV
            end
        end
    end
end))

RegisterConnection(lll1IlllIl11.InputBegan:Connect(function(input, lllI11IIIIII)
    if lllI11IIIIII then return end
    local lllIIIlII11l = false
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == lIl1ll111Ill.Character.ZoomKey then lllIIIlII11l = true end
    elseif input.UserInputType.Name:find("MouseButton") then
        if input.UserInputType == lIl1ll111Ill.Character.ZoomKey then lllIIIlII11l = true end
    end
    
    if lllIIIlII11l then
        lIl1ll111Ill.Character.ZoomEnabled = not lIl1ll111Ill.Character.ZoomEnabled
    end
end))

-- // TABS CREATION // --

-- 1. COMBAT TAB
local IlIIIl1lllll, I1I11111II1I = CreateTab("Combat")
CreateSection(IlIIIl1lllll, "AIM ASSIST")
CreateToggle(IlIIIl1lllll, "Enable Aimbot", false, function(v) lIl1ll111Ill.Combat.Aimbot = v end)
CreateCycle(IlIIIl1lllll, "Aim Part", {"Head", "Torso"}, 1, function(v) lIl1ll111Ill.Combat.AimPart = v end)
CreateKeybind(IlIIIl1lllll, "Aim Key", Enum.UserInputType.MouseButton2, function(v) lIl1ll111Ill.Combat.AimKey = v end)

CreateSection(I1I11111II1I, "WEAPON MODS")
CreateToggle(I1I11111II1I, "No Recoil", false, function(v) lIl1ll111Ill.Combat.NoRecoil = v end)
CreateToggle(I1I11111II1I, "Instant Hit", false, function(v) lIl1ll111Ill.Combat.InstaHit = v end)

-- 2. CHARACTER TAB
local I1I1ll1l1lIl, I1ll1ll1IllI = CreateTab("Character")
CreateSection(I1I1ll1l1lIl, "ZOOM")
CreateKeybind(I1I1ll1l1lIl, "Zoom Key", Enum.KeyCode.Z, function(v) lIl1ll111Ill.Character.ZoomKey = v end)
CreateSlider(I1I1ll1l1lIl, "Zoom FOV", 1, 120, 20, function(v) lIl1ll111Ill.Character.ZoomFOV = v end)

CreateSection(I1ll1ll1IllI, "VISUALS")
CreateToggle(I1ll1ll1IllI, "Fullbright", false, function(v)
    if v then
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        game.Lighting.Brightness = 2
    else
        game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        game.Lighting.Brightness = 1
    end
end)
CreateSlider(I1ll1ll1IllI, "Field of View", 70, 120, 70, function(v)
    lIl1ll111Ill.Character.FOV = v
end)

-- 3. ESP TAB (The major overhaul)
local ll1lI1lII1I1, l11l1IlI1III = CreateTab("ESP")
CreateSection(ll1lI1lII1I1, "MASTER CONTROLS")
CreateSlider(ll1lI1lII1I1, "Max Distance", 100, 5000, 500, function(v) lIl1ll111Ill.ESP.MaxDistance = v end)

CreateSection(ll1lI1lII1I1, "PLAYER ESP")
CreateToggle(ll1lI1lII1I1, "Show Box", false, function(v) lIl1ll111Ill.ESP.Player.Box = v end)
CreateToggle(ll1lI1lII1I1, "Show Name", false, function(v) lIl1ll111Ill.ESP.Player.Name = v end)
CreateToggle(ll1lI1lII1I1, "Show Distance", false, function(v) lIl1ll111Ill.ESP.Player.Distance = v end)
CreateToggle(ll1lI1lII1I1, "Show Health Bar", false, function(v) lIl1ll111Ill.ESP.Player.HealthBar = v end)
CreateToggle(ll1lI1lII1I1, "Show Tracer Lines", false, function(v) lIl1ll111Ill.ESP.Player.Line = v end)
CreateToggle(ll1lI1lII1I1, "Show 3D Skeleton Rig", false, function(v) lIl1ll111Ill.ESP.Player.Skeleton = v end)
CreateToggle(ll1lI1lII1I1, "Show Head Dot", false, function(v) lIl1ll111Ill.ESP.Player.HeadDot = v end)
CreateToggle(ll1lI1lII1I1, "Show Exposed Status", false, function(v) lIl1ll111Ill.ESP.Player.Exposed = v end)

CreateSection(l11l1IlI1III, "NPC ESP")
CreateToggle(l11l1IlI1III, "Show Box", false, function(v) lIl1ll111Ill.ESP.NPC.Box = v end)
CreateToggle(l11l1IlI1III, "Show Name", false, function(v) lIl1ll111Ill.ESP.NPC.Name = v end)
CreateToggle(l11l1IlI1III, "Show Distance", false, function(v) lIl1ll111Ill.ESP.NPC.Distance = v end)
CreateToggle(l11l1IlI1III, "Show Health Bar", false, function(v) lIl1ll111Ill.ESP.NPC.HealthBar = v end)
CreateToggle(l11l1IlI1III, "Show Tracer Lines", false, function(v) lIl1ll111Ill.ESP.NPC.Line = v end)
CreateToggle(l11l1IlI1III, "Show 3D Skeleton Rig", false, function(v) lIl1ll111Ill.ESP.NPC.Skeleton = v end)
CreateToggle(l11l1IlI1III, "Show Head Dot", false, function(v) lIl1ll111Ill.ESP.NPC.HeadDot = v end)
CreateToggle(l11l1IlI1III, "Show Exposed Status", false, function(v) lIl1ll111Ill.ESP.NPC.Exposed = v end)

CreateSection(l11l1IlI1III, "EXTRACTION ESP")
CreateToggle(l11l1IlI1III, "Show Box", false, function(v) lIl1ll111Ill.ESP.Exit.Box = v end)
CreateToggle(l11l1IlI1III, "Show Name", false, function(v) lIl1ll111Ill.ESP.Exit.Name = v end)
CreateToggle(l11l1IlI1III, "Show Distance", false, function(v) lIl1ll111Ill.ESP.Exit.Distance = v end)

-- 4. LOOT TAB
local llIl11Il1l1l, lI1lll111lII = CreateTab("Loot")

CreateSection(llIl11Il1l1l, "MASTER CONTROLS")
CreateSlider(llIl11Il1l1l, "Max Distance", 10, 5000, 500, function(v) lIl1ll111Ill.ESP.LootDistance = v end)

CreateSection(llIl11Il1l1l, "MILITARY")
for _, I1lI11l1IllI in ipairs({"GrenadeCrate", "LargeMilitaryBox", "MilitaryCrate", "SmallMilitaryBox"}) do
    CreateToggle(llIl11Il1l1l, I1lI11l1IllI, false, function(v) lIl1ll111Ill.ESP.Loot[I1lI11l1IllI] = v end)
end

CreateSection(llIl11Il1l1l, "SUPPLY DROPS")
for _, I1lI11l1IllI in ipairs({"SupplyDropEDF", "SupplyDropEDF_Default", "SupplyDropEDF_XMAS", "SupplyDropMilitary", "SupplyDropMilitary_Default", "SupplyDropMilitary_XMAS"}) do
    CreateToggle(llIl11Il1l1l, I1lI11l1IllI, false, function(v) lIl1ll111Ill.ESP.Loot[I1lI11l1IllI] = v end)
end

CreateSection(llIl11Il1l1l, "SHIPPING")
for _, I1lI11l1IllI in ipairs({"LargeABPOPABox", "LargeShippingCrate", "SmallShippingCrate"}) do
    CreateToggle(llIl11Il1l1l, I1lI11l1IllI, false, function(v) lIl1ll111Ill.ESP.Loot[I1lI11l1IllI] = v end)
end

CreateSection(lI1lll111lII, "BAGS")
for _, I1lI11l1IllI in ipairs({"KGBBag", "MedBag", "SatchelBag", "SportBag"}) do
    CreateToggle(lI1lll111lII, I1lI11l1IllI, false, function(v) lIl1ll111Ill.ESP.Loot[I1lI11l1IllI] = v end)
end

CreateSection(lI1lll111lII, "WORLD")
for _, I1lI11l1IllI in ipairs({"CashRegister", "FilingCabinet", "Fridge", "HiddenCache", "ModificationStation", "PC", "Safe", "SerumContainer", "Toolbox"}) do
    CreateToggle(lI1lll111lII, I1lI11l1IllI, false, function(v) lIl1ll111Ill.ESP.Loot[I1lI11l1IllI] = v end)
end

CreateSection(lI1lll111lII, "OTHER LOOT")
CreateToggle(lI1lll111lII, "Dropped Items", false, function(v) lIl1ll111Ill.ESP.Dropped = v end)
CreateToggle(lI1lll111lII, "Dead Bodies", false, function(v) lIl1ll111Ill.ESP.DeadBodies = v end)
CreateToggle(lI1lll111lII, "Claymores / Mines", false, function(v) lIl1ll111Ill.ESP.Mines = v end)

-- System Toggle Bind (RightControl)
RegisterConnection(lll1IlllIl11.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        Il1lI1IlllII.Visible = not Il1lI1IlllII.Visible
    end
end))

Notify("System Online", "Welcome to Project Delta Premium.", 3)
