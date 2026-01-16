-- UI Loader Simple Dark Light by Gemini for Abiy
local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local StatusLabel = Instance.new("TextLabel")
local TitleLabel = Instance.new("TextLabel")

-- Jeda 2 detik sebelum UI muncul sesuai permintaan
task.wait(2)

-- Parent ke CoreGui
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "AbiySimpleLoader"

-- Main Frame (Membulat & Dark)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 280, 0, 120)

-- Posisi Awal (Di bawah dan Transparan untuk Transisi)
MainFrame.Position = UDim2.new(0.5, -140, 0.6, -60)
MainFrame.BackgroundTransparency = 1

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(50, 50, 50)
UIStroke.Transparency = 1 -- Awalnya transparan

-- Title
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.2, 0)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "VORTEX"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.TextTransparency = 1 -- Awalnya transparan

-- Status Label
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.55, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "checking game name"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 14
StatusLabel.TextTransparency = 1 -- Awalnya transparan

-- --- FUNGSI TRANSISI ---
local function FadeUI(transparency, position)
    local info = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(MainFrame, info, {BackgroundTransparency = transparency, Position = position}):Play()
    TweenService:Create(UIStroke, info, {Transparency = transparency}):Play()
    TweenService:Create(TitleLabel, info, {TextTransparency = transparency}):Play()
    TweenService:Create(StatusLabel, info, {TextTransparency = transparency}):Play()
end

-- Muncul: Bawah ke Atas + Fade In
FadeUI(0, UDim2.new(0.5, -140, 0.5, -60))
task.wait(1)

-- --- LOGIC ---
local targetPlaceId = 93978595733734 
local currentPlaceId = game.PlaceId

task.wait(2) -- Jeda proses checking

if currentPlaceId == targetPlaceId then
    StatusLabel.Text = "Welcome"
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    task.wait(1)
    
    -- Selesai: Kembali Transparan (Fade Out)
    FadeUI(1, UDim2.new(0.5, -140, 0.4, -60))
    task.wait(0.8)
    
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://pastebin.com/raw/Tw6m3Myk"))()
else
    StatusLabel.Text = "Error"
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    game.Players.LocalPlayer:Kick("different game")
end
