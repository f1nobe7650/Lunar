-- coded by @finobe or something 

getgenv().Desync = true
local a = CFrame.new
local b = game.Players.LocalPlayer
local c = 0.5
local d = "X"
local e = game:GetService("UserInputService")
local f; 

game:GetService("RunService").heartbeat:Connect(
    function()
        if b.Character then
            local g = b.Character.HumanoidRootPart
            local h = g.CFrame * a(9e9, 0 / 0, math.huge)
            if getgenv().Desync then
                f = b.Character.HumanoidRootPart.CFrame
                b.Character.HumanoidRootPart.CFrame = h
                game:GetService("RunService").RenderStepped:Wait()
                b.Character.HumanoidRootPart.CFrame = f
            end
        end
    end
)
e.InputBegan:Connect(
    function(i)
        if i.KeyCode == Enum.KeyCode[d] then
            getgenv().Desync = not getgenv().Desync
            if not Desync then
                b.Character.HumanoidRootPart.CFrame = f
                game:GetService("StarterGui"):SetCore(
                    "SendNotification",
                    {Title = "Destroy Cheaters", Text = "Disabled"}
                )
            else
                f = nil
                game:GetService("StarterGui"):SetCore(
                    "SendNotification",
                    {Title = "Destroy Cheaters", Text = "Enabled"}
                )
            end
        end
    end
)
local j
j =
    hookmetamethod(
    game,
    "__index",
    newcclosure(
        function(self, k)
            if not checkcaller() then
                if
                    k == "CFrame" and getgenv().Desync and b.Character and
                        b.Character:FindFirstChild("HumanoidRootPart") and
                        b.Character:FindFirstChild("Humanoid") and
                        b.Character:FindFirstChild("Humanoid").Health > 0
                 then
                    if self == b.Character.HumanoidRootPart and f ~= nil then
                        return f
                    end
                end
            end
            return j(self, k)
        end
    )
)
