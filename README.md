# EndingsModule
### ⚠️ EndingsModule is DISCONTINUED, I do not reccomend using it. I was an amateur developer when I created it, and alot of the code could be HEAVILY optimized.

EndingsModule is an easy-to-use, Open Source [ModuleScript](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) for [ROBLOX](https://roblox.com/) to make creating story-type games easier.

Follow the creator 😎: [@ivadsiuls](https://www.roblox.com/users/5048508312/profile)


**Basic knowledge of Roblox Studio and Lua is expected.**

*if you'd like to help this project become even better, you're free to fork it!*

## How 2 Set Up

**Make sure ALLOW THIRD PARTY TELEPORTS is enabled on your experience**

Download the [latest release](https://github.com/ivadsiuls/EndingsModule/releases)

Once downloaded, place it into ServerScriptService, or ReplicatedStorage

Remember, EndingsModule cannot be used inside the client, we do this to prevent cheating.

## Configuration 4 your game

Go into the EndingsModule, you should see this:

```lua
local TweenService = game:GetService("TweenService")
local TweenInformation = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local TeleportService = game:GetService("TeleportService")
local PLACE_ID = 16871131982;

local BadgeService = game:GetService("BadgeService")
local badges = {
	TestEnding = 2780397641298388;
}
```

set the PLACE_ID variable to the PlaceId of your game's place that you'll be re-teleported to once you press the rejoin button.

Inside the "badges" table, add the name of your ending, then the BadgeId you want for it. Something like this:

```lua
local badges = {
	TestEnding = 2780397641298388;
}
```



## Creating an ending (EXAMPLE)

**if you'd like to look at the example yourself, enter the [Test Place](https://www.roblox.com/games/16871131982/EndingModule-Test-Place) for EndingsModule. It is uncopylocked, and you can do anything you want with it!**

First, create a [RemoteEvent](https://create.roblox.com/docs/reference/engine/classes/RemoteEvent) inside [ReplicatedStorage](https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage).
Once you've added  the RemoteEvent, insert a [Script](https://create.roblox.com/docs/reference/engine/classes/Script) in [ServerScriptService](https://create.roblox.com/docs/reference/engine/classes/ServerScriptService), and copy this code into it:

```lua
game:GetService("ReplicatedStorage").PutTheNameOfYourRemoteHere.OnServerEvent:Connect(function(player, ending)
	local module = require(game:GetService("ReplicatedStorageOrServerScriptService"):FindFirstChild("WhateverYouNamedEndingModuleAs"))

	if ending == "EndingName" then
		module:GiveEnding(player, "Name", "NameString (TEXT)", "Description", "hint (OPTIONAL)")
	end
end)
```

Now, to **test** if it works, create a button. this can be designed as anything you want. I'd make it simple since this is just a test.
Insert a [LocalScript](https://create.roblox.com/docs/reference/engine/classes/LocalScript) into your button, and copy this code into it:

```lua
script.Parent.MouseButton1Click:Connect(function()
	game:GetService("ReplicatedStorage").WhateverYouNamedTheEndingRemoteAs:FireServer("EndingName")
end)
```
That should work! Test it out to see if it works.

## Custom Ending UI/Teleport Screen

This one's pretty simple to do! Here's how to do it:

Inside the EndingsModule, there should be 2 [ScreenGuis](https://create.roblox.com/docs/reference/engine/classes/ScreenGui), the TeleportScreen, and the EndingGUI.
Put the one you want to edit first inside [StarterGui](https://create.roblox.com/docs/reference/engine/classes/StarterGui), then customize it however you want!

**if you're editing the EndingGUI, do NOT re-name or delete any of the labels, buttons, or frames. If you do, EndingsModule will break.**

*Make sure to put them back inside the EndingsModule once you're done.*

That should be it!


