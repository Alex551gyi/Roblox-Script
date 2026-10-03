local platoboost = loadstring(game:HttpGet("https://api.platoboost.app/public/v1/auth"))()

local result = platoboost:verify({
    service = "2482df09-609c-48ff-a68c-a90d3013deca",
    profile = "MM2 Mario"
})

if result.success then
    -- Если ключ верный, скрипт безболезненно загружает сам Марио-чит:
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
            local fn = loadstring(source)
            if fn then fn() end
        end
    end
else
    return
end
