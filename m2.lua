-- ТВОЯ ССЫЛКА НА WORK.INK С РЕКЛАМОЙ:
local key_link = "https://work.ink/32Yi/57dd0652-91de-40aa-8738-44f2d442fad8"
local correct_key = "mario123"

-- Создаем красивое графическое окно прямо в Roblox
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GetKeyBtn = Instance.new("TextButton")
local KeyInput = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "MarioHubKeySystem"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.BorderSizePixel = 0

Title.Parent = MainFrame
Title.Text = "MARIO HUB KEY SYSTEM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 30)

GetKeyBtn.Parent = MainFrame
GetKeyBtn.Text = "GET KEY (Copy Link)"
GetKeyBtn.Size = UDim2.new(0, 260, 0, 40)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 60)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(85, 85, 120)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Enter your key here..."
KeyInput.Size = UDim2.new(0, 260, 0, 40)
KeyInput.Position = UDim2.new(0, 20, 0, 110)

VerifyBtn.Parent = MainFrame
VerifyBtn.Text = "VERIFY KEY"
VerifyBtn.Size = UDim2.new(0, 260, 0, 35)
VerifyBtn.Position = UDim2.new(0, 20, 0, 160)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Логика кнопок
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(key_link)
    GetKeyBtn.Text = "LINK COPIED TO CLIPBOARD!"
    task.wait(2)
    GetKeyBtn.Text = "GET KEY (Copy Link)"
end)

VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == correct_key then
        ScreenGui:Destroy()
        
        if not game:IsLoaded() then 
            game.Loaded:Wait() 
        end
        
        local BASE = "https://raw.githubusercontent.com/xDTaraZz/Roblox-Scripts/refs/heads/main/All%20Map/"
        
        local GAMES = {
            [10418224975] = "TNT Mining",
            [10684750879] = "Loot To Forge",
            [10765091041] = "Open Sea For Animals",
            [66654135] = "Murder Mystery 2",
            [1202096104] = "Driving Empire",
            [9534705677] = "Sniper Arena",
            [6739698191] = "Violence District",
            [10708913337] = "Anime Dice",
            [10035204815] = "Ride A Pet",
            [10031505426] = "AirDrop Arena",
            [7633926880] = "BloxStrike",
            [10765298801] = "Stone Skipping",
            [10765288803] = "Break and Steal an Egg",
            [10765012427] = "Build the Pyramid",
        }
        
        local name = GAMES[game.GameId]
        if name then
            local ok, source = pcall(game.HttpGet, game, BASE .. name:gsub(" ", "%%20") .. ".lua")
            if ok and type(source) == "string" then
                loadstring(source)()
            end
        end
    else
        VerifyBtn.Text = "INVALID KEY! TRY AGAIN"
        task.wait(2)
        VerifyBtn.Text = "VERIFY KEY"
    end
end)
