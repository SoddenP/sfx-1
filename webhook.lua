print('credit to kly and ej_')
item = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value
item2 = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value

qualityfolder = game:GetService("ReplicatedStorage").Qualities
moldfolder = game:GetService("ReplicatedStorage").AllMolds
rarityfolder = game:GetService("ReplicatedStorage").Rarities
classfolder = game:GetService("ReplicatedStorage").Classes

if item then
    item = item.Config
    level = item.Level.Value
    rarity = rarityfolder[item.Rarity.Value].RarityName.Value
    quality = qualityfolder[item.Quality.Value].QualityName.Value
    mold = moldfolder[item.Mold.Value].MoldName.Value
    class = classfolder[item.Class.Value].ClassNames.Value
    raritybefore = rarityfolder[item.Rarity.Value].RarityName.Value
    qualitybefore = qualityfolder[item.Quality.Value].QualityName.Value
    moldbefore = moldfolder[item.Mold.Value].MoldName.Value
    classbefore = classfolder[item.Class.Value].ClassNames.Value
end

if item2 then
    item2 = item2.Config
    level2 = item2.Level.Value
    rarity2 = rarityfolder[item2.Rarity.Value].RarityName.Value
    quality2 = qualityfolder[item2.Quality.Value].QualityName.Value
    mold2 = moldfolder[item2.Mold.Value].MoldName.Value
    class2 = classfolder[item2.Class.Value].ClassNames.Value
    raritybefore2 = rarityfolder[item2.Rarity.Value].RarityName.Value
    qualitybefore2 = qualityfolder[item2.Quality.Value].QualityName.Value
    moldbefore2 = moldfolder[item2.Mold.Value].MoldName.Value
    classbefore2 = classfolder[item2.Class.Value].ClassNames.Value
end

function update()
    minutes = os.date("%M")
    hours = os.date("%I")
    local data =
        {
            ["content"] = "<@"..id..">",
            ["embeds"] = {{
                ["title"] = "Username: "..tostring(game.Players.LocalPlayer.Name).."\nYour sword has upgraded!",
                ["description"] = "Time: "..tostring(hours..":"..minutes),
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["fields"] = {
                    {
                        ["name"] = "Ascender Item 1 (before):",
                        ["value"] = "Level: "..tostring(level).."\nRarity: "..tostring(raritybefore).."\nQuality: "..tostring(qualitybefore).."\nClass: "..tostring(classbefore).."\nMold: "..tostring(moldbefore),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Ascender Item 1 (after):",
                        ["value"] = "Level: "..tostring(level).."\nRarity: "..tostring(rarity).."\nQuality: "..tostring(quality).."\nClass: "..tostring(class).."\nMold: "..tostring(mold),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Ascender Item 2 (before):",
                        ["value"] = "Level: "..tostring(level2).."\nRarity: "..tostring(raritybefore2).."\nQuality: "..tostring(qualitybefore2).."\nClass: "..tostring(classbefore2).."\nMold: "..tostring(moldbefore2),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Ascender Item 2 (after):",
                        ["value"] = "Level: "..tostring(level2).."\nRarity: "..tostring(rarity2).."\nQuality: "..tostring(quality2).."\nClass: "..tostring(class2).."\nMold: "..tostring(mold2),
                        ["inline"] = false
                    },
                }
            }}
        }
    
    local body = game:GetService("HttpService"):JSONEncode(data)
    
    local headers = {["content-type"] = "application/json"}
    request = http_request or request or HttpPost or syn.request or http.request
    local msg = {Url = url, Body = body, Method = "POST", Headers = headers}
    request(msg)
    raritybefore = rarity
    qualitybefore = quality
    moldbefore = mold
    classbefore = class 
    raritybefore2 = rarity2 
    qualitybefore2 = quality2 
    classbefore2 = class2 
    moldbefore2 = mold2
end

while task.wait() do
    if item then
        if (rarity ~= rarityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Rarity.Value].RarityName.Value) then
            rarity = rarityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Rarity.Value].RarityName.Value
            update()
        end
        
        if (quality ~= qualityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Quality.Value].QualityName.Value) then
            quality = qualityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Quality.Value].QualityName.Value
            update()
        end
        
        if (mold ~= moldfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Mold.Value].MoldName.Value) then
            mold = moldfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Mold.Value].MoldName.Value
            update()
        end
        if (class ~= classfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Class.Value].ClassNames.Value) then
            class = classfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender"].Item.Value.Config.Class.Value].ClassNames.Value
            update()
        end
    end
    
    if item2 then
        if (rarity2 ~= rarityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Rarity.Value].RarityName.Value) then
            rarity2 = rarityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Rarity.Value].RarityName.Value
            update()
        end
        
        if (quality2 ~= qualityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Quality.Value].QualityName.Value) then
            quality2 = qualityfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Quality.Value].QualityName.Value
            update()
        end
        
        if (mold2 ~= moldfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Mold.Value].MoldName.Value) then
            mold2 = moldfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Mold.Value].MoldName.Value
            update()
        end
        if (class2 ~= classfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Class.Value].ClassNames.Value) then
            class2 = classfolder[game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"]["Ascender2"].Item.Value.Config.Class.Value].ClassNames.Value
            update()
        end
    end
end
