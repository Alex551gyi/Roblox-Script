local platoboost = loadstring(game:HttpGet("https://api.platoboost.app/public/v1/auth"))()

local result = platoboost:verify({
    service = "2482df09-609c-48ff-a68c-a90d3013deca",
    profile = "MM2 Mario"
})

if result.success then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xDTaraZz/Roblox-Scripts/refs/heads/main/All%20Map/Murder%20Mystery%202.lua"))()
else
    return
end
