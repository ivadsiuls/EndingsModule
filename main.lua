--[[


╭━━━╮╱╱╱╱╭╮╱╱╱╱╱╱╱╱╱╱╭━╮╭━╮╱╱╱╱╭╮╱╱╭╮
┃╭━━╯╱╱╱╱┃┃╱╱╱╱╱╱╱╱╱╱┃┃╰╯┃┃╱╱╱╱┃┃╱╱┃┃
┃╰━━┳━╮╭━╯┣┳━╮╭━━┳━━╮┃╭╮╭╮┣━━┳━╯┣╮╭┫┃╭━━╮
┃╭━━┫╭╮┫╭╮┣┫╭╮┫╭╮┃━━┫┃┃┃┃┃┃╭╮┃╭╮┃┃┃┃┃┃┃━┫
┃╰━━┫┃┃┃╰╯┃┃┃┃┃╰╯┣━━┃┃┃┃┃┃┃╰╯┃╰╯┃╰╯┃╰┫┃━┫
╰━━━┻╯╰┻━━┻┻╯╰┻━╮┣━━╯╰╯╰╯╰┻━━┻━━┻━━┻━┻━━╯
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯
 
 
// ModuleScript for endings.
// probably NOT optimized, you can optimize this yourself if you want to.
]]

local TweenService = game:GetService("TweenService")
local TweenInformation = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local TeleportService = game:GetService("TeleportService")
local PLACE_ID = 16871131982;

local BadgeService = game:GetService("BadgeService")
local badges = {
	TestEnding = 2780397641298388;
}

local mainModule = {}


if game:GetService("RunService"):IsClient() then
	warn("EndingModule does not allow client-sided scripts to run our function to prevent cheating.")
	return
else
	print("EndingModule is runnning on the server, as expected.")
end

-- MAIN FUNCTION

function mainModule:GiveEnding(player: Player, ending: string, nameString: string, descString: string, hintString: string)
	
	-- BADGES
	
	local hasBadge = BadgeService:UserHasBadgeAsync(player.UserId, badges[ending])
	if not hasBadge then
		BadgeService:AwardBadge(player.UserId, badges[ending])
	end
	
	-- GUI
	
	local oldProperties = {}
	
	
	for _, v in pairs(player.PlayerGui:GetDescendants()) do
		if v:IsA("ScreenGui") then
			v.Enabled = false
		end
	end
	
	
	local gui = script.EndingGUI:Clone()
	gui.Parent = player.PlayerGui
	gui.Enabled = true
	
	gui.Main.EndingName.Text = nameString
	gui.Main.Description.Text = descString
	if hintString then
		gui.Main.Hint.Text = "HINT: "..hintString
	else
		gui.Main.Hint.Text = ""
	end
	
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") then
			oldProperties[v] = {
				BackgroundTransparency = v.BackgroundTransparency;
			}
			v.BackgroundTransparency = 1
		elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
			oldProperties[v] = {
				BackgroundTransparency = v.BackgroundTransparency;
				ImageTransparency = v.ImageTransparency;
			}
			v.ImageTransparency = 1
			v.BackgroundTransparency = 1
		elseif v:IsA("TextLabel") or v:IsA("TextButton") then
			oldProperties[v] = {
				BackgroundTransparency = v.BackgroundTransparency;
				TextTransparency = v.TextTransparency;
			}
			v.TextTransparency = 1
			v.BackgroundTransparency = 1
		elseif v:IsA("UIStroke") then
			oldProperties[v] = {
				Transparency = v.Transparency;
			}
			v.Transparency = 1
		end
	end
	
	for _, v in pairs(gui:GetDescendants()) do
		if v:IsA("Frame") then
			local tween = TweenService:Create(v, TweenInformation, {BackgroundTransparency = oldProperties[v].BackgroundTransparency})
			tween:Play()
		elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
			local tween = TweenService:Create(v, TweenInformation, {ImageTransparency = oldProperties[v].ImageTransparency})
			tween:Play()
			local tween2 = TweenService:Create(v, TweenInformation, {BackgroundTransparency = oldProperties[v].BackgroundTransparency})
			tween2:Play()
		elseif v:IsA("TextLabel") or v:IsA("TextButton") then
			local tween = TweenService:Create(v, TweenInformation, {TextTransparency = oldProperties[v].TextTransparency})
			tween:Play()
			local tween2 = TweenService:Create(v, TweenInformation, {BackgroundTransparency = oldProperties[v].BackgroundTransparency})
			tween2:Play()
		elseif v:IsA("UIStroke") then
			local tween = TweenService:Create(v, TweenInformation, {Transparency = oldProperties[v].Transparency})
			tween:Play()
		end
	end
	
	-- REJOIN BUTTON
	
	gui.Main.RejoinButton.MouseButton1Click:Once(function()
		local access_code = TeleportService:ReserveServer(PLACE_ID)
		TeleportService:TeleportToPrivateServer(PLACE_ID, access_code, {player}, "SpawnLocation", nil, script.TeleportScreen)
	end)
end 

return mainModule
