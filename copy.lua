local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Noob-With-Z/Libraries/main/BetterOrion"))()

local printtext = "NoobZ Hub : Rebirth Champions Ultimate"
local ver = "0.1"

local specialdate = "None"

do
	local emoji = ({
		["01 01"] = "🎆",
		[(function(Year)
			local A = math.floor(Year/100)
			local B = math.floor((13+8*A)/25)
			local C = (15-B+A-math.floor(A/4))%30
			local D = (4+A-math.floor(A/4))%7
			local E = (19*(Year%19)+C)%30
			local F = (2*(Year%4)+4*(Year%7)+6*E+D)%7
			local G = (22+E+F)
			if E == 29 and F == 6 then
				return "04 19"
			elseif E == 28 and F == 6 then
				return "04 18"
			elseif 31 < G then
				return ("04 %02d"):format(G-31)
			end
			return ("03 %02d"):format(G)
		end)(tonumber(os.date"%Y"))] = "🥚",
		["04 01"] = "👍",
		["10 31"] = "🎃",
		["12 25"] = "🎄",
		["12 31"] = "🎆",
	})[os.date("%m %d")]
	if emoji then
		printtext = ("%s %s %s"):format(emoji, printtext, emoji)
		dates = {
			["🎆"] = "New Year",
			["🎃"] = "Halloween",
			["🎄"] = "Christmas",
			["🥚"] = "Easter",
			["👍"] = "April Fools",
		}
		specialdate = dates[emoji] or "None"
	end
end

print([[

            888b    888                    888     8888888888P 
            8888b   888                    888           d88P  
            88888b  888                    888          d88P   
            888Y88b 888  .d88b.   .d88b.  88888b.      d88P    
            888 Y88b888 d88""88b d88""88b 888 "88b    d88P     
            888  Y88888 888  888 888  888 888  888   d88P      
            888   Y8888 Y88..88P Y88..88P 888 d88P  d88P       
            888    Y888  "Y88P"   "Y88P"  88888P"  d8888888888 

]])
print(printtext)
print("Version: "..ver)

local Window = OrionLib:MakeWindow({
	IntroText = "I'm addicted XD",
	IntroIcon = "rbxassetid://78486456652427",
	Name = "NoobZ | Rebirth Champions Ultimate",
	IntroToggleIcon = "rbxassetid://128786630893208",
	HidePremium = false,
	SaveConfig = false,
	IntroEnabled = true,
	ConfigFolder = "NoobZ",
})

local Options = {
	["ADropsCollect"] = { Value = true },
	["AHubClicker"]   = { Value = false },
	["AHubRebirth"]   = { Value = false },
	["ATutorial"]     = { Value = false },

	["ACClaim"]       = { Value = false },
	["GAClicker"]     = { Value = false },
	["GARebirth"]     = { Value = false },
	["GFEggs"]        = { Value = false },
	["GSHunter"]      = { Value = false },
	["GShiHunter"]    = { Value = false },
	["GVip"]          = { Value = false },
	["GIFarmer"]      = { Value = false },
	["GMFLuck"]       = { Value = false },
	["GMLuck"]        = { Value = false },
	["GULuck"]        = { Value = false },
	["AHatch"]        = { Value = false },

	["AGStars"]       = { Value = true },
	["AOSupply"]      = { Value = false },
	["ACFarm"]        = { Value = true },
	["ACChests"]      = { Value = true },
	["ACMChests"]     = { Value = true },

	["AMFarm"]        = { Value = false }
}

-- Tabs --
local Main = Window:MakeTab({ Name = "Main", Icon = "home" })
local Items = Window:MakeTab({ Name = "Items", Icon = "hammer"})
local Gamepasses = Window:MakeTab({ Name = "Gamepasses", Icon = "gem"})
local Event = Window:MakeTab({ Name = "Event", Icon = "calendar-check-2"})
local Settings = Window:MakeTab({ Name = "Settings", Icon = "settings"})
----------

-- Main Locals --
-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")

-- Local Player
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChild("Humanoid")

-- Inside Game Locals
-- Workspace
local Debris = Workspace:FindFirstChild("Debris") -- workspace.Debris
local Orbs = Debris:FindFirstChild("Orbs") -- Debris.Orbs
local Game = Workspace:FindFirstChild("Game") -- workspace.Game
local Maps = Game:FindFirstChild("Maps") -- Game.Maps
-- Knit
local Knit = require(ReplicatedStorage:WaitForChild("Packages"):FindFirstChild("Knit"))
-- Controllers
local UIController = require(plr.PlayerScripts.Client.Controllers.UIController)
local Confetti = require(plr.PlayerScripts.Client.Controllers.UIController.FX.Confetti)
local DataController = require(plr.PlayerScripts.Client.Controllers.DataController)
local EggController = require(plr.PlayerScripts.Client.Controllers.EggController)
local FarmController = require(plr.PlayerScripts.Client.Controllers.FarmController)
local ChestController = require(plr.PlayerScripts.Client.Controllers.ChestController)
-- Services
local ClickService = Knit.GetService("ClickService")
local RebirthService = Knit.GetService("RebirthService")
local EggService = Knit.GetService("EggService")
local FarmService = Knit.GetService("FarmService")
local UpgradeService = Knit.GetService("UpgradeService")
local RewardService = Knit.GetService("RewardService")
-----------------

local __RebirthsValues = {
	__Normal = {
		"1", "5", "10", "25", "50", "100", 
		"200", "500", "1K", "2.5K", "5K", "10K", "15K", 
		"25K", "50K", "100K", "200K", "500K", "1M", "2.5M", 
		"5M", "10M", "25M", "50M", "100M", "250M", "500M", "1B", 
		"2.5B", "5B", "10B", "25B", "50B", "150B", "500B", "1T", 
		"5T", "25T", "100T", "250T", "500T", "1Qd", "2.5Qd", "10Qd",
		"25Qd", "100Qd", "250Qd", "500Qd", "1Qn", "5Qn", "25Qn", 
		"100Qn", "250Qn", "1Sx", "5Sx", "25Sx", "100Sx", "500Sx",
		"1Sp", "5Sp", "25Sp", "100Sp", "500Sp", "2.5O", "10O", "50O",
		"250O", "1N", "10N", "50N",
	}
}

local function GetHRP()
	char = plr.Character or plr.CharacterAdded:Wait()
	return char:FindFirstChild("HumanoidRootPart")
end

local function IsUNCAvailable(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

firetouchinsterest = IsUNCAvailable("function", firetouchinsterest)
fireproximityprompt = IsUNCAvailable("function", fireproximityprompt)

local function Click()
	ClickService.click:Fire()
end

local function Rebirth(RebirthQuantity)
	RebirthService:rebirth(RebirthQuantity or 1)
end

local function OpenEgg(EggName, Quantity)
	EggName = EggName or "Basic"
	Quantity = math.clamp(Quantity or 1, 1, 3)
	EggService.openEgg:Fire(EggName, Quantity)
end

local function BuyUpgrade(UpgradeName)
	if UpgradeName == "Rebirth" then
		UpgradeService:upgrade("rebirthButtons")
	else
		warn("UpgradeName inválido em BuyUpgrade()")
	end
end

local function NotifyUser(Title, Message, Button)
	UIController:createMessagePopup({
		title = Title,
		message = Message,
		button = Button or "Ok!",
		noSound = true
	})
end

local function GetMobs()
	local Mobs = {}
	for _, v in pairs(Debris:GetChildren()) do
		if v:IsA("Model") and v:GetAttribute("mobId") then
			table.insert(Mobs, { model = v, id = v:GetAttribute("mobId"), name = v.Name })
		end
	end
	return Mobs
end

local function Touch(TouchPart, HumanoidRootPart)
	if TouchPart and HumanoidRootPart and firetouchinsterest then
		firetouchinsterest(TouchPart, HumanoidRootPart, 0)
		task.wait()
		firetouchinsterest(TouchPart, HumanoidRootPart, 1)
	end
end

-- Main Tab --

if specialdate and specialdate ~= "None" then
	if specialdate == "New Year" then
		Main:AddSection({Name = "🎉 Happy New Year! 🎉"})
	elseif specialdate == "Easter" then
		Main:AddSection({Name = "🥚 Happy Easter! 🥚"})
	elseif specialdate == "Christmas" then
		Main:AddSection({Name = "🎄 Merry Christmas! 🎄"})
	elseif specialdate == "Halloween" then
		Main:AddSection({Name = "🎃 Happy Halloween! 🎃"})
	elseif specialdate == "April Fools" then
		Main:AddSection({Name = "This isn't Roblox anymore, welcome to Minecraft."})
		Main:AddSection({Name = "Nevermind, who cares about that? Just broke this shit."})
	end
end

Main:AddSection({Name = "Main"})

Main:AddToggle({
	Name = "Auto Collect Drops",
	Default = Options.ADropsCollect.Value,
	Callback = function(Toggled)
		Options.ADropsCollect.Value = Toggled
	end
})

Main:AddToggle({
	Name = "Auto Clicker [Hub Auto Clicker]",
	Default = Options.AHubClicker.Value,
	Callback = function(Toggled)
		Options.AHubClicker.Value = Toggled
	end
})

local dropdownValues = {}
for i, v in ipairs(__RebirthsValues.__Normal) do
	table.insert(dropdownValues, i .. " : " .. v)
end

local ___AutoRebirthValue = 1

Main:AddDropdown({
	Name = "Auto Rebirth Quantity",
	Options = dropdownValues,
	Default = dropdownValues[1] or "1 : 1",
	Callback = function(Value)
		if Value then
			local id = tonumber(string.split(Value, " : ")[1])
			___AutoRebirthValue = id
		end
	end
})

Main:AddToggle({
	Name = "Auto Rebirth [Hub Auto Rebirth]",
	Default = Options.AHubRebirth.Value,
	Callback = function(Toggled)
		Options.AHubRebirth.Value = Toggled
	end
})

Main:AddToggle({
	Name = "Auto Tutorial / Skip Tutorial",
	Default = Options.ATutorial.Value,
	Callback = function(Toggled)
		Options.ATutorial.Value = Toggled
	end
})

--------------

-- Gamepasses --

Gamepasses:AddSection({Name = "Gamepasses (does NOT save to real Data)"})

Gamepasses:AddToggle({
	Name = "Auto Claim Chests Gamepass",
	Default = Options.ACClaim.Value,
	Callback = function(Toggled)
		Options.ACClaim.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Auto Clicker Gamepass",
	Default = Options.GAClicker.Value,
	Callback = function(Toggled)
		Options.GAClicker.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Auto Rebirth Gamepass",
	Default = Options.GARebirth.Value,
	Callback = function(Toggled)
		Options.GARebirth.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Faster Eggs Open Gamepass",
	Default = Options.GFEggs.Value,
	Callback = function(Toggled)
		Options.GFEggs.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Secret Hunter Gamepass",
	Default = Options.GSHunter.Value,
	Callback = function(Toggled)
		Options.GSHunter.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Shiny Hunter Gamepass",
	Default = Options.GShiHunter.Value,
	Callback = function(Toggled)
		Options.GShiHunter.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "VIP Gamepass",
	Default = Options.GVip.Value,
	Callback = function(Toggled)
		Options.GVip.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Insane Farmer Gamepass",
	Default = Options.GIFarmer.Value,
	Callback = function(Toggled)
		Options.GIFarmer.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Mega Fragments Luck Gamepass",
	Default = Options.GMFLuck.Value,
	Callback = function(Toggled)
		Options.GMFLuck.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Mega Luck Gamepass",
	Default = Options.GMLuck.Value,
	Callback = function(Toggled)
		Options.GMLuck.Value = Toggled
	end
})

Gamepasses:AddToggle({
	Name = "Ultra Luck Gamepass",
	Default = Options.GULuck.Value,
	Callback = function(Toggled)
		Options.GULuck.Value = Toggled
	end
})

Gamepasses:AddSection({Name = "Miscellaneous"})

Gamepasses:AddToggle({
	Name = "Enable Auto Hatch (If not a Group Member)",
	Default = Options.AHatch.Value,
	Callback = function(Toggled)
		Options.AHatch.Value = Toggled
	end
})

---------------

-- Items Tab --

Items:AddSection({Name = "Falling Stars [Server Event]"})

Items:AddToggle({
	Name = "Auto Collect Stars",
	Default = Options.AGStars.Value,
	Callback = function(Toggled)
		Options.AGStars.Value = Toggled
	end
})

Items:AddSection({Name = "Suply Drop [Global Event]"})

Items:AddToggle({
	Name = "Auto Open Supply Drops",
	Default = Options.AOSupply.Value,
	Callback = function(Toggled)
		Options.AOSupply.Value = Toggled
	end
})

Items:AddSection({Name = "Fruit Farm"})

Items:AddToggle({
	Name = "Auto Collect Fruit Farm",
	Default = Options.ACFarm.Value,
	Callback = function(Toggled)
		Options.ACFarm.Value = Toggled
	end
})

Items:AddSection({Name = "Chests & Mini Chests"})

Items:AddToggle({
	Name = "Auto Claim Chests",
	Default = Options.ACChests.Value,
	Callback = function(Toggled)
		Options.ACChests.Value = Toggled
	end
})

Items:AddToggle({
	Name = "Auto Collect Mini Chests (Auto Collect Drops recommended)",
	Default = Options.ACMChests.Value,
	Callback = function(Toggled)
		Options.ACMChests.Value = Toggled
	end
})

--------------

-- Events --

Event:AddSection({Name = "On-going Event Now: ⚔️Magic Tower⚔️"})
local MagicTowerService = Knit.GetService("MagicTowerService")

local function DamageMob(MobId)
	if MobId then MagicTowerService.damage:Fire(MobId) end
end

local MobClasses = {
	"All", "Spider", "Skeleton", "Magic Bat", "Witch", "Magic Golem", "Haunted Wizard",
	"Magic Slime", "Dark Eye", "Electro Wizard", "Dark Wizard", "Chaos Wizard"
}

local function GetDungeonMobs(MobClass)
	if not MobClass then return {} end
	if not table.find(MobClasses, MobClass) then return {} end

	local toreturn = {}
	local mobs = GetMobs()

	for _, data in pairs(mobs) do
		if data.model and data.id then
			if MobClass == "All" or data.name == MobClass then
				table.insert(toreturn, data.model)
			end
		end
	end
	return toreturn
end

local Farming = {"All"}

Event:AddMultiDropdown({
	Name = "Auto Farm Mobs",
	Options = MobClasses,
	Default = {"All"},
	Callback = function(Value)
		if Value["All"] then 
			Farming = {"All"}
		else
			local values = {}
			for val, stat in next, Value do
				if stat then
					table.insert(values, val)
				end
			end
			Farming = values
		end
	end,
})

Event:AddToggle({
	Name = "Auto Farm Selected Mobs",
	Default = Options.AMFarm.Value,
	Callback = function(Toggled)
		Options.AMFarm.Value = Toggled
	end
})

task.spawn(function()
	while task.wait() do
		if Options.AMFarm.Value and #Farming > 0 then 
			if not table.find(Farming, "All") then
				for _, mobClass in pairs(Farming) do
					local Mobs = GetDungeonMobs(mobClass)
					for _, mobModel in pairs(Mobs) do
						if mobModel and mobModel:GetAttribute("mobId") then
							DamageMob(mobModel:GetAttribute("mobId"))
						end
					end
				end
			else
				local Mobs = GetDungeonMobs("All")
				for _, mobModel in pairs(Mobs) do
					if mobModel and mobModel:GetAttribute("mobId") then
						DamageMob(mobModel:GetAttribute("mobId"))
					end
				end
			end
		end
	end
end)

--------------

-- Main Controller --

task.spawn(function()
	while task.wait(.5) do
		for _, v in pairs(game:GetService("StarterPlayer"):FindFirstChild("StarterPlayerScripts"):FindFirstChild("Client"):FindFirstChild("Controllers"):GetDescendants()) do
			if v:IsA("ModuleScript") then
				print("["..v.Name.."]: NoobZ är inne i ditt spel. Jag är så ledsen, Roksek.")
			end
		end

		DataController.data.passes.freeAutoClicker = Options.GAClicker.Value
		DataController.data.passes.autoClicker = Options.GAClicker.Value
		DataController.data.ancientShop.autoChestCollect = Options.ACClaim.Value
		DataController.data.passes.autoRebirth = Options.GARebirth.Value
		DataController.data.passes.fasterEggsOpen = Options.GFEggs.Value
		DataController.data.passes.secretHunter = Options.GSHunter.Value
		DataController.data.passes.shinyHunter = Options.GShiHunter.Value
		DataController.data.passes.vip = Options.GVip.Value
		DataController.data.passes.insaneFarmer = Options.GIFarmer.Value
		DataController.data.passes.megaFragmentsLuck = Options.GMFLuck.Value
		DataController.data.passes.megaLuck = Options.GMLuck.Value
		DataController.data.passes.ultraLuck = Options.GULuck.Value

		EggController._cachedIsInGroup = Options.AHatch.Value

		local myHrp = GetHRP()

		if Options.ACFarm.Value then
			for i, v in pairs(Maps:GetDescendants()) do
				if v:IsA("Model") and v.Parent.Name == "Farms" and v:GetAttribute("farmId") then
					local timeuntilcancollect = FarmController:getTimeLeft(v:GetAttribute("farmId"))
					if timeuntilcancollect <= 0 then
						FarmService:claim(v:GetAttribute("farmId"))
					end
				end
			end
		end

		if Options.ACChests.Value then
			for _, machinefolder : Folder in pairs(Maps:GetDescendants()) do
				if machinefolder:IsA("Folder") and machinefolder.Name == "Machines" then
					for _, machine in pairs(machinefolder:GetChildren()) do
						if machine.Name:lower():find("chest") and machine:GetAttribute("chestId") then
							RewardService:claimChest(machine:GetAttribute("chestId"))
						end
					end
				end
			end
		end

		if Options.ACMChests.Value and fireproximityprompt then
			for _, minichest in CollectionService:GetTagged("MiniChest") do
				local minichestname = minichest:GetAttribute("miniChestName")
				local minichestid = minichest:GetAttribute("miniChestId")
				if minichestname and minichestid then
					local minichestpos = minichest:GetPivot().Position
					local hrppos = myHrp.Position
					if (minichestpos - hrppos).Magnitude <= 500 then
						if not minichest:GetAttribute("isAnimating") then
							for _, prompt in pairs(minichest:GetDescendants()) do
								if prompt:IsA("ProximityPrompt") then fireproximityprompt(prompt) end
							end
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait(.1) do
		local myHrp = GetHRP()

		if Options.AGStars.Value and firetouchinsterest and myHrp then
			for _, v in pairs(Debris:GetChildren()) do
				if v:IsA("Model") and v.Name == "FallingStar" then
					local hitbox = v:FindFirstChild("Hitbox")
					if hitbox then Touch(hitbox, myHrp) end
				end
			end
		end

		if Options.AOSupply.Value and fireproximityprompt then
			for _, v in pairs(Debris:GetChildren()) do
				if v:IsA("Model") and v.Name == "SupplyDropEvent" then
					for _, prompt in pairs(v:GetDescendants()) do
						if prompt:IsA("ProximityPrompt") then fireproximityprompt(prompt) end
					end
				end
			end
		end

		if Options.AHubClicker.Value then Click() end

		if Options.AHubRebirth.Value then Rebirth(___AutoRebirthValue) end

		if Options.ADropsCollect.Value and myHrp then
			for _, v in pairs(Orbs:GetChildren()) do
				if v:IsA("BasePart") and v:GetAttribute("canCollect") then
					v.CFrame = myHrp.CFrame
					-- a little "optimization"
					if v:FindFirstChildWhichIsA("ParticleEmitter") then
						v:FindFirstChildWhichIsA("ParticleEmitter").Enabled = false
					end
					if v:FindFirstChildWhichIsA("BillboardGui") then
						v:FindFirstChildWhichIsA("BillboardGui").Enabled = false
					end
				end
			end
		end
	end
end)

-- Miscellaneous --
do
	if OrionLib then
		OrionLib:MakeNotification({
			Name = "Warning",
			Content = "This scripts is actually W.I.P, any issues is completely normal.",
			Time = 8
		})
	end

	local __ThatShitAndNewCreenGuiLILBoy = Instance.new("Folder", SoundService)
	__ThatShitAndNewCreenGuiLILBoy.Name = "NoobZ Assets"
	local __soundToPlayLOLLLLL = Instance.new("Sound", __ThatShitAndNewCreenGuiLILBoy)
	__soundToPlayLOLLLLL.Name = "onExecute"
	__soundToPlayLOLLLLL.Volume = .7
	__soundToPlayLOLLLLL.SoundId = "rbxassetid://1053296915"

	Confetti()
	UIController:createMessagePopup({
		title = "NoobZ Warning!",
		message = "NoobZ Hub Loaded.\nVersion: "..ver,
		button = "Sure!",
		noSound = true,
		sound = nil
	})
	__soundToPlayLOLLLLL:Play()
end
