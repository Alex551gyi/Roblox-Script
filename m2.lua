-- ТВОЯ ССЫЛКА НА WORK.INK ДЛЯ ПОЛУЧЕНИЯ КЛЮЧА:
local key_link = "https://api.platoboost.app/public/v1/loader?id=2482df09-609c-48ff-a68c-a90d3013deca"

local function notify(title, text)
    pcall(game:GetService("StarterGui").SetCore, game:GetService("StarterGui"), "SendNotification", {
        Title = title,
        Text = text,
        Duration = 15,
    })
end

local input_key = _G.Key or ""
local correct_key = "mario123"

if input_key ~= correct_key then
    notify("MM2 Mario Hub", "НЕВЕРНЫЙ КЛЮЧ! Ссылка скопирована в буфер обмена!")
    setclipboard(key_link)
    print("Вставь ссылку в браузер: " .. key_link)
    return
end

notify("MM2 Mario Hub", "Ключ верный! Загрузка...")

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
