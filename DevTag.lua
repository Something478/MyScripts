-- // ==== Dev Tag thingy ==== \\

local Players = game:GetService("Players")
local TAG_NAME = "ScriptOwnerTag"
local TARGET_USERNAMES = { "IdkMyNameBro_012", "XDsomeoneX3", "Treezz_w", "BobloxPlayer59" } -- Add more here
local CHECK_INTERVAL = 2

local TargetLookup = {}
for _, name in pairs(TARGET_USERNAMES) do
	TargetLookup[name] = true
end

local function createTag(player)
	if player.Character and player.Character:FindFirstChild("Head") then
		if player.Character.Head:FindFirstChild(TAG_NAME) then return end

		local billboard1 = Instance.new("BillboardGui")
		billboard1.Name = TAG_NAME
		billboard1.Size = UDim2.new(0, 100, 0, 40)
		billboard1.StudsOffset = Vector3.new(0, 2.5, 0)
		billboard1.Adornee = player.Character.Head
		billboard1.AlwaysOnTop = true
		billboard1.Parent = player.Character.Head

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.new(1, 1, 0)
		label.TextStrokeTransparency = 0
		label.TextScaled = true
		label.Font = Enum.Font.Sarpanch
		label.Parent = billboard1

		if player.Name == "Theo_TheoBenzo" then
			label.Text = "Theo\nThe GOAT"
		else
			label.Text = "ChillbyteHD\nOwner"
		end
	end
end

task.spawn(function()
	while true do
		for _, player in pairs(Players:GetPlayers()) do
			if TargetLookup[player.Name] or player.Name == "Theo_TheoBenzo" then
				createTag(player)
			end
		end
		task.wait(CHECK_INTERVAL)
	end
end)

Players.PlayerAdded:Connect(function(player)
	if TargetLookup[player.Name] or player.Name == "Theo_TheoBenzo" then
		player.CharacterAdded:Connect(function()
			task.wait(1)
			createTag(player)
		end)
	end
end)
