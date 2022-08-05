local buy = {
    [1] = 0,
    [2] = "EnchanterServer",
    [3] = "Buy",
    [4] = {}
}

local buylock = {
    [1] = 0,
    [2] = "EnchanterServer",
    [3] = "BuyLock",
    [4] = {}
}

local firstslot = {
    [1] = 0,
    [2] = "EnchanterServer",
    [3] = "ApplyLocks",
    [4] = {
        [1] = 1,
        [2] = 50
    }
}

function firstenchant()
    
    matches = 0
    lockslot = 0
    local item = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"].Enchanter.Item.Value
    
    if item then
    
        local s1 = string.split(item.Config.Enchant1.Value, '"')
        local s2 = string.split(item.Config.Enchant2.Value, '"')
        local s3 = string.split(item.Config.Enchant3.Value, '"')
        local s4 = string.split(item.Config.Enchant4.Value, '"')
        
        local e1 = s1[2]
        local e2 = s2[2]
        local e3 = s3[2]
        local e4 = s4[2]
        
        for i = 1, #enchantstolock do
    
            if enchantstolock[i]:match(e1) then
                if (string.len(e1) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                    lockslot = 1
                end
            end
            
            if enchantstolock[i]:match(e2) then
                if (string.len(e2) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                    lockslot = 2
                end
            end
            
            if enchantstolock[i]:match(e3) then
                if (string.len(e3) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                    lockslot = 3
                end
            end
            
            if enchantstolock[i]:match(e4) then
                if (string.len(e4) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                    lockslot = 4
                end
            end
        end
    end
    return {matches, lockslot}
end

function secondenchant()
    
    matches = 0
    local item = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"].Enchanter.Item.Value
    
    if item then
    
        local s2 = string.split(item.Config.Enchant2.Value, '"')
        local s3 = string.split(item.Config.Enchant3.Value, '"')
        local s4 = string.split(item.Config.Enchant4.Value, '"')

        local e2 = s2[2]
        local e3 = s3[2]
        local e4 = s4[2]
        
        for i = 1, #enchantstoget do
    
            if enchantstolock[i]:match(e2) then
                if (string.len(e2) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                end
            end
            
            if enchantstolock[i]:match(e3) then
                if (string.len(e3) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                end
            end
            
            if enchantstolock[i]:match(e4) then
                if (string.len(e4) >= string.len(enchantstolock[i]) then
                    matches = matches + 1
                end
            end
        end
    end
    return matches
end

-- FIRST ENCHANT
while wait() do
    
    local item = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"].Enchanter.Item.Value
    
    if item then
    
        result = firstenchant()
        
        if (result[1] > 0) then
            
            game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(buylock))
            wait()
            
            local lock = {
                [1] = 0,
                [2] = "EnchanterServer",
                [3] = "ApplyLocks",
                [4] = {
                    [1] = result[2],
                    [2] = 1
                }
            }
            
            game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(lock))
            wait()
            
            game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(buy))
            wait()
            
            break
            
        else
            game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(buy))
        end
    else
        break
    end
end

-- OTHER ENCHANTS
while wait() do
    
    local item = game:GetService("Workspace")[game.Players.LocalPlayer.Name.."'s Base"].Enchanter.Item.Value
    
    if item then
    
        result = secondenchant()
        
        if (result >= #enchantstolock) then
            
            break
            
        else
            
            if item.Config.EnchantLock.Value == "[]" then
                
                for i = 1, 50 do
                    game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(buylock))
                end
                
                game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(firstslot))
                wait()
                
            end
            
            game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(buy))
            
        end
    else
        break
    end
end
