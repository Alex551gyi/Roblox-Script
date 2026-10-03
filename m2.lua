-- ТВОЯ ССЫЛКА НА WORK.INK ДЛЯ TikTok / Shorts:
local key_link = "https://api.platoboost.app/public/v1/loader?id=2482df09-609c-48ff-a68c-a90d3013deca"

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
    notify("MM2 Mario Hub", "НЕВЕРНЫЙ КЛЮЧ! Ссылка на ключ скопирована в буфер!")
    setclipboard(key_link)
    print("Ссылка на ключ (скопировано в буфер): " .. key_link)
    return
end

notify("MM2 Mario Hub", "Ключ верный! Загрузка скрипта...")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = "https://raw.githubusercontent.com/xDTaraZz/Roblox-Scripts/refs/heads/main/All%20Map/"

local GAMES = {
    = "TNT Mining",
    = "Loot To Forge",
    = "Open Sea For Animals",
    = "Murder Mystery 2",
    = "Driving Empire",
    = "Sniper Arena",
    = "Violence District",
    = "Anime Dice",
    = "Ride A Pet",
    = "AirDrop Arena",
    = "BloxStrike",
    = "Stone Skipping",
    = "Break and Steal an Egg",
    = "Build the Pyramid",
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
