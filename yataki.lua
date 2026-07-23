    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.ClipsDescendants = true
    Frame.ZIndex = 1
    Frame.Parent = GlowHolder

    local FrameCorner = Instance.new("UICorner") FrameCorner.CornerRadius = UDim.new(0, 14) FrameCorner.Parent = Frame

    local DragHandle = Instance.new("TextButton")
    DragHandle.Size = UDim2.new(1, 0, 0, 24)
    DragHandle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    DragHandle.BackgroundTransparency = 0.5
    DragHandle.BorderSizePixel = 0
    DragHandle.TextColor3 = Color3.fromRGB(240, 240, 240)
    DragHandle.TextSize = 10
    DragHandle.Font = Enum.Font.GothamBold
    DragHandle.Text = "=== [ YATAKI20 EVADE SCRIPT ] ==="
    DragHandle.ZIndex = 5
    DragHandle.Parent = Frame

    local DragCorner = Instance.new("UICorner") DragCorner.CornerRadius = UDim.new(0, 14) DragCorner.Parent = DragHandle

    local HeaderFrame = Instance.new("Frame")
    HeaderFrame.Size = UDim2.new(1, -16, 0, 46)
    HeaderFrame.Position = UDim2.new(0, 8, 0, 30)
    HeaderFrame.BackgroundTransparency = 1
    HeaderFrame.ZIndex = 2
    HeaderFrame.Parent = Frame

    local ProfileImg = Instance.new("ImageLabel")
    ProfileImg.Size = UDim2.new(0, 38, 0, 38)
    ProfileImg.Position = UDim2.new(0, 0, 0, 4)
    ProfileImg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ProfileImg.ZIndex = 2
    ProfileImg.Parent = HeaderFrame

    task.spawn(function()
        local success, content = pcall(function()
            return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end)
        if success and ProfileImg then ProfileImg.Image = content end
    end)

    local ImgCorner = Instance.new("UICorner") ImgCorner.CornerRadius = UDim.new(1, 0) ImgCorner.Parent = ProfileImg

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -44, 0, 16)
    NameLabel.Position = UDim2.new(0, 44, 0, 3)
    NameLabel.BackgroundTransparency = 1
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 11
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Text = LocalPlayer.Name
    NameLabel.ZIndex = 2
    NameLabel.Parent = HeaderFrame

    local IdLabel = Instance.new("TextLabel")
    IdLabel.Size = UDim2.new(1, -44, 0, 14)
    IdLabel.Position = UDim2.new(0, 44, 0, 18)
    IdLabel.BackgroundTransparency = 1
    IdLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    IdLabel.TextSize = 9
    IdLabel.Font = Enum.Font.Gotham
    IdLabel.TextXAlignment = Enum.TextXAlignment.Left
    IdLabel.Text = "ID: " .. tostring(LocalPlayer.UserId)
    IdLabel.ZIndex = 2
    IdLabel.Parent = HeaderFrame

    -- Dito nakalagay ang pangalan mong yataki20 nang lantaran at malinaw!
    local BuildLabel = Instance.new("TextLabel")
    BuildLabel.Size = UDim2.new(1, -44, 0, 14)
    BuildLabel.Position = UDim2.new(0, 44, 0, 30)
    BuildLabel.BackgroundTransparency = 1
    BuildLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    BuildLabel.TextSize = 10
    BuildLabel.Font = Enum.Font.GothamBold
    BuildLabel.TextXAlignment = Enum.TextXAlignment.Left
    BuildLabel.Text = "Owner: yataki20"
    BuildLabel.ZIndex = 2
    BuildLabel.Parent = HeaderFrame

    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, -16, 0, 30)
    TabBar.Position = UDim2.new(0, 8, 0, 82)
    TabBar.BackgroundTransparency = 1
    TabBar.ZIndex = 2
    TabBar.Parent = Frame

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 4)
    TabListLayout.Parent = TabBar

    local function createTabButton(name, order)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.23, 0, 1, 0)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = Color3.fromRGB(180, 180, 180)
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamBold
        btn.Text = name
        btn.LayoutOrder = order
        btn.ZIndex = 2
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 6) corner.Parent = btn
        btn.Parent = TabBar
        return btn
    end

    local Tab1Btn = createTabButton("Main", 1)
    local Tab2Btn = createTabButton("Visuals", 2)
    local Tab3Btn = createTabButton("Misc", 3)
    local Tab4Btn = createTabButton("Settings", 4)

    local PagesContainer = Instance.new("Frame")
    PagesContainer.Size = UDim2.new(1, -16, 0, 245)
    PagesContainer.Position = UDim2.new(0, 8, 0, 120)
    PagesContainer.BackgroundTransparency = 1
    PagesContainer.ZIndex = 2
    PagesContainer.Parent = Frame

    local function createPage()
        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        page.ScrollBarThickness = 3
        page.Visible = false
        page.ZIndex = 2
        local layout = Instance.new("UIListLayout")
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 6)
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.Parent = page
        page.Parent = PagesContainer
        return page
    end

    local Page1 = createPage()
    local Page2 = createPage()
    local Page3 = createPage()
    local Page4 = createPage()

    Page1.Visible = true
    Tab1Btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

    local function switchTab(activePage, activeBtn)
        for _, p in ipairs({Page1, Page2, Page3, Page4}) do p.Visible = false end
        for _, b in ipairs({Tab1Btn, Tab2Btn, Tab3Btn, Tab4Btn}) do 
            b.TextColor3 = Color3.fromRGB(180, 180, 180)
            b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
        activePage.Visible = true
        activeBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
        activeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    end

    Tab1Btn.MouseButton1Click:Connect(function() switchTab(Page1, Tab1Btn) end)
    Tab2Btn.MouseButton1Click:Connect(function() switchTab(Page2, Tab2Btn) end)
    Tab3Btn.MouseButton1Click:Connect(function() switchTab(Page3, Tab3Btn) end)
    Tab4Btn.MouseButton1Click:Connect(function() switchTab(Page4, Tab4Btn) end)

    local function createFeatureToggle(parent, text, order)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 32)
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = Color3.fromRGB(220, 220, 220)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamBold
        btn.Text = text .. ": OFF"
        btn.LayoutOrder = order
        btn.ZIndex = 2
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 6) corner.Parent = btn
        local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(60, 60, 60) stroke.Thickness = 1 stroke.Parent = btn
        
        btn.MouseButton1Click:Connect(function()
            local tweenIn = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0.95, 0, 0, 30)})
            local tweenOut = TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 32)})
            tweenIn:Play()
            tweenIn.Completed:Connect(function() tweenOut:Play() end)
        end)
        
        btn.Parent = parent
        return btn
    end

    local SpeedMenuBtn = createFeatureToggle(Page1, "SPEED", 1)
    local SpeedBox = Instance.new("TextBox")
    SpeedBox.Size = UDim2.new(1, 0, 0, 32)
    SpeedBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    SpeedBox.BackgroundTransparency = 0.3
    SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBox.TextSize = 11
    SpeedBox.Font = Enum.Font.GothamBold
    SpeedBox.PlaceholderText = "Enter Speed (default 20)..."
    SpeedBox.Text = "20"
    SpeedBox.LayoutOrder = 2
    SpeedBox.ZIndex = 2
    SpeedBox.Parent = Page1
    local boxCorner = Instance.new("UICorner") boxCorner.CornerRadius = UDim.new(0, 6) boxCorner.Parent = SpeedBox

    local JumpMenuBtn = createFeatureToggle(Page1, "AUTO JUMP + EMOTE", 3)
    local BhopMenuBtn = createFeatureToggle(Page1, "BHOP", 4)

    local SelectedEmoteName = "Bold March"
    local SelectedEmoteID = 14

    local EmoteHeader = Instance.new("TextLabel")
    EmoteHeader.Size = UDim2.new(1, 0, 0, 20)
    EmoteHeader.BackgroundTransparency = 1
    EmoteHeader.TextColor3 = Color3.fromRGB(240, 240, 240)
    EmoteHeader.TextSize = 11
    EmoteHeader.Font = Enum.Font.GothamBold
    EmoteHeader.Text = "SELECT EMOTE FOR AUTO JUMP:"
    EmoteHeader.LayoutOrder = 1
    EmoteHeader.ZIndex = 2
    EmoteHeader.Parent = Page2

    local function createEmoteButton(name, id, order)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 32)
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.BackgroundTransparency = 0.3
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamBold
        btn.Text = "Emote: " .. name
        btn.LayoutOrder = order
        btn.ZIndex = 2
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 6) corner.Parent = btn
        local stroke = Instance.new("UIStroke") stroke.Col
