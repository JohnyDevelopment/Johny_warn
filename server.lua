print("Bb")
local webhook = "xx"
local logo = "https://cdn.discordapp.com/avatars/231461311270092800/02f3a1716c38c304cc90340884e58573.webp?size=80"
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('warn', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id = tonumber(args[1])
    local powod = table.concat(args, " ", 2)
    local klapek = GetPlayerName(source)
    if xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod' then
        if id ~= nill then
            if GetPlayerName(id) ~= nill then
                if powod ~= "" then
                    local discordziomka = "Nie Wykryto"
                    for k,v in pairs(GetPlayerIdentifiers(id))do
                        if string.match(v, "discord:") then
                            discordziomka = string.sub(v, 9)
                        end
                    end
                    local discorde = "<@"..discordziomka..">"
                    local Wysylanie = {
                        {
                            ["color"] = "00000000",
                            ["title"] = "Warn System",
                            ["description"] = "Otrzymales Ostrzezenie Od "..klapek..". Z Powodem: "..powod,
                            ["footer"] = {
                                ["text"] = "Nick Administratora W Grze: "..klapek,
                            },
                        }
                    }
                    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = klapek, avatar_url = logo, content = discorde, embeds = Wysylanie}), { ['Content-Type'] = 'application/json' })
                    TriggerClientEvent("imago:maszwarna", id, powod, klapek)
                else
                    xPlayer.showNotification('~ir~Nie Podales Powodu')
                end
            else
                xPlayer.showNotification('~ir~Nie Ma Takiego Gracza')
            end
        else
            xPlayer.showNotification('~ir~Nie Podales ID Gracza')
        end
    else
        xPlayer.showNotification('~r~Nie posiadasz permisji')
    end
end)
