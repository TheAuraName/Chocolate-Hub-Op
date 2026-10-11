-- language: Luau, file: ChocolateHubOP.lua, target: Roblox Delta / executor
-- Chocolate Hub OP — 240x240, sem BlurEffect (elimina o borrado)
-- cola no executor e executa.

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- limpa GUI antiga se existir
local oldGui = CoreGui:FindFirstChild("ChocolateHubOP")
if oldGui then oldGui:Destroy() end

-- ─────────────────────────────────────────────────────────────
local SCRIPTS = {
    {name = "Chocola TP LTM",          url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-TP-LTM/refs/heads/main/script.lua"},
    {name = "Chocola Duels",           url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-duels/refs/heads/main/script.lua"},
    {name = "Chocola Exist Leaked",    url = "https://raw.githubusercontent.com/chocolascript-glitch/chocola-exist-leaked/refs/heads/main/script.lua"},
    {name = "Chocola Semi TP",         url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Semi-TP/refs/heads/main/.lua"},
    {name = "Chocola Code Redeemer",   url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Code-Redeemer/refs/heads/main/script.lua"},
    {name = "Xen Hub V5 New",          url = "https://raw.githubusercontent.com/chocolascript-glitch/Xen-Hub-Source-V5-NEW/refs/heads/main/script.lua"},
    {name = "Chocola AJ Notifier",     url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-AJ-Notifier/refs/heads/main/script.lua"},
    {name = "Chocola Auto Garb",       url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Grab/refs/heads/main/script.lua"},
    {name = "Chocola Crasher",         url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Crasher/refs/heads/main/script.lua"},
    {name = "Chocola JOB-ID",          url = "https://raw.githubusercontent.com/chocolascript-glitch/JOD-ID-/refs/heads/main/script.lua"},
    {name = "Chocola Flasher",         url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Flasher/refs/heads/main/Script.lua"},
    {name = "Chocola Public TP",       url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Public-TP/refs/heads/main/script.lua"},
    {name = "Chocola Auto Spin RNG",   url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Spin-RNG/refs/heads/main/script.lua"},
    {name = "Chocola Anti Desync",     url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Anti-Desync/refs/heads/main/script.lua"},
    {name = "Chocola Bypass ZL Hub",   url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Bypass-Zl-Hub/refs/heads/main/script.lua"},
    {name = "Chocola Auto Honey",      url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Honey/refs/heads/main/script.lua"},
    {name = "Chocola Auto Taco",       url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Taco/refs/heads/main/script.lua"},
    {name = "Chocola Insta Reset",     url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Insta-Reset/refs/heads/main/script.lua"},
    {name = "Chocola Aimbot Cap",      url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Aimbot-Cap/refs/heads/main/Script.lua"},
    {name = "Chocola Auto Trade Afk",  url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Trade-Afk/refs/heads/main/.lua"},
    {name = "Chocola Auto Accept",     url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Auto-Accept/refs/heads/main/.lua"},
    {name = "XEN HUB PRIVATE",         url = "https://raw.githubusercontent.com/chocolascript-glitch/XEN-HUB-PRIVATE-FREE/refs/heads/main/FREE-LEAKED"},
    {name = "Chocola Flash TP",        url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Flash-TP/refs/heads/main/Flash-TP.lua"},
    {name = "Chocola Exist Count",     url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Exist-Count-Visual/refs/heads/main/script.lua"},
    {name = "BKS Hub Premium",         url = "https://raw.githubusercontent.com/chocolascript-glitch/BKS-HUB-premium-free/refs/heads/main/script.lua"},
    {name = "Chocola Base Skin",       url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-base-skin-visual/refs/heads/main/script.lua"},
    {name = "Chocola No Tool Desync",  url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-No-Tool-Desync-/refs/heads/main/Chocola-script.lua"},
    {name = "Chocola Speed Lagger",    url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Speed-Lagger/refs/heads/main/Chocola-Speed-Lagger.lua"},
    {name = "Chocola Flash Block TP",  url = "https://raw.githubusercontent.com/chocolascript-glitch/Chocola-Speed-Lagger/refs/heads/main/Chocola-Speed-Lagger.lua"},
    {name = "Chocola Duels OP",        url = "https://raw.githubusercontent.com/chocolascript-glitch/Notfound/refs/heads/main/duelos%20OP%20free%20script"},
}

local COL = {
    bg        = Color3.fromRGB(20, 16, 24),
    bgDeep    = Color3.fromRGB(14, 11, 18),
    text      = Color3.fromRGB(255, 240, 225),
    textDim   = Color3.fromRGB(200, 180, 165),
    accent    = Color3.fromRGB(230, 170, 110),
    accentHot = Color3.fromRGB(255, 200, 140),
    stroke    = Color3.fromRGB(255, 255, 255),
}

local W, H     = 240, 240
local PAD      = 8
local HEADER_H = 32
local BTN_H    = 22
local SEARCH_H = 22
local SCROLL_Y = HEADER_H + SEARCH_H + 12

-- ─────────────────────────────────────────────────────────────
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChocolateHubOP"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = CoreGui

local function borderStroke(parent, transparency)
    local s = Instance.new("UIStroke")
    s.Thickness = 1
    s.Color = COL.stroke
    s.Transparency = transparency or 0.85
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

-- ─────────────────────────────────────────────────────────────
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, W, 0, H)
main.Position = UDim2.new(0.5, -W/2, 0.5, -H/2)
main.BackgroundColor3 = COL.bg
main.BackgroundTransparency = 0.05
main.BorderSizePixel = 0
main.Parent = screenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainStroke = borderStroke(main, 0.5)
local strokeGrad = Instance.new("UIGradient")
strokeGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 200, 150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(180, 130, 90)),
})
strokeGrad.Rotation = 135
strokeGrad.Parent = mainStroke

local gloss = Instance.new("Frame")
gloss.Size = UDim2.new(1, -3, 0, 16)
gloss.Position = UDim2.new(0, 1.5, 0, 1.5)
gloss.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gloss.BackgroundTransparency = 0.9
gloss.BorderSizePixel = 0
gloss.ZIndex = 1
gloss.Parent = main
Instance.new("UICorner", gloss).CornerRadius = UDim.new(0, 10)

-- ─────────────────────────────────────────────────────────────
-- header
-- ─────────────────────────────────────────────────────────────
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, HEADER_H)
header.BackgroundTransparency = 1
header.BorderSizePixel = 0
header.ZIndex = 3
header.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 0, 14)
title.Position = UDim2.new(0, PAD, 0, 4)
title.BackgroundTransparency = 1
title.Text = "Chocolate Hub OP"
title.TextColor3 = COL.text
title.TextSize = 12
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextTruncate = Enum.TextTruncate.AtEnd
title.ZIndex = 4
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -60, 0, 10)
subtitle.Position = UDim2.new(0, PAD, 0, 18)
subtitle.BackgroundTransparency = 1
subtitle.Text = tostring(#SCRIPTS) .. " scripts"
subtitle.TextColor3 = COL.textDim
subtitle.TextSize = 9
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.ZIndex = 4
subtitle.Parent = header

local function makeHeaderBtn(txt, xOff, isClose)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 18, 0, 18)
    b.Position = UDim2.new(1, xOff, 0, 7)
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.BackgroundTransparency = 0.93
    b.Text = txt
    b.TextColor3 = COL.text
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.ZIndex = 4
    b.Parent = header
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    borderStroke(b, 0.82)
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.82,
            TextColor3 = isClose and Color3.fromRGB(255, 150, 150) or COL.accentHot,
        }):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.93,
            TextColor3 = COL.text,
        }):Play()
    end)
    return b
end

local minBtn   = makeHeaderBtn("-", -44, false)
local closeBtn = makeHeaderBtn("x", -24, true)

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -PAD*2, 0, 1)
divider.Position = UDim2.new(0, PAD, 0, HEADER_H)
divider.BackgroundColor3 = COL.stroke
divider.BackgroundTransparency = 0.86
divider.BorderSizePixel = 0
divider.ZIndex = 3
divider.Parent = main

-- ─────────────────────────────────────────────────────────────
-- busca
-- ─────────────────────────────────────────────────────────────
local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(1, -PAD*2, 0, SEARCH_H)
searchFrame.Position = UDim2.new(0, PAD, 0, HEADER_H + 6)
searchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
searchFrame.BackgroundTransparency = 0.94
searchFrame.BorderSizePixel = 0
searchFrame.ZIndex = 2
searchFrame.Parent = main
Instance.new("UICorner", searchFrame).CornerRadius = UDim.new(0, 7)
borderStroke(searchFrame, 0.86)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 1, 0)
searchBox.Position = UDim2.new(0, 8, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.Text = ""
searchBox.PlaceholderText = "buscar..."
searchBox.PlaceholderColor3 = COL.textDim
searchBox.TextColor3 = COL.text
searchBox.TextSize = 11
searchBox.Font = Enum.Font.Gotham
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClearTextOnFocus = false
searchBox.ZIndex = 3
searchBox.Parent = searchFrame

-- ─────────────────────────────────────────────────────────────
-- lista
-- ─────────────────────────────────────────────────────────────
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -PAD*2, 1, -(SCROLL_Y + PAD))
scroll.Position = UDim2.new(0, PAD, 0, SCROLL_Y)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = COL.accent
scroll.ScrollBarImageTransparency = 0.35
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollingDirection = Enum.ScrollingDirection.Y
scroll.ZIndex = 2
scroll.Parent = main

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 4)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scroll

local listPad = Instance.new("UIPadding")
listPad.PaddingRight = UDim.new(0, 6)
listPad.PaddingBottom = UDim.new(0, 6)
listPad.Parent = scroll

-- ─────────────────────────────────────────────────────────────
-- notificação
-- ─────────────────────────────────────────────────────────────
local function notify(text, accent)
    accent = accent or COL.accent
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 190, 0, 32)
    notif.Position = UDim2.new(1, -198, 1, 14)
    notif.BackgroundColor3 = COL.bgDeep
    notif.BackgroundTransparency = 0.02
    notif.BorderSizePixel = 0
    notif.ZIndex = 50
    notif.Parent = screenGui

    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)
    local ns = Instance.new("UIStroke")
    ns.Thickness = 1
    ns.Color = accent
    ns.Transparency = 0.4
    ns.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ns.Parent = notif

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 2, 1, -10)
    bar.Position = UDim2.new(0, 5, 0, 5)
    bar.BackgroundColor3 = accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 51
    bar.Parent = notif
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -18, 1, 0)
    label.Position = UDim2.new(0, 13, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = COL.text
    label.TextSize = 10
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.ZIndex = 51
    label.Parent = notif

    TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -198, 1, -40)
    }):Play()

    task.delay(2.4, function()
        if not notif.Parent then return end
        TweenService:Create(notif, TweenInfo.new(0.25), {
            Position = UDim2.new(1, -198, 1, 14),
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.25)
        if notif.Parent then notif:Destroy() end
    end)
end

-- ─────────────────────────────────────────────────────────────
-- executor
-- ─────────────────────────────────────────────────────────────
local function runScript(entry, btn)
    notify("executando: " .. entry.name, COL.accentHot)
    task.spawn(function()
        local ok, err = pcall(function()
            local src = game:HttpGet(entry.url)
            if not src or src == "" then error("resposta vazia") end
            local fn, cErr = loadstring(src)
            if not fn then error("compilacao: " .. tostring(cErr)) end
            fn()
        end)
        if ok then
            notify("ok: " .. entry.name, Color3.fromRGB(120, 220, 140))
        else
            notify("falhou: " .. entry.name, Color3.fromRGB(240, 100, 100))
            warn("[Chocolate Hub OP] " .. entry.name .. " -> " .. tostring(err))
        end
        if btn and btn.Parent then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.93}):Play()
        end
    end)
end

-- ─────────────────────────────────────────────────────────────
-- botões
-- ─────────────────────────────────────────────────────────────
for i, entry in ipairs(SCRIPTS) do
    local btn = Instance.new("TextButton")
    btn.Name = entry.name
    btn.Size = UDim2.new(1, 0, 0, BTN_H)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundTransparency = 0.93
    btn.Text = entry.name
    btn.TextColor3 = COL.text
    btn.TextSize = 10
    btn.Font = Enum.Font.Gotham
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.LayoutOrder = i
    btn.ZIndex = 3
    btn.Parent = scroll

    local bp = Instance.new("UIPadding")
    bp.PaddingLeft = UDim.new(0, 10)
    bp.PaddingRight = UDim.new(0, 4)
    bp.Parent = btn

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    borderStroke(btn, 0.88)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.85,
            TextColor3 = COL.accentHot,
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundTransparency = 0.93,
            TextColor3 = COL.text,
        }):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.75}):Play()
        runScript(entry, btn)
    end)
end

-- ─────────────────────────────────────────────────────────────
-- drag
-- ─────────────────────────────────────────────────────────────
local dragging, dragStart, startPos
local dragConn

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        if dragConn then dragConn:Disconnect() end
        dragConn = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if dragConn then
                    dragConn:Disconnect()
                    dragConn = nil
                end
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not dragging then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        local d = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + d.X,
            startPos.Y.Scale, startPos.Y.Offset + d.Y
        )
    end
end)

-- ─────────────────────────────────────────────────────────────
-- minimizar / fechar
-- ─────────────────────────────────────────────────────────────
local minimized = false
local closing = false

minBtn.MouseButton1Click:Connect(function()
    if closing then return end
    minimized = not minimized
    local targetH = minimized and HEADER_H or H
    TweenService:Create(main, TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, W, 0, targetH)
    }):Play()
    searchFrame.Visible = not minimized
    scroll.Visible = not minimized
    divider.Visible = not minimized
    gloss.Visible = not minimized
end)

closeBtn.MouseButton1Click:Connect(function()
    if closing then return end
    closing = true
    TweenService:Create(main, TweenInfo.new(0.2), {
        Size = UDim2.new(0, W - 20, 0, H - 20),
        BackgroundTransparency = 0.6
    }):Play()
    task.delay(0.25, function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end)
end)

-- ─────────────────────────────────────────────────────────────
-- filtro
-- ─────────────────────────────────────────────────────────────
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = string.lower(searchBox.Text)
    for _, child in ipairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = (q == "" or string.find(string.lower(child.Name), q, 1, true) ~= nil)
        end
    end
end)

notify("Chocolate Hub OP carregada", COL.accent)
