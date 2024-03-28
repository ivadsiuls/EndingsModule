# EndingsModule
EndingsModule is an easy-to-use, Open Source module for ROBLOX to make creating story-type games easier.

Follow the creator 😎: [@ivadsiuls](https://www.roblox.com/users/5048508312/profile)


## How 2 Set Up

Download the [latest release](https://github.com/ivadsiuls/EndingsModule/releases)

Once downloaded, place it into ServerScriptService, or ReplicatedStorage

Remember, EndingsModule cannot be used inside the client to prevent cheating.

## Configuration 4 your game

Go into the EndingsModule, you should see this:

```
local TweenService = game:GetService("TweenService")
local TweenInformation = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local TeleportService = game:GetService("TeleportService")
local PLACE_ID = 16871131982;

local BadgeService = game:GetService("BadgeService")
local badges = {
	TestEnding = 2780397641298388;
}
```
