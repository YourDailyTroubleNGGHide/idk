local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

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

            888b    888                   888     8888888888P 
            8888b   888                   888           d88P  
            88888b  888                   888          d88P   
            888Y88b 888  .d88b.   .d88b.  88888b.     d88P    
            888 Y88b888 d88""88b d88""88b 888 "88b   d88P     
            888  Y88888 888  888 888  888 888  888  d88P      
            888   Y8888 Y88..88P Y88..88P 888 d88P d88P       
            888    Y888  "Y88P"   "Y88P"  88888P" d8888888888 

]])
print(printtext)
print("Version: "..ver)

local Window = Fluent:CreateWindow({
	Title = "RCU [WIP]",
	SubTitle = "by NoobZ",
	TabWidth = 100,
	Size = UDim2.fromOffset(500, 320),
	Acrylic = false,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.H
})

local Options = Fluent.Options

-- Tabs --
local Main = Window:AddTab({ Title = "Main", Icon = "home"})
local Items = Window:AddTab({ Title = "Items", Icon = "hammer"})
local Gamepasses = Window:AddTab({ Title = "Gamepasses", Icon = "gem"})
local Event = Window:AddTab({ Title = "Event", Icon = "calendar-check-2"})
local Settings = Window:AddTab({ Title = "Settings", Icon = "settings"})
----------

-- Main Locals --
	-- Services
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local SoundService = game:GetService("SoundService")
	local UserInputService = game:GetService("UserInputService")
	local Workspace = game:GetService("Workspace")

	-- Local Player
	local plr = Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChild("Humanoid")

-- Inside Game Locals
	-- Workspace
	local Debris = Workspace:WaitForChild("Debris") -- Folder Debris in Workspace
	local Orbs = Debris:WaitForChild("Orbs") -- Child of Folder Debris
	local Game = Workspace:WaitForChild("Game") -- Folder Game in Workspace
	local Maps = Game:WaitForChild("Maps") -- Folder Maps in Folder Game
	-- Knit
	local Knit = require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit"))
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
		Main:AddSection("🎉 Happy New Year! 🎉")
	elseif specialdate == "Easter" then
		Main:AddSection("🥚 Happy Easter! 🥚")
	elseif specialdate == "Christmas" then
		Main:AddSection("🎄 Merry Christmas! 🎄")
	elseif specialdate == "Halloween" then
		Main:AddSection("🎃 Happy Halloween! 🎃")
	elseif specialdate == "April Fools" then
		Main:AddSection("This isn't Roblox anymore, welcome to Minecraft.")
		Main:AddSection("Nevermind, who cares about that? Just broke this shit.")
	end
end

Main:AddSection("Main")

Main:AddToggle("ADropsCollect", {Title = "Auto Collect Drops", Default = false })
Main:AddToggle("AHubClicker", {Title = "Auto Clicker [Hub Auto Clicker]", Default = false })

local dropdownValues = {}
for i, v in ipairs(__RebirthsValues.__Normal) do
	table.insert(dropdownValues, i .. " : " .. v)
end

local ___AutoRebirthValue = 1

local RebirthOptsDropdown = Main:AddDropdown("Dropdown", {
	Title = "Auto Rebirth Quantity",
	Description = "The amount of Rebirths you want to do with the Auto Rebirth.",
	Values = dropdownValues,
	Multi = false,
	Default = 1,
})

RebirthOptsDropdown:OnChanged(function(Value)
	if Value then
		local id = tonumber(string.split(Value, " : ")[1])
		___AutoRebirthValue = id
	end
end)

Main:AddToggle("AHubRebirth", {Title = "Auto Rebirth [Hub Auto Rebirth]", Default = false })
Main:AddToggle("ATutorial", {Title = "Auto Tutorial / Skip Tutorial", Default = false })

--------------

-- Gamepasses --

Gamepasses:AddSection("Gamepasses (does NOT save to real Data when leaves the game)")

Gamepasses:AddToggle("ACClaim", {Title = "Auto Claim Chests Gamepass", Default = false })
Gamepasses:AddToggle("GAClicker", {Title = "Auto Clicker Gamepass", Default = false })
Gamepasses:AddToggle("GARebirth", {Title = "Auto Rebirth Gamepass", Default = false })
Gamepasses:AddToggle("GFEggs", {Title = "Faster Eggs Open Gamepass", Default = false })
Gamepasses:AddToggle("GSHunter", {Title = "Secret Hunter Gamepass", Default = false })
Gamepasses:AddToggle("GShiHunter", {Title = "Shiny Hunter Gamepass", Default = false })
Gamepasses:AddToggle("GVip", {Title = "VIP Gamepass", Default = false })
Gamepasses:AddToggle("GIFarmer", {Title = "Insane Farmer Gamepass", Default = false })
Gamepasses:AddToggle("GMFLuck", {Title = "Mega Fragments Luck Gamepass", Default = false })
Gamepasses:AddToggle("GMLuck", {Title = "Mega Luck Gamepass", Default = false })
Gamepasses:AddToggle("GULuck", {Title = "Ultra Luck Gamepass", Default = false })

Gamepasses:AddSection("Miscellaneous")

Gamepasses:AddToggle("AHatch", {Title = "Enable Auto Hatch (If not a Group Member)", Default = false })

---------------

-- Items Tab --

Items:AddSection("Falling Stars [Server Event]")
Items:AddToggle("AGStars", {Title = "Auto Collect Stars", Default = true })

Items:AddSection("Suply Drop [Global Event]")
Items:AddToggle("AOSupply", {Title = "Auto Open Supply Drops", Default = false })

Items:AddSection("Fruit Farm")
Items:AddToggle("ACFarm", {Title = "Auto Collect Fruit Farm", Default = true })

Items:AddSection("Chests & Mini Chests")
Items:AddToggle("ACChests", {Title = "Auto Collect Chests (These you already own)", Default = true })
Items:AddToggle("ACMChests", {Title = "Auto Collect Mini Chests (Auto Collect Drops recommended)", Default = true })

--------------

-- Events --

Event:AddSection({ Name = "On-going Event Now: ⚔️Magic Tower⚔️" })
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

local Event_MobFarmingDropdown = Main:AddDropdown("MultiDropdown", {
	Title = "Auto Farm Mobs",
	Description = "Select the Mobs to farm.",
	Values = MobClasses,
	Multi = true,
	Default = {"All"},
})

Event_MobFarmingDropdown:OnChanged(function(Value)
	if Value == "All" then
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
end)

Event:AddToggle("AMFarm", {Title = "Auto Farm Selected Mobs", Default = false })

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
		
		if Options.ACFarm.Value then
			local FarmMap = Maps:WaitForChild("Farm")
			if FarmMap then
				local Farm = FarmMap:WaitForChild("Farm")
				if Farm then
					for i, v in pairs(Farm:GetChildren()) do
						if v:IsA("Model") and v:GetAttribute("farmId") then
							local timeuntilcancollect = FarmController:getTimeLeft(v:GetAttribute("farmId"))
							if timeuntilcancollect <= 0 then
								FarmService:claim(v:GetAttribute("farmId"))
							end
						end
					end
				end
			end
		end
		
		if Options.ACChests.Value then
			for _, machinefolder : Folder in pairs(Maps:GetDescendants()) do
				if machinefolder:IsA("Folder") and machinefolder.Name == "Machines" then
					for _, machine in pairs(machinefolder:GetChildren()) do
						if machine.Name:find("Chest") and machine:GetAttribute("chestId") then
							RewardService:claimChest(machine:GetAttribute("chestId"))
						end
					end
				end
			end
		end
		
		if Options.ACMChests.Value and fireproximityprompt then
			for _, minichestfolder : Folder in pairs(Maps:GetDescendants()) do
				if minichestfolder:IsA("Folder") and minichestfolder.Name == "MiniChests" then
					for _, minichest in pairs(minichestfolder:GetChildren()) do
						if minichest:IsA("Model") and (minichest:GetAttribute("miniChestId") and minichest:GetAttribute("miniChestName")) then
							fireproximityprompt(minichest:FindFirstChild("Touch"):FindFirstChildWhichIsA("ProximityPrompt"))
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
	Fluent:Notify({
		Title = "Warning",
		Content = "This scripts is actually W.I.P, any issues is completely normal.",
		SubContent = "(Yes any error is my bad)",
		Duration = 8
	})


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
