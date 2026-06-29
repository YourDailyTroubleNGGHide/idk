repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local BadgeService = game:GetService("BadgeService")
local VirtualUser = game:GetService("VirtualUser")

function missing(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

everyClipboard = missing("function", setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set))
gethwid = missing("function", gethwid)
identifyexecutor = missing("function", identifyexecutor)
queueteleport =  missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))
fireclickdetector = missing("function", fireclickdetector)
firetouchinterest = missing("function", firetouchinterest)
fireproximityprompt = missing("function", fireproximityprompt)
getconnections = missing("function", getconnections)
hookmetamethod = missing("function", hookmetamethod)
getnamecallmethod = missing("function", getnamecallmethod)

local CoreGui = RunService:IsStudio() and game.Players.LocalPlayer.PlayerGui or game.CoreGui

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local hrp = char and char:FindFirstChild("HumanoidRootPart")

function Touch(x)
	if x then
		return task.spawn(function()
			if x:IsA("BasePart") then
				x = x:FindFirstChildWhichIsA("TouchTransmitter")
			end
			
			if x and x:IsA("TouchTransmitter") then
				firetouchinterest(hrp, x.Parent, 1, wait() and firetouchinterest(hrp, x.Parent, 0))
			end
		end)
	end
end

function toClipboard(Orion, txt)
	if everyClipboard then
		everyClipboard(tostring(txt))
		Orion:MakeNotification({
			Name = "Clipboard",
			Content = "Copied to clipboard",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	else
		Orion:MakeNotification({
			Name = "Clipboard",
			Content = "Your exploit doesn't have the ability to use the clipboard",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
end

local Gloves = {
	SlapGloves = {
		["spin"] = { Slaps = -3 },
		["Stick"] = { Slaps = 0 },
		["Default but Bad"] = { Slaps = 0 },
		["Default"] = { Slaps = 0 },
		["Diamond"] = { Slaps = 15 },
		["ZZZZZZZ"] = { Slaps = 25 },
		["Extended"] = { Slaps = 25 },
		["Dual"] = { Slaps = 40 },
		["Brick"] = { Slaps = 65 },
		["Snow"] = { Slaps = 85 },
		["Pull"] = { Slaps = 125 },
		["Flash"] = { Slaps = 175 },
		["Stilts"] = { Slaps = 200 },
		["Spring"] = { Slaps = 250 },
		["Pinwheel"] = { Slaps = 300 },
		["Swapper"] = { Slaps = 350 },
		["Screwdriver"] = { Slaps = 400 },
		["Bull"] = { Slaps = 475 },
		["Dice"] = { Slaps = 585 },
		["Ghost"] = { Slaps = 666 },
		["Thanos"] = { Slaps = 795 },
		["Stun"] = { Slaps = 870 },
		["L.O.L.B.O.M.B"] = { Slaps = 925 },
		["Za Hando"] = { Slaps = 1000 },
		["Fort"] = { Slaps = 1075 },
		["Magnet"] = { Slaps = 1125 },
		["Pusher"] = { Slaps = 1250 },
		["Anchor"] = { Slaps = 1350 },
		["Space"] = { Slaps = 1500 },
		["Boomerang"] = { Slaps = 1625 },
		["Speedrun"] = { Slaps = 1750 },
		["Mail"] = { Slaps = 2000 },
		["T H I C K"] = { Slaps = 2250 },
		["Golden"] = { Slaps = 2500 },
		["Squid"] = { Slaps = 2750 },
		["MR"] = { Slaps = 3000 },
		["Hive"] = { Slaps = 3250 },
		["Reaper"] = { Slaps = 3500 },
		["Baby"] = { Slaps = 3750 },
		["Replica"] = { Slaps = 4000 },
		["Mace"] = { Slaps = 4250 },
		["Defense"] = { Slaps = 4500 },
		["Offense"] = { Slaps = 4500 },
		["Killstreak"] = { Slaps = 5000 },
		["Pineslapple"] = { Slaps = 5250 },
		["Reverse"] = { Slaps = 5500 },
		["Shukuchi"] = { Slaps = 6000 },
		["Duelist"] = { Slaps = 6500 },
		["woah"] = { Slaps = 7000 },
		["Ice"] = { Slaps = 7500 },
		["Gummy"] = { Slaps = 7750 },
		["Adios"] = { Slaps = 8000 },
		["Blocked"] = { Slaps = 8500 },
		["Divert"] = { Slaps = 8750 },
		["Engineer"] = { Slaps = 9000 },
		["Rocky"] = { Slaps = 9500 },
		["Coil"] = { Slaps = 9750 },
		["Conveyor"] = { Slaps = 10000 },
		["Balloony"] = { Slaps = 10500 },
		["Phantom"] = { Slaps = 11000 },
		["Leafblower"] = { Slaps = 11500 },
		["el gato"] = { Slaps = 11500 },
		["Wormhole"] = { Slaps = 12000 },
		["Shackle"] = { Slaps = 12500 },
		["Flick"] = { Slaps = 12750 },
		["STOP"] = { Slaps = 13000 },
		["Equalizer"] = { Slaps = 13500 },
		["Track"] = { Slaps = 14000 },
		["Stalker"] = { Slaps = 14500 },
		["Prop"] = { Slaps = 15000 },
		["Cherry"] = { Slaps = 15500 },
		["Shield"] = { Slaps = 16000 },
		["Clover"] = { Slaps = 16500 },
		["5 More"] = { Slaps = 16750 },
		["Booster"] = { Slaps = 17000 },
		["Chainsaw"] = { Slaps = 17500 },
		["Ping Pong"] = { Slaps = 18000 },
		["Thumbtack"] = { Slaps = 18250 },
		["Trifecta"] = { Slaps = 18500 },
		["Baller"] = { Slaps = 19000 },
		["Architect"] = { Slaps = 19500 },
		["Home Run"] = { Slaps = 20000 },
		["Friction"] = { Slaps = 20500 },
		["Whirlwind"] = { Slaps = 21000 },
		["Disc"] = { Slaps = 21500 },
		["BONK"] = { Slaps = 22000 },
		["Grenadier"] = { Slaps = 22500 },
		["Excavator"] = { Slaps = 23000 },
		["Retribution"] = { Slaps = 23500 },
		["Nightmare"] = { Slaps = 24000 },
		["Pylon"] = { Slaps = 24500 },
		["Thor"] = { Slaps = 25000 },
		["Slime"] = { Slaps = 25500 },
		["Pocket"] = { Slaps = 26000 },
		["Grapple"] = { Slaps = 27000 },
		["Command"] = { Slaps = 27500 },
		["Cloud"] = { Slaps = 28000 },
		["Stalagmite"] = { Slaps = 28500 },
		["Gravity"] = { Slaps = 29000 },
		["Helix"] = { Slaps = 29500 },
		["Parry"] = { Slaps = 30000 },
		["Glue"] = { Slaps = 30500 },
		["Jebaited"] = { Slaps = 31000 },
		["Meteor"] = { Slaps = 32000 },
		["Oven"] = { Slaps = 33000 },
		["Guardian Angel"] = { Slaps = 34000 },
		["Sun"] = { Slaps = 35000 },
		["Ferryman"] = { Slaps = 36000 },
		["Blackhole"] = { Slaps = 37000 },
		["Walrus"] = { Slaps = 37500 },
		["Blink"] = { Slaps = 38000 },
		["Tableflip"] = { Slaps = 39000 },
		["Slapstick"] = { Slaps = 40000 },
		["Beatdown"] = { Slaps = 41000 },
		["Jockey"] = { Slaps = 41500 },
		["Chicken"] = { Slaps = 42000 },
		["Slicer"] = { Slaps = 43000 },
		["Sbeve"] = { Slaps = 44000 },
		["Golem"] = { Slaps = 45000 },
		["Doomsday"] = { Slaps = 45500 },
		["Grab"] = { Slaps = 46000 },
		["UFO"] = { Slaps = 47000 },
		["Demolition"] = { Slaps = 48000 },
		["Beachball"] = { Slaps = 49000 },
		["Shotgun"] = { Slaps = 50000 },
		["Error"] = { Slaps = 50000 },
		["64"] = { Slaps = 51000 },
		["Roguelike"] = { Slaps = 52000 },
		["Barrel"] = { Slaps = 53000 },
		["Lawnmower"] = { Slaps = 54000 },
		["Virus"] = { Slaps = 55000 },
		["Smiler"] = { Slaps = 55500 },
		["Butcher"] = { Slaps = 55750 },
		["Infinity"] = { Slaps = 56000 },
		["Aggro"] = { Slaps = 57000 },
		["Medusa"] = { Slaps = 58000 },
		["Seal"] = { Slaps = 59000 },
		["Soul"] = { Slaps = 60000 },
		["R/C"] = { Slaps = 61000 },
		["Mushroom"] = { Slaps = 62000 },
		["Scuba"] = { Slaps = 63000 },
		["Pyromania"] = { Slaps = 64000 },
		["Automaton"] = { Slaps = 64500 },
		["Roaring"] = { Slaps = 65000 },
		["God's Hand"] = { Slaps = 70000 },
		["The Flex"] = { Slaps = 100000 },
	},
	BadgeGloves = {
		["MEGAROCK"] = { Badge = 2124807768 },
		["Plague"] = { Badge = 2124819262 },
		["Hallow Jack"] = { Badge = 2124836318 },
		["[REDACTED]"] = { Badge = 2124847850 },
		["bus"] = { Badge = 2124858899 },
		["Mitten"] = { Badge = 2124875920 },
		["Phase"] = { Badge = 2124886261 },
		["Warp"] = { Badge = 2124914780 },
		["Bomb"] = { Badge = 2124919840 },
		["Bubble"] = { Badge = {2124854307, 2124925929} },
		["Jet"] = { Badge = 2124930374 },
		["Shard"] = { Badge = 2124938910 },
		["potato"] = { Badge = 2124989121 },
		["CULT"] = { Badge = 2125850245 },
		["bob"] = { Badge = 2125950512 },
		["buddies"] = { Badge = 2124760928 },
		["Moon"] = { Badge = 2124760895 },
		["Jupiter"] = { Badge = 2126334003 },
		["Spy"] = { Badge = 2126450753 },
		["Detonator"] = { Badge = 2126589561 },
		["Rage"] = { Badge = 2127132894 },
		["Trap"] = { Badge = 2127567042 },
		["Orbit"] = { Badge = 2127703232 },
		["Hybrid"] = { Badge = 2127861437 },
		["Slapple"] = { Badge = 2128012376 },
		["Disarm"] = { Badge = 2128233612 },
		["Dominance"] = { Badge = 2127816588 },
		["Link"] = { Badge = 2124760254 },
		["Chain"] = { Badge = 2128557186 },
		["Rattlebones"] = { Badge = 2128772719 },
		["Charge"] = { Badge = 2129104684 },
		["Tycoon"] = { Badge = 2129212145 },
		["Confusion"] = { Badge = 2129474790 },
		["Glitch"] = { Badge = 2129568267 },
		["Snowball"] = { Badge = 2129648848 },
		["Elude"] = { Badge = 2129871858 },
		["RNG"] = { Badge = 2130031244 },
		["fish"] = { Badge = 2130032297 },
		["🗿"] = { Badge = 2130155314 },
		["Obby'"] = { Badge = 2130463063 },
		["Voodoo"] = { Badge = 2132544202 },
		["Goofy"] = { Badge = 2133016756 },
		["Leash"] = { Badge = 2136607413 },
		["Flamarang"] = { Badge = 2140855364 },
		["Kinetic"] = { Badge = 2141386326 },
		["Berserk"] = { Badge = 2141784233 },
		["Sparky"] = { Badge = 2142826462 },
		["Boogie"] = { Badge = 2143034526 },
		["Recall"] = { Badge = 2143973603 },
		["Quake"] = { Badge = 2144766764 },
		["Psycho"] = { Badge = 2145165421 },
		["Kraken"] = { Badge = 2145381761 },
		["Counter"] = { Badge = 2146130728 },
		["Hammer"] = { Badge = 2146540403 },
		["rob"] = { Badge = 2147429609 },
		["Rhythm"] = { Badge = 2148234934 },
		["Rojo"] = { Badge = 2148480065 },
		["Hitman"] = { Badge = 2149637240 },
		["Retro"] = { Badge = 2149637240 },
		["Null"] = { Badge = 2150485950 },
		["Lure"] = { Badge = 2151266964 },
		["Tinkerer"] = { Badge = 2152295593 },
		["Necromancer"] = { Badge = 2152906832 },
		["Alchemist"] = { Badge = 2153473254 },
		["Druid"] = { Badge = 2153911928 },
		["Jester"] = { Badge = 2500227230783997 },
		["Scythe"] = { Badge = 3318257806017965 },
		["Santa"] = { Badge = 2895206704788569 },
		["Iceskate"] = { Badge = 2906002612987222 },
		["Blasphemy"] = { Badge = 3335299217032061 },
		["Pan"] = { Badge = 4404799574333856 },
		["Admin"] = { Badge = 1840188608156642 },
		["Joust"] = { Badge = 1662954021427606 },
		["Firework"] = { Badge = 2628581469266954 },
		["Run"] = { Badge = 1579276416564374 },
		["Glovel"] = { Badge = 128402905805563 },
		["Divebomb"] = { Badge = 342573645147372 },
		["Lamp"] = { Badge = 490455814138437 },
		["Knockoff"] = { Badge = 1962623816699442 },
		["Frostbite"] = { Badge = 1286358044443937 },
		["Plank"] = { Badge = 4031317971987872 },
		["Spoonful"] = { Badge = 2236076719770808 },
		["the schlob"] = { Badge = 1354956782555226 },
		["Siphon"] = { Badge = 187186758930457 },
		["Wrench"] = { Badge = 2240434593038483 },
		["Hunter"] = { Badge = 3483144763925839 },
		["Relude"] = { Badge = 154204790800271 },
		["Avatar"] = { Badge = 4414076328730650 },
		["Water"] = { Badge = 2193861648156971 },
		["Fan"] = { Badge = 2657379023348335 },
		["Boxer"] = { Badge = 1223765330375569 },
		["MATERIALIZE"] = { Badge = 4256352459948010 },
		["Bind"] = { Badge = 3199562682373814 },
		["Poltergeist"] = { Badge = 868768988664040 },
		["Clock"] = { Badge = 2035627575374951 },
		["Untitled Tag Glove"] = { Badge = 2223110832777636 },
		["Pillow"] = { Badge = 4390302507334168 },
		["Angler"] = { Badge = 2117833544213343 },
		["Jerry"] = { Badge = 182408299845710 },
		["Snowroller"] = { Badge = 3726156327470282 },
		["Draw4"] = { Badge = 2460702219299014 },
		["Mouse"] = { Badge = 2146300368310575 },
		["Hexa"] = { Badge = 2090213992277846 },
		["Metaverse"] = { Badge = 1060832194529561 },
		["Swordfighter"] = { Badge = 1788920058870613 },
		["Tank"] = { Badge = 99649310086892 },
		["Eggler"] = { Badge = 2286252038116816 },
		["Slender"] = { Badge = 2442504376213257 },
		["Swashbuckler"] = { Badge = 3096378656988806 },
		["Silly"] = { Badge = 4342029848828580 },
		["Slasher"] = { Badge = 231810132716643 },
		["Car Keys"] = { Badge = 1294103285471925 },
		["Suction"] = { Badge = 3798851936234989 },
		["Reflect"] = { Badge = 1745844401258079 },
		["Dave"] = { Badge = 663807976473858 },
		["Mortis"] = { Badge = 1605140663413534 },
		["Bounty"] = { Badge = 1133862849283260 },
		["Debug"] = { Badge = 117389283982009 },
		["Paint"] = { Badge = 1035608345203235 },
		["Plate"] = { Badge = 1198780403030188 },
		["Lag"] = { Badge = 3713925567966983 },
		["Harvester"] = { Badge = 847759908824783 },
		["Riftshot"] = { Badge = 65341581701492 },
		["Conker"] = { Badge = 1304426038175458 },
		["Wheelchair"] = { Badge = 659930747853345 },
		["Elf"] = { Badge = 2748677045206815 },
		["Shopkeeper"] = { Badge = 1698466561019878 },
		["Collector"] = { Badge = 1902849233175110 },
		["Glaxe"] = { Badge = 1778876340809040 },
		["Piñata"] = { Badge = 217389347032866 },
		["Penguin"] = { Badge = 996318649761767 },
		["Undead"] = { Badge = 1239535438142380 },
		["Groundbreaker"] = { Badge = 4207775293625676 },
		["Shellbert"] = { Badge = 2604207010521588 },
		["Lasso"] = { Badge = 1662521369541218 },
		["Lotus"] = { Badge = 3964935687406576 },
		["Elastic"] = { Badge = 3344995751929220 },
		["G-X"] = { Badge = 1703260768466206 },
		["Doorkeeper"] = { Badge = 2886410353565684 },
	},
}

local Badges = {
	["The Lone Orange"] = 2128220957,
	["court evidence"] = 2124760907,
	["duck"] = 2124760916,
	
	["Brick Master"] = 2127567042,
	["DEEP SLUMBER"] = 2130032297,
	["Insanity"] = 2132544202,
	["WHY"] = 2124807768,
	["Friend of the Dark"] = 490455814138437,
	["Slap Battles: On Ice"] = 2906002612987222,
	["Evaded"] = 2124847850,
}

function CheckBadge(BID)
	local success, hasBadge = pcall(function()
		return game:GetService("BadgeService"):UserHasBadgeAsync(game:GetService("Players").LocalPlayer.UserId, BID)
	end)
	return success and hasBadge
end

function CensorUI()
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	
	local g = Instance.new("ScreenGui", CoreGui)
	g.Name = "NoobZ loves you for using his hub :)"
	g.DisplayOrder = 9999
	g.SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension
	g.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	g.IgnoreGuiInset = true
	g.ZIndexBehavior = Enum.ZIndexBehavior.Global

	local f = Instance.new("Frame", g)
	f.BackgroundColor3 = Color3.new(0, 0, 0)
	f.ZIndex = 999
	f.Size = UDim2.new(2, 0, 2, 0)
	f.Position = UDim2.new(.5, 0, .5, 0)
	f.AnchorPoint = Vector2.new(.5, .5)
end

local ClockGui = nil
local ClockSecs = 0
function Clock()
	local CoolOogsClock = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Timer = Instance.new("TextLabel")
	local UIStroke = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")

	CoolOogsClock.Name = "Cool Oog's Clock"
	CoolOogsClock.Parent = CoreGui
	CoolOogsClock.Enabled = false
	CoolOogsClock.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = CoolOogsClock
	Frame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Draggable = true
	Frame.Position = UDim2.new(0.119582668, 0, 0.208333328, 0)
	Frame.Size = UDim2.new(0.182863116, 0, 0.0925925896, 0)

	Timer.Name = "Timer"
	Timer.Parent = Frame
	Timer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Timer.BackgroundTransparency = 1.000
	Timer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Timer.BorderSizePixel = 0
	Timer.Size = UDim2.new(1, 0, 1, 0)
	Timer.Font = Enum.Font.Sarpanch
	Timer.Text = "00:00:00"
	Timer.TextColor3 = Color3.fromRGB(255, 0, 0)
	Timer.TextScaled = true
	Timer.TextSize = 14.000
	Timer.TextWrapped = true

	UIStroke.Thickness = 3.000
	UIStroke.Parent = Frame

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.211904734, 0, -0.25, 0)
	TextLabel.Size = UDim2.new(0.571428597, 0, 0.25, 0)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "( You can drag )"
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	
	ClockGui = CoolOogsClock
	return CoolOogsClock
end

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Noob-With-Z/Games/refs/heads/main/SlapBattles/OrionLibrary"))()

if RunService:IsStudio() or game.PlaceId == 6403373529 then

if not fireclickdetector or not firetouchinterest or not fireproximityprompt then
	
	local missinguncs = {}
	
	if not fireclickdetector then
		table.insert(missinguncs, "fireclickdetector")
	end
	
	if not fireproximityprompt then
		table.insert(missinguncs, "fireproximityprompt")
	end
	
	if not firetouchinterest then
		table.insert(missinguncs, "firetouchinterest")
	end
	
	if not hookmetamethod then
		table.insert(missinguncs, "hookmetamethod")
	end
	
	if not getnamecallmethod then
		table.insert(missinguncs, "getnamecallmethod")
	end
	
	if not everyClipboard then
		table.insert(missinguncs, "setclipboard")
	end
	
	if not queueteleport then
		table.insert(missinguncs, "queue_on_teleport")
	end
	
	if not getconnections then
		table.insert(missinguncs, "getconnections")
	end
	
	warn(" --- [[ NoobZ Warning ]] ---\n Error: UNCs Compability\n Desc: Your executor can be limited to this Hub due to missing some neccessary internal functions.\n Missing: ".. table.concat(missinguncs, ", ") .."\n For the fully experience, it's recommended to use an Executor which has these UNCs.\n --- [[ End ]] ---")
	
	OrionLib:MakeNotification({
		Name = "Warning",
		Content = "Found some errors while loading.\nSearch for 'NoobZ Warning' in Console for more info.",
		Image = "rbxassetid://4483345998",
		Time = 5
	})
end

local bypass;

if hookmetamethod and getnamecallmethod then
	bypass = hookmetamethod(game, "__namecall", function(method, ...) 
		if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
			return
		elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
			return
		elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
			return
		end
		return bypass(method, ...)
	end)
end

if not workspace:FindFirstChild("SafeBaseplate") then
	local p = Instance.new("Part", workspace)
	p.Name = "SafeBaseplate"
	p.Size = Vector3.new(2048, 30, 2048)
	p.Position = Vector3.new(17898, 71, -2650)
	p.CanCollide = true
	p.Anchored = true
	p.Transparency = .45
end

local Arena = workspace:WaitForChild("Arena", 10)
local Lobby = workspace:WaitForChild("Lobby", 10)

local Abilities = {
	["Diamond"] = "Rockmode",
	["ZZZZZZZ"] = "ZZZZZZZSleep",
	["Brick"] = "lbrick",
	["Flash"] = "FlashTeleport",
	["Pinwheel"] = "GeneralAbility",
	["Swapper"] = "SLOC",
	["Ghost"] = "Ghostinvisibilityactivated",
	["Thanos"] = "GeneralAbility", -- 1 to set, 2 to tp
	["Stun"] = "StunR", -- glove instance as arg
	["L.O.L.B.O.M.B"] = "GeneralAbility",
	["Za Hando"] = "Erase",
	["Fort"] = "Fortlol",
	["Golden"] = "",
	["Hive"] = "",
	["Replica"] = "",
	["Defense"] = "",
	["Reverse"] = "",
	["Adios"] = "",
	["Engineer"] = "",
	["Phantom"] = "",
	["el gato"] = "",
	["Wormhole"] = "",
	["Track"] = "",
	["Cherry"] = "",
	["Ping Pong"] = "",
	["Home Run"] = "",
	["BONK"] = "",
	["Thor"] = "",
	["Cloud"] = "",
	["Parry"] = {
		["Parry"] = "",
		["Dash"] = ""
	},
	["Guardian Angel"] = "",
	["Sbeve"] = "",
	["Grab"] = "",
	["UFO"] = "",
	["Lawnmower"] = "",
	["Virus"] = "",
	["Medusa"] = "",
	["Soul"] = "",
	
	["[REDACTED]"] = "",
	["bus"] = "",
	["Phase"] = "",
	["Warp"] = "",
	["Bomb"] = "",
	["Bubble"] = "",
	["Shard"] = "",
	["Potato"] = "",
	["bob"] = "",
	["Rage"] = "",
	["Tycoon"] = "",
	["Glitch"] = "",
	["fish"] = "",
	["🗿 (moai)"] = "",
	["Obby"] = "",
	["Voodoo"] = "",
	["Kinetic"] = "",
	["Berserk"] = "",
	["Sparky"] = "",
	["Recall"] = "",
	["Quake"] = "",
	["Psycho"] = "",
	["Hammer"] = "",
	["rob"] = "",
	["Null"] = "",
	["Lure"] = "",
	["Tinkerer"] = "",
	["Alchemist"] = "",
	["Scythe"] = "",
	["Firework"] = "",
	["Run"] = "",
	["Glovel"] = "",
	["Frostbite"] = "",
	["Plank"] = "",
	["Bind"] = "",
	["Clock"] = "",
	["Snowroller"] = "",
	["Hexa"] = "",
	["Eggler"] = {
		["I Am Egg"] = "EgglerRAbility",
		["Eggification"] = "GeneralAbility"
	},
	["Car Keys"] = "",
	["Groundbreaker"] = "",
	["Doorkeeper"] = "",
}

local Hits = {
    ["OVERKILL"] = "Overkillhit",
    ["Killerfish"] = "GeneralHit",
    ["CUSTOM"] = "CustomHit",
    ["Ultra Instinct"] = "GeneralHit",
    ["Titan"] = "",

    ["Default"] = "b",
    ["Diamond"] = "DiamondHit",
    ["ZZZZZZZ"] = "ZZZZZZZHit",
    ["Extended"] = "b",
    ["Dual"] = "GeneralHit",
    ["Brick"] = "BrickHit",
    ["Snow"] = "SnowHit",
    ["Pull"] = "PullHit",
    ["Flash"] = "FlashHit",
    ["Spring"] = "springhit",
    ["Swapper"] = "HitSwapper",
    ["Screwdriver"] = "",
    ["Bull"] = "BullHit",
    ["Dice"] = "DiceHit",
    ["Ghost"] = "GhostHit",
    ["Thanos"] = "ThanosHit",
    ["Stun"] = "HtStun",
    ["L.O.L.B.O.M.B"] = "GeneralHit",
    ["Za Hando"] = "zhramt",
    ["Fort"] = "Fort",
    ["Magnet"] = "MagnetHIT",
    ["Pusher"] = "PusherHit",
    ["Anchor"] = "hitAnchor",
    ["Space"] = "HtSpace",
    ["Boomerang"] = "BoomerangH",
    ["Speedrun"] = "Speedrunhit",
    ["Mail"] = "MailHit",
    ["T H I C K"] = "GeneralHit",
    ["Golden"] = "GoldenHit",
    ["Squid"] = "GeneralHit",
    ["MR"] = "MisterHit",
    ["Hive"] = "GeneralHit",
    ["Reaper"] = "ReaperHit",
    ["Baby"] = "",
    ["Replica"] = "ReplicaHit",
    ["Mace"] = "",
    ["Defense"] = "DefenseHit",
    ["Offense"] = "",
    ["Killstreak"] = "KSHit",
    ["Pineslapple"] = "",
    ["Reverse"] = "ReverseHit",
    ["Shukuchi"] = "ShukuchiHit",
    ["Duelist"] = "DuelistHit",
    ["woah"] = "woahHit",
    ["Ice"] = "IceHit",
    ["Gummy"] = "GeneralHit",
    ["Adios"] = "hitAdios",
    ["Blocked"] = "BlockedHit",
    ["Divert"] = "GeneralHit",
    ["Engineer"] = "engiehit",
    ["Rocky"] = "RockyHit",
    ["Coil"] = "HtStun",
    ["Conveyor"] = "ConvHit",
    ["Balloony"] = "HtStun",
    ["Phantom"] = "PhantomHit",
    ["el gato"] = "GeneralHit",
    ["Wormhole"] = "WormHit",
    ["Shackle"] = "",
    ["Flick"] = "",
    ["STOP"] = "STOP",
    ["Equalizer"] = "",
    ["Track"] = "GeneralHit",
    ["Stalker"] = "",
    ["Prop"] = "GeneralHit",
    ["Cherry"] = "",
    ["Shield"] = "GeneralHit",
    ["Clover"] = "",
    ["5 More"] = "",
    ["Booster"] = "GeneralHit",
    ["Chainsaw"] = "",
    ["Ping Pong"] = "GeneralHit",
    ["Thumbtack"] = "",
    ["Trifecta"] = "",
    ["Baller"] = "GeneralHit",
    ["Architect"] = "",
    ["Home Run"] = "GeneralHit",
    ["Friction"] = "",
    ["Whirlwind"] = "GeneralHit",
    ["Disc"] = "",
    ["BONK"] = "GeneralHit",
    ["Grenadier"] = "",
    ["Excavator"] = "GeneralHit",
    ["Retribution"] = "",
    ["Nightmare"] = "nightmarehit",
    ["Pylon"] = "",
    ["Thor"] = "ThorHit",
    ["Leafblower"] = "",
    ["Pocket"] = "GeneralHit",
    ["Grapple"] = "GeneralHit",
    ["Command"] = "",
    ["Cloud"] = "CloudHit",
    ["Stalagmite"] = "GeneralHit",
    ["Gravity"] = "GeneralHit",
    ["Helix"] = "",
    ["Parry"] = "GeneralHit",
    ["Glue"] = "",
    ["Jebaited"] = "GeneralHit",
    ["Meteor"] = "GeneralHit",
    ["Oven"] = "GeneralHit",
    ["Guardian Angel"] = "GeneralHit",
    ["Sun"] = "GeneralHit",
    ["Ferryman"] = "GeneralHit",
    ["Blackhole"] = "GeneralHit",
    ["Walrus"] = "",
    ["Blink"] = "GeneralHit",
    ["Tableflip"] = "GeneralHit",
    ["Slapstick"] = "GeneralHit",
    ["Beatdown"] = "GeneralHit",
    ["Jockey"] = "",
    ["Chicken"] = "GeneralHit",
    ["Slicer"] = "GeneralHit",
    ["Sbeve"] = "GeneralHit",
    ["Golem"] = "GeneralHit",
    ["Doomsday"] = "",
    ["Grab"] = "GeneralHit",
    ["UFO"] = "GeneralHit",
    ["Demolition"] = "GeneralHit",
    ["Beachball"] = "GeneralHit",
    ["Shotgun"] = "GeneralHit",
    ["64"] = "",
    ["Roguelike"] = "",
    ["Barrel"] = "",
    ["Lawnmower"] = "",
    ["Virus"] = "",
    ["Smiler"] = "",
    ["Butcher"] = "",
    ["Infinity"] = "",
    ["Aggro"] = "",
    ["Medusa"] = "",
    ["Seal"] = "",
    ["Soul"] = "",
    ["R/C"] = "",
    ["Mushroom"] = "",
    ["Scuba"] = "",
    ["Pyromania"] = "",
    ["Automaton"] = "",
    ["Roaring"] = "",
    ["God's Hand"] = "Godshand",
    ["The Flex"] = "FlexHit",

	["Error"] = "Errorhit",
	
    ["MEGAROCK"] = "DiamondHit",
    ["Plague"] = "PlagueHit",
    ["Hallow Jack"] = "HallowHIT",
    ["[REDACTED]"] = "ReHit",
    ["bus"] = "hitbus",
    ["Mitten"] = "MittenHit",
    ["Phase"] = "PhaseH",
    ["Warp"] = "WarpHt",
    ["Bomb"] = "BombHit",
    ["Bubble"] = "BubbleHit",
    ["Jet"] = "JetHit",
    ["Shard"] = "ShardHIT",
    ["potato"] = "potatohit",
    ["CULT"] = "CULTHit",
    ["bob"] = "bobhit",
    ["buddies"] = "buddiesHIT",
    ["Moon"] = "CelestialHit",
    ["Jupiter"] = "CelestialHit",
    ["Spy"] = "SpyHit",
    ["Detonator"] = "DetonatorHit",
    ["Rage"] = "GRRRR",
    ["Trap"] = "traphi",
    ["Orbit"] = "Orbihit",
    ["Hybrid"] = "HybridCLAP",
    ["Slapple"] = "SlappleHit",
    ["Disarm"] = "DisarmH",
    ["Dominance"] = "DominanceHit",
    ["Link"] = "LinkHit",
    ["Chain"] = "GeneralHit",
    ["Rattlebones"] = "GeneralHit",
    ["Charge"] = "GeneralHit",
    ["Tycoon"] = "GeneralHit",
    ["Confusion"] = "GeneralHit",
    ["Glitch"] = "GeneralHit",
    ["Snowball"] = "GeneralHit",
    ["Elude"] = "GeneralHit",
    ["RNG"] = "GeneralHit",
    ["fish"] = "GeneralHit",
    ["🗿"] = "GeneralHit",
    ["Obby"] = "GeneralHit",
    ["Voodoo"] = "GeneralHit",
    ["Goofy"] = "GeneralHit",
    ["Leash"] = "GeneralHit",
    ["Flamarang"] = "GeneralHit",
    ["Kinetic"] = "HtStun",
    ["Berserk"] = "GeneralHit",
    ["Sparky"] = "HtStun",
    ["Boogie"] = "HtStun",
    ["Recall"] = "HtStun",
    ["Quake"] = "GeneralHit",
    ["Psycho"] = "GeneralHit",
    ["Kraken"] = "GeneralHit",
    ["Counter"] = "GeneralHit",
    ["Hammer"] = "GeneralHit",
    ["rob"] = "robhit",
    ["Rhythm"] = "rhythmhit",
    ["Rojo"] = "RojoHit",
    ["Hitman"] = "HitmanHit",
    ["Retro"] = "RetroHit",
    ["Null"] = "NullHit",
    ["Lure"] = "GeneralHit",
    ["Tinkerer"] = "GeneralHit",
    ["Necromancer"] = "GeneralHit",
    ["Alchemist"] = "GeneralHit",
    ["Druid"] = "GeneralHit",
    ["Jester"] = "GeneralHit",
    ["Scythe"] = "GeneralHit",
    ["Santa"] = "GeneralHit",
    ["Iceskate"] = "GeneralHit",
    ["Blasphemy"] = "GeneralHit",
    ["Pan"] = "GeneralHit",
    ["Admin"] = "GeneralHit",
    ["Joust"] = "GeneralHit",
    ["Firework"] = "GeneralHit",
    ["Run"] = "GeneralHit",
    ["Glovel"] = "GeneralHit",
    ["Divebomb"] = "GeneralHit",
    ["Lamp"] = "GeneralHit",
    ["Knockoff"] = "GeneralHit",
    ["Frostbite"] = "GeneralHit",
    ["Plank"] = "GeneralHit",
    ["Spoonful"] = "GeneralHit",
    ["the schlob"] = "GeneralHit",
    ["Siphon"] = "GeneralHit",
    ["Wrench"] = "GeneralHit",
    ["Relude"] = "GeneralHit",
    ["Hunter"] = "GeneralHit",
    ["Avatar"] = "GeneralHit",
    ["Water"] = "",
    ["Fan"] = "",
    ["Boxer"] = "",
    ["MATERIALIZE"] = "",
    ["Bind"] = "",
    ["Poltergeist"] = "",
    ["Clock"] = "",
    ["Untitled Tag Glove"] = "",
    ["Pillow"] = "",
    ["Angler"] = "",
    ["Jerry"] = "",
    ["Snowroller"] = "",
    ["Draw4"] = "",
    ["Mouse"] = "",
    ["Hexa"] = "",
    ["Metaverse"] = "",
    ["Swordfighter"] = "",
    ["Tank"] = "",
    ["Eggler"] = "",
    ["Slender"] = "",
    ["Swashbuckler"] = "",
    ["Silly"] = "",
    ["Slasher"] = "",
    ["Car Keys"] = "",
    ["Suction"] = "",
    ["Reflect"] = "",
    ["Dave"] = "",
    ["Mortis"] = "",
    ["Bounty"] = "",
    ["Debug"] = "",
    ["Paint"] = "",
    ["Plate"] = "",
    ["Lag"] = "",
    ["Harvester"] = "",
    ["Riftshot"] = "",
    ["Conker"] = "",
    ["Wheelchair"] = "",
    ["Elf"] = "",
    ["Shopkeeper"] = "",
	["Collector"] = "",
	["Glaxe"] = "",
	["Piñata"] = "",
	["Penguin"] = "",
	["Undead"] = "",
	["Groundbreaker"] = "",
	["Shellbert"] = "",
	["Lasso"] = "",
	["Lotus"] = "",
	["Elastic"] = "",
	["G-X"] = "",
	["Doorkeeper"] = "",
}

local Window = OrionLib:MakeWindow({
	IntroText = "Slappppppppppppppppppppp",
	IntroIcon = "rbxassetid://14135814764",
	Name = "NoobZ Hub | Slap Battles",
	IntroToggleIcon = "rbxassetid://7734091286",
	HidePremium = false,
	SaveConfig = false,
	IntroEnabled = true,
	ConfigFolder = "SlapBattles_Settings.NoobZArchive",
})

local function GetSlaps()
	local leaderstats = plr:FindFirstChild("leaderstats")
	if leaderstats then
		local slaps : IntValue = leaderstats:FindFirstChild("Slaps")
		if slaps then
			local value = slaps.Value
			if value then
				return value
			end
		end
	end
end

local function GetGloveEquipped(Player)
	Player = Player or plr
	local leaderstats = Player:FindFirstChild("leaderstats")
	if leaderstats then
		local glove = leaderstats:FindFirstChild("Glove")
		if glove then
			return glove.Value
		end
	end
end

local function IsGloveEquipped(GloveName)
	if GloveName and typeof(GloveName) == "string" then
		return GetGloveEquipped() == GloveName
	end
end

local function EquipGlove(GloveName)
	if fireclickdetector and typeof(GloveName) == "string" then
		for i, v in ipairs(Lobby:GetChildren()) do
			if v:FindFirstChildWhichIsA("ClickDetector") and v.Name == GloveName then
				if Gloves.SlapGloves[GloveName] and GetSlaps() < Gloves.SlapGloves[GloveName].Slaps then
					OrionLib:MakeNotification({
						Name = "Warning",
						Content = "You don't have enough Slaps to equip this Glove!",
						Image = "rbxassetid://4483345998",
						Time = 5
					})
					return
				elseif Gloves.BadgeGloves[GloveName] then
					for key, value in pairs(Gloves.BadgeGloves[GloveName].Badge) do
						if not CheckBadge(key) then
							OrionLib:MakeNotification({
								Name = "Warning",
								Content = "You don't have the required badge(s) to equip this Glove!",
								Time = 7
							})
							return
						end
					end
				end
				
				fireclickdetector(v:FindFirstChildWhichIsA("ClickDetector"))
				return
			end
		end
	else
		return
	end
end

local function GetGloveOnCharacter(GloveName)
	if GloveName and typeof(GloveName) == "string" then
		local char = plr.Character or plr.CharacterAdded:Wait()
		if char then
			for i, v in ipairs(char:GetChildren()) do
				if v:IsA("Tool") then
					if v.Name:lower():match(GloveName:lower()) then
						return v
					end
				end
			end
		end
	end
end

local function UseAbility(AbilityName, args)
	if AbilityName and ReplicatedStorage:FindFirstChild(AbilityName) then
		local AbilityRemote = ReplicatedStorage:FindFirstChild(AbilityName)
		if AbilityRemote then
			if AbilityRemote:IsA("RemoteEvent") then
				AbilityRemote:FireServer(unpack(args))
			elseif AbilityRemote:IsA("RemoteFunction") then
				AbilityRemote:InvokeServer(unpack(args))
			end
		end
	else
		return
	end
end

local function Reset()
	if plr:FindFirstChild("Reset") then
		plr:FindFirstChild("Reset"):FireServer()
	end
end

local function InArena(Player)
	if Player and Player.Character then
		return Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("entered") ~= nil
	end
end

local function Slap(Player)
	if Player and Player.Character and InArena(Player) then
		local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and InArena(plr) then
				if GetGloveEquipped(Player) ~= "Elude" then
					ReplicatedStorage:FindFirstChild(Hits[GetGloveEquipped()]):FireServer(HumanoidRootPart)
				end
			end
		end
	end
end

local function EnterArena()
	if char and not char:FindFirstChild("entered") then
		Touch(Lobby:FindFirstChild("Teleport1"))
	end
end

local function TeleportToCFrame(TheCFrame)
	if TheCFrame and typeof(TheCFrame) == "CFrame" and hrp then
		hrp.CFrame = TheCFrame
	end
end

local CreditsTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://10723406885",
	PremiumOnly = false
})

CreditsTab:AddSection({
	Name = "Sources"
})

CreditsTab:AddParagraph("Giangplay","Most of the source used in here was taken from the open-source script from Giangplay's GitHub.\nPlease consider take a look into his awesome work here:")
CreditsTab:AddButton({
	Name = "Giangplay's Slap Battles Script",
	Callback = function()
		toClipboard(OrionLib, "loadstring(game:HttpGet('https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua'))()")
	end,
})

CreditsTab:AddSection({
	Name = "Main-Head"
})

CreditsTab:AddLabel("Made entirely by NoobZ")

local InfoTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://10723415903",
	PremiumOnly = false
})

InfoTab:AddSection({
	Name = "Server informations"
})

local ServerAgeLabel = InfoTab:AddLabel("Server Age: -1 Minutes")
local PlayersInServerLabel = InfoTab:AddLabel("Players in server: nan/inf")
local EludeKeypadCodeLabel = InfoTab:AddLabel("Elude Keypad Code: 190") --tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7)
InfoTab:AddSection({
	Name = "Badge informations"
})

local PhaseSpawnedLabel = InfoTab:AddLabel("Is Phase Orb Spawned: phasedd wwwwwwwwaaaaaaaaaaawwwwww")
local JetSpawnedLabel = InfoTab:AddLabel("Is Jet Orb Spawned: i believe i can fly...")
local GlitchSpawnedLabel = InfoTab:AddLabel("Is Glitch Orb Spawned: 01110011 01100101 01111000")
local SiphonSpawnedLabel = InfoTab:AddLabel("Is Siphon Orb Spawned: nooneknowsbtw")
local MATERIALIZESpawnedLabel = InfoTab:AddLabel("Is MATERIALIZE Orb Spawned: gogogogogogogogogogogogo")
local KeypadSpawnedLabel = InfoTab:AddLabel("Is Elude Keypad Spawned: blowjob")
local ToolboxSpawnedLabel = InfoTab:AddLabel("Is Toolbox Spawned: jimmy")
InfoTab:AddSection({
	Name = "Session informations"
})
local PlayerTimePlayingLabel = InfoTab:AddLabel("Time playing: 69h 69m 69s")
local PlayerFPSLabel = InfoTab:AddLabel("FPS: -240")
local PlayerPingLabel = InfoTab:AddLabel("Ping: 9999999ms")
InfoTab:AddSection({
	Name = "Recall useful 👍 (Q&A)"
})
local PlayerAccountAgeLabel = InfoTab:AddParagraph("Recall Q&A","'How old is your account in days?'\nA:-999999999banned")
local PlayerChatColorLabel = InfoTab:AddParagraph("Recall Q&A","'What color is your name in the Roblox Chat?'\nA: Woman Menstruation Neon Red")
InfoTab:AddParagraph("Recall Q&A","Q:'When was Slap Battles first published?'\nA: 16/2/2021")
InfoTab:AddParagraph("Recall Q&A","Q:'What is the badge name for the Glitch glove?'\nA: 01010010 01010101 01001110")
InfoTab:AddParagraph("Recall Q&A","Q:'If 1=3 2=3 3=5 4=4 5=4 6=?'\nA: 3")
InfoTab:AddParagraph("Recall Q&A","Q:'Whom ultimately controls this realm?'\nA: Tencell")
local PlayerSlapsLabel = InfoTab:AddParagraph("Recall Q&A","Q:'How many slaps do you have?'\nA: loadingslaps...")
InfoTab:AddParagraph("Recall Q&A","Q:'What has a bottom at the top?'\nA: Type in chat: 'A leg'")
InfoTab:AddParagraph("Recall Q&A","Q:'Did you forget that you repressed your memories?'\nA: Yes")
InfoTab:AddParagraph("Recall Q&A","Q:'Do you know who I am?'\nA: A forgotten memory")
InfoTab:AddParagraph("Recall Q&A","Q:'What has 4 fingers and one thumb but is not alive?'\nA: Type in chat: 'Glove'")
InfoTab:AddParagraph("Recall Q&A","Q:'What glove can't you hit when it isn't there?'\nA: Elude")
InfoTab:AddParagraph("Recall Q&A","Q:'We will play Simon Says at the end, do you understand?'\nA: Yes")
InfoTab:AddParagraph("Recall Q&A","Q:'What glove costs 9750 slaps?'\nA: Coil")
InfoTab:AddParagraph("Recall Q&A","Q:'What is the chance of getting bob from Replica?'\nA: 1/7500")
InfoTab:AddParagraph("Recall Q&A","Q:'How many gloves stands are in Slap Battles right now?'\nA: 265 (Last Updated: January 16th, 2026)")
InfoTab:AddParagraph("Credits","All these questions and answers has gotten from the official Slap Battles Wiki.")
InfoTab:AddButton({
	Name = "https://roblox-slap-battles.fandom.com/wiki  (Click to copy)",
	Callback = function()
		toClipboard(OrionLib, "https://roblox-slap-battles.fandom.com/wiki")
	end    
})

local AntiTab = Window:MakeTab({
	Name = "Anti",
	Icon = "rbxassetid://10734951847",
	PremiumOnly = false
})

if getconnections then
	for _, connection in pairs(getconnections(plr.Idled)) do
		if connection["Disable"] then
			connection["Disable"](connection)
		elseif connection["Disconnect"] then
			connection["Disconnect"](connection)
		end
	end
else
	idledCon = plr.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end

local BadgeTab = Window:MakeTab({
	Name = "Badges",
	Icon = "rbxassetid://10734887072",
	PremiumOnly = false
})

BadgeTab:AddSection({
	Name = "Misc. Badges"
})

BadgeTab:AddButton({
	Name = "duck, The Lone Orange & court evidence",
	Callback = function()
		if not CheckBadge(Badges.duck) then
			fireclickdetector(Arena:FindFirstChild("default island"):FindFirstChild("Rubber Ducky"):FindFirstChildWhichIsA("ClickDetector"))
		end
		
		if not CheckBadge(Badges["The Lone Orange"]) then
			fireclickdetector(Arena:FindFirstChild("island5"):FindFirstChild("Orange"):FindFirstChildWhichIsA("ClickDetector"))
		end
		
		if not CheckBadge(Badges["court evidence"]) then
			fireclickdetector(Lobby:FindFirstChild("Scene"):FindFirstChild("Knofe"):FindFirstChildWhichIsA("ClickDetector"))
		end
	end
})

BadgeTab:AddSection({
	Name = "Orb Badges"
})

task.spawn(function()
	
	local function GetOrb(OrbName)
		local theorb
		
		if OrbName == "Phase" then
			theorb = workspace:FindFirstChild("Phase Orb")
		elseif OrbName == "Jet" then
			theorb = workspace:FindFirstChild("Jet Orb")
		elseif OrbName == "Glitch" then
			theorb = workspace:FindFirstChild("Glitch Orb")
		elseif OrbName == "Siphon" then
			theorb = workspace:FindFirstChild("Siphon Orb")
		elseif OrbName == "MATERIALIZE" then
			theorb = workspace:FindFirstChild("MATERIALIZE Orb")
		end
		
		if firetouchinterest then
			Touch(theorb)
		end
	end
	
	BadgeTab:AddToggle({
	Name = "Auto Collect Phase Orb",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			GetOrb("Phase")
		end
	end
	})

	BadgeTab:AddToggle({
	Name = "Auto Collect Jet Orb",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			GetOrb("Jet")
		end
	end
	})

	BadgeTab:AddToggle({
	Name = "Auto Collect Glitch Orb",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			GetOrb("Glitch")
		end
	end
	})
	
	BadgeTab:AddToggle({
	Name = "Auto Collect Siphon Orb",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			GetOrb("Siphon")
		end
	end
	})
	
	BadgeTab:AddToggle({
	Name = "Auto Collect MATERIALIZE Orb",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			GetOrb("MATERIALIZE")
		end
	end
	})
end)

BadgeTab:AddSection({
	Name = "Free Badges"
})

BadgeTab:AddButton({
	Name = "Free Lamp",
	Callback = function()
		if not CheckBadge(Badges["Friend of the Dark"]) and GetSlaps() >= 15 then
			local LastGlove = GetGloveEquipped()
			
			if not IsGloveEquipped("ZZZZZZZ") and not InArena(plr) then
				EquipGlove("ZZZZZZZ")
			elseif InArena(plr) and not IsGloveEquipped("ZZZZZZZ") then
				OrionLib:MakeNotification({
					Name = "In Arena",
					Content = "Task will be completed when you leave the arena!",
					Image = "rbxassetid://4483345998",
					Time = 10
				})
				repeat task.wait() until not InArena(plr) and char
				task.wait(1)
				if char then
					EquipGlove("ZZZZZZZ")
				end
			end
			repeat task.wait() until IsGloveEquipped("ZZZZZZZ")
			ReplicatedStorage:FindFirstChild("nightmare"):FireServer("LightBroken")
			task.wait(.1)
			if LastGlove then
				EquipGlove(LastGlove)
			end
		elseif CheckBadge(Badges["Friend of the Dark"]) then
			OrionLib:MakeNotification({
				Name = "Warning",
				Content = "You already own this glove!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		elseif GetSlaps() < 15 then
			OrionLib:MakeNotification({
				Name = "Warning",
				Content = "You must have atleast 15 Slaps",
				Time = 6
			})
			return
		end
	end,
})

BadgeTab:AddButton({
	Name = "Free Ice Skate",
	Callback = function()
		if not CheckBadge(Badges["Slap Battles: On Ice"]) then
			ReplicatedStorage:FindFirstChild("IceSkate"):FireServer("Freeze")
		else
			OrionLib:MakeNotification({
				Name = "Warning",
				Content = "You already own this glove!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end
	end,
})

BadgeTab:AddButton({
	Name = "Free Frosbite",
	Callback = function()
		if not CheckBadge(Badges["Slap Battles: On Ice"]) then
			ReplicatedStorage:FindFirstChild("IceSkate"):FireServer("Freeze")
		else
			OrionLib:MakeNotification({
				Name = "Warning",
				Content = "You already own this glove!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end
	end,
})

BadgeTab:AddButton({
	Name = "Free [REDACTED]",
	Callback = function()
		if not CheckBadge(Badges["Evaded"]) then
		local pocketdimension = workspace:FindFirstChild("PocketDimension")
		if pocketdimension then
			local Doors = pocketdimension:FindFirstChild("Doors")
			if Doors then
				for _, v in Doors:GetChildren() do
					Touch(v)
				end
			end
		end
		else
			OrionLib:MakeNotification({
				Name = "Warning",
				Content = "You already own this glove!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end
	end,
})
BadgeTab:AddParagraph("Caution!", "The doors are randomly picked server-by-server, your character probably will die by trying this because it will touch every door from the [REDACTED] Dimension.\nYou got warned")

BadgeTab:AddSection({
	Name = "Helpful Oog's Clock :)"
})

BadgeTab:AddParagraph("Why? lol", "idk man, just a... clock?\nBtw, 'Clock Max Timer' must be the time in seconds.\ne.g.: 10 minutes >> 600 secs\ne.g.: 10 hours >> 36000 secs")

local OogClockMaxTimer = 0

BadgeTab:AddTextbox({
	Name = "Clock Max Timer",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		OogClockMaxTimer = tonumber(Value) or 0
	end,
})

local ClockToggle = BadgeTab:AddToggle({
	Name = "Oog's Clock",
	Default = false,
	Callback = function(Toggled)
		if Toggled then
			if not ClockGui then
				Clock()
			end
			
			ClockSecs = 0
			
			task.wait(1)
			
			repeat
				ClockSecs += 1
				
				local ClockText = ClockGui:FindFirstChild("Frame"):FindFirstChild("Timer")
				local Format = "%02d:%02d:%02d"
				
				ClockText.Text = string.format(Format, ClockSecs / 60 ^ 2, ClockSecs / 60 % 60, ClockSecs % 60)
				
				if ClockSecs >= OogClockMaxTimer then
					task.wait(1)
					ClockText.Text = "TIME'S UP! >:)"
					break
				end
				
				wait(1)
			until ClockSecs >= OogClockMaxTimer
		else
			ClockSecs = 0
			
			if ClockGui then
				ClockGui:Destroy()
				ClockGui = nil
			end
		end
	end,
})

BadgeTab:AddTextbox({
	Name = "Minutes to Seconds Calulator",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local ValueNum = tonumber(Value) or 0
		ValueNum *= 60
		OrionLib:MakeNotification({
			Name = "Result [MtS]",
			Content = ValueNum,
			Time = 5
		})
	end,
})

BadgeTab:AddTextbox({
	Name = "Hours to Seconds Calulator",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local ValueNum = tonumber(Value) or 0
		ValueNum *= 3600
		OrionLib:MakeNotification({
			Name = "Result [HtS]",
			Content = ValueNum,
			Time = 5
		})
	end,
})

BadgeTab:AddSection({
	Name = "Glove-Rewarding Badges"
})

local MultiBadge = ""

BadgeTab:AddDropdown({
	Name = "Multi Badge Farm",
	Default = "",
	Options = {"MEGAROCK + Voodoo", "Fish + Voodoo", "Voodoo + Trap"},
	Callback = function(Value)
		MultiBadge = Value
	end    
})

local mbft

mbft = BadgeTab:AddToggle({
	Name = "Farm Multi Badge",
	Default = false,
	Callback = function(Toggled)
		if not Toggled then return end
		if MultiBadge ~= "" then
			if InArena(plr) then
				OrionLib:MakeNotification({
					Name = "Warning",
					Content = "You must be in Lobby.",
					Time = 6
				})
				mbft:Set(false)
			end
			
			if MultiBadge:find("Voodoo") then
				if GetSlaps() < Gloves.SlapGloves.Ghost.Slaps then
					OrionLib:MakeNotification({
						Name = "Warning",
						Content = "You must have atleast ".. tostring(Gloves.SlapGloves.Ghost.Slaps) .." Slaps",
						Time = 6
					})
					mbft:Set(false)
					return
				end
			end
				
			if MultiBadge == "MEGAROCK + Voodoo" then
				if game.PrivateServerOwnerId == 0 and game.PrivateServerId == "" then
					OrionLib:MakeNotification({
						Name = "Warning",
						Content = "You can't obtain Voodoo in Private Server.",
						Time = 6
					})
					mbft:Set(false)
					return
				end
				EquipGlove("Ghost")
				task.wait(.1)
				UseAbility(Abilities.Ghost, {})
				task.wait(.1)
				EquipGlove("Diamond")
				EnterArena()
				task.wait(1)
				TeleportToCFrame(CFrame.new(-409, 46.6, -14.9))
				UseAbility(Abilities.Diamond, {})
				task.wait(.3)
				OrionLib:MakeNotification({
					Name = "Warning",
					Content = "Now all you want to do is wait... for 10 hours...",
					Time = 6
				})
				OogClockMaxTimer = 36000
				ClockToggle:Set(true)
			elseif MultiBadge == "Fish + Voodoo" then
				if game.PrivateServerOwnerId ~= 0 then
					OrionLib:MakeNotification({
						Name = "Warning",
						Content = "You can't obtain Voodoo and Fish in Private Server.",
						Time = 6
					})
					mbft:Set(false)
					return
				end
				EquipGlove("Ghost")
				task.wait(.1)
				UseAbility(Abilities.Ghost, {})
				task.wait(.1)
				EquipGlove("ZZZZZZZ")
				TeleportToCFrame(17898, 71, -2650)
				task.wait(1)
				UseAbility(Abilities.ZZZZZZZ, {})
				task.wait(.1)
				OrionLib:MakeNotification({
					Name = "Warning",
					Content = "Have a nice grind. 1 hour timer started.",
					Time = 6
				})
				OogClockMaxTimer = 3600
				ClockToggle:Set(true)
			elseif MultiBadge == "Voodoo + Trap" then
				if game.PrivateServerOwnerId ~= 0 then
					OrionLib:MakeNotification({
						Name = "Warning",
						Content = "You can't obtain Voodoo and Trap in Private Server.",
						Time = 6
					})
					mbft:Set(false)
					return
				end
				EquipGlove("Ghost")
				task.wait(.1)
				UseAbility(Abilities.Ghost, {})
				task.wait(.1)
				EquipGlove("Brick")
				task.wait(.1)
				EnterArena()
				task.wait(1)
				TeleportToCFrame(17898, 71, -2650)
				OrionLib:MakeNotification({
					Name = "Warning",
					Content = "Trap is faster than Voodoo, then when you get the Trap Glove, just wait until you get the Voodoo Glove",
					Time = 15
				})
				OogClockMaxTimer = 3600
				ClockToggle:Set(true)
				repeat task.wait(1)
					UseAbility(Abilities.Brick, {})
				until CheckBadge(Badges["Brick Master"])
				task.wait(10)
				OrionLib:MakeNotification({
					Name = "Warning",
					Content = "And... I'm too lazy to make a brick spawn count, so just wait until you get it.\n:)",
					Time = 15
				})
			end
		end
	end
})

local MastTab = Window:MakeTab({
	Name = "Mastery",
	Icon = "rbxassetid://10709753149",
	PremiumOnly = false
})

MastTab:AddParagraph("W.I.P", "This Tab is not ready yet.\nMaybe I'll be fixing some stuff before adding new ones.")

MastTab:AddParagraph("Read this!", "If the toggle color is green, it means it's an setting for the toggle above it.\nIt works like a condition while doing it's function.")

MastTab:AddParagraph("Another warning", "Don't even try to use two 'Auto' toggles twice if it both uses the ability, it will kick you for spamming abilities too fast.")

MastTab:AddSection({
	Name = "Brick",
})

local bricksnipe = false

MastTab:AddToggle({
	Name = "Auto Trip People",
	Default = false,
	Callback = function(Value)
		
		if bricksnipe then
			
		end
	end,
})

MastTab:AddToggle({
	Name = "Snipe People",
	Default = false,
	Color = Color3.fromRGB(0, 255, 0),
	Callback = function(Value)
		bricksnipe = Value
	end,
})

MastTab:AddButton({
	Name = "Fling a Brick crazily",
	Callback = function()
		
	end,
})

MastTab:AddSection({
	Name = "Killstreak",
})

MastTab:AddSection({
	Name = "Wormhole",
})

MastTab:AddSection({
	Name = "Cloud",
})

MastTab:AddSection({
	Name = "Ultra Instinct",
})

MastTab:AddSection({
	Name = "Obby",
})

MastTab:AddSection({
	Name = "Run",
})

MastTab:AddSection({
	Name = "Glovel",
})

MastTab:AddSection({
	Name = "[REDACTED]",
})

MastTab:AddSection({
	Name = "bus",
})

MastTab:AddSection({
	Name = "🗿",
})

MastTab:AddSection({
	Name = "Bomb",
})

MastTab:AddSection({
	Name = "rob",
})

MastTab:AddToggle({
	Name = "Auto make portal if bob spawned",
	Default = false,
	Callback = function(Value)
		
	end,
})

MastTab:AddToggle({
	Name = "Auto travel 25,000 studs",
	Default = false,
	Callback = function(Value)
		
	end,
})

MastTab:AddToggle({
	Name = "Auto absorb people",
	Default = false,
	Callback = function(Value)
		
	end,
})

MastTab:AddSection({
	Name = "Fort",
})

MastTab:AddButton({
	Name = "Auto place walls",
	Callback = function(Value)
		
	end,
})

MastTab:AddSection({
	Name = "Engineer",
})

MastTab:AddButton({
	Name = "Auto place sentries",
	Callback = function(Value)
		
	end,
})

MastTab:AddSection({
	Name = "Flash",
})

local nil1 = false

MastTab:AddButton({
	Name = "Auto teleport farming",
	Callback = function(Value)
		
		if nil1 then
			
		end
	end,
})

MastTab:AddButton({
	Name = "Auto ambush people while teleporting",
	Color = Color3.fromRGB(0, 255, 0),
	Default = false,
	Callback = function(Value)
		nil1 = Value
	end,
})

MastTab:AddSection({
	Name = "Booster",
})

MastTab:AddSection({
	Name = "Space",
})

MastTab:AddSection({
	Name = "Shard",
})

MastTab:AddSection({
	Name = "Phase",
})

MastTab:AddSection({
	Name = "Hive",
})

MastTab:AddSection({
	Name = "Tycoon",
})

MastTab:AddSection({
	Name = "Defense",
})

MastTab:AddSection({
	Name = "Car Keys",
})

MastTab:AddSection({
	Name = "Voodoo",
})

MastTab:AddSection({
	Name = "Cherry",
})

MastTab:AddSection({
	Name = "BONK",
})

MastTab:AddSection({
	Name = "Chain",
})

MastTab:AddSection({
	Name = "Moon",
})

MastTab:AddSection({
	Name = "Stalker",
})

MastTab:AddSection({
	Name = "Rage",
})

MastTab:AddSection({
	Name = "Tinkerer",
})

MastTab:AddSection({
	Name = "Plank",
})

MastTab:AddSection({
	Name = "Bubble",
})

MastTab:AddSection({
	Name = "Phantom",
})

MastTab:AddSection({
	Name = "Acrobat",
})

MastTab:AddSection({
	Name = "Spring",
})

MastTab:AddSection({
	Name = "Soul",
})

MastTab:AddSection({
	Name = "Thanos",
})

MastTab:AddSection({
	Name = "Eggler",
})

local _general_iamegg = false
local _eggler_uneggwithviolence = false

MastTab:AddToggle({
	Name = "Auto kill players",
	Default = false,
	Callback = function(Value)
		
	end,
})

MastTab:AddToggle({
	Name = "Auto Slap and become a egg",
	Default = false,
	Callback = function(Value)
		while Value do
			if not Value then
				break
			end
			
			if InArena(plr) and plr.Character then
				local char = plr.Character
				local charRoot = char:FindFirstChild("HumanoidRootPart")
				
				_general_iamegg = char:GetAttribute("isEgg")
				
				if not _general_iamegg then
					TeleportToCFrame(17898, 71, -2650)
					task.wait(1)
					for i, v in ipairs(Players:GetPlayers()) do
						if InArena(v) and v.Character and not v.Character:GetAttribute("zzz") then
							local enemy = v.Character
							local enemyRoot = enemy:FindFirstChild("HumanoidRootPart")
							if charRoot and enemyRoot then
								charRoot.CFrame = enemyRoot.CFrame * CFrame.new(0, 4, 0)
								task.wait(.2)
								Slap(v)
								TeleportToCFrame(17898, 71, -2650)
								task.wait(.1)
								UseAbility(Abilities.Eggler["I Am Egg"], {})
								
								if _eggler_uneggwithviolence then
									task.wait(.5)
									if char:GetAttribute("isEgg") then
										UseAbility(Abilities.Eggler["I Am Egg"], {})
										
										for _, v2 in ipairs(Players:GetPlayers()) do
											if InArena(v2) and v2.Character and not v2.Character:GetAttribute("zzz") then
												local enemy = v2.Character
												local enemyRoot = enemy:FindFirstChild("HumanoidRootPart")
												if enemyRoot then
													Slap(v2)
													task.wait(.1)
													TeleportToCFrame(17898, 71, -2650)
												end
											end
										end
									end
								else
									continue
								end
							end
						end
					end
				else
					TeleportToCFrame(17898, 71, -2650)
					task.wait(.1)
					UseAbility(Abilities.Eggler["I Am Egg"], {})
					continue
				end
			end
			
			task.wait(3)
		end
	end,
})

MastTab:AddButton({
	Name = "Unegg with violence",
	Color = Color3.fromRGB(0, 255, 0),
	Default = false,
	Callback = function(Value)
		_eggler_uneggwithviolence = Value
	end,
})

MastTab:AddSection({
	Name = "Hexa",
})

MastTab:AddSection({
	Name = "Frostbite",
})

MastTab:AddSection({
	Name = "Mace",
})

MastTab:AddSection({
	Name = "Dice",
})

MastTab:AddSection({
	Name = "Gummy",
})

MastTab:AddSection({
	Name = "Stick (You're crazy)",
})

MastTab:AddParagraph("Atention", "Stick gives no gain for Slap. Basically you're selling your soul for to poke 99,999 players and gain 0 Slaps on total.\n💀")

local NotTab = Window:MakeTab({
	Name = "Notify",
	Icon = "rbxassetid://10709753149",
	PremiumOnly = false
})

NotTab:AddSection({
	Name = "Notify if Orb spawned",
})

task.spawn(function()
local porbt
local jorbt
local gorbt
local sorbt
local morbt

porbt = NotTab:AddToggle({
	Name = "Notify if Phase Orb spawned",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			if workspace:FindFirstChild("Phase Orb") then
				OrionLib:MakeNotification({
					Name = "Orb Spawned",
					Content = "Phase Orb Spawned.\n[Toggled off]",
					Time = 10
				})
				porbt:Set(false)
				break
			end
		end
	end
})

jorbt = NotTab:AddToggle({
	Name = "Notify if Jet Orb spawned",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			if workspace:FindFirstChild("Jet Orb") then
				OrionLib:MakeNotification({
					Name = "Orb Spawned",
					Content = "Jet Orb Spawned.\n[Toggled off]",
					Time = 10
				})
				jorbt:Set(false)
				break
			end
		end
	end
})

gorbt = NotTab:AddToggle({
	Name = "Notify if Glitch Orb spawned",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			if workspace:FindFirstChild("Glitch Orb") then
				OrionLib:MakeNotification({
					Name = "Orb Spawned",
					Content = "Glitch Orb Spawned.\n[Toggled off]",
					Time = 10
				})
				gorbt:Set(false)
				break
			end
		end
	end
})

sorbt = NotTab:AddToggle({
	Name = "Notify if Siphon Orb spawned",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			if workspace:FindFirstChild("SiphonOrb") then
				OrionLib:MakeNotification({
					Name = "Orb Spawned",
					Content = "Siphon Orb Spawned.\n[Toggled off]",
					Time = 10
				})
				sorbt:Set(false)
				break
			end
		end
	end
})

morbt = NotTab:AddToggle({
	Name = "Notify if MATERIALIZE Orb spawned",
	Default = false,
	Callback = function(Toggled)
		while Toggled do
			wait()
			if not Toggled then
				break
			end
			
			if workspace:FindFirstChild("MATERIALIZE Orb") then
				OrionLib:MakeNotification({
					Name = "Orb Spawned",
					Content = "MATERIALIZE Orb Spawned.\n[Toggled off]",
					Time = 10
				})
				morbt:Set(false)
				break
			end
		end
	end
})
end)

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
	local fps = math.floor(1 / deltaTime)
	PlayerFPSLabel:Set("FPS: " .. fps)

	PlayerAccountAgeLabel:Set("Q:'How old is your account in days?'\nA: " .. plr.AccountAge)
	PlayerSlapsLabel:Set("Q:'How many slaps do you have?'\nA: ".. tostring(GetSlaps()))
	PlayerChatColorLabel:Set("Q:'What color is your name in the Roblox Chat?'\nA: idk silly billy")
	
	PlayerTimePlayingLabel:Set("Time playing: " .. math.floor(workspace.DistributedGameTime / 60 / 60) .. "h " .. math.floor(workspace.DistributedGameTime / 60) .. "m " .. math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60) .. "s")
	PlayersInServerLabel:Set("Players in server: " .. #Players:GetPlayers() .. "/".. Players.MaxPlayers)
	EludeKeypadCodeLabel:Set("Elude Keypad Code: " .. tostring((#Players:GetPlayers()) * 25 + 1100 - 7))
	
	if workspace:FindFirstChild("Keypad") then
		KeypadSpawnedLabel:Set("Is Elude Keypad Spawned: ✅")
	else
		KeypadSpawnedLabel:Set("Is Elude Keypad Spawned: ❌")
	end
	
	if workspace:FindFirstChild("Phase Orb") then
		PhaseSpawnedLabel:Set("Is Phase Orb Spawned: ✅")
	else
		PhaseSpawnedLabel:Set("Is Phase Orb Spawned: ❌")
	end
	
	if workspace:FindFirstChild("Jet Orb") then
		JetSpawnedLabel:Set("Is Jet Orb Spawned: ✅")
	else
		JetSpawnedLabel:Set("Is Jet Orb Spawned: ❌")
	end
	
	if workspace:FindFirstChild("Glitch Orb") then
		GlitchSpawnedLabel:Set("Is Glitch Orb Spawned: ✅")
	else
		GlitchSpawnedLabel:Set("Is Glitch Orb Spawned: ❌")
	end
	
	if workspace:FindFirstChild("SiphonOrb") then
		SiphonSpawnedLabel:Set("Is Siphon Orb Spawned: ✅")
	else
		SiphonSpawnedLabel:Set("Is Siphon Orb Spawned: ❌")
	end
	
	if workspace:FindFirstChild("MATERIALIZE Orb") then
		MATERIALIZESpawnedLabel:Set("Is MATERIALIZE Orb Spawned: ✅")
	else
		MATERIALIZESpawnedLabel:Set("Is MATERIALIZE Orb Spawned: ❌")
	end
	
	if workspace:FindFirstChild("Toolbox") then
		ToolboxSpawnedLabel:Set("Is Toolbox Spawned: ✅")
	else
		ToolboxSpawnedLabel:Set("Is Toolbox Spawned: ❌")
	end
	
	if tonumber(string.match(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, "%d+")) == 1 then
		ServerAgeLabel:Set("Server Age: " .. tonumber(string.match(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, "%d+")) .. " Minute")
	elseif tonumber(string.match(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, "%d+")) > 1 then
		ServerAgeLabel:Set("Server Age: " .. tonumber(string.match(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, "%d+")) .. " Minutes")
	elseif tonumber(string.match(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, "%d+")) == 0 then
		ServerAgeLabel:Set("Server Age: 0")
	end
	
	if not RunService:isStudio() then
		PlayerPingLabel:Set("Ping: " .. math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms")
	end
end)

elseif game.PlaceId == 102908326578005 then
print("this is so oog")

local endpos = CFrame.new(25.2893658, 4.0552721, -1.78487551, 0.0116091063, -1.44808983e-08, -0.999932587, 1.19220802e-08, 1, -1.43434598e-08, 0.999932587, -1.17547616e-08, 0.0116091063)

local bballs = workspace:WaitForChild("Furniture"):FindFirstChild("jorgisBasketballs")
local dresser = workspace:WaitForChild("Furniture"):FindFirstChild("jorgisDresser")

if not fireclickdetector then
	warn("Missing fireclickdetector")
	return
end

CensorUI()

wait(.2)

char:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 0

for i, v in pairs(bballs:GetDescendants()) do
	if v:IsA("ClickDetector") then
		fireclickdetector(v)
	end
end

wait(1)

for i, v in pairs(dresser:GetDescendants()) do
	if v:IsA("ClickDetector") then
		fireclickdetector(v)
	end
end

wait(.3)

if char:FindFirstChildWhichIsA("Tool") then
	char:FindFirstChild("HumanoidRootPart").CFrame = endpos
end
elseif game.PlaceId == 89837553336708 then
	local glove = workspace["plunger glove"]

	CensorUI()

	if not fireclickdetector then
		warn("Missing fireclickdetector")
		return
	end
		
	if glove then
		if glove:FindFirstChildWhichIsA("ClickDetector") then
			fireclickdetector(glove:FindFirstChildWhichIsA("ClickDetector"))
		end
	end
end

local TeleportCheck = false

plr.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport and State ~= Enum.TeleportState.Failed then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/YourDailyTroubleNGGHide/idk/refs/heads/main/skidded'))()")
	end
end)
