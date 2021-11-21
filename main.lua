
--https://github.com/Mokiros/roblox-FE-compatibility
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.Character

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
	local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
	FakeMouse.keyUp = FakeMouse.KeyUp
	FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)

	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game

	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
					and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
		},"RunService")
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end

local plr = owner
local dbc = false

Part2 = Instance.new("Part")
SpecialMesh3 = Instance.new("SpecialMesh")
Sound4 = Instance.new("Sound")
Part2.Name = "Handle"
Part2.Parent = plr.Character
Part2.Size = Vector3.new(3.2000000476837, 1.6000000238419, 1.2000000476837)
Part2.BottomSurface = Enum.SurfaceType.Smooth
Part2.CanCollide = false
Part2.TopSurface = Enum.SurfaceType.Smooth
Part2.FormFactor = Enum.FormFactor.Custom
Part2.formFactor = Enum.FormFactor.Custom
SpecialMesh3.Parent = Part2
SpecialMesh3.MeshId = "http://www.roblox.com/asset/?id=212302951  "
SpecialMesh3.Scale = Vector3.new(4, 4, 4)
SpecialMesh3.TextureId = "http://www.roblox.com/asset/?id=212303049  "
SpecialMesh3.MeshType = Enum.MeshType.FileMesh
Sound4.Parent = Part2
Sound4.Looped = true
Sound4.EmitterSize = 0
Sound4.MinDistance = 0
Sound4.Volume = 1
Weld = Instance.new("Weld")
Weld.Parent = plr.Character["Right Arm"]
Weld.Part0 = plr.Character["Right Arm"]
Weld.Part1 = Part2
Weld.C0 = CFrame.new(0,-0.75,1) * CFrame.Angles(0,math.rad(-90),math.rad(90))
Weld2 = Instance.new("Weld")
Weld2.Parent = plr.Character.Torso
Weld2.Part0 = plr.Character.Torso
Weld2.Part1 = plr.Character["Right Arm"]
Weld2.C0 = plr.Character.Torso["Right Shoulder"].C0 * CFrame.Angles(0,0,math.rad(90))
Weld2.C1 = plr.Character.Torso["Right Shoulder"].C1

ScreenGui0 = Instance.new("ScreenGui")
TextBox1 = Instance.new("TextBox")
TextButton2 = Instance.new("TextButton")
ScreenGui0.Name = "BoomBoxMain"
ScreenGui0.Parent = plr.PlayerGui
ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextBox1.Name = "Id"
TextBox1.Parent = ScreenGui0
TextBox1.Position = UDim2.new(0.672558904, 0, 0.97116971, 0)
TextBox1.Size = UDim2.new(0, 591, 0, 35)
TextBox1.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox1.BackgroundColor = BrickColor.new("Medium brown")
TextBox1.BackgroundColor3 = Color3.new(0.243137, 0.243137, 0.243137)
TextBox1.BackgroundTransparency = 0.5
TextBox1.BorderSizePixel = 0
TextBox1.Font = Enum.Font.SourceSans
TextBox1.FontSize = Enum.FontSize.Size14
TextBox1.Text = ""
TextBox1.TextColor = BrickColor.new("Institutional white")
TextBox1.TextColor3 = Color3.new(1, 1, 1)
TextBox1.TextScaled = true
TextBox1.TextSize = 14
TextBox1.TextStrokeTransparency = 0
TextBox1.TextWrap = true
TextBox1.TextWrapped = true
TextBox1.PlaceholderText = "Put your sounds id here"
TextButton2.Name = "Play"
TextButton2.Parent = ScreenGui0
TextButton2.Position = UDim2.new(0.94760102, 0, 0.97116971, 0)
TextButton2.Size = UDim2.new(0, 124, 0, 35)
TextButton2.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton2.BackgroundColor = BrickColor.new("Lime green")
TextButton2.BackgroundColor3 = Color3.new(0, 1, 0)
TextButton2.BorderSizePixel = 0
TextButton2.Font = Enum.Font.SourceSans
TextButton2.FontSize = Enum.FontSize.Size14
TextButton2.Text = "PLAY"
TextButton2.TextColor = BrickColor.new("Institutional white")
TextButton2.TextColor3 = Color3.new(1, 1, 1)
TextButton2.TextScaled = true
TextButton2.TextSize = 14
TextButton2.TextStrokeTransparency = 0
TextButton2.TextWrap = true
TextButton2.TextWrapped = true

TextButton2.MouseButton1Click:Connect(function()
	if dbc == false then
		dbc = true
		Sound4.SoundId = "rbxassetid://" .. TextBox1.Text
		Sound4:Play()
		task.wait(1)
		dbc = false
	end
end)
