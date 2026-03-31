--[[
    ╔═══════════════════════════════════════════════════════╗
    ║         DEEP GUI CONVERTER  (zukv2)                   ║
    ╚═══════════════════════════════════════════════════════╝
    ScreenGui : Exp
    Extracted : 2026-03-24 05:07:07
    Scripts   : 0
--]]
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ── GUI Structure ──────────────────────────────────────
local function createGui()
    local Exp_1 = Instance.new("ScreenGui")
    Exp_1.Name = "Exp"
    Exp_1.DisplayOrder = 8
    Exp_1.ZIndexBehavior = Enum.ZIndexBehavior.Global
    Exp_1.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
    local Main_2 = Instance.new("Frame")
    Main_2.Parent = Exp_1
    Main_2.Name = "Main"
    Main_2.Size = UDim2.new(0, 598, 0, 509)
    Main_2.Position = UDim2.new(1, -598, 0, 0)
    Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main_2.BackgroundTransparency = 1
    Main_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Main_2.BorderSizePixel = 0
    Main_2.Style = Enum.FrameStyle.Custom
    local Content_3 = Instance.new("Frame")
    Content_3.Parent = Main_2
    Content_3.Name = "Content"
    Content_3.Size = UDim2.new(1, 0, 1, -20)
    Content_3.Position = UDim2.new(0, 0, 0, 20)
    Content_3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Content_3.BackgroundTransparency = 0.20000000298023224
    Content_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Content_3.BorderSizePixel = 0
    Content_3.ClipsDescendants = true
    Content_3.Style = Enum.FrameStyle.Custom
    local Line_4 = Instance.new("Frame")
    Line_4.Parent = Content_3
    Line_4.Name = "Line"
    Line_4.Size = UDim2.new(1, 0, 0, 1)
    Line_4.Position = UDim2.new(0, 0, 0, 22)
    Line_4.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Line_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Line_4.BorderSizePixel = 0
    Line_4.Style = Enum.FrameStyle.Custom
    local ToolBar_5 = Instance.new("Frame")
    ToolBar_5.Parent = Content_3
    ToolBar_5.Name = "ToolBar"
    ToolBar_5.Size = UDim2.new(1, 0, 0, 22)
    ToolBar_5.Position = UDim2.new(0, 0, 0, 0)
    ToolBar_5.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
    ToolBar_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ToolBar_5.BorderSizePixel = 0
    ToolBar_5.Style = Enum.FrameStyle.Custom
    local SearchFrame_6 = Instance.new("Frame")
    SearchFrame_6.Parent = ToolBar_5
    SearchFrame_6.Name = "SearchFrame"
    SearchFrame_6.Size = UDim2.new(1, -6, 0, 18)
    SearchFrame_6.Position = UDim2.new(0, 3, 0, 1)
    SearchFrame_6.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    SearchFrame_6.BorderColor3 = Color3.fromRGB(30, 30, 30)
    SearchFrame_6.BorderSizePixel = 0
    SearchFrame_6.Style = Enum.FrameStyle.Custom
    local UICorner_7 = Instance.new("UICorner")
    UICorner_7.Parent = SearchFrame_6
    UICorner_7.CornerRadius = UDim.new(0, 2)
    local UIStroke_8 = Instance.new("UIStroke")
    UIStroke_8.Parent = SearchFrame_6
    UIStroke_8.Color = Color3.fromRGB(42, 42, 42)
    UIStroke_8.Thickness = 1.399999976158142
    UIStroke_8.Transparency = 0
    UIStroke_8.LineJoinMode = Enum.LineJoinMode.Round
    UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    local Reset_9 = Instance.new("TextButton")
    Reset_9.Parent = SearchFrame_6
    Reset_9.Name = "Reset"
    Reset_9.Size = UDim2.new(0, 16, 0, 16)
    Reset_9.Position = UDim2.new(1, -17, 0, 1)
    Reset_9.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Reset_9.BackgroundTransparency = 1
    Reset_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Reset_9.BorderSizePixel = 0
    Reset_9.Active = true
    Reset_9.Selectable = true
    Reset_9.Text = ""
    Reset_9.TextSize = 14
    Reset_9.Font = Enum.Font.SourceSans
    Reset_9.TextColor3 = Color3.fromRGB(255, 255, 255)
    Reset_9.TextTruncate = Enum.TextTruncate.None
    Reset_9.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Reset_9.LineHeight = 1
    Reset_9.AutoButtonColor = false
    Reset_9.Modal = false
    Reset_9.Style = Enum.ButtonStyle.Custom
    local ImageLabel_10 = Instance.new("ImageLabel")
    ImageLabel_10.Parent = Reset_9
    ImageLabel_10.Size = UDim2.new(0, 16, 0, 16)
    ImageLabel_10.Position = UDim2.new(0, 0, 0, 0)
    ImageLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_10.BackgroundTransparency = 1
    ImageLabel_10.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageLabel_10.Image = "rbxassetid://5034718129"
    ImageLabel_10.ImageColor3 = Color3.fromRGB(100, 100, 100)
    ImageLabel_10.ImageRectOffset = Vector2.new(0, 0)
    ImageLabel_10.ImageRectSize = Vector2.new(0, 0)
    ImageLabel_10.ResampleMode = Enum.ResamplerMode.Default
    ImageLabel_10.ScaleType = Enum.ScaleType.Stretch
    ImageLabel_10.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageLabel_10.SliceScale = 1
    ImageLabel_10.TileSize = UDim2.new(1, 0, 1, 0)
    local SearchBox_11 = Instance.new("Frame")
    SearchBox_11.Parent = SearchFrame_6
    SearchBox_11.Name = "SearchBox"
    SearchBox_11.Size = UDim2.new(1, -24, 0, 18)
    SearchBox_11.Position = UDim2.new(0, 4, 0, 0)
    SearchBox_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox_11.BackgroundTransparency = 1
    SearchBox_11.BorderColor3 = Color3.fromRGB(27, 42, 53)
    SearchBox_11.ClipsDescendants = true
    SearchBox_11.Style = Enum.FrameStyle.Custom
    local Input_12 = Instance.new("TextBox")
    Input_12.Parent = SearchBox_11
    Input_12.Name = "Input"
    Input_12.Size = UDim2.new(1, 0, 1, 0)
    Input_12.Position = UDim2.new(0, 0, 0, 0)
    Input_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Input_12.BackgroundTransparency = 1
    Input_12.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Input_12.Active = true
    Input_12.Selectable = true
    Input_12.Text = ""
    Input_12.TextSize = 14
    Input_12.Font = Enum.Font.SourceSans
    Input_12.TextColor3 = Color3.fromRGB(255, 255, 255)
    Input_12.TextXAlignment = Enum.TextXAlignment.Left
    Input_12.PlaceholderText = "Search workspace"
    Input_12.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    Input_12.ClearTextOnFocus = false
    Input_12.MultiLine = false
    Input_12.TextEditable = true
    local Refresh_13 = Instance.new("TextButton")
    Refresh_13.Parent = ToolBar_5
    Refresh_13.Name = "Refresh"
    Refresh_13.Size = UDim2.new(0, 18, 0, 18)
    Refresh_13.Position = UDim2.new(1, -20, 0, 1)
    Refresh_13.Visible = false
    Refresh_13.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Refresh_13.BackgroundTransparency = 1
    Refresh_13.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Refresh_13.BorderSizePixel = 0
    Refresh_13.Active = true
    Refresh_13.Selectable = true
    Refresh_13.Text = ""
    Refresh_13.TextSize = 14
    Refresh_13.Font = Enum.Font.SourceSans
    Refresh_13.TextColor3 = Color3.fromRGB(255, 255, 255)
    Refresh_13.TextTruncate = Enum.TextTruncate.None
    Refresh_13.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Refresh_13.LineHeight = 1
    Refresh_13.AutoButtonColor = false
    Refresh_13.Modal = false
    Refresh_13.Style = Enum.ButtonStyle.Custom
    local ImageLabel_14 = Instance.new("ImageLabel")
    ImageLabel_14.Parent = Refresh_13
    ImageLabel_14.Size = UDim2.new(0, 12, 0, 12)
    ImageLabel_14.Position = UDim2.new(0, 3, 0, 3)
    ImageLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_14.BackgroundTransparency = 1
    ImageLabel_14.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageLabel_14.Image = "rbxassetid://5642310344"
    ImageLabel_14.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_14.ImageRectOffset = Vector2.new(0, 0)
    ImageLabel_14.ImageRectSize = Vector2.new(0, 0)
    ImageLabel_14.ResampleMode = Enum.ResamplerMode.Default
    ImageLabel_14.ScaleType = Enum.ScaleType.Stretch
    ImageLabel_14.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageLabel_14.SliceScale = 1
    ImageLabel_14.TileSize = UDim2.new(1, 0, 1, 0)
    local List_15 = Instance.new("Frame")
    List_15.Parent = Content_3
    List_15.Name = "List"
    List_15.Size = UDim2.new(1, -16, 1, -23)
    List_15.Position = UDim2.new(0, 0, 0, 23)
    List_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    List_15.BackgroundTransparency = 1
    List_15.BorderColor3 = Color3.fromRGB(27, 42, 53)
    List_15.ClipsDescendants = true
    List_15.Style = Enum.FrameStyle.Custom
    local RenameBox_16 = Instance.new("TextBox")
    RenameBox_16.Parent = List_15
    RenameBox_16.Name = "RenameBox"
    RenameBox_16.Size = UDim2.new(0, 482, 0, 16)
    RenameBox_16.Position = UDim2.new(0, 65, 0, 422)
    RenameBox_16.Visible = false
    RenameBox_16.ZIndex = 2
    RenameBox_16.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    RenameBox_16.BorderColor3 = Color3.fromRGB(16, 132, 255)
    RenameBox_16.Active = true
    RenameBox_16.Selectable = true
    RenameBox_16.Text = "ProfileRemotes"
    RenameBox_16.TextSize = 14
    RenameBox_16.Font = Enum.Font.SourceSans
    RenameBox_16.TextColor3 = Color3.fromRGB(255, 255, 255)
    RenameBox_16.TextXAlignment = Enum.TextXAlignment.Left
    RenameBox_16.PlaceholderText = ""
    RenameBox_16.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    RenameBox_16.ClearTextOnFocus = false
    RenameBox_16.MultiLine = false
    RenameBox_16.TextEditable = true
    -- (hardcoded entries removed -- built dynamically below)

    ScrollCorner_185.Name = "ScrollCorner"
    ScrollCorner_185.Size = UDim2.new(0, 16, 0, 16)
    ScrollCorner_185.Position = UDim2.new(1, -16, 1, -16)
    ScrollCorner_185.Visible = false
    ScrollCorner_185.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ScrollCorner_185.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ScrollCorner_185.BorderSizePixel = 0
    ScrollCorner_185.Style = Enum.FrameStyle.Custom
    local ScrollBar_186 = Instance.new("Frame")
    ScrollBar_186.Parent = Content_3
    ScrollBar_186.Name = "ScrollBar"
    ScrollBar_186.Size = UDim2.new(0, 16, 1, -23)
    ScrollBar_186.Position = UDim2.new(1, -16, 0, 23)
    ScrollBar_186.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ScrollBar_186.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ScrollBar_186.BorderSizePixel = 0
    ScrollBar_186.Active = true
    ScrollBar_186.Style = Enum.FrameStyle.Custom
    local Up_187 = Instance.new("ImageButton")
    Up_187.Parent = ScrollBar_186
    Up_187.Name = "Up"
    Up_187.Size = UDim2.new(0, 16, 0, 16)
    Up_187.Position = UDim2.new(0, 0, 0, 0)
    Up_187.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Up_187.BackgroundTransparency = 1
    Up_187.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Up_187.BorderSizePixel = 0
    Up_187.Active = true
    Up_187.Selectable = true
    Up_187.Image = ""
    Up_187.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Up_187.ImageRectOffset = Vector2.new(0, 0)
    Up_187.ImageRectSize = Vector2.new(0, 0)
    Up_187.ResampleMode = Enum.ResamplerMode.Default
    Up_187.ScaleType = Enum.ScaleType.Stretch
    Up_187.SliceCenter = Rect.new(0, 0, 0, 0)
    Up_187.SliceScale = 1
    Up_187.TileSize = UDim2.new(1, 0, 1, 0)
    Up_187.HoverImage = ""
    Up_187.PressedImage = ""
    Up_187.Style = Enum.ButtonStyle.Custom
    Up_187.AutoButtonColor = false
    Up_187.Modal = false
    local Arrow_188 = Instance.new("Frame")
    Arrow_188.Parent = Up_187
    Arrow_188.Name = "Arrow"
    Arrow_188.Size = UDim2.new(0, 16, 0, 16)
    Arrow_188.Position = UDim2.new(0, 0, 0, 0)
    Arrow_188.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Arrow_188.BackgroundTransparency = 1
    Arrow_188.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Arrow_188.Style = Enum.FrameStyle.Custom
    local Frame_189 = Instance.new("Frame")
    Frame_189.Parent = Arrow_188
    Frame_189.Size = UDim2.new(0, 1, 0, 1)
    Frame_189.Position = UDim2.new(0, 8, 0, 6)
    Frame_189.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_189.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_189.BorderSizePixel = 0
    Frame_189.Style = Enum.FrameStyle.Custom
    local Frame_190 = Instance.new("Frame")
    Frame_190.Parent = Arrow_188
    Frame_190.Size = UDim2.new(0, 3, 0, 1)
    Frame_190.Position = UDim2.new(0, 7, 0, 7)
    Frame_190.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_190.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_190.BorderSizePixel = 0
    Frame_190.Style = Enum.FrameStyle.Custom
    local Frame_191 = Instance.new("Frame")
    Frame_191.Parent = Arrow_188
    Frame_191.Size = UDim2.new(0, 5, 0, 1)
    Frame_191.Position = UDim2.new(0, 6, 0, 8)
    Frame_191.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_191.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_191.BorderSizePixel = 0
    Frame_191.Style = Enum.FrameStyle.Custom
    local Frame_192 = Instance.new("Frame")
    Frame_192.Parent = Arrow_188
    Frame_192.Size = UDim2.new(0, 7, 0, 1)
    Frame_192.Position = UDim2.new(0, 5, 0, 9)
    Frame_192.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_192.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_192.BorderSizePixel = 0
    Frame_192.Style = Enum.FrameStyle.Custom
    local Down_193 = Instance.new("ImageButton")
    Down_193.Parent = ScrollBar_186
    Down_193.Name = "Down"
    Down_193.Size = UDim2.new(0, 16, 0, 16)
    Down_193.Position = UDim2.new(0, 0, 1, -16)
    Down_193.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Down_193.BackgroundTransparency = 1
    Down_193.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Down_193.BorderSizePixel = 0
    Down_193.Active = true
    Down_193.Selectable = true
    Down_193.Image = ""
    Down_193.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Down_193.ImageRectOffset = Vector2.new(0, 0)
    Down_193.ImageRectSize = Vector2.new(0, 0)
    Down_193.ResampleMode = Enum.ResamplerMode.Default
    Down_193.ScaleType = Enum.ScaleType.Stretch
    Down_193.SliceCenter = Rect.new(0, 0, 0, 0)
    Down_193.SliceScale = 1
    Down_193.TileSize = UDim2.new(1, 0, 1, 0)
    Down_193.HoverImage = ""
    Down_193.PressedImage = ""
    Down_193.Style = Enum.ButtonStyle.Custom
    Down_193.AutoButtonColor = false
    Down_193.Modal = false
    local Arrow_194 = Instance.new("Frame")
    Arrow_194.Parent = Down_193
    Arrow_194.Name = "Arrow"
    Arrow_194.Size = UDim2.new(0, 16, 0, 16)
    Arrow_194.Position = UDim2.new(0, 0, 0, 0)
    Arrow_194.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Arrow_194.BackgroundTransparency = 1
    Arrow_194.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Arrow_194.Style = Enum.FrameStyle.Custom
    local Frame_195 = Instance.new("Frame")
    Frame_195.Parent = Arrow_194
    Frame_195.Size = UDim2.new(0, 1, 0, 1)
    Frame_195.Position = UDim2.new(0, 8, 0, 10)
    Frame_195.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_195.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_195.BorderSizePixel = 0
    Frame_195.Style = Enum.FrameStyle.Custom
    local Frame_196 = Instance.new("Frame")
    Frame_196.Parent = Arrow_194
    Frame_196.Size = UDim2.new(0, 3, 0, 1)
    Frame_196.Position = UDim2.new(0, 7, 0, 9)
    Frame_196.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_196.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_196.BorderSizePixel = 0
    Frame_196.Style = Enum.FrameStyle.Custom
    local Frame_197 = Instance.new("Frame")
    Frame_197.Parent = Arrow_194
    Frame_197.Size = UDim2.new(0, 5, 0, 1)
    Frame_197.Position = UDim2.new(0, 6, 0, 8)
    Frame_197.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_197.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_197.BorderSizePixel = 0
    Frame_197.Style = Enum.FrameStyle.Custom
    local Frame_198 = Instance.new("Frame")
    Frame_198.Parent = Arrow_194
    Frame_198.Size = UDim2.new(0, 7, 0, 1)
    Frame_198.Position = UDim2.new(0, 5, 0, 7)
    Frame_198.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_198.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_198.BorderSizePixel = 0
    Frame_198.Style = Enum.FrameStyle.Custom
    local ImageButton_199 = Instance.new("ImageButton")
    ImageButton_199.Parent = ScrollBar_186
    ImageButton_199.Size = UDim2.new(1, 0, 1, -32)
    ImageButton_199.Position = UDim2.new(0, 0, 0, 16)
    ImageButton_199.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    ImageButton_199.BackgroundTransparency = 1
    ImageButton_199.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageButton_199.Active = true
    ImageButton_199.Selectable = true
    ImageButton_199.Image = ""
    ImageButton_199.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton_199.ImageRectOffset = Vector2.new(0, 0)
    ImageButton_199.ImageRectSize = Vector2.new(0, 0)
    ImageButton_199.ResampleMode = Enum.ResamplerMode.Default
    ImageButton_199.ScaleType = Enum.ScaleType.Stretch
    ImageButton_199.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageButton_199.SliceScale = 1
    ImageButton_199.TileSize = UDim2.new(1, 0, 1, 0)
    ImageButton_199.HoverImage = ""
    ImageButton_199.PressedImage = ""
    ImageButton_199.Style = Enum.ButtonStyle.Custom
    ImageButton_199.Modal = false
    local Frame_200 = Instance.new("Frame")
    Frame_200.Parent = ImageButton_199
    Frame_200.Size = UDim2.new(1, 0, 0.06299212574958801, 0)
    Frame_200.Position = UDim2.new(0, 0, 0.35433071851730347, 0)
    Frame_200.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Frame_200.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_200.BorderSizePixel = 0
    Frame_200.Style = Enum.FrameStyle.Custom
    local Markers_201 = Instance.new("Frame")
    Markers_201.Parent = ImageButton_199
    Markers_201.Name = "Markers"
    Markers_201.Size = UDim2.new(1, 0, 1, 0)
    Markers_201.Position = UDim2.new(0, 0, 0, 0)
    Markers_201.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Markers_201.BackgroundTransparency = 1
    Markers_201.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Markers_201.Style = Enum.FrameStyle.Custom
    local ScrollBar_202 = Instance.new("Frame")
    ScrollBar_202.Parent = Content_3
    ScrollBar_202.Name = "ScrollBar"
    ScrollBar_202.Size = UDim2.new(1, 0, 0, 16)
    ScrollBar_202.Position = UDim2.new(0, 0, 1, -16)
    ScrollBar_202.Visible = false
    ScrollBar_202.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ScrollBar_202.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ScrollBar_202.BorderSizePixel = 0
    ScrollBar_202.Active = true
    ScrollBar_202.Style = Enum.FrameStyle.Custom
    local Left_203 = Instance.new("ImageButton")
    Left_203.Parent = ScrollBar_202
    Left_203.Name = "Left"
    Left_203.Size = UDim2.new(0, 16, 0, 16)
    Left_203.Position = UDim2.new(0, 0, 0, 0)
    Left_203.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Left_203.BackgroundTransparency = 1
    Left_203.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Left_203.BorderSizePixel = 0
    Left_203.Active = true
    Left_203.Selectable = true
    Left_203.Image = ""
    Left_203.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Left_203.ImageRectOffset = Vector2.new(0, 0)
    Left_203.ImageRectSize = Vector2.new(0, 0)
    Left_203.ResampleMode = Enum.ResamplerMode.Default
    Left_203.ScaleType = Enum.ScaleType.Stretch
    Left_203.SliceCenter = Rect.new(0, 0, 0, 0)
    Left_203.SliceScale = 1
    Left_203.TileSize = UDim2.new(1, 0, 1, 0)
    Left_203.HoverImage = ""
    Left_203.PressedImage = ""
    Left_203.Style = Enum.ButtonStyle.Custom
    Left_203.AutoButtonColor = false
    Left_203.Modal = false
    local Arrow_204 = Instance.new("Frame")
    Arrow_204.Parent = Left_203
    Arrow_204.Name = "Arrow"
    Arrow_204.Size = UDim2.new(0, 16, 0, 16)
    Arrow_204.Position = UDim2.new(0, 0, 0, 0)
    Arrow_204.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Arrow_204.BackgroundTransparency = 1
    Arrow_204.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Arrow_204.Style = Enum.FrameStyle.Custom
    local Frame_205 = Instance.new("Frame")
    Frame_205.Parent = Arrow_204
    Frame_205.Size = UDim2.new(0, 1, 0, 1)
    Frame_205.Position = UDim2.new(0, 6, 0, 8)
    Frame_205.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_205.BackgroundTransparency = 0.5
    Frame_205.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_205.BorderSizePixel = 0
    Frame_205.Style = Enum.FrameStyle.Custom
    local Frame_206 = Instance.new("Frame")
    Frame_206.Parent = Arrow_204
    Frame_206.Size = UDim2.new(0, 1, 0, 3)
    Frame_206.Position = UDim2.new(0, 7, 0, 7)
    Frame_206.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_206.BackgroundTransparency = 0.5
    Frame_206.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_206.BorderSizePixel = 0
    Frame_206.Style = Enum.FrameStyle.Custom
    local Frame_207 = Instance.new("Frame")
    Frame_207.Parent = Arrow_204
    Frame_207.Size = UDim2.new(0, 1, 0, 5)
    Frame_207.Position = UDim2.new(0, 8, 0, 6)
    Frame_207.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_207.BackgroundTransparency = 0.5
    Frame_207.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_207.BorderSizePixel = 0
    Frame_207.Style = Enum.FrameStyle.Custom
    local Frame_208 = Instance.new("Frame")
    Frame_208.Parent = Arrow_204
    Frame_208.Size = UDim2.new(0, 1, 0, 7)
    Frame_208.Position = UDim2.new(0, 9, 0, 5)
    Frame_208.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_208.BackgroundTransparency = 0.5
    Frame_208.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_208.BorderSizePixel = 0
    Frame_208.Style = Enum.FrameStyle.Custom
    local Right_209 = Instance.new("ImageButton")
    Right_209.Parent = ScrollBar_202
    Right_209.Name = "Right"
    Right_209.Size = UDim2.new(0, 16, 0, 16)
    Right_209.Position = UDim2.new(1, -16, 0, 0)
    Right_209.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Right_209.BackgroundTransparency = 1
    Right_209.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Right_209.BorderSizePixel = 0
    Right_209.Active = true
    Right_209.Selectable = true
    Right_209.Image = ""
    Right_209.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Right_209.ImageRectOffset = Vector2.new(0, 0)
    Right_209.ImageRectSize = Vector2.new(0, 0)
    Right_209.ResampleMode = Enum.ResamplerMode.Default
    Right_209.ScaleType = Enum.ScaleType.Stretch
    Right_209.SliceCenter = Rect.new(0, 0, 0, 0)
    Right_209.SliceScale = 1
    Right_209.TileSize = UDim2.new(1, 0, 1, 0)
    Right_209.HoverImage = ""
    Right_209.PressedImage = ""
    Right_209.Style = Enum.ButtonStyle.Custom
    Right_209.AutoButtonColor = false
    Right_209.Modal = false
    local Arrow_210 = Instance.new("Frame")
    Arrow_210.Parent = Right_209
    Arrow_210.Name = "Arrow"
    Arrow_210.Size = UDim2.new(0, 16, 0, 16)
    Arrow_210.Position = UDim2.new(0, 0, 0, 0)
    Arrow_210.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Arrow_210.BackgroundTransparency = 1
    Arrow_210.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Arrow_210.Style = Enum.FrameStyle.Custom
    local Frame_211 = Instance.new("Frame")
    Frame_211.Parent = Arrow_210
    Frame_211.Size = UDim2.new(0, 1, 0, 1)
    Frame_211.Position = UDim2.new(0, 10, 0, 8)
    Frame_211.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_211.BackgroundTransparency = 0.5
    Frame_211.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_211.BorderSizePixel = 0
    Frame_211.Style = Enum.FrameStyle.Custom
    local Frame_212 = Instance.new("Frame")
    Frame_212.Parent = Arrow_210
    Frame_212.Size = UDim2.new(0, 1, 0, 3)
    Frame_212.Position = UDim2.new(0, 9, 0, 7)
    Frame_212.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_212.BackgroundTransparency = 0.5
    Frame_212.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_212.BorderSizePixel = 0
    Frame_212.Style = Enum.FrameStyle.Custom
    local Frame_213 = Instance.new("Frame")
    Frame_213.Parent = Arrow_210
    Frame_213.Size = UDim2.new(0, 1, 0, 5)
    Frame_213.Position = UDim2.new(0, 8, 0, 6)
    Frame_213.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_213.BackgroundTransparency = 0.5
    Frame_213.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_213.BorderSizePixel = 0
    Frame_213.Style = Enum.FrameStyle.Custom
    local Frame_214 = Instance.new("Frame")
    Frame_214.Parent = Arrow_210
    Frame_214.Size = UDim2.new(0, 1, 0, 7)
    Frame_214.Position = UDim2.new(0, 7, 0, 5)
    Frame_214.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_214.BackgroundTransparency = 0.5
    Frame_214.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_214.BorderSizePixel = 0
    Frame_214.Style = Enum.FrameStyle.Custom
    local ImageButton_215 = Instance.new("ImageButton")
    ImageButton_215.Parent = ScrollBar_202
    ImageButton_215.Size = UDim2.new(1, -32, 1, 0)
    ImageButton_215.Position = UDim2.new(0, 16, 0, 0)
    ImageButton_215.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    ImageButton_215.BackgroundTransparency = 1
    ImageButton_215.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageButton_215.Active = true
    ImageButton_215.Selectable = true
    ImageButton_215.Image = ""
    ImageButton_215.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton_215.ImageRectOffset = Vector2.new(0, 0)
    ImageButton_215.ImageRectSize = Vector2.new(0, 0)
    ImageButton_215.ResampleMode = Enum.ResamplerMode.Default
    ImageButton_215.ScaleType = Enum.ScaleType.Stretch
    ImageButton_215.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageButton_215.SliceScale = 1
    ImageButton_215.TileSize = UDim2.new(1, 0, 1, 0)
    ImageButton_215.HoverImage = ""
    ImageButton_215.PressedImage = ""
    ImageButton_215.Style = Enum.ButtonStyle.Custom
    ImageButton_215.Modal = false
    local Frame_216 = Instance.new("Frame")
    Frame_216.Parent = ImageButton_215
    Frame_216.Size = UDim2.new(1.5396825075149536, 0, 1, 0)
    Frame_216.Position = UDim2.new(0, 0, 0, 0)
    Frame_216.Visible = false
    Frame_216.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Frame_216.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_216.BorderSizePixel = 0
    Frame_216.Style = Enum.FrameStyle.Custom
    local Markers_217 = Instance.new("Frame")
    Markers_217.Parent = ImageButton_215
    Markers_217.Name = "Markers"
    Markers_217.Size = UDim2.new(1, 0, 1, 0)
    Markers_217.Position = UDim2.new(0, 0, 0, 0)
    Markers_217.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
    Markers_217.BackgroundTransparency = 1
    Markers_217.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Markers_217.Style = Enum.FrameStyle.Custom
    local TopBar_218 = Instance.new("TextButton")
    TopBar_218.Parent = Main_2
    TopBar_218.Name = "TopBar"
    TopBar_218.Size = UDim2.new(1, 0, 0, 20)
    TopBar_218.Position = UDim2.new(0, 0, 0, 0)
    TopBar_218.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
    TopBar_218.BorderColor3 = Color3.fromRGB(27, 42, 53)
    TopBar_218.BorderSizePixel = 0
    TopBar_218.Active = true
    TopBar_218.Selectable = true
    TopBar_218.Text = ""
    TopBar_218.TextSize = 8
    TopBar_218.Font = Enum.Font.Legacy
    TopBar_218.TextColor3 = Color3.fromRGB(27, 42, 53)
    TopBar_218.TextTruncate = Enum.TextTruncate.None
    TopBar_218.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    TopBar_218.LineHeight = 1
    TopBar_218.AutoButtonColor = false
    TopBar_218.Modal = false
    TopBar_218.Style = Enum.ButtonStyle.Custom
    local Title_219 = Instance.new("TextLabel")
    Title_219.Parent = TopBar_218
    Title_219.Name = "Title"
    Title_219.Size = UDim2.new(1, -10, 0, 20)
    Title_219.Position = UDim2.new(0, 5, 0, 0)
    Title_219.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_219.BackgroundTransparency = 1
    Title_219.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Title_219.Text = "Explorer"
    Title_219.TextSize = 14
    Title_219.Font = Enum.Font.SourceSans
    Title_219.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_219.TextXAlignment = Enum.TextXAlignment.Left
    Title_219.TextTruncate = Enum.TextTruncate.None
    Title_219.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Title_219.LineHeight = 1
    Title_219.MaxVisibleGraphemes = -1
    Title_219.AutoLocalize = true
    local Close_220 = Instance.new("TextButton")
    Close_220.Parent = TopBar_218
    Close_220.Name = "Close"
    Close_220.Size = UDim2.new(0, 16, 0, 16)
    Close_220.Position = UDim2.new(1, -18, 0, 2)
    Close_220.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Close_220.BackgroundTransparency = 1
    Close_220.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Close_220.BorderSizePixel = 0
    Close_220.Active = true
    Close_220.Selectable = true
    Close_220.Text = ""
    Close_220.TextSize = 14
    Close_220.Font = Enum.Font.SourceSans
    Close_220.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close_220.TextTruncate = Enum.TextTruncate.None
    Close_220.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Close_220.LineHeight = 1
    Close_220.AutoButtonColor = false
    Close_220.Modal = false
    Close_220.Style = Enum.ButtonStyle.Custom
    local ImageLabel_221 = Instance.new("ImageLabel")
    ImageLabel_221.Parent = Close_220
    ImageLabel_221.Size = UDim2.new(0, 10, 0, 10)
    ImageLabel_221.Position = UDim2.new(0, 3, 0, 3)
    ImageLabel_221.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_221.BackgroundTransparency = 1
    ImageLabel_221.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageLabel_221.Image = "rbxassetid://5054663650"
    ImageLabel_221.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_221.ImageRectOffset = Vector2.new(0, 0)
    ImageLabel_221.ImageRectSize = Vector2.new(0, 0)
    ImageLabel_221.ResampleMode = Enum.ResamplerMode.Default
    ImageLabel_221.ScaleType = Enum.ScaleType.Stretch
    ImageLabel_221.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageLabel_221.SliceScale = 1
    ImageLabel_221.TileSize = UDim2.new(1, 0, 1, 0)
    local Minimize_222 = Instance.new("TextButton")
    Minimize_222.Parent = TopBar_218
    Minimize_222.Name = "Minimize"
    Minimize_222.Size = UDim2.new(0, 16, 0, 16)
    Minimize_222.Position = UDim2.new(1, -36, 0, 2)
    Minimize_222.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    Minimize_222.BackgroundTransparency = 1
    Minimize_222.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Minimize_222.BorderSizePixel = 0
    Minimize_222.Active = true
    Minimize_222.Selectable = true
    Minimize_222.Text = ""
    Minimize_222.TextSize = 14
    Minimize_222.Font = Enum.Font.SourceSans
    Minimize_222.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minimize_222.TextTruncate = Enum.TextTruncate.None
    Minimize_222.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    Minimize_222.LineHeight = 1
    Minimize_222.AutoButtonColor = false
    Minimize_222.Modal = false
    Minimize_222.Style = Enum.ButtonStyle.Custom
    local ImageLabel_223 = Instance.new("ImageLabel")
    ImageLabel_223.Parent = Minimize_222
    ImageLabel_223.Size = UDim2.new(0, 10, 0, 10)
    ImageLabel_223.Position = UDim2.new(0, 3, 0, 3)
    ImageLabel_223.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_223.BackgroundTransparency = 1
    ImageLabel_223.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ImageLabel_223.Image = "rbxassetid://5448127505"
    ImageLabel_223.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_223.ImageRectOffset = Vector2.new(0, 0)
    ImageLabel_223.ImageRectSize = Vector2.new(0, 0)
    ImageLabel_223.ResampleMode = Enum.ResamplerMode.Default
    ImageLabel_223.ScaleType = Enum.ScaleType.Stretch
    ImageLabel_223.SliceCenter = Rect.new(0, 0, 0, 0)
    ImageLabel_223.SliceScale = 1
    ImageLabel_223.TileSize = UDim2.new(1, 0, 1, 0)
    local UICorner_224 = Instance.new("UICorner")
    UICorner_224.Parent = Minimize_222
    UICorner_224.CornerRadius = UDim.new(0, 4)
    local UICorner_225 = Instance.new("UICorner")
    UICorner_225.Parent = Main_2
    UICorner_225.CornerRadius = UDim.new(0, 4)
    local Outlines_226 = Instance.new("ImageLabel")
    Outlines_226.Parent = Main_2
    Outlines_226.Name = "Outlines"
    Outlines_226.Size = UDim2.new(1, 10, 1, 10)
    Outlines_226.Position = UDim2.new(0, -5, 0, -5)
    Outlines_226.Visible = false
    Outlines_226.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Outlines_226.BackgroundTransparency = 1
    Outlines_226.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Outlines_226.BorderSizePixel = 0
    Outlines_226.Image = "rbxassetid://1427967925"
    Outlines_226.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Outlines_226.ImageRectOffset = Vector2.new(0, 0)
    Outlines_226.ImageRectSize = Vector2.new(0, 0)
    Outlines_226.ResampleMode = Enum.ResamplerMode.Default
    Outlines_226.ScaleType = Enum.ScaleType.Slice
    Outlines_226.SliceCenter = Rect.new(6, 6, 25, 25)
    Outlines_226.SliceScale = 1
    Outlines_226.TileSize = UDim2.new(0, 20, 0, 20)
    local ResizeControls_227 = Instance.new("Frame")
    ResizeControls_227.Parent = Main_2
    ResizeControls_227.Name = "ResizeControls"
    ResizeControls_227.Size = UDim2.new(1, 10, 1, 10)
    ResizeControls_227.Position = UDim2.new(0, -5, 0, -5)
    ResizeControls_227.Visible = false
    ResizeControls_227.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ResizeControls_227.BackgroundTransparency = 1
    ResizeControls_227.BorderColor3 = Color3.fromRGB(27, 42, 53)
    ResizeControls_227.Style = Enum.FrameStyle.Custom
    local North_228 = Instance.new("TextButton")
    North_228.Parent = ResizeControls_227
    North_228.Name = "North"
    North_228.Size = UDim2.new(1, -10, 0, 5)
    North_228.Position = UDim2.new(0, 5, 0, 0)
    North_228.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    North_228.BackgroundTransparency = 1
    North_228.BorderColor3 = Color3.fromRGB(27, 42, 53)
    North_228.BorderSizePixel = 0
    North_228.Active = true
    North_228.Selectable = true
    North_228.Text = ""
    North_228.TextSize = 14
    North_228.Font = Enum.Font.SourceSans
    North_228.TextColor3 = Color3.fromRGB(0, 0, 0)
    North_228.TextTruncate = Enum.TextTruncate.None
    North_228.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    North_228.LineHeight = 1
    North_228.AutoButtonColor = false
    North_228.Modal = false
    North_228.Style = Enum.ButtonStyle.Custom
    local South_229 = Instance.new("TextButton")
    South_229.Parent = ResizeControls_227
    South_229.Name = "South"
    South_229.Size = UDim2.new(1, -10, 0, 5)
    South_229.Position = UDim2.new(0, 5, 1, -5)
    South_229.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    South_229.BackgroundTransparency = 1
    South_229.BorderColor3 = Color3.fromRGB(27, 42, 53)
    South_229.BorderSizePixel = 0
    South_229.Active = true
    South_229.Selectable = true
    South_229.Text = ""
    South_229.TextSize = 14
    South_229.Font = Enum.Font.SourceSans
    South_229.TextColor3 = Color3.fromRGB(0, 0, 0)
    South_229.TextTruncate = Enum.TextTruncate.None
    South_229.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    South_229.LineHeight = 1
    South_229.AutoButtonColor = false
    South_229.Modal = false
    South_229.Style = Enum.ButtonStyle.Custom
    local NorthEast_230 = Instance.new("TextButton")
    NorthEast_230.Parent = ResizeControls_227
    NorthEast_230.Name = "NorthEast"
    NorthEast_230.Size = UDim2.new(0, 5, 0, 5)
    NorthEast_230.Position = UDim2.new(1, -5, 0, 0)
    NorthEast_230.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    NorthEast_230.BackgroundTransparency = 1
    NorthEast_230.BorderColor3 = Color3.fromRGB(27, 42, 53)
    NorthEast_230.BorderSizePixel = 0
    NorthEast_230.Active = true
    NorthEast_230.Selectable = true
    NorthEast_230.Text = ""
    NorthEast_230.TextSize = 14
    NorthEast_230.Font = Enum.Font.SourceSans
    NorthEast_230.TextColor3 = Color3.fromRGB(0, 0, 0)
    NorthEast_230.TextTruncate = Enum.TextTruncate.None
    NorthEast_230.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    NorthEast_230.LineHeight = 1
    NorthEast_230.AutoButtonColor = false
    NorthEast_230.Modal = false
    NorthEast_230.Style = Enum.ButtonStyle.Custom
    local East_231 = Instance.new("TextButton")
    East_231.Parent = ResizeControls_227
    East_231.Name = "East"
    East_231.Size = UDim2.new(0, 5, 1, -10)
    East_231.Position = UDim2.new(1, -5, 0, 5)
    East_231.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    East_231.BackgroundTransparency = 1
    East_231.BorderColor3 = Color3.fromRGB(27, 42, 53)
    East_231.BorderSizePixel = 0
    East_231.Active = true
    East_231.Selectable = true
    East_231.Text = ""
    East_231.TextSize = 14
    East_231.Font = Enum.Font.SourceSans
    East_231.TextColor3 = Color3.fromRGB(0, 0, 0)
    East_231.TextTruncate = Enum.TextTruncate.None
    East_231.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    East_231.LineHeight = 1
    East_231.AutoButtonColor = false
    East_231.Modal = false
    East_231.Style = Enum.ButtonStyle.Custom
    local West_232 = Instance.new("TextButton")
    West_232.Parent = ResizeControls_227
    West_232.Name = "West"
    West_232.Size = UDim2.new(0, 5, 1, -10)
    West_232.Position = UDim2.new(0, 0, 0, 5)
    West_232.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    West_232.BackgroundTransparency = 1
    West_232.BorderColor3 = Color3.fromRGB(27, 42, 53)
    West_232.BorderSizePixel = 0
    West_232.Active = true
    West_232.Selectable = true
    West_232.Text = ""
    West_232.TextSize = 14
    West_232.Font = Enum.Font.SourceSans
    West_232.TextColor3 = Color3.fromRGB(0, 0, 0)
    West_232.TextTruncate = Enum.TextTruncate.None
    West_232.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    West_232.LineHeight = 1
    West_232.AutoButtonColor = false
    West_232.Modal = false
    West_232.Style = Enum.ButtonStyle.Custom
    local SouthEast_233 = Instance.new("TextButton")
    SouthEast_233.Parent = ResizeControls_227
    SouthEast_233.Name = "SouthEast"
    SouthEast_233.Size = UDim2.new(0, 5, 0, 5)
    SouthEast_233.Position = UDim2.new(1, -5, 1, -5)
    SouthEast_233.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SouthEast_233.BackgroundTransparency = 1
    SouthEast_233.BorderColor3 = Color3.fromRGB(27, 42, 53)
    SouthEast_233.BorderSizePixel = 0
    SouthEast_233.Active = true
    SouthEast_233.Selectable = true
    SouthEast_233.Text = ""
    SouthEast_233.TextSize = 14
    SouthEast_233.Font = Enum.Font.SourceSans
    SouthEast_233.TextColor3 = Color3.fromRGB(0, 0, 0)
    SouthEast_233.TextTruncate = Enum.TextTruncate.None
    SouthEast_233.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    SouthEast_233.LineHeight = 1
    SouthEast_233.AutoButtonColor = false
    SouthEast_233.Modal = false
    SouthEast_233.Style = Enum.ButtonStyle.Custom
    local NorthWest_234 = Instance.new("TextButton")
    NorthWest_234.Parent = ResizeControls_227
    NorthWest_234.Name = "NorthWest"
    NorthWest_234.Size = UDim2.new(0, 5, 0, 5)
    NorthWest_234.Position = UDim2.new(0, 0, 0, 0)
    NorthWest_234.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    NorthWest_234.BackgroundTransparency = 1
    NorthWest_234.BorderColor3 = Color3.fromRGB(27, 42, 53)
    NorthWest_234.BorderSizePixel = 0
    NorthWest_234.Active = true
    NorthWest_234.Selectable = true
    NorthWest_234.Text = ""
    NorthWest_234.TextSize = 14
    NorthWest_234.Font = Enum.Font.SourceSans
    NorthWest_234.TextColor3 = Color3.fromRGB(0, 0, 0)
    NorthWest_234.TextTruncate = Enum.TextTruncate.None
    NorthWest_234.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    NorthWest_234.LineHeight = 1
    NorthWest_234.AutoButtonColor = false
    NorthWest_234.Modal = false
    NorthWest_234.Style = Enum.ButtonStyle.Custom
    local SouthWest_235 = Instance.new("TextButton")
    SouthWest_235.Parent = ResizeControls_227
    SouthWest_235.Name = "SouthWest"
    SouthWest_235.Size = UDim2.new(0, 5, 0, 5)
    SouthWest_235.Position = UDim2.new(0, 0, 1, -5)
    SouthWest_235.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SouthWest_235.BackgroundTransparency = 1
    SouthWest_235.BorderColor3 = Color3.fromRGB(27, 42, 53)
    SouthWest_235.BorderSizePixel = 0
    SouthWest_235.Active = true
    SouthWest_235.Selectable = true
    SouthWest_235.Text = ""
    SouthWest_235.TextSize = 14
    SouthWest_235.Font = Enum.Font.SourceSans
    SouthWest_235.TextColor3 = Color3.fromRGB(0, 0, 0)
    SouthWest_235.TextTruncate = Enum.TextTruncate.None
    SouthWest_235.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    SouthWest_235.LineHeight = 1
    SouthWest_235.AutoButtonColor = false
    SouthWest_235.Modal = false
    SouthWest_235.Style = Enum.ButtonStyle.Custom
    Exp_1.Parent = playerGui
    return Exp_1
end


-- ── Init & Logic ────────────────────────────────────────
local gui      = createGui()
local root     = gui
local content  = root:FindFirstChild("Main"):FindFirstChild("Content")
local list     = content:FindFirstChild("List")
local toolbar  = content:FindFirstChild("ToolBar")
local searchFrame = toolbar:FindFirstChild("SearchFrame")
local searchInput = searchFrame:FindFirstChild("SearchBox"):FindFirstChild("Input")
local resetBtn    = searchFrame:FindFirstChild("Reset")
local refreshBtn  = toolbar:FindFirstChild("Refresh")
local scrollBar   = content:FindFirstChild("ScrollBar")
local scrollCorner= content:FindFirstChild("ScrollCorner")
local renameBox   = list:FindFirstChild("RenameBox")

-- Make refresh button visible
refreshBtn.Visible = true

-- ── Constants ──────────────────────────────────────────
local ROW_H        = 17
local INDENT_PER   = 14
local ICON_MAP_ID  = "http://www.roblox.com/asset/?id=135148380892747"
local EXPAND_IMG   = "rbxassetid://6511490623"
local ICON_SIZE    = Vector2.new(32, 32)

-- Class → sprite offset on the Roblox icon sheet (32px grid)
local CLASS_ICONS = {
    Folder              = Vector2.new(96,  96),
    Model               = Vector2.new(0,   32),
    Part                = Vector2.new(128, 32),
    MeshPart            = Vector2.new(128, 32),
    UnionOperation      = Vector2.new(128, 32),
    SpecialMesh         = Vector2.new(128, 32),
    WedgePart           = Vector2.new(128, 32),
    BasePart            = Vector2.new(128, 32),
    Humanoid            = Vector2.new(0,   160),
    HumanoidRootPart    = Vector2.new(128, 32),
    Script              = Vector2.new(0,   64),
    LocalScript         = Vector2.new(32,  64),
    ModuleScript        = Vector2.new(64,  64),
    RemoteEvent         = Vector2.new(192, 128),
    RemoteFunction      = Vector2.new(224, 128),
    BindableEvent       = Vector2.new(192, 128),
    BindableFunction    = Vector2.new(224, 128),
    StringValue         = Vector2.new(64,  192),
    IntValue            = Vector2.new(64,  192),
    BoolValue           = Vector2.new(64,  192),
    NumberValue         = Vector2.new(64,  192),
    ObjectValue         = Vector2.new(64,  192),
    Sound               = Vector2.new(192, 32),
    SoundGroup          = Vector2.new(192, 32),
    Animation           = Vector2.new(224, 32),
    Camera              = Vector2.new(160, 0),
    Workspace           = Vector2.new(0,   0),
    Players             = Vector2.new(96,  0),
    Player              = Vector2.new(96,  32),
    ReplicatedStorage   = Vector2.new(160, 32),
    ReplicatedFirst     = Vector2.new(160, 32),
    StarterGui          = Vector2.new(128, 0),
    StarterPack         = Vector2.new(160, 64),
    StarterPlayer       = Vector2.new(96,  64),
    Lighting            = Vector2.new(64,  0),
    SoundService        = Vector2.new(192, 0),
    Teams               = Vector2.new(224, 0),
    TextLabel           = Vector2.new(192, 64),
    TextButton          = Vector2.new(192, 64),
    TextBox             = Vector2.new(192, 64),
    ImageLabel          = Vector2.new(160, 96),
    ImageButton         = Vector2.new(160, 96),
    Frame               = Vector2.new(224, 64),
    ScreenGui           = Vector2.new(96,  128),
    SurfaceGui          = Vector2.new(128, 128),
    BillboardGui        = Vector2.new(64,  128),
    UIListLayout        = Vector2.new(128, 192),
    UIGridLayout        = Vector2.new(128, 192),
    UICorner            = Vector2.new(128, 192),
    UIStroke            = Vector2.new(128, 192),
    UIPadding           = Vector2.new(128, 192),
    Decal               = Vector2.new(32,  96),
    Texture             = Vector2.new(32,  96),
    PointLight          = Vector2.new(224, 96),
    SpotLight           = Vector2.new(224, 96),
    SurfaceLight        = Vector2.new(224, 96),
    Weld                = Vector2.new(0,   192),
    WeldConstraint      = Vector2.new(0,   192),
    Motor6D             = Vector2.new(0,   192),
    ProximityPrompt     = Vector2.new(32,  160),
    ClickDetector       = Vector2.new(0,   128),
    VehicleSeat         = Vector2.new(32,  32),
    Seat                = Vector2.new(32,  32),
    Tool                = Vector2.new(64,  32),
    Configuration       = Vector2.new(128, 96),
    ServerStorage       = Vector2.new(192, 32),
    ServerScriptService = Vector2.new(160, 0),
}
local DEFAULT_ICON = Vector2.new(128, 192)

-- ── State ──────────────────────────────────────────────
local treeRoot     = game
local expanded     = {}   -- [instance] = true/false
local selected     = nil  -- currently selected instance
local rows         = {}   -- flat ordered list of visible {inst, depth}
local rowFrames    = {}   -- rendered TextButton frames
local scrollOffset = 0
local filterText   = ""

-- Scrollbar state
local sbDragging   = false
local sbDragStart  = nil
local sbDragOff    = nil

-- Context menu
local ctxMenu = nil

-- ── Helpers ────────────────────────────────────────────
local UIS = game:GetService("UserInputService")
local TS  = game:GetService("TweenService")

local function hasChildren(inst)
    return #inst:GetChildren() > 0
end

local function getIconOffset(inst)
    local ok, cls = pcall(function() return inst.ClassName end)
    if not ok then return DEFAULT_ICON end
    return CLASS_ICONS[cls] or DEFAULT_ICON
end

local function getVisibleHeight()
    return content.AbsoluteSize.Y - 23
end

local function maxScroll()
    local total = #rows * ROW_H
    local vis   = getVisibleHeight()
    return math.max(0, total - vis)
end

local function clampScroll(v)
    return math.clamp(v, 0, maxScroll())
end

-- ── Build flat visible row list ────────────────────────
local function buildRows(inst, depth, result)
    depth = depth or 0
    result = result or {}
    -- apply search filter: only include if name matches (always include when no filter)
    local name = inst.Name or ""
    if filterText == "" or name:lower():find(filterText:lower(), 1, true) then
        table.insert(result, {inst=inst, depth=depth})
    end
    if expanded[inst] then
        local ok, children = pcall(function() return inst:GetChildren() end)
        if ok then
            for _, child in ipairs(children) do
                buildRows(child, depth + 1, result)
            end
        end
    end
    return result
end

-- ── Destroy context menu ───────────────────────────────
local function closeCtx()
    if ctxMenu then
        ctxMenu:Destroy()
        ctxMenu = nil
    end
end

-- ── Render rows ────────────────────────────────────────
local function renderRows()
    -- clear existing row frames
    for _, f in ipairs(rowFrames) do
        pcall(function() f:Destroy() end)
    end
    rowFrames = {}

    local visH   = getVisibleHeight()
    local startI = math.floor(scrollOffset / ROW_H) + 1
    local endI   = math.min(#rows, startI + math.ceil(visH / ROW_H) + 1)

    for i = startI, endI do
        local row = rows[i]
        if not row then break end
        local inst  = row.inst
        local depth = row.depth
        local yPos  = (i - 1) * ROW_H - scrollOffset

        local isSelected = (inst == selected)

        local entry = Instance.new("TextButton")
        entry.Size = UDim2.new(1, 0, 0, ROW_H)
        entry.Position = UDim2.fromOffset(0, yPos)
        entry.BackgroundColor3 = isSelected
            and Color3.fromRGB(0, 120, 215)
            or  Color3.fromRGB(0, 0, 0)
        entry.BackgroundTransparency = isSelected and 0.1 or 1
        entry.BorderSizePixel = 0
        entry.Text = ""
        entry.AutoButtonColor = false
        entry.ZIndex = 1
        entry.Parent = list

        -- indent frame
        local indentX = depth * INDENT_PER + 4
        local indent = Instance.new("Frame")
        indent.Size = UDim2.new(1, -indentX, 1, 0)
        indent.Position = UDim2.fromOffset(indentX, 0)
        indent.BackgroundTransparency = 1
        indent.BorderSizePixel = 0
        indent.ZIndex = 2
        indent.Parent = entry

        -- expand arrow
        local hasKids = hasChildren(inst)
        if hasKids then
            local expBtn = Instance.new("TextButton")
            expBtn.Size = UDim2.fromOffset(16, ROW_H)
            expBtn.Position = UDim2.fromOffset(-16, 0)
            expBtn.BackgroundTransparency = 1
            expBtn.BorderSizePixel = 0
            expBtn.Text = expanded[inst] and "▾" or "▸"
            expBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            expBtn.Font = Enum.Font.SourceSansBold
            expBtn.TextSize = 11
            expBtn.ZIndex = 3
            expBtn.Parent = indent
            expBtn.MouseButton1Click:Connect(function()
                closeCtx()
                expanded[inst] = not expanded[inst]
                rows = buildRows(treeRoot)
                renderRows()
                updateScrollBar()
            end)
        end

        -- class icon
        local iconHolder = Instance.new("ImageLabel")
        iconHolder.Size = UDim2.fromOffset(16, 16)
        iconHolder.Position = UDim2.fromOffset(4, 0)
        iconHolder.BackgroundTransparency = 1
        iconHolder.BorderSizePixel = 0
        iconHolder.ClipsDescendants = true
        iconHolder.ZIndex = 3
        iconHolder.Parent = indent
        local iconMap = Instance.new("ImageLabel")
        iconMap.Size = UDim2.fromOffset(16, 16)
        iconMap.BackgroundTransparency = 1
        iconMap.Image = ICON_MAP_ID
        iconMap.ImageRectOffset = getIconOffset(inst)
        iconMap.ImageRectSize = ICON_SIZE
        iconMap.ScaleType = Enum.ScaleType.Stretch
        iconMap.ZIndex = 3
        iconMap.Parent = iconHolder

        -- name label
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, -26, 1, 0)
        nameLabel.Position = UDim2.fromOffset(24, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = inst.Name or "?"
        nameLabel.TextSize = 13
        nameLabel.Font = Enum.Font.SourceSans
        nameLabel.TextColor3 = isSelected
            and Color3.fromRGB(255, 255, 255)
            or  Color3.fromRGB(210, 210, 210)
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.ZIndex = 3
        nameLabel.Parent = indent

        table.insert(rowFrames, entry)

        -- single click = select
        entry.MouseButton1Click:Connect(function()
            closeCtx()
            selected = inst
            rows = buildRows(treeRoot)
            renderRows()
        end)

        -- double click = expand/collapse
        local lastClick = 0
        entry.MouseButton1Down:Connect(function()
            local now = tick()
            if now - lastClick < 0.3 and hasKids then
                expanded[inst] = not expanded[inst]
                rows = buildRows(treeRoot)
                renderRows()
                updateScrollBar()
            end
            lastClick = now
        end)

        -- right click = context menu
        entry.MouseButton2Click:Connect(function()
            closeCtx()
            local mp = UIS:GetMouseLocation()
            local menu = Instance.new("Frame")
            menu.Size = UDim2.fromOffset(160, 0)
            menu.AutomaticSize = Enum.AutomaticSize.Y
            menu.Position = UDim2.fromOffset(mp.X - gui.Main.AbsolutePosition.X, mp.Y - gui.Main.AbsolutePosition.Y)
            menu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            menu.BorderSizePixel = 1
            menu.BorderColor3 = Color3.fromRGB(60, 60, 60)
            menu.ZIndex = 20
            menu.Parent = gui:FindFirstChild("Main")
            local layout = Instance.new("UIListLayout")
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Parent = menu
            ctxMenu = menu

            local function ctxItem(label, order, fn)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 0, 20)
                btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                btn.BackgroundTransparency = 0
                btn.BorderSizePixel = 0
                btn.Text = "  " .. label
                btn.TextSize = 13
                btn.Font = Enum.Font.SourceSans
                btn.TextColor3 = Color3.fromRGB(210, 210, 210)
                btn.TextXAlignment = Enum.TextXAlignment.Left
                btn.AutoButtonColor = false
                btn.LayoutOrder = order
                btn.ZIndex = 21
                btn.Parent = menu
                btn.MouseEnter:Connect(function()
                    btn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
                end)
                btn.MouseLeave:Connect(function()
                    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                end)
                btn.MouseButton1Click:Connect(function()
                    closeCtx()
                    fn()
                end)
            end

            local function getPath(i)
                local parts = {}
                local cur = i
                while cur and cur ~= game do
                    table.insert(parts, 1, cur.Name)
                    cur = cur.Parent
                end
                table.insert(parts, 1, "game")
                return table.concat(parts, ".")
            end

            ctxItem("Copy Name",      1, function()
                if setclipboard then pcall(setclipboard, inst.Name) end
            end)
            ctxItem("Copy Path",      2, function()
                if setclipboard then pcall(setclipboard, getPath(inst)) end
            end)
            ctxItem("Copy ClassName", 3, function()
                local ok, cls = pcall(function() return inst.ClassName end)
                if ok and setclipboard then pcall(setclipboard, cls) end
            end)
            ctxItem("──────────────", 4, function() end)
            ctxItem("Expand All",     5, function()
                local function expandAll(i2)
                    if hasChildren(i2) then
                        expanded[i2] = true
                        local ok, kids = pcall(function() return i2:GetChildren() end)
                        if ok then for _, k in ipairs(kids) do expandAll(k) end end
                    end
                end
                expandAll(inst)
                rows = buildRows(treeRoot)
                renderRows()
                updateScrollBar()
            end)
            ctxItem("Collapse All",   6, function()
                local function collapseAll(i2)
                    expanded[i2] = false
                    local ok, kids = pcall(function() return i2:GetChildren() end)
                    if ok then for _, k in ipairs(kids) do collapseAll(k) end end
                end
                collapseAll(inst)
                rows = buildRows(treeRoot)
                renderRows()
                updateScrollBar()
            end)

            -- close on click elsewhere
            task.delay(0, function()
                local conn
                conn = UIS.InputBegan:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 or
                       inp.UserInputType == Enum.UserInputType.MouseButton2 then
                        task.defer(function()
                            closeCtx()
                            conn:Disconnect()
                        end)
                    end
                end)
            end)
        end)
    end
end

-- ── Scrollbar ──────────────────────────────────────────
function updateScrollBar()
    local total  = #rows * ROW_H
    local visH   = getVisibleHeight()
    if total <= visH then
        scrollBar.Visible   = false
        scrollCorner.Visible = false
        return
    end
    scrollBar.Visible   = true
    scrollCorner.Visible = true

    local track  = scrollBar:FindFirstChild("Track")
    local thumb  = scrollBar:FindFirstChild("Thumb")
    if not track or not thumb then return end

    local trackH = track.AbsoluteSize.Y
    local ratio  = math.clamp(visH / total, 0.05, 1)
    local thumbH = math.max(20, trackH * ratio)
    local range  = trackH - thumbH
    local pct    = (maxScroll() > 0) and (scrollOffset / maxScroll()) or 0
    thumb.Size   = UDim2.new(1, 0, 0, thumbH)
    thumb.Position = UDim2.fromOffset(0, range * pct)
end

-- ── Mouse wheel scroll ─────────────────────────────────
list.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        scrollOffset = clampScroll(scrollOffset - input.Position.Z * ROW_H * 3)
        rows = buildRows(treeRoot)
        renderRows()
        updateScrollBar()
    end
end)

-- ── Build / wire scrollbar thumb ──────────────────────
local function buildScrollBarUI()
    -- clear old children except Up/Down if present
    for _, c in ipairs(scrollBar:GetChildren()) do
        if c.Name ~= "Up" and c.Name ~= "Down" then c:Destroy() end
    end
    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, 0, 1, -32)
    track.Position = UDim2.fromOffset(0, 16)
    track.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    track.BorderSizePixel = 0
    track.Parent = scrollBar

    local thumb = Instance.new("Frame")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(1, -2, 0, 40)
    thumb.Position = UDim2.fromOffset(1, 0)
    thumb.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    thumb.BorderSizePixel = 0
    thumb.Parent = track

    -- drag
    thumb.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            sbDragging = true
            sbDragStart = inp.Position.Y
            sbDragOff   = scrollOffset
        end
    end)
    UIS.InputChanged:Connect(function(inp)
        if sbDragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local trackH = track.AbsoluteSize.Y
            local thumbH = thumb.AbsoluteSize.Y
            local range  = math.max(1, trackH - thumbH)
            local dy     = inp.Position.Y - sbDragStart
            scrollOffset = clampScroll(sbDragOff + (dy / range) * maxScroll())
            rows = buildRows(treeRoot)
            renderRows()
            updateScrollBar()
        end
    end)
    UIS.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            sbDragging = false
        end
    end)

    -- up/down buttons if they exist
    local upBtn = scrollBar:FindFirstChild("Up")
    local dnBtn = scrollBar:FindFirstChild("Down")
    if upBtn then
        upBtn.MouseButton1Click:Connect(function()
            scrollOffset = clampScroll(scrollOffset - ROW_H * 3)
            rows = buildRows(treeRoot)
            renderRows()
            updateScrollBar()
        end)
    end
    if dnBtn then
        dnBtn.MouseButton1Click:Connect(function()
            scrollOffset = clampScroll(scrollOffset + ROW_H * 3)
            rows = buildRows(treeRoot)
            renderRows()
            updateScrollBar()
        end)
    end
end

-- ── Search ─────────────────────────────────────────────
searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    filterText   = searchInput.Text
    scrollOffset = 0
    rows = buildRows(treeRoot)
    renderRows()
    updateScrollBar()
end)

resetBtn.MouseButton1Click:Connect(function()
    searchInput.Text = ""
    filterText       = ""
    scrollOffset     = 0
    rows = buildRows(treeRoot)
    renderRows()
    updateScrollBar()
end)

-- ── Refresh ────────────────────────────────────────────
refreshBtn.MouseButton1Click:Connect(function()
    expanded     = {}
    scrollOffset = 0
    selected     = nil
    rows = buildRows(treeRoot)
    renderRows()
    updateScrollBar()
end)

-- ── Drag (title bar) ───────────────────────────────────
local main     = gui:FindFirstChild("Main")
local title    = main:FindFirstChild("Title") or content:FindFirstChild("ToolBar")
local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging  = true
        dragStart = inp.Position
        startPos  = main.Position
    end
end)
UIS.InputChanged:Connect(function(inp)
    if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
        local d = inp.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + d.X,
            startPos.Y.Scale, startPos.Y.Offset + d.Y
        )
    end
end)
UIS.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- ── Initial render ─────────────────────────────────────
expanded[treeRoot] = true   -- expand game by default
buildScrollBarUI()
rows = buildRows(treeRoot)
renderRows()
updateScrollBar()
