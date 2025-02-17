-- Initialization --
local Timer = os.clock()

-- Services --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")

-- Variables --
local Loaded = nil
local Load_Style = nil
local Mouse = Players.LocalPlayer:GetMouse()

-- Data Settings --
local Default = {
    Keybind = "RightControl",
    Theme = "Light",
    Overrides = {}
}

local Success, Setting = pcall(function()
    return HttpService:JSONDecode(readfile("MaterialSetting.json"))
end)

if not Success then
    Setting = Default

    writefile("MaterialSetting.json", HttpService:JSONEncode(Setting))
end

-- Library --
local Themes = {
	Light = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(124, 37, 255),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(124, 37, 255),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(124, 37, 255),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(124, 37, 255),
		Content = Color3.fromRGB(124, 37, 255),
		Button = Color3.fromRGB(124, 37, 255),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(124, 37, 255),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(124, 37, 255),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(124, 37, 255),
		Toggle = Color3.fromRGB(124, 37, 255),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(124, 37, 255),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(124, 37, 255),
		TextField = Color3.fromRGB(124, 37, 255),
		TextFieldAccent = Color3.fromRGB(124, 37, 255),
	},
	Dark = {
		MainFrame = Color3.fromRGB(25, 25, 25),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(55, 55, 55),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(235, 235, 235),
		TitleBar = Color3.fromRGB(55, 55, 55),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(15, 15, 15),
		Banner = Color3.fromRGB(55, 55, 55),
		BannerAccent = Color3.fromRGB(255, 255, 255),
		Content = Color3.fromRGB(85, 85, 85),
		Button = Color3.fromRGB(85, 85, 85),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(235, 235, 235),
		ChipSetAccent = Color3.fromRGB(85, 85, 85),
		DataTable = Color3.fromRGB(235, 235, 235),
		DataTableAccent = Color3.fromRGB(85, 85, 85),
		Slider = Color3.fromRGB(85, 85, 85),
		SliderAccent = Color3.fromRGB(235, 235, 235),
		Toggle = Color3.fromRGB(205, 205, 205),
		ToggleAccent = Color3.fromRGB(125, 125, 125),
		Dropdown = Color3.fromRGB(85, 85, 85),
		DropdownAccent = Color3.fromRGB(235, 235, 235),
		ColorPicker = Color3.fromRGB(85, 85, 85),
		ColorPickerAccent = Color3.fromRGB(235, 235, 235),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255),
	},
	Mocha = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		Maximise = Color3.fromRGB(189, 183, 177),
		MaximiseAccent = Color3.fromRGB(189, 183, 177),
		NavBar = Color3.fromRGB(176, 148, 125),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(176, 148, 125),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(176, 148, 125),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(176, 148, 125),
		Content = Color3.fromRGB(176, 148, 125),
		Button = Color3.fromRGB(176, 148, 125),
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(176, 148, 125),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(176, 148, 125),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(176, 148, 125),
		Toggle = Color3.fromRGB(176, 148, 125),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(176, 148, 125),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(176, 148, 125),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Aqua = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(116, 112, 140),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(116, 112, 140),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(116, 112, 140),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(116, 112, 140),
		Content = Color3.fromRGB(116, 112, 140),
		Button = Color3.fromRGB(116, 112, 140),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(116, 112, 140),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(116, 112, 140),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(116, 112, 140),
		Toggle = Color3.fromRGB(116, 112, 140),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(116, 112, 140),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(116, 112, 140),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Jester = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(219, 68, 103),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(219, 68, 103),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(219, 68, 103),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(219, 68, 103),
		Content = Color3.fromRGB(219, 68, 103),
		Button = Color3.fromRGB(219, 68, 103),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(219, 68, 103),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(219, 68, 103),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(219, 68, 103),
		Toggle = Color3.fromRGB(219, 68, 103),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(219, 68, 103),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(219, 68, 103),
		TextField = Color3.fromRGB(219, 68, 103),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Github = {
		MainFrame = Color3.fromRGB(51, 3, 0),
		Minimise = Color3.fromRGB(189, 44, 0),
		MinimiseAccent = Color3.fromRGB(189, 44, 0),
		NavBar = Color3.fromRGB(55,55,55),
		NavBarAccent = Color3.fromRGB(255,255,255),
		NavBarInvert = Color3.fromRGB(235,235,235),
		TitleBar = Color3.fromRGB(116, 112, 140),
		TitleBarAccent = Color3.fromRGB(255,255,255),
		Overlay = Color3.fromRGB(116, 112, 140),
		Banner = Color3.fromRGB(255,255,255),
		BannerAccent = Color3.fromRGB(116, 112, 140),
		Content = Color3.fromRGB(116, 112, 140),
		Button = Color3.fromRGB(64, 120, 192),
		ButtonAccent = Color3.fromRGB(64, 120, 192),
		ChipSet = Color3.fromRGB(116, 112, 140),
		ChipSetAccent = Color3.fromRGB(255,255,255),
		DataTable = Color3.fromRGB(116, 112, 140),
		DataTableAccent = Color3.fromRGB(255,255,255),
		Slider = Color3.fromRGB(64, 120, 192),
		SliderAccent = Color3.fromRGB(64, 120, 192),
		Toggle = Color3.fromRGB(64, 120, 192),
		ToggleAccent = Color3.fromRGB(64, 120, 192),
		Dropdown = Color3.fromRGB(64, 120, 192),
		DropdownAccent = Color3.fromRGB(64, 120, 192),
		ColorPicker = Color3.fromRGB(64, 120, 192),
		ColorPickerAccent = Color3.fromRGB(64, 120, 192),
		TextField = Color3.fromRGB(245, 245, 245),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	}
}

local Types = {
	"RoundFrame",
	"Shadow",
	"Circle",
	"CircleButton",
	"Frame",
	"Label",
	"Button",
	"SmoothButton",
	"Box",
	"ScrollingFrame",
	"Menu",
	"NavBar"
}

local ActualTypes = {
	RoundFrame = "ImageLabel",
	Shadow = "ImageLabel",
	Circle = "ImageLabel",
	CircleButton = "ImageButton",
	Frame = "Frame",
	Label = "TextLabel",
	Button = "TextButton",
	SmoothButton = "ImageButton",
	Box = "TextBox",
	ScrollingFrame = "ScrollingFrame",
	Menu = "ImageButton",
	NavBar = "ImageButton"
}

local Properties = {
	RoundFrame = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 3, 297, 297),
		BorderSizePixel = 0
	},
	SmoothButton = {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 3, 297, 297),
		BorderSizePixel = 0
	},
	Shadow = {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554236805",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(23, 23, 277, 277),
		Position = UDim2.fromOffset(-15, -15),
		Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
		BorderSizePixel = 0
	},
	Circle = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670",
		BorderSizePixel = 0
	},
	CircleButton = {
        AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670",
		BorderSizePixel = 0
	},
	Frame = {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
	},
	Label = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5,0),
		Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	Button = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5, 0),
		Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	Box = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5, 0),
		Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	ScrollingFrame = {
		BackgroundTransparency = 1,
		ScrollBarThickness = 3,
		CanvasSize = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0
	},
	Menu = {
		Name = "More",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5555108481",
		Size = UDim2.fromOffset(20,20),
		Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25,10),
		BorderSizePixel = 0
	},
	NavBar = {
		Name = "SheetToggle",
		Image = "http://www.roblox.com/asset/?id=5576439039",
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(20,20),
		Position = UDim2.fromOffset(5,5),
		AutoButtonColor = false,
		BorderSizePixel = 0
	}
}

function FindType(String)
	for _, Type in next, Types do
		if Type:sub(1, #String):lower() == String:lower() then
			return Type
		end
	end

	return false
end

local Objects = {}

function Objects:New(Type)
	local TargetType = FindType(Type)

	if TargetType then
		local NewImage = Instance.new(ActualTypes[TargetType])

		if Properties[TargetType] then
			for Property, Value in next, Properties[TargetType] do
				NewImage[Property] = Value
			end
		end

		return NewImage
	else
		return Instance.new(Type)
	end
end

local function GetXY(GuiObject)
	local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)

    return Px / Max, Py / May
end

local function CircleAnim(GuiObject, EndColour, StartColour)
	local PositionX, PositionY = GetXY(GuiObject)
	local Circle = Objects:New("Circle")
	Circle.Size = UDim2.fromScale(0, 0)
	Circle.Position = UDim2.fromScale(PositionX, PositionY)
	Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
	Circle.ZIndex = 200
	Circle.Parent = GuiObject

	local Size = GuiObject.AbsoluteSize.X

	TweenService:Create(Circle, TweenInfo.new(1), {Position = UDim2.fromScale(PositionX, PositionY) - UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size, Size)}):Play()
	task.spawn(function()
		task.wait(2)
		Circle:Destroy()
	end)
end

local Material = {}

Material.Notification = loadstring(game:HttpGet("https://gist.githubusercontent.com/neonixran/b7440636611ae716ac6dade5c18485b6/raw/62aaea0b00f5d3ede4e771921cdb39c4cab7510e/Notification.lua", "Notification UI"))().Notify

local Styles = {
	[1] = "Normal",
	[2] = "Invert",
	[3] = "Sheets"
}

local ThisTheme

local NavBar = {
	Normal = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
		NewNavBar.Position = UDim2.fromOffset(5, 35)
		NewNavBar.ImageColor3 = ThisTheme.NavBar
		NewNavBar.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBar
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBarAccent
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBarAccent
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBarAccent
			end)
		end)

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Horizontal
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Left
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Center
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0, 5)
		NavBarPadding.Parent = NavBarContent

		return NewNavBar, NavBarContent
	end,
	Invert = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
		NewNavBar.Position = UDim2.fromOffset(5, 35)
		NewNavBar.ImageColor3 = ThisTheme.NavBarAccent
		NewNavBar.ImageTransparency = 1
		NewNavBar.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBarInvert
		NavBarShadow.ImageTransparency = 1
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		TweenService:Create(NewNavBar, TweenInfo.new(1), {ImageTransparency = 0}):Play()
		TweenService:Create(NavBarShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBar
			end)
		end)

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Horizontal
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Left
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Center
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0, 5)
		NavBarPadding.Parent = NavBarContent

		return NewNavBar, NavBarContent
	end,
	Sheets = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.ClipsDescendants = true
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 30)
		NewNavBar.Position = UDim2.fromOffset(0, 30)
		NewNavBar.ImageColor3 = ThisTheme.NavBarAccent
		NewNavBar.ZIndex = 100

		local NavBarOverlay = Objects:New("SmoothButton")
		NavBarOverlay.Name = "Overlay"
		NavBarOverlay.BackgroundColor3 = ThisTheme.NavBar
		NavBarOverlay.ImageColor3 = ThisTheme.NavBar
		NavBarOverlay.BackgroundTransparency = 1
		NavBarOverlay.ImageTransparency = 1
		NavBarOverlay.Visible = false
		NavBarOverlay.Size = UDim2.fromScale(1,1) - UDim2.fromOffset(0,30)
		NavBarOverlay.Position = UDim2.fromOffset(0,30)
		NavBarOverlay.ZIndex = 75

		local NavBarMenu = Objects:New("NavBar")
		NavBarMenu.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBar
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		local Effect1, Effect2, Effect3 = Objects:New("Frame"), Objects:New("Frame"), Objects:New("Frame")

		Effect1.ZIndex = 100
		Effect2.ZIndex = 100
		Effect3.ZIndex = 100

		Effect1.BackgroundTransparency = 0
		Effect2.BackgroundTransparency = 0
		Effect3.BackgroundTransparency = 0

		Effect1.BackgroundColor3 = ThisTheme.NavBarAccent
		Effect2.BackgroundColor3 = ThisTheme.NavBarAccent
		Effect3.BackgroundColor3 = ThisTheme.NavBar

		Effect1.Size = UDim2.fromScale(1,0) + UDim2.fromOffset(0,5)
		Effect2.Size = UDim2.fromScale(0,1) + UDim2.fromOffset(5,0)
		Effect3.Size = UDim2.fromScale(0,1) + UDim2.fromOffset(1,0)

		Effect1.Position = UDim2.fromScale(0,0)
		Effect2.Position = UDim2.fromScale(1,0) - UDim2.fromOffset(5,0)
		Effect3.Position = UDim2.fromScale(1,0)

		Effect1.Parent = NewNavBar
		Effect2.Parent = NewNavBar
		Effect3.Parent = NewNavBar

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Vertical
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Top
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0,5)
		NavBarPadding.PaddingRight = UDim.new(0,5)
		NavBarPadding.PaddingTop = UDim.new(0,5)
		NavBarPadding.PaddingBottom = UDim.new(0,5)
		NavBarPadding.Parent = NavBarContent

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.Size = UDim2.fromScale(1,0) + UDim2.fromOffset(0,30)
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBar
			end)
		end)

		return NewNavBar, NavBarContent, NavBarMenu,  NavBarOverlay
	end
}

local MainGUI

function TryAddMenu(Object, Menu, ReturnTable)
	ReturnTable.Object = Object

	local Total = 0

	for _,Value in pairs(Menu) do
		Total += ((typeof(Value) == "function") and 1 or 0)
	end

	if Total > 0 then
		local MenuToggle = false

		local MenuButton = Objects:New("Menu")
		MenuButton.ImageTransparency = 1
		MenuButton.Parent = Object

		TweenService:Create(MenuButton, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

		local Size = Total * 30 + ((Total + 1) * 2)

		local MenuBuild = Objects:New("Round")
		MenuBuild.Name = "Menu"
		MenuBuild.ImageColor3 = ThisTheme.ButtonAccent
		MenuBuild.Size = UDim2.fromOffset(120, 0)
		MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
		MenuBuild.ZIndex = 100
		MenuBuild.ClipsDescendants = true
		MenuBuild.Parent = MainGUI

		MenuButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
		end)

		local MenuContent = Objects:New("Frame")
		MenuContent.Name = "Content"
		MenuContent.Parent = MenuBuild

		local MenuList = Objects:New("UIListLayout")
		MenuList.Padding = UDim.new(0, 2)
		MenuList.Parent = MenuContent

		local MenuPadding = Objects:New("UIPadding")
		MenuPadding.PaddingTop = UDim.new(0, 2)
		MenuPadding.PaddingRight = UDim.new(0, 2)
		MenuPadding.PaddingLeft = UDim.new(0, 2)
		MenuPadding.PaddingBottom = UDim.new(0, 2)
		MenuPadding.Parent = MenuContent

		MenuButton.MouseButton1Down:Connect(function()
			MenuToggle = not MenuToggle
			TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = MenuToggle and UDim2.fromOffset(120, Size) or UDim2.fromOffset(120, 0)}):Play()
		end)

        if Load_Style == 3 then
			if MainGUI:WaitForChild("MainFrame", 10) then
				MainGUI.MainFrame.Overlay:GetPropertyChangedSignal("Visible"):Connect(function()
					if MainGUI.MainFrame.Overlay.Visible then
						TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = UDim2.fromOffset(120, 0)}):Play()
					end
				end)
			end
        end

		for Option, Value in pairs(Menu) do
			if typeof(Value) == "function" then
				local MenuLibrary = {}

				local MenuOption = Objects:New("SmoothButton")
				MenuOption.Name = "MenuOption"
				MenuOption.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				MenuOption.ImageColor3 = ThisTheme.Button
				MenuOption.ImageTransparency = 1
				MenuOption.ZIndex = 150
				MenuOption.Parent = MenuContent

				local OptionShadow = Objects:New("Shadow")
				OptionShadow.ImageColor3 = ThisTheme.Button
				OptionShadow.ImageTransparency = 1
				OptionShadow.Parent = MenuOption

				local OptionValue = Objects:New("Label")
				OptionValue.Name = "Value"
				OptionValue.Position = UDim2.fromScale(0, 0)
				OptionValue.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0)
				OptionValue.Text = Option
				OptionValue.TextColor3 = ThisTheme.Button
				OptionValue.Font = Enum.Font.Gotham
				OptionValue.TextSize = 12
				OptionValue.ZIndex = 150
				OptionValue.TextXAlignment = Enum.TextXAlignment.Right
				OptionValue.Parent = MenuOption

				MenuOption.MouseButton1Down:Connect(function()
					pcall(Value, ReturnTable, MenuLibrary)
					MenuToggle = false
					TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = UDim2.fromOffset(120,0)}):Play()
				end)

				MenuOption.MouseEnter:Connect(function()
					TweenService:Create(MenuOption, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
					TweenService:Create(OptionShadow, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
				end)

				MenuOption.MouseLeave:Connect(function()
					TweenService:Create(MenuOption, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
					TweenService:Create(OptionShadow, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
				end)

				function MenuLibrary:SetText(Text)
					OptionValue.Text = typeof(Text) == "string" and Text or OptionValue.Text
				end

				function MenuLibrary:GetText()
					return OptionValue.Text
				end
			end
		end

		return true, MenuButton
	end

	return false
end

function CreateNewButton(ButtonConfig, Parent)
	ButtonConfig = (typeof(ButtonConfig) == "table" and ButtonConfig) or {}

	local Button_Text = typeof(ButtonConfig.Text) == "string" and ButtonConfig.Text or "Button"
	local Button_XAlignment = typeof(ButtonConfig.XAlignment) == "string" and ButtonConfig.XAlignment ~= "Right" and ButtonConfig.XAlignment or "Left"
	local Button_RichText = typeof(ButtonConfig.RichText) == "boolean" and ButtonConfig.RichText or false
	local Button_TextColor = typeof(ButtonConfig.TextColor) == "Color3" and ButtonConfig.TextColor or ThisTheme.ButtonAccent
	local Button_Font = typeof(ButtonConfig.Font) == "EnumItem" and ButtonConfig.Font or Enum.Font.GothamSemibold
	local Button_Visible = typeof(ButtonConfig.Visible) ~= "boolean" and true or ButtonConfig.Visible
	local Button_Callback = typeof(ButtonConfig.Callback) == "function" and ButtonConfig.Callback or function() end

	local Button_Menu = typeof(ButtonConfig.Menu) == "table" and ButtonConfig.Menu or {}

	local ButtonLibrary = {}

	local Button = Objects:New("SmoothButton")
	Button.Name = "Button"
	Button.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
	Button.ImageColor3 = ThisTheme.Button
	Button.Visible = Button_Visible
	Button.ImageTransparency = 1
	Button.Parent = Parent

	local ButtonShadow = Objects:New("Shadow")
	ButtonShadow.ImageColor3 = ThisTheme.Button
	ButtonShadow.ImageTransparency = 1
	ButtonShadow.Parent = Button

	local ButtonLabel = Objects:New("Label")
	ButtonLabel.Text = Button_Text
	ButtonLabel.TextColor3 = Button_TextColor
	ButtonLabel.Font = Button_Font
	ButtonLabel.TextSize = 14
	ButtonLabel.TextXAlignment = Button_XAlignment
    ButtonLabel.RichText = Button_RichText
	ButtonLabel.ClipsDescendants = true
	ButtonLabel.TextTransparency = 1
	ButtonLabel.Parent = Button

	TweenService:Create(Button, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
	TweenService:Create(ButtonShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
	TweenService:Create(ButtonLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

	Button.MouseButton1Down:Connect(function()
		CircleAnim(ButtonLabel, ThisTheme.ButtonAccent, ThisTheme.Button)
		pcall(Button_Callback, ButtonLibrary)
	end)

	TryAddMenu(Button, Button_Menu, {
		SetText = function(Text)
			ButtonLabel.Text = (typeof(Text) ~= "string" and ButtonLabel.Text) or Text
		end,
		GetText = function()
			return ButtonLabel.Text
		end,
		SetAlignment = function(Alignment)
			ButtonLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ButtonLabel.TextXAlignment
		end,
		GetAlignment = function()
			return ButtonLabel.TextXAlignment.Name
		end,
		SetTextColor = function(TextColor)
			ButtonLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ButtonLabel.TextColor3
		end,
		GetTextColor = function()
			return ButtonLabel.TextColor3
		end,
		SetFont = function(Font)
			ButtonLabel.Font = typeof(Font) == "EnumItem" and Font or ButtonLabel.Font
		end,
		GetFont = function()
			return ButtonLabel.Font
		end,
		SetVisible = function(Visible)
			Button.Visible = typeof(Visible) ~= "boolean" and ButtonLabel.Visible or Visible
		end,
		GetVisible = function()
			return Button.Visible
		end
	})

	return Button, ButtonLabel
end

function Material:Load(Config)
	Load_Style = typeof(Config.Style) == "number" and (Config.Style and math.clamp(Config.Style, 1, 3)) or 3

	local Load_Title = typeof(Config.Title) == "string" and Config.Title or "Getting Started"
	local Load_XAlignment = typeof(Config.XAlignment) == "string" and Config.XAlignment ~= "Right" and Config.XAlignment or "Left"
	local Load_RichText = typeof(Config.RichText) == "boolean" and Config.RichText or false
	local Load_UI = typeof(Config.UI) == "table" and Config.UI or {
        CheckName = false,
        DestroyOthers = true
    }
	local Load_Font = typeof(Config.Font) == "EnumItem" and Config.Font or Enum.Font.GothamSemibold
	local Load_SizeX = typeof(Config.SizeX) == "number" and Config.SizeX or 255
	local Load_SizeY = typeof(Config.SizeY) == "number" and Config.SizeY or 350
    local Load_Position = typeof(Config.Position) == "string" and Config.Position or "Center"
	local Load_Theme = typeof(Config.Theme) == "string" and Config.Theme or Setting.Theme
	local Load_Overrides = typeof(Config.Overrides) == "table" and Config.Overrides or Setting.Overrides

	local Load_Menu = typeof(Config.Menu) == "table" and Config.Menu or {}

    Load_Theme = Themes[Load_Theme]
	ThisTheme = Load_Theme

    for KeyOverride, ValueOverride in next, Load_Overrides do
		ThisTheme[KeyOverride] = ValueOverride
	end

	local Load_TextColor = typeof(Config.TextColor) == "Color3" and Config.TextColor or ThisTheme.TitleBarAccent

	pcall(function()
        if Load_UI.CheckName and OldInstance.Name == Load_Title or Load_UI.DestroyOthers then
			OldInstance:Destroy()
        end
	end)

	local NewInstance = Objects:New("ScreenGui")
	NewInstance.Name = Load_Title

    if not is_sirhurt_closure and syn and syn.protect_gui then
        syn.protect_gui(NewInstance)
        NewInstance.Parent = CoreGui
    elseif gethui then
        NewInstance.Parent = gethui()
    else
        NewInstance.Parent = CoreGui
    end

	getgenv().OldInstance = NewInstance

	MainGUI = NewInstance

    local MainFrame = Objects:New("Round")
	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Load_Position == "Top-Left" and Vector2.new(0, 0) or Load_Position == "Left" and Vector2.new(0, 0.5) or Load_Position == "Center" and Vector2.new(0.5, 0.5) or Load_Position == "Top-Right" and Vector2.new(1, 0) or Load_Position == "Right" and Vector2.new(1, 0.5)
	MainFrame.Size = UDim2.fromOffset(0, Load_SizeY)
	MainFrame.Position = Load_Position == "Top-Left" and UDim2.fromOffset(5, 0) or Load_Position == "Left" and UDim2.new(0, 5, 0.555, 0) or Load_Position == "Center" and UDim2.fromScale(0.5, 0.5) or Load_Position == "Top-Right" and UDim2.fromScale(0.99, 0) or Load_Position == "Right" and UDim2.fromScale(0.99, 0.5)
	MainFrame.ImageColor3 = ThisTheme.MainFrame
	MainFrame.Parent = NewInstance

    TweenService:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.fromOffset(Load_SizeX, Load_SizeY)}):Play()

	task.wait(1)

    local MainShadow = Objects:New("Shadow")
	MainShadow.ImageColor3 = ThisTheme.MainFrame
	MainShadow.Parent = MainFrame

	local TitleBar = Objects:New("SmoothButton")
	TitleBar.Name = "TitleBar"
	TitleBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
	TitleBar.ImageColor3 = ThisTheme.TitleBar
	TitleBar.ImageTransparency = 1
	TitleBar.Parent = MainFrame

	local ExtraBar = Objects:New("Frame")
	ExtraBar.Name = "Hidden"
	ExtraBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 5)
	ExtraBar.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 5)
	ExtraBar.BackgroundColor3 = ThisTheme.TitleBar
	ExtraBar.Parent = TitleBar

	local TitleShadow = Objects:New("Shadow")
	TitleShadow.ImageColor3 = ThisTheme.TitleBar
	TitleShadow.ImageTransparency = 1
	TitleShadow.Parent = TitleBar

	local TitleText = Objects:New("Button")
	TitleText.Name = "Title"
	TitleText.Text = Load_Title
	TitleText.TextXAlignment = Load_XAlignment
    TitleText.RichText = Load_RichText
	TitleText.TextColor3 = Load_TextColor
	TitleText.TextTransparency = 1
	TitleText.Font = Load_Font
	TitleText.Parent = TitleBar

	TitleText.MouseButton1Down:Connect(function()
		local Mx, My = Mouse.X, Mouse.Y
		local MouseMove, MouseKill

		MouseMove = Mouse.Move:Connect(function()
			local nMx, nMy = Mouse.X, Mouse.Y
			local Dx, Dy = nMx - Mx, nMy - My

			MainFrame.Position = MainFrame.Position + UDim2.fromOffset(Dx, Dy)
			Mx, My = nMx, nMy
		end)

		MouseKill = UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				MouseMove:Disconnect()
				MouseKill:Disconnect()
			end
		end)
	end)

	local CloseButton = Objects:New("SmoothButton")
	CloseButton.Size = UDim2.fromOffset(20, 20)
	CloseButton.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-25, 5)
	CloseButton.ImageColor3 = ThisTheme.Close
	CloseButton.ImageTransparency = 1
	CloseButton.Parent = TitleBar

	local CloseShadow = Objects:New("Shadow")
	CloseShadow.ImageColor3 = ThisTheme.CloseAccent
	CloseShadow.ImageTransparency = 1
	CloseShadow.Parent = CloseButton

	CloseButton.MouseButton1Down:Connect(function()
		TweenService:Create(MainFrame, TweenInfo.new(0.95, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {Position = UDim2.new(0.5, MainFrame.Position.X.Offset, 2, MainFrame.Position.Y.Offset)}):Play()
		task.wait(0.95)
		NewInstance:Destroy()
	end)

    local Content = Objects:New("Round")
	Content.Name = "Content"
	Content.ImageColor3 = ThisTheme.Content
	Content.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 75)
	Content.Position = UDim2.fromOffset(5, 70)
	Content.ImageTransparency = 1
	Content.Parent = MainFrame

	local NavigationBar, NavigationBarContent, NavBarMenu, NavBarOverlay = NavBar[Styles[Load_Style]]()
	NavigationBar.Parent = MainFrame

	TweenService:Create(TitleBar, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(ExtraBar, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
	TweenService:Create(TitleShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(TitleText, TweenInfo.new(1), {TextTransparency = 0}):Play()
	TweenService:Create(CloseButton, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(CloseShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(Content, TweenInfo.new(1), {ImageTransparency = 0.8}):Play()

	task.wait(1)

    if NavBarMenu then
		TweenService:Create(TitleText, TweenInfo.new(0.5), {Size = TitleText.Size - UDim2.fromOffset(25, 0), Position = TitleText.Position + UDim2.fromOffset(25, 0)}):Play()
		TweenService:Create(Content, TweenInfo.new(0.5), {Size = Content.Size + UDim2.fromOffset(0, 35), Position = Content.Position - UDim2.fromOffset(0, 35)}):Play()

		NavBarMenu.ImageTransparency = 1
		NavBarMenu.Parent = TitleBar

		TweenService:Create(NavBarMenu, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

		NavBarOverlay.Parent = MainFrame

		local MenuToggle = false

		NavBarMenu.MouseButton1Down:Connect(function()
			MenuToggle = not MenuToggle

			TweenService:Create(NavigationBar, TweenInfo.new(0.15), {Size = (MenuToggle and UDim2.fromScale(0.5, 1) or UDim2.fromScale(0, 1)) - UDim2.fromOffset(0, 30)}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {ImageTransparency = (MenuToggle and 0.5) or 1}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {BackgroundTransparency = (MenuToggle and 0.5) or 1}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {Visible = (MenuToggle and true) or false}):Play()
			TweenService:Create(NavigationBar, TweenInfo.new(0.15), {ClipsDescendants = (MenuToggle and false) or true}):Play()
		end)
	end

    local TabCount = 0
	local TabLibrary = {}

	local ButtonTrack = {}
	local PageTrack = {}

    function TabLibrary:Banner(BannerConfig)
		local Banner_Text = typeof(BannerConfig.Text) == "string" and BannerConfig.Text or "Banner"
		local Banner_RichText = typeof(BannerConfig.RichText) == "boolean" and BannerConfig.RichText or false
		local Banner_TextColor = typeof(BannerConfig.TextColor) == "Color3" and BannerConfig.TextColor or ThisTheme.BannerAccent
		local Banner_Font = typeof(BannerConfig.Font) == "EnumItem" and BannerConfig.Font or Enum.Font.Gotham
		local Banner_Duration = (typeof(BannerConfig.Duration) == "number" and BannerConfig.Duration) or nil
		local Banner_Button = (typeof(BannerConfig.Button) == "string" and BannerConfig.Button) or "Close"
		local Banner_Options = (typeof(BannerConfig.Options) == "table" and BannerConfig.Options) or {}

        local BannerLibrary = {}

        local ExistingBanner, ExistingBannerOverlay = MainFrame:FindFirstChild("BannerOverlay"), MainFrame:FindFirstChild("Banner")

		if ExistingBanner then
			ExistingBanner:Destroy()
		end

		if ExistingBannerOverlay then
			ExistingBannerOverlay:Destroy()
		end

        local BannerOverlay = Objects:New("SmoothButton")
		BannerOverlay.Name = "BannerOverlay"
		BannerOverlay.BackgroundColor3 = ThisTheme.BannerAccent
		BannerOverlay.ImageColor3 = ThisTheme.BannerAccent
		BannerOverlay.ImageTransparency = 1
		BannerOverlay.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 30)
		BannerOverlay.Position = UDim2.fromOffset(0, 30)
		BannerOverlay.ZIndex = 75
		BannerOverlay.Visible = false
		BannerOverlay.Parent = MainFrame

        local Banner_TextSize = TextService:GetTextSize(Banner_Text, 12, Banner_Font, Vector2.new(0, 0)).X
        local Lines = math.ceil((Banner_TextSize) / (MainFrame.AbsoluteSize.X - 10))

        local Banner = Objects:New("Round")
		Banner.Name = "Banner"
		Banner.ImageTransparency = 1
		Banner.ImageColor3 = ThisTheme.Banner
		Banner.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, (Lines * 20) + 40)
		Banner.Position = UDim2.fromScale(0, 1) + UDim2.fromOffset(5, (-Lines * 20) - 45)
		Banner.ZIndex = 80
		Banner.Parent = MainFrame

        local BannerLabel = Objects:New("Label")
		BannerLabel.Name = "Value"
		BannerLabel.Text = Banner_Text
        BannerLabel.RichText = Banner_RichText
		BannerLabel.TextColor3 = Banner_TextColor
		BannerLabel.TextSize = 12
		BannerLabel.Font = Banner_Font
		BannerLabel.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, (Lines * 20) + 5)
		BannerLabel.TextWrapped = true
		BannerLabel.Position = UDim2.fromOffset(5, 0)
		BannerLabel.TextTransparency = 1
		BannerLabel.ZIndex = 80
		BannerLabel.Parent = Banner

        TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
		TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
		TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {Visible = true}):Play()
		TweenService:Create(Banner, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
		TweenService:Create(BannerLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

        local BannerContainer = Objects:New("Frame")
		BannerContainer.Name = "Options"
		BannerContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0)
		BannerContainer.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(-5, 35)
		BannerContainer.ZIndex = 80
		BannerContainer.ClipsDescendants = true
		BannerContainer.Parent = Banner

		local BannerList = Objects:New("UIListLayout")
		BannerList.FillDirection = Enum.FillDirection.Horizontal
		BannerList.HorizontalAlignment = Enum.HorizontalAlignment.Right
		BannerList.SortOrder = Enum.SortOrder.LayoutOrder
		BannerList.Padding = UDim.new(0, 5)
		BannerList.Parent = BannerContainer

		if Banner_Duration then
			task.delay(Banner_Duration, function()
				BannerLibrary:Close()
			end)
		else
			Banner_Options[Banner_Button] = function()
				BannerLibrary:Close()
			end

			for Option, Callback in pairs(Banner_Options) do
				if typeof(Callback) == "function" then
					local Option_TextSize = TextService:GetTextSize(Option, 12, Enum.Font.GothamBold, Vector2.new(0, 0)).X

					local OptionItem = Objects:New("SmoothButton")
					OptionItem.ImageColor3 = ThisTheme.BannerAccent
					OptionItem.ImageTransparency = 0.9
					OptionItem.Size = UDim2.fromOffset(Option_TextSize + 10, 30)
					OptionItem.ZIndex = 80
					OptionItem.ClipsDescendants = true
					OptionItem.Parent = BannerContainer

					local OptionLabel = Objects:New("Label")
					OptionLabel.Text = Option
					OptionLabel.TextSize = 12
					OptionLabel.TextColor3 = ThisTheme.BannerAccent
					OptionLabel.Font = Enum.Font.GothamBold
					OptionLabel.Size = UDim2.fromScale(1, 1)
					OptionLabel.Position = UDim2.fromScale(0, 0)
					OptionLabel.TextXAlignment = Enum.TextXAlignment.Center
					OptionLabel.ZIndex = 80
					OptionLabel.Parent = OptionItem

					OptionItem.MouseButton1Down:Connect(function()
						CircleAnim(OptionItem, ThisTheme.Banner)
						pcall(Callback, BannerLibrary)
					end)
				end
			end
		end

        TweenService:Create(BannerContainer, TweenInfo.new(0.5), {Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)}):Play()

        function BannerLibrary:SetText(Value)
			BannerLabel.Text = (typeof(Value) == "string" and Value) or BannerLabel.Text
        end

		function BannerLibrary:GetText()
            return BannerLabel.Text
        end

		function BannerLibrary:SetTextColor(TextColor)
			BannerLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or BannerLabel.TextColor3
		end

		function BannerLibrary:GetTextColor()
			return BannerLabel.TextColor3
		end

		function BannerLibrary:SetFont(Font)
			BannerLabel.Font = typeof(Font) == "EnumItem" and Font or BannerLabel.Font
		end

		function BannerLibrary:GetFont()
			return BannerLabel.Font
		end

        function BannerLibrary:Close()
            TweenService:Create(BannerContainer, TweenInfo.new(0.5), {Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0)}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {Visible = false}):Play()
			TweenService:Create(Banner, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
			TweenService:Create(BannerLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        end

        return BannerLibrary
    end

    function TabLibrary:New(TabConfig)
		local Tab_Title = typeof(TabConfig.Title) == "string" and TabConfig.Title or "Tab"
		local Tab_RichText = typeof(TabConfig.RichText) == "boolean" and TabConfig.RichText or false
		local Tab_TextColor = typeof(TabConfig.TextColor) == "Color3" and TabConfig.TextColor or Color3.fromRGB(255, 255, 255)
		local Tab_Font = typeof(TabConfig.Font) == "EnumItem" and TabConfig.Font or Enum.Font.GothamBold
		local Tab_Visible = typeof(TabConfig.Visible) ~= "boolean" and true or TabConfig.Visible
		local Tab_ImageID = (typeof(TabConfig.Image) == "number" and TabConfig.Image) or nil

        local Button
		local NewImage
        local Tab_Settings = {
            TextSize = 12,
            Font = Tab_Font,
            Vector = Vector2.new(0, 0)
        }

        local Tab_TextSize = TextService:GetTextSize(Tab_Title, Tab_Settings.TextSize, Tab_Settings.Font, Tab_Settings.Vector).X

        if Tab_ImageID then
            local FetchURL = ("rbxassetid://%s"):format(Tab_ImageID)
            local Image = (RunService:IsStudio() and "http://www.roblox.com/asset/?id=5472131383") or game:GetObjects(FetchURL)[1].Texture

            Button = Objects:New("Button")
            Button.Name = Tab_Title
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.TextSize = Tab_Settings.TextSize
            Button.Font = Tab_Font
            Button.Text = Tab_Title
			Button.TextColor3 = Tab_TextColor
			Button.Visible = Tab_Visible
            Button.RichText = Tab_RichText
            Button.Size = UDim2.fromScale(0, 1) + UDim2.fromOffset(0, (Tab_TextSize + 35))
            Button.ZIndex = 200
            Button.TextTransparency = 1

            NewImage = Objects:New(Button and "Round" or "SmoothButton")
            NewImage.Name = Tab_ImageID
            NewImage.BackgroundTransparency = 1
            NewImage.Size = UDim2.fromOffset(20, 20)
            NewImage.ScaleType = Enum.ScaleType.Stretch
            NewImage.Image = Image
            NewImage.ZIndex = 200
            NewImage.ImageTransparency = 1

            if Button then
                NewImage.Position = UDim2.fromScale(0, 0.5) - UDim2.fromOffset(0, 10)
                NewImage.Parent = Button
            else
                Button = NewImage
            end
        else
            Button = Objects:New("Button")
            Button.Name = Tab_Title
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.TextSize = Tab_Settings.TextSize
            Button.Font = Tab_Font
            Button.Text = Tab_Title
			Button.TextColor3 = Tab_TextColor
			Button.Visible = Tab_Visible
            Button.RichText = Tab_RichText
            Button.Size = UDim2.fromScale(0, 1) + UDim2.fromOffset((Tab_TextSize + 10), 0)
            Button.ZIndex = 200
            Button.TextTransparency = 1
        end

        Button.Parent = NavigationBarContent

        local PageContentFrame = Objects:New("Scroll")
		PageContentFrame.Name = Tab_Title or Tab_ImageID
		PageContentFrame.Visible = (TabCount == 0)
		PageContentFrame.ZIndex = 50
		PageContentFrame.BackgroundTransparency = 1
		PageContentFrame.BorderSizePixel = 0
		PageContentFrame.ScrollBarThickness = 3
		PageContentFrame.ScrollBarImageTransparency = 0.2
		PageContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
		PageContentFrame.Parent = Content

		table.insert(ButtonTrack, Button)
		table.insert(PageTrack, PageContentFrame)

		Button.MouseButton1Down:Connect(function()
			for _, Track in next, ButtonTrack do
				if not (Track == Button) then
					TweenService:Create(Track, TweenInfo.new(0.15), {TextTransparency = 0.5}):Play()

					pcall(function()
						TweenService:Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), {ImageTransparency = 0.5}):Play()
					end)
				else
					TweenService:Create(Track, TweenInfo.new(0.15), {TextTransparency = 0}):Play()

					pcall(function()
						TweenService:Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
					end)
				end
			end

			for _, Track in next, PageTrack do
				Track.Visible = (Track == PageContentFrame)
			end

			if Load_Style == 3 then
				NavigationBar.ClipsDescendants = true
				TweenService:Create(NavigationBar, TweenInfo.new(0.15), {Size = (UDim2.fromScale(0, 1)) - UDim2.fromOffset(0, 30)}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {Visible = false}):Play()
			end
		end)

        local PagePadding = Objects:New("UIPadding")
		PagePadding.PaddingLeft = UDim.new(0, 5)
		PagePadding.PaddingRight = UDim.new(0, 5)
		PagePadding.PaddingTop = UDim.new(0, 5)
		PagePadding.PaddingBottom = UDim.new(0, 5)
		PagePadding.Parent = PageContentFrame

		local PageList = Objects:New("UIListLayout")
		PageList.SortOrder = Enum.SortOrder.LayoutOrder
		PageList.Padding = UDim.new(0, 5)
		PageList.Parent = PageContentFrame

		PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			PageContentFrame.CanvasSize = UDim2.fromOffset(0, PageList.AbsoluteContentSize.Y + 10)
		end)

        TabCount += 1

        local OptionLibrary = {}

        function OptionLibrary:Separator(SeparatorConfig)
			SeparatorConfig = typeof(SeparatorConfig) == "table" and SeparatorConfig or {}

			local Separator_Visible = typeof(SeparatorConfig.Visible) ~= "boolean" and true or SeparatorConfig.Visible

			local SeparatorContainer = Objects:New("Round")
			SeparatorContainer.Name = "Separator"
			SeparatorContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 3)
			SeparatorContainer.ImageColor3 = ThisTheme.Button
			SeparatorContainer.Visible = Separator_Visible
			SeparatorContainer.Parent = PageContentFrame

            local SeparatorLibrary = {}

            function SeparatorLibrary:SetVisible(Visible)
                SeparatorContainer.Visible = typeof(Visible) ~= "boolean" and SeparatorContainer.Visible or Visible
            end

            function SeparatorLibrary:GetVisible()
                return SeparatorContainer.Visible
            end

			function SeparatorLibrary:Destroy()
				SeparatorContainer:Destroy()
			end

            return SeparatorLibrary
        end

        function OptionLibrary:Label(LabelConfig)
			LabelConfig = (typeof(LabelConfig) == "table" and LabelConfig) or {}

			local Label_Text = typeof(LabelConfig.Text) == "string" and LabelConfig.Text or "Button"
			local Label_XAlignment = typeof(LabelConfig.XAlignment) == "string" and LabelConfig.XAlignment ~= "Right" and LabelConfig.XAlignment or "Left"
			local Label_RichText = typeof(LabelConfig.RichText) == "boolean" and LabelConfig.RichText or false
			local Label_TextColor = typeof(LabelConfig.TextColor) == "Color3" and LabelConfig.TextColor or ThisTheme.ButtonAccent
			local Label_Font = typeof(LabelConfig.Font) == "EnumItem" and LabelConfig.Font or Enum.Font.GothamSemibold
			local Label_Visible = typeof(LabelConfig.Visible) ~= "boolean" and true or LabelConfig.Visible

			local Label_MouseEnter = typeof(LabelConfig.MouseEnter) == "function" and LabelConfig.MouseEnter or nil
			local Label_MouseLeave = typeof(LabelConfig.MouseLeave) == "function" and LabelConfig.MouseLeave or nil

			local Label_Menu = typeof(LabelConfig.Menu) == "table" and LabelConfig.Menu or {}

			local LabelLibrary = {}

            local LabelContainer = Objects:New("Round")
			LabelContainer.Name = "Label"
			LabelContainer.Visible = Label_Visible
			LabelContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
			LabelContainer.ImageColor3 = ThisTheme.Button
			LabelContainer.Parent = PageContentFrame

			local LabelContent = Objects:New("Label")
			LabelContent.TextColor3 = Label_TextColor
			LabelContent.Text = Label_Text
            LabelContent.RichText = Label_RichText
			LabelContent.TextSize = 12
			LabelContent.Font = Label_Font
			LabelContent.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-5, 0)
			LabelContent.Position = UDim2.fromOffset(5, 0)
			LabelContent.TextWrapped = true
			LabelContent.TextXAlignment = Enum.TextXAlignment[Label_XAlignment]
			LabelContent.TextYAlignment = Enum.TextYAlignment.Center
            LabelContent.Parent = LabelContainer

			if Label_MouseEnter then
				local Connection_Enter
				Connection_Enter = LabelContent.MouseEnter:Connect(function()
					pcall(Label_MouseEnter, LabelLibrary, Connection_Enter)
				end)
			end

			if Label_MouseLeave then
				local Connection_Leave
				Connection_Leave = LabelContent.MouseLeave:Connect(function()
					pcall(Label_MouseLeave, LabelLibrary, Connection_Leave)
				end)
			end

            TryAddMenu(LabelContainer, Label_Menu, {
				SetText = function(Text)
					LabelContent.Text = typeof(Text) == "string" and Text or LabelContent.Text
				end,
				GetText = function()
					return LabelContent.RichText and LabelContent.ContentText or LabelContent.Text
				end,
				SetAlignment = function(Alignment)
					LabelContent.TextXAlignment = typeof(Alignment) == "string" and Enum.TextXAlignment[Alignment] or LabelContent.TextXAlignment
				end,
				GetAlignment = function()
					return LabelContent.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					LabelContent.TextColor3 = typeof(TextColor) == "Color3" and TextColor or LabelContent.TextColor3
				end,
				GetTextColor = function()
					return LabelContent.TextColor3
				end,
				SetFont = function(Font)
					LabelContent.Font = typeof(Font) == "EnumItem" and Font or LabelContent.Font
				end,
				GetFont = function()
					return LabelContent.Font
				end,
				SetVisible = function(Visible)
					LabelContainer.Visible = typeof(Visible) ~= "boolean" and LabelContainer.Visible or Visible
				end,
				GetVisible = function()
					return LabelContainer.Visible
				end
			})

			function LabelLibrary:SetText(Text)
				LabelContent.Text = typeof(Text) == "string" and Text or LabelContent.Text
			end

			function LabelLibrary:GetText()
				return LabelContent.RichText and LabelContent.ContentText or LabelContent.Text
			end

			function LabelLibrary:SetAlignment(Alignment)
				LabelContent.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or LabelContent.TextXAlignment
			end

			function LabelLibrary:GetAlignment()
				return LabelContent.TextXAlignment.Name
			end

			function LabelLibrary:SetTextColor(TextColor)
				LabelContent.TextColor3 = typeof(TextColor) == "Color3" and TextColor or LabelContent.TextColor3
			end

			function LabelLibrary:GetTextColor()
				return LabelContent.TextColor3
			end

			function LabelLibrary:SetFont(Font)
				LabelContent.Font = typeof(Font) == "EnumItem" and Font or LabelContent.Font
			end

			function LabelLibrary:GetFont()
				return LabelContent.Font
			end

			function LabelLibrary:SetVisible(Visible)
				LabelContainer.Visible = typeof(Visible) ~= "boolean" and LabelContainer.Visible or Visible
			end

			function LabelLibrary:GetVisible()
				return LabelContainer.Visible
			end

			function LabelLibrary:Destroy()
				LabelContainer:Destroy()
			end

            return LabelLibrary
        end

        function OptionLibrary:Button(ButtonConfig)
            local NewButton, ButtonLabel, ButtonCallback = CreateNewButton(ButtonConfig, PageContentFrame)

			local ButtonLibrary = {}

			function ButtonLibrary:SetText(Text)
				ButtonLabel.Text = typeof(Text) == "string" and Text or ButtonLabel.Text
			end

			function ButtonLibrary:GetText()
				return ButtonLabel.RichText and ButtonLabel.ContentText or ButtonLabel.Text
			end

			function ButtonLibrary:SetAlignment(Alignment)
				ButtonLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ButtonLabel.TextXAlignment
			end

			function ButtonLibrary:GetAlignment()
				return ButtonLabel.TextXAlignment.Name
			end

		    function ButtonLibrary:SetTextColor(TextColor)
				ButtonLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ButtonLabel.TextColor3
			end

			function ButtonLibrary:GetTextColor()
				return ButtonLabel.TextColor3
			end

			function ButtonLibrary:SetFont(Font)
				ButtonLabel.Font = typeof(Font) == "EnumItem" and Font or ButtonLabel.Font
			end

			function ButtonLibrary:GetFont()
				return ButtonLabel.Font
			end

			function ButtonLibrary:SetVisible(Visible)
				NewButton.Visible = typeof(Visible) ~= "boolean" and NewButton.Visible or Visible
			end

			function ButtonLibrary:GetVisible()
				return NewButton.Visible
			end

			function ButtonLibrary:Click()
				pcall(ButtonCallback, ButtonLibrary)
			end

			function ButtonLibrary:Destroy()
				NewButton:Destroy()
			end

			return ButtonLibrary
        end

        function OptionLibrary:Toggle(ToggleConfig)
			ToggleConfig = typeof(ToggleConfig) == "table" and ToggleConfig or {}

			local Toggle_Text = typeof(ToggleConfig.Text) == "string" and ToggleConfig.Text or "Toggle"
			local Toggle_RichText = typeof(ToggleConfig.RichText) == "boolean" and ToggleConfig.RichText or false
            local Toggle_XAlignment = typeof(ToggleConfig.XAlignment) == "string" and ToggleConfig.XAlignment ~= "Right" and ToggleConfig.XAlignment or "Left"
			local Toggle_TextColor = typeof(ToggleConfig.TextColor) == "Color3" and ToggleConfig.TextColor or ThisTheme.Toggle
			local Toggle_Font = typeof(ToggleConfig.Font) == "EnumItem" and ToggleConfig.Font or Enum.Font.GothamSemibold
			local Toggle_Visible = typeof(ToggleConfig.Visible) ~= "boolean" and true or ToggleConfig.Visible
			local Toggle_Enabled = typeof(ToggleConfig.Enabled) == "boolean" and ToggleConfig.Enabled or false
			local Toggle_Disable = typeof(ToggleConfig.Disable) ~= "boolean" and true or ToggleConfig.Disable
			local Toggle_Callback = typeof(ToggleConfig.Callback) == "function" and ToggleConfig.Callback or function() end

			local Toggle_Menu = typeof(ToggleConfig.Menu) == "table" and ToggleConfig.Menu or {}

			local ToggleLibrary = {}

            local Toggle = Objects:New("SmoothButton")
			Toggle.Name = "Toggle"
			Toggle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			Toggle.ImageColor3 = ThisTheme.Toggle
			Toggle.ImageTransparency = 1
			Toggle.Visible = Toggle_Visible
			Toggle.Parent = PageContentFrame
			Toggle:SetAttribute("State", Toggle_Enabled)

			local ToggleTracker = Objects:New("Round")
			ToggleTracker.Name = "Tracker"
			ToggleTracker.Image = "rbxassetid://3570695787"
			ToggleTracker.SliceCenter = Rect.new(100, 100, 100, 100)
			ToggleTracker.SliceScale = 1
			ToggleTracker.Size = UDim2.fromOffset(26, 12)
			ToggleTracker.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(41, 6)
			ToggleTracker.ImageColor3 = ThisTheme.Toggle
			ToggleTracker.ImageTransparency = 1
			ToggleTracker.Parent = Toggle

            local Dot = Objects:New("Circle")
			Dot.Name = "Dot"
			Dot.Size = UDim2.fromOffset(16, 16)
			Dot.Position = UDim2.fromScale(0, 0.5) - UDim2.fromOffset(8, 8)
			Dot.ImageColor3 = ThisTheme.ToggleAccent
			Dot.ImageTransparency = 1
			Dot.Parent = ToggleTracker

			local DotShadow = Objects:New("Round")
			DotShadow.Name = "Shadow"
			DotShadow.Image = "http://www.roblox.com/asset/?id=5554831957"
			DotShadow.ScaleType = Enum.ScaleType.Stretch
			DotShadow.Size = UDim2.fromOffset(31, 31)
			DotShadow.Position = UDim2.fromOffset(-8, -8)
			DotShadow.ImageColor3 = ThisTheme.Toggle
			DotShadow.ImageTransparency = 1
			DotShadow.Parent = Dot

            local ToggleLabel = Objects:New("Label")
			ToggleLabel.Font = Toggle_Font
			ToggleLabel.TextSize = 14
			ToggleLabel.Text = Toggle_Text
            ToggleLabel.RichText = Toggle_RichText
            ToggleLabel.TextXAlignment = Enum.TextXAlignment[Toggle_XAlignment]
			ToggleLabel.TextColor3 = Toggle_TextColor
			ToggleLabel.TextTransparency = 1
			ToggleLabel.ClipsDescendants = true
			ToggleLabel.Parent = Toggle

            TweenService:Create(Toggle, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(ToggleTracker, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(Dot, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(DotShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ToggleLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

			TweenService:Create(Dot, TweenInfo.new(0.15), {Position = (Toggle_Enabled and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = Toggle_Enabled and ThisTheme.Toggle or ThisTheme.ToggleAccent}):Play()

            Toggle.MouseButton1Down:Connect(function()
				Toggle_Enabled = not Toggle_Enabled

				Toggle:SetAttribute("State", Toggle_Enabled)

				TweenService:Create(Dot, TweenInfo.new(0.15), {Position = (Toggle_Enabled and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = Toggle_Enabled and ThisTheme.Toggle or ThisTheme.ToggleAccent}):Play()
				CircleAnim(ToggleLabel, ThisTheme.ToggleAccent, ThisTheme.Toggle)
				pcall(Toggle_Callback, Toggle_Enabled, ToggleLibrary)
			end)

            local Toggle_Connection
            Toggle_Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
				if not NewInstance.Parent then
					if Toggle_Disable then
						if Toggle_Enabled then
							Toggle_Enabled = false
							pcall(Toggle_Callback, Toggle_Enabled, ToggleLibrary)
							Toggle_Connection:Disconnect()
						end
					else
						Toggle_Connection:Disconnect()
					end
				end
			end)

			if Toggle_Enabled then
				pcall(Toggle_Callback, Toggle_Enabled, ToggleLibrary)
			end

            local MenuAdded, MenuButton = TryAddMenu(Toggle, Toggle_Menu, {
				SetText = function(Text)
					ToggleLabel.Text = typeof(Text) == "string" and Text or ToggleLabel.Text
				end,
				GetText = function()
					return ToggleLabel.RichText and ToggleLabel.ContentText or ToggleLabel.Text
				end,
			 	SetAlignment = function(Alignment)
					ToggleLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ToggleLabel.TextXAlignment
				end,
				GetAlignment = function()
					return ToggleLabel.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					ToggleLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ToggleLabel.TextColor3
				end,
				GetTextColor = function()
					return ToggleLabel.TextColor3
				end,
				SetFont = function(Font)
					ToggleLabel.Font = typeof(Font) == "EnumItem" and Font or ToggleLabel.Font
				end,
				GetFont = function()
					return ToggleLabel.Font
				end,
				SetVisible = function(Visible)
					Toggle.Visible = typeof(Visible) ~= "boolean" and Toggle.Visible or Visible
				end,
				GetVisible = function()
					return Toggle.Visible
				end,
				SetState = function(State)
					Toggle_Enabled = typeof(State) ~= "boolean" and Toggle_Enabled or State
					TweenService:Create(Dot, TweenInfo.new(0.15), {Position = ((Toggle_Enabled and UDim2.fromScale(1, 0.5)) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = (Toggle_Enabled and ThisTheme.Toggle) or ThisTheme.ToggleAccent}):Play()
					pcall(Toggle_Callback, Toggle_Enabled)
				end,
				GetState = function()
					return Toggle_Enabled
				end,
				SetDisable = function(Disable)
					Toggle_Disable = typeof(Disable) ~= "boolean" and Toggle_Disable or Disable
				end,
				GetDisable = function()
					return Toggle_Disable
				end,
				StateChanged = function(Callback)
					local Connection
					Connection = Toggle:GetAttributeChangedSignal("State"):Connect(function()
						pcall(Callback, Toggle:GetAttribute("State"), Connection)
					end)
				end
			})

            if MenuAdded then
				ToggleTracker.Position -= UDim2.fromOffset(15, 0)
				MenuButton.ImageColor3 = ThisTheme.Toggle
			end

			function ToggleLibrary:SetText(Text)
				ToggleLabel.Text = typeof(Text) == "string" and Text or ToggleLabel.Text
			end

			function ToggleLibrary:GetText()
				return ToggleLabel.RichText and ToggleLabel.ContentText or ToggleLabel.Text
			end

            function ToggleLibrary:SetAlignment(Alignment)
				ToggleLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ToggleLabel.TextXAlignment
			end

			function ToggleLibrary:GetAlignment()
				return ToggleLabel.TextXAlignment.Name
			end

			function ToggleLibrary:SetTextColor(TextColor)
				ToggleLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ToggleLabel.TextColor3
			end

			function ToggleLibrary:GetTextColor()
				return ToggleLabel.TextColor3
			end

			function ToggleLibrary:SetFont(Font)
				ToggleLabel.Font = typeof(Font) == "EnumItem" and Font or ToggleLabel.Font
			end

			function ToggleLibrary:GetFont()
				return ToggleLabel.Font
			end

			function ToggleLibrary:SetVisible(Visible)
				Toggle.Visible = typeof(Visible) ~= "boolean" and Toggle.Visible or Visible
			end

			function ToggleLibrary:GetVisible()
				return Toggle.Visible
			end

			function ToggleLibrary:SetState(State)
				Toggle_Enabled = typeof(State) ~= "boolean" and Toggle_Enabled or State
				TweenService:Create(Dot, TweenInfo.new(0.15), {Position = ((Toggle_Enabled and UDim2.fromScale(1, 0.5)) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = (Toggle_Enabled and ThisTheme.Toggle) or ThisTheme.ToggleAccent}):Play()
				pcall(Toggle_Callback, Toggle_Enabled, ToggleLibrary)
			end

			function ToggleLibrary:GetState()
				return Toggle_Enabled
			end

			function ToggleLibrary:SetDisable(Disable)
				Toggle_Disable = typeof(Disable) ~= "boolean" and Toggle_Disable or Disable
			end

			function ToggleLibrary:GetDisable()
				return Toggle_Disable
			end

			function ToggleLibrary:GetStateChanged(Callback)
                local Connection
				Connection = Toggle:GetAttributeChangedSignal("State"):Connect(function()
					pcall(Callback, Toggle:GetAttribute("State"), Connection)
				end)
			end

			function ToggleLibrary:Destroy()
				Toggle:Destroy()

				if Toggle_Enabled then
					Toggle_Enabled = false
					pcall(Toggle_Callback, Toggle_Enabled, ToggleLibrary)
				end
			end

            return ToggleLibrary
        end

       	function OptionLibrary:Slider(SliderConfig)
			SliderConfig = typeof(SliderConfig) == "table" and SliderConfig or {}

   			local Slider_Text = typeof(SliderConfig.Text) == "string" and SliderConfig.Text or "Slider"
			local Slider_XAlignment = typeof(SliderConfig.XAlignment) == "string" and SliderConfig.XAlignment ~= "Right" and SliderConfig.XAlignment or "Left"
			local Slider_Visible = typeof(SliderConfig.Visible) ~= "boolean" and true or SliderConfig.Visible
            local Slider_RichText = typeof(SliderConfig.RichText) == "boolean" and SliderConfig.RichText or false
			local Slider_TextColor = typeof(SliderConfig.TextColor) == "Color3" and SliderConfig.TextColor or ThisTheme.SliderAccent
			local Slider_Font = typeof(SliderConfig.Font) == "EnumItem" and SliderConfig.Font or Enum.Font.GothamSemibold
            local Slider_Callback = typeof(SliderConfig.Callback) == "function" and SliderConfig.Callback or function() end
            local Slider_Min = typeof(SliderConfig.Min) == "number" and SliderConfig.Min or 0
            local Slider_Max = typeof(SliderConfig.Max) == "number" and SliderConfig.Max or 100
            local Slider_Precision = typeof(SliderConfig.Precision) == "number" and SliderConfig.Precision or 0
            local Slider_Menu = typeof(SliderConfig.Menu) == "table" and SliderConfig.Menu or {}

			local SliderLibrary = {}

            if Slider_Min > Slider_Max then
                local Value_Before = Slider_Min
                Slider_Min, Slider_Max = Slider_Max, Value_Before
            end

            local SliderDefault = (typeof(SliderConfig.Default) == "number" and math.clamp(SliderConfig.Default, Slider_Min, Slider_Max)) or math.clamp(50, Slider_Min, Slider_Max)
            local DefaultScale = (SliderDefault - Slider_Min) / (Slider_Max - Slider_Min)

            local Slider = Objects:New("Round")
            Slider.Name = "Slider"
            Slider.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 35)
            Slider.ImageColor3 = ThisTheme.Slider
            Slider.ImageTransparency = 1
			Slider.Visible = Slider_Visible
            Slider.Parent = PageContentFrame

            local SliderShadow = Objects:New("Shadow")
            SliderShadow.ImageColor3 = ThisTheme.Slider
            SliderShadow.ImageTransparency = 1
            SliderShadow.Parent = Slider

            local SliderTitle = Objects:New("Label")
            SliderTitle.TextColor3 = Slider_TextColor
            SliderTitle.Text = Slider_Text
            SliderTitle.TextSize = 14
			SliderTitle.TextXAlignment = Slider_XAlignment
            SliderTitle.RichText = Slider_RichText
            SliderTitle.Font = Slider_Font
            SliderTitle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
            SliderTitle.TextTransparency = 1
            SliderTitle.Parent = Slider

            local SliderValue = Objects:New("Label")
            SliderValue.Text = tostring(SliderDefault)
            SliderValue.TextColor3 = Slider_TextColor
            SliderValue.TextTransparency = 1
            SliderValue.TextSize = 14
            SliderValue.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
            SliderValue.Position = UDim2.fromScale(0, 0)
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right
            SliderValue.Font = Slider_Font
            SliderValue.Parent = Slider

            local SliderTracker = Objects:New("Frame")
            SliderTracker.BackgroundColor3 = ThisTheme.SliderAccent
            SliderTracker.BackgroundTransparency = 1
            SliderTracker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-20, 3)
            SliderTracker.Position = UDim2.fromScale(0, 1) + UDim2.fromOffset(10, -10)
            SliderTracker.Parent = Slider

            local SliderFill = SliderTracker:Clone()
            SliderFill.BackgroundTransparency = 1
            SliderFill.Position = UDim2.fromScale(0, 0)
            SliderFill.Size = UDim2.fromScale(DefaultScale, 1)
            SliderFill.Parent = SliderTracker

            local Min_Size = 10
            local Max_Size = 36

            local SizeFromScale = (Min_Size + (Max_Size - Min_Size)) * DefaultScale
            SizeFromScale -= SizeFromScale % 2

            local SliderDot = Objects:New("CircleButton")
            SliderDot.Size = UDim2.fromOffset(10, 10)
            SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)
            SliderDot.ImageColor3 = ThisTheme.SliderAccent
            SliderDot.ImageTransparency = 1
            SliderDot.ZIndex = 50
            SliderDot.Parent = SliderTracker

            local SliderFadedDot = Objects:New("Circle")
            SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
            SliderFadedDot.Position = UDim2.fromScale(0.5,0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
            SliderFadedDot.ImageColor3 = ThisTheme.SliderAccent
            SliderFadedDot.ImageTransparency = 1
            SliderFadedDot.ZIndex = 50
            SliderFadedDot.Parent = SliderDot

            TweenService:Create(Slider, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
            TweenService:Create(SliderShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
            TweenService:Create(SliderTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            TweenService:Create(SliderValue, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            TweenService:Create(SliderTracker, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
            TweenService:Create(SliderFill, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
            TweenService:Create(SliderDot, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

            SliderDot.MouseButton1Down:Connect(function()
                TweenService:Create(SliderFadedDot, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
                local MouseMove, MouseKill

                MouseMove = Mouse.Move:Connect(function()
					local Px = GetXY(SliderTracker)
					SizeFromScale = (Min_Size +  (Max_Size - Min_Size)) * Px
					local Power = 10 ^ Slider_Precision
					local Value = math.floor((Slider_Min + ((Slider_Max - Slider_Min) * Px)) * Power) / Power

					SizeFromScale = SizeFromScale - (SizeFromScale % 2)
					TweenService:Create(SliderDot, TweenInfo.new(0.15), {Position = UDim2.fromScale(Px, 0.5) - UDim2.fromOffset(5, 5)}):Play()
					TweenService:Create(SliderFill, TweenInfo.new(0.15), {Size = UDim2.fromScale(Px, 1)}):Play()

					SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
					SliderFadedDot.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
					SliderValue.Text = tostring(Value)
					pcall(Slider_Callback, Value, SliderLibrary)
                end)

                MouseKill = UserInputService.InputEnded:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        TweenService:Create(SliderFadedDot, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
                        MouseMove:Disconnect()
                        MouseKill:Disconnect()
                    end
                end)
            end)

			local MenuAdded, MenuButton = TryAddMenu(Slider, Slider_Menu, {
				SetText = function(Text)
					SliderTitle.Text = typeof(Text) == "string" and Text or SliderTitle.Text
				end,
				GetText = function()
					return SliderTitle.RichText and SliderTitle.ContentText or SliderTitle.Text
				end,
				SetAlignment = function(Alignment)
					SliderTitle.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or SliderTitle.TextXAlignment
				end,
				GetAlignment = function()
					return SliderTitle.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					SliderTitle.TextColor3 = typeof(TextColor) == "Color3" and TextColor or SliderTitle.TextColor3
				end,
				GetTextColor = function()
					return SliderTitle.TextColor3
				end,
				SetFont = function(Font)
					SliderTitle.Font = typeof(Font) == "EnumItem" and Font or SliderTitle.Font
				end,
				GetFont = function()
					return SliderTitle.Font
				end,
				SetVisible = function(Visible)
					Slider.Visible = typeof(Visible) ~= "boolean" and Slider.Visible or Visible
				end,
				GetVisible = function()
					return Slider.Visible
				end,
				SetMin = function(Min)
					Slider_Min = typeof(Min) == "number" and Min or Slider_Min
					SliderDefault = math.clamp(SliderConfig.Default, Slider_Min, Slider_Max) or math.clamp(50, Slider_Min, Slider_Max)
					DefaultScale =  (SliderDefault - Slider_Min) / (Slider_Max - Slider_Min)

					SizeFromScale -= (SizeFromScale % 2)
					SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
				end,
				GetMin = function()
					return Slider_Min
				end,
				SetMax = function(Max)
					Slider_Max = typeof(Max) == "number" and Max or Slider_Max
					SliderDefault = math.clamp(SliderConfig.Def, Slider_Min, Slider_Max) or math.clamp(50, Slider_Min, Slider_Max)
					DefaultScale =  (SliderDefault - Slider_Min) / (Slider_Max - Slider_Min)

					SizeFromScale -= (SizeFromScale % 2)
					SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
				end,
				GetMax = function()
					return Slider_Max
				end,
				SetValue = function(Value)
					Value = typeof(Value) == "number" and math.clamp(Value, Slider_Min, Slider_Max)

					DefaultScale = (Value - Slider_Min) / (Slider_Max - Slider_Min)
					TweenService:Create(SliderDot, TweenInfo.new(0.15), {Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)}):Play()
					TweenService:Create(SliderFill, TweenInfo.new(0.15), {Size = UDim2.fromScale(DefaultScale, 1)}):Play()

					SliderValue.Text = Value
					pcall(Slider_Callback, Value, SliderLibrary)
				end,
				GetValue = function()
					return tonumber(SliderValue.Text)
				end
            })

            if MenuAdded then
                SliderValue.Position = SliderValue.Position - UDim2.fromOffset(25, 0)
                SliderTracker.Size = SliderTracker.Size - UDim2.fromOffset(20, 0)
                MenuButton.ImageColor3 = ThisTheme.SliderAccent
            end

			function SliderLibrary:SetText(Text)
				SliderTitle.Text = typeof(Text) == "string" and Text or SliderTitle.Text
			end

			function SliderLibrary:GetText()
				return SliderTitle.RichText and SliderTitle.ContentText or SliderTitle.Text
			end

			function SliderLibrary:SetAlignment(Alignment)
				SliderTitle.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or SliderTitle.TextXAlignment
			end

			function SliderLibrary:GetAlignment()
				return SliderTitle.TextXAlignment.Name
			end

			function SliderLibrary:SetTextColor(TextColor)
				SliderTitle.TextColor3 = typeof(TextColor) == "Color3" and TextColor or SliderTitle.TextColor3
			end

			function SliderLibrary:GetTextColor()
				return SliderTitle.TextColor3
			end

			function SliderLibrary:SetFont(Font)
				SliderTitle.Font = typeof(Font) == "EnumItem" and Font or SliderTitle.Font
			end

			function SliderLibrary:GetFont()
				return SliderTitle.Font
			end

			function SliderLibrary:SetVisible(Visible)
				Slider.Visible = typeof(Visible) ~= "boolean" and Slider.Visible or Visible
			end

			function SliderLibrary:GetVisible()
				return Slider.Visible
			end

			function SliderLibrary:SetMin(Min)
				Slider_Min = typeof(Min) == "number" and Min or Slider_Min
				SliderDefault = math.clamp(SliderConfig.Default, Slider_Min, Slider_Max) or math.clamp(50, Slider_Min, Slider_Max)
				DefaultScale =  (SliderDefault - Slider_Min) / (Slider_Max - Slider_Min)

				SizeFromScale -= (SizeFromScale % 2)
				SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
			end

			function SliderLibrary:GetMin()
				return Slider_Min
			end

			function SliderLibrary:SetMax(Max)
				Slider_Max = typeof(Max) == "number" and Max or Slider_Max
				SliderDefault = math.clamp(SliderConfig.Def, Slider_Min, Slider_Max) or math.clamp(50, Slider_Min, Slider_Max)
				DefaultScale =  (SliderDefault - Slider_Min) / (Slider_Max - Slider_Min)

				SizeFromScale -= (SizeFromScale % 2)
				SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
			end

			function SliderLibrary:GetMax()
				return Slider_Max
			end

			function SliderLibrary:SetValue(Value)
				Value = typeof(Value) == "number" and math.clamp(Value, Slider_Min, Slider_Max)

				DefaultScale = (Value - Slider_Min) / (Slider_Max - Slider_Min)
				TweenService:Create(SliderDot, TweenInfo.new(0.15), {Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)}):Play()
				TweenService:Create(SliderFill, TweenInfo.new(0.15), {Size = UDim2.fromScale(DefaultScale, 1)}):Play()

				SliderValue.Text = Value
				pcall(Slider_Callback, Value, SliderLibrary)
			end

			function SliderLibrary:GetValue()
				return tonumber(SliderValue.Text)
			end

			function SliderLibrary:GetValueChanged(Callback)
				local Connection
				Connection = SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
					pcall(Callback, tonumber(SliderValue.Text), Connection)
				end)
			end

			function SliderLibrary:Destroy()
				Slider:Destroy()
			end

			return SliderLibrary
        end

        function OptionLibrary:Dropdown(DropdownConfig)
			DropdownConfig = typeof(DropdownConfig) == "table" and DropdownConfig or {}

			local Dropdown_Text = typeof(DropdownConfig.Text) == "string" and DropdownConfig.Text or "Dropdown"
			local Dropdown_XAlignment = typeof(DropdownConfig.XAlignment) == "string" and DropdownConfig.XAlignment ~= "Right" and DropdownConfig.XAlignment or "Left"
			local Dropdown_RichText = typeof(DropdownConfig.RichText) == "boolean" and DropdownConfig.RichText or false
			local Dropdown_TextColor = typeof(DropdownConfig.TextColor) == "Color3" and DropdownConfig.TextColor or ThisTheme.DropdownAccent
			local Dropdown_Font = typeof(DropdownConfig.Font) == "EnumItem" and DropdownConfig.Font or Enum.Font.GothamSemibold
			local Dropdown_Visible = typeof(DropdownConfig.Visible) ~= "boolean" and true or DropdownConfig.Visible
			local Dropdown_Hide = typeof(DropdownConfig.Hide) ~= "boolean" and true or DropdownConfig.Hide
			local Dropdown_Options = typeof(DropdownConfig.Options) == "table" and DropdownConfig.Options or {}
			local Dropdown_Default = typeof(DropdownConfig.Default) == "string" and table.find(Dropdown_Options, DropdownConfig.Default) and DropdownConfig.Default or ""
			local Dropdown_Callback = typeof(DropdownConfig.Callback) == "function" and DropdownConfig.Callback or function() end

			local Dropdown_Menu = typeof(DropdownConfig.Menu) == "table" and DropdownConfig.Menu or {}

			local DropdownLibrary = {}

            local Dropdown = Objects:New("Frame")
			Dropdown.Name = "Dropdown"
			Dropdown.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			Dropdown.Visible = Dropdown_Visible
			Dropdown.Parent = PageContentFrame

			Dropdown:SetAttribute("Title", Dropdown_Text)
			Dropdown:SetAttribute("Option", Dropdown_Default)

			local DropdownBar = Objects:New("Round")
			DropdownBar.Name = "TitleBar"
			DropdownBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			DropdownBar.ImageColor3 = ThisTheme.Dropdown
			DropdownBar.ImageTransparency = 1
			DropdownBar.Parent = Dropdown

            local DropdownTitle = Objects:New("Button")
			DropdownTitle.Name = "Title"
			DropdownTitle.Font = Dropdown_Font
			DropdownTitle.TextXAlignment = Dropdown_XAlignment
			DropdownTitle.Text = ("%s: %s"):format(Dropdown_Text, Dropdown_Default)
			DropdownTitle.RichText = Dropdown_RichText
			DropdownTitle.TextColor3 = Dropdown_TextColor
			DropdownTitle.TextTransparency = 1
			DropdownTitle.TextSize = 14
			DropdownTitle.Parent = DropdownBar

			local DropdownToggle = Objects:New("Round")
			DropdownToggle.Name = "Container"
			DropdownToggle.Size = UDim2.fromOffset(24, 24)
			DropdownToggle.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(27, 12)
			DropdownToggle.ImageColor3 = ThisTheme.DropdownAccent
			DropdownToggle.ImageTransparency = 0.8
			DropdownToggle.Parent = DropdownBar

            local DropdownButton = Objects:New("Round")
			DropdownButton.Name = "Drop"
			DropdownButton.Image = "http://www.roblox.com/asset/?id=5574299686"
			DropdownButton.ScaleType = Enum.ScaleType.Stretch
			DropdownButton.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
			DropdownButton.Position = UDim2.fromOffset(2, 2)
			DropdownButton.ImageColor3 = ThisTheme.DropdownAccent
			DropdownButton.ImageTransparency = 1
			DropdownButton.Parent = DropdownToggle

			TweenService:Create(DropdownBar, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(DropdownTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(DropdownToggle, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(DropdownButton, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

            local DropdownContent = Objects:New("Frame")
			DropdownContent.Name = "Content"
			DropdownContent.Size = UDim2.fromScale(1, 0)
			DropdownContent.Position = UDim2.fromOffset(0, 35)
			DropdownContent.ClipsDescendants = true
			DropdownContent.Parent = Dropdown

            local DropToggle = false
            local NumberOfOptions = table.maxn(Dropdown_Options)
            local Dropdown_Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))

            local DropdownList = Objects:New("UIListLayout")
			DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
			DropdownList.Padding = UDim.new(0,5)
			DropdownList.Parent = DropdownContent

            DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if DropToggle then
					DropdownContent.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DropdownList.AbsoluteContentSize.Y)
					Dropdown_Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DropdownList.AbsoluteContentSize.Y)
				end
			end)

			for _, Value in pairs(Dropdown_Options) do
				local NewButton = CreateNewButton({
					Text = Value
				}, DropdownContent)

				NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
				NewButton.MouseButton1Down:Connect(function()
					DropdownTitle.Text = ("%s: %s"):format(Dropdown:GetAttribute("Title"), Value)

					if Dropdown_Hide then
						TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = 0}):Play()
						TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = UDim2.fromScale(1, 0)}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
					end

					pcall(Dropdown_Callback, Value)
					Dropdown:SetAttribute("Option", Value)
				end)
			end

            DropdownTitle.MouseButton1Down:Connect(function()
				DropToggle = not DropToggle

				TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = DropToggle and 135 or 0}):Play()
				TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = DropToggle and Dropdown_Size or UDim2.fromScale(1, 0)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = DropToggle and (Dropdown_Size + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
			end)

            local MenuAdded, MenuButton = TryAddMenu(DropdownBar, Dropdown_Menu, {
				SetText = function(Text)
					Text = typeof(Text) == "string" and Text or Dropdown:GetAttribute("Title")

					DropdownTitle.Text = ("%s: %s"):format(Text, Dropdown:GetAttribute("Option"))
					Dropdown:SetAttribute("Title", Text)
				end,
				GetText = function()
					return Dropdown:GetAttribute("Title")
				end,
				SetAlignment = function(Alignment)
					DropdownTitle.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or DropdownTitle.TextXAlignment
				end,
				GetAlignment = function()
					return DropdownTitle.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					DropdownTitle.TextColor3 = typeof(TextColor) == "Color3" and TextColor or DropdownTitle.TextColor3
				end,
				GetTextColor = function()
					return DropdownTitle.TextColor3
				end,
				SetFont = function(Font)
					DropdownTitle.Font = typeof(Font) == "EnumItem" and Font or DropdownTitle.Font
				end,
				GetFont = function()
					return DropdownTitle.Font
				end,
				SetVisible = function(Visible)
					Dropdown.Visible = typeof(Visible) ~= "boolean" and Dropdown.Visible or Visible
				end,
				GetVisible = function()
					return Dropdown.Visible
				end,
				GetOptions = function()
					return Dropdown_Options
				end,
				SetOption = function(Option)
					Option = typeof(Option) == "string" and Option or Dropdown:GetAttribute("Option")

					if table.find(Dropdown_Options, Option) or Option == "" then
						DropdownTitle.Text = ("%s: %s"):format(Dropdown:GetAttribute("Title"), Option)
						Dropdown:SetAttribute("Option", Option)

						if Option ~= "" then
							pcall(Dropdown_Callback, Option)
						end
					end
				end,
				GetOption = function()
					return Dropdown:GetAttribute("Option")
				end
			})

            if MenuAdded then
				DropdownToggle.Position = DropdownToggle.Position - UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.DropdownAccent
			end

            function DropdownLibrary:SetText(Text)
				Text = typeof(Text) == "string" and Text or Dropdown:GetAttribute("Title")

				DropdownTitle.Text = ("%s: %s"):format(Text, Dropdown:GetAttribute("Option"))
				Dropdown:SetAttribute("Title", Text)
            end

            function DropdownLibrary:GetText()
                return Dropdown:GetAttribute("Title")
            end

			function DropdownLibrary:SetAlignment(Alignment)
				DropdownTitle.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or DropdownTitle.TextXAlignment
			end

			function DropdownLibrary:GetAlignment()
				return DropdownTitle.TextXAlignment.Name
			end

			function DropdownLibrary:SetTextColor(TextColor)
				DropdownTitle.TextColor3 = typeof(TextColor) == "Color3" and TextColor or DropdownTitle.TextColor3
			end

			function DropdownLibrary:GetTextColor()
				return DropdownTitle.TextColor3
			end

			function DropdownLibrary:SetFont(Font)
				DropdownTitle.Font = typeof(Font) == "EnumItem" and Font or DropdownTitle.Font
			end

			function DropdownLibrary:GetFont()
				return DropdownTitle.Font
			end

			function DropdownLibrary:SetVisible(Visible)
				Dropdown.Visible = typeof(Visible) ~= "boolean" and Dropdown.Visible or Visible
			end

			function DropdownLibrary:GetVisible()
				return Dropdown.Visible
			end

			function DropdownLibrary:SetOptions(Table)
				Dropdown_Options = typeof(Table) == "table" and Table or {}
				NumberOfOptions = table.maxn(Dropdown_Options)
				Dropdown_Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))

				if DropdownContent then
					DropdownContent:Destroy()
				end

				TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = DropToggle and (Dropdown_Size + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()

				DropdownContent = Objects:New("Frame")
				DropdownContent.Name = "Content"
				DropdownContent.Size = (DropToggle and Dropdown_Size) or UDim2.fromScale(1, 0)
				DropdownContent.Position = UDim2.fromOffset(0, 35)
				DropdownContent.ClipsDescendants = true
				DropdownContent.Parent = Dropdown

				DropdownList = Objects:New("UIListLayout")
				DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
				DropdownList.Padding = UDim.new(0, 5)
				DropdownList.Parent = DropdownContent

				for _,Value in ipairs(Dropdown_Options) do
					local NewButton = CreateNewButton({
						Text = Value
					}, DropdownContent)

					NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
					NewButton.MouseButton1Down:Connect(function()
						DropdownTitle.Text = ("%s: %s"):format(DropdownTitle.Text:split(": ")[1], Value)

						if Dropdown_Hide then
							DropToggle = not DropToggle

							TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = DropToggle and 135 or 0}):Play()
							TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = DropToggle and Dropdown_Size or UDim2.fromScale(1, 0)}):Play()
							TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = DropToggle and (Dropdown_Size + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
						end

						pcall(Dropdown_Callback, Value, DropdownLibrary)
					end)
				end
			end

			function DropdownLibrary:GetOptions()
				return Dropdown_Options
			end

			function DropdownLibrary:SetOption(Option)
				Option = typeof(Option) == "string" and Option or Dropdown:GetAttribute("Option")

				if table.find(Dropdown_Options, Option) or Option == "" then
					DropdownTitle.Text = ("%s: %s"):format(Dropdown:GetAttribute("Title"), Option)
					Dropdown:SetAttribute("Option", Option)

					if Option ~= "" then
						pcall(Dropdown_Callback, Option)
					end
				end
			end

			function DropdownLibrary:GetOption()
				return Dropdown:GetAttribute("Option")
			end

			function DropdownLibrary:GetChanged(SignalConfig)
				local Type = typeof(SignalConfig.Type) == "string" and SignalConfig.Type or "Option"
				local Callback = typeof(SignalConfig.Callback) == "function" and SignalConfig.Callback or function() end

				local Connection
				Connection = Dropdown:GetAttributeChangedSignal(Type):Connect(function()
					pcall(Callback, Dropdown:GetAttribute(Type), Connection)
				end)
			end

			function DropdownLibrary:Destroy()
				Dropdown:Destroy()
			end

            return DropdownLibrary
        end

        function OptionLibrary:ChipSet(ChipSetConfig)
			ChipSetConfig = (typeof(ChipSetConfig) == "table" and ChipSetConfig) or {}

			local ChipSet_Disable = (typeof(ChipSetConfig.Disable) ~= "boolean" and true) or ChipSetConfig.Disable
			local ChipSet_Visible = (typeof(ChipSetConfig.Visible) ~= "boolean" and true) or ChipSetConfig.Visible
            local ChipSet_Callback = (typeof(ChipSetConfig.Callback) == "function" and ChipSetConfig.Callback) or function() end
            local ChipSet_Options = (typeof(ChipSetConfig.Options) == "table" and ChipSetConfig.Options) or {}

            local TotalOptions = 0

			for _,v in pairs(ChipSet_Options) do
                TotalOptions += 1
            end

            if TotalOptions > 0 then
				local ChipSetLibrary = {}

                local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

				local ChipSet = Objects:New("Round")
				ChipSet.Name = "ChipSet"
				ChipSet.Size = Size
				ChipSet.ImageColor3 = ThisTheme.ChipSet
				ChipSet.ImageTransparency = 1
				ChipSet.Visible = ChipSet_Visible
				ChipSet.Parent = PageContentFrame

				local ChipList = Objects:New("UIListLayout")
				ChipList.SortOrder = Enum.SortOrder.LayoutOrder
				ChipList.Padding = UDim.new(0,5)
				ChipList.Parent = ChipSet

				local ChipPadding = Objects:New("UIPadding")
				ChipPadding.PaddingBottom = UDim.new(0, 5)
				ChipPadding.PaddingTop = UDim.new(0, 5)
				ChipPadding.PaddingRight= UDim.new(0, 5)
				ChipPadding.PaddingLeft = UDim.new(0, 5)
				ChipPadding.Parent = ChipSet

                local BuildTable = {}

				for Key, Value in pairs(ChipSet_Options) do
					if typeof(Value) == "table" then
						BuildTable[Key] = Value.Enabled
					else
						BuildTable[Key] = Value
					end
				end

                TweenService:Create(ChipSet, TweenInfo.new(0.5), {ImageTransparency = 0.9}):Play()

				for Key, Value in pairs(ChipSet_Options) do
					local ChipItem = Objects:New("SmoothButton")
					ChipItem.Name = "ChipItem"
					ChipItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
					ChipItem.ImageColor3 = (BuildTable[Key] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
					ChipItem.ImageTransparency = 1
					ChipItem.Parent = ChipSet
					ChipItem:SetAttribute("Key", Key)

					local ChipShadow = Objects:New("Shadow")
					ChipShadow.Name = "Shadow"
					ChipShadow.ImageColor3 = (BuildTable[Key] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
					ChipShadow.ImageTransparency = 1
					ChipShadow.Parent = ChipItem

					local Tick = Objects:New("Round")
					Tick.Name = "Tick"
					Tick.ScaleType = Enum.ScaleType.Stretch
					Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
					Tick.ImageColor3 = ThisTheme.ChipSetAccent
					Tick.ImageTransparency = 1
					Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 10)
					Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
					Tick.Position = UDim2.fromOffset(5, 5)
					Tick.Parent = ChipItem

					local ChipLabel = Objects:New("Label")
					ChipLabel.Name = "ChipLabel"
					ChipLabel.Size = (BuildTable[Key] and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))
					ChipLabel.Position = (BuildTable[Key] and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0)
					ChipLabel.Text = Key
					ChipLabel.Font = Enum.Font.Gotham
					ChipLabel.TextSize = 12
					ChipLabel.TextColor3 = (BuildTable[Key] and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet
					ChipLabel.TextTransparency = 1
					ChipLabel.Parent = ChipItem

					TweenService:Create(ChipItem, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
					TweenService:Create(ChipShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
					TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = (BuildTable[Key] and 0) or 1}):Play()
					TweenService:Create(ChipLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

					local ChipMenu

					if typeof(Value) == "table" then
						local Menu = Value.Menu or {}

						local MenuAdded, MenuButton = TryAddMenu(ChipItem, Menu, {})

						MenuButton.ImageColor3 = (BuildTable[Key] and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet

						ChipMenu = MenuButton
					end

					ChipItem.MouseButton1Down:Connect(function()
						BuildTable[Key] = not BuildTable[Key]
						local Enabled = BuildTable[Key]

						TweenService:Create(ChipItem, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
						TweenService:Create(ChipShadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
						TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
						TweenService:Create(ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()

						if ChipMenu then
							TweenService:Create(ChipMenu, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet}):Play()
						end

						pcall(ChipSet_Callback, Key, BuildTable[Key], ChipSetLibrary)
					end)

					local ChipSet_Connection
					ChipSet_Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
						if not NewInstance.Parent then
							if ChipSet_Disable then
								if BuildTable[Key] then
									BuildTable[Key] = false
									pcall(ChipSet_Callback, Key, BuildTable[Key], ChipSetLibrary)
									ChipSet_Connection:Disconnect()
								end
							else
								ChipSet_Connection:Disconnect()
							end
						end
					end)
				end

				function ChipSetLibrary:SetOptions(NewMenu)
					ChipSet_Options = (typeof(NewMenu) == "table" and NewMenu) or {}

					TotalOptions = 0

					for _,v in pairs(ChipSet_Options) do
						TotalOptions = TotalOptions + 1
					end

					for _, Element in next, ChipSet:GetChildren() do
						Element:Destroy()
					end

					Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

					TweenService:Create(ChipSet, TweenInfo.new(0.15), {Size = Size}):Play()

					ChipList = Objects:New("UIListLayout")
					ChipList.SortOrder = Enum.SortOrder.LayoutOrder
					ChipList.Padding = UDim.new(0,5)
					ChipList.Parent = ChipSet

					ChipPadding = Objects:New("UIPadding")
					ChipPadding.PaddingBottom = UDim.new(0,5)
					ChipPadding.PaddingTop = UDim.new(0,5)
					ChipPadding.PaddingRight= UDim.new(0,5)
					ChipPadding.PaddingLeft = UDim.new(0,5)
					ChipPadding.Parent = ChipSet

					BuildTable = {}

					for Key, Value in pairs(ChipSet_Options) do
						if typeof(Value) == "table" then
							BuildTable[Key] = Value.Enabled
						else
							BuildTable[Key] = Value
						end
					end

					pcall(ChipSet_Callback, BuildTable, ChipSetLibrary)

					TweenService:Create(ChipSet, TweenInfo.new(0.5), {ImageTransparency = 0.9}):Play()

					for Key, Value in pairs(ChipSet_Options) do
						local ChipItem = Objects:New("SmoothButton")
						ChipItem.Name = "ChipItem"
						ChipItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
						ChipItem.ImageColor3 = (BuildTable[Key] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
						ChipItem.ImageTransparency = 1
						ChipItem.Parent = ChipSet
						ChipItem:SetAttribute("Key", Key)

						local ChipShadow = Objects:New("Shadow")
						ChipShadow.Name = "Shadow"
						ChipShadow.ImageColor3 = (BuildTable[Key] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
						ChipShadow.ImageTransparency = 1
						ChipShadow.Parent = ChipItem

						local Tick = Objects:New("Round")
						Tick.Name = "Tick"
						Tick.ScaleType = Enum.ScaleType.Stretch
						Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
						Tick.ImageColor3 = ThisTheme.ChipSetAccent
						Tick.ImageTransparency = 1
						Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 10)
						Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
						Tick.Position = UDim2.fromOffset(5, 5)
						Tick.Parent = ChipItem

						local ChipLabel = Objects:New("Label")
						ChipLabel.Name = "ChipLabel"
						ChipLabel.Size = (BuildTable[Key] and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))
						ChipLabel.Position = (BuildTable[Key] and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0)
						ChipLabel.Text = Key
						ChipLabel.Font = Enum.Font.Gotham
						ChipLabel.TextSize = 12
						ChipLabel.TextColor3 = (BuildTable[Key] and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet
						ChipLabel.TextTransparency = 1
						ChipLabel.Parent = ChipItem

						TweenService:Create(ChipItem, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
						TweenService:Create(ChipShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
						TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = (BuildTable[Key] and 0) or 1}):Play()
						TweenService:Create(ChipLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

						local ChipMenu

						if typeof(Value) == "table" then
							local Menu = Value.Menu or {}

							local MenuAdded, MenuButton = TryAddMenu(ChipItem, Menu, {})

							MenuButton.ImageColor3 = BuildTable[Key] and ThisTheme.ChipSetAccent or ThisTheme.ChipSet

							ChipMenu = MenuButton
						end

						ChipItem.MouseButton1Down:Connect(function()
							BuildTable[Key] = not BuildTable[Key]
							local Enabled = BuildTable[Key]

							TweenService:Create(ChipItem, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(ChipShadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
							TweenService:Create(ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()

							if ChipMenu then
								TweenService:Create(ChipMenu, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet}):Play()
							end

							pcall(ChipSet_Callback, Key, BuildTable[Key], ChipSetLibrary)
						end)

						local ChipSet_Connection
						ChipSet_Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
							if not NewInstance.Parent then
								if ChipSet_Disable then
									if BuildTable[Key] then
										BuildTable[Key] = false
										pcall(ChipSet_Callback, Key, BuildTable[Key], ChipSetLibrary)
										ChipSet_Connection:Disconnect()
									end
								else
									ChipSet_Connection:Disconnect()
								end
							end
						end)
					end
				end

				function ChipSetLibrary:GetOptions()
					return ChipSet_Options
				end

				function ChipSetLibrary:SetState(Index, State)
					for _,v in pairs(ChipSet:GetChildren()) do
						if v:GetAttribute("Key") == Index then
							BuildTable[Index] = State
							local Enabled = BuildTable[Index]

							TweenService:Create(v, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(v.Shadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(v.Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
							TweenService:Create(v.ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()

							pcall(ChipSet_Callback, Index, BuildTable[Index] , ChipSetLibrary)
                            break
						end
					end
				end

				function ChipSetLibrary:GetState(Index)
					return BuildTable[Index]
				end

				function ChipSetLibrary:SetVisible(Visible)
					ChipSet.Visible = (typeof(Visible) ~= "boolean" and ChipSet.Visible) or Visible
				end

				function ChipSetLibrary:GetVisible()
					return ChipSet.Visible
				end

				function ChipSetLibrary:Destroy()
					ChipSet:Destroy()
				end

				return ChipSetLibrary
            end
        end

        function OptionLibrary:DataTable(DataTableConfig)
			DataTableConfig = (typeof(DataTableConfig) == "table" and DataTableConfig) or {}

			local DataTable_Disable = (typeof(DataTableConfig.Disable) ~= "boolean" and true) or DataTableConfig.Disable
			local DataTable_Visible = (typeof(DataTableConfig.Visible) ~= "boolean" and true) or DataTableConfig.Visible
            local DataTable_Callback = (typeof(DataTableConfig.Callback) == "function" and DataTableConfig.Callback) or function() end
			local DataTable_Options = (typeof(DataTableConfig.Options) == "table" and DataTableConfig.Options) or {}

            local TotalOptions = 0

			for _,v in pairs(DataTable_Options) do
				TotalOptions += 1
			end

            if TotalOptions > 0 then
				local DataTableLibrary = {}

				local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

				local DataTable = Objects:New("Round")
				DataTable.Name = "DataTable"
				DataTable.Size = Size
				DataTable.ImageColor3 = ThisTheme.DataTable
				DataTable.ImageTransparency = 1
				DataTable.Visible = DataTable_Visible
				DataTable.Parent = PageContentFrame

				local DataShadow = Objects:New("Shadow")
				DataShadow.ImageColor3 = ThisTheme.DataTable
				DataShadow.ImageTransparency = 1
				DataShadow.Parent = DataTable

				local DataContainer = Objects:New("Frame")
				DataContainer.Name = "Container"
				DataContainer.Parent = DataTable

				local DataList = Objects:New("UIListLayout")
				DataList.SortOrder = Enum.SortOrder.LayoutOrder
				DataList.Padding = UDim.new(0, 5)
				DataList.Parent = DataContainer

				local DataPadding = Objects:New("UIPadding")
				DataPadding.PaddingBottom = UDim.new(0, 5)
				DataPadding.PaddingTop = UDim.new(0, 5)
				DataPadding.PaddingRight= UDim.new(0, 5)
				DataPadding.PaddingLeft = UDim.new(0, 5)
				DataPadding.Parent = DataContainer

				local BuildTable = {}

				for Key, Value in pairs(DataTable_Options) do
					if typeof(Value) == "table" then
						BuildTable[Key] = Value.Enabled
					else
						BuildTable[Key] = Value
					end
				end

				TweenService:Create(DataTable, TweenInfo.new(0.5), {ImageTransparency = 0.9}):Play()
				TweenService:Create(DataShadow, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()

				for Key, Value in pairs(DataTable_Options) do
					local DataItem = Objects:New("SmoothButton")
					DataItem.Name = "DataItem"
					DataItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
					DataItem.ImageColor3 = (BuildTable[Key] and ThisTheme.DataTable) or ThisTheme.DataTableAccent
					DataItem.ImageTransparency = 1
					DataItem.Parent = DataContainer
					DataItem:SetAttribute("Key", Key)

					local DataTracker = Objects:New("Round")
					DataTracker.Name = "Tracker"
					DataTracker.Size = UDim2.fromOffset(24, 24)
					DataTracker.Position = UDim2.fromScale(0, 0.5) + UDim2.fromOffset(3, -12)
					DataTracker.ImageColor3 = ThisTheme.DataTable
					DataTracker.ImageTransparency = 1
					DataTracker.Parent = DataItem

					local Tick = Objects:New("Round")
					Tick.Name = "Tick"
					Tick.ScaleType = Enum.ScaleType.Stretch
					Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
					Tick.ImageColor3 = ThisTheme.DataTableAccent
					Tick.ImageTransparency = 1
					Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
					Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
					Tick.Position = UDim2.fromOffset(2, 2)
					Tick.Parent = DataTracker

					local DataLabel = Objects:New("Label")
					DataLabel.Name = "Value"
					DataLabel.Size = (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))
					DataLabel.Position = UDim2.fromOffset(30, 0) or UDim2.fromOffset(5, 0)
					DataLabel.Text = Key
					DataLabel.Font = Enum.Font.Gotham
					DataLabel.TextSize = 14
					DataLabel.TextColor3 = ThisTheme.DataTable
					DataLabel.TextTransparency = 1
					DataLabel.Parent = DataItem

					TweenService:Create(DataItem, TweenInfo.new(0.5), {ImageTransparency = BuildTable[Key] and 0.8 or 0}):Play()
					TweenService:Create(DataTracker, TweenInfo.new(0.5), {ImageTransparency = BuildTable[Key] and 0 or 0.8}):Play()
					TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = BuildTable[Key] and 0 or 0.7}):Play()
					TweenService:Create(DataLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

					local DataMenu = nil

					if typeof(Value) == "table" then
						local Menu = (typeof(Value.Menu) == "table" and Value.Menu) or {}

						local MenuAdded, MenuButton = TryAddMenu(DataItem, Menu, {})

						if MenuAdded then
							MenuButton.ImageColor3 = ThisTheme.DataTable
						end

						DataMenu = MenuButton
					end

					DataItem.MouseButton1Down:Connect(function()
						BuildTable[Key] = not BuildTable[Key]
						local Enabled = BuildTable[Key]

						TweenService:Create(DataItem, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0.8) or 0, ImageColor3 = (Enabled and ThisTheme.DataTable) or ThisTheme.DataTableAccent}):Play()
						TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.7}):Play()
						TweenService:Create(DataTracker, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.8}):Play()

						pcall(DataTable_Callback, Key, BuildTable[Key], DataTableLibrary)
					end)

					local DataTable_Connection
					DataTable_Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
						if not NewInstance.Parent then
							if DataTable_Disable then
								if BuildTable[Key] then
									BuildTable[Key] = false
									pcall(DataTable_Callback, Key, BuildTable[Key], DataTableLibrary)
									DataTable_Connection:Disconnect()
								end
							else
								DataTable_Connection:Disconnect()
							end
						end
					end)
				end

				function DataTableLibrary:GetOptions()
					return DataTable_Options
				end

				function DataTableLibrary:SetState(Index, State)
					for _,v in pairs(DataContainer:GetChildren()) do
						if v:GetAttribute("Key") == Index then
							BuildTable[Index] = State
							local Enabled = BuildTable[Index]

							TweenService:Create(v, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0.8) or 0, ImageColor3 = (Enabled and ThisTheme.DataTable) or ThisTheme.DataTableAccent}):Play()
							TweenService:Create(v.Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.7}):Play()
							TweenService:Create(v.Tracker, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.8}):Play()

							pcall(DataTable_Callback, Index, BuildTable[Index], DataTableLibrary)
						end
					end
				end

                function DataTableLibrary:GetState(Key)
					return BuildTable[Key]
				end

                function DataTableLibrary:SetVisible(Visible)
                    DataTable.Visible = (typeof(Visible) ~= "boolean" and DataTable.Visible) or Visible
                end

                function DataTableLibrary:GetVisible()
                    return DataTable.Visible
                end

				function DataTableLibrary:Destroy()
					DataTable:Destroy()
				end

				return DataTableLibrary
            end
        end

        function OptionLibrary:ColorPicker(ColorPickerConfig)
			ColorPickerConfig = typeof(ColorPickerConfig) == "table" and ColorPickerConfig or {}

			local ColorPicker_Text = typeof(ColorPickerConfig.Text) == "string" and ColorPickerConfig.Text or "ColorPicker"
			local ColorPicker_XAlignment = typeof(ColorPickerConfig.XAlignment) == "string" and ColorPickerConfig.XAlignment ~= "Right" and ColorPickerConfig.XAlignment or "Left"
			local ColorPicker_RichText = typeof(ColorPickerConfig.RichText) == "boolean" and ColorPickerConfig.RichText or false
			local ColorPicker_TextColor = typeof(ColorPickerConfig.TextColor) == "Color3" and ColorPickerConfig.TextColor or ThisTheme.ColorPickerAccent
			local ColorPicker_Font = typeof(ColorPickerConfig.Font) == "EnumItem" and ColorPickerConfig.Font or Enum.Font.GothamSemibold
			local ColorPicker_Visible = typeof(ColorPickerConfig.Visible) ~= "boolean" and true or ColorPickerConfig.Visible
			local ColorPicker_Default = typeof(ColorPickerConfig.Default) == "Color3" and ColorPickerConfig.Default or Color3.fromRGB(255, 255, 255)
			local ColorPicker_Callback = typeof(ColorPickerConfig.Callback) == "function" and ColorPickerConfig.Callback or function() end

			local ColorPicker_Menu = typeof(ColorPickerConfig.Menu) == "table" and ColorPickerConfig.Menu or {}

			local PickerToggle = false
			local ColorPickerLibrary = {}

			local H, S, V = Objects:New("NumberValue"), Objects:New("NumberValue"), Objects:New("NumberValue")
			H.Value, S.Value, V.Value = Color3.toHSV(ColorPicker_Default)

			local ColorPicker = Objects:New("SmoothButton")
			ColorPicker.Name = "ColorPicker"
			ColorPicker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 40)
			ColorPicker.ImageColor3 = ThisTheme.ColorPicker
			ColorPicker.ImageTransparency = 1
			ColorPicker.ClipsDescendants = true
			ColorPicker.Visible = ColorPicker_Visible
			ColorPicker.Parent = PageContentFrame

			ColorPicker.MouseButton1Down:Connect(function()
				PickerToggle = not PickerToggle
				TweenService:Create(ColorPicker, TweenInfo.new(0.15), {Size = UDim2.fromScale(1, 0) + ((PickerToggle and UDim2.fromOffset(0, 115)) or UDim2.fromOffset(0, 40))}):Play()
			end)

			local ColorBar = Objects:New("Round")
			ColorBar.Name = "TitleBar"
			ColorBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
			ColorBar.Position = UDim2.fromOffset(5, 5)
			ColorBar.ImageColor3 = ThisTheme.ColorPickerAccent
			ColorBar.ImageTransparency = 1
			ColorBar.Parent = ColorPicker

			local ColorShadow = Objects:New("Shadow")
			ColorShadow.ImageColor3 = ThisTheme.ColorPickerAccent
			ColorShadow.ImageTransparency = 1
			ColorShadow.Parent = ColorBar

			local ColorLabel = Objects:New("Label")
			ColorLabel.Name = "Title"
			ColorLabel.Font = ColorPicker_Font
			ColorLabel.TextColor3 = ColorPicker_TextColor
			ColorLabel.TextSize = 14
			ColorLabel.RichText = ColorPicker_RichText
			ColorLabel.Text = ColorPicker_Text
			ColorLabel.TextXAlignment = ColorPicker_XAlignment
			ColorLabel.TextTransparency = 1
			ColorLabel.Parent = ColorBar

			local ColorTracker = Objects:New("Round")
			ColorTracker.Name = "Tracker"
			ColorTracker.Size = UDim2.fromOffset(50, 20)
			ColorTracker.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-55, 5)
			ColorTracker.ImageColor3 = ColorPicker_Default
			ColorTracker.ImageTransparency = 1
			ColorTracker.Parent = ColorBar

			local TrackerShadow = Objects:New("Shadow")
			TrackerShadow.ImageColor3 = ColorTracker.ImageColor3
			TrackerShadow.ImageTransparency = 1
			TrackerShadow.Parent = ColorTracker

			ColorTracker:GetPropertyChangedSignal("ImageColor3"):Connect(function()
				TrackerShadow.ImageColor3 = ColorTracker.ImageColor3
			end)

			local Hue = Objects:New("Round")
			Hue.Name = "Container"
			Hue.Position = UDim2.fromOffset(5, 40)
			Hue.Size = UDim2.fromOffset(25, 20)
			Hue.ImageColor3 = ThisTheme.ColorPickerAccent
			Hue.ImageTransparency = 0.8
			Hue.Parent = ColorPicker

			local Saturation = Hue:Clone()
			Saturation.Position += UDim2.fromOffset(0, 25)
			Saturation.Parent = ColorPicker

			local Value = Saturation:Clone()
			Value.Position += UDim2.fromOffset(0, 25)
			Value.Parent = ColorPicker

			local HueLabel = Objects:New("Label")
			HueLabel.Name = "Label"
			HueLabel.TextXAlignment = Enum.TextXAlignment.Center
			HueLabel.Position = UDim2.fromScale(0, 0)
			HueLabel.Size = UDim2.fromScale(1, 1)
			HueLabel.Text = "H"
			HueLabel.TextColor3 = ThisTheme.ColorPickerAccent
			HueLabel.TextSize = 12
			HueLabel.Font = Enum.Font.GothamBold
			HueLabel.TextTransparency = 1
			HueLabel.Parent = Hue

			local SaturationLabel = HueLabel:Clone()
			SaturationLabel.Text = "S"
			SaturationLabel.Parent = Saturation

			local ValueLabel = HueLabel:Clone()
			ValueLabel.Text = "V"
			ValueLabel.Parent = Value

			local function CSK(Time, Color)
				return ColorSequenceKeypoint.new(Time, Color)
			end

			local RainbowGradient = Objects:New("UIGradient")
			RainbowGradient.Color = ColorSequence.new({
				CSK(0, Color3.fromRGB(255, 0, 0)),
				CSK(0.157, Color3.fromRGB(255, 0, 255)),
				CSK(0.323, Color3.fromRGB(0, 0, 255)),
				CSK(0.488, Color3.fromRGB(0, 255, 255)),
				CSK(0.66, Color3.fromRGB(0, 255, 0)),
				CSK(0.817, Color3.fromRGB(255, 255, 0)),
				CSK(1, Color3.fromRGB(255, 0, 0))
			})

			local BlackWhiteGradient = Objects:New("UIGradient")
			BlackWhiteGradient.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(0, 0, 0))

			local SaturationGradient = Objects:New("UIGradient")
			SaturationGradient.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.new(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

			local HueTracker = Objects:New("SmoothButton")
			HueTracker.Name = "Tracker"
			HueTracker.ImageColor3 = Color3.fromRGB(255, 255, 255)
			HueTracker.ImageTransparency = 1
			HueTracker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-40, 20)
			HueTracker.Position = UDim2.fromOffset(35, 40)
			HueTracker.Parent = ColorPicker

			local SaturationTracker = HueTracker:Clone()
			SaturationTracker.Position += UDim2.fromOffset(0, 25)
			SaturationTracker.Parent = ColorPicker

			local ValueTracker = SaturationTracker:Clone()
			ValueTracker.Position += UDim2.fromOffset(0, 25)
			ValueTracker.Parent = ColorPicker

			local HueShadow = Objects:New("Shadow")
			HueShadow.ImageColor3 = Color3.fromRGB(255, 255, 255)
			HueShadow.ImageTransparency = 1
			HueShadow.Parent = HueTracker

			local SaturationShadow = HueShadow:Clone()
			SaturationShadow.Parent = SaturationTracker

			local ValueShadow = HueShadow:Clone()
			ValueShadow.Parent = ValueTracker

			local HueGrad = RainbowGradient:Clone()
			HueGrad.Parent = HueTracker

			local HueShadowGrad = RainbowGradient:Clone()
			HueShadowGrad.Parent = HueShadow

			local ValueGrad = BlackWhiteGradient:Clone()
			ValueGrad.Parent = ValueTracker

			local ValueShadowGrad = BlackWhiteGradient:Clone()
			ValueShadowGrad.Parent = ValueShadow

			local SaturationGrad = SaturationGradient:Clone()
			SaturationGrad.Parent = SaturationTracker

			local SaturationShadowGrad = SaturationGradient:Clone()
			SaturationShadowGrad.Parent = SaturationShadow

			TweenService:Create(ColorPicker, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ColorBar, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(ColorShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ColorLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(HueLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(SaturationLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(ValueLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(ColorTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(TrackerShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
			TweenService:Create(HueTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(ValueTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(SaturationTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(HueShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(SaturationShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(ValueShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

			H:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value, S.Value, V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new( Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				pcall(ColorPicker_Callback, Color3.fromHSV(H.Value, S.Value, V.Value), ColorPickerLibrary)
			end)

			S:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value, S.Value, V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				pcall(ColorPicker_Callback, Color3.fromHSV(H.Value, S.Value, V.Value), ColorPickerLibrary)
			end)

			V:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value,S.Value,V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				pcall(ColorPicker_Callback, Color3.fromHSV(H.Value, S.Value, V.Value), ColorPickerLibrary)
			end)

			HueTracker.MouseButton1Down:Connect(function()
				H.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					H.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			ValueTracker.MouseButton1Down:Connect(function()
				V.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					V.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			SaturationTracker.MouseButton1Down:Connect(function()
				S.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					S.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			local MenuAdded, MenuButton = TryAddMenu(ColorLabel, ColorPicker_Menu, {
				SetText = function(Text)
					ColorLabel.Text = typeof(Text) == "string" and Text or ColorLabel.Text
				end,
				GetText = function()
					return ColorLabel.RichText and ColorLabel.ContentText or ColorLabel.Text
				end,
				SetAlignment = function(Alignment)
					ColorLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ColorLabel.TextXAlignment
				end,
				GetAlignment = function()
					return ColorLabel.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					ColorLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ColorLabel.TextColor3
				end,
				GetTextColor = function()
					return ColorLabel.TextColor3
				end,
				SetFont = function(Font)
					ColorLabel.Font = typeof(Font) == "EnumItem" and Font or ColorLabel.Font
				end,
				GetFont = function()
					return ColorLabel.Font
				end,
				SetVisible = function(Visible)
					ColorPicker.Visible = typeof(Visible) ~= "boolean" and ColorPicker.Visible or Visible
				end,
				GetVisible = function()
					return ColorPicker.Visible
				end,
				SetColor = function(Color)
					H.Value, S.Value, V.Value = typeof(Color) == "Color3" and Color3.toHSV(Color) or H.Value, S.Value, V.Value
				end,
				GetColor = function()
					return ColorTracker.ImageColor3
				end
			})

			if MenuAdded then
				ColorTracker.Position -= UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.ColorPickerAccent
			end

			function ColorPickerLibrary:SetText(Text)
				ColorLabel.Text = typeof(Text) == "string" and Text or ColorLabel.Text
			end

			function ColorPickerLibrary:GetText()
				return ColorLabel.RichText and ColorLabel.ContentText or ColorLabel.Text
			end

			function ColorPickerLibrary:SetAlignment(Alignment)
				ColorLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or ColorLabel.TextXAlignment
			end

			function ColorPickerLibrary:GetAlignment()
				return ColorLabel.TextXAlignment.Name
			end

			function ColorPickerLibrary:SetTextColor(TextColor)
				ColorLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or ColorLabel.TextColor3
			end

			function ColorPickerLibrary:GetTextColor()
				return ColorLabel.TextColor3
			end

			function ColorPickerLibrary:SetFont(Font)
				ColorLabel.Font = typeof(Font) == "EnumItem" and Font or ColorLabel.Font
			end

			function ColorPickerLibrary:GetFont()
				return ColorLabel.Font
			end

			function ColorPickerLibrary:SetVisible(Visible)
				ColorPicker.Visible = typeof(Visible) ~= "boolean" and ColorPicker.Visible or Visible
			end

			function ColorPickerLibrary:GetVisible()
				return ColorPicker.Visible
			end

			function ColorPickerLibrary:SetColor(Color)
				H.Value, S.Value, V.Value = typeof(Color) == "Color3" and Color3.toHSV(Color) or H.Value, S.Value, V.Value
			end

			function ColorPickerLibrary:GetColor()
				return ColorTracker.ImageColor3
			end

			function ColorPickerLibrary:GetColorChanged(Callback)
				local Connection
				Connection = ColorTracker:GetPropertyChangedSignal("ImageColor3"):Connect(function()
					pcall(Callback, ColorTracker.ImageColor3, Connection)
				end)
			end

			function ColorPickerLibrary:Destroy()
				ColorPicker:Destroy()
			end

			return ColorPickerLibrary
        end

		function OptionLibrary:Bind(BindConfig)
			BindConfig = typeof(BindConfig) == "table" and BindConfig or {}

			local Bind_Text = typeof(BindConfig.Text) == "string" and BindConfig.Text or "Bind"
			local Bind_XAlignment = typeof(BindConfig.XAlignment) == "string" and BindConfig.XAlignment ~= "Right" and BindConfig.XAlignment or "Left"
			local Bind_RichText = typeof(BindConfig.RichText) == "boolean" and BindConfig.RichText or false
			local Bind_TextColor = typeof(BindConfig.TextColor) == "Color3" and BindConfig.TextColor or ThisTheme.ButtonAccent
			local Bind_Font = typeof(BindConfig.Font) == "EnumItem" and BindConfig.Font or Enum.Font.GothamSemibold
			local Bind_Visible = typeof(BindConfig.Visible) ~= "boolean" and true or BindConfig.Visible
			local Bind_Enabled = typeof(BindConfig.Enabled) == "boolean" and BindConfig.Enabled or false
			local Bind_Notify = typeof(BindConfig.Notify) == "boolean" and BindConfig.Notify or false
			local Bind_KeyCode = typeof(BindConfig.Bind) == "EnumItem" and BindConfig.Bind or Enum.KeyCode.G
			local Bind_Callback = typeof(BindConfig.Callback) == "function" and BindConfig.Callback or function() end
			local Bind_Blacklist = typeof(BindConfig.Blacklist) == "table" and BindConfig.Blacklist or {
				Enum.KeyCode.A,
				Enum.KeyCode.W,
				Enum.KeyCode.D,
				Enum.KeyCode.S,
				Enum.KeyCode.Space,
				Enum.KeyCode.Escape,
				Enum.KeyCode.F9,
				Enum.KeyCode.Backquote,
				Enum.KeyCode.Tab,
				Enum.KeyCode.Backspace,
				Enum.KeyCode.CapsLock,
				Enum.KeyCode.Insert,
				Enum.KeyCode.Up,
				Enum.KeyCode.Down,
				Enum.KeyCode.Left,
				Enum.KeyCode.Right,
				Enum.KeyCode.F12,
				Enum.KeyCode.Print
			}

			local Bind_Menu = typeof(BindConfig.Menu) == "table" and BindConfig.Menu or {}

			local BindLibrary = {}
			local KeyCode = Bind_KeyCode.Name

			Bind_Blacklist[#Bind_Blacklist + 1] = Enum.KeyCode[Setting.Keybind]

			local BindContainer = Objects:New("SmoothButton")
			BindContainer.Name = "Bind"
			BindContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			BindContainer.ImageColor3 = ThisTheme.Button
			BindContainer.ClipsDescendants = true
			BindContainer.ImageTransparency = 1
			BindContainer.Visible = Bind_Visible
			BindContainer.Parent = PageContentFrame

			local BindShadow = Objects:New("Shadow")
			BindShadow.ImageColor3 = ThisTheme.ButtonAccent
			BindShadow.ImageTransparency = 1
			BindShadow.Parent = BindContainer

			local BindLabel = Objects:New("Label")
			BindLabel.Name = "Title"
			BindLabel.Font = Bind_Font
			BindLabel.TextColor3 = Bind_TextColor
			BindLabel.TextSize = 14
			BindLabel.TextXAlignment = Bind_XAlignment
			BindLabel.Text = Bind_Text
            BindLabel.RichText = Bind_RichText
			BindLabel.TextTransparency = 1
			BindLabel.Parent = BindContainer

			local BindButton = Objects:New("Label")
			BindButton.Name = "BindButton"
			BindButton.Font = Enum.Font.GothamSemibold
			BindButton.Text = KeyCode
			BindButton.Size = UDim2.new(0.332, -5, 1, 0)
			BindButton.Position = UDim2.fromScale(0.649, 0)
			BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindButton.TextSize = 12
			BindButton.TextTruncate = Enum.TextTruncate.AtEnd
			BindButton.TextXAlignment = Enum.TextXAlignment.Right
			BindButton.TextYAlignment = Enum.TextYAlignment.Center
			BindButton.Parent = BindContainer

			TweenService:Create(BindContainer, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(BindShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(BindLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(BindButton, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

			BindContainer.MouseButton1Click:Connect(function()
				BindButton.Text = "···"

				local Input, GameProcessed = UserInputService.InputBegan:Wait()

				if Input.KeyCode.Name == "Unknown" then
					Material.Notification({
						Description = ("Invalid key!"),
					})

					KeyCode = nil
					BindButton.Text = "None"
				elseif table.find(Bind_Blacklist, Input.KeyCode) then
					Material.Notification({
						Description = ("[%s] is a blacklisted key, please use another one."):format(Input.KeyCode.Name),
					})

					KeyCode = Bind_KeyCode.Name
					BindButton.Text = Bind_KeyCode.Name
				else
					KeyCode = Input.KeyCode.Name
					BindButton.Text = Input.KeyCode.Name
				end
			end)

			local BindConnection
			BindConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
				if Input.KeyCode.Name == KeyCode and not GameProcessed then
					if NewInstance.Parent then
						Bind_Enabled = not Bind_Enabled

						if Bind_Notify then
							Material.Notification({
								Title = ("%s - [%s]"):format(BindLabel.Text, Bind_Enabled and "Enabled" or "Disabled"),
								Duration = 2
							})
						end

						pcall(Bind_Callback, Bind_Enabled, BindLibrary)
					else
						BindConnection:Disconnect()
					end
				end
			end)

			local MenuAdded, MenuButton = TryAddMenu(BindContainer, Bind_Menu, {
				SetText = function(Text)
					BindLabel.Text = typeof(Text) == "string" and Text or BindLabel.Text
				end,
				GetText = function()
					return BindLabel.RichText and BindLabel.ContentText or BindLabel.Text
				end,
				SetAlignment = function(Alignment)
					BindLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or BindLabel.TextXAlignment
				end,
				GetAlignment = function()
					return BindLabel.TextXAlignment.Name
				end,
				SetTextColor = function(TextColor)
					BindLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or BindLabel.TextColor3
				end,
				GetTextColor = function()
					return BindLabel.TextColor3
				end,
				SetFont = function(Font)
					BindLabel.Font = typeof(Font) == "EnumItem" and Font or BindLabel.Font
				end,
				GetFont = function()
					return BindLabel.Font
				end,
				SetVisible = function(Visible)
					BindContainer.Visible = typeof(Visible) ~= "boolean" and BindContainer.Visible or Visible
				end,
				GetVisible = function()
					return BindContainer.Visible
				end,
				SetState = function(State)
					Bind_Enabled = typeof(State) == "boolean" and State or Bind_Enabled

					if Bind_Notify then
						Material.Notification({
							Title = ("%s - [%s]"):format(BindLabel.Text, Bind_Enabled and "Enabled" or "Disabled"),
							Duration = 2
						})
					end

					pcall(Bind_Callback, Bind_Enabled, BindLibrary)
				end,
				GetState = function()
					return Bind_Enabled
				end,
				SetNotify = function(Notify)
					Bind_Notify = typeof(Notify) == "boolean" and Notify or Bind_Notify
				end,
				GetNotify = function()
					return Bind_Notify
				end,
				SetBind = function(Bind)
					KeyCode = typeof(Bind) == "string" and Bind or KeyCode
					BindButton.Text = typeof(Bind) == "string" and Bind or KeyCode
				end,
				GetBind = function()
					return KeyCode
				end,
				Blacklist = function(Option, Key)
					Option = typeof(Option) == "string" and Option or "Add"
					Key = typeof(Key) == "EnumItem" and Key or nil

					if Key then
						local Index = table.find(Bind_Blacklist, Key)

						if Option == "Add" then
							if not Index and Key ~= Enum.KeyCode[Setting.Keybind] then
								Bind_Blacklist[#Bind_Blacklist + 1] = Key
							end
						elseif Option == "Remove" then
							if Index then
								table.remove(Bind_Blacklist, Index)
							end
						end
					end
				end,
				GetBlacklisted = function()
					return Bind_Blacklist
				end
			})

			if MenuAdded then
				BindButton.Position -= UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.ColorPickerAccent
			end

			function BindLibrary:SetText(Text)
				BindLabel.Text = typeof(Text) == "string" and Text or BindLabel.Text
			end

			function BindLibrary:GetText()
				return BindLabel.RichText and BindLabel.ContentText or BindLabel.Text
			end

			function BindLibrary:SetAlignment(Alignment)
				BindLabel.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or BindLabel.TextXAlignment
			end

			function BindLibrary:GetAlignment()
				return BindLabel.TextXAlignment.Name
			end

			function BindLibrary:SetTextColor(TextColor)
				BindLabel.TextColor3 = typeof(TextColor) == "Color3" and TextColor or BindLabel.TextColor3
			end

			function BindLibrary:GetTextColor()
				return BindLabel.TextColor3
			end

			function BindLibrary:SetFont(Font)
				BindLabel.Font = typeof(Font) == "EnumItem" and Font or BindLabel.Font
			end

			function BindLibrary:GetFont()
				return BindLabel.Font
			end

			function BindLibrary:SetVisible(Visible)
				BindContainer.Visible = typeof(Visible) ~= "boolean" and BindContainer.Visible or Visible
			end

			function BindLibrary:GetVisible()
				return BindContainer.Visible
			end

			function BindLibrary:SetState(State)
				Bind_Enabled = typeof(State) == "boolean" and State or Bind_Enabled

				if Bind_Notify then
					Material.Notification({
						Title = ("%s - [%s]"):format(BindLabel.Text, Bind_Enabled and "Enabled" or "Disabled"),
						Duration = 2
					})
				end

				pcall(Bind_Callback, Bind_Enabled, BindLibrary)
			end

			function BindLibrary:GetState()
				return Bind_Enabled
			end

			function BindLibrary:SetNotify(Notify)
				Bind_Notify = typeof(Notify) == "boolean" and Notify or Bind_Notify
			end

			function BindLibrary:GetNotify()
				return Bind_Notify
			end

			function BindLibrary:SetBind(Bind)
				KeyCode = typeof(Bind) == "string" and Bind or KeyCode
				BindButton.Text = typeof(Bind) == "string" and Bind or KeyCode
			end

			function BindLibrary:GetBind()
				return KeyCode
			end

			function BindLibrary:Blacklist(Option, Key)
				Option = typeof(Option) == "string" and Option or "Add"
				Key = typeof(Key) == "EnumItem" and Key or nil

				if Key then
					local Index = table.find(Bind_Blacklist, Key)

					if Option == "Add" then
						if not Index and Key ~= Enum.KeyCode[Setting.Keybind] then
							Bind_Blacklist[#Bind_Blacklist + 1] = Key
						end
					elseif Option == "Remove" then
						if Index and Key ~= Enum.KeyCode[Setting.Keybind] then
							table.remove(Bind_Blacklist, Index)
						end
					end
				end
			end

			function BindLibrary:GetBlacklisted()
				return Bind_Blacklist
			end

			function BindLibrary:Destroy()
				BindContainer:Destroy()
			end

			return BindLibrary
		end

		function OptionLibrary:TextField(TextFieldConfig)
			TextFieldConfig = typeof(TextFieldConfig) == "table" and TextFieldConfig or {}

			local TextField_Text = typeof(TextFieldConfig.Text) == "string" and TextFieldConfig.Text or "Bind"
			local TextField_TextColor = typeof(TextFieldConfig.TextColor) == "Color3" and TextFieldConfig.TextColor or ThisTheme.TextFieldAccent
			local TextField_Font = typeof(TextFieldConfig.Font) == "EnumItem" and TextFieldConfig.Font or Enum.Font.GothamSemibold
			local TextField_Visible = typeof(TextFieldConfig.Visible) ~= "boolean" and true or TextFieldConfig.Visible
			local TextField_Default = typeof(TextFieldConfig.Default) == "string" and TextFieldConfig.Default or ""
			local TextField_InputType = typeof(TextFieldConfig.Type) == "string" and TextFieldConfig.Type or "Default"
			local TextField_Callback = typeof(TextFieldConfig.Callback) == "function" and TextFieldConfig.Callback or function() end

			local TextField_Menu = typeof(TextFieldConfig.Menu) == "table" and TextFieldConfig.Menu or {}

			local TextFieldLibrary = {}

			local TextField = Objects:New("Round")
			TextField.Name = "TextField"
			TextField.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			TextField.ImageColor3 = ThisTheme.TextField
			TextField.ImageTransparency = 1
			TextField.Visible = TextField_Visible
			TextField.Parent = PageContentFrame

			local TextEffect = Objects:New("Frame")
			TextEffect.Name = "Effect"
			TextEffect.BackgroundTransparency = 1
			TextEffect.BackgroundColor3 = ThisTheme.TextField
			TextEffect.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 2)
			TextEffect.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 2)
			TextEffect.Parent = TextField

			local TextShadow = Objects:New("Shadow")
			TextShadow.ImageColor3 = ThisTheme.TextField
			TextShadow.ImageTransparency = 1
			TextShadow.Parent = TextField

			local TextInput = Objects:New("Box")
			TextInput.Name = "Value"
			TextInput.PlaceholderText = TextField_Text
            TextInput.RichText = TextField_RichText
			TextInput.PlaceholderColor3 = TextField_TextColor
			TextInput.TextColor3 = TextField_TextColor
			TextInput.Text = TextField_Default
			TextInput.Font = TextField_Font
			TextInput.TextInputType = Enum.TextInputType[TextField_InputType]
			TextInput.TextSize = 14
			TextInput.TextTransparency = 1
			TextInput.TextTruncate = Enum.TextTruncate.AtEnd
			TextInput.Parent = TextField

			TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(TextEffect, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
			TweenService:Create(TextShadow, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
			TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()

			TextInput:GetPropertyChangedSignal("Text"):Connect(function()
                if TextField_InputType == "Number" or TextField_InputType == "Phone" then
                    if not tonumber(TextInput.Text) then
                        TextInput.Text = ""
                    end
                elseif TextField_InputType == "Default" or TextField_InputType == "PasswordShown" or TextField_InputType == "Username" then
                    if not tostring(TextInput.Text) then
                        TextInput.Text = ""
                    end
                end
            end)

			TextInput.Focused:Connect(function()
				TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
				TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			end)

			TextInput.FocusLost:Connect(function()
				TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
				TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()

				if TextInput.Text ~= "" then
					if TextField_InputType == "Number" or TextField_InputType == "Phone" then
						pcall(TextField_Callback, tonumber(TextInput.Text), TextFieldLibrary)
                    elseif TextField_InputType == "Default" or TextField_InputType == "PasswordShown" or TextField_InputType == "Username" then
						pcall(TextField_Callback, tostring(TextInput.Text), TextFieldLibrary)
                    end
				end
			end)

			local MenuAdded, MenuBar = TryAddMenu(TextField, TextField_Menu, {
				SetText = function(Text, Type)
					Type = typeof(Type) == "string" and Type or "Title"

					if Type == "Title" then
						TextInput.PlaceholderText = typeof(Text) == "string" and Text or TextInput.PlaceholderText
					elseif Type == "Text" then
						if TextField_InputType == "Number" or TextField_InputType == "Phone" then
							TextInput.Text = tonumber(Text) and Text or tonumber(TextInput.Text)
							pcall(TextField_Callback, tonumber(TextInput.Text), TextFieldLibrary)
						elseif TextField_InputType == "Default" or TextField_InputType == "PasswordShown" or TextField_InputType == "Username" then
							TextInput.Text = tostring(Text) and Text or tostring(TextInput.Text)
							pcall(TextField_Callback, tostring(TextInput.Text), TextFieldLibrary)
						end
					end
				end,
				GetText = function(Type)
					Type = typeof(Type) == "string" and Type or "Title"

					if Type == "Title" then
						return TextInput.PlaceholderText
					elseif Type == "Text" then
						return TextInput.Text
					end
				end,
				SetTextColor = function(TextColor)
					TextInput.TextColor3 = typeof(TextColor) == "Color3" and TextColor or TextInput.TextColor3
				end,
				GetTextColor = function()
					return TextInput.TextColor3
				end,
				SetFont = function(Font)
					TextInput.Font = typeof(Font) == "EnumItem" and Font or TextInput.Font
				end,
				GetFont = function()
					return TextInput.Font
				end,
				SetVisible = function(Visible)
					TextField.Visible = typeof(Visible) ~= "boolean" and TextField.Visible or Visible
				end,
				GetVisible = function()
					return TextField.Visible
				end,
				SetInputType = function(InputType)
					TextInput.TextInputType = typeof(InputType) == "string" and Enum.TextInputType[InputType] or TextInput.TextInputType.Name
				end,
				GetInputType = function()
					return TextInput.TextInputType.Name
				end
			})

			if MenuAdded then
				MenuBar.ImageColor3 = ThisTheme.TextFieldAccent
			end

			function TextFieldLibrary:SetText(Text, Type)
				Type = typeof(Type) == "string" and Type or "Title"

				if Type == "Title" then
					TextInput.PlaceholderText = typeof(Text) == "string" and Text or TextInput.PlaceholderText
				elseif Type == "Text" then
					if TextField_InputType == "Number" or TextField_InputType == "Phone" then
						TextInput.Text = tonumber(Text) and Text or tonumber(TextInput.Text)
						pcall(TextField_Callback, tonumber(TextInput.Text), TextFieldLibrary)
					elseif TextField_InputType == "Default" or TextField_InputType == "PasswordShown" or TextField_InputType == "Username" then
						TextInput.Text = tostring(Text) and Text or tostring(TextInput.Text)
						pcall(TextField_Callback, tostring(TextInput.Text), TextFieldLibrary)
					end
				end
			end

			function TextFieldLibrary:GetText(Type)
				Type = typeof(Type) == "string" and Type or "Title"

				if Type == "Title" then
					return TextInput.PlaceholderText
				elseif Type == "Text" then
					return TextInput.Text
				end
			end

			function TextFieldLibrary:SetTextColor(TextColor)
				TextInput.TextColor3 = typeof(TextColor) == "Color3" and TextColor or TextInput.TextColor3
			end

			function TextFieldLibrary:GetTextColor()
				return TextInput.TextColor3
			end

			function TextFieldLibrary:SetFont(Font)
				TextInput.Font = typeof(Font) == "EnumItem" and Font or TextInput.Font
			end

			function TextFieldLibrary:GetFont()
				return TextInput.Font
			end

			function TextFieldLibrary:SetVisible(Visible)
				TextField.Visible = typeof(Visible) ~= "boolean" and TextField.Visible or Visible
			end

			function TextFieldLibrary:GetVisible()
				return TextField.Visible
			end

			function TextFieldLibrary:SetInputType(InputType)
				TextInput.TextInputType = typeof(InputType) == "string" and Enum.TextInputType[InputType] or TextInput.TextInputType.Name
			end

			function TextFieldLibrary:GetInputType()
				return TextInput.TextInputType.Name
			end

			function TextFieldLibrary:GetPlayer(Input)
				if typeof(Input) == "string" then
					local Found = {}
					local Method = Input:lower()

					if Method == "me" then
						table.insert(Found, Players.LocalPlayer.Name)
					elseif Method == "random" then
						table.insert(Found, Players:GetPlayers()[math.random(1, #Players:GetPlayers())])
					end

					for _,v in pairs(Players:GetPlayers()) do
						if Method == "others" then
							if v ~= Players.LocalPlayer then
								table.insert(Found, v)
							end
						elseif Method == "all" then
							table.insert(Found, v)
						elseif Method == "nonfriends" then
							if not v:GetFriendStatus(Players.LocalPlayer) == Enum.FriendStatus.NotFriend and v ~= Players.LocalPlayer then
								table.insert(Found, v)
							end
						elseif Method == "friends" then
							if v:GetFriendStatus(Players.LocalPlayer) == Enum.FriendStatus.NotFriend then
								table.insert(Found, v)
							end
						elseif Method == "enemies" then
							if v.Team ~= Players.LocalPlayer.Team then
								table.insert(Found, v)
							end
						elseif Method == "allies" then
							if v.Team == Players.LocalPlayer.Team then
								table.insert(Found, v)
							end
						else
							if v.Name:lower():sub(1, #Input) == Input:lower() or v.DisplayName:lower():sub(1, #Input) == Input:lower() then
								table.insert(Found, v)
							end
						end
					end

					if table.maxn(Found) > 0 then
						return Found
					end

					return nil
				end
			end

			function TextFieldLibrary:GetChangedText(SignalConfig)
				local Type = typeof(SignalConfig.Type) == "string" and SignalConfig.Type or "Title"
				local Callback = typeof(SignalConfig.Callback) == "function" and SignalConfig.Callback or function() end

				Type = Type == "Title" and "PlaceholderText" or "Text"

				local Connection
				Connection = TextInput:GetPropertyChangedSignal(Type):Connect(function()
					pcall(Callback, TextInput[Type], Connection)
				end)
			end

			function TextFieldLibrary:Destroy()
				TextField:Destroy()
			end

			return TextFieldLibrary
		end

		function OptionLibrary:GuiSettings(GuiConfig)
			GuiConfig = typeof(GuiConfig) == "table" and GuiConfig or {}

			local Theme = typeof(GuiConfig.Theme) ~= "boolean" and true or GuiConfig.Theme
			local _Options = typeof(GuiConfig.Options) ~= "boolean" and true or GuiConfig.Options
			local Rejoin = typeof(GuiConfig.Rejoin) ~= "boolean" and true or GuiConfig.Rejoin

			local ToggleUI = OptionLibrary:Bind({
				Text = "Toggle Gui",
				Bind = Enum.KeyCode[Setting.Keybind],
				Callback = function(State)
					TweenService:Create(MainFrame, TweenInfo.new(0.95, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {Position = UDim2.new(State and -1 or 0.5, MainFrame.Position.X.Offset, 0.5, MainFrame.Position.Y.Offset)}):Play()
				end
			})

			local GetTheme

			if Theme then
				GetTheme = OptionLibrary:Dropdown({
					Text = "Theme",
					Hide = true,
					Default = Setting.Theme,
					Options = {
						"Light",
						"Dark",
						"Mocha",
						"Aqua",
						"Jester"
					}
				})
			end

			if Rejoin then
				OptionLibrary:Separator()

				OptionLibrary:Button({
					Text = "Rejoin",
					Callback = function()
						if table.maxn(Players:GetPlayers()) <= 1 then
							Players.LocalPlayer:Kick("\nRejoining...")
							TeleportService:Teleport(game.PlaceId)
						else
							TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
						end
					end
				})
			end

			if _Options then
				OptionLibrary:ChipSet({
					Callback = function(Selected, State)
						if Selected == "Performace Stats" then
							UserSettings().GameSettings.PerformanceStatsVisible = State
						elseif Selected == "Micro Profiler" then
							UserSettings().GameSettings.OnScreenProfilerEnabled = State
						elseif Selected == "Console" then
							StarterGui:SetCore("DevConsoleVisible", State)
						end
					end,
					Options = {
						["Console"] = false,
						["Micro Profiler"] = false,
						["Performace Stats"] = false
					}
				})
			end

			Load_Menu["Restore Settings"] = function()
				TabLibrary:Banner({
					Text = "Do you want to restore your settings?",
					Button = "Cancel",
					Options = {
						Restore = function(Self)
							Setting = Default
                            writefile("MaterialSetting.json", HttpService:JSONEncode(Setting))

							ToggleUI:SetBind(Setting.Keybind)

							if Theme then
								GetTheme:SetOption(Setting.Theme)
							end

							Self:SetText("Configuration restored!")
							task.wait(0.15)
							Self:Close()
						end
					}
				})
			end

			local MenuAdded, MenuButton = TryAddMenu(TitleBar, Load_Menu, {})

			if MenuAdded then
				MenuButton.Position -= UDim2.fromOffset(31, 0)
			end

			Players.PlayerRemoving:Connect(function(Player)
				if Player == Players.LocalPlayer then
					Setting.Keybind = ToggleUI:GetBind()

					if Theme then
						Setting.Theme = GetTheme:GetOption()
					end

					writefile("MaterialSetting.json", HttpService:JSONEncode(Setting))
				end
			end)

			NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
				if not NewInstance.Parent then
					Setting.Keybind = ToggleUI:GetBind()

					if Theme then
						Setting.Theme = GetTheme:GetOption()
					end

					writefile("MaterialSetting.json", HttpService:JSONEncode(Setting))
				end
			end)
		end

		function OptionLibrary:SetTitle(Text)
			Button.Text = typeof(Text) == "string" and Text or Button.Text
		end

		function OptionLibrary:GetTitle()
			return Button.Text
		end

		function OptionLibrary:SetTextColor(TextColor)
			Button.TextColor3 = typeof(TextColor) == "Color3" and TextColor or Button.TextColor3
		end

		function OptionLibrary:GetTextColor()
			return Button.TextColor3
		end

		function OptionLibrary:SetFont(Font)
			Button.Font = typeof(Font) == "EnumItem" and Font or Button.Font
		end

		function OptionLibrary:GetFont()
			return Button.Font
		end

		function OptionLibrary:SetVisible(Visible)
            Button.Visible = typeof(Visible) ~= "boolean" and Button.Visible or Visible
        end

        function OptionLibrary:GetVisible()
            return Button.Visible
        end

		function OptionLibrary:SetImage(Image)
			if Tab_ImageID ~= nil then
				local FetchURL = ("rbxassetid://%s"):format(typeof(Image) == "number" and tostring(Image) or NewImage.Image)
				NewImage.Image = (RunService:IsStudio() and "http://www.roblox.com/asset/?id=5472131383") or game:GetObjects(FetchURL)[1].Texture
			end
		end

		function OptionLibrary:GetImage()
			if Tab_ImageID ~= nil then
				return NewImage.Image:match("%d+")
			end
		end

        return OptionLibrary
    end

	function TabLibrary:SetTitle(Text)
        TitleText.Text = typeof(Text) == "string" and Text or TitleText.Text
    end

    function TabLibrary:GetTitle()
        return TitleText.Text
    end

	function TabLibrary:SetAlignment(Alignment)
		TitleText.TextXAlignment = typeof(Alignment) == "string" and Alignment ~= "Right" and Alignment or TitleText.TextXAlignment
	end

	function TabLibrary:GetAlignment()
		return TitleText.TextXAlignment.Name
	end

	function TabLibrary:SetTextColor(TextColor)
		TitleText.TextColor3 = typeof(TextColor) == "Color3" and TextColor or TitleText.TextColor3
	end

	function TabLibrary:GetTextColor()
		return TitleText.TextColor3
	end

	function TabLibrary:SetFont(Font)
		TitleText.Font = typeof(Font) == "EnumItem" and Font or TitleText.Font
	end

	function TabLibrary:GetFont()
		return TitleText.Font
	end

	function TabLibrary:CloseUI()
        TweenService:Create(MainFrame, TweenInfo.new(0.95, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {Position = UDim2.new(0.5, MainFrame.Position.X.Offset, 2, MainFrame.Position.Y.Offset)}):Play()
		task.wait(0.95)
		NewInstance:Destroy()
	end

    return TabLibrary
end

function Material:GetLoadedTime()
    return ("The library has finished loading, it took: %.8f secs"):format(Loaded)
end

Loaded = os.clock() - Timer

return Material
