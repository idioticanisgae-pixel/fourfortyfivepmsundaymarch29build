local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local playerGui = lp:WaitForChild("PlayerGui")
local Wallet = {
    balance = 300,
    bet = 50,
}
function Wallet:Win(mult)
    local gain = math.floor(self.bet * mult)
    self.balance += gain
    return gain
end
function Wallet:Lose()
    self.balance -= self.bet
end
function Wallet:CanBet()
    return self.balance >= self.bet and self.bet > 0
end
local function fmt(n)
    local s = tostring(math.floor(n))
    return s:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end
local function clamp(v, lo, hi) return math.max(lo, math.min(hi, v)) end
local function newTween(obj, info, props)
    return TweenService:Create(obj, info, props)
end
local BJ = {}
BJ.__index = BJ
local SUITS = {"♠","♥","♦","♣"}
local RANKS = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"}
function BJ.new()
    local self = setmetatable({}, BJ)
    self:Reset()
    return self
end
function BJ:Reset()
    self.deck = {}
    self.playerHand = {}
    self.dealerHand = {}
    self.done = false
    self.result = nil
    for _, suit in SUITS do
        for _, rank in RANKS do
            table.insert(self.deck, {rank = rank, suit = suit})
        end
    end
    for i = #self.deck, 2, -1 do
        local j = math.random(1, i)
        self.deck[i], self.deck[j] = self.deck[j], self.deck[i]
    end
end
function BJ:Draw()
    return table.remove(self.deck)
end
function BJ:HandValue(hand)
    local total, aces = 0, 0
    for _, card in hand do
        local r = card.rank
        if r == "A" then
            aces += 1
            total += 11
        elseif r == "J" or r == "Q" or r == "K" then
            total += 10
        else
            total += tonumber(r)
        end
    end
    while total > 21 and aces > 0 do
        total -= 10
        aces -= 1
    end
    return total
end
function BJ:HandStr(hand, hideSecond)
    local parts = {}
    for i, card in hand do
        if hideSecond and i == 2 then
            table.insert(parts, "[?]")
        else
            table.insert(parts, card.rank .. card.suit)
        end
    end
    return table.concat(parts, " ")
end
function BJ:Deal()
    self.playerHand = {self:Draw(), self:Draw()}
    self.dealerHand = {self:Draw(), self:Draw()}
end
function BJ:Hit()
    if self.done then return end
    table.insert(self.playerHand, self:Draw())
    if self:HandValue(self.playerHand) > 21 then
        self.done = true
        self.result = "bust"
    end
end
function BJ:Stand()
    if self.done then return end
    while self:HandValue(self.dealerHand) < 17 do
        table.insert(self.dealerHand, self:Draw())
    end
    local pv = self:HandValue(self.playerHand)
    local dv = self:HandValue(self.dealerHand)
    self.done = true
    if dv > 21 or pv > dv then
        self.result = "win"
    elseif pv == dv then
        self.result = "push"
    else
        self.result = "lose"
    end
end
function BJ:IsNaturalBlackjack()
    return #self.playerHand == 2 and self:HandValue(self.playerHand) == 21
end
local SLOT_SYMS = {"🍒","🍋","🍊","⭐","💎","7️⃣"}
local SLOT_WEIGHTS = {40, 30, 20, 15, 10, 5}
local SLOT_TOTAL = 0
for _, w in SLOT_WEIGHTS do SLOT_TOTAL += w end
local SLOT_PAYS = {
    ["🍒"] = 2,
    ["🍋"] = 3,
    ["🍊"] = 4,
    ["⭐"] = 6,
    ["💎"] = 10,
    ["7️⃣"] = 25,
}
local function slotSpin()
    local reels = {}
    for i = 1, 3 do
        local r = math.random(1, SLOT_TOTAL)
        local acc = 0
        for j, w in SLOT_WEIGHTS do
            acc += w
            if r <= acc then
                reels[i] = SLOT_SYMS[j]
                break
            end
        end
    end
    return reels
end
local function slotEval(reels)
    if reels[1] == reels[2] and reels[2] == reels[3] then
        return SLOT_PAYS[reels[1]], "JACKPOT! " .. reels[1] .. reels[1] .. reels[1]
    elseif reels[1] == reels[2] or reels[2] == reels[3] or reels[1] == reels[3] then
        return 0.5, "Two of a kind"
    end
    return nil, "No match"
end
local function rollDice(sides)
    sides = sides or 6
    return math.random(1, sides)
end
if playerGui:FindFirstChild("CasinoGui") then
    playerGui.CasinoGui:Destroy()
end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CasinoGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui
local win = Instance.new("Frame")
win.Name = "Window"
win.Size = UDim2.new(0, 420, 0, 520)
win.Position = UDim2.new(0.5, -210, 0.5, -260)
win.BackgroundColor3 = Color3.fromHex("#0d1117")
win.BorderSizePixel = 0
win.Active = true
win.Draggable = true
win.Parent = screenGui
local border = Instance.new("UIStroke", win)
border.Color = Color3.fromHex("#f0c040")
border.Thickness = 1.5
border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local corner = Instance.new("UICorner", win)
corner.CornerRadius = UDim.new(0, 8)
local titleBar = Instance.new("Frame", win)
titleBar.Size = UDim2.new(1, 0, 0, 36)
titleBar.BackgroundColor3 = Color3.fromHex("#1a1f2e")
titleBar.BorderSizePixel = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 8)
local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -10, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🎰  CASINO"
titleLabel.TextColor3 = Color3.fromHex("#f0c040")
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0.5, -14)
closeBtn.BackgroundColor3 = Color3.fromHex("#c0392b")
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)
closeBtn.MouseButton1Click:Connect(function() win.Visible = false end)
local walletBar = Instance.new("Frame", win)
walletBar.Size = UDim2.new(1, -16, 0, 36)
walletBar.Position = UDim2.new(0, 8, 0, 44)
walletBar.BackgroundColor3 = Color3.fromHex("#161b27")
walletBar.BorderSizePixel = 0
Instance.new("UICorner", walletBar).CornerRadius = UDim.new(0, 6)
local balanceLabel = Instance.new("TextLabel", walletBar)
balanceLabel.Size = UDim2.new(0.5, 0, 1, 0)
balanceLabel.Position = UDim2.new(0, 8, 0, 0)
balanceLabel.BackgroundTransparency = 1
balanceLabel.Font = Enum.Font.GothamBold
balanceLabel.TextSize = 13
balanceLabel.TextColor3 = Color3.fromHex("#2ecc71")
balanceLabel.TextXAlignment = Enum.TextXAlignment.Left
local betLabel = Instance.new("TextLabel", walletBar)
betLabel.Size = UDim2.new(0.3, 0, 1, 0)
betLabel.Position = UDim2.new(0.5, 0, 0, 0)
betLabel.BackgroundTransparency = 1
betLabel.Font = Enum.Font.Gotham
betLabel.TextSize = 12
betLabel.TextColor3 = Color3.fromHex("#f0c040")
betLabel.TextXAlignment = Enum.TextXAlignment.Left
local function refreshWallet()
    balanceLabel.Text = "💰 $" .. fmt(Wallet.balance)
    betLabel.Text = "BET: $" .. fmt(Wallet.bet)
end
local betMinus = Instance.new("TextButton", walletBar)
betMinus.Size = UDim2.new(0, 24, 0, 24)
betMinus.Position = UDim2.new(1, -56, 0.5, -12)
betMinus.BackgroundColor3 = Color3.fromHex("#c0392b")
betMinus.Text = "−"
betMinus.TextColor3 = Color3.new(1,1,1)
betMinus.Font = Enum.Font.GothamBold
betMinus.TextSize = 14
betMinus.BorderSizePixel = 0
Instance.new("UICorner", betMinus).CornerRadius = UDim.new(0, 4)
local betPlus = Instance.new("TextButton", walletBar)
betPlus.Size = UDim2.new(0, 24, 0, 24)
betPlus.Position = UDim2.new(1, -28, 0.5, -12)
betPlus.BackgroundColor3 = Color3.fromHex("#27ae60")
betPlus.Text = "+"
betPlus.TextColor3 = Color3.new(1,1,1)
betPlus.Font = Enum.Font.GothamBold
betPlus.TextSize = 14
betPlus.BorderSizePixel = 0
Instance.new("UICorner", betPlus).CornerRadius = UDim.new(0, 4)
betMinus.MouseButton1Click:Connect(function()
    Wallet.bet = clamp(Wallet.bet - 10, 10, Wallet.balance)
    refreshWallet()
end)
betPlus.MouseButton1Click:Connect(function()
    Wallet.bet = clamp(Wallet.bet + 10, 10, Wallet.balance)
    refreshWallet()
end)
local tabBar = Instance.new("Frame", win)
tabBar.Size = UDim2.new(1, -16, 0, 32)
tabBar.Position = UDim2.new(0, 8, 0, 88)
tabBar.BackgroundTransparency = 1
tabBar.BorderSizePixel = 0
local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
local function makeTab(label)
    local btn = Instance.new("TextButton", tabBar)
    btn.Size = UDim2.new(0, 110, 1, 0)
    btn.BackgroundColor3 = Color3.fromHex("#1a1f2e")
    btn.Text = label
    btn.TextColor3 = Color3.fromHex("#8899aa")
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end
local tabBJ    = makeTab("🃏  Blackjack")
local tabSlots = makeTab("🎰  Slots")
local tabDice  = makeTab("🎲  Dice")
local contentArea = Instance.new("Frame", win)
contentArea.Size = UDim2.new(1, -16, 1, -136)
contentArea.Position = UDim2.new(0, 8, 0, 128)
contentArea.BackgroundColor3 = Color3.fromHex("#161b27")
contentArea.BorderSizePixel = 0
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 6)
local logFrame = Instance.new("ScrollingFrame", contentArea)
logFrame.Size = UDim2.new(1, -16, 1, -60)
logFrame.Position = UDim2.new(0, 8, 0, 8)
logFrame.BackgroundTransparency = 1
logFrame.BorderSizePixel = 0
logFrame.ScrollBarThickness = 3
logFrame.ScrollBarImageColor3 = Color3.fromHex("#f0c040")
logFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
local logLayout = Instance.new("UIListLayout", logFrame)
logLayout.Padding = UDim.new(0, 3)
logLayout.SortOrder = Enum.SortOrder.LayoutOrder
local logCount = 0
local function log(msg, color)
    logCount += 1
    local lbl = Instance.new("TextLabel", logFrame)
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = msg
    lbl.TextColor3 = color or Color3.fromHex("#ccd6f6")
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = logCount
    lbl.TextTruncate = Enum.TextTruncate.AtEnd
    logFrame.CanvasSize = UDim2.new(0, 0, 0, logLayout.AbsoluteContentSize.Y + 8)
    logFrame.CanvasPosition = Vector2.new(0, math.max(0, logFrame.CanvasSize.Y.Offset - logFrame.AbsoluteSize.Y))
end
local function logSep()
    log("─────────────────────────────", Color3.fromHex("#2a3040"))
end
local actionArea = Instance.new("Frame", contentArea)
actionArea.Size = UDim2.new(1, -16, 0, 44)
actionArea.Position = UDim2.new(0, 8, 1, -50)
actionArea.BackgroundTransparency = 1
actionArea.BorderSizePixel = 0
local actionLayout = Instance.new("UIListLayout", actionArea)
actionLayout.FillDirection = Enum.FillDirection.Horizontal
actionLayout.Padding = UDim.new(0, 6)
actionLayout.VerticalAlignment = Enum.VerticalAlignment.Center
local function makeBtn(label, color)
    local btn = Instance.new("TextButton", actionArea)
    btn.Size = UDim2.new(0, 90, 0, 34)
    btn.BackgroundColor3 = color or Color3.fromHex("#2a3a5e")
    btn.Text = label
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end
local bjGame = nil
local function bjActions(show)
end
local btnBJDeal  = makeBtn("Deal",  Color3.fromHex("#1a6b3a"))
local btnBJHit   = makeBtn("Hit",   Color3.fromHex("#1a4a8a"))
local btnBJStand = makeBtn("Stand", Color3.fromHex("#8a3a1a"))
local btnBJDouble= makeBtn("Double",Color3.fromHex("#6b1a8a"))
local function setBJButtons(state)
    btnBJDeal.Visible   = (state == "idle")
    btnBJHit.Visible    = (state == "playing")
    btnBJStand.Visible  = (state == "playing")
    btnBJDouble.Visible = (state == "playing")
end
local function startBJ()
    if not Wallet:CanBet() then
        log("⚠ Not enough balance!", Color3.fromHex("#e74c3c"))
        return
    end
    bjGame = BJ.new()
    bjGame:Deal()
    logSep()
    log("🃏  NEW HAND — Bet: $" .. fmt(Wallet.bet), Color3.fromHex("#f0c040"))
    log("You:    " .. bjGame:HandStr(bjGame.playerHand) .. "  [" .. bjGame:HandValue(bjGame.playerHand) .. "]", Color3.fromHex("#7ecfff"))
    log("Dealer: " .. bjGame:HandStr(bjGame.dealerHand, true), Color3.fromHex("#ff9f7e"))
    if bjGame:IsNaturalBlackjack() then
        log("🎉 BLACKJACK! Natural 21!", Color3.fromHex("#f0c040"))
        Wallet:Win(1.5)
        refreshWallet()
        log("Won $" .. fmt(math.floor(Wallet.bet * 1.5)), Color3.fromHex("#2ecc71"))
        log("Balance: $" .. fmt(Wallet.balance), Color3.fromHex("#2ecc71"))
        bjGame = nil
        setBJButtons("idle")
    else
        setBJButtons("playing")
    end
end
local function finishBJ()
    if not bjGame then return end
    local r = bjGame.result
    log("Dealer: " .. bjGame:HandStr(bjGame.dealerHand) .. "  [" .. bjGame:HandValue(bjGame.dealerHand) .. "]", Color3.fromHex("#ff9f7e"))
    if r == "win" then
        local gain = Wallet:Win(1)
        log("✅ You win! +$" .. fmt(gain), Color3.fromHex("#2ecc71"))
    elseif r == "push" then
        log("🤝 Push! Bet returned.", Color3.fromHex("#f0c040"))
    elseif r == "bust" then
        Wallet:Lose()
        log("💥 BUST! -$" .. fmt(Wallet.bet), Color3.fromHex("#e74c3c"))
    else
        Wallet:Lose()
        log("❌ Dealer wins. -$" .. fmt(Wallet.bet), Color3.fromHex("#e74c3c"))
    end
    log("Balance: $" .. fmt(Wallet.balance), Color3.fromHex("#aabbcc"))
    refreshWallet()
    bjGame = nil
    setBJButtons("idle")
end
btnBJDeal.MouseButton1Click:Connect(startBJ)
btnBJHit.MouseButton1Click:Connect(function()
    if not bjGame then return end
    bjGame:Hit()
    log("You:    " .. bjGame:HandStr(bjGame.playerHand) .. "  [" .. bjGame:HandValue(bjGame.playerHand) .. "]", Color3.fromHex("#7ecfff"))
    if bjGame.done then finishBJ() end
end)
btnBJStand.MouseButton1Click:Connect(function()
    if not bjGame then return end
    bjGame:Stand()
    finishBJ()
end)
btnBJDouble.MouseButton1Click:Connect(function()
    if not bjGame then return end
    if Wallet.balance < Wallet.bet * 2 then
        log("⚠ Not enough to double!", Color3.fromHex("#e74c3c"))
        return
    end
    local origBet = Wallet.bet
    Wallet.bet = origBet * 2
    refreshWallet()
    log("⬆ Doubled down! Bet: $" .. fmt(Wallet.bet), Color3.fromHex("#f0c040"))
    bjGame:Hit()
    log("You:    " .. bjGame:HandStr(bjGame.playerHand) .. "  [" .. bjGame:HandValue(bjGame.playerHand) .. "]", Color3.fromHex("#7ecfff"))
    if not bjGame.done then bjGame:Stand() end
    finishBJ()
    Wallet.bet = origBet
    refreshWallet()
end)
local btnSpin = makeBtn("SPIN 🎰", Color3.fromHex("#8a6a00"))
btnSpin.Size = UDim2.new(0, 120, 0, 34)
local function doSlots()
    if not Wallet:CanBet() then
        log("⚠ Not enough balance!", Color3.fromHex("#e74c3c"))
        return
    end
    logSep()
    log("🎰  SPINNING — Bet: $" .. fmt(Wallet.bet), Color3.fromHex("#f0c040"))
    local reels = slotSpin()
    log("[ " .. reels[1] .. " | " .. reels[2] .. " | " .. reels[3] .. " ]", Color3.fromHex("#ffffff"))
    local mult, desc = slotEval(reels)
    if mult then
        local gain = Wallet:Win(mult)
        log("✅ " .. desc .. " — +$" .. fmt(gain) .. " (x" .. mult .. ")", Color3.fromHex("#2ecc71"))
    else
        Wallet:Lose()
        log("❌ " .. desc .. " — -$" .. fmt(Wallet.bet), Color3.fromHex("#e74c3c"))
    end
    log("Balance: $" .. fmt(Wallet.balance), Color3.fromHex("#aabbcc"))
    refreshWallet()
end
btnSpin.MouseButton1Click:Connect(doSlots)
local btnD6   = makeBtn("Roll d6",  Color3.fromHex("#1a5a6a"))
local btnD20  = makeBtn("Roll d20", Color3.fromHex("#4a1a6a"))
local btnHigh = makeBtn("Bet HI",   Color3.fromHex("#1a6b3a"))
local btnLow  = makeBtn("Bet LO",   Color3.fromHex("#6b3a1a"))
local diceMode = "d6"
local dicePrediction = nil
local function doDice()
    if not dicePrediction then
        log("⚠ Pick HI or LO first!", Color3.fromHex("#e74c3c"))
        return
    end
    if not Wallet:CanBet() then
        log("⚠ Not enough balance!", Color3.fromHex("#e74c3c"))
        return
    end
    local sides = diceMode == "d6" and 6 or 20
    local mid = sides / 2
    local roll = rollDice(sides)
    logSep()
    log("🎲  " .. diceMode:upper() .. " — Bet: $" .. fmt(Wallet.bet) .. " on " .. dicePrediction:upper(), Color3.fromHex("#f0c040"))
    log("Rolled: " .. roll .. " / " .. sides, Color3.fromHex("#7ecfff"))
    local isHigh = roll > mid
    local win = (dicePrediction == "hi" and isHigh) or (dicePrediction == "lo" and not isHigh)
    if roll == math.ceil(mid) and sides % 2 ~= 0 then
        log("🤝 Exact middle! Push.", Color3.fromHex("#f0c040"))
    elseif win then
        local gain = Wallet:Win(1)
        log("✅ Correct! +$" .. fmt(gain), Color3.fromHex("#2ecc71"))
    else
        Wallet:Lose()
        log("❌ Wrong! -$" .. fmt(Wallet.bet), Color3.fromHex("#e74c3c"))
    end
    log("Balance: $" .. fmt(Wallet.balance), Color3.fromHex("#aabbcc"))
    refreshWallet()
end
btnD6.MouseButton1Click:Connect(function()
    diceMode = "d6"
    btnD6.BackgroundColor3 = Color3.fromHex("#f0c040")
    btnD6.TextColor3 = Color3.fromHex("#0d1117")
    btnD20.BackgroundColor3 = Color3.fromHex("#1a5a6a")
    btnD20.TextColor3 = Color3.new(1,1,1)
    log("Switched to d6. Mid = 3. HI = 4-6, LO = 1-3", Color3.fromHex("#8899aa"))
end)
btnD20.MouseButton1Click:Connect(function()
    diceMode = "d20"
    btnD20.BackgroundColor3 = Color3.fromHex("#f0c040")
    btnD20.TextColor3 = Color3.fromHex("#0d1117")
    btnD6.BackgroundColor3 = Color3.fromHex("#1a5a6a")
    btnD6.TextColor3 = Color3.new(1,1,1)
    log("Switched to d20. Mid = 10. HI = 11-20, LO = 1-10", Color3.fromHex("#8899aa"))
end)
btnHigh.MouseButton1Click:Connect(function()
    dicePrediction = "hi"
    btnHigh.BackgroundColor3 = Color3.fromHex("#f0c040")
    btnHigh.TextColor3 = Color3.fromHex("#0d1117")
    btnLow.BackgroundColor3 = Color3.fromHex("#6b3a1a")
    btnLow.TextColor3 = Color3.new(1,1,1)
    doDice()
end)
btnLow.MouseButton1Click:Connect(function()
    dicePrediction = "lo"
    btnLow.BackgroundColor3 = Color3.fromHex("#f0c040")
    btnLow.TextColor3 = Color3.fromHex("#0d1117")
    btnHigh.BackgroundColor3 = Color3.fromHex("#1a6b3a")
    btnHigh.TextColor3 = Color3.new(1,1,1)
    doDice()
end)
local allBtns = {btnBJDeal, btnBJHit, btnBJStand, btnBJDouble, btnSpin, btnD6, btnD20, btnHigh, btnLow}
local function hideAllBtns()
    for _, b in allBtns do b.Visible = false end
end
local function activateTab(tabBtn)
    for _, t in {tabBJ, tabSlots, tabDice} do
        t.BackgroundColor3 = Color3.fromHex("#1a1f2e")
        t.TextColor3 = Color3.fromHex("#8899aa")
    end
    tabBtn.BackgroundColor3 = Color3.fromHex("#f0c040")
    tabBtn.TextColor3 = Color3.fromHex("#0d1117")
end
tabBJ.MouseButton1Click:Connect(function()
    activateTab(tabBJ)
    hideAllBtns()
    if bjGame then setBJButtons("playing") else setBJButtons("idle") end
    logSep()
    log("🃏  Blackjack  |  !deal  !hit  !stand  !double", Color3.fromHex("#8899aa"))
end)
tabSlots.MouseButton1Click:Connect(function()
    activateTab(tabSlots)
    hideAllBtns()
    btnSpin.Visible = true
    logSep()
    log("🎰  Slots  |  !spin", Color3.fromHex("#8899aa"))
    log("Pays: 🍒×2  🍋×3  🍊×4  ⭐×6  💎×10  7️⃣×25", Color3.fromHex("#8899aa"))
end)
tabDice.MouseButton1Click:Connect(function()
    activateTab(tabDice)
    hideAllBtns()
    btnD6.Visible = true
    btnD20.Visible = true
    btnHigh.Visible = true
    btnLow.Visible = true
    logSep()
    log("🎲  Dice  |  !roll  !hi  !lo  !d6  !d20", Color3.fromHex("#8899aa"))
    log("Pick a die, then bet HI or LO to roll.", Color3.fromHex("#8899aa"))
end)
tabBJ:MouseButton1Click()
log("Welcome to Casino! Type commands in chat or use the GUI.", Color3.fromHex("#f0c040"))
log("!bet <amount>  to change your wager.", Color3.fromHex("#8899aa"))
local chatConn = lp.Chatted:Connect(function(msg)
    msg = msg:lower():match("^%s*(.-)%s*$")
    local args = {}
    for word in msg:gmatch("%S+") do table.insert(args, word) end
    local cmd = args[1]
    if cmd == "!bet" and args[2] then
        local n = tonumber(args[2])
        if n and n > 0 then
            Wallet.bet = clamp(n, 10, Wallet.balance)
            refreshWallet()
            log("Bet set to $" .. fmt(Wallet.bet), Color3.fromHex("#f0c040"))
        end
    elseif cmd == "!balance" or cmd == "!bal" then
        log("💰 Balance: $" .. fmt(Wallet.balance) .. "  |  Bet: $" .. fmt(Wallet.bet), Color3.fromHex("#2ecc71"))
    elseif cmd == "!deal" or cmd == "!bj" then
        activateTab(tabBJ)
        hideAllBtns()
        startBJ()
    elseif cmd == "!hit" then
        if bjGame and not bjGame.done then
            bjGame:Hit()
            log("You:    " .. bjGame:HandStr(bjGame.playerHand) .. "  [" .. bjGame:HandValue(bjGame.playerHand) .. "]", Color3.fromHex("#7ecfff"))
            if bjGame.done then finishBJ() end
        else log("⚠ No active hand. !deal first.", Color3.fromHex("#e74c3c")) end
    elseif cmd == "!stand" then
        if bjGame and not bjGame.done then
            bjGame:Stand()
            finishBJ()
        else log("⚠ No active hand. !deal first.", Color3.fromHex("#e74c3c")) end
    elseif cmd == "!double" then
        if bjGame and not bjGame.done then
            btnBJDouble:MouseButton1Click()
        else log("⚠ No active hand. !deal first.", Color3.fromHex("#e74c3c")) end
    elseif cmd == "!spin" then
        activateTab(tabSlots)
        hideAllBtns()
        btnSpin.Visible = true
        doSlots()
    elseif cmd == "!d6" then
        diceMode = "d6"
        log("Die set to d6", Color3.fromHex("#8899aa"))
    elseif cmd == "!d20" then
        diceMode = "d20"
        log("Die set to d20", Color3.fromHex("#8899aa"))
    elseif cmd == "!roll" or cmd == "!hi" or cmd == "!high" then
        activateTab(tabDice)
        hideAllBtns()
        btnD6.Visible = true; btnD20.Visible = true
        btnHigh.Visible = true; btnLow.Visible = true
        dicePrediction = "hi"
        doDice()
    elseif cmd == "!lo" or cmd == "!low" then
        activateTab(tabDice)
        hideAllBtns()
        btnD6.Visible = true; btnD20.Visible = true
        btnHigh.Visible = true; btnLow.Visible = true
        dicePrediction = "lo"
        doDice()
    elseif cmd == "!casino" then
        win.Visible = not win.Visible
    elseif cmd == "!help" then
        log("── Casino Commands ──────────────────────", Color3.fromHex("#f0c040"))
        log("!bet <n>    Set bet amount", Color3.fromHex("#ccd6f6"))
        log("!balance    Show balance", Color3.fromHex("#ccd6f6"))
        log("!deal       Start blackjack hand", Color3.fromHex("#ccd6f6"))
        log("!hit !stand !double   BJ actions", Color3.fromHex("#ccd6f6"))
        log("!spin       Spin the slots", Color3.fromHex("#ccd6f6"))
        log("!d6 !d20    Choose die", Color3.fromHex("#ccd6f6"))
        log("!hi / !lo   Roll dice (bet direction)", Color3.fromHex("#ccd6f6"))
        log("!casino     Toggle GUI", Color3.fromHex("#ccd6f6"))
    end
end)
lp.CharacterRemoving:Connect(function()
    chatConn:Disconnect()
end)
print("[Casino] Loaded. Type !help in chat or use the GUI.")
