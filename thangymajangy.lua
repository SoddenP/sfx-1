repeat wait() until game.Players.LocalPlayer.Character

local name = game.Players.LocalPlayer.Name

local args = {
    [1] = game:GetService("ReplicatedStorage").Data[name].Stats,
    [2] = workspace:FindFirstChild(name.."'s Base"),
    [3] = name,
    [4] = "Icy Planes"
}

function noclip()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
        end
    end
end

print("Anti afk loaded")
local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

if usecodes then
print("using codes")
codes = {"4THJULY-LETSGO!!", "40K-LIKES-YEET!!!!", "10MVISITS!!!!!", "ANOTHERPATCH...pain", "TOPTIER200K!?", "ANOTHERDELAY...pain", "80K_FAVS!!GG"}

for i = 1, #codes do
    local code = {
        [1] = 0,
        [2] = "CodeServer",
        [3] = "RegisterCode",
        [4] = {
            [1] = codes[i]
        }
    }
    game:GetService("ReplicatedStorage").Framework.RemoteFunction:InvokeServer(unpack(code))
    print("used code " .. i .. "/" .. #codes)
    wait(5)
end
print("finished codes")
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local T = getRoot(game.Players.LocalPlayer.Character)
local BG = Instance.new('BodyAngularVelocity')
local BV = Instance.new('BodyVelocity')
BG.Parent = T
BV.Parent = T
BG.AngularVelocity = Vector3.new(0,10,0)
BG.MaxTorque = Vector3.new(9e9,9e9,9e9)
BV.velocity = Vector3.new(0, 0, 0)
BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

game:GetService("ReplicatedStorage").Events.ToMap:FireServer(unpack(args))
wait(4)

print("farming")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local localRootPart = localCharacter:WaitForChild("HumanoidRootPart")
local localHumanoid = localCharacter:WaitForChild("Humanoid")

localPlayer.CharacterAdded:Connect(function(character)
    localCharacter = character
    localRootPart = localCharacter:WaitForChild("HumanoidRootPart")
    localHumanoid = localCharacter:WaitForChild("Humanoid")
end)

local mobsFolder = workspace.Mobs
local mobsTable = {}
local target = nil
local active = true
local tool = nil

local function lookForBestSword()
    local backpack = localPlayer:WaitForChild("Backpack")
    local bestWorth = nil
    local bestPick = nil
    
    for _, sword in ipairs(backpack:GetChildren()) do
        if sword:IsA("Tool") and sword:FindFirstChildWhichIsA("Configuration") then
            local worth = sword.Config:FindFirstChild("Worth")
            if bestWorth then
                if worth.Value > bestWorth.Value then
                    bestWorth = worth
                end
            else
                bestWorth = worth
            end
        end
    end
    
    if bestWorth then
        bestPick = bestWorth.Parent.Parent
    end
    
    return bestPick
end

tool = lookForBestSword()

UserInputService.InputBegan:Connect(function(input, typing)
    if not typing then
        if input.KeyCode == Enum.KeyCode.E then
            if active then
                active = false
                BV.maxForce = Vector3.new(0, 0, 0)
                BG.MaxTorque = Vector3.new(0, 0, 0)
            else
                active = true
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if target and active then
        localRootPart.CFrame = target.CFrame * CFrame.new(0, 0, 3.5)
        if localCharacter:FindFirstChildWhichIsA("Tool") then
            localCharacter:FindFirstChildWhichIsA("Tool"):Activate()
        else
            if localHumanoid and tool then
                localHumanoid:EquipTool(tool)
            elseif not tool or not tool.Parent then
                tool = lookForBestSword()
            end
        end
    end
end)

for _, mob in ipairs(mobsFolder:GetChildren()) do
    if mob:FindFirstChild("HumanoidRootPart") then
        mobsTable[mob] = mob
    end
end

mobsFolder.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "HumanoidRootPart" then
        mobsTable[descendant.Parent] = descendant.Parent
    end
end)

mobsFolder.ChildRemoved:Connect(function(child)
    if mobsTable[child] then
        mobsTable[child] = nil
    end
end)

while true do
    noclip()
    for _, mob in pairs(mobsTable) do
        if mob:FindFirstChild("HumanoidRootPart") then
            local humanoid = mob:FindFirstChild("Humanoid")
            target = mob.HumanoidRootPart
            while true do
               if not humanoid or humanoid.Health == 0 then
                    target = nil
                    break
                end
                wait()
            end
        end
    end
    wait()
end
