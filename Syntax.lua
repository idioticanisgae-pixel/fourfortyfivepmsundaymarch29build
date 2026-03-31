local Syntax = {
	Text          = Color3.fromRGB(204,204,204),
	Operator      = Color3.fromRGB(204,204,204),
	Number        = Color3.fromRGB(255,198,0),
	String        = Color3.fromRGB(173,241,149),
	Comment       = Color3.fromRGB(102,102,102),
	Keyword       = Color3.fromRGB(248,109,124),
	BuiltIn       = Color3.fromRGB(132,214,247),
	LocalMethod   = Color3.fromRGB(253,251,172),
	LocalProperty = Color3.fromRGB(97,161,241),
	Nil           = Color3.fromRGB(255,198,0),
	Bool          = Color3.fromRGB(255,198,0),
	Function      = Color3.fromRGB(248,109,124),
	Local         = Color3.fromRGB(248,109,124),
	Self          = Color3.fromRGB(248,109,124),
	FunctionName  = Color3.fromRGB(253,251,172),
	Bracket       = Color3.fromRGB(204,204,204),
}
local function colorToHex(c)
	return string.format("#%02x%02x%02x",
		math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255))
end
local HL_KEYWORDS = {
	["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,
	["end"]=true,["false"]=true,["for"]=true,["function"]=true,["if"]=true,
	["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,
	["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,
	["until"]=true,["while"]=true,
}
local HL_BUILTINS = {
	["game"]=true,["Players"]=true,["TweenService"]=true,["ScreenGui"]=true,
	["Instance"]=true,["UDim2"]=true,["Vector2"]=true,["Vector3"]=true,
	["Color3"]=true,["Enum"]=true,["loadstring"]=true,["warn"]=true,
	["pcall"]=true,["print"]=true,["UDim"]=true,["delay"]=true,
	["require"]=true,["spawn"]=true,["tick"]=true,["getfenv"]=true,
	["workspace"]=true,["setfenv"]=true,["getgenv"]=true,["script"]=true,
	["string"]=true,["pairs"]=true,["type"]=true,["math"]=true,
	["tonumber"]=true,["tostring"]=true,["CFrame"]=true,["BrickColor"]=true,
	["table"]=true,["Random"]=true,["Ray"]=true,["xpcall"]=true,
	["coroutine"]=true,["_G"]=true,["_VERSION"]=true,["debug"]=true,
	["Axes"]=true,["assert"]=true,["error"]=true,["ipairs"]=true,
	["rawequal"]=true,["rawget"]=true,["rawset"]=true,["select"]=true,
	["bit32"]=true,["buffer"]=true,["task"]=true,["os"]=true,
}
local HL_METHODS = {
	["WaitForChild"]=true,["FindFirstChild"]=true,["GetService"]=true,
	["Destroy"]=true,["Clone"]=true,["IsA"]=true,["ClearAllChildren"]=true,
	["GetChildren"]=true,["GetDescendants"]=true,["Connect"]=true,
	["Disconnect"]=true,["Fire"]=true,["Invoke"]=true,["rgb"]=true,
	["FireServer"]=true,["request"]=true,["call"]=true,
}
local function hlTokenize(line)
	local tokens, i = {}, 1
	while i <= #line do
		local c = line:sub(i,i)
		if c == "-" and line:sub(i,i+1) == "--" then
			table.insert(tokens, {line:sub(i), "Comment"}); break
		elseif c == "[" and line:sub(i,i+1):match("%[=*%[") then
			local eqCount = 0
			local k = i+1
			while line:sub(k,k) == "=" do eqCount += 1; k += 1 end
			if line:sub(k,k) == "[" then
				local close = "]"..string.rep("=",eqCount).."]"
				local endIdx = line:find(close, k+1, true)
				local j = endIdx and (endIdx + #close - 1) or #line
				table.insert(tokens, {line:sub(i,j), "String"}); i = j
			else
				table.insert(tokens, {c, "Operator"})
			end
		elseif c == '"' or c == "'" then
			local q, j = c, i+1
			while j <= #line do
				if line:sub(j,j) == q and line:sub(j-1,j-1) ~= "\\" then break end
				j += 1
			end
			table.insert(tokens, {line:sub(i,j), "String"}); i = j
		elseif c:match("%d") then
			local j = i
			while j <= #line and line:sub(j,j):match("[%d%.]") do j += 1 end
			table.insert(tokens, {line:sub(i,j-1), "Number"}); i = j-1
		elseif c:match("[%a_]") then
			local j = i
			while j <= #line and line:sub(j,j):match("[%w_]") do j += 1 end
			table.insert(tokens, {line:sub(i,j-1), "Word"}); i = j-1
		else
			table.insert(tokens, {c, "Operator"})
		end
		i += 1
	end
	return tokens
end
local function hlDetect(tokens, idx)
	local val, typ = tokens[idx][1], tokens[idx][2]
	if typ ~= "Word" then return typ end
	if HL_KEYWORDS[val]  then return "Keyword"  end
	if HL_BUILTINS[val]  then return "BuiltIn"  end
	if HL_METHODS[val]   then return "LocalMethod" end
	if idx > 1 and tokens[idx-1][1] == "." then return "LocalProperty" end
	if idx > 1 and tokens[idx-1][1] == ":" then return "LocalMethod" end
	if val == "self"  then return "Self" end
	if val == "true" or val == "false" then return "Bool" end
	if val == "nil"   then return "Nil"  end
	if idx > 1 and tokens[idx-1][1] == "function" then return "FunctionName" end
	return "Text"
end
local function hlLine(line)
	local tokens = hlTokenize(line)
	local out = ""
	for i, tok in ipairs(tokens) do
		local col = Syntax[hlDetect(tokens, i)] or Syntax.Text
		local safe = tok[1]:gsub("&","&amp;"):gsub("<","&lt;"):gsub(">","&gt;")
		out ..= string.format('<font color="%s">%s</font>', colorToHex(col), safe)
	end
	return out
end
