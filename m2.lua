-- ТВОЯ ССЫЛКА НА РЕКЛАМУ (LootLabs или Work.ink):
local key_link = "https://work.ink/32Yi/9ff17897-3032-44c4-9a1a-e051b2ec4573"

-- Встроенная функция уведомлений Roblox
local function notify(title, text)
    pcall(game:GetService("StarterGui").SetCore, game:GetService("StarterGui"), "SendNotification", {
        Title = title,
        Text = text,
        Duration = 15,
    })
end

-- Проверяем, ввёл ли игрок ключ
local input_key = _G.Key or ""
local correct_key = "mario123"

if input_key ~= correct_key then
    notify("MM2 Mario Hub", "WRONG KEY! Link copied to your clipboard!")
    setclipboard(key_link)
    print("Paste link in browser to get key: " .. key_link)
    return
end

notify("MM2 Mario Hub", "Key is correct! Loading script...")

-- Дальше идёт оригинальный рабочий код самого Марио-хаба:
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
if not name then
    return notify("Mario Hub", "This game is not supported yet.")
end

local ok, source = pcall(game.HttpGet, game, BASE .. name:gsub(" ", "%%20") .. ".lua")
if not ok or type(source) ~= "string" then
    return notify("Mario Hub", "Could not download the " .. name .. " script.")
end

local fn, err = loadstring(source)
if not fn then
    return notify("Mario Hub", "Failed to load: " .. tostring(err))
end

fn()
