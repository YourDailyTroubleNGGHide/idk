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

for _, v in pairs(game:GetService("StarterPlayer"):FindFirstChild("StarterPlayerScripts"):FindFirstChild("Client"):FindFirstChild("Controllers"):GetDescendants()) do
	if v:IsA("ModuleScript") then
		print("["..v.Name.."]: NoobZ är inne i ditt spel. Jag är så ledsen, Roksek.")
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
local TreeService = Knit.GetService("TreeService")
-- Modules
local Variables = require(ReplicatedStorage:WaitForChild("Shared"):FindFirstChild("Variables"))
local Util = require(ReplicatedStorage:WaitForChild("Shared"):FindFirstChild("Util"))
local Rebirths = require(ReplicatedStorage:WaitForChild("Shared"):FindFirstChild("List"):FindFirstChild("Rebirths"))
local Achievements = require(ReplicatedStorage:WaitForChild("Shared"):FindFirstChild("List"):FindFirstChild("Achievements"))
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

Main:AddToggle("ADropsCollect", {Title = "Auto Collect Drops", Default = true })
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

Main:AddSection("Tree Harvest")

local ToHarvest = {"Default Tree"}

local TreeList = {
	["Default Tree"] = { ["groupId"] = "spawn" },
	["Cactus Tree"] = { ["groupId"] = "desert" },
	["Nuclear Tree"] = { ["groupId"] = "nuclear" },
	["Atlantis Tree"] = { ["groupId"] = "atlantis" },
	["Kingdom Tree"] = { ["groupId"] = "kingdom" },
	["Cave Tree"] = { ["groupId"] = "cave" },
	["Volcano Tree"] = { ["groupId"] = "volcano" },
	["Heaven Tree"] = { ["groupId"] = "heaven" },
	["Circus Tree"] = { ["groupId"] = "circus" },
	["Jungle Tree"] = { ["groupId"] = "jungle" },
	["Steampunk Tree"] = { ["groupId"] = "steampunk" },
	["Sakura Tree"] = { ["groupId"] = "sakura" }
}

local TreeNames = {}
for name, _ in pairs(TreeList) do
	table.insert(TreeNames, name)
end

local Main_TreeHarvestPick = Main:AddDropdown("MultiDropdown", {
	Title = "Select Tree Types",
	Description = "Select the Tree(s) to farm.",
	Values = TreeNames,
	Multi = true,
	Default = {"Default Tree"},
})

Main_TreeHarvestPick:OnChanged(function(Value)
	local values = {}
	for val, stat in next, Value do
		if stat then
			table.insert(values, val)
		end
	end
	ToHarvest = values
end)

Main:AddToggle("AHarvest", {Title = "Auto Harvest Trees", Default = false })

--------------

-- Gamepasses --

Gamepasses:AddSection("Gamepasses (does NOT save to real Data)")

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

--Items:AddSection("Chests & Mini Chests")
--Items:AddToggle("ACChests", {Title = "Auto Collect Chests (These you already own)", Default = true })
Items:AddSection("Chests & Mini Chests")
Items:AddToggle("ACChests", {Title = "Auto Claim Chests", Default = true })
Items:AddToggle("ACMChests", {Title = "Auto Collect Mini Chests (use Auto Collect Drops)", Default = true })

Items:AddSection("Rewards")
Items:AddToggle("ACPRewards", {Title = "Auto Claim Playtime Rewards", Default = true })
Items:AddToggle("ACDaily", {Title = "Auto Claim Daily Reward", Default = true })
Items:AddToggle("ACAchievements", {Title = "Auto Claim Achievements Rewards", Default = true })

--------------

-- Events --

Event:AddSection("On-going Event Now: ⚔️Magic Tower⚔️")
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

local Event_MobFarmingDropdown = Event:AddDropdown("MultiDropdown", {
	Title = "Auto Farm Mobs",
	Description = "Select the Mobs to farm.",
	Values = MobClasses,
	Multi = true,
	Default = {"All"},
})

Event:AddParagraph({
	Title = "Important!",
	Content = "Don't forget to unmark option 'All' if you have selected other Mobs."
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

FarmPriority = "Strongest"

local Event_Priority = Event:AddDropdown("Dropdown", {
	Title = "Farm Priority",
	Description = "The priority rule the Mobs will be killed or damaged",
	Values = {"Weakest", "Strongest", "Random"},
	Default = "Strongest",
})

Event_Priority:OnChanged(function(Value)
	FarmPriority = Value
end)

Event:AddToggle("AMFarm", {Title = "Auto Farm Selected Mobs", Default = false })

local WhoIsBetterThan = {
	["Spider"] = "Skeleton",
	["Skeleton"] = "Magic Bat",
	["Magic Bat"] = "Witch",
	["Witch"] = "Magic Golem",
	["Magic Golem"] = "Haunted Wizard",
	["Haunted Wizard"] = "Magic Slime",
	["Magic Slime"] = "Dark Eye",
	["Dark Eye"] = "Electro Wizard",
	["Electro Wizard"] = "Dark Wizard",
	["Dark Wizard"] = "Chaos Wizard",
	["Chaos Wizard"] = "No one"
}

local MobStrengthIndex = {}
local currentMob = "Spider"
local score = 1
while currentMob and currentMob ~= "No one" do
	MobStrengthIndex[currentMob] = score
	currentMob = WhoIsBetterThan[currentMob]
	score = score + 1
end

task.spawn(function()
	while task.wait() do
		if Options.AMFarm.Value and #Farming > 0 then 

			local TargetMobs = {}
			if table.find(Farming, "All") then
				for _, data in pairs(GetMobs()) do
					table.insert(TargetMobs, data)
				end
			else
				for _, mobClass in pairs(Farming) do
					for _, data in pairs(GetMobs()) do
						if data.name == mobClass then
							table.insert(TargetMobs, data)
						end
					end
				end
			end

			if FarmPriority == "Weakest" then
				table.sort(TargetMobs, function(a, b)
					local powerA = MobStrengthIndex[a.name] or 0
					local powerB = MobStrengthIndex[b.name] or 0
					return powerA < powerB
				end)
			elseif FarmPriority == "Strongest" then
				table.sort(TargetMobs, function(a, b)
					local powerA = MobStrengthIndex[a.name] or 0
					local powerB = MobStrengthIndex[b.name] or 0
					return powerA > powerB
				end)
			elseif FarmPriority == "Random" then
				for i = #TargetMobs, 2, -1 do
					local j = math.random(i)
					TargetMobs[i], TargetMobs[j] = TargetMobs[j], TargetMobs[i]
				end
			end

			for _, mobData in pairs(TargetMobs) do
				if mobData.model and mobData.id then
					DamageMob(mobData.id)
				end
			end

		end
	end
end)

--------------

-- Main Controller --

local hassomeaxe = false
local hassomepickaxe = false

task.spawn(function()
	while task.wait(.5) do
		DataController.data.passes.freeAutoClicker = Options.GAClicker.Value
		DataController.data.passes.autoClicker = Options.GAClicker.Value
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
					if (minichestpos - hrppos).Magnitude <= 2000 then
						if not minichest:GetAttribute("isAnimating") then
							for _, prompt in pairs(minichest:GetDescendants()) do
								if prompt:IsA("ProximityPrompt") then fireproximityprompt(prompt) end
							end
						end
					end
				end
			end
		end
		
		if Options.ACPRewards.Value then
			for i = 1, 12 do
				RewardService:claimPlaytimeReward(i)
			end
		end
		
		if Options.ACDaily.Value then
			RewardService:claimDailyReward()
		end
		
		if Options.ACAchievements.Value then
			for achIndex, achName in Achievements do
				RewardService:claimAchievement(achIndex)
				print("claiming achievement", achName)
			end
		end
		
		for _, axe in DataController:getData().inventory.exclusive do
			local v103 = Util.itemUtils.createItemFromData(axe)
			if v103:getName():lower():find("axe") and not v103:getName():lower():find("pickaxe") then
				hassomeaxe = true
			elseif not v103:getName():lower():find("axe") and v103:getName():lower():find("pickaxe") then
				hassomepickaxe = true
			end
		end
	end
end)

local treedead = false

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

		if Options.AHubRebirth.Value then
			local currentlyautorebirth = Rebirths[___AutoRebirthValue]
			local currentlyrebirthquantity = DataController.data.rebirths
			print(currentlyautorebirth, currentlyrebirthquantity, Variables.rebirthPrice, Variables.rebirthPriceMultiplier, currentlyrebirthquantity.clicks)
			if (Variables.rebirthPrice + currentlyrebirthquantity.rebirths * Variables.rebirthPriceMultiplier) * currentlyautorebirth + Variables.rebirthPriceMultiplier * (currentlyautorebirth * (currentlyautorebirth - 1) / 2) <= currentlyrebirthquantity.clicks then
				Rebirth(___AutoRebirthValue)
				print(("Auto Rebirth: %* for %*"):format(___AutoRebirthValue, math.floor((Variables.rebirthPrice + currentlyrebirthquantity.rebirths * Variables.rebirthPriceMultiplier) * currentlyautorebirth + Variables.rebirthPriceMultiplier * (currentlyautorebirth * (currentlyautorebirth - 1) / 2))))
			end
		end

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
		
		if Options.AHarvest.Value then
			for _, v in pairs(CollectionService:GetTagged("Tree")) do
				local TreeModel = v:FindFirstChildWhichIsA("Model")
				if TreeModel then
					local TreeGroupId = TreeModel:GetAttribute("groupId")
					local TreeId = TreeModel:GetAttribute("treeId")

					if TreeGroupId and TreeId then
						print("tree has groupId and treeId")
						local billboard = TreeModel:FindFirstChildWhichIsA("BillboardGui", true)
						if billboard then
							treedead = billboard.Enabled
						else
							treedead = false
						end

						if not treedead and hassomeaxe and #ToHarvest > 0 then
							print("perfect statuses for tree")
							for _, selectedTreeName in pairs(ToHarvest) do
								local treeConfig = TreeList[selectedTreeName]
								print("checking selected tree")
								if treeConfig and treeConfig.groupId == TreeGroupId then
									print("has tree")
									local _data = DataController:getData()
									if _data.trees[TreeGroupId] and _data.trees[TreeGroupId][TreeId] then
										if _data.AxeEquipped or hassomeaxe then 
											print("has some axe")
											myHrp.CFrame = TreeModel:GetPivot()
											TreeService.damage2:Fire(TreeGroupId, TreeId, TreeService:getLumberId())
										end
									end
								end
							end
						end
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
