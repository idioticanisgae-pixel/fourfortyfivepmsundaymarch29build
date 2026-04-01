--[[
            _           ____   ™ 
  _____   _| | ____   _|___ \  
 |_  / | | | |/ /\ \ / / __) | 
  / /| |_| |   <  \ V / / __/  
 /___|\__,_|_|\_\  \_/ |_____| 
                               
--]]


local FLOAT_PRECISION  = 7


          local Players          =             game:GetService("Players")
        local UserInputService  =    game:GetService("UserInputService")
     local localPlayer         =                  Players.LocalPlayer
  local playerGui             = localPlayer:WaitForChild("PlayerGui")


local Reader = {}

function Reader.new(bytecode)
	local stream = buffer.fromstring(bytecode)
	local cursor = 0
	local blen   = buffer.len(stream)
	local self   = {}
	local function guard(n)
		if cursor + n > blen then
			error(string.format("Reader OOB: need %d byte(s) at offset %d (buf len %d)", n, cursor, blen), 2)
		end
	end
	function self:len()       return blen end
	function self:nextByte()
		guard(1); local r = buffer.readu8(stream, cursor); cursor += 1; return r
	end
	function self:nextSignedByte()
		guard(1); local r = buffer.readi8(stream, cursor); cursor += 1; return r
	end
	function self:nextBytes(count)
		local t = {}
		for i = 1, count do t[i] = self:nextByte() end
		return t
	end
	function self:nextChar()     return string.char(self:nextByte()) end
	function self:nextUInt32()
		guard(4); local r = buffer.readu32(stream, cursor); cursor += 4; return r
	end
	function self:nextInt32()
		guard(4); local r = buffer.readi32(stream, cursor); cursor += 4; return r
	end
	function self:nextFloat()
		guard(4); local r = buffer.readf32(stream, cursor); cursor += 4
		return tonumber(string.format("%0."..FLOAT_PRECISION.."f", r))
	end
	function self:nextVarInt()
		local result = 0
		for i = 0, 4 do
			local b = self:nextByte()
			result = bit32.bor(result, bit32.lshift(bit32.band(b, 0x7F), i * 7))
			if not bit32.btest(b, 0x80) then break end
		end
		return result
	end
	function self:nextString(slen)
		slen = slen or self:nextVarInt()
		if slen == 0 then return "" end
		guard(slen)
		local r = buffer.readstring(stream, cursor, slen); cursor += slen; return r
	end
	function self:nextDouble()
		guard(8); local r = buffer.readf64(stream, cursor); cursor += 8; return r
	end
	return self
end
function Reader:Set(fp) FLOAT_PRECISION = fp end
local Strings = {
	SUCCESS              = "%s",
	TIMEOUT              = "-- DECOMPILER TIMEOUT",
	COMPILATION_FAILURE  = "-- SCRIPT FAILED TO COMPILE, ERROR:\n%s",
	UNSUPPORTED_LBC_VERSION = "-- PASSED BYTECODE IS TOO OLD AND IS NOT SUPPORTED",
	USED_GLOBALS         = "-- USED GLOBALS: %s.\n",
	DECOMPILER_REMARK    = "-- DECOMPILER REMARK: %s\n",
}
local CASE_MULTIPLIER = 227
local Luau = {
	OpCode = {
		{name="NOP",type="none"},{name="BREAK",type="none"},
		{name="LOADNIL",type="A"},{name="LOADB",type="ABC"},
		{name="LOADN",type="AsD"},{name="LOADK",type="AD"},
		{name="MOVE",type="AB"},
		{name="GETGLOBAL",type="AC",aux=true},{name="SETGLOBAL",type="AC",aux=true},
		{name="GETUPVAL",type="AB"},{name="SETUPVAL",type="AB"},
		{name="CLOSEUPVALS",type="A"},
		{name="GETIMPORT",type="AD",aux=true},
		{name="GETTABLE",type="ABC"},{name="SETTABLE",type="ABC"},
		{name="GETTABLEKS",type="ABC",aux=true},{name="SETTABLEKS",type="ABC",aux=true},
		{name="GETTABLEN",type="ABC"},{name="SETTABLEN",type="ABC"},
		{name="NEWCLOSURE",type="AD"},{name="NAMECALL",type="ABC",aux=true},
		{name="CALL",type="ABC"},{name="RETURN",type="AB"},
		{name="JUMP",type="sD"},{name="JUMPBACK",type="sD"},
		{name="JUMPIF",type="AsD"},{name="JUMPIFNOT",type="AsD"},
		{name="JUMPIFEQ",type="AsD",aux=true},{name="JUMPIFLE",type="AsD",aux=true},
		{name="JUMPIFLT",type="AsD",aux=true},{name="JUMPIFNOTEQ",type="AsD",aux=true},
		{name="JUMPIFNOTLE",type="AsD",aux=true},{name="JUMPIFNOTLT",type="AsD",aux=true},
		{name="ADD",type="ABC"},{name="SUB",type="ABC"},{name="MUL",type="ABC"},
		{name="DIV",type="ABC"},{name="MOD",type="ABC"},{name="POW",type="ABC"},
		{name="ADDK",type="ABC"},{name="SUBK",type="ABC"},{name="MULK",type="ABC"},
		{name="DIVK",type="ABC"},{name="MODK",type="ABC"},{name="POWK",type="ABC"},
		{name="AND",type="ABC"},{name="OR",type="ABC"},
		{name="ANDK",type="ABC"},{name="ORK",type="ABC"},
		{name="CONCAT",type="ABC"},
		{name="NOT",type="AB"},{name="MINUS",type="AB"},{name="LENGTH",type="AB"},
		{name="NEWTABLE",type="AB",aux=true},{name="DUPTABLE",type="AD"},
		{name="SETLIST",type="ABC",aux=true},
		{name="FORNPREP",type="AsD"},{name="FORNLOOP",type="AsD"},
		{name="FORGLOOP",type="AsD",aux=true},
		{name="FORGPREP_INEXT",type="A"},
		{name="FASTCALL3",type="ABC",aux=true},
		{name="FORGPREP_NEXT",type="A"},{name="NATIVECALL",type="none"},
		{name="GETVARARGS",type="AB"},{name="DUPCLOSURE",type="AD"},
		{name="PREPVARARGS",type="A"},{name="LOADKX",type="A",aux=true},
		{name="JUMPX",type="E"},{name="FASTCALL",type="AC"},
		{name="COVERAGE",type="E"},{name="CAPTURE",type="AB"},
		{name="SUBRK",type="ABC"},{name="DIVRK",type="ABC"},
		{name="FASTCALL1",type="ABC"},
		{name="FASTCALL2",type="ABC",aux=true},{name="FASTCALL2K",type="ABC",aux=true},
		{name="FORGPREP",type="AsD"},
		{name="JUMPXEQKNIL",type="AsD",aux=true},{name="JUMPXEQKB",type="AsD",aux=true},
		{name="JUMPXEQKN",type="AsD",aux=true},{name="JUMPXEQKS",type="AsD",aux=true},
		{name="IDIV",type="ABC"},{name="IDIVK",type="ABC"},
		{name="_COUNT",type="none"},
	},
	BytecodeTag = {
		LBC_VERSION_MIN=3, LBC_VERSION_MAX=6,
		LBC_TYPE_VERSION_MIN=1, LBC_TYPE_VERSION_MAX=3,
		LBC_CONSTANT_NIL=0, LBC_CONSTANT_BOOLEAN=1, LBC_CONSTANT_NUMBER=2,
		LBC_CONSTANT_STRING=3, LBC_CONSTANT_IMPORT=4, LBC_CONSTANT_TABLE=5,
		LBC_CONSTANT_CLOSURE=6, LBC_CONSTANT_VECTOR=7,
	},
	BytecodeType = {
		LBC_TYPE_NIL=0,LBC_TYPE_BOOLEAN=1,LBC_TYPE_NUMBER=2,LBC_TYPE_STRING=3,
		LBC_TYPE_TABLE=4,LBC_TYPE_FUNCTION=5,LBC_TYPE_THREAD=6,LBC_TYPE_USERDATA=7,
		LBC_TYPE_VECTOR=8,LBC_TYPE_BUFFER=9,LBC_TYPE_ANY=15,
		LBC_TYPE_TAGGED_USERDATA_BASE=64,LBC_TYPE_TAGGED_USERDATA_END=64+32,
		LBC_TYPE_OPTIONAL_BIT=bit32.lshift(1,7),LBC_TYPE_INVALID=256,
	},
	CaptureType  = {LCT_VAL=0,LCT_REF=1,LCT_UPVAL=2},
	BuiltinFunction = {
		LBF_NONE=0,LBF_ASSERT=1,LBF_MATH_ABS=2,LBF_MATH_ACOS=3,LBF_MATH_ASIN=4,
		LBF_MATH_ATAN2=5,LBF_MATH_ATAN=6,LBF_MATH_CEIL=7,LBF_MATH_COSH=8,
		LBF_MATH_COS=9,LBF_MATH_DEG=10,LBF_MATH_EXP=11,LBF_MATH_FLOOR=12,
		LBF_MATH_FMOD=13,LBF_MATH_FREXP=14,LBF_MATH_LDEXP=15,LBF_MATH_LOG10=16,
		LBF_MATH_LOG=17,LBF_MATH_MAX=18,LBF_MATH_MIN=19,LBF_MATH_MODF=20,
		LBF_MATH_POW=21,LBF_MATH_RAD=22,LBF_MATH_SINH=23,LBF_MATH_SIN=24,
		LBF_MATH_SQRT=25,LBF_MATH_TANH=26,LBF_MATH_TAN=27,
		LBF_BIT32_ARSHIFT=28,LBF_BIT32_BAND=29,LBF_BIT32_BNOT=30,LBF_BIT32_BOR=31,
		LBF_BIT32_BXOR=32,LBF_BIT32_BTEST=33,LBF_BIT32_EXTRACT=34,
		LBF_BIT32_LROTATE=35,LBF_BIT32_LSHIFT=36,LBF_BIT32_REPLACE=37,
		LBF_BIT32_RROTATE=38,LBF_BIT32_RSHIFT=39,LBF_TYPE=40,
		LBF_STRING_BYTE=41,LBF_STRING_CHAR=42,LBF_STRING_LEN=43,LBF_TYPEOF=44,
		LBF_STRING_SUB=45,LBF_MATH_CLAMP=46,LBF_MATH_SIGN=47,LBF_MATH_ROUND=48,
		LBF_RAWSET=49,LBF_RAWGET=50,LBF_RAWEQUAL=51,LBF_TABLE_INSERT=52,
		LBF_TABLE_UNPACK=53,LBF_VECTOR=54,LBF_BIT32_COUNTLZ=55,LBF_BIT32_COUNTRZ=56,
		LBF_SELECT_VARARG=57,LBF_RAWLEN=58,LBF_BIT32_EXTRACTK=59,
		LBF_GETMETATABLE=60,LBF_SETMETATABLE=61,LBF_TONUMBER=62,LBF_TOSTRING=63,
		LBF_BIT32_BYTESWAP=64,
		LBF_BUFFER_READI8=65,LBF_BUFFER_READU8=66,LBF_BUFFER_WRITEU8=67,
		LBF_BUFFER_READI16=68,LBF_BUFFER_READU16=69,LBF_BUFFER_WRITEU16=70,
		LBF_BUFFER_READI32=71,LBF_BUFFER_READU32=72,LBF_BUFFER_WRITEU32=73,
		LBF_BUFFER_READF32=74,LBF_BUFFER_WRITEF32=75,LBF_BUFFER_READF64=76,
		LBF_BUFFER_WRITEF64=77,
		LBF_VECTOR_MAGNITUDE=78,LBF_VECTOR_NORMALIZE=79,LBF_VECTOR_CROSS=80,
		LBF_VECTOR_DOT=81,LBF_VECTOR_FLOOR=82,LBF_VECTOR_CEIL=83,
		LBF_VECTOR_ABS=84,LBF_VECTOR_SIGN=85,LBF_VECTOR_CLAMP=86,
		LBF_VECTOR_MIN=87,LBF_VECTOR_MAX=88,
	},
	ProtoFlag = {
		LPF_NATIVE_MODULE  = bit32.lshift(1,0),
		LPF_NATIVE_COLD    = bit32.lshift(1,1),
		LPF_NATIVE_FUNCTION= bit32.lshift(1,2),
	},
}
function Luau:INSN_OP(i)  return bit32.band(i,0xFF) end
function Luau:INSN_A(i)   return bit32.band(bit32.rshift(i,8),0xFF) end
function Luau:INSN_B(i)   return bit32.band(bit32.rshift(i,16),0xFF) end
function Luau:INSN_C(i)   return bit32.band(bit32.rshift(i,24),0xFF) end
function Luau:INSN_D(i)   return bit32.rshift(i,16) end
function Luau:INSN_sD(i)
	local D=self:INSN_D(i); return (D>0x7FFF and D<=0xFFFF) and (-(0xFFFF-D)-1) or D
end
function Luau:INSN_E(i)   return bit32.rshift(i,8) end
function Luau:GetBaseTypeString(t, checkOpt)
	local BT=self.BytecodeType
	local tag=bit32.band(t,bit32.bnot(BT.LBC_TYPE_OPTIONAL_BIT))
	local names={[BT.LBC_TYPE_NIL]="nil",[BT.LBC_TYPE_BOOLEAN]="boolean",
		[BT.LBC_TYPE_NUMBER]="number",[BT.LBC_TYPE_STRING]="string",
		[BT.LBC_TYPE_TABLE]="table",[BT.LBC_TYPE_FUNCTION]="function",
		[BT.LBC_TYPE_THREAD]="thread",[BT.LBC_TYPE_USERDATA]="userdata",
		[BT.LBC_TYPE_VECTOR]="Vector3",[BT.LBC_TYPE_BUFFER]="buffer",
		[BT.LBC_TYPE_ANY]="any"}
	local r=names[tag] or "unknown"
	if checkOpt then
		r ..= (bit32.band(t,BT.LBC_TYPE_OPTIONAL_BIT)==0) and "" or "?"
	end
	return r
end
function Luau:GetBuiltinInfo(bfid)
	local BF=self.BuiltinFunction
	local map={
		[BF.LBF_NONE]="none",[BF.LBF_ASSERT]="assert",
		[BF.LBF_TYPE]="type",[BF.LBF_TYPEOF]="typeof",
		[BF.LBF_RAWSET]="rawset",[BF.LBF_RAWGET]="rawget",
		[BF.LBF_RAWEQUAL]="rawequal",[BF.LBF_RAWLEN]="rawlen",
		[BF.LBF_TABLE_UNPACK]="unpack",[BF.LBF_SELECT_VARARG]="select",
		[BF.LBF_GETMETATABLE]="getmetatable",[BF.LBF_SETMETATABLE]="setmetatable",
		[BF.LBF_TONUMBER]="tonumber",[BF.LBF_TOSTRING]="tostring",
		[BF.LBF_MATH_ABS]="math.abs",[BF.LBF_MATH_ACOS]="math.acos",
		[BF.LBF_MATH_ASIN]="math.asin",[BF.LBF_MATH_ATAN2]="math.atan2",
		[BF.LBF_MATH_ATAN]="math.atan",[BF.LBF_MATH_CEIL]="math.ceil",
		[BF.LBF_MATH_COSH]="math.cosh",[BF.LBF_MATH_COS]="math.cos",
		[BF.LBF_MATH_DEG]="math.deg",[BF.LBF_MATH_EXP]="math.exp",
		[BF.LBF_MATH_FLOOR]="math.floor",[BF.LBF_MATH_FMOD]="math.fmod",
		[BF.LBF_MATH_FREXP]="math.frexp",[BF.LBF_MATH_LDEXP]="math.ldexp",
		[BF.LBF_MATH_LOG10]="math.log10",[BF.LBF_MATH_LOG]="math.log",
		[BF.LBF_MATH_MAX]="math.max",[BF.LBF_MATH_MIN]="math.min",
		[BF.LBF_MATH_MODF]="math.modf",[BF.LBF_MATH_POW]="math.pow",
		[BF.LBF_MATH_RAD]="math.rad",[BF.LBF_MATH_SINH]="math.sinh",
		[BF.LBF_MATH_SIN]="math.sin",[BF.LBF_MATH_SQRT]="math.sqrt",
		[BF.LBF_MATH_TANH]="math.tanh",[BF.LBF_MATH_TAN]="math.tan",
		[BF.LBF_MATH_CLAMP]="math.clamp",[BF.LBF_MATH_SIGN]="math.sign",
		[BF.LBF_MATH_ROUND]="math.round",
		[BF.LBF_BIT32_ARSHIFT]="bit32.arshift",[BF.LBF_BIT32_BAND]="bit32.band",
		[BF.LBF_BIT32_BNOT]="bit32.bnot",[BF.LBF_BIT32_BOR]="bit32.bor",
		[BF.LBF_BIT32_BXOR]="bit32.bxor",[BF.LBF_BIT32_BTEST]="bit32.btest",
		[BF.LBF_BIT32_EXTRACT]="bit32.extract",[BF.LBF_BIT32_EXTRACTK]="bit32.extract",
		[BF.LBF_BIT32_LROTATE]="bit32.lrotate",[BF.LBF_BIT32_LSHIFT]="bit32.lshift",
		[BF.LBF_BIT32_REPLACE]="bit32.replace",[BF.LBF_BIT32_RROTATE]="bit32.rrotate",
		[BF.LBF_BIT32_RSHIFT]="bit32.rshift",[BF.LBF_BIT32_COUNTLZ]="bit32.countlz",
		[BF.LBF_BIT32_COUNTRZ]="bit32.countrz",[BF.LBF_BIT32_BYTESWAP]="bit32.byteswap",
		[BF.LBF_STRING_BYTE]="string.byte",[BF.LBF_STRING_CHAR]="string.char",
		[BF.LBF_STRING_LEN]="string.len",[BF.LBF_STRING_SUB]="string.sub",
		[BF.LBF_TABLE_INSERT]="table.insert",[BF.LBF_VECTOR]="Vector3.new",
		[BF.LBF_BUFFER_READI8]="buffer.readi8",[BF.LBF_BUFFER_READU8]="buffer.readu8",
		[BF.LBF_BUFFER_WRITEU8]="buffer.writeu8",[BF.LBF_BUFFER_READI16]="buffer.readi16",
		[BF.LBF_BUFFER_READU16]="buffer.readu16",[BF.LBF_BUFFER_WRITEU16]="buffer.writeu16",
		[BF.LBF_BUFFER_READI32]="buffer.readi32",[BF.LBF_BUFFER_READU32]="buffer.readu32",
		[BF.LBF_BUFFER_WRITEU32]="buffer.writeu32",[BF.LBF_BUFFER_READF32]="buffer.readf32",
		[BF.LBF_BUFFER_WRITEF32]="buffer.writef32",[BF.LBF_BUFFER_READF64]="buffer.readf64",
		[BF.LBF_BUFFER_WRITEF64]="buffer.writef64",
		[BF.LBF_VECTOR_MAGNITUDE]="vector.magnitude",[BF.LBF_VECTOR_NORMALIZE]="vector.normalize",
		[BF.LBF_VECTOR_CROSS]="vector.cross",[BF.LBF_VECTOR_DOT]="vector.dot",
		[BF.LBF_VECTOR_FLOOR]="vector.floor",[BF.LBF_VECTOR_CEIL]="vector.ceil",
		[BF.LBF_VECTOR_ABS]="vector.abs",[BF.LBF_VECTOR_SIGN]="vector.sign",
		[BF.LBF_VECTOR_CLAMP]="vector.clamp",[BF.LBF_VECTOR_MIN]="vector.min",
		[BF.LBF_VECTOR_MAX]="vector.max",
	}
	return map[bfid] or ("builtin#"..tostring(bfid))
end
do
	local raw = Luau.OpCode
	local encoded = {}
	for i, v in raw do
		local case = bit32.band((i-1)*CASE_MULTIPLIER, 0xFF)
		encoded[case] = v
	end
	Luau.OpCode = encoded
end
local DEFAULT_OPTIONS = {
	EnabledRemarks       = {ColdRemark=false, InlineRemark=true},
	DecompilerTimeout    = 10,
	DecompilerMode       = "disasm",
	ReaderFloatPrecision = 7,
	ShowDebugInformation = true,
	ShowInstructionLines = false,
	ShowOperationIndex   = false,
	ShowOperationNames   = false,
	ShowTrivialOperations= true,
	UseTypeInfo          = true,
	ListUsedGlobals      = true,
	ReturnElapsedTime    = true,
	CleanMode            = false,
}
local LuauCompileUserdataInfo = true
pcall(function()
	local ok, r = pcall(function() return game:GetFastFlag("LuauCompileUserdataInfo") end)
	if ok then LuauCompileUserdataInfo = r end
end)
local LuauOpCode        = Luau.OpCode
local LuauBytecodeTag   = Luau.BytecodeTag
local LuauBytecodeType  = Luau.BytecodeType
local LuauCaptureType   = Luau.CaptureType
local LuauProtoFlag     = Luau.ProtoFlag
local function toBoolean(v)      return v ~= 0 end
local function toEscapedString(v)
	if type(v) == "string" then
		return string.format("%q", v)
	end
	return tostring(v)
end
local function formatIndexString(key)
	if type(key) == "string" and key:match("^[%a_][%w_]*$") then
		return "." .. key
	end
	return "[" .. toEscapedString(key) .. "]"
end
local function padLeft(v, ch, n)
	local s = tostring(v); return string.rep(ch, math.max(0, n-#s)) .. s
end
local function padRight(v, ch, n)
	local s = tostring(v); return s .. string.rep(ch, math.max(0, n-#s))
end
local ROBLOX_GLOBALS = {
	"game","workspace","script","plugin","settings","shared","UserSettings",
	"print","warn","error","assert","pcall","xpcall","require","select",
	"pairs","ipairs","next","unpack","type","typeof","tostring","tonumber",
	"setmetatable","getmetatable","rawset","rawget","rawequal","rawlen",
	"math","table","string","bit32","coroutine","os","utf8","task","buffer",
	"Instance","Enum","Vector3","Vector2","CFrame","Color3","BrickColor",
	"UDim","UDim2","Ray","Axes","Faces","NumberRange","NumberSequence",
	"ColorSequence","TweenInfo","RaycastParams","OverlapParams",
	"tick","time","wait","delay","spawn","_G","_VERSION",
}
local ROBLOX_GLOBALS_SET = {}
for _, v in ipairs(ROBLOX_GLOBALS) do ROBLOX_GLOBALS_SET[v] = true end
local function isGlobal(key) return ROBLOX_GLOBALS_SET[key] == true end
local function Decompile(bytecode, options)
	local bytecodeVersion, typeEncodingVersion
	Reader:Set(options.ReaderFloatPrecision)
	local reader = Reader.new(bytecode)
	local function disassemble()
		if bytecodeVersion >= 4 then
			typeEncodingVersion = reader:nextByte()
		end
		local stringTable = {}
		local function readStringTable()
			local n = reader:nextVarInt()
			for i = 1, n do stringTable[i] = reader:nextString() end
		end
		local userdataTypes = {}
		local function readUserdataTypes()
			if LuauCompileUserdataInfo then
				while true do
					local idx = reader:nextByte()
					if idx == 0 then break end
					userdataTypes[idx] = reader:nextVarInt()
				end
			end
		end
		local protoTable = {}
		local function readProtoTable()
			local n = reader:nextVarInt()
			for i = 1, n do
				local protoId = i - 1
				local proto = {
					id=protoId, instructions={}, constants={},
					captures={}, innerProtos={}, instructionLineInfo={},
				}
				protoTable[protoId] = proto
				proto.maxStackSize  = reader:nextByte()
				proto.numParams     = reader:nextByte()
				proto.numUpvalues   = reader:nextByte()
				proto.isVarArg      = toBoolean(reader:nextByte())
				if bytecodeVersion >= 4 then
					proto.flags = reader:nextByte()
					local resultTypedParams, resultTypedUpvalues, resultTypedLocals = {}, {}, {}
					local allTypeInfoSize = reader:nextVarInt()
					local hasTypeInfo = allTypeInfoSize > 0
					proto.hasTypeInfo = hasTypeInfo
					if hasTypeInfo then
						local totalTypedParams   = allTypeInfoSize
						local totalTypedUpvalues = 0
						local totalTypedLocals   = 0
						if typeEncodingVersion and typeEncodingVersion > 1 then
							totalTypedParams   = reader:nextVarInt()
							totalTypedUpvalues = reader:nextVarInt()
							totalTypedLocals   = reader:nextVarInt()
						end
						if totalTypedParams > 0 then
							resultTypedParams = reader:nextBytes(totalTypedParams)
							table.remove(resultTypedParams, 1)
							table.remove(resultTypedParams, 1)
						end
						for j = 1, totalTypedUpvalues do
							resultTypedUpvalues[j] = {type=reader:nextByte()}
						end
						for j = 1, totalTypedLocals do
							local lt  = reader:nextByte()
							local lr  = reader:nextByte()
							local lsp = reader:nextVarInt() + 1
							local lep = reader:nextVarInt() + lsp - 1
							resultTypedLocals[j] = {type=lt, register=lr, startPC=lsp}
						end
					end
					proto.typedParams   = resultTypedParams
					proto.typedUpvalues = resultTypedUpvalues
					proto.typedLocals   = resultTypedLocals
				end
				proto.sizeInstructions = reader:nextVarInt()
				for j = 1, proto.sizeInstructions do
					proto.instructions[j] = reader:nextUInt32()
				end
				proto.sizeConstants = reader:nextVarInt()
				for j = 1, proto.sizeConstants do
					local constType  = reader:nextByte()
					local constValue
					local BT = LuauBytecodeTag
					if constType == BT.LBC_CONSTANT_BOOLEAN then
						constValue = toBoolean(reader:nextByte())
					elseif constType == BT.LBC_CONSTANT_NUMBER then
						constValue = reader:nextDouble()
					elseif constType == BT.LBC_CONSTANT_STRING then
						constValue = stringTable[reader:nextVarInt()]
					elseif constType == BT.LBC_CONSTANT_IMPORT then
						local id = reader:nextUInt32()
						local idxCount = bit32.rshift(id, 30)
						local ci1 = bit32.band(bit32.rshift(id,20), 0x3FF)
						local ci2 = bit32.band(bit32.rshift(id,10), 0x3FF)
						local ci3 = bit32.band(id, 0x3FF)
						local tag = ""
						local function kv(idx) return proto.constants[idx+1] end
						if     idxCount == 1 then tag = tostring(kv(ci1) and kv(ci1).value or "")
						elseif idxCount == 2 then tag = tostring(kv(ci1) and kv(ci1).value or "")
							.."."..tostring(kv(ci2) and kv(ci2).value or "")
						elseif idxCount == 3 then tag = tostring(kv(ci1) and kv(ci1).value or "")
							.."."..tostring(kv(ci2) and kv(ci2).value or "")
							.."."..tostring(kv(ci3) and kv(ci3).value or "")
						end
						constValue = tag
					elseif constType == BT.LBC_CONSTANT_TABLE then
						local sz = reader:nextVarInt()
						local keys = {}
						for k = 1, sz do keys[k] = reader:nextVarInt()+1 end
						constValue = {size=sz, keys=keys}
					elseif constType == BT.LBC_CONSTANT_CLOSURE then
						constValue = reader:nextVarInt() + 1
					elseif constType == BT.LBC_CONSTANT_VECTOR then
						local x,y,z,w = reader:nextFloat(),reader:nextFloat(),reader:nextFloat(),reader:nextFloat()
						constValue = w == 0 and ("Vector3.new("..x..","..y..","..z..")")
							or ("vector.create("..x..","..y..","..z..","..w..")")
					end
					proto.constants[j] = {type=constType, value=constValue}
				end
				proto.sizeInnerProtos = reader:nextVarInt()
				for j = 1, proto.sizeInnerProtos do
					proto.innerProtos[j] = protoTable[reader:nextVarInt()]
				end
				proto.lineDefined = reader:nextVarInt()
				local nameId = reader:nextVarInt()
				proto.name = stringTable[nameId]
				local hasLineInfo = toBoolean(reader:nextByte())
				proto.hasLineInfo = hasLineInfo
				if hasLineInfo then
					local lgap = reader:nextByte()
					local baselineSize = bit32.rshift(proto.sizeInstructions-1, lgap)+1
					local smallLineInfo, absLineInfo = {}, {}
					local lastOffset, lastLine = 0, 0
					for j = 1, proto.sizeInstructions do
						local b = reader:nextSignedByte()
						lastOffset += b
						smallLineInfo[j] = lastOffset
					end
					for j = 1, baselineSize do
						local lc = lastLine + reader:nextInt32()
						absLineInfo[j-1] = lc
						lastLine = lc
					end
					local resultLineInfo = {}
					for j, line in ipairs(smallLineInfo) do
						local absIdx = bit32.rshift(j-1, lgap)
						local absLine = absLineInfo[absIdx]
						local rl = line + absLine
						if lgap <= 1 and (-line == absLine) then
							rl += absLineInfo[absIdx+1] or 0
						end
						if rl <= 0 then rl += 0x100 end
						resultLineInfo[j] = rl
					end
					proto.lineInfoSize = lgap
					proto.instructionLineInfo = resultLineInfo
				end
				local hasDebugInfo = toBoolean(reader:nextByte())
				proto.hasDebugInfo = hasDebugInfo
				if hasDebugInfo then
					local totalLocals = reader:nextVarInt()
					local debugLocals = {}
					for j = 1, totalLocals do
						debugLocals[j] = {
							name     = stringTable[reader:nextVarInt()],
							startPC  = reader:nextVarInt(),
							endPC    = reader:nextVarInt(),
							register = reader:nextByte(),
						}
					end
					proto.debugLocals = debugLocals
					local totalUpvals = reader:nextVarInt()
					local debugUpvalues = {}
					for j = 1, totalUpvals do
						debugUpvalues[j] = {name=stringTable[reader:nextVarInt()]}
					end
					proto.debugUpvalues = debugUpvalues
				end
			end
		end
		readStringTable()
		if bytecodeVersion and bytecodeVersion > 5 then readUserdataTypes() end
		readProtoTable()
		local mainProtoId = reader:nextVarInt()
		return mainProtoId, protoTable
	end
	local function organize()
		local mainProtoId, protoTable = disassemble()
		local mainProto = protoTable[mainProtoId]
		mainProto.main = true
		local registerActions = {}
		local function baseProto(proto)
			local protoRegisterActions = {}
			registerActions[proto.id] = {proto=proto, actions=protoRegisterActions}
			local instructions = proto.instructions
			local innerProtos  = proto.innerProtos
			local constants    = proto.constants
			local captures     = proto.captures
			local flags        = proto.flags
			local function collectCaptures(baseIdx, p)
				local nup = p.numUpvalues
				if nup > 0 then
					local _c = p.captures
					for j = 1, nup do
						local cap = instructions[baseIdx + j]
						local ctype = Luau:INSN_A(cap)
						local sreg  = Luau:INSN_B(cap)
						if ctype == LuauCaptureType.LCT_VAL or ctype == LuauCaptureType.LCT_REF then
							_c[j-1] = sreg
						elseif ctype == LuauCaptureType.LCT_UPVAL then
							_c[j-1] = captures[sreg]
						end
					end
				end
			end
			local function writeFlags()
				if type(flags) == "table" then return end
				local rawFlags = type(flags) == "number" and flags or 0
				local df = {}
				if proto.main then
					df.native = toBoolean(bit32.band(rawFlags, LuauProtoFlag.LPF_NATIVE_MODULE))
				else
					df.native = toBoolean(bit32.band(rawFlags, LuauProtoFlag.LPF_NATIVE_FUNCTION))
					df.cold   = toBoolean(bit32.band(rawFlags, LuauProtoFlag.LPF_NATIVE_COLD))
				end
				flags = df; proto.flags = df
			end
			local function writeInstructions()
				local auxSkip = false
				local function reg(act, regs, extra, hide)
					table.insert(protoRegisterActions, {
						usedRegisters=regs or {}, extraData=extra,
						opCode=act, hide=hide
					})
				end
				for idx, instruction in ipairs(instructions) do
					if auxSkip then auxSkip=false; continue end
					local oci = LuauOpCode[Luau:INSN_OP(instruction)]
					if not oci then continue end
					local opn  = oci.name
					local opt  = oci.type
					local isAux= oci.aux == true
					local A,B,C,sD,D,E,aux
					if     opt=="A"   then A=Luau:INSN_A(instruction)
					elseif opt=="E"   then E=Luau:INSN_E(instruction)
					elseif opt=="AB"  then A=Luau:INSN_A(instruction); B=Luau:INSN_B(instruction)
					elseif opt=="AC"  then A=Luau:INSN_A(instruction); C=Luau:INSN_C(instruction)
					elseif opt=="ABC" then A=Luau:INSN_A(instruction); B=Luau:INSN_B(instruction); C=Luau:INSN_C(instruction)
					elseif opt=="AD"  then A=Luau:INSN_A(instruction); D=Luau:INSN_D(instruction)
					elseif opt=="AsD" then A=Luau:INSN_A(instruction); sD=Luau:INSN_sD(instruction)
					elseif opt=="sD"  then sD=Luau:INSN_sD(instruction)
					end
					if isAux then
						auxSkip=true; reg(oci,nil,nil,true)
						aux=instructions[idx+1]
					end
					local st = not options.ShowTrivialOperations
					if opn=="NOP" or opn=="BREAK" or opn=="NATIVECALL" then reg(oci,nil,nil,st)
					elseif opn=="LOADNIL" then reg(oci,{A})
					elseif opn=="LOADB"   then reg(oci,{A},{B,C})
					elseif opn=="LOADN"   then reg(oci,{A},{sD})
					elseif opn=="LOADK"   then reg(oci,{A},{D})
					elseif opn=="MOVE"    then reg(oci,{A,B})
					elseif opn=="GETGLOBAL" or opn=="SETGLOBAL" then reg(oci,{A},{aux})
					elseif opn=="GETUPVAL" or opn=="SETUPVAL"  then reg(oci,{A},{B})
					elseif opn=="CLOSEUPVALS" then reg(oci,{A},nil,st)
					elseif opn=="GETIMPORT" then reg(oci,{A},{D,aux})
					elseif opn=="GETTABLE" or opn=="SETTABLE" then reg(oci,{A,B,C})
					elseif opn=="GETTABLEKS" or opn=="SETTABLEKS" then reg(oci,{A,B},{C,aux})
					elseif opn=="GETTABLEN" or opn=="SETTABLEN" then reg(oci,{A,B},{C})
					elseif opn=="NEWCLOSURE" then
						reg(oci,{A},{D})
						local p2=innerProtos[D+1]
						if p2 then collectCaptures(idx,p2); baseProto(p2) end
					elseif opn=="DUPCLOSURE" then
						reg(oci,{A},{D})
						local c=constants[D+1]
						if c then local p2=protoTable[c.value-1]; if p2 then collectCaptures(idx,p2); baseProto(p2) end end
					elseif opn=="NAMECALL"  then reg(oci,{A,B},{C,aux},st)
					elseif opn=="CALL"      then reg(oci,{A},{B,C})
					elseif opn=="RETURN"    then reg(oci,{A},{B})
					elseif opn=="JUMP" or opn=="JUMPBACK" then reg(oci,{},{sD})
					elseif opn=="JUMPIF" or opn=="JUMPIFNOT" then reg(oci,{A},{sD})
					elseif opn=="JUMPIFEQ" or opn=="JUMPIFLE" or opn=="JUMPIFLT"
					    or opn=="JUMPIFNOTEQ" or opn=="JUMPIFNOTLE" or opn=="JUMPIFNOTLT" then
						reg(oci,{A,aux},{sD})
					elseif opn=="ADD" or opn=="SUB" or opn=="MUL" or opn=="DIV"
					    or opn=="MOD" or opn=="POW" then reg(oci,{A,B,C})
					elseif opn=="ADDK" or opn=="SUBK" or opn=="MULK" or opn=="DIVK"
					    or opn=="MODK" or opn=="POWK" then reg(oci,{A,B},{C})
					elseif opn=="AND" or opn=="OR" then reg(oci,{A,B,C})
					elseif opn=="ANDK" or opn=="ORK" then reg(oci,{A,B},{C})
					elseif opn=="CONCAT" then
						local regs={A}
						for r=B,C do table.insert(regs,r) end
						reg(oci,regs)
					elseif opn=="NOT" or opn=="MINUS" or opn=="LENGTH" then reg(oci,{A,B})
					elseif opn=="NEWTABLE" then reg(oci,{A},{B,aux})
					elseif opn=="DUPTABLE" then reg(oci,{A},{D})
					elseif opn=="SETLIST"  then
						if C~=0 then
							local regs={A,B}
							for k=1,C-2 do table.insert(regs,A+k) end
							reg(oci,regs,{aux,C})
						else reg(oci,{A,B},{aux,C}) end
					elseif opn=="FORNPREP" then reg(oci,{A,A+1,A+2},{sD})
					elseif opn=="FORNLOOP" then reg(oci,{A},{sD})
					elseif opn=="FORGLOOP" then
						local nv=bit32.band(aux or 0,0xFF)
						local regs={}
						for k=1,nv do table.insert(regs,A+k) end
						reg(oci,regs,{sD,aux})
					elseif opn=="FORGPREP_INEXT" or opn=="FORGPREP_NEXT" then reg(oci,{A,A+1})
					elseif opn=="FORGPREP"  then reg(oci,{A},{sD})
					elseif opn=="GETVARARGS" then
						if B~=0 then
							local regs={A}
							for k=0,B-1 do table.insert(regs,A+k) end
							reg(oci,regs,{B})
						else reg(oci,{A},{B}) end
					elseif opn=="PREPVARARGS" then reg(oci,{},{A},st)
					elseif opn=="LOADKX"  then reg(oci,{A},{aux})
					elseif opn=="JUMPX"   then reg(oci,{},{E})
					elseif opn=="COVERAGE" then reg(oci,{},{E},st)
					elseif opn=="JUMPXEQKNIL" or opn=="JUMPXEQKB"
					    or opn=="JUMPXEQKN"   or opn=="JUMPXEQKS" then
						reg(oci,{A},{sD,aux})
					elseif opn=="CAPTURE" then reg(oci,nil,nil,st)
					elseif opn=="SUBRK" or opn=="DIVRK" then reg(oci,{A,C},{B})
					elseif opn=="IDIV"  then reg(oci,{A,B,C})
					elseif opn=="IDIVK" then reg(oci,{A,B},{C})
					elseif opn=="FASTCALL"  then reg(oci,{},{A,C},st)
					elseif opn=="FASTCALL1" then reg(oci,{B},{A,C},st)
					elseif opn=="FASTCALL2" then
						local r2=bit32.band(aux or 0,0xFF)
						reg(oci,{B,r2},{A,C},st)
					elseif opn=="FASTCALL2K" then reg(oci,{B},{A,C,aux},st)
					elseif opn=="FASTCALL3" then
						local r2=bit32.band(aux or 0,0xFF)
						local r3=bit32.rshift(r2,8)
						reg(oci,{B,r2,r3},{A,C},st)
					end
				end
			end
			writeFlags()
			writeInstructions()
		end
		baseProto(mainProto)
		return mainProtoId, registerActions, protoTable
	end
	local function finalize(mainProtoId, registerActions, protoTable)
		local finalResult = ""
		local totalParameters = 0
		local usedGlobals    = {}
		local usedGlobalsSet = {}
		local function isValidGlobal(key)
			if usedGlobalsSet[key] then return false end
			return not isGlobal(key)
		end
		local function processResult(res)
			local embed = ""
			if options.ListUsedGlobals and #usedGlobals > 0 then
				embed = string.format(Strings.USED_GLOBALS, table.concat(usedGlobals, ", "))
			end
			return embed .. res
		end
		if options.DecompilerMode == "disasm" then
			local resultParts = {}
			local function emit(s) resultParts[#resultParts + 1] = s end
			local function writeActions(protoActions)
				local actions  = protoActions.actions
				local proto    = protoActions.proto
				local lineInfo = proto.instructionLineInfo
				local inner    = proto.innerProtos
				local consts   = proto.constants
				local caps     = proto.captures
				local pflags   = proto.flags
				local numParams= proto.numParams
				local jumpMarkers = {}
				local function makeJump(idx) idx-=1; jumpMarkers[idx]=(jumpMarkers[idx] or 0)+1 end
				totalParameters += numParams
				if proto.main and pflags and pflags.native then emit("--!native\n") end
				local function buildRegNames(instrIdx)
					local names = {}
					if proto.debugLocals then
						for _, dl in ipairs(proto.debugLocals) do
							if instrIdx >= dl.startPC and instrIdx <= dl.endPC then
								names[dl.register] = dl.name
							end
						end
					end
					return names
				end
				local function fmtUpv(r)
					if r == nil then return "upv_unknown" end
					local du = proto.debugUpvalues
					if du then
						local entry = du[r + 1]
						if entry and entry.name and entry.name ~= "" then
							return entry.name
						end
					end
					local capturedReg = caps[r]
					if capturedReg ~= nil and proto.debugLocals then
						for _, dl in ipairs(proto.debugLocals) do
							if dl.register == capturedReg and dl.name and dl.name ~= "" then
								return dl.name
							end
						end
					end
					return "upv_" .. tostring(r)
				end
				local regNameCache = {}
				local function fmtReg(r, instrIdx)
					if instrIdx and proto.debugLocals then
						local cached = regNameCache[instrIdx]
						if not cached then
							cached = buildRegNames(instrIdx)
							regNameCache[instrIdx] = cached
						end
						if cached[r] and cached[r] ~= "" then
							return cached[r]
						end
					end
					local pr = r+1
					if pr < numParams+1 then
						return "p"..((totalParameters-numParams)+pr)
					end
					return "v"..(r-numParams)
				end
				local function paramName(j)
					if proto.debugLocals then
						for _, dl in ipairs(proto.debugLocals) do
							if dl.startPC == 0 and dl.register == j-1 then
								return dl.name
							end
						end
					end
					return "p"..(totalParameters+j)
				end
				local function fmtConst(k)
					if not k then return "nil" end
					if k.type == LuauBytecodeTag.LBC_CONSTANT_VECTOR then
						return tostring(k.value)
					end
					if type(tonumber(k.value))=="number" then
						return tostring(tonumber(string.format("%0."..options.ReaderFloatPrecision.."f", k.value)))
					end
					return toEscapedString(k.value)
				end
				local function fmtProto(p)
					local body=""
					if p.flags and p.flags.native then
						if p.flags.cold and options.EnabledRemarks.ColdRemark then
							body ..= string.format(Strings.DECOMPILER_REMARK,
								"This function is marked cold and is not compiled natively")
						end
						body ..= "@native "
					end
					if p.name then body="local function "..p.name
					else body="function" end
					body ..= "("
					for j=1,p.numParams do
						local pb=paramName(j)
						if p.hasTypeInfo and options.UseTypeInfo and p.typedParams and p.typedParams[j] then
							pb ..= ": "..Luau:GetBaseTypeString(p.typedParams[j],true)
						end
						if j~=p.numParams then pb ..= ", " end
						body ..= pb
					end
					if p.isVarArg then
						body ..= (p.numParams>0) and ", ..." or "..."
					end
					body ..= ")\n"
					if options.ShowDebugInformation then
						body ..= "-- proto pool id: "..p.id.."\n"
						body ..= "-- num upvalues: "..p.numUpvalues.."\n"
						body ..= "-- num inner protos: "..(p.sizeInnerProtos or 0).."\n"
						body ..= "-- size instructions: "..(p.sizeInstructions or 0).."\n"
						body ..= "-- size constants: "..(p.sizeConstants or 0).."\n"
						body ..= "-- lineinfo gap: "..(p.lineInfoSize or "n/a").."\n"
						body ..= "-- max stack size: "..p.maxStackSize.."\n"
						body ..= "-- is typed: "..tostring(p.hasTypeInfo).."\n"
					end
					return body
				end
				local function writeProto(reg, p)
					local body=fmtProto(p)
					if p.name then
						emit("\n"..body)
						writeActions(registerActions[p.id])
						if not options.CleanMode then
							emit("end\n"..fmtReg(reg).." = "..p.name)
						else
							emit("end")
						end
					else
						emit(fmtReg(reg).." = "..body)
						writeActions(registerActions[p.id])
						emit("end")
					end
				end
				local CLEAN_SUPPRESS = {
					CLOSEUPVALS=true, PREPVARARGS=true, COVERAGE=true,
					CAPTURE=true, FASTCALL=true, FASTCALL1=true,
					FASTCALL2=true, FASTCALL2K=true, FASTCALL3=true,
					JUMPX=true, NOP=true, JUMPBACK=true,
				}
				for i, action in ipairs(actions) do
					if action.hide then continue end
					local ur  = action.usedRegisters
					local ed  = action.extraData
					local oci = action.opCode
					if not oci then continue end
					local opn = oci.name
					if options.CleanMode and CLEAN_SUPPRESS[opn] then continue end
					if options.CleanMode and opn == "RETURN" then
						local b = ed and ed[1] or 0
						if b == 1 then continue end
					end
					if options.CleanMode and opn == "MOVE" and
					   i > 1 and actions[i-1] and
					   (actions[i-1].opCode.name == "NEWCLOSURE" or
					    actions[i-1].opCode.name == "DUPCLOSURE") then
						continue
					end
					local function R(r) return fmtReg(r, i) end
					local function handleJumps()
						local n = jumpMarkers[i]
						if n then
							jumpMarkers[i]=nil
						for _=1,n do emit("end\n") end
						end
					end
					if not options.CleanMode then
						if options.ShowOperationIndex then
							emit("["..padLeft(i,"0",3).."] ")
						end
						if options.ShowInstructionLines and lineInfo and lineInfo[i] then
							emit(":"..padLeft(lineInfo[i],"0",3)..":")
						end
						if options.ShowOperationNames then
							emit(padRight(opn," ",15))
						end
					end
					if opn=="LOADNIL" then emit(R(ur[1]).." = nil")
					elseif opn=="LOADB" then
						emit(R(ur[1]).." = "..toEscapedString(toBoolean(ed[1])))
						if ed[2]~=0 then emit(" +"..ed[2]) end
					elseif opn=="LOADN" then emit(R(ur[1]).." = "..ed[1])
					elseif opn=="LOADK" then emit(R(ur[1]).." = "..fmtConst(consts[ed[1]+1]))
					elseif opn=="MOVE"  then emit(R(ur[1]).." = "..R(ur[2]))
					elseif opn=="GETGLOBAL" then
						local gk=tostring(consts[ed[1]+1] and consts[ed[1]+1].value or "")
						if options.ListUsedGlobals and isValidGlobal(gk) then
							table.insert(usedGlobals,gk); usedGlobalsSet[gk]=true
						end
						emit(R(ur[1]).." = "..gk)
					elseif opn=="SETGLOBAL" then
						local gk=tostring(consts[ed[1]+1] and consts[ed[1]+1].value or "")
						if options.ListUsedGlobals and isValidGlobal(gk) then
							table.insert(usedGlobals,gk); usedGlobalsSet[gk]=true
						end
						emit(gk.." = "..R(ur[1]))
					elseif opn=="GETUPVAL" then
						local slot=ed[1]; local rc=caps[slot]
						emit(R(ur[1]).." = "..fmtUpv(rc))
					elseif opn=="SETUPVAL" then
						local slot=ed[1]; local rc=caps[slot]
						emit(fmtUpv(rc).." = "..R(ur[1]))
					elseif opn=="CLOSEUPVALS" then emit("-- clear captures from back until: "..ur[1])
					elseif opn=="GETIMPORT" then
						local imp=tostring(consts[ed[1]+1] and consts[ed[1]+1].value or "")
						imp=imp:gsub("%.%.+","."):gsub("^%.",""):gsub("%.$","")
						local totalIdx = bit32.rshift(ed[2] or 0, 30)
						if totalIdx==1 and options.ListUsedGlobals and isValidGlobal(imp) then
							table.insert(usedGlobals,imp); usedGlobalsSet[imp]=true
						end
						emit(R(ur[1]).." = "..imp)
					elseif opn=="GETTABLE" then
						emit(R(ur[1]).." = "..R(ur[2]).."["..R(ur[3]).."]")
					elseif opn=="SETTABLE" then
						emit(R(ur[2]).."["..R(ur[3]).."] = "..R(ur[1]))
					elseif opn=="GETTABLEKS" then
						local key = consts[ed[2]+1] and consts[ed[2]+1].value
						emit(R(ur[1]).." = "..R(ur[2])..formatIndexString(key))
					elseif opn=="SETTABLEKS" then
						local key = consts[ed[2]+1] and consts[ed[2]+1].value
						emit(R(ur[2])..formatIndexString(key).." = "..R(ur[1]))
					elseif opn=="GETTABLEN" then
						emit(R(ur[1]).." = "..R(ur[2]).."["..(ed[1]+1).."]")
					elseif opn=="SETTABLEN" then
						emit(R(ur[2]).."["..(ed[1]+1).."] = "..R(ur[1]))
					elseif opn=="NEWCLOSURE" then
						local p2=inner[ed[1]+1]; if p2 then writeProto(ur[1],p2) end
					elseif opn=="DUPCLOSURE" then
						local c=consts[ed[1]+1]
						if c then
							local p2=protoTable[c.value-1]; if p2 then writeProto(ur[1],p2) end
						end
					elseif opn=="NAMECALL" then
						if not options.CleanMode then
							local method=tostring(consts[ed[2]+1] and consts[ed[2]+1].value or "")
							emit("-- :"..method)
						end
					elseif opn=="CALL" then
						local baseR=ur[1]
						local nArgs=ed[1]-1; local nRes=ed[2]-1
						local nmMethod=""; local argOff=0
						local prev=actions[i-1]
						if prev and prev.opCode and prev.opCode.name=="NAMECALL" then
							nmMethod=":"..tostring(consts[prev.extraData[2]+1] and consts[prev.extraData[2]+1].value or "")
							nArgs-=1; argOff+=1
						end
						local callBody=""
						if nRes==-1 then
							callBody=""
						elseif nRes>0 then
							local rb=""
							for k=1,nRes do
								rb..=R(baseR+k-1)
								if k~=nRes then rb..=", " end
							end
							callBody=rb.." = "
						end
						callBody ..= R(baseR)..nmMethod.."("
						if nArgs==-1 then callBody..="..."
						elseif nArgs>0 then
							local ab=""
							for k=1,nArgs do
								ab..=R(baseR+k+argOff)
								if k~=nArgs then ab..=", " end
							end
							callBody..=ab
						end
						callBody..=")"
						emit(callBody)
					elseif opn=="RETURN" then
						local baseR=ur[1]; local tot=ed[1]-2
						local rb=""
						if tot==-2 then rb=" "..R(baseR)..", ..."
						elseif tot>-1 then
							rb=" "
							for k=0,tot do
								rb..=R(baseR+k)
								if k~=tot then rb..=", " end
							end
						end
						emit("return"..rb)
					elseif opn=="JUMP" then emit("-- jump to #"..(i+ed[1]))
					elseif opn=="JUMPBACK" then emit("-- jump back to #"..(i+ed[1]+1))
					elseif opn=="JUMPIF" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if not "..R(ur[1]).." then -- goto #"..ei)
					elseif opn=="JUMPIFNOT" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." then -- goto #"..ei)
					elseif opn=="JUMPIFEQ" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." == "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="JUMPIFLE" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." >= "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="JUMPIFLT" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." > "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="JUMPIFNOTEQ" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." ~= "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="JUMPIFNOTLE" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." <= "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="JUMPIFNOTLT" then
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." < "..R(ur[2]).." then -- goto #"..ei)
					elseif opn=="ADD"  then emit(R(ur[1]).." = "..R(ur[2]).." + "..R(ur[3]))
					elseif opn=="SUB"  then emit(R(ur[1]).." = "..R(ur[2]).." - "..R(ur[3]))
					elseif opn=="MUL"  then emit(R(ur[1]).." = "..R(ur[2]).." * "..R(ur[3]))
					elseif opn=="DIV"  then emit(R(ur[1]).." = "..R(ur[2]).." / "..R(ur[3]))
					elseif opn=="MOD"  then emit(R(ur[1]).." = "..R(ur[2]).." % "..R(ur[3]))
					elseif opn=="POW"  then emit(R(ur[1]).." = "..R(ur[2]).." ^ "..R(ur[3]))
					elseif opn=="ADDK" then emit(R(ur[1]).." = "..R(ur[2]).." + "..fmtConst(consts[ed[1]+1]))
					elseif opn=="SUBK" then emit(R(ur[1]).." = "..R(ur[2]).." - "..fmtConst(consts[ed[1]+1]))
					elseif opn=="MULK" then emit(R(ur[1]).." = "..R(ur[2]).." * "..fmtConst(consts[ed[1]+1]))
					elseif opn=="DIVK" then emit(R(ur[1]).." = "..R(ur[2]).." / "..fmtConst(consts[ed[1]+1]))
					elseif opn=="MODK" then emit(R(ur[1]).." = "..R(ur[2]).." % "..fmtConst(consts[ed[1]+1]))
					elseif opn=="POWK" then emit(R(ur[1]).." = "..R(ur[2]).." ^ "..fmtConst(consts[ed[1]+1]))
					elseif opn=="AND"  then emit(R(ur[1]).." = "..R(ur[2]).." and "..R(ur[3]))
					elseif opn=="OR"   then emit(R(ur[1]).." = "..R(ur[2]).." or "..R(ur[3]))
					elseif opn=="ANDK" then emit(R(ur[1]).." = "..R(ur[2]).." and "..fmtConst(consts[ed[1]+1]))
					elseif opn=="ORK"  then emit(R(ur[1]).." = "..R(ur[2]).." or "..fmtConst(consts[ed[1]+1]))
					elseif opn=="CONCAT" then
						local tgt=table.remove(ur,1)
						local cb=""
						for k,r in ipairs(ur) do
							cb..=fmtReg(r); if k~=#ur then cb..=" .. " end
						end
						emit(R(tgt).." = "..cb)
					elseif opn=="NOT"    then emit(R(ur[1]).." = not "..R(ur[2]))
					elseif opn=="MINUS"  then emit(R(ur[1]).." = -"..R(ur[2]))
					elseif opn=="LENGTH" then emit(R(ur[1]).." = #"..R(ur[2]))
					elseif opn=="NEWTABLE" then
						emit(R(ur[1]).." = {}")
						if options.ShowDebugInformation and ed[2] and ed[2]>0 then
							emit(" ")
						end
					elseif opn=="DUPTABLE" then
						local cv=consts[ed[1]+1]
						if cv and type(cv.value)=="table" then
							local tb="{"
							for k=1,cv.value.size do
								tb..=fmtConst(consts[cv.value.keys[k]])
								if k~=cv.value.size then tb..=", " end
							end
							emit(R(ur[1]).." = {} -- "..tb.."}")
						else emit(R(ur[1]).." = {}") end
					elseif opn=="SETLIST" then
						local tgt=ur[1]; local src=ur[2]
						local si=ed[1]; local vc=ed[2]
						if vc==0 then
							emit(R(tgt).."["..si.."] = [...]")
						else
							local tot2=#ur-1; local cb=""
							for k=1,tot2 do
								cb..=R(ur[k]).."["..(si+k-1).."] = "..R(src+k-1)
								if k~=tot2 then cb..="\n" end
							end
							emit(cb)
						end
					elseif opn=="FORNPREP" then
						emit("for "..R(ur[3]).." = "..R(ur[3])..", "..R(ur[1])..", "..R(ur[2]).." do -- end at #"..(i+ed[1]))
					elseif opn=="FORNLOOP" then
						emit("end -- iterate + jump to #"..(i+ed[1]))
					elseif opn=="FORGLOOP" then
						emit("end -- iterate + jump to #"..(i+ed[1]))
					elseif opn=="FORGPREP_INEXT" then
						local base=ur[1]
						emit("for "..R(base+3)..", "..R(base+4).." in ipairs("..R(base)..") do")
					elseif opn=="FORGPREP_NEXT" then
						local base=ur[1]
						emit("for "..R(base+3)..", "..R(base+4).." in pairs("..R(base)..") do")
					elseif opn=="FORGPREP" then
						local ei=i+ed[1]+2
						local ea=actions[ei]
						local vb=""
						if ea and ea.usedRegisters and #ea.usedRegisters > 0 then
							for k,r in ipairs(ea.usedRegisters) do
								vb..=fmtReg(r, ei); if k~=#ea.usedRegisters then vb..=", " end
							end
						else
							local baseReg=ur[1]; local nVars=2
							if ea and ea.extraData and ea.extraData[2] then
								nVars=math.max(1, bit32.band(ea.extraData[2], 0xFF))
							end
							local parts={}
							for k=1,nVars do parts[k]=fmtReg(baseReg+2+(k-1), i) end
							vb=table.concat(parts, ", ")
						end
						emit("for "..vb.." in "..R(ur[1]).." do -- end at #"..ei)
					elseif opn=="GETVARARGS" then
						local vc2=ed[1]-1
						local rb=""
						if vc2==-1 then rb=R(ur[1])
						else
							for k=1,vc2 do
								rb..=R(ur[k]); if k~=vc2 then rb..=", " end
							end
						end
						emit(rb.." = ...")
					elseif opn=="PREPVARARGS" then emit("-- ... ; number of fixed args: "..ed[1])
					elseif opn=="LOADKX" then emit(R(ur[1]).." = "..fmtConst(consts[ed[1]+1]))
					elseif opn=="JUMPX"    then emit("-- jump to #"..(i+ed[1]))
					elseif opn=="COVERAGE" then emit("-- coverage ("..ed[1]..")")
					elseif opn=="JUMPXEQKNIL" then
						local rev=bit32.rshift(ed[2] or 0,0x1F)~=1
						local sign=rev and "~=" or "=="
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." "..sign.." nil then -- goto #"..ei)
					elseif opn=="JUMPXEQKB" then
						local val=tostring(toBoolean(bit32.band(ed[2] or 0,1)))
						local rev=bit32.rshift(ed[2] or 0,0x1F)~=1
						local sign=rev and "~=" or "=="
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." "..sign.." "..val.." then -- goto #"..ei)
					elseif opn=="JUMPXEQKN" or opn=="JUMPXEQKS" then
						local cidx=bit32.band(ed[2] or 0,0xFFFFFF)
						local val=fmtConst(consts[cidx+1])
						local rev=bit32.rshift(ed[2] or 0,0x1F)~=1
						local sign=rev and "~=" or "=="
						local ei=i+ed[1]; makeJump(ei)
						emit("if "..R(ur[1]).." "..sign.." "..val.." then -- goto #"..ei)
					elseif opn=="CAPTURE"  then emit("-- upvalue capture")
					elseif opn=="SUBRK"    then emit(R(ur[1]).." = "..fmtConst(consts[ed[1]+1]).." - "..R(ur[2]))
					elseif opn=="DIVRK"    then emit(R(ur[1]).." = "..fmtConst(consts[ed[1]+1]).." / "..R(ur[2]))
					elseif opn=="IDIV"     then emit(R(ur[1]).." = "..R(ur[2]).." // "..R(ur[3]))
					elseif opn=="IDIVK"    then emit(R(ur[1]).." = "..R(ur[2]).." // "..fmtConst(consts[ed[1]+1]))
					elseif opn=="FASTCALL" then emit("-- FASTCALL; "..Luau:GetBuiltinInfo(ed[1]).."()")
					elseif opn=="FASTCALL1" then emit("-- FASTCALL1; "..Luau:GetBuiltinInfo(ed[1]).."("..R(ur[1])..")")
					elseif opn=="FASTCALL2" then emit("-- FASTCALL2; "..Luau:GetBuiltinInfo(ed[1]).."("..R(ur[1])..", "..R(ur[2])..")")
					elseif opn=="FASTCALL2K" then
						emit("-- FASTCALL2K; "..Luau:GetBuiltinInfo(ed[1]).."("..R(ur[1])..", "..fmtConst(consts[(ed[3] or 0)+1])..")")
					elseif opn=="FASTCALL3" then
						emit("-- FASTCALL3; "..Luau:GetBuiltinInfo(ed[1]).."("..R(ur[1])..", "..R(ur[2])..", "..R(ur[3])..")")
					end
					emit("\n")
					handleJumps()
				end
			end
			writeActions(registerActions[mainProtoId])
			finalResult = processResult(table.concat(resultParts))
elseif options.DecompilerMode == "lift" then
    local resultParts = {}
    local function emit(s) resultParts[#resultParts + 1] = s end
    local indent = 0
    local function ind() return string.rep("    ", indent) end
    local function emitLine(s) emit(ind() .. s .. "\n") end
    local BINOP = {
        ADD="+", SUB="-", MUL="*", DIV="/", MOD="%", POW="^",
        ADDK="+", SUBK="-", MULK="*", DIVK="/", MODK="%", POWK="^",
        IDIV="//", IDIVK="//",
        AND="and", OR="or", ANDK="and", ORK="or",
        CONCAT="..",
    }
    local UNOP = { NOT="not ", MINUS="-", LENGTH="#" }
    local CMPOP = {
        JUMPIFEQ="==", JUMPIFLE=">=", JUMPIFLT=">",
        JUMPIFNOTEQ="~=", JUMPIFNOTLE="<=", JUMPIFNOTLT="<",
    }
    local CMPOP_INV = {
        JUMPIFEQ="~=", JUMPIFLE="<", JUMPIFLT="<=",
        JUMPIFNOTEQ="==", JUMPIFNOTLE=">=", JUMPIFNOTLT=">",
    }
    local function analyzeFlow(actions)
        local fwdJumps  = {}
        local backJumps = {}
        local loopHeads = {}
        local loopEnds  = {}
        for i, action in ipairs(actions) do
            if action.hide then continue end
            local opn = action.opCode and action.opCode.name
            if not opn then continue end
            local ed = action.extraData
            if CMPOP[opn] or opn == "JUMPIF" or opn == "JUMPIFNOT"
                or opn == "JUMPXEQKNIL" or opn == "JUMPXEQKB"
                or opn == "JUMPXEQKN"   or opn == "JUMPXEQKS" then
                local offset = ed and ed[1] or 0
                local tgt = i + offset
                if tgt > i then
                    fwdJumps[i] = tgt
                elseif tgt <= i then
                    backJumps[i] = tgt
                    loopHeads[tgt] = true
                    loopEnds[tgt] = i
                end
            elseif opn == "JUMP" or opn == "JUMPX" then
                local offset = ed and ed[1] or 0
                local tgt = i + offset
                if tgt < i then
                    backJumps[i] = tgt
                    loopHeads[tgt] = true
                    loopEnds[tgt] = i
                end
            elseif opn == "FORNPREP" then
                local offset = ed and ed[1] or 0
                local tgt = i + offset
                loopHeads[i] = true
                loopEnds[i]  = tgt
            elseif opn == "FORGPREP" or opn == "FORGPREP_INEXT" or opn == "FORGPREP_NEXT" then
                local offset = (opn == "FORGPREP") and (ed and ed[1] or 0) or 0
                loopHeads[i] = true
                loopEnds[i]  = i + math.abs(offset) + 4
            end
        end
        return fwdJumps, backJumps, loopHeads, loopEnds
    end
    local function emitProto(protoActions, isMain)
        local actions  = protoActions.actions
        local proto    = protoActions.proto
        local consts   = proto.constants
        local caps     = proto.captures
        local inner    = proto.innerProtos
        local regExpr  = {}
        local declared = {}
        local pending  = {}
        local totalParameters = proto.numParams
        local function buildRegNames(instrIdx)
            local names = {}
            if proto.debugLocals then
                for _, dl in ipairs(proto.debugLocals) do
                    if instrIdx >= dl.startPC and instrIdx <= dl.endPC then
                        names[dl.register] = dl.name
                    end
                end
            end
            return names
        end
        local regNameCache = {}
        local function fmtReg(r, instrIdx)
            if instrIdx and proto.debugLocals then
                local cached = regNameCache[instrIdx]
                if not cached then
                    cached = buildRegNames(instrIdx)
                    regNameCache[instrIdx] = cached
                end
                if cached[r] and cached[r] ~= "" then return cached[r] end
            end
            local pr = r + 1
            if pr <= totalParameters then return "p" .. pr end
            return "v" .. (r - totalParameters + 1)
        end
        local function fmtUpv(r)
            if r == nil then return "upv_unknown" end
            local du = proto.debugUpvalues
            if du then
                local entry = du[r + 1]
                if entry and entry.name and entry.name ~= "" then return entry.name end
            end
            local capturedReg = caps[r]
            if capturedReg ~= nil and proto.debugLocals then
                for _, dl in ipairs(proto.debugLocals) do
                    if dl.register == capturedReg and dl.name and dl.name ~= "" then
                        return dl.name
                    end
                end
            end
            return "upv_" .. tostring(r)
        end
        local function fmtConst(k)
            if not k then return "nil" end
            if k.type == LuauBytecodeTag.LBC_CONSTANT_VECTOR then return tostring(k.value) end
            if type(tonumber(k.value)) == "number" then
                return tostring(tonumber(string.format("%0." .. options.ReaderFloatPrecision .. "f", k.value)))
            end
            return toEscapedString(k.value)
        end
        local function getReg(r, instrIdx)
            local e = regExpr[r]
            if e then return e end
            return fmtReg(r, instrIdx)
        end
        local function setReg(r, expr)
            regExpr[r] = expr
            pending[r]  = true
        end
        local function clearReg(r)
            regExpr[r] = nil
            pending[r]  = nil
        end
        local function flushReg(r, instrIdx)
            local expr = regExpr[r]
            if not expr then return end
            local name = fmtReg(r, instrIdx)
            if not declared[r] then
                declared[r] = true
                emitLine("local " .. name .. " = " .. expr)
            else
                emitLine(name .. " = " .. expr)
            end
            clearReg(r)
        end
        local function flushAll(instrIdx)
            for r = 0, proto.maxStackSize - 1 do
                if pending[r] then flushReg(r, instrIdx) end
            end
        end
        local fwdJumps, backJumps, loopHeads, loopEnds = analyzeFlow(actions)
        local scopeStack = {}
        local function pushScope(kind, endIdx, elseIdx)
            table.insert(scopeStack, { kind=kind, endIdx=endIdx, elseIdx=elseIdx })
        end
        local function popScope()
            return table.remove(scopeStack)
        end
        if not isMain then
            local paramParts = {}
            for j = 0, proto.numParams - 1 do
                local name = fmtReg(j, 0)
                if proto.hasTypeInfo and proto.typedParams and proto.typedParams[j+1] then
                    name = name .. ": " .. Luau:GetBaseTypeString(proto.typedParams[j+1], true)
                end
                paramParts[#paramParts + 1] = name
            end
            if proto.isVarArg then paramParts[#paramParts + 1] = "..." end
            for j = 0, proto.numParams - 1 do declared[j] = true end
        end
        local skipNext = false
        for i, action in ipairs(actions) do
            if skipNext then skipNext = false; continue end
            if action.hide then continue end
            local oci = action.opCode
            if not oci then continue end
            local opn = oci.name
            local ur  = action.usedRegisters
            local ed  = action.extraData
            for si = #scopeStack, 1, -1 do
                local sc = scopeStack[si]
                if sc.endIdx and i > sc.endIdx then
                    popScope()
                    indent = math.max(0, indent - 1)
                    if sc.kind ~= "repeat" then
                        emitLine("end")
                    end
                elseif sc.elseIdx and i == sc.elseIdx then
                    indent = math.max(0, indent - 1)
                    emitLine("else")
                    indent = indent + 1
                    sc.elseIdx = nil
                end
            end
            if opn == "LOADNIL" then
                setReg(ur[1], "nil")
            elseif opn == "LOADB" then
                setReg(ur[1], toEscapedString(toBoolean(ed[1])))
            elseif opn == "LOADN" then
                setReg(ur[1], tostring(ed[1]))
            elseif opn == "LOADK" or opn == "LOADKX" then
                local cidx = (opn == "LOADKX") and ed[1] or ed[1]
                setReg(ur[1], fmtConst(consts[cidx + 1]))
            elseif opn == "MOVE" then
                local src = regExpr[ur[2]]
                if src then
                    setReg(ur[1], src)
                    clearReg(ur[2])
                else
                    setReg(ur[1], fmtReg(ur[2], i))
                end
            elseif opn == "GETGLOBAL" then
                local gk = tostring(consts[ed[1] + 1] and consts[ed[1] + 1].value or "")
                if options.ListUsedGlobals and isValidGlobal(gk) then
                    table.insert(usedGlobals, gk); usedGlobalsSet[gk] = true
                end
                setReg(ur[1], gk)
            elseif opn == "SETGLOBAL" then
                flushAll(i)
                local gk = tostring(consts[ed[1] + 1] and consts[ed[1] + 1].value or "")
                emitLine(gk .. " = " .. getReg(ur[1], i))
                clearReg(ur[1])
            elseif opn == "GETUPVAL" then
                setReg(ur[1], fmtUpv(caps[ed[1]]))
            elseif opn == "SETUPVAL" then
                flushAll(i)
                emitLine(fmtUpv(caps[ed[1]]) .. " = " .. getReg(ur[1], i))
                clearReg(ur[1])
            elseif opn == "GETIMPORT" then
                local imp = tostring(consts[ed[1] + 1] and consts[ed[1] + 1].value or "")
                imp = imp:gsub("%.%.+", "."):gsub("^%.", ""):gsub("%.$", "")
                local totalIdx = bit32.rshift(ed[2] or 0, 30)
                if totalIdx == 1 and options.ListUsedGlobals and isValidGlobal(imp) then
                    table.insert(usedGlobals, imp); usedGlobalsSet[imp] = true
                end
                setReg(ur[1], imp)
            elseif opn == "GETTABLE" then
                setReg(ur[1], getReg(ur[2], i) .. "[" .. getReg(ur[3], i) .. "]")
            elseif opn == "SETTABLE" then
                flushAll(i)
                emitLine(getReg(ur[2], i) .. "[" .. getReg(ur[3], i) .. "] = " .. getReg(ur[1], i))
            elseif opn == "GETTABLEKS" then
                local key = consts[ed[2] + 1] and consts[ed[2] + 1].value
                setReg(ur[1], getReg(ur[2], i) .. formatIndexString(key))
            elseif opn == "SETTABLEKS" then
                flushAll(i)
                local key = consts[ed[2] + 1] and consts[ed[2] + 1].value
                emitLine(getReg(ur[2], i) .. formatIndexString(key) .. " = " .. getReg(ur[1], i))
                clearReg(ur[1])
            elseif opn == "GETTABLEN" then
                setReg(ur[1], getReg(ur[2], i) .. "[" .. (ed[1] + 1) .. "]")
            elseif opn == "SETTABLEN" then
                flushAll(i)
                emitLine(getReg(ur[2], i) .. "[" .. (ed[1] + 1) .. "] = " .. getReg(ur[1], i))
            elseif opn == "NEWTABLE" or opn == "DUPTABLE" then
                setReg(ur[1], "{}")
            elseif opn == "SETLIST" then
                local tblReg = ur[1]
                local tblExpr = regExpr[tblReg]
                local parts = {}
                local vc = ed[2]
                if vc and vc > 0 then
                    for k = 2, #ur do
                        parts[#parts + 1] = getReg(ur[k], i)
                    end
                end
                if tblExpr == "{}" and #parts > 0 then
                    setReg(tblReg, "{" .. table.concat(parts, ", ") .. "}")
                else
                    flushAll(i)
                end
            elseif BINOP[opn] then
                local op = BINOP[opn]
                local isK = opn:sub(-1) == "K"
                local lhs, rhs
                if opn == "CONCAT" then
                    local parts = {}
                    for k = 2, #ur do parts[#parts + 1] = getReg(ur[k], i) end
                    setReg(ur[1], table.concat(parts, " .. "))
                elseif opn == "SUBRK" or opn == "DIVRK" then
                    lhs = fmtConst(consts[ed[1] + 1])
                    rhs = getReg(ur[2], i)
                    setReg(ur[1], lhs .. " " .. op .. " " .. rhs)
                elseif isK then
                    lhs = getReg(ur[2], i)
                    rhs = fmtConst(consts[ed[1] + 1])
                    setReg(ur[1], lhs .. " " .. op .. " " .. rhs)
                else
                    lhs = getReg(ur[2], i)
                    rhs = getReg(ur[3], i)
                    setReg(ur[1], lhs .. " " .. op .. " " .. rhs)
                end
            elseif UNOP[opn] then
                local op = UNOP[opn]
                local src = getReg(ur[2], i)
                if src:find("[%s%(]") then src = "(" .. src .. ")" end
                setReg(ur[1], op .. src)
            elseif opn == "NEWCLOSURE" or opn == "DUPCLOSURE" then
                local p2
                if opn == "NEWCLOSURE" then
                    p2 = inner[ed[1] + 1]
                else
                    local c = consts[ed[1] + 1]
                    if c then p2 = protoTable[c.value - 1] end
                end
                if p2 and registerActions[p2.id] then
                    local pActions = registerActions[p2.id]
                    local pProto   = pActions.proto
                    local paramParts = {}
                    for j = 0, pProto.numParams - 1 do
                        local nm
                        if pProto.debugLocals then
                            for _, dl in ipairs(pProto.debugLocals) do
                                if dl.startPC == 0 and dl.register == j then nm = dl.name; break end
                            end
                        end
                        paramParts[#paramParts + 1] = nm or ("p" .. (j + 1))
                    end
                    if pProto.isVarArg then paramParts[#paramParts + 1] = "..." end
                    local header = "function(" .. table.concat(paramParts, ", ") .. ")\n"
                    local savedParts = resultParts
                    local savedIndent = indent
                    resultParts = {}
                    indent = 0
                    emitProto(pActions, false)
                    local innerSrc = table.concat(resultParts)
                    resultParts = savedParts
                    indent = savedIndent
                    local indented = ""
                    for line in (innerSrc .. "\n"):gmatch("[^\n]*\n") do
                        indented = indented .. ind() .. "    " .. line
                    end
                    setReg(ur[1], header .. indented .. ind() .. "end")
                else
                    setReg(ur[1], "function(...)  end")
                end
            elseif opn == "NAMECALL" then
                local method = tostring(consts[ed[2] + 1] and consts[ed[2] + 1].value or "")
                setReg(ur[1], getReg(ur[2], i) .. ":" .. method)
            elseif opn == "CALL" then
                flushAll(i)
                local baseR = ur[1]
                local nArgs = ed[1] - 1
                local nRes  = ed[2] - 1
                local funcExpr = getReg(baseR, i)
                local argParts = {}
                if nArgs == -1 then
                    argParts[1] = "..."
                else
                    for k = 1, nArgs do
                        argParts[k] = getReg(baseR + k, i)
                    end
                end
                local callExpr = funcExpr .. "(" .. table.concat(argParts, ", ") .. ")"
                if nRes == 0 then
                    emitLine(callExpr)
                    clearReg(baseR)
                elseif nRes == 1 then
                    setReg(baseR, callExpr)
                elseif nRes == -1 then
                    emitLine(callExpr)
                    clearReg(baseR)
                else
                    local lhsParts = {}
                    for k = 0, nRes - 1 do
                        local nm = fmtReg(baseR + k, i)
                        if not declared[baseR + k] then
                            declared[baseR + k] = true
                            nm = "local " .. nm
                        end
                        lhsParts[k + 1] = nm
                    end
                    emitLine(table.concat(lhsParts, ", ") .. " = " .. callExpr)
                    for k = 0, nRes - 1 do clearReg(baseR + k) end
                end
            elseif opn == "RETURN" then
                flushAll(i)
                local baseR = ur[1]
                local tot   = ed[1] - 2
                if tot == -2 then
                    emitLine("return " .. getReg(baseR, i) .. ", ...")
                elseif tot >= 0 then
                    local parts = {}
                    for k = 0, tot do parts[k + 1] = getReg(baseR + k, i) end
                    if #parts > 0 then
                        emitLine("return " .. table.concat(parts, ", "))
                    elseif not isMain then
                        emitLine("return")
                    end
                end
                for k = 0, math.max(0, tot) do clearReg(baseR + k) end
            elseif opn == "FORNPREP" then
                flushAll(i)
                local base   = ur[1]
                local limit  = getReg(ur[2], i)
                local step   = getReg(ur[3], i)
                local var    = getReg(ur[3], i)
                local ctr    = fmtReg(base + 2, i)
                local from   = getReg(base, i)
                local to2    = getReg(base + 1, i)
                local step2  = getReg(base + 2, i)
                local forLine = "for " .. ctr .. " = " .. from .. ", " .. to2
                if step2 ~= "1" and step2 ~= "" and step2 ~= ctr then
                    forLine = forLine .. ", " .. step2
                end
                forLine = forLine .. " do"
                emitLine(forLine)
                indent = indent + 1
                pushScope("for", loopEnds[i] and (loopEnds[i] + 1) or (i + 100))
            elseif opn == "FORNLOOP" then
            elseif opn == "FORGPREP_INEXT" then
                flushAll(i)
                local base = ur[1]
                local k    = fmtReg(base + 3, i)
                local v    = fmtReg(base + 4, i)
                emitLine("for " .. k .. ", " .. v .. " in ipairs(" .. getReg(base, i) .. ") do")
                indent = indent + 1
                pushScope("for", loopEnds[i] and (loopEnds[i] + 1) or (i + 50))
            elseif opn == "FORGPREP_NEXT" then
                flushAll(i)
                local base = ur[1]
                local k    = fmtReg(base + 3, i)
                local v    = fmtReg(base + 4, i)
                emitLine("for " .. k .. ", " .. v .. " in pairs(" .. getReg(base, i) .. ") do")
                indent = indent + 1
                pushScope("for", loopEnds[i] and (loopEnds[i] + 1) or (i + 50))
            elseif opn == "FORGPREP" then
                flushAll(i)
                local base   = ur[1]
                local offset = ed and ed[1] or 0
                local endIdx = i + math.abs(offset) + 2
                local vParts = {}
                local flAction = actions[endIdx]
                if flAction and flAction.opCode and flAction.opCode.name == "FORGLOOP" then
                    local nv = bit32.band(flAction.extraData and flAction.extraData[2] or 0, 0xFF)
                    for k = 1, nv do
                        vParts[k] = fmtReg(base + 2 + k, i)
                    end
                end
                if #vParts == 0 then vParts = { fmtReg(base + 3, i), fmtReg(base + 4, i) } end
                emitLine("for " .. table.concat(vParts, ", ") .. " in " .. getReg(base, i) .. " do")
                indent = indent + 1
                pushScope("for", endIdx + 1)
            elseif opn == "FORGLOOP" then
            elseif CMPOP[opn] then
                flushAll(i)
                local op   = CMPOP_INV[opn]
                local lhs  = getReg(ur[1], i)
                local rhs  = getReg(ur[2], i)
                local tgt  = fwdJumps[i]
                local elseIdx = nil
                if tgt then
                    local skipAction = actions[tgt - 1]
                    if skipAction and skipAction.opCode and
                       (skipAction.opCode.name == "JUMP" or skipAction.opCode.name == "JUMPX") then
                        local skipOffset = skipAction.extraData and skipAction.extraData[1] or 0
                        elseIdx = tgt
                        tgt     = tgt + skipOffset
                    end
                end
                emitLine("if " .. lhs .. " " .. op .. " " .. rhs .. " then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 20), elseIdx)
            elseif opn == "JUMPIF" then
                flushAll(i)
                local tgt = fwdJumps[i]
                local elseIdx = nil
                if tgt then
                    local skipAction = actions[tgt - 1]
                    if skipAction and skipAction.opCode and
                       (skipAction.opCode.name == "JUMP" or skipAction.opCode.name == "JUMPX") then
                        local skipOffset = skipAction.extraData and skipAction.extraData[1] or 0
                        elseIdx = tgt
                        tgt     = tgt + skipOffset
                    end
                end
                emitLine("if not " .. getReg(ur[1], i) .. " then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 10), elseIdx)
            elseif opn == "JUMPIFNOT" then
                flushAll(i)
                local tgt = fwdJumps[i]
                local elseIdx = nil
                if tgt then
                    local skipAction = actions[tgt - 1]
                    if skipAction and skipAction.opCode and
                       (skipAction.opCode.name == "JUMP" or skipAction.opCode.name == "JUMPX") then
                        local skipOffset = skipAction.extraData and skipAction.extraData[1] or 0
                        elseIdx = tgt
                        tgt     = tgt + skipOffset
                    end
                end
                emitLine("if " .. getReg(ur[1], i) .. " then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 10), elseIdx)
            elseif opn == "JUMPXEQKNIL" then
                flushAll(i)
                local rev  = bit32.rshift(ed[2] or 0, 0x1F) ~= 1
                local sign = rev and "~=" or "=="
                local tgt  = fwdJumps[i]
                emitLine("if " .. getReg(ur[1], i) .. " " .. sign .. " nil then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 10))
            elseif opn == "JUMPXEQKB" then
                flushAll(i)
                local val  = tostring(toBoolean(bit32.band(ed[2] or 0, 1)))
                local rev  = bit32.rshift(ed[2] or 0, 0x1F) ~= 1
                local sign = rev and "~=" or "=="
                local tgt  = fwdJumps[i]
                emitLine("if " .. getReg(ur[1], i) .. " " .. sign .. " " .. val .. " then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 10))
            elseif opn == "JUMPXEQKN" or opn == "JUMPXEQKS" then
                flushAll(i)
                local cidx = bit32.band(ed[2] or 0, 0xFFFFFF)
                local val  = fmtConst(consts[cidx + 1])
                local rev  = bit32.rshift(ed[2] or 0, 0x1F) ~= 1
                local sign = rev and "~=" or "=="
                local tgt  = fwdJumps[i]
                emitLine("if " .. getReg(ur[1], i) .. " " .. sign .. " " .. val .. " then")
                indent = indent + 1
                pushScope("if", tgt and (tgt - 1) or (i + 10))
            elseif opn == "JUMP" or opn == "JUMPX" or opn == "JUMPBACK" then
                flushAll(i)
            elseif opn == "GETVARARGS" then
                local vc2 = ed[1] - 1
                if vc2 == -1 then
                    setReg(ur[1], "...")
                else
                    local parts = {}
                    for k = 1, vc2 do parts[k] = fmtReg(ur[k], i) end
                    flushAll(i)
                    local lhsParts = {}
                    for k = 1, vc2 do
                        local r = ur[k]
                        if not declared[r] then declared[r] = true
                            lhsParts[k] = "local " .. fmtReg(r, i)
                        else lhsParts[k] = fmtReg(r, i) end
                    end
                    emitLine(table.concat(lhsParts, ", ") .. " = ...")
                end
            else
            end
        end
        for si = #scopeStack, 1, -1 do
            local sc = scopeStack[si]
            indent = math.max(0, indent - 1)
            if sc.kind ~= "repeat" then emitLine("end") end
        end
        flushAll(0)
    end
    local mainProtoActions = registerActions[mainProtoId]
    if mainProtoActions then
        if mainProtoActions.proto.flags and mainProtoActions.proto.flags.native then
            emit("--!native\n")
        end
        emitProto(mainProtoActions, true)
    end
    finalResult = processResult(table.concat(resultParts))		end
		return finalResult
	end
	local function manager(proceed, issue)
		if proceed then
			local startTime = os.clock()
			local result
			local ok, res = pcall(function() return finalize(organize()) end)
			result = ok and res or ("-- RUNTIME ERROR:\n-- " .. tostring(res))
			if (os.clock() - startTime) >= options.DecompilerTimeout then
				return Strings.TIMEOUT
			end
			return string.format(Strings.SUCCESS, result)
		else
			if issue == "COMPILATION_FAILURE" then
				local len = reader:len()-1
				return string.format(Strings.COMPILATION_FAILURE, reader:nextString(len))
			elseif issue == "UNSUPPORTED_LBC_VERSION" then
				return Strings.UNSUPPORTED_LBC_VERSION
			end
		end
	end
	bytecodeVersion = reader:nextByte()
	if bytecodeVersion == 0 then
		return manager(false, "COMPILATION_FAILURE")
	elseif bytecodeVersion >= LuauBytecodeTag.LBC_VERSION_MIN
	   and bytecodeVersion <= LuauBytecodeTag.LBC_VERSION_MAX then
		return manager(true)
	else
		return manager(false, "UNSUPPORTED_LBC_VERSION")
	end
end
local CONST_TYPE = {
	[0]="nil",[1]="boolean",[2]="number(f64)",[3]="string",
	[4]="import",[5]="table",[6]="closure",[7]="number(f32)",[8]="number(i16)"
}
local function parseProto(p, stringTable, depth)
	local result = {
		depth=depth or 0, maxStack=p:nextByte(), numParams=p:nextByte(),
		numUpvals=p:nextByte(), isVararg=p:nextByte()~=0, flags=p:nextByte(),
		constants={}, protos={}, upvalues={}, debugName="", strings={}, imports={},
	}
	local typeSize = p:nextVarInt()
	if typeSize>0 then for _=1,typeSize do p:nextByte() end end
	local instrCount = p:nextVarInt()
	for _=1,instrCount do p:nextUInt32() end
	local constCount = p:nextVarInt()
	for i=1,constCount do
		local kind=p:nextByte()
		local name=CONST_TYPE[kind] or ("unknown("..kind..")")
		local value
		if     kind==0 then value="nil"
		elseif kind==1 then value=p:nextByte()~=0 and "true" or "false"
		elseif kind==2 then value=tostring(p:nextDouble())
		elseif kind==7 then value=tostring(p:nextFloat())
		elseif kind==8 then
			local lo,hi=p:nextByte(),p:nextByte()
			local n=lo+hi*256; if n>=32768 then n=n-65536 end; value=tostring(n)
		elseif kind==3 then
			local idx=p:nextVarInt()
			value=stringTable[idx] or ("<string #"..idx..">")
			table.insert(result.strings,value)
		elseif kind==4 then
			local id=p:nextUInt32()
			local k0=bit32.band(bit32.rshift(id,20),0x3FF)
			local k1=bit32.band(bit32.rshift(id,10),0x3FF)
			local k2=bit32.band(id,0x3FF)
			local parts={}
			for _,k in ipairs({k0,k1,k2}) do
				if stringTable[k] then table.insert(parts,stringTable[k]) end
			end
			value=table.concat(parts,"."); table.insert(result.imports,value)
		elseif kind==5 then
			local keys,ks=p:nextVarInt(),{}
			for _=1,keys do
				local kidx=p:nextVarInt(); table.insert(ks,stringTable[kidx] or "?")
			end
			value="{"..table.concat(ks,", ").."}"
		elseif kind==6 then value="<proto #"..p:nextVarInt()..">"
		else value="?" end
		table.insert(result.constants,{kind=name,value=value,index=i-1})
	end
	local protoCount=p:nextVarInt()
	for i=1,protoCount do
		local ok,inner=pcall(parseProto,p,stringTable,depth+1)
		table.insert(result.protos,ok and inner or {error=tostring(inner),depth=depth+1})
	end
	local hasLines=p:nextByte()
	if hasLines~=0 then
		local lgap=p:nextByte()
		local intervalCount=bit32.rshift(instrCount-1,lgap)+1
		for _=1,intervalCount do p:nextByte() end
		for _=1,instrCount do p:nextByte() end
	end
	local hasDebug=p:nextByte()
	if hasDebug~=0 then
		local nameIdx=p:nextVarInt()
		result.debugName=stringTable[nameIdx] or ""
		local lc=p:nextVarInt()
		for _=1,lc do p:nextVarInt();p:nextVarInt();p:nextVarInt();p:nextByte() end
		local uc=p:nextVarInt()
		for j=1,uc do
			local ui=p:nextVarInt()
			table.insert(result.upvalues,stringTable[ui] or ("upval_"..j))
		end
	end
	return result
end
local function parseBytecode(bytes)
	local reader2=Reader.new(bytes)
	local ver=reader2:nextByte()
	if ver==0 then return nil,"Compile error: "..reader2:nextString(reader2:len()-1) end
	local typesVer=reader2:nextByte()
	local stringCount=reader2:nextVarInt()
	local stringTable={}
	for i=1,stringCount do
		local len=reader2:nextVarInt(); stringTable[i]=reader2:nextString(len)
	end
	local protoCount=reader2:nextVarInt()
	local protos={}
	for i=1,protoCount do
		local ok,proto=pcall(parseProto,reader2,stringTable,0)
		table.insert(protos,ok and proto or {error=tostring(proto),depth=0})
	end
	local entryProto=reader2:nextVarInt()
	return {version=ver,typesVersion=typesVer,
		stringTable=stringTable,protos=protos,entryProto=entryProto}
end
local function buildReport(parsed, scriptName)
	local lines={}
	local function w(s) table.insert(lines,s or "") end
	w("_zukatechzukatech_zukatechzukatechhzukatech_")
	w("  code reconstructor — "..(scriptName or "unknown"))
	w("_zukatechzukatech_zukatechzukatechhzukatech_")
	w("  Luau version : "..parsed.version)
	w("  Types version: "..parsed.typesVersion)
	w("  Proto count  : "..#parsed.protos)
	w("  Entry proto  : #"..parsed.entryProto)
	w("  Strings total: "..#parsed.stringTable)
	for i,s in ipairs(parsed.stringTable) do w(string.format("  [%3d] %q",i,s)) end
	local function walkProto(proto,idx)
		if proto.error then w("  [Proto #"..idx.."] PARSE ERROR: "..proto.error); return end
		local ind=string.rep("  ",proto.depth+1)
		local dn=proto.debugName~="" and (" '"..proto.debugName.."'") or ""
		w(string.format("%s── Proto #%d%s",ind,idx,dn))
		w(string.format("%s   params=%d  upvals=%d  maxStack=%d  vararg=%s",
			ind,proto.numParams,proto.numUpvals,proto.maxStack,tostring(proto.isVararg)))
		if #proto.upvalues>0 then w(ind.."   Upvalues: "..table.concat(proto.upvalues,", ")) end
		if #proto.imports>0  then
			w(ind.."   Imports:")
			for _,imp in ipairs(proto.imports) do w(ind.."     "..imp) end
		end
		if #proto.strings>0  then
			w(ind.."   String literals:")
			for _,s in ipairs(proto.strings) do w(ind..'     "'..s..'"') end
		end
		if #proto.constants>0 then
			w(ind.."   All constants:")
			for _,c in ipairs(proto.constants) do
				w(string.format("%s     [%2d] %-14s %s",ind,c.index,c.kind,tostring(c.value)))
			end
		end
		w("")
		for i2,inner in ipairs(proto.protos) do walkProto(inner,i2) end
	end
	w("- PROTO TREE -")
	for i,proto in ipairs(parsed.protos) do walkProto(proto,i) end
	return table.concat(lines,"\n")
end
local function _ppImpl(text)
	local result = {}
	local depth  = 0
	local DEDENT_BEFORE      = { ["end"]=true, ["until"]=true }
	local INDENT_AFTER       = { ["then"]=true, ["do"]=true, ["repeat"]=true }
	local DEDENT_THEN_INDENT = { ["else"]=true, ["elseif"]=true }
	local function stripStrings(s)
		s = s:gsub('"[^"\\]*(?:\\.[^"\\]*)*"', '""')
		s = s:gsub("'[^'\\]*(?:\\.[^'\\]*)*'", "''")
		s = s:gsub("%-%-.*$", "")
		return s
	end
	local function firstWord(s)
		return (stripStrings(s):match("^%s*([%a_][%w_]*)")) or ""
	end
	local function containsOpener(s)
		local clean = stripStrings(s)
		local fw = clean:match("^%s*([%a_][%w_]*)")
		if fw == "elseif" or fw == "else" then return false end
		for w in clean:gmatch("[%a_][%w_]*") do
			if INDENT_AFTER[w] then return true end
			if w == "function" then return true end
		end
		return false
	end
	for line in (text .. "\n"):gmatch("[^\n]*\n") do
		local bare = line:gsub("\n$", "")
		if bare == "" then
			result[#result + 1] = "\n"; continue
		end
		local expr = bare:match("^%[%d+%]%s*:?%d*:?%s*%u[%u_]*%s+(.*)") or bare
		local kw = firstWord(expr)
		if DEDENT_THEN_INDENT[kw] then
			depth = math.max(0, depth - 1)
			result[#result + 1] = string.rep("    ", depth) .. bare .. "\n"
			depth += 1
		elseif DEDENT_BEFORE[kw] then
			depth = math.max(0, depth - 1)
			result[#result + 1] = string.rep("    ", depth) .. bare .. "\n"
		else
			result[#result + 1] = string.rep("    ", depth) .. bare .. "\n"
			if containsOpener(expr) then depth += 1 end
		end
	end
	return table.concat(result)
end
local function _coImpl(text)
	local rawLines = {}
	for line in (text .. "\n"):gmatch("[^\n]*\n") do
		rawLines[#rawLines + 1] = line:gsub("\n$", "")
	end
	local function escpat(s)
		return s:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
	end
	local function nextNonBlank(start)
		local j = start
		while j <= #rawLines and (rawLines[j] == nil or rawLines[j]:match("^%s*$")) do
			j += 1
		end
		return j
	end
	local function tryCollapse(i)
		local line = rawLines[i]
		if line == nil then return false end
		local reg, lit = line:match('^%s*(v%d+) = (".-")%s*$')
		if not reg then reg, lit = line:match('^%s*(v%d+) = (%-?%d+%.?%d*)%s*$') end
		if not reg then reg, lit = line:match('^%s*(v%d+) = (true)%s*$') end
		if not reg then reg, lit = line:match('^%s*(v%d+) = (false)%s*$') end
		if not reg then reg, lit = line:match('^%s*(v%d+) = (nil)%s*$') end
		if not reg then reg, lit = line:match('^%s*(v%d+) = ([%a_][%w_%.]+)%s*$') end
		if not reg then return false end
		local j = nextNonBlank(i + 1)
		if j > #rawLines or rawLines[j] == nil then return false end
		local nextLine = rawLines[j]
		local ep = escpat(reg)
		local count = 0
		for _ in nextLine:gmatch(ep) do count += 1 end
		if count ~= 1 then return false end
		if nextLine:match("^%s*" .. ep .. "%s*=") then return false end
		for k = i + 1, j - 1 do
			local mid = rawLines[k]
			if mid and mid:match("^%s*" .. ep .. "%s*=") then return false end
		end
		rawLines[j] = nextLine:gsub(ep, lit, 1)
		rawLines[i] = nil
		return true
	end
	for _ = 1, 8 do
		for i = 1, #rawLines do tryCollapse(i) end
	end
	local function tryFoldField(i)
		local line = rawLines[i]
		if not line then return false end
		local lreg, src, field = line:match('^%s*(v%d+) = (v%d+)%.([%a_][%w_]*)%s*$')
		if not lreg then
			lreg, src, field = line:match('^%s*(v%d+) = (v%d+)%[(.-)%]%s*$')
			if lreg then field = "[" .. field .. "]" else return false end
		else
			field = "." .. field
		end
		local j = nextNonBlank(i + 1)
		if j > #rawLines then return false end
		local nextLine = rawLines[j]
		local epSrc = escpat(src)
		local epReg = escpat(lreg)
		local count = 0
		for _ in nextLine:gmatch(epReg) do count += 1 end
		if count ~= 1 then return false end
		if nextLine:match("^%s*" .. epReg .. "%s*=") then return false end
		for k = i + 1, j - 1 do
			local mid = rawLines[k]
			if mid and mid:match("^%s*" .. epSrc .. "%s*=") then return false end
		end
		if src:match("^upv_") then return false end
		rawLines[j] = nextLine:gsub(epReg, src .. field, 1)
		rawLines[i] = nil
		return true
	end
	for _ = 1, 6 do
		for i = 1, #rawLines do tryFoldField(i) end
	end
	local pass2 = {}
	for idx = 1, #rawLines do
		local line = rawLines[idx]
		if line == nil then continue end
		local stripped = line:match("^%s*(.-)%s*$")
		if stripped:match("^%-%- goto #%d+$") then continue end
		if stripped:match("^%-%- jump") then continue end
		line = line:gsub("%s*%-%- goto #%d+$", "")
		line = line:gsub("%s*%-%- end at #%d+$", "")
		line = line:gsub("%s*%-%- iterate %+ jump to #%d+$", "")
		pass2[#pass2 + 1] = line
	end
	local pass3 = {}
	local i = 1
	while i <= #pass2 do
		local line = pass2[i]
		local nxt  = pass2[i + 1]
		local s    = line and line:match("^%s*(.-)%s*$") or ""
		local isNilInit = s:match("^v%d+ = nil") ~= nil
		local nextIsFor = nxt and nxt:match("^%s*for%s+v%d+") ~= nil
		if isNilInit and nextIsFor then
			i += 1
		else
			pass3[#pass3 + 1] = line
			i += 1
		end
	end
	local seen = {}
	local pass4 = {}
	for _, line in ipairs(pass3) do
		local reg = line:match("^%s*(v%d+)%s*=")
		if reg and not seen[reg] then
			seen[reg] = true
			line = line:gsub("^(%s*)(v%d+%s*=)", "%1local %2", 1)
		end
		pass4[#pass4 + 1] = line
	end
	local final = {}
	local lastBlank = false
	for _, line in ipairs(pass4) do
		local isBlank = line:match("^%s*$") ~= nil
		if isBlank and lastBlank then continue end
		lastBlank = isBlank
		final[#final + 1] = line
	end
	return table.concat(final, "\n")
end
local ZukDecompile = Decompile
local ZukPretty    = _ppImpl
local ZukClean     = _coImpl
local Syntax = {
    Text=Color3.fromRGB(204,204,204), Operator=Color3.fromRGB(204,204,204),
    Number=Color3.fromRGB(255,198,0), String=Color3.fromRGB(173,241,149),
    Comment=Color3.fromRGB(102,102,102), Keyword=Color3.fromRGB(248,109,124),
    BuiltIn=Color3.fromRGB(132,214,247), LocalMethod=Color3.fromRGB(253,251,172),
    LocalProperty=Color3.fromRGB(97,161,241), Nil=Color3.fromRGB(255,198,0),
    Bool=Color3.fromRGB(255,198,0), Function=Color3.fromRGB(248,109,124),
    Local=Color3.fromRGB(248,109,124), Self=Color3.fromRGB(248,109,124),
    FunctionName=Color3.fromRGB(253,251,172), Bracket=Color3.fromRGB(204,204,204),
}
local function colorToHex(c)
    return string.format("#%02x%02x%02x", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255))
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
            local eqCount, k = 0, i+1
            while line:sub(k,k) == "=" do eqCount += 1; k += 1 end
            if line:sub(k,k) == "[" then
                local close  = "]"..string.rep("=",eqCount).."]"
                local endIdx = line:find(close, k+1, true)
                local j      = endIdx and (endIdx + #close - 1) or #line
                table.insert(tokens, {line:sub(i,j), "String"}); i = j
            else table.insert(tokens, {c, "Operator"}) end
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
        else table.insert(tokens, {c, "Operator"}) end
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
    if val == "self" then return "Self" end
    if val == "true" or val == "false" then return "Bool" end
    if val == "nil"  then return "Nil"  end
    if idx > 1 and tokens[idx-1][1] == "function" then return "FunctionName" end
    return "Text"
end
local function hlLine(line)
    local indent, rest = line:match("^([\t ]*)(.*)")
    local indentHtml = indent:gsub("\t", string.rep("&#32;", 4)):gsub(" ", "&#32;")
    local tokens = hlTokenize(rest)
    local out = indentHtml
    for i, tok in ipairs(tokens) do
        local col  = Syntax[hlDetect(tokens, i)] or Syntax.Text
        local safe = tok[1]:gsub("&","&amp;"):gsub("<","&lt;"):gsub(">","&gt;")
        out ..= string.format('<font color="%s">%s</font>', colorToHex(col), safe)
    end
    return out
end
local ROW_H      = 17
local INDENT_PER = 14
local MIN_SIZE   = Vector2.new(350, 250)
local ICON_SIZE = 14
local CLASS_ICONS = {}
local function buildIconTable()
    if type(getgenv().getclassicons) == "function" then
        local ok, result = pcall(getgenv().getclassicons)
        if ok and type(result) == "table" then
            for cls, id in pairs(result) do
                CLASS_ICONS[cls] = tostring(id)
            end
            return
        end
    end
    if not (type(writefile) == "function" and type(getcustomasset) == "function") then
        return
    end
    local ICON_DIR = "zukv2_icons/"
    pcall(makefolder, ICON_DIR)
    local b64 = {
        ["Workspace"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdUlEQVR4nKWSTU7CQBTH32uA+EEiR4CFlB14AuEGcIOSULfWE4gngKWRJtQb4A28gWVhUuoCjoCJceGi43/G6dDa+BV/yWTevL7363SmTP+kIOisvdrr28s5C+oKpg5SNYyQmYP98uFt2JhusTbkBK3YdRIhJgjvLIuCvVI1lA3N1UggJ0GzNYztmwVihRE0V2d9oiQoM3cfm7MQKUNGoIC8Fx379wSUQG97jeZesdmdEwmH8mwPKtWG3J0S4A1jIqrHtu9Qhi+aFTiji1XLn6aCB6TC2J4NsZRrgeknUO+fMIJMAwdSslt/DwT8SSD5kCAw2NHIw5VOEObICFwcnGgj1PxGwkvUdBgRBKMxEV1iGKQdUw7UCUwpV6gZqyJ9jRsiOsLQFHeRETzjGuvmGiX6L5wjNOAN5rlkJ7AG6d+YK9CSKUK1k1TQenJPk4QcnNPAYvai5iwgjSrIoj/Hw6M+GtpIAV4iXliVUhA1rjeUoSD4K+9YpagRYU5wDwAAAABJRU5ErkJggg==",
        ["Players"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAu0lEQVR4nN2QsQ3CMBBF75iDHWAHTOfQMwFTIILo6VmDuMPsADuwBhz/TGw5LrGUIk+K/pdyfs6FqZKBwN6lYSGLSsLk3Io7VLI3aTF5QMULOro1t9QzEDReLohEZ3iHIOtFEAlnOJ1LRakWVK/wD0GQ3xzhGZ0/b9pi4ndzSf8lQVDuruj+5e4l+i+mIojkIhUgAqVIDyICqSi5QImS8QQbL3tMzlH1xetq+ISqggdigUd5QrBEBjBXxxdyKncRwlInYwAAAABJRU5ErkJggg==",
        ["Lighting"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA5UlEQVR4nKWSzQ3CMAyFn9tF2IBuAEhwhxOCExvAKLABJ35OMAASMAEdgUWKeYkE1FFaQP0ky3FsPyVxBDXoaazS39fW1Cb/EmBxjjSdSW+TM/RwzwjoeZqhKNbcyxh6guTjiDQZlkVeVOXfAg5f5Ci0BTzmALoALkCyQip3kHKzwwg49DQZsvnAZUAykv72yIUhIjC+0WU0i8pVBrsuAoQNSu/h45g4JMy7OHaCnK5Ns1SdgGaofAOVHgUuCDACZgqqC16ww8YrRJb4NgXfHJnzi6r8R8DdvclPjBEKxKhNNhb4hSdZCYYR/XyN1wAAAABJRU5ErkJggg==",
        ["ReplicatedStorage"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAsElEQVR4nLWNsQ3CMBREv6WswQ6hpWUQqsRL0EFNGYk0jATMADNQxjz/Ahyc5BcJT7Lu6+50djKTwYFQ11ek5E1xc227HhsIiFAwc7OAZKS5WUAy0lwLwfu9hLDijKZPC0hGmmsB44womJ8BC7p/HuDW/Jc01wLGcgNSFEfpui3vEgs4GfTjwJ281ALGd0DkxcjJNc2D22RoYBR+9EiPhQaqaiPO7TineDJwQHvowBzed6J0EYiiWXgAAAAASUVORK5CYII=",
        ["ReplicatedFirst"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAeklEQVR4nM2O2w2AIAxFy0aO5Beykvw4kroQeFNDE01DfSVykqZKL4c6eknDguz9jNahaiw1QUYjF6OakTmKwcGIxuDSgP89cFVwRgKWAB/ycgGXvtvAggUIH7bAq7KBBQs0igAyNSNzlIoEHgtC6CmlyRCs6vAO/ws2eetHlvwFIKkAAAAASUVORK5CYII=",
        ["ServerScriptService"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABOUlEQVR4nKWRL0zDQBTG3zsJdaAI2LYEQRMcluBAIzHtCA6wgCJY/LohkGDBkWBRJMOtZ0lQyGUI2D2+u4Wl7bp/2S9p7rt7d7+8uzLNyUhBqJM9Eto2JEvM/IGNrUWPX95W0i7KA7BeZOuzttDpyJmIrGFawIo8j2/ykoFgQydRryc7RpGP6UiUkaf2+u0josMJ7OEfkWPEiTCrLhl5zcLGA6Z9QaCTi6qWx/HfiRP4WVzH4FBE2pC600H6hWkBP6stKzKHBtF2kvnpqRME7fhSmFYRgTonMs8IEb4yLdR3Ub9m4W9c48QJ8m+gg+YROhLESlBn1OuFK1is5NfIfhY2r7ChUmAPY8BV4gPke8T+I5bBhrGCPEMLlrkFVVjpVAK7EUMlUwoS/CrZRCzB7zpoRAgFhgSz8gcEbIcRC7hrTwAAAABJRU5ErkJggg==",
        ["ServerStorage"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABOklEQVR4nL2TMUjEQBBFZ7fUdFoJtknEJmBnK3b2llqYEzu11VZL+0sUsdRWO8HWSoiFYLYVrCyPs5Db8e+GLNnzVkHBB2Hnz/x8JgsR9EeCAanK14hpWRPPCCFeYKymI3H3MFcMMXag77P02psaDHifmechPUxQFImTbogLWFR5NhrxipYUQwaRmm+eF86uUVpsgHn5g3kH5Y8IIYek+b5OyyvIJiBR+eGklb+j3cQGxPVWHwdJIqVJXqikeIP8Qlz3ZiXpDY3SbFLHxZ4NSOv82Nw2Ig6I9C1aGZ5JVPCswnMkWLzjM3ZtQHsHKjndxjaMFqG2s5ZuH3Xf+wSDCXmKywpDZ8Th6PZRr+O8hGwusQuGzojDEep7wtAaQ/xfwLgx1PeEAT/RpmY+Hzc2AeJRJWUG6fBMv+ET6jubESgxzjAAAAAASUVORK5CYII=",
        ["StarterGui"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAvElEQVR4nMWSQQrCMBBFZ9CVq3oXLyDWXQLewrUnsJ7AtbcQkp0VL+Bd7MqVMk4GGmrbQUMR3yZ/mM8LhCAMpFdgTlTwZstRh2Dnl1j0C0oiPj7ic8TfCcYjmB7nWPHYYXWh7PGEWxSYM1kkMBzB5bgOgrDkUaXuSMmWdOBD+KMgg42b4Z3HuOSoUnekFAThZo5CWCY9YkeQ+pHaghS+FmidKGg+Yht7pQlUsFcFzY+kQQjeL9BxfEMEQ3gBYz2BEZu+KBIAAAAASUVORK5CYII=",
        ["StarterPack"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABO0lEQVR4nLWSMU4CURRF3xMXAL2LYAsTsNNEKyZWWFEKCzBiXABYWkllmEoT7ZTMFliEPbMAx+/5b/yYGXRMNNwE3rn/vXsbUPmnrMAt4r44NwEzaTSONbpbwhty6Ulb8vwebIrqSDvzWVHw0lsRjOTtnYWbajdp87wh7pbidCi7OxlFKXetUOAwxl5u0ZuIkyH4JZWpdpIRZAoZCwUDwvEt3335VjrT7vwU4K7IKLw2zCn2jE+drrkdcmuZaoHD/qpw6+cWC5xe6v58LMg9x2N+nQvQFG79/LHg069Azy24urNMqQAsyb8zLMAoye/8uy0wD5gj5g3WhB/gM9BzE67uLFMUpP2mRrOMx/WRNORRo+QJYt87kFwOQRPBQchYQVCpoEa+gGGqFMTnfO+BNdJX/o1XgKlU8Bd9AGIGxBHC2csIAAAAAElFTkSuQmCC",
        ["StarterPlayer"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAdElEQVR4nN2QwQ2AIAxFy0Q6hN7cSdyJmw6hE9XfAyaUkpD0YngJKRR40AZy0hRsJ0fs7pgSMR1pDZEM2oKLGeEjLcE8ayYFv8BbQi+VoHhZY/ykFqjaNboXxUIYQJDRIn0xYyaFXwhuhAlDeCCYESuagl5eHwY7EfzhvZ4AAAAASUVORK5CYII=",
        ["StarterPlayerScripts"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAuklEQVR4nMWRsQ3CMBBF78QCDMAOhBEQKR3WoGYABqFkBrs0JX1omYGCDY5voyByOoyUIOVJ1v9R7OecwjSSnsCdpWEhh0rCFMKGPWqRnqCJckS88TXvEEX+Kxg9whCy4PNmza8vyQI9ewde3mRGJ7/mOx5NsOe7gOa0lwdd0CosTRtqXhUF6S+4KIJqAgEPFqTDiNcIHVo0rSAdRpgkqSnYRjngugVqFqSNqCamQANBi1hiaa4QVEh6AqBtYhF3RcCjAAAAAElFTkSuQmCC",
        ["StarterCharacterScripts"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABiElEQVR4nKWRv0/CQBTH37uWQQIuOhlG09Y42MQJRmcddZVEin+EOvljk1EDJUZX/wfnTkZIVGhXiJOTQSbb57sjbaDUaOInae5d771PvrlD+Cdzgs23ev5zRFsQkkmaKBFFeUQcEAmvWCTvcaU15raEGYHVcyqk4S4CdSkKvcKiPpADhl9r8jEgirEOdPdiuB3eKhLBeuDYXxFUc3ru8nn1asC/EmJBDFLU8K0bn8uJQMYejeA8J/RGephTVSNBZS4TZJJCAY5kOiWwegc7oImlvuHewhRZwzE6aPevZvNBCczAOcYQhv21iSAdOQt5sb7hnilBPCAi9KQk3kuQYEgorgOz9c7bOWYEklgCU/D5Ey82f2k6SmD2ayeEUOJSkZawgHjJRAnkJUYCt7lMCMz2IS+KnwTcg0qgnvGDLghpgbeK6RS/CiT8ZBV+sn0uE7hBpfiTQCIlfBd7cRJuUIIspJTPZwUSw68viygsE6LtW+1T2ci/M8kUpDF8pwNAG1ymwG5guvY3Gby3pZX0H7MAAAAASUVORK5CYII=",
        ["Teams"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAbklEQVR4nN2MUQqAIBBEZ09WpzGPUbcwT+PJtGnJoChQ7EN6ILM4u0/QyKsgGZMYEO8lzxAJfIs4F3BQJ7ixd50IuLAyTlhM/NMjzn8QMJRk7YgYZwADn3ZacrlI8ISWXP5ewCjiIqg5zHQiaGEDAnN0EYBzKl8AAAAASUVORK5CYII=",
        ["SoundService"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/ElEQVR4nK2OMQ4BQRSG30RFwwUkjqBVu8g2rKicQS9UYjUOwUEcQeIAdAphfPN47LIriC/Zmbfz5v/mOXmD7/frbjrdUhZSKPCdTiTOtdx8HvNbSK7AwpRigqJpXgTpMPvBJcnAzkyW5i7w3e6YrcJ3hbCUSiM5HtvUKjQB0zSZZk2ZESRsnLgVry6p8qeJ44V4HyHTrC4BE9CIqfOnOZ2GISzAPc3qEsA8oVmmEQQqI/iY5vay3OCeZnV5xgRcCrIdZY0vAz3N6vIMr6Wn8Ry9QE+zurzjH4I9W5Uvw8cCw/d6kZzPC0rla0EgLflJEDDJz4IAkoabzTYCFxNahBEWCyArAAAAAElFTkSuQmCC",
        ["Model"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA1ElEQVR4nKWRQQ6CMBBFC+E+wo1wA0u9iS4JG70ReB+S+gadyrRCNLyk+cOfmQ+hmdtJEuCb5oKcOUvGrO8rNMEE+La9Ou9PlMrDFUXtpmkgwMwqxuTtPh7EG5Ay9hVjMuyRgCypJzWSYEwdVmRJPamRBGPqsCJLsbdgpF9tBqxgfmwI4AZu3EDtviCDSIAXhR87N1hevT5qgywRMH+p1K8ADHmgDODJcskxyBy9NAAJSCP2lNDL82PWdfe/A2beyw62AxaDa2jAiBw4H35YFuaAPTwBRHiAEfQXY9cAAAAASUVORK5CYII=",
        ["Part"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAnUlEQVR4nO2S2w2DMAxF7Y9skOzRUToCnaTpJO0GHQWxRrJCJHMdCQRBBEF+OVLkPHyP8mGmRjaCGOMbxdMxH+ecXwlCCF9m7qiCiAzGmC6l1EPAs+BE+InwH8fHLMC3PRHp13cpw1i0FIgesK2Cvh4lhxXN5BAeBKWKNpd9encLGgSYmZe19ndJMIUJnBYsw8ok8HQwiUoZVrKghRG+kHkRqvtqYQAAAABJRU5ErkJggg==",
        ["MeshPart"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA3UlEQVR4nKWSwRGCUBBD9x8ogBmgDzuwBEvASsBK1PaAgx18k4ww6ypw4M0w+bvJDxxIdpCfgnEcO0hv+9zquu6/CoZhuENORVGcy7J8TdPU5py5M+izaZrWAHMppRYFaSmYl/bBX/BFnqUAn90jcNl7s98TX5AhCzQgInoe5hSMIRoQET0PcwrGEA2IiJ6HOQUZ4oCj4AwRa3tCTyYNDjgKzhCxtif0ZNLggKPgDBFre0JP5j8DIqI3g3/mWlXVQ8EY2iuYLxtQMIa2CvxloiBCvZl1eDaJl4kKjvAGPCueEVC7/nwAAAAASUVORK5CYII=",
        ["WedgePart"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAv0lEQVR4nKXS7Q2CMBSF4XsSRiCsYRyFCZRJZBNxAzbROYANIKnnNsFUCv0Ib3JSJemjP4CczAOmabrxkLIsXzyigfs1DMMTwF2YMaarqqrhx2DgbO7ltRQEnIzj2IrIg/OKIeAUMEVRXOd57vgvLnz0VwgBZwEeHyI1kT4HAbcCWjYCzgW0LATcFtCSEXB7gBZE+Kzhy9aFAO0Q4feaQB8DNA/haX9dWAqgKdIsy/J2L2sr0MrBm+i2vaxZ4Exf53KJEU2r8pMAAAAASUVORK5CYII=",
        ["CornerWedgePart"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABB0lEQVR4nK2RwW2DQBBFdyTuuQDXuIWUkArilOAK4lRAtoK4BHdgSkgHcQe+AxIuAGn9ZmyhNWZ9sZ/0tKOF/XxA3IM8P6DrumUIYce4KYrim/UuNwFt29ZZlq2HYdhrUFmWK7aTCF5BQGDxqFQhhO29EMGRqP6RFm/agvmFvWSI4AgBG27+YlQ8KhU69mdDBEeapjmIyMKduWqBsyGCRt/3C24+MMZ4VCo0piGCBh9vzfKLMTctlDhE0CCgZvnAKR6VsYXCq67yPN8Ks0FAYJljtgUBnwTUFsDXX1Jrx5jCo1KhHranOxDUp/+4y8UE2uKdFv/xYcUCLn/gzzn3ikmmhxULeIQT2tWKEVcW2m8AAAAASUVORK5CYII=",
        ["TrussPart"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABJUlEQVR4nKWSzW2DQBCFBwvOYSXg6hZMBymBEuJKjDtwKsDpwB3YHYBLyBUO+A4S+SaCiPUiESVPQjPz9r23P8KTf2IxoGmaAyUXF8c4jnOZwQmo67qgpEEQvBpjHvTStu2u7/sL7ZYAy2MN7JwPw5AtmX3fz6jlWsBAcYA5NcZUur4aMAnGna+04cTN1ydYwyTAHHZdV242myNXKkZOA9evwHENQt35A/Fp5FK4C9wWzvJYg4opFbvekyR5EzByn4RkhKyfgOIAc2p++4jgTltygj31m5tM836CNaiA3QwPePM874z4pBxVHzHkCq32SH9gDU/iihD9sQoNZb4yv0dRdJYZnAAVgwchO0w3EXnh0zDHrHgOyEXkwGcB837JrLAC/oIvOvLKESZokmwAAAAASUVORK5CYII=",
        ["UnionOperation"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAyElEQVR4nKWR7Q2DMAxEnR9sAHt0lI7QTkI6SbtB2QR1DVgBKX22BCIBIj6eZBmcuyMJTi6yCOj7vqZ5WfKqqspLQhTQdd3bOfeQGSGEH7OGx5qASK9Mgy1zURT3YRi+vN42A9i2F75ATaRmSnIBYW2ReUsz8wp2J2ZCGGgRLLq1ue6MozY81qo5FKDm+bFUszsgNVOmyQbQItC1NDMrqjERC4uAFBWnOp2dDuAin2VZfk4FjGaBwwFzszIGeOG/UllSs2IBV/gD7bKMEYII6D0AAAAASUVORK5CYII=",
        ["SpecialMesh"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABs0lEQVR4nKWSzVECQRCFX1OWZXmRBCx3M8AIwAjUDPDi30XJwAzUi1pc3AzUCIAIxAgcywTwopSFtN8ssLUoN17V7vTP6zc9PWNaEv8EXo89UUVVTNlIDyzyFe2zSGMN0jsLKmFOgOKmjXXp60rti2JXQxGmrpsOyD17RS1EMk1RCEyL7yE+Eb3C7hAuQBfb+tGFuXZd2k/b9kgY6hSvh97FqZNsyZRAPCNcAOFrOgpwLuH0EGgI4Cvu3tCa+hpqD7cL8XyhAJ1hRu4j3BpH6eYC4dCfWRKcbKttrfcTr2/eWo9YgVns7cjv3fONQtK2bcOIAnQ1AUEr+2X8zUU/F+D8AWMLMw+WSWWUc/xemEONOgTi3Y+V4dTLpDIIfFBQjTnsnipqMoNADQKnXkNgQLCarwyRr0lygzSm3mQMLg5xxmFNb6wPB4Fzr+pTAafDQ7kmFJj0IL2yAfYkP6RQSngfZwjuaF1JzFMzAXPYw3ngup7EThA7hAsgvEMr8Xp3fdFDiogiLBnt1WgzI1nHp25yZmJ93OasOALOPPJ2v5UoYsS5I1bye5dWFWLbWAWMbyn8AksxxRFjW3PUAAAAAElFTkSuQmCC",
        ["Folder"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAjUlEQVR4nO2OzQmDQBhEv0kaSAnpIJsaYg+B3FJCOrGE5BZPaSBgCWpBsj4EUfEHlvXog2FmD/v4ZJFsI/D/e0E50iNLdcterFU6gadm0FvJ98lYRGRN8LHjIbW6/vE425hSSXYVYxGfPxyfc+aJTECgVsAFBeVIEEOBp4LZBRsLSupCQqgQuFYQQ7SgAd+WOhGV3bOVAAAAAElFTkSuQmCC",
        ["Configuration"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA6ElEQVR4nO2SwQ2CQBBFZwncJQHOWoFYiXagHUgp2oFWoFagHYgV6BkOeIdkfbsnRIgSPfqSyZ+FzGdmGSUN8jwvEAnD0EfeYg2KoojLslwqpe4cE8Kw0loPPM9b+76fcm7FGvDVPTIlhKItIpjNEcOBbmZoK4owHQyrqrpqiqMoWghkWbYxJq7rjujgJh38xqAxwkaA4oUAug6CICFtxRrQgbnExHGcOwZLHtlC8hsdnHi34zyUZ1LuZqJIOjHGjHYkHRAvYKCsASOckZjoRd1AI735G9QM2LqU/zwm/Rh25MLWxtbgGx4SRn8RlXc8ygAAAABJRU5ErkJggg==",
        ["Script"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAW0lEQVR4nO2TwQnAIAxFv8u0i3WPpnt0sXaZ9kdEUC8RET34IPwQyMspDo0kgu05BMDJsnC9+y254GOYocCNEegiwxMbZQlmEFjQI4VAhwwzXQSCyidCwAta+AHpezoR3LuyPQAAAABJRU5ErkJggg==",
        ["LocalScript"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAjklEQVR4nLWRQQ6FMAhE4Wz/u/NO1jt1p54NB6MEtdgmxrfppEOeikwvOQn6SRJuBsQ6QmPuOJ0FswiOZvKfORbsTyAQvdmjQEscRtRZUKIhJeosKH4ITco/HpGoX2TAJyXaaRM8UBe4BR74RVYFfsBT6i0opQFPqbfQikpuAr3E0cwHArfhKpc/tAnesAIdPl4RAm5S8QAAAABJRU5ErkJggg==",
        ["ModuleScript"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAZ0lEQVR4nNWT0Q2AIAxE6X66Bp2prKH71fMSE/ojIibEl0DbwD2+kDRIELjqmtwXtG1EdjHboiBnQ3mMlKJzBGcQhfxIUIdqugQ4d7QEM7PcLnBhsuANFMDc9XKYsT4Q3HwiBNqCEQ41LllvHDDA+QAAAABJRU5ErkJggg==",
        ["Humanoid"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAuElEQVR4nK2QuxHCMBAFdX3QjR1CCg4hogoiqiCC0JBCiLuhj2Ml8IHkQXhsb6B7I51WH3EjiQTaLBdOZU5kRW9SXK6kLLHgvjpQDCnPW0qWiQVjnzCEIIhOTvlzk5cgeXuK/wt6lNr2Ww4DEz8FNIaPpMc2fecwMJEVsK7EDqzJNIIWGiMRDXZ9SgfWewqaau1Uj8QPIhsp6lMvgSeSvDc7SATVjnFGBHlIWe8JBgcoxYttn4WhPAH/dG0RahwUfAAAAABJRU5ErkJggg==",
        ["HumanoidDescription"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA5UlEQVR4nK2QOw6CQBRF38O4CxO34B6k1MJGKbUyVroBo7HX3kqtRCsS7YQ16G4oDIx3RIkz4RfwJMAdmHvgwVQRRSC8fpcEdxDxRFy5fb4gZaIK3MEWlxg2T2NcMvmzoOoIZXgLlDfr5HxJJNBm1/n9F+JmLdFqsmmPsEQERQXCsxZk0IEC4eDuXUqKCHwIZsK1dtg5JKIH1bhHAbfYPDp5Ap/qvKYnrbBrSDFGT5YRohG+aKLkMvOI2/aePqQLjHBDoTFBmuKI0MqSVAHmHmMtECMSyhJNYM1xbiCqgpSyRBGU4QWPKWsRkTEmvAAAAABJRU5ErkJggg==",
        ["Animator"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABqklEQVR4nI2Tz0oCURTGz5nK6B8ZvUBBNUaLhF4gWrQqqpXLhFTa6bpNBdE23QShgT5Bia6jlW5bBDluJIp24ZCClHFP351QzImmHxzOd+9wv3vOGS6TB8Fawt96b14J0yoBFrodGR7fuZtN2liSp4FZjSZFJA7ZhZlT1kI6AeltsGBF6kh+RC921cxMIf/LwEaaRHRBG49WIDNDwGWw8hIbbb7JBjMFSVFRGbKO7UNEL8eo4IiAywA3hpDWEGQQv45N8EmzKaekZBtbhGFmO4c1LgOzGjsTUaOQDtqEDKNQmb8oY+nCbVDB1FlGILuwcMsKfE+9H+7vmUhNK4M38K3DjW/AV7qfO39Ce3WsCS04f0DD2HT13GioTehlRfQ8xFRqC8WZxRYhpwpclhRhP76l2Ktn04pcC9EWpCaH0OwidP95/q1nbVIx0weQFKjtz6iPzxpkDqWHCaDqLMHE8A3OcuBhb7OvZzKUFCuLlwVIbwMIvRHCrcuQmKEqdw5rfrbAWXKQMAEcziP+ZqkaDbZFEnhAdudRQaegMUROehr0gkptJP0b/UgOX9H9vYtNglpnAAAAAElFTkSuQmCC",
        ["Animation"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABcElEQVR4nKWQsU4CQRCGZy5SKDGS+AJaeIexgMTK1sIKEjtLSRRasbGwQRN7sTSHCb2NCT6AHS2N8e4asbEzEkFMUG/8d9UVLhhFv2Qys3u739ws0z8xAtvfrBLROkITOBVG0qSvi4mn505JhHIEmKnq25VtlF8Cdajbe7wgkhSBfoET5MsisoXSwMxHvu0WzaGFIJ9+CeVMmFtK0i/A390jJRAGJm76jjurD31eHrN4NRaLN7u9ThmCHH0AQQtpCmFgoRs/WZnRAtvPN2JMuUvbbWBJi7eFic6DZMjiJX6V09CSFWyXEP3so8meFkRBxzWkZQRZxHfxST5ot8MddM0REDyiukxgqMAJCoci4QRKjZKQZdW8ueM6lgMMF3h4dZZxlAYl8Rx3F+UAWhCdmSicDi3O4JPBCuXcmz+poRxAC76ZOYs6hS34wvqwywotGGXmKO+CEWaOogXJq43sb2eOogUK9Q7o+uPMUYzgr7wBRUSnEXgPqssAAAAASUVORK5CYII=",
        ["Bone"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABFUlEQVR4nKWRwVHCYBCF3zpe9EQHJB3QgXYgJcAFHU+xAulAvDiSC3RgrECtQKwg2IFe9OK4fgmSIQkDYfhmdnaT7L63+X/TnjQWSCNv2ZcmlF0i8WP1w5F9NBaYn/uTXKf6x02P4di6zQUG7qQSQWzWWCAd+DPNJ5Q5WzdIL71jP3qgIWnHdpWdgb41NddZNqwj9cJNZ8DKr6QOIfactsfWp6xhRA3WHfLhmrIA11tWjihL0FcmvfDAfpW5t4gCl97D2AJVqAlUryuD4Tcd8s93NuOxREmA1SNe3FDmMPhJGuI8Iq+F/gXV1Rl+0QGu9zbXBgqB5eoMbnVdJRfAvYf7hOFGrqssBLg2STNcE/JO5AL78AdW/GYR56HdXQAAAABJRU5ErkJggg==",
        ["RemoteEvent"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA7klEQVR4nK2RPRLBUBSF741Oyx6UbIEoKREbsAAlLUq9UuWvpAw6lRmU9kChUsl1gkgySV4ywzfz3j15M+fL5IXpR/4rkE0tR5bWRnRhWbE+XyKF4heYxgB7BtHhTimtx8XJBTmUr0A2hk6W1BFdYt5u8xLIvpWm261PQmk8fuArl6cdBCVvgWk0sJcQXTRryKXFGUkJy7aZpYfVR1aT0rphd8GyrldJuIIcDfOY9ekOKcDrE7yI2RhhuCjKNmpBTNkmWpCgbBMu+JSRDzgqYEVxDArwV5zbhkC4PGPvxLGPgMALCkeMPFYUJ6UgCU8e/lzlKb4QxgAAAABJRU5ErkJggg==",
        ["RemoteFunction"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABDUlEQVR4nL2RwY3CMBBF/yD6YFNBoJTtIFySvS10QAfAjeRCOoBOCBUE+kAMfwyOEhTDAYknWR7/eF7sRPAh3xGcU10qMOPm1aiQOaMGZq85Z7pVRYIHIihHuUxZOoQjSJ3pShT/LDu0JcLhqFPNOTVEhWSnVFWHmOCCkhtjxg0qWEe52LXCmIBTpQP84oo9N8cMjhgikQsOP4WIPL/Z40/A0vCSBQZYyBU7ZmMnYBGkJTAqNkyYHViPOcD1XdB3CjtB/acJ37bl0mENFChLh62d4BVtiTV4Aa80jTZSvhUYXuIFvhnEguZOAdzdvaTdbJhAuaEzM+9gOade7DdWfBqz7oW2Iz9o8ITs/Ywbui2EEXfS4JIAAAAASUVORK5CYII=",
        ["BindableEvent"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAy0lEQVR4nLXRzQ2CQBAF4HmxAUrADixBotYA3rQC7UCsQEvwuD2AwU7UEjx5wnE2gSw/uysJ8Us2M5d5EwbQSP8L4CyZE7iQ1mAcsVIpNbgD8vguJSTjRRPMEKkHNUBeD1/Xe+LPSVrDsl3rBXCxCah86+2BvAqeWKqQLPoBeXyWspNnMCLZfiOLVgAXSUgl6+1+E0zrW7QDsiSVyx+kdQO2WKgLVVoBXfI5LMXoDGvDAyzD2rAAx7D2O8AzrPkD5K/U13bxBgwxOuALIVpHEesZTFAAAAAASUVORK5CYII=",
        ["BindableFunction"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA9ElEQVR4nMWPwW3CQBBF/0f0QVwBUEo6MBc7tyQd0EHILfYFd5B0AqnA0Adi+LOwlkEYkJDgSaudGc28nSXu5DGCdWZfBnyoeTYo+alSg2qXWec2N0OKAySqQcGJwgB1Oqlzm9HwrvCItoQ6gTqzQldDUjJfZWbWxxgbVGocqtxgxHdS0L/VjQt0La2HV2zxp+ahCv/oI+UGi5eS5OnLkbiBQidKpuhhyi1+VRsFgYJOWgJnqYGxagvFIx0o3wvObeEb1G+W6rW50oAPSGAKA54HwSXaEh+IAn1pkvywuipwoiQK4jDETQInStrDzs2CLp4v2AG8rW0RvZxP8wAAAABJRU5ErkJggg==",
        ["ScreenGui"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAjUlEQVR4nK2TMQ6CQBRE90cPoEcy0c7CG4k3sqDTxCPJASCfYcgUVAxZXsO84v2KjVIJD9w/2WA9MX2yvNpbNPOBbyY+m2mvEfsdOB7K+X2JDrrK45enfij/xYFJMG3UMJJg2qhhJMG0UcNIgmmjhpEE00YNIwmmjRpGEkwbNYwkmDZqGE1S9yPVPqYaRqB9ahEL95yqAAAAAElFTkSuQmCC",
        ["Frame"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAkUlEQVR4nK2SMQ6CQBBFd2Jlp0cy0TNo6U3Em1jKGSDhSNBRkeHvkE8HDBles/+Hfb9hJQU5ZkCrV5FEP4h+VL7y+BfTQP3UdDpf5fbrUDfR5n1JQ9/KvZR5IBdEN3RMYkF0Q8ckFkQ3dExiQXRDxyQWRDd0TGJBdEPHpFzCvxHHblYH8kccM0t37FL4KUcID4w9UGARqO9m/QAAAABJRU5ErkJggg==",
        ["ScrollingFrame"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAuklEQVR4nMWSyw3CMBBEd5UTN+gASomAGsgxVEKohBxNDYBSCnQAN07RMmtYg5HCR0biXXbG6xlFipkS+U2BbIqKWBaQnyO85KmrrgXbmVDWG3Ben2DfIk3Zp/Z85MmaQ4EayAg9x6CunZ77hRnICD3H+EOBNMWQWtlD3sl4xLk70A3L+JAZyIDsipJEVpD4BJ7z2NX0gGV8yAxkhC8Bz2HFMj6kJvk3YnzNywJdYgS67vhLyU85heSCC1JdfhFFbEheAAAAAElFTkSuQmCC",
        ["TextLabel"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA0UlEQVR4nK2SwQ3CMAxFHcEd2AA2YAUkuPXARpSNOPQGEiPACGwAA4DMtxsjmrqiKH2XfDexv500UCbDFCiOXELtIJVqHfR7SnFixlLDtK82odSDsjEe0eywCg+EP9meefp80V2MPgUkgOyN5WiSBZANdDQgrVKC5bSSjNjmFXKC8RZd43UWMHdYzHF1N68LwS1g7nBeIhR9gXa7cAuo+9ezKvHZKEEL2IVANtzN0ftmOZpkAWRvLEeTJED1jB8pmVk2sLQQIyw18U7cg/+QXeANweB6EYlg5fUAAAAASUVORK5CYII=",
        ["TextButton"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAqklEQVR4nLWRwRGCMBQFX8Q7lmAJ2oPe7AnsiZv2oCVYQrwb4xIYR2YSlAnuDPASwv4fYpTJPILDydekivg7Xsdmb+pOcPaex2SanTF/FtAmdymxvVEBL+5FoQ3ROqcbC0rygFGB+upmwcdPrTFWDAckBUyG6g+nC9mSt7EukgJRvT0ifRA76qiAiXd1hiuuFrvsuriysGQciAqmMKMgsr+v9P8pCHLIFrwAdJdZEYnmdnQAAAAASUVORK5CYII=",
        ["TextBox"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAnElEQVR4nO2TTQqDQAyFX2jv0R6hPUKpyxF6BHc9U3ceoeAsLT2CHkHvocQXFyIo4s9O/GDI8BJeskgEG+kMXKrKYEKhglgUEYUriA9EGEYZJF5/vVU1svMJ9+9DckqTtAbupyE7On6RBPK2aaxrmOqH0iic0vunJK1Bv3CugWG1h8F+DDYvUp9Vq2xYVwajhCJmJgJw4Vt2TEtpANLwnBH6H4fRAAAAAElFTkSuQmCC",
        ["ImageLabel"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAyElEQVR4nK2SMQrCQBBFZxoLsdAj2CSW8UQqqLU3MN7AWgX1RKZ0bTyCFmJhE/8M7CAGs8LmwfBnkj+fZFmmSJoJSNw0J6IlSrmkO33+DXwlxLOCL1ejvGi3Or2iv75jDJJdF93n63FDAFuADGj/xu/okh/Q/gSeE0R+bwiRWXcqSwM3H0HonG6OECNxswKCgG0GMRhlwLQnKsek8AHmCZpaGGXIZ0E+CIcwyqgGCPUhjNJFORBRjEG8V7S5gNiLlFPMVY4hOuANl2RuEfb7F1QAAAAASUVORK5CYII=",
        ["ImageButton"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAr0lEQVR4nL2SMQ4BQRSG35NQiIIjaJaSEyGhdwPjBnoSnIiSbRyBQhQkxv8mGdkNs7Ob2eyXvLx5xfdVwxRIOYHoPFVEtMAUYRn3NsoGNFZhEODqAnXmIRa9tD5gGVyBPUYYYb7kCtSYJ6dovSPQj2fjt9ZbPJ2kAknZ4oukAnLg+UNWRBwjZQUEV0QcI/kC/7COkeRoNlqdY3d1w+llcJm3H8/7NRlQFPKVQwgOfADTm2URw7OBvQAAAABJRU5ErkJggg==",
        ["BillboardGui"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAx0lEQVR4nLWSTQ4BQRCFq3AA9i5iyczSiBVbO6cQJC5h6Qb+dgY7F3EADoDyqhMT0np6OuLb1Oupri+T7mZy0N7JhJjGiG6Epm5BKoLi5b+CSplqyyZfsbToHqV6u9MlV7CN2dlXdI9zgzaDBclBevSgaBPzUJtBgmQvA1xLA5GCBQh9hBai4SUofIhJKnMdQswIekgqQMlgpvM64hmil68CRf/o/buuUSwKCUpMi1XEJ0QLryBvWDGCTiojIaojfuAbVozgF57wsnZNd82bCAAAAABJRU5ErkJggg==",
        ["SurfaceGui"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAz0lEQVR4nM2SOw6CQBCG/1EaO72JrXZG7SB6BDrjKcRjWHoDDHRC6LyOHsB1nF2zGCQ8DBZ+Df8wO1+yD0JHSgIvYxcKnsRamBDHc4oKAi9lH4yJxFZEC9rkgm+HNQVBE+uMxw8Fn4GBlIZc4J45kNPYSayGsXcchEphK5XhLUiY5dNIvCDyEj5INPxW4PQxCmd0k7KE7H94V7jWCnRTYiV2zf8IeoTjaU4XM2SbEiuxa7TADstvuX1BN9se4irlqR3WvAQtH1K8pAAfGEEXnt7fhxFjJ5/LAAAAAElFTkSuQmCC",
        ["ViewportFrame"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/ElEQVR4nKWTsVHDQBBF9xgiIugAVQB0BIkIcQcWFeCQcURHNhUIKoCIiJnl/Z3Zs04O8Ixesv/v7d9TcCq2kFgw9j4g1sjgeluwx3z07pQA8dxtyxCDOvALu+o25Rv7L+PKL8uPfemiukAGeTKZiVAaZPDZ+wufuELO2TN3R62ZGkrGR98UtydkhWXvdm735dd2CtGqNEbkZmQD/R3ldn7WGMEgF7YolH1pSqUxIgenKJR9aUqlMSIHpyiUfWlKpTEiB6copL6f2UP3Wt5sQizQoYaQepV7xA2yYR7ODLMHgzyZzERIZtFT5rMHxBoZ6IByhC6iBIjDz7SEP5AriRFIn4fAAAAAAElFTkSuQmCC",
        ["UICorner"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2klEQVR4nM2T0Q2CMBCGrwTeJYF3GYEJdATdwBF0AmEDmQDdwBEYgRF856EM0Kb+vaSGEIg0JMYvudxReh/lkgpaCQu6riuI6IqYokU0YRhWcRy/aIQTGKQl3NI0vSB/mBRgE69LKTda64Mx5kREO4SlxfscmeGNY8GAHs3PKIpKiPaoa6yREKJKkuSM8qvA0SOOaNw6CWaS2ZkI1EsElh5NuVLqTvgdyPgUPgLC1x9BEDTINR55Fl4CYE+R4RQSNQ/bV8BNbr+tfy8Y8l+CguYv0xwlBAUL1vAGt4J3EdFO1YwAAAAASUVORK5CYII=",
        ["UIStroke"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA9ElEQVR4nKWSwQ2CQBBFZxMuepIE+tBKtAQ9edUK1Ar06klL0ArQeiDBk15I1scYCMgSSHjJ5u/MH7+ZsEYG4gxI03SSZdmF64Lj4uZ53sr3/ZczII7jCHmGYbgXB/h7EZniL9oCLKZBj5RjTpU33hZPZ7oCzpQN8NZ4OqMBrp1zk6F+ARQR0tiZfu8ALVDXzg2YbQ1w/mMVY8wnCIINs/qbXgF4a6SEuR0yo//7jDQ6A/As14I7D2lZPqTcZKgzANX5KtoozCRJTtbaEa2S/51p1dAG5kNEIgYOaAP8HaI7ozUMp3hIVxGZc1yUO3OvoQFD+AL2BKgRJQ4VbgAAAABJRU5ErkJggg==",
        ["UIGradient"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAr0lEQVR4nKWTwQnDMBAEZXADeajFtBGljNSoTzpI5hZW+D4HRgMmueNmXvbRNlFgzjlaay+eO7x778OB33meD/gyLth/+Lny5FkQOFYgBv4K5lI04UhCSAHDvgyFI4nDFGAuRROOJIQUMOzLUDiSOEwB5lI04UhCSAHDvgyFI4nDFGAuRROOJIQUMOzLUDiSOEwB5lI04UhCSAHDvgyFI4nD9Cozl6K5Bkbb+Zh2+ANkP2wRDzQJ5AAAAABJRU5ErkJggg==",
        ["UIPadding"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAnElEQVR4nKWTQQoCMRAEs7AP0EPea3xvDvEBAa1piMwcBldSIF0NnTm5R9lEB3rvrZTy4PcPz1prWwfe53ne4UX9yRjjNuccHDi+B6ygl1lv9GgVVE6k+J15KKicSPE781BQOZHid+ahoHIixe/MQ0HlRIrfmYeCyokUvzMPBZUTKX5nHgoqJ1L8zjwU9DLrjR5Z2f0rt7LzMe3wAULukhGt/PvyAAAAAElFTkSuQmCC",
        ["UIListLayout"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAARklEQVR4nN3TsQkAMAhE0XMI542Z1yESOcgAco3kg9g9bDSIEcjMALBqOm13jwecWu0KsCGAEgH5gg8AJQLyBSOAgPJMShe1zzIR4YwQagAAAABJRU5ErkJggg==",
        ["UIGridLayout"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAUklEQVR4nN2TQQoAIAgEt0f43uy9PqJEKDoYBHuJBoIYZW4WkETAzBRA9ReISHHX/btIXHOnM7APsuWjeyTAEIGsfOt+CTBEICvfuncCCuaYGAZZLZIRoGJUNgAAAABJRU5ErkJggg==",
        ["UIScale"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA50lEQVR4nKWT3WnDQBCE70AFWA9SG0k6SQdJJ1E6cAkuwSW4BJfgZ+nh/C6B/M3CGo478I8+MLPD7CyyhWPYiB2YpmkIIfzxeYX/rusGP7A2TdPCFfuQlNJuWZbEgXg/IMP4NN6xkhvGgnEcDzHGH0bD97yTGcYCPe48zyeOfGDfOvDJ9z2u63rVEd/zTmYYM7zMD/yNvfAk+77vfwN4x0oySBXKX23bnhkz1HnqgJaQAnWUWSiDVNESUqCOMgtlkCpaQgrUUWahDFJFS0iBOsoslEGqaAnJ4O3seDtJmYUcGMKWP9MWbtOKlBEs43spAAAAAElFTkSuQmCC",
        ["UIPageLayout"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAZElEQVR4nO2TwQ2AIAxFyxBspXMwhnUM59CtOoS+mpiQqAdSjvyE8MIv7wRJgnkJzExFZGF9Zc05q1S5BVya2SbKAp/wb5hJzGzgAe+PwA+8bBE4lyEYArifIPaU61CqtH6mSC6aGZwR+jgxIAAAAABJRU5ErkJggg==",
        ["UIAspectRatioConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAsklEQVR4nM2SsQ0CIRSGH4EFKOg0uokruIKVlRtYaFzA1u4K93AFR7hEO0iwh+T584qLlcflEr0vgR8C74MEFI3kdwLvPSMEZm6VUo1z7lgt+CTGuMw5N5DcO0EIYQ/zHMNeUPjQWl9TSrdOgCteENXg+lvU8AQEpcOk5GABgkrh/wUvY0x51x3mM7QanhCckCI4ENEKko21tqWByCvgE53xidYYLtAEnCBrfVRt+sZowRvM6mBCm0+WqgAAAABJRU5ErkJggg==",
        ["StringValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAArklEQVR4nL2QUQ7CIBBEl4QDyAf38IbiTTySR/AbPvAAJLq7Mg02lRLb9CUNDKQzyxjayHEGKaVAjPc+UMOQQc75VEq585astWfn3JO3ypAB0kE7xaoB0iWZJWGPKVYNavqFv5YrpugatOlInJ91DWr615uFGOPNGPOQ867BCPsY1FHnRS0xlQdg8OJSuJNPUUvU8jIb6D9AhRjIhawslV9aVpYTKuRi6wSB/uzgDTMbbBEmvHK6AAAAAElFTkSuQmCC",
        ["IntValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAzUlEQVR4nK2R3QmDMBRGb0DfvaDvjtBuYjfoJrWbdARHcYP2WYV0ACH9biBFTBND9YCEQ/DkT9FOkgLjOHZKqa4syweBpW8GtNb1PM99VVUF1PNoACsZDEEQUdGAMAzDM8/zCzP3UM+jAWz3hO12WKkmsHYhGEjZPoZwQEBEZ1l2ZuYXgbULwcA0TVdjTIOVGqjnjmAglWMCOFtLRDd8W9xxhJYWuIDB5eBu+A39CZ6wwBNqBOw/DisSkAkZoZaQywj9YkUm9u6gpT/v4ANuJIIR1He3OgAAAABJRU5ErkJggg==",
        ["NumberValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAuUlEQVR4nM2R3Q3CIBSFrwkD6APMoRs4St86hjiGT8aJdA9IcAACnktSUizapk2Tfgk5HH6+NHRHC1lfYIx5Io4YzEtKeUJmpggiIgNBcacoOHxDZHC4xdpAgLV0DvO2ENTA4YEAkSlKDWttE2O8Y0rIh1KqoR6jAoYlIYTz92VmkuAfGxHgpTURXTDGuOIvaOrRCaIQ4gDeqFWcc3vvvYMg3elIhQW8wYma+NU5UTOp8MbSL9A08w0+czNdEYpSfskAAAAASUVORK5CYII=",
        ["BoolValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAwUlEQVR4nK2RQQ6CMBBFpwnsdQHXsNxEb+BNxJt4A49CvQZd1H2b1D+NkCYCLcJLJsNPMy9MK2gjiwKtdYcmUVOoqqqalMCjzQKBWC3w3r/Ksrw657rVgu/wGcNPRJklKIqisdY+CMTDqOwVFCQXdIqHmVwBo1CMRI0kBX3fKyHECZ8/8H3UdS0XBTnsI8CuLRHdUCnu2LuliEHAz3UEb8RJjDEHvIKBIMwMhMACPuCOGJjL3BFHQuCDrX/Q0p938AHJGXURvtO1XgAAAABJRU5ErkJggg==",
        ["ObjectValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAwklEQVR4nNWS3QnCMBSFb6B9V2jmUDfSCXQD4wQ6ghu1rpEE4gCBeG4gpfEnFetLPwj3nvtz2oYKmsiogTHmjHDAeaaTUm6KBtbaSwhhj7QH+lbX9dZ738JAFA3w9MBDSDNQbxHW3HtpDsFgQMjgpVTnfMYGQohd0zTXooHWusPgCmkGanGZQNHgG/5jgG9SRHTEGeOEO1A0IBmEqqqW4A75FufcAn+fg0HcSUTBBtzgCBn5pDlC9kTBjalvoOjHO3gAl9J0EY1tQAMAAAAASUVORK5CYII=",
        ["Vector3Value"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAyElEQVR4nKWR0Q2CMBCGrwkD0AdYQ0dxA93EuoEjOIIjOIIj6Cs8lPc2qf+dKSGBAoUvIcdPcx+Xq6KdZAmapnkopc54FaqqUlkCa23pnHtBckDcJDh6758hhI4lWYLYXBTFCfGDSe51XV9WCYbNWus3PvUsCuaamaSgbVtDRFc831QzMycIKAIvC2WS5AEEhv4T3CAwlCApWIsIBn9bYjRNFAQsCnvSHeIkuI0St2EhkJ6IBBbwAVdEIZW5IvZI4IO9ExjauIMfrTBzEQYiiJkAAAAASUVORK5CYII=",
        ["Color3Value"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABNElEQVR4nKWSQU6DUBCGhxT2kgBb8QTiCcpN5AbWE0hPUL0B3oSewHoCcQskdA8Ev6FgupCnsX/yMjPhvW/+mWDJhTICmqa56rruYRiGJAiCm7IsPyzLymzbfnFd98gVM6CqqjdCxBHf9y3qgVR1oL4jLgPoHoqIOngmrnkwA/Y42BCPuCgWAWqXkDuOs+37PvY8L6vrOlmtVjnQHWNFOtYiYOqm+qRjrN3UFY9zEbnmjGOZAAVd1EGKgzUOXnFwj4N927Ypy4wBhIsA7SanHeyIenneQY6jR6J5Byr2cKDTLamcAQRn78wfkYoRgAt1sCFNAIQAChHJyFOZZAT8RSMAcioiT5zftD3vrpoBA4thJ6ff8ydN4zQAxjezxkIB+kEj5ailWiPlt8ZCP1zqIJV/7uAL9vi0EUBnQ+MAAAAASUVORK5CYII=",
        ["CFrameValue"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABQklEQVR4nKWSzU3DQBCFZ6X4biT7Dh1ABZgKkhaogHTAUgGmApIOQgdOBbTA2bZk3/3HN6t48WEDEvmk1Xhm3r7d2cTIL9R1vZmm6YnPLE3ToDZYVMqyfDfGPGDQEg8YWIGqqiaCY7Va3QQNTifnCG77vj9QshgUArMBpm9JkmyDBogKBDsEO74nNnud5rA3xsTUN76xREWcfgWtfiP0uqZprql/zXXfWKJNghWRQlgqJDro3RMyoa9131iCqOCaMddsSXXDkiNLaTEIj6CPOI7jaxRFd13X6XtsERcCjBBT+6T2qLWggYJJjskaod7igzfJh2FYU7PU9my2AmcNFEbJhFnlZ4wjS2cv5IRhXYQz4CQrIs+sv3jhdCsLZgP/u5MG0cfjX9lg4PbMuEQNtKGR1HEu10jqcYk2Lr2BlX++wTdnKrf+SG50MgAAAABJRU5ErkJggg==",
        ["Sound"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABD0lEQVR4nLWRwW3CQBBFZzhySdKB04HTSUrgBIgq3EGcCwIudgnpIO4glEAHcQGIzZuJV/JijJAQT7Jmdv7337VX5U4eGxBWq1zX6z3tKKMBYbGoJISZ7naJh3kpqnvdbGqBRIxg8pcFBgGcSo7Hb5lOX7Us20Q0+i8bMSDM5x8ymXyy84G+FpEDWuGiwfCX8syTgMk96AVHz3W7fe9OUaG9uWhgCJQBmNwTlstMTqcf1i8s3U+vLho2oAwwEyUGNKwzAfPTJwEt5YknwUwU04uzT6jRchf7sNOMnSpaB5N7fC7SjP7EPm7uQjAlnm73hmvMLl5jJIYMAv7nLfMvlpKI52DO7MhyhasBt3B3wB9FR5IRUw+xpgAAAABJRU5ErkJggg==",
        ["SoundGroup"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA4klEQVR4nKWSPxLBQBjFv0eldAM3cAbjT0UrlKlyDHEBvS4aE1o6cQdu4AgqHetlk1kbIZNMfjOZ/Xbfy2+2WEhNcgJ1mvkCteBYjMISw9DPCyJHcfnHlV+XnwaDHcoLABf9MLBzI1Dn6YRXGvPAswuG9Gchds5+KoicNZf4ICtottroBXdOBjtnv1jAvc5tvnNd4OFPQe0bfECAQehyiLsmZ7+sICaR2Dn7VQSam4h0JIX9rEAar5U8m/PKL9EIIA8KNhhtL9yVIisoAa/tcTEkgvQlciwG6oj+/sDJoAV1eAPbJYgROVHrLgAAAABJRU5ErkJggg==",
        ["PointLight"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2klEQVR4nLWQvQ2CABCF70JlJW6gG+AIJFhrJ52s4ATiBI4gdthprcYRdAPZQBjAnI+oyM8RNcQvOd+LgS/kMTXkPwI5ul26yQLVwqWcyeAp22FEJSqC58snVBOXJ4akX5ZUBfvxBjHEaWzZWY+QGZrgijBxGhEEPWQG4wpAECPaOI0EAhOZoQjcAL8TUuEVO6FHOaqCx4gX1DIJRrQ+jpgiO9cnlhnqG+E5D0KfSugC7SuMVoftIEYroApSMKYgMjCe+qz65y/UCuTgeiSyRAXV9V/UCr6lseAO3NlGERQ3o2MAAAAASUVORK5CYII=",
        ["SpotLight"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA50lEQVR4nKWRuxLBQBSGz0nGDJ0H8ARqvVveQTpUWi+g09IaGlSCV8AzUEobpUIlGln/hokMIrdvJtn/7M75dmeXKSWeQGz1Fgkqs2a0UUaG8b2axRTRB88ha1EIQYIDqbkKV2cX5L+4AonYNAQGSeRmyafAbSbnVsSJmqiDYba4bvR9An1GarYrd4ZsjKlQWFt2PIGfaAJhsrYapBDwDq+0TC5QnCHX1seEgufxEd6v4CdEYJOq9Lm6OCPHFtiU4QGXDQvZJYZAmJTPj7g0uaLwCBDoPfwLWD6hNEm57+WFIX/xUxCHByo+YRGxvZvzAAAAAElFTkSuQmCC",
        ["SurfaceLight"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABDklEQVR4nKWSPW7CQBCFZ6xUKZJbJGUSKU1aQ5sytpMqqaKkQYIDwAVAVEjQAB2YK6yho4YSDkIDeHjLnw3YsBKftDuzK71PGu0yXUmiQAKvSCIlSmfE2e4L6qlAlNfE/k3nYP7hTKdF4EBgGqb7O59fGzOcIoEot4qSw0pHh28ooLm8Y4Qabg4EI5QnrGR24YXkSegWgl/cRoJLiPp8Iw4dHcaRyAorbPcme4EMvp5pufxDa4bFPtudIBIoz8VuozVljDFqMYFTwEQPaA2RKWf9ckzg1lHMYW7jLwzXAul/PFJo5dGasQ2j27yC9L0MheKgvUwsrNkIlPuPkv4HdhyFNVuBwQskhDVrwTWsAPN8XREIZF6OAAAAAElFTkSuQmCC",
        ["Atmosphere"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAB4ElEQVR4nKWSsW4TQRCG/71zlYaTeAFooOSQaKCKfaaLxdGkdipEFaekywuATYWoMC0NB3YFCU4VGiQuLQ2ReAFXSePb5dvN3UHkNIhfOu3M7sw3M7tn9J9aA+QLl6ysduWU46Z8XiWRRSfSy6JrlvitLgEGh27onMaYbzuxpgSX2B6aVpVGTnpkjPZmmZmqVgvwyVSdxLE2rdM5do+EW6wbBP2IYh0SJkBHZI0aCGehQrKq9JOqXRKuW6uMSnN7TeXsnjkbHLjXhMmxxxi/iF0Qe5MOlwGw9dntg0qiSK9kte0SPfeJHDWd3ccMMpFeOKtnjHo6f2j2LwAH7jvEHdp7EBmVHzJzzPZacq0TxjymizfzvrnbAByOCa0affXzBfsqGZ1xvtfkrAO8aohq5V9cVjEaJkc6/9g3oyYHPwBKRhjaSlm4eTTrmycsrf6CNCNMAaQXgPoSgUy5h6dsKY70ruiZ8HReg29uQ0uNr7xE/4wknkLehHybzR7bbRf5J5faSNuW0fwzEntE7I32Gb38jUMd00U3/EhWW804KLTNKgosSNoBXuAK+488hGebYL4nwf/3JbbvMKXqLuZjvmGT7HUJ4EVwslppxEmOe4fP6wRw0eloAnSJ32oN8K/6Da9d7hFjZHyMAAAAAElFTkSuQmCC",
        ["Sky"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA9ElEQVR4nKWSParCQBSF753HE8TGLVj412lp5RpcgQqKCxA7UXegvYrZgy7AzlYrYyqXYK/kejISSQYdA/ngcO8Ezgdhhiklb0HF63d8kTlWUopabnG1pwRoQaScR/CRr9lMrn4sLG44WtGC0qUnGCZHr7yqY1oJBQ4RtZEIfPLKyxoWK4ykIpGgcu53CLjVpUMGPwVB2VfSwErK54MpiQlet0FN/HsXx1g5xJQwonmVZYMVsIOMWGQsLFkyiEq0IF4OYSfz9z+5P+5Dm0QLcI2C8QG7BO9k8EMQ8F2SUBDwWRIVzIhoiliIS5QvO7e63mpBGp7fY4MRVk8aUwAAAABJRU5ErkJggg==",
        ["ParticleEmitter"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABSklEQVR4nMWSoVLDQBCG/00wZKYoJAIMugITXKeVDWDAAooHQPYh0CiKBQMTZDp1YBBFYFAIJMwwiCqS5b9LrhO4lgoE30wnm9vdr3vbCn7QzVRvOuKdz8Ir/B+BaeJjKvNkXtLI5jXV8QqdIBnoCV8f0rb0eTZaCHFw1ZLRzlCbnzn6rGkyXwqSoS6jQLcqLgWZnjKFQHAuAcauiXkryxt4SjdkLNsD3SyAXSiitCNH7LE4gSVEL23JKyNL9YW9ALiUrUyPucF1nk9l1gRaIOLq43ICxT5rfQR31bVsUw68hMCKk5lJ7A5+k5gJrtty62rcO1MWKzC4AoY+nIQ7ihmV1HYyERjqkjDARb7ERhJ+IM4L7DGcTMTQ8k1gMBL+jRZ5z5zPMx6ByzpEgAbv/1ZvNngCQ3KvEd7xqMAqiADP/InXGHoIP3/iC1CQp/GK8TqyAAAAAElFTkSuQmCC",
        ["Fire"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABNUlEQVR4nKWSy03DQBRF37Oyygo6oISkAqADpwLCxomywVTAUAFmEyXZQAd2OggVOB1ACWEfZTjjhJEdfyTEkZ7vlcdz33ys8k86A+x0OhbQxeJdWmgNKCYfDm9YkSC4bwtpDLBRFCIpVWakq1WGVqgF0PmKzjn2giqzYyVDVvIlJeoBUZQiIdVExipGqKcSYGezgez3ObadXm+o8/kWV1ANmEwSsfYB247qqy6XMa6gGhBFOTKgvinDnjNUOJOxiDxRji3bGKIF5wEWcTzyUYJ6GIuRF0oY8/O8cfDRMaDfv9Qk2eE8p9v5xHYGbETkujNAdc0ZhLwqOA9wAyn1TBcjJRgz4s4hCG75FzZyohLg8DehGlNrXgmd73gaaQiuBThY7g2TjLjtHPmgsyl3/qUx4C/8ACinchHdegVRAAAAAElFTkSuQmCC",
        ["Smoke"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABX0lEQVR4nKWSv0vDQBTH72rSwUVK07HQyQ4Ozm5FV1d1rE6Co6t1UkdxFCf9H9pVcHPtahYVS6FJBCeXhMTPiyTN9QcE+oHHe5fL+957706rFSkl4Pt+O0mSrta6ztLF3hqNxgA/LzAej51qtXoQx3FTEkh8jaJoYNv2Dtv7WAp7X47jXBsCksyPF4TrWJHfMAxvbNvuEm9iGQNDYDKZnFUqlW3CsriGAL3e4fLT6fOUb21COTUvv8iswANuFteyrGdm8o31WBcZGQJBEPQYWpNwDkTuGabsFSuZzsDzvCMmu0u4DLk+ubpzTHBp8TYXoHyj/0WQIDO5JBwS9/HTGXCFaTJXtYcrlpkxIukKb5AKoNqh90dCeSAnWus11ocsc2QGtVptSGiQCtD/O0ktBSR+MKwtXqMMtM6nkWVZ/UXJgsakgh/cBiZ8UmpLlSQT6CilntQ/xwi8qJKkAqvwB3bpgfmngIh3AAAAAElFTkSuQmCC",
        ["Sparkles"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAiElEQVR4nNWOywmAMBBEN2Ah2oEleVKwIEFPlmQHsRAhToSE/DYEzcV3Sdideaygj7CCc1Sq3QS7N7CBHwp0AU+WlDAaGLQwVQhhA9UFclQHNTR0izjkrHq6aO820dtASCRwSq7MBjRYrAhM+BZTLMhegMGKxwNBT4SMLbmyR2BAiL2Ao67gDTcfI2ARnPIWyAAAAABJRU5ErkJggg==",
        ["Beam"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAr0lEQVR4nN2RsQrCMBiE/6Mv1FcQdVNwUnHq5mMYH8NNF6mbu4qbc16o/J5RSwNtQunUflB6Fy6X8AfSAr2vFJOLt8czMXpawE1WkiTD6GypXYE+N6kUxZE6jRd8w4bhBa2DRVeWmk8p9LGci2LG9XqAE8b5S29rI9Ads3tMcyM/wLYD/0F4+pY5pXTQlzfvfgN+QRpmYDmDzM2APkg1TN3+Far8CyhLPBNjAAV1vAHg53YRAbP1dgAAAABJRU5ErkJggg==",
        ["Trail"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABBUlEQVR4nMWSMW7CQBBF/7DJLZIzBMrU5gKpQglVlCqEGiRED4KSCpdQwQHgDMBloAAz/DFgkLUWSC540sh/xzPPkm1BTvILdFFpQvWd2ccWr9LFXhtQ1Pm4vgSTf/YTROffQ159nJZ36ABaRYKEUh7XGGKyBYVDD4fCL9MfK8VVkimQ8uSH9xTOlRBFIYAP1i0DztTvC4AVnHwh0hmzSdaUVildckYeERhnCdpwrEin7BU587DAWLFXYm/JXGTZTLYgfonqPvmJRzzF2ALnlTHGztbwCwQbvEgPewQXiS1wXhl5kJoE49AafoGRkiSC8zIIG5UWf5Q3Zj8pye2yIaxcPF9wBDEPiBHqDicBAAAAAElFTkSuQmCC",
        ["Explosion"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABLklEQVR4nKWRzVHDMBCF3xoKcDqBCnCGcMY3zC1UYOhAVECowJwgnEjOmMF04E5wAUTLk8L4B5zgSb6Z1Upr6WmfLNiTQQKaX5RAcAfYG5k8H7FUM0zgLZlCNYPIlZzOH9BimIDrQGRGkeudOmjjuwmCUsaPJZddAc0vY/pMOY0AVIwCKvc4DCpYe86DS9aA1eqdnYw4awQ0TzKOx0BgZPK0YNvKcoPKLXdPGRmtuMcMWeWS/NxscCAxrKZQbgRCRoPK2HfyZWPmRceCviaFfyTYCICz0MeSt8bMHdYCbJcfhfmTy5DRR8U9I+YOtQDTv1DA72/jC2sLesLpNrZZ8I/4wulm+IhyNi/wCy/goI0ZU8r4C38hDxv0UAs4aCUCYGo7Kh8cDQ8X2IAw9uIb6lN1EW7ECqAAAAAASUVORK5CYII=",
        ["ForceField"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABY0lEQVR4nOWST07CQBTG31Qr8U+iV2Bhi3Fhb2C9Qb0BiaBbDmAiJm5N2BktC/Zu6gGM9QbdmMC44AqaqASQPr9XsAzCxrj0l0wn8817P2jzFP2ROYHXrW31+m/7rFSAS58AE8WKOVotbDwmxcYLohzUjHE6lTNsAVYRYUyMpsJyhDNx/zNApc9jYRcr0m7zHDviCRCwZdFBe7sZk4Grq6eUklZMSXsn1KXnip+m9ABB1ps9BBF8hybIr7HloOYEWV6bPQQzNEH+jwTVxFZUfnLCBMccFOcCC/1LSt0PmVraDT1EpqBSx3EPF4dkgDwTKFY9DNeF4vQWx7tOqdnAPhUI8i8wNjIkdZogAmm2l+3LwWhwhJYAP+LhKmNGIGP8MXiPLUWNthO2CIjAVupqhOuUqba2su6b4zwjEHZ11Rsyx3jjsnZvIgJO5zggSlsQ+T+/0ZxAmEpoE0t4XdQsLBT8hi9HTr8R7ZfSuQAAAABJRU5ErkJggg==",
        ["Terrain"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABXklEQVR4nM2QMUgCURjHv++pJ5jQ0BY5FadSg9BUq3PQ1GpQKrREzYEKzUlLkBbY6iTU2ppT4FCoR01GW0uI4Hn3vr4e3EWeR4hLPzje///uvh/vHcKM+Ar0bj4tQKY5Aki46ySrD5w8TBQk2tlNKSjD0UVIvJkk8QjWXg5ipm2ecPSgBbTTp5WLHkeXX4L191yk36djIopx9YCIvWgUzx4XKwOuCleghj8hQyhTXH3hqzTn5rHuSJRg1cimbIIdCbTA9U8E4EcAof6sV1tKEDdyZSIZ4agQiM2gCN079/3+L5YcpSXRBlcFohh09cqREujd/UteAAneQkGtZpG5LCUeAtA2bzPYEILOg6i9jixzlxCWeBOM+FVeCRLtvS1CMjCsDaVpl38Gx8Ga0AIlGpphJNQ7yetbJeATFPhlyn9wHGzwty0+QckREC9TwwL8P4IiABT4mYYSC4pKMAtffsWMEZQL1DkAAAAASUVORK5CYII=",
        ["Camera"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2UlEQVR4nLWSwQ2CQBBF/yZwNh7gbAmWoJWIHWgFrhVYgpagHdiBdqCe4eIZEnzEgIJAIMSX/Mzshn07EIwG8h9BFEVBmqZ72gLWB9/3l7QlDClRdziH/R+JIQrD0ErakD5sPc+zuSCl9AaBaRI8iXUc50hVkiSBaiZsE6zJlXfeU2WMWVKmZEcKGgXcPI7j+MLBiQDR3XXdOZPcWBa0Cnj4LmlEMh7szdi70Rc0CmBLzpIOehNImqnyHdoE2dgrxj7RipsXFKsKrYIufAusKuN14PMjDWGw4AXbLGwRO7s0uQAAAABJRU5ErkJggg==",
        ["Decal"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA6ElEQVR4nL2TPQrCQBCFZxe0EC08gk1i6xHsvYMR9BzGG9j6A+oNvIWllppTaK1kfTOwS9YkQgj6wTKzw7xvixBFNRFBcJvGRDTHqcIiCbexFRiUykCg/idoKDVAoacxZxThZ4IDDjPG+UpOoJWaXIPNnkA/mUWpMTu0pXiCbNjCc5QH1FESro/oczgB29B68FxrGtLLdFKtRhg58OCJH5QQL5YJeI66wtVhwwQkhAVZROth56hOkA0zEsKCLKL1sHNUEXyGGQlhwbSa7e6lt7zj6uC5FRSFGSuIqeRnYgF/0qIwI4I6vAFfUYMR5YtinAAAAABJRU5ErkJggg==",
        ["Texture"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA5klEQVR4nKWTMRLBYBSE80aldCSDjhalm+AYOiVnQO06bvDbb0XyTyYhM/ma9+/u29dkEsVAfCDdtoci0l7P/qQ4xuJy+By4b1IxGk9ien5JfnRJzK/egdwHMocECD0NWsN0+UDmkAChp0FrmC4fyBy2BRomz5o+2gZCo4JAw+RZ00fbQGhUEGiYPGv6aBtfoadBa5jcb8MhhXwRrWHw02O90ndfStZEPGN2ObtEgUU9DVrD4Euf9Kwpy4VwSQtVAShpVCivD2Rl8KIW+h1olMGLWvh/oKUMXvz1M3EsPba7tjL4wBDeR1iXEX/IvD4AAAAASUVORK5CYII=",
        ["SpawnLocation"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABNklEQVR4nJWQy03DQBBAZ2PfCR1QgqkALHIkUujA6SAdhA6ghHSApXBM5FABpgJKwNxtljdO1trNR3GeZO3s7MzTeIz0YFLYpPmTZPlgFrLHgeBxZe37yHR5ba4byUnMliOTkwogH+ILds0Fl+mxZoW3EBXEkdwSijZzDCl6ukjA0Qud1IzXNhNwCzon0Ony1JSELUb/s2lkQ9dcrHwxU0FeiD/iWDKBupYF+TvCQwFfu6yd5IprC4XXFFaE+n7DPr4JlYq3lLeSeCtQKAokFPmCIYIfQkcn6QQKhQmFn4TKhqIpZ4X4BXEmipXUDCRhU3PeU0OqY09wFN08h7jlt5dzm/dxAkdw8Rmv7ATrGwW/UST3Ajpdf8HazvjfZ23WZZFqJ+0loDmj+dVvVi4SRAMp/eZT/APpPp644e3u/AAAAABJRU5ErkJggg==",
        ["Seat"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAq0lEQVR4nM2SwRGDIBREgQrSQipQS0kTni3Fs02kFEkFaSEVSN7/GRgmiDngIW/mz66w7OiINY2cWxDGcUV65ghvl2VAle+CgPyEgnQuGeEvCjzSMUc8KOhRRQs4uCLGOHcz2/bE1XHuSuaOkzcZYkFAZMFGXyPPiC8Lpuli5/nFY0Hcy/NlwedzemYPvQNkUn6vQH2NPCP+tAKPdLKA180aWUZ/pxa00FzwBmQubhHGvdluAAAAAElFTkSuQmCC",
        ["VehicleSeat"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABP0lEQVR4nKWSwVHCQBiFXxhOXKQE7QAqkBKgA7ww3AwVGCpIvDFcpANTQlKBdKAlhEtODPH7k2wkhnFU3szjLf/u/+0mG09XqgMofH+oPH9kOMUjbNrjWIPBsxdFGeNGLUCxXM51OoUMh/iSMvV6K2+z2alWA6ibXxiaUhyxYyJTnk8k+fgeC8iDg3jYHfud4RCvvO02IjsqFotA0hPOgN/Z41SAr4mU5ol+EGsTVSdZszZwgDdihP+iPYCxAxREV/3+mF/peLQNOgLgtQBWIOy/T4TfAM27Yb5Z7xoSVc81oxiTVvOJEJtW1CPS6lPiFafUJg4QqHqJMcUZWYp6QZQ7EaWoWbNB1tSDcqK+xg9JN+d3zOIW4OxbOXCNt801mlhsVKP/RjOgMakGYKohO9lJLuuA567Z1AL8R1cDPgEW2YsR0KmlXwAAAABJRU5ErkJggg==",
        ["Tool"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/klEQVR4nKWRzW3CQBBGZ5IGKIES3AGK4nvIKc4pUEHoJEkF5BbnRu6OEiqAEqACRAEwvDGwMmLN75PGM17t97T2qlzJUYH9ZU1Z2BtjwvZ/TfMuc0CpWjbhEWODYrd29T7/lAqHBcXTgPZAsXM/7BwTzGgNSjT9DnvtN+uIScs/JyzGQGC0kq1gHbY+K1MEzXKxDgQjWkLF+EHajgqseH4RWbYZvWLM5VYTvcsnewIrsj7PjlQxHYpay4/Ny5hwz8MCSgWiYZEPjtqjRwmCmjDcPGr6NWCIUgr4We+0V2qXmruvshUYbZcTws5aEO52w4lhpxQ4QXJG2AmCS1kB0h5jEVMMC90AAAAASUVORK5CYII=",
        ["WeldConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2ElEQVR4nMWQ0Q2CMBCGr+IAbqAjsILRR0gYASaxGxgnUDcg0TcxOAIjOIIDaM7/SiDWCLXhgS9per3k/66tooF4CaKC+bxWVsY6uBhf8ItegUzEvCyYUPV8UYnWTG4gfdSGXoGQlBwinE8DSvKlqtCy6BQguCBM/AzLZLkB+i3WoUHCCN4INGGU5klOQXzlLTbCu4+QyPQQggdabkFc8B6/k1LNDmHdhLtoBV9hwpzstFIHcmAE0YU1qg1Kw79hoRYUfCeiOZZXWDACfFzKTBph7RMWjGAIbxMaXhehup+iAAAAAElFTkSuQmCC",
        ["Motor6D"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABw0lEQVR4nKWSwVHjQBBFf7t84rJsBCtFgIhgTQTrzUC+sAsXTAbKAJ0o4AJEgIkAZYCJQKIIALi4iipKw+uxJeziyK8a9fT87j/drTF9E18E6mnYHix0FKQxbpZc2JeYdWyQ9f+QW6sTkm8h/mAn6YXNoCKa/cDREmyu4XLilvBktSo11EjvSiRNCRhpDZ0An0dtKUtLezH8WLYtVIeh9tJTm9f/QklUg0AJ3cMFSH4g6VfYUvopsB8KSQkJuQB+pYGK9MwqrYHzK26eakGl6BFfRAGU78NAx10C/rPf4FXhvsBNOs5BuyOfFQPe7QQCCT+9JNzoQ5pbXEeDn2IjVi0/c7b8RR64uuVKwH0n3eIyDr1S7jbbCCrIqeDSY6IAvc0xCd49BzPSSic56/F0EH63rTLExvC7HPkMshiEQCEERDJr7MukH9gIkh4xjUxznErwLBcojE3sick2/gbib/RpS3MCSuwG6sOQ8U4q/kbiM4sCjlVfJ/4WCPB2jpJz24Pq4cn2rjsqmiA+40jG6uEi/hoHppsQ6JVAbqqGb9qh/7wN+ktY3iU7NgQcq3ambMeQO1ja1gNmhljpZbPvQcz38AGK594RWjEMugAAAABJRU5ErkJggg==",
        ["HingeConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABDklEQVR4nM2SO04DMRRF7/OEgmLEFqAgnpYdIGooWAG/RNS0VLADWjQjPi0NTRbADhAVYygQDR3VQJok83IzkRJlPlGipMiRLF/bV6ewLViQSkHw2djVVO4ZIUZP4u3oBSVUCqxrftUEh4zoKp6dDbcYCwgHgvezg9TIPmPGh43O666hayI7XKKj+sopzzV7V5mA5VtOI3iQCRinwp6sqMD3zUWSpD+MGxwQxbcLok32JqSVApNqCzVJtIcHEPFwPHhG9mYTDPGeAH3zfbT//3Qvroct9uYRTMJy4V64tyRB/iOVwXJeMP5IZdi4eaOi64wwkN/YhpeMBaYITq2Id8QI1d6jC+4cY4FKwaz0AVsnihEDD7OGAAAAAElFTkSuQmCC",
        ["BallSocketConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABz0lEQVR4nKWSu0scURTGz5mdnQQT4qYNEVKEnU0iOCFVbK1FxT9AC9dFK7FWEKwsRG0UH4i22qwIWilWayVaCDqDoqJY6grrKuPMHL87i+NjF0H8weHO/c45333MZXonbzJI2h1zRNSGCHHMGWaMZSTtTANz8F9EalCUgRRiHfUkiu71BpHUEUDuucG/886qQkF6ReiCxV+zU7M25Ig/TtryAskKc16ZlBmYTrqPfVqnj7HzwPVHkLSEJIGTZlkki5IxXePmePzTcdEtjMKgHTUlfmPbHgWmZsRWAtfbhpRAvEBrccypLD4iIgO1OgX+IrE2JERNkCoxr1alJ0QGuOFJJDMYLzFNICqRR81XjBGVDPKYViPKYKETOzXzAzVhLaRHA3O/o58oWHjtCChe0pkH8CcaYTQISWklUnvpevyeOv6greISdyBVI55ypRm6RbdeK9o2939N56A9GijULoRjOc3gQ3G9URKyIKuqHTb0HrrzayWQvw+rKyKD2oPuGs+/68Lru8FZi0gtYxUHKbW7JB5OozBVff6iDW99m0K+RGjw0KzH4hO7P8dP0YDjSAMaviOtLu+MhddgmMP0GaGB2npcN+ZUM6ZvIjR4D/dqX8QRaalvAgAAAABJRU5ErkJggg==",
        ["RopeConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHElEQVR4nKWRQU7DMBBFZ6LCmiOUTRyJBXCDcgO4QZASiR3lBJgTUHaIdAEnAE5QbgAskBKzKEdgi6gy/XabKnW7cfskazKO53lGZtqSYEFcZZqIrrFujBrqTQSC4ICAgwXK5AMRucTnZh3MBb+2mECwACO87zCff8XFB9IwQTK+6Mrf5K1Khl2aEyTA7ZqZ96q46CN1BAlUlY87TGdN+xYnsGZqvS2tITF5KrWkaL9HLRqBIDggcHs+qsxGwtGdUQ8vSBe4wxBomnXwBEFKHijuI5z6t1ucwHJg8qN/kRGe6KQ9Y7Mf7XaOy/37H/JYCCx2zlrkloXsrK/Jd9ara3qOmK/KuHikNSwJLLMiHhDJIX5/Yml/7jYrglCmcAp2ERVFCgYAAAAASUVORK5CYII=",
        ["RodConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAoUlEQVR4nKWSvQ3CMBBGv0PsQRcKGkZhCJgDMwcMwSg0FEmXPaJcvjspRZQ/X/Iky7Ll9+TiBDsJB4ryngA8uV7V+ZO2BJSbw4CEApfqcW1a/argxGPsB718PMjtX7x/vHKyAnOysRpYko3FwJpszAZyZGMykCsbo0BENgaBqGx4gNOVwPEURR2RjT6g3BxOl9/l4o8ZSOAPuHw8EcADe+gAtbBiEZ+XgkUAAAAASUVORK5CYII=",
        ["SpringConstraint"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABCklEQVR4nKWSwa3CMBBEZ/mfOv4/JQcu0AklgASc6QBTAldAghLoBC4ckhPUAWSZNXIECSEgRrJ2Y3mePY4FX+pjQJQMHIAJxzSNl64W0EqH7ZPqii2aIn32W7ZeBEgtgDtuGyIziB70gjUoFfyxvHeCKBnumNSl8Xxjp+EU9tFix+JVCzDTOdPNb0O698agEsAMzLli6zObyeaqICVAMXMwRcmoC2QT5u5wWa4ngMfMtrP8oMeb+88U4zRetLksVwkQTGFn+z7p7fabgp7Nsc1VApjMdA/hVKUeAGZkgZmqMhflAbw4Bz5PURxZIS8yFyUcBlAWL/66zqvMRQWAA0/A4Z8nPpAHfKMrFSuSEVuznq8AAAAASUVORK5CYII=",
        ["Attachment"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA6UlEQVR4nKWQ3W3CQBCEZztJKkmi8EjSgnElUAIdYLcAj1hClEAHdLJ8e8I2Nhw/4pNON96bGfnO9CT/jRfridXIAcZ6yF/jK5dmmKvNxEpGHca6SYQ43cv1FWEB5pqCmS5gdk2E21ALxqtwwHxIJnwk/IlMhEemw+bXlsZ3RxyMwy0YK0rKgcf1w7xn2jhneTAfMXwI7Hwl9p5HBS2EUliA7nmhIF0HGbrn6QJTyQNWgnHBju1bd7gMB13B4HUzjMNBKphufYGaIxMMa5cKZMetcICXgsadLZEz5kgF/H5FQ/FqOEgF73ACwzJhV7RvBL8AAAAASUVORK5CYII=",
        ["ProximityPrompt"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA0klEQVR4nK2S0QnCMBCGr7SD6AbpCAUfHcIR3MQZ3MAHHwVxgmaUDqDU7w6uNmLbKH7Q+3+Suz8JtJAR20vfIoFviXjeFDUq7wE9kgUBNmvFWQqg+ViWssfKqSk6RNdefAqgYRhS7g+5InqDmSf0cqsq2YlIx+dDHUON9+Bt1orjm1Upa4YO2BWNta/ji7FHxIoz3pzxEas+INkBEas+IAlzARGrPiCTTAYgWSSN/wiIiAYEJIsk4BeGAE5vkdyTI7dM/0QC7P25EGCzVr4ddjTkCSzFchE406lRAAAAAElFTkSuQmCC",
        ["SelectionBox"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABIElEQVR4nMWSPVICQRSE+y2S6wHUK8gJRMVsLfcKRv6cwSrWyDI0soz0CChkYlEmpnIHL2COy6PfUDPsTy0EBHzJvH7T3cHOCtakUhB/aheKFKtQ3A1OJS0UnA31RYFWFOH7/VhuuKqQjPTgP0OP4/6gIxIKfHirgXaW4aHfkUuuC/gwPQnPn1AQf2gKQcKLdu9I/riqkA/TM46HqosCCh4rYbhlYY4uUygwwbGWssdrt/CCo4Pf47n8Dcoer93CC46OzRacf+nudIJbjgEr8x4rjwTTTHFl2oX8pYV1gmtp4untUH55FfAePuc2n3PE5GP/RF5DQaOJvbqwYR4+404+DBIKIuC+LmyYh8c4HzbmBfM/sctxKQxf5MOGK1iHGcecxRHd/WMFAAAAAElFTkSuQmCC",
        ["Highlight"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAwUlEQVR4nOWSvRLBQBRG76Wh41GUOgZ9OltSeYysR1CqpIxOLyalx6Gj4frWzkRWdmRnUjpF9mdyzmxxmRpSCchJxSSiqQ7hNc9S7QQkUzt8B9TujnicXHHlRfJFjx63C0/3XATKMj3vEV4xxLUXiCvJ5oLVBuSoNLFEIbIB4lcAB8j9ENkAsRowB6xbHGvBv/8dYD5Tq3Nw5gBiWOAj59hveJIm4QGPTKAImDkIGF9HNtiAncQY298wL8uy4R1owguga6UR7B/VygAAAABJRU5ErkJggg==",
        ["NegateOperation"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA2klEQVR4nM2Szw2CMByFf23YxosTOIMj4AXGEKeQcNENnMHEO+HiNIT6XgOl5U85cPFLmpby3kcDKNnJTGCy7IqpkG1uqqqKQGDy/CHGpCJSYWQYSzSSJKm0bQ2BcgKvTNYEjWh9lq57YX10Ahy7EBEePUZQxhBfYHiBZRTkaky2TNixJdwwmKIwPM1xb00wewcMT3Pc+0eBUl98zg9WPhnDfY5yYvdCActKvSE4YRyw42DY5YjWF1WWz1EQKZNA0JcFjAKt7ygulokTeGUyCArZ/hODJw9YwR5+BzqMEfrFaDsAAAAASUVORK5CYII=",
        ["Player"] = "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAdElEQVR4nN2QwQ2AIAxFy0Q6hN7cSdyJmw6hE9XfAyaUkpD0YngJKRR40AZy0hRsJ0fs7pgSMR1pDZEM2oKLGeEjLcE8ayYFv8BbQi+VoHhZY/ykFqjaNboXxUIYQJDRIn0xYyaFXwhuhAlDeCCYESuagl5eHwY7EfzhvZ4AAAAASUVORK5CYII=",
    }
    local function b64decode(data)
        local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        data = data:gsub("[^"..b.."=]", "")
        local result = {}
        local i = 1
        while i <= #data do
            local c1 = b:find(data:sub(i,i), 1, true) - 1
            local c2 = b:find(data:sub(i+1,i+1), 1, true) - 1
            local c3 = data:sub(i+2,i+2) == "=" and 0 or (b:find(data:sub(i+2,i+2), 1, true) - 1)
            local c4 = data:sub(i+3,i+3) == "=" and 0 or (b:find(data:sub(i+3,i+3), 1, true) - 1)
            local n = c1*262144 + c2*4096 + c3*64 + c4
            result[#result+1] = string.char(math.floor(n/65536))
            if data:sub(i+2,i+2) ~= "=" then
                result[#result+1] = string.char(math.floor((n%65536)/256))
            end
            if data:sub(i+3,i+3) ~= "=" then
                result[#result+1] = string.char(n%256)
            end
            i = i + 4
        end
        return table.concat(result)
    end
    for cls, data in pairs(b64) do
        local filepath = ICON_DIR .. cls .. ".png"
        local ok, asset = pcall(function()
            if not pcall(readfile, filepath) then
                writefile(filepath, b64decode(data))
            end
            return getcustomasset(filepath)
        end)
        if ok and asset then
            CLASS_ICONS[cls] = asset
        end
    end
end
buildIconTable()
local QUICK_NAV_SERVICES = {
    "Workspace","Players","Lighting","ReplicatedFirst",
    "ReplicatedStorage","StarterGui","StarterPack",
    "StarterPlayer","Teams","SoundService",
}
local SCRIPT_CLASSES = { Script=true, LocalScript=true, ModuleScript=true }
local treeRoot     = game
local expanded     = {}
local selected     = nil
local rows         = {}
local rowFrames    = {}
local scrollOffset = 0
local filterText   = ""
local ctxMenu      = nil
local refreshProps
local function hasChildren(inst)
    local ok, ch = pcall(inst.GetChildren, inst)
    return ok and #ch > 0
end
local function closeCtx()
    if ctxMenu then ctxMenu:Destroy(); ctxMenu = nil end
end
local function buildPath(inst)
    local parts = {}
    local cur = inst
    while cur and cur ~= game do
        local ok, name = pcall(function() return cur.Name end)
        table.insert(parts, 1, ok and name or "???")
        cur = cur.Parent
    end
    if #parts == 0 then return "game" end
    local svcName = parts[1]
    local root = ('game:GetService("%s")'):format(svcName)
    if #parts == 1 then return root end
    return root .. "." .. table.concat(parts, ".", 2)
end
local SCREENGUI_SCRIPT_CLASSES = { Script=true, LocalScript=true, ModuleScript=true }
local function serializeVal(v)
    local t = typeof(v)
    if t == "string"  then return string.format("%q", v)
    elseif t == "number" then
        if v == math.floor(v) then return tostring(math.floor(v)) end
        return tostring(v)
    elseif t == "boolean" then return tostring(v)
    elseif t == "nil"     then return "nil"
    elseif t == "Vector3" then return ("Vector3.new(%s,%s,%s)"):format(v.X,v.Y,v.Z)
    elseif t == "Vector2" then return ("Vector2.new(%s,%s)"):format(v.X,v.Y)
    elseif t == "UDim2"   then return ("UDim2.new(%s,%s,%s,%s)"):format(v.X.Scale,v.X.Offset,v.Y.Scale,v.Y.Offset)
    elseif t == "UDim"    then return ("UDim.new(%s,%s)"):format(v.Scale,v.Offset)
    elseif t == "CFrame"  then local c={v:GetComponents()}; return "CFrame.new("..table.concat(c,",")..")"
    elseif t == "Color3"  then return ("Color3.fromRGB(%d,%d,%d)"):format(math.floor(v.R*255),math.floor(v.G*255),math.floor(v.B*255))
    elseif t == "BrickColor" then return ("BrickColor.new(%q)"):format(v.Name)
    elseif t == "EnumItem"   then return tostring(v)
    elseif t == "Rect" then return ("Rect.new(%s,%s,%s,%s)"):format(v.Min.X,v.Min.Y,v.Max.X,v.Max.Y)
    elseif t == "FontFace" then return ("Font.new(%q,Enum.FontWeight.%s,Enum.FontStyle.%s)"):format(v.Family,v.Weight.Name,v.Style.Name)
    elseif t == "NumberRange" then return ("NumberRange.new(%s,%s)"):format(v.Min,v.Max)
    elseif t == "NumberSequence" then
        local kps={}
        for _,kp in ipairs(v.Keypoints) do
            kps[#kps+1]=("NumberSequenceKeypoint.new(%s,%s,%s)"):format(kp.Time,kp.Value,kp.Envelope)
        end
        return "NumberSequence.new({"..table.concat(kps,",").."})";
    elseif t == "ColorSequence" then
        local kps={}
        for _,kp in ipairs(v.Keypoints) do
            kps[#kps+1]=("ColorSequenceKeypoint.new(%s,Color3.fromRGB(%d,%d,%d))"):format(
                kp.Time,math.floor(kp.Value.R*255),math.floor(kp.Value.G*255),math.floor(kp.Value.B*255))
        end
        return "ColorSequence.new({"..table.concat(kps,",").."})";
    end
    return "nil"
end
local GUI_COMMON = {
    "Name","Size","Position","AnchorPoint","Visible","ZIndex","LayoutOrder",
    "BackgroundColor3","BackgroundTransparency","BorderColor3","BorderSizePixel",
    "ClipsDescendants","Active","Selectable","Rotation","AutomaticSize",
}
local function guiMerge(t,extra)
    local r={}; for _,v in ipairs(t) do r[#r+1]=v end
    for _,v in ipairs(extra or {}) do r[#r+1]=v end; return r
end
local GUI_PROP_MAP = {
    ScreenGui={"Name","Enabled","ResetOnSpawn","DisplayOrder","IgnoreGuiInset","ZIndexBehavior","ScreenInsets"},
    TextLabel=guiMerge(GUI_COMMON,{"Text","RichText","TextSize","Font","FontFace","TextColor3","TextTransparency","TextWrapped","TextScaled","TextXAlignment","TextYAlignment","TextTruncate","TextStrokeColor3","TextStrokeTransparency","LineHeight","MaxVisibleGraphemes","AutoLocalize"}),
    TextButton=guiMerge(GUI_COMMON,{"Text","RichText","TextSize","Font","FontFace","TextColor3","TextTransparency","TextWrapped","TextScaled","TextXAlignment","TextYAlignment","TextTruncate","TextStrokeColor3","TextStrokeTransparency","LineHeight","AutoButtonColor","Modal","Style"}),
    TextBox=guiMerge(GUI_COMMON,{"Text","RichText","TextSize","Font","FontFace","TextColor3","TextTransparency","TextWrapped","TextScaled","TextXAlignment","TextYAlignment","PlaceholderText","PlaceholderColor3","ClearTextOnFocus","MultiLine","TextEditable"}),
    Frame=guiMerge(GUI_COMMON,{"Style"}),
    ScrollingFrame=guiMerge(GUI_COMMON,{"CanvasSize","CanvasPosition","ScrollBarThickness","ScrollBarImageColor3","ScrollBarImageTransparency","ScrollingDirection","ScrollingEnabled","VerticalScrollBarInset","HorizontalScrollBarInset","BottomImage","MidImage","TopImage"}),
    ImageLabel=guiMerge(GUI_COMMON,{"Image","ImageColor3","ImageTransparency","ImageRectOffset","ImageRectSize","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"}),
    ImageButton=guiMerge(GUI_COMMON,{"Image","ImageColor3","ImageTransparency","ImageRectOffset","ImageRectSize","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize","HoverImage","PressedImage","Style","AutoButtonColor","Modal"}),
    VideoFrame=guiMerge(GUI_COMMON,{"Video","Looped","Playing","TimePosition","Volume"}),
    ViewportFrame=guiMerge(GUI_COMMON,{"Ambient","LightColor","LightDirection"}),
    UICorner={"CornerRadius"},
    UIStroke={"Color","Thickness","Transparency","LineJoinMode","ApplyStrokeMode","Enabled"},
    UIGradient={"Color","Offset","Rotation","Transparency","Enabled"},
    UIPadding={"PaddingLeft","PaddingRight","PaddingTop","PaddingBottom"},
    UIListLayout={"Padding","FillDirection","HorizontalAlignment","VerticalAlignment","SortOrder","HorizontalFlex","VerticalFlex","ItemLineAlignment","Wraps"},
    UIGridLayout={"CellPadding","CellSize","FillDirectionMaxCells","FillDirection","HorizontalAlignment","VerticalAlignment","SortOrder","StartCorner"},
    UITableLayout={"FillEmptySpaceColumns","FillEmptySpaceRows","FillDirection","HorizontalAlignment","VerticalAlignment","MajorAxis","Padding","SortOrder"},
    UIAspectRatioConstraint={"AspectRatio","AspectType","DominantAxis"},
    UISizeConstraint={"MinSize","MaxSize"},
    UITextSizeConstraint={"MinTextSize","MaxTextSize"},
    UIScale={"Scale"},
    UIFlexItem={"FlexMode","GrowRatio","ShrinkRatio"},
    UIPageLayout={"Animated","CircularEnabled","EasingDirection","EasingStyle","GamepadInputEnabled","Padding","ScrollWheelInputEnabled","SortOrder","TouchInputEnabled","TweenTime","FillDirection","HorizontalAlignment","VerticalAlignment"},
}
local GUI_SKIP_DEFAULTS = {
    Visible=true, BackgroundTransparency=0, TextTransparency=0, ImageTransparency=0,
    TextStrokeTransparency=1, BorderSizePixel=1, ZIndex=1, LayoutOrder=0, Rotation=0,
    AutomaticSize=Enum.AutomaticSize.None, AnchorPoint=Vector2.new(0,0),
    ClipsDescendants=false, Active=false, Selectable=false, RichText=true,
    TextWrapped=true, TextScaled=false, TextXAlignment=Enum.TextXAlignment.Center,
    TextYAlignment=Enum.TextYAlignment.Center, AutoButtonColor=true,
    Enabled=true, ResetOnSpawn=true, DisplayOrder=0, IgnoreGuiInset=false,
}
local function guiShouldSkip(propName, val)
    local def = GUI_SKIP_DEFAULTS[propName]
    if def == nil then return false end
    if typeof(def) ~= typeof(val) then return false end
    if typeof(val) == "Vector2" then return val.X==def.X and val.Y==def.Y end
    return val == def
end
local function getGuiProps(obj)
    return GUI_PROP_MAP[obj.ClassName] or guiMerge(GUI_COMMON,{})
end
local function convertGuiToScript(gui)
    local extractedScripts = {}
    local instanceToVar    = {}
    local flatCounter      = {n=0}
    local function newVar(base)
        flatCounter.n += 1
        local safe = (base or "obj"):gsub("[^%w_]","_"):gsub("^(%d)","_%1")
        return safe.."_"..flatCounter.n
    end
    local codeLines = {}
    local function emit(s) codeLines[#codeLines+1] = s end
    local function extractScript(scriptObj, parentVar)
        local source = ""
        local zuk = getgenv()._ZUK_DECOMPILE
        local okBC, bytecode = pcall(getscriptbytecode, scriptObj)
        if zuk and okBC and bytecode and bytecode ~= "" then
            local opts = {
                DecompilerMode="disasm", DecompilerTimeout=15, CleanMode=true,
                ReaderFloatPrecision=7, ShowDebugInformation=false,
                ShowTrivialOperations=false, ShowInstructionLines=true,
                ShowOperationIndex=true, ShowOperationNames=true,
                ListUsedGlobals=true, UseTypeInfo=true,
                EnabledRemarks={ColdRemark=false,InlineRemark=true},
                ReturnElapsedTime=true,
            }
            local okD, result = pcall(zuk, bytecode, opts)
            if okD and result then
                local pp = getgenv()._ZUK_PRETTYPRINT
                source = pp and pp(result) or result
            end
        end
        if source == "" then
            local ok2, src = pcall(function() return scriptObj.Source end)
            if ok2 and src and src ~= "" then source = src end
        end
        if source == "" and getgenv().decompile then
            local ok3, res = pcall(getgenv().decompile, scriptObj)
            if ok3 and res then source = res end
        end
        if source == "" then
            source = "-- [PROTECTED/EMPTY SCRIPT] Could not extract source\n"
        end
        local enabled = true
        pcall(function() enabled = not scriptObj.Disabled end)
        table.insert(extractedScripts, {
            parent=parentVar, className=scriptObj.ClassName,
            name=scriptObj.Name, source=source, enabled=enabled,
        })
    end
    local function generateGuiCode(obj, parentVar, indent)
        indent = indent or "\t"
        local cls = obj.ClassName
        if cls == "LocalScript" or cls == "Script" or cls == "ModuleScript" then
            extractScript(obj, parentVar); return
        end
        local varName = newVar(obj.Name)
        instanceToVar[obj] = varName
        emit(indent .. ("local %s = Instance.new(%q)"):format(varName, cls))
        emit(indent .. ("%s.Parent = %s"):format(varName, parentVar))
        local props = getGuiProps(obj)
        for _, propName in ipairs(props) do
            if propName == "Name" and obj.Name == cls then continue end
            local ok, val = pcall(function() return obj[propName] end)
            if ok and val ~= nil and not guiShouldSkip(propName, val) then
                local s = serializeVal(val)
                if s ~= "nil" then
                    emit(indent .. ("%s.%s = %s"):format(varName, propName, s))
                end
            end
        end
        for _, child in ipairs(obj:GetChildren()) do
            generateGuiCode(child, varName, indent)
        end
    end
    emit('local Players = game:GetService("Players")')
    emit("local player = Players.LocalPlayer")
    emit('local playerGui = player:WaitForChild("PlayerGui")')
    emit("")
    emit("-- GUI Structure")
    emit("local function createGui()")
    local sgVar = newVar(gui.Name)
    instanceToVar[gui] = sgVar
    emit(('\tlocal %s = Instance.new("ScreenGui")'):format(sgVar))
    local sgProps = getGuiProps(gui)
    for _, propName in ipairs(sgProps) do
        local ok, val = pcall(function() return gui[propName] end)
        if ok and val ~= nil and not guiShouldSkip(propName, val) then
            local s = serializeVal(val)
            if s ~= "nil" then emit(("\t%s.%s = %s"):format(sgVar, propName, s)) end
        end
    end
    for _, child in ipairs(gui:GetChildren()) do
        generateGuiCode(child, sgVar, "\t")
    end
    emit(("\t%s.Parent = playerGui"):format(sgVar))
    emit(("\treturn %s"):format(sgVar))
    emit("end")
    emit("")
    if #extractedScripts > 0 then
        emit(("-- Extracted Scripts (%d found)"):format(#extractedScripts))
        for i, sd in ipairs(extractedScripts) do
            emit(("-- Script %d: %s (%s)"):format(i, sd.name, sd.className))
            emit(("local function runScript_%d(script_obj)"):format(i))
            emit("\tlocal script = script_obj")
            for line in (sd.source.."\n"):gmatch("[^\n]*\n") do
                emit("\t"..line:gsub("\n$",""))
            end
            emit("end"); emit("")
        end
    end
    emit("-- Init")
    emit("local gui = createGui()")
    emit("")
    if #extractedScripts > 0 then
        for i, sd in ipairs(extractedScripts) do
            local parentRef
            if sd.parent == sgVar then
                parentRef = "gui"
            else
                parentRef = ("gui:FindFirstChild(%q, true)"):format(
                    sd.parent:match("^(.+)_%d+$") or sd.parent)
            end
            emit(("-- Run: %s"):format(sd.name))
            emit("task.spawn(function()")
            emit(("\tlocal parent = %s"):format(parentRef))
            emit("\tif parent then")
            emit(("\t\trunScript_%d(parent)"):format(i))
            emit("\telse")
            emit(("\t\twarn('[DeepGUI] Parent not found for script: %s')"):format(sd.name))
            emit("\tend"); emit("end)"); emit("")
        end
    end
    return table.concat(codeLines, "\n")
end
local function runDecompile(inst)
    local ok, bytecode = pcall(getscriptbytecode, inst)
    if not ok or not bytecode or bytecode == "" then
        return "-- Could not obtain bytecode for: " .. tostring(inst.Name)
            .. "\n-- (getscriptbytecode may be unsupported or the script is empty)"
    end
    local opts = {
        EnabledRemarks       = { ColdRemark=true, InlineRemark=true },
        DecompilerTimeout    = 10,
        DecompilerMode       = "lift",
        ReaderFloatPrecision = 7,
        ShowDebugInformation = false,
        ShowInstructionLines = true,
        ShowOperationIndex   = false,
        ShowOperationNames   = false,
        ShowTrivialOperations= true,
        UseTypeInfo          = true,
        ListUsedGlobals      = true,
        ReturnElapsedTime    = true,
        CleanMode            = true,
    }
    local ok2, raw = pcall(ZukDecompile, bytecode, opts)
    if not ok2 then return "-- Decompile error:\n-- " .. tostring(raw) end
    local ok3, cleaned = pcall(ZukClean,  raw);  if ok3 then raw = cleaned end
    local ok4, pretty  = pcall(ZukPretty, raw);  if ok4 then raw = pretty  end
    return raw
end
local function mk(cls, props, parent)
    local i = Instance.new(cls)
    for k,v in pairs(props) do i[k] = v end
    if parent then i.Parent = parent end
    return i
end
local sg = mk("ScreenGui", {
    Name="Zukv2_AllInOne", DisplayOrder=10,
    ZIndexBehavior=Enum.ZIndexBehavior.Global, ResetOnSpawn=false
})
local PANEL_W       = 260
local DECOMP_W      = 500
local COLLAPSED_W   = 260
local panelExpanded = false
local main = mk("Frame", {
    Name="Main",
    Size=UDim2.new(0, PANEL_W, 1, 0),
    Position=UDim2.new(1, -PANEL_W, 0, 0),
    BackgroundColor3=Color3.fromRGB(35,35,35), BorderSizePixel=0,
    ClipsDescendants=false,
}, sg)
mk("UIStroke",{Color=Color3.fromRGB(60,60,60),Thickness=1}, main)
local topBar = mk("Frame",{
    Name="TopBar", Size=UDim2.new(1,0,0,22),
    BackgroundColor3=Color3.fromRGB(42,42,42), BorderSizePixel=0
}, main)
mk("TextLabel",{
    Name="Title", Size=UDim2.new(1,-50,1,0), Position=UDim2.new(0,8,0,0),
    BackgroundTransparency=1, Text="zukv2",
    TextColor3=Color3.fromRGB(200,200,200), TextXAlignment=Enum.TextXAlignment.Left,
    Font=Enum.Font.SourceSansBold, TextSize=9
}, topBar)
local closeBtn = mk("TextButton",{
    Name="Close", Size=UDim2.new(0,22,0,18), Position=UDim2.new(1,-24,0,2),
    BackgroundColor3=Color3.fromRGB(180,50,50), BackgroundTransparency=0.3,
    Text="X", TextColor3=Color3.fromRGB(255,255,255), BorderSizePixel=0,
    Font=Enum.Font.SourceSansBold, TextSize=11
}, topBar)
local toggleBtn = mk("TextButton",{
    Name="ToggleBtn",
    Size=UDim2.new(0,18,0,48),
    Position=UDim2.new(0,-18,0.5,-24),
    BackgroundColor3=Color3.fromRGB(42,42,42),
    BackgroundTransparency=0,
    BorderSizePixel=0,
    Text="<",
    TextColor3=Color3.fromRGB(180,180,180),
    Font=Enum.Font.SourceSansBold, TextSize=9,
    ZIndex=20,
}, main)
mk("UICorner",{CornerRadius=UDim.new(0,4)}, toggleBtn)
mk("Frame",{
    Size=UDim2.new(0,1,1,0), Position=UDim2.new(0,-1,0,0),
    BackgroundColor3=Color3.fromRGB(20,20,20), BorderSizePixel=0, ZIndex=19
}, main)
local split = mk("Frame",{
    Name="Split", Size=UDim2.new(1,0,1,-22), Position=UDim2.new(0,0,0,22),
    BackgroundTransparency=1, ClipsDescendants=true,
}, main)
local leftCol = mk("Frame",{
    Name="LeftCol", Size=UDim2.new(1,0,1,0), BackgroundTransparency=1
}, split)
local treeSection = mk("Frame",{
    Name="TreeSection", Size=UDim2.new(1,0,0.55,0),
    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=0
}, leftCol)
local treeHeader = mk("Frame",{
    Name="TreeHeader", Size=UDim2.new(1,0,0,22),
    BackgroundColor3=Color3.fromRGB(42,42,42), BorderSizePixel=0
}, treeSection)
mk("TextLabel",{
    Size=UDim2.new(1,-8,1,0), Position=UDim2.new(0,8,0,0),
    BackgroundTransparency=1, Text="Explorer",
    TextColor3=Color3.fromRGB(200,200,200),
    TextXAlignment=Enum.TextXAlignment.Left,
    Font=Enum.Font.SourceSansBold, TextSize=9
}, treeHeader)
local treeToolbar = mk("Frame",{
    Size=UDim2.new(1,0,0,24), Position=UDim2.new(0,0,0,22),
    BackgroundColor3=Color3.fromRGB(40,40,40), BorderSizePixel=0
}, treeSection)
local searchFrame = mk("Frame",{
    Size=UDim2.new(1,-10,0,18), Position=UDim2.new(0,5,0,3),
    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=0
}, treeToolbar)
local searchInput = mk("TextBox",{
    Name="Input", Size=UDim2.new(1,-10,1,0), Position=UDim2.new(0,5,0,0),
    BackgroundTransparency=1, TextColor3=Color3.fromRGB(255,255,255),
    TextXAlignment=Enum.TextXAlignment.Left,
    PlaceholderText="Search workspace...", Text="", TextSize=9
}, searchFrame)
local treeActions = mk("Frame",{
    Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,0,46),
    BackgroundColor3=Color3.fromRGB(37,37,37), BorderSizePixel=0
}, treeSection)
local function mkActionBtn(label, xOff)
    local b = mk("TextButton",{
        Size=UDim2.new(0,22,0,18), Position=UDim2.fromOffset(xOff, 2),
        BackgroundColor3=Color3.fromRGB(50,50,50), BackgroundTransparency=0.4,
        BorderSizePixel=0,
        Text=label, TextColor3=Color3.fromRGB(210,210,210),
        Font=Enum.Font.SourceSansBold, TextSize=11,
    }, treeActions)
    b.MouseEnter:Connect(function() b.BackgroundTransparency=0; b.BackgroundColor3=Color3.fromRGB(0,100,200) end)
    b.MouseLeave:Connect(function() b.BackgroundTransparency=0.4; b.BackgroundColor3=Color3.fromRGB(50,50,50) end)
    return b
end
local refreshBtn2    = mkActionBtn("?",  4)
local expandAllBtn   = mkActionBtn("+",  28)
local collapseAllBtn = mkActionBtn("-",  52)
local instanceCountLabel = mk("TextLabel",{
    Size=UDim2.new(1,-80,1,0), Position=UDim2.fromOffset(78,0),
    BackgroundTransparency=1,
    Text="0 items",
    TextColor3=Color3.fromRGB(100,100,100),
    TextXAlignment=Enum.TextXAlignment.Right,
    Font=Enum.Font.SourceSans, TextSize=9,
}, treeActions)
local listFrame = mk("Frame",{
    Name="List", Size=UDim2.new(1,0,1,-68), Position=UDim2.new(0,0,0,68),
    BackgroundTransparency=1, ClipsDescendants=true
}, treeSection)
mk("Frame",{
    Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,0.55,0),
    BackgroundColor3=Color3.fromRGB(55,55,55), BorderSizePixel=0
}, leftCol)
local propsSection = mk("Frame",{
    Name="PropsSection", Size=UDim2.new(1,0,0.45,-1), Position=UDim2.new(0,0,0.55,1),
    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=0
}, leftCol)
local propsHeader = mk("Frame",{
    Name="PropsHeader", Size=UDim2.new(1,0,0,22),
    BackgroundColor3=Color3.fromRGB(42,42,42), BorderSizePixel=0
}, propsSection)
mk("TextLabel",{
    Size=UDim2.new(1,-8,1,0), Position=UDim2.new(0,8,0,0),
    BackgroundTransparency=1, Text="Properties",
    TextColor3=Color3.fromRGB(200,200,200),
    TextXAlignment=Enum.TextXAlignment.Left,
    Font=Enum.Font.SourceSansBold, TextSize=9
}, propsHeader)
local propsToolbar = mk("Frame",{
    Size=UDim2.new(1,0,0,24), Position=UDim2.new(0,0,0,22),
    BackgroundColor3=Color3.fromRGB(40,40,40), BorderSizePixel=0
}, propsSection)
local propsSearchFrame = mk("Frame",{
    Size=UDim2.new(1,-10,0,18), Position=UDim2.new(0,5,0,3),
    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=0
}, propsToolbar)
local propsSearchInput = mk("TextBox",{
    Name="PropsSearch", Size=UDim2.new(1,-10,1,0), Position=UDim2.new(0,5,0,0),
    BackgroundTransparency=1, TextColor3=Color3.fromRGB(255,255,255),
    TextXAlignment=Enum.TextXAlignment.Left,
    PlaceholderText="Search properties...", Text="", TextSize=9
}, propsSearchFrame)
local propsScroll = mk("ScrollingFrame",{
    Name="PropsScroll",
    Size=UDim2.new(1,0,1,-46), Position=UDim2.new(0,0,0,46),
    BackgroundTransparency=1, BorderSizePixel=0,
    ScrollBarThickness=3, ScrollBarImageColor3=Color3.fromRGB(70,70,70),
    CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ClipsDescendants=true
}, propsSection)
mk("UIListLayout",{
    SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0)
}, propsScroll)
local rightCol = mk("Frame",{
    Name="RightCol",
    Size=UDim2.new(0,DECOMP_W,1,0),
    Position=UDim2.new(1,0,0,0),
    BackgroundColor3=Color3.fromRGB(22,22,22), BorderSizePixel=0,
    Visible=false,
}, sg)
local splitDivider = mk("Frame",{
    Name="SplitDivider",
    Size=UDim2.new(0,1,1,0), Position=UDim2.fromOffset(0,0),
    BackgroundColor3=Color3.fromRGB(55,55,55), BorderSizePixel=0,
}, rightCol)
local decompHeader = mk("Frame",{
    Size=UDim2.new(1,0,0,26), BackgroundColor3=Color3.fromRGB(32,32,32),
    BorderSizePixel=0
}, rightCol)
local decompTitle = mk("TextLabel",{
    Name="DecompTitle",
    Size=UDim2.new(1,-310,1,0), Position=UDim2.new(0,8,0,0),
    BackgroundTransparency=1, Text="Path:",
    TextColor3=Color3.fromRGB(160,160,160),
    TextXAlignment=Enum.TextXAlignment.Left,
    Font=Enum.Font.SourceSansBold, TextSize=9
}, decompHeader)
local decompBtn = mk("TextButton",{
    Name="DecompBtn",
    Size=UDim2.new(0,60,0,20), Position=UDim2.new(1,-65,0,3),
    BackgroundColor3=Color3.fromRGB(50,50,50), BorderSizePixel=0,
    Text="View", TextColor3=Color3.fromRGB(255,255,255),
    Font=Enum.Font.SourceSansBold, TextSize=9
}, decompHeader)
local copyBtn = mk("TextButton",{
    Name="CopyBtn",
    Size=UDim2.new(0,50,0,20), Position=UDim2.new(1,-120,0,3),
    BackgroundColor3=Color3.fromRGB(50,50,50), BorderSizePixel=0,
    Text="Copy", TextColor3=Color3.fromRGB(210,210,210),
    Font=Enum.Font.SourceSansBold, TextSize=9
}, decompHeader)
local execBtn = mk("TextButton",{
    Name="ExecBtn",
    Size=UDim2.new(0,60,0,20), Position=UDim2.new(1,-185,0,3),
    BackgroundColor3=Color3.fromRGB(40,70,40), BorderSizePixel=0,
    Text="Execute", TextColor3=Color3.fromRGB(160,255,160),
    Font=Enum.Font.SourceSansBold, TextSize=9
}, decompHeader)
local convertBtn = mk("TextButton",{
    Name="ConvertBtn",
    Size=UDim2.new(0,70,0,20), Position=UDim2.new(1,-260,0,3),
    BackgroundColor3=Color3.fromRGB(50,40,70), BorderSizePixel=0,
    Text="Conv GUI", TextColor3=Color3.fromRGB(200,160,255),
    Font=Enum.Font.SourceSansBold, TextSize=9
}, decompHeader)
local tabBar = mk("Frame",{
    Name="TabBar", Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,0,26),
    BackgroundColor3=Color3.fromRGB(28,28,28), BorderSizePixel=0
}, rightCol)
local tabViewer = mk("TextButton",{
    Size=UDim2.new(0,70,1,0), Position=UDim2.new(0,0,0,0),
    BackgroundColor3=Color3.fromRGB(22,22,22), BorderSizePixel=0,
    Text="Viewer", TextColor3=Color3.fromRGB(220,220,220),
    Font=Enum.Font.SourceSansBold, TextSize=11
}, tabBar)
local tabEditor = mk("TextButton",{
    Size=UDim2.new(0,70,1,0), Position=UDim2.new(0,70,0,0),
    BackgroundColor3=Color3.fromRGB(35,35,35), BorderSizePixel=0,
    Text="Editor", TextColor3=Color3.fromRGB(140,140,140),
    Font=Enum.Font.SourceSansBold, TextSize=11
}, tabBar)
local tabUnderline = mk("Frame",{
    Size=UDim2.new(0,70,0,2), Position=UDim2.new(0,0,1,-2),
    BackgroundColor3=Color3.fromRGB(0,120,215), BorderSizePixel=0
}, tabBar)
local viewerPane = mk("Frame",{
    Name="ViewerPane", Size=UDim2.new(1,0,1,-48), Position=UDim2.new(0,0,0,48),
    BackgroundTransparency=1, ClipsDescendants=true, Visible=true
}, rightCol)
local codeScroll = mk("ScrollingFrame",{
    Name="CodeScroll", Size=UDim2.new(1,0,1,0),
    BackgroundColor3=Color3.fromRGB(22,22,22), BorderSizePixel=0,
    ScrollBarThickness=4, ScrollBarImageColor3=Color3.fromRGB(70,70,70),
    CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
    HorizontalScrollBarInset=Enum.ScrollBarInset.None,
}, viewerPane)
mk("UIPadding",{
    PaddingLeft=UDim.new(0,8), PaddingTop=UDim.new(0,5),
    PaddingRight=UDim.new(0,8), PaddingBottom=UDim.new(0,5)
}, codeScroll)
local codeListLayout = mk("UIListLayout",{
    SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0),
    FillDirection=Enum.FillDirection.Vertical,
}, codeScroll)
local codeLabel = mk("TextLabel",{
    Name="Code", Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
    BackgroundTransparency=1, TextColor3=Color3.fromRGB(204,204,204),
    TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top,
    Font=Enum.Font.Code, TextSize=9, RichText=true, TextWrapped=false,
    LayoutOrder=0,
    Text='<font color="#555555">-- zukv2 decompiler\n-- by @OverZuka</font>'
}, codeScroll)
local gutterW = 36
local editorPane = mk("Frame",{
    Name="EditorPane", Size=UDim2.new(1,0,1,-48), Position=UDim2.new(0,0,0,48),
    BackgroundColor3=Color3.fromRGB(20,20,20), BorderSizePixel=0,
    Visible=false, ClipsDescendants=true
}, rightCol)
local gutter = mk("Frame",{
    Name="Gutter", Size=UDim2.new(0,gutterW,1,0),
    BackgroundColor3=Color3.fromRGB(28,28,28), BorderSizePixel=0
}, editorPane)
local gutterScroll = mk("ScrollingFrame",{
    Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, BorderSizePixel=0,
    ScrollBarThickness=0, CanvasSize=UDim2.new(0,0,0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y, ScrollingEnabled=false
}, gutter)
mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0)}, gutterScroll)
local editorScroll = mk("ScrollingFrame",{
    Name="EditorScroll",
    Size=UDim2.new(1,-gutterW,1,0), Position=UDim2.new(0,gutterW,0,0),
    BackgroundTransparency=1, BorderSizePixel=0,
    ScrollBarThickness=4, ScrollBarImageColor3=Color3.fromRGB(70,70,70),
    CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
    ScrollingDirection=Enum.ScrollingDirection.Y
}, editorPane)
mk("UIPadding",{PaddingTop=UDim.new(0,5), PaddingBottom=UDim.new(0,5)}, editorScroll)
local editorBox = mk("TextBox",{
    Name="EditorBox",
    Size=UDim2.new(1,-8,0,0), Position=UDim2.new(0,8,0,0),
    AutomaticSize=Enum.AutomaticSize.Y,
    BackgroundTransparency=1,
    TextColor3=Color3.fromRGB(210,210,210),
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Top,
    Font=Enum.Font.Code, TextSize=9,
    TextWrapped=true, MultiLine=true,
    ClearTextOnFocus=false,
    Text="-- Write your script here\n",
    PlaceholderColor3=Color3.fromRGB(80,80,80)
}, editorScroll)
local resizeHandle = mk("Frame",{
    Name="ResizeHandle",
    Size=UDim2.new(1,0,0,5), Position=UDim2.new(0,0,1,-5),
    BackgroundColor3=Color3.fromRGB(55,55,55),
    BackgroundTransparency=0.6, BorderSizePixel=0, ZIndex=15
}, main)
sg.Parent = playerGui
local setPanelExpanded
local lastDecompResult = ""
local extraCodeLabels  = {}
local function setCodeText(raw)
    codeLabel.Text = ""
    for _, lbl in ipairs(extraCodeLabels) do lbl:Destroy() end
    table.clear(extraCodeLabels)
    local order = 1
    for line in (raw.."\n"):gmatch("[^\n]*\n") do
        local bare = line:gsub("\n$","")
        local lbl = Instance.new("TextLabel")
        lbl.Size                = UDim2.new(1,0,0,14)
        lbl.AutomaticSize       = Enum.AutomaticSize.Y
        lbl.BackgroundTransparency = 1
        lbl.TextColor3          = Color3.fromRGB(204,204,204)
        lbl.TextXAlignment      = Enum.TextXAlignment.Left
        lbl.TextYAlignment      = Enum.TextYAlignment.Top
        lbl.Font                = Enum.Font.Code
        lbl.TextSize            = 10
        lbl.RichText            = true
        lbl.TextWrapped         = true
        lbl.LayoutOrder         = order
        lbl.Text                = hlLine(bare)
        lbl.Parent              = codeScroll
        table.insert(extraCodeLabels, lbl)
        order += 1
    end
end
local function openCtxMenu(inst, screenPos)
    closeCtx()
    local isScript    = SCRIPT_CLASSES[inst.ClassName] == true
    local isScreenGui = inst.ClassName == "ScreenGui"
    local isService   = pcall(function() game:GetService(inst.ClassName) end)
        and inst.Parent == game
    local canDelete   = inst.Parent ~= nil and inst ~= game and not isService
    local canClone    = canDelete
    local hasBytecode = isScript
    local ITEMS = {}
    local function addItem(icon, label, col, fn)
        table.insert(ITEMS, {icon=icon, label=label, color=col, fn=fn})
    end
    local function addSep()
        table.insert(ITEMS, "sep")
    end
    addItem(" ", "Select",              Color3.fromRGB(210,210,210), function()
        selected = inst
        rows = buildRows(treeRoot, 0, {})
        renderRows(); refreshProps()
    end)
    addItem(" ", "Copy Path",           Color3.fromRGB(210,210,210), function()
        pcall(setclipboard, buildPath(inst))
    end)
    addItem(" ", "Copy Name",           Color3.fromRGB(210,210,210), function()
        pcall(setclipboard, inst.Name)
    end)
    addItem(" ", "Copy ClassName",      Color3.fromRGB(210,210,210), function()
        pcall(setclipboard, inst.ClassName)
    end)
    addSep()
    if hasBytecode then
        addItem(" ", "Decompile",        Color3.fromRGB(253,251,172), function()
            selected = inst
            decompTitle.Text = inst.ClassName.." › "..inst.Name.."  (decompiling…)"
            task.defer(function()
                local raw = runDecompile(inst)
                lastDecompResult = raw
                setCodeText(raw); setTab(false)
                decompTitle.Text = inst.ClassName.." › "..inst.Name
                setPanelExpanded(true)
            end)
        end)
        addItem(">", "Execute Script",   Color3.fromRGB(160,255,160), function()
            local ok2, bc = pcall(getscriptbytecode, inst)
            if ok2 and bc ~= "" then
                local fn2, err = loadstring(bc)
                if fn2 then task.spawn(fn2)
                else warn("[zukv2] exec: "..tostring(err)) end
            end
        end)
        addSep()
    end
    if isScreenGui then
        addItem("+", "Gui -> Script", Color3.fromRGB(200,160,255), function()
            task.defer(function()
                local output = convertGuiToScript(inst)
                lastDecompResult = output
                pcall(setclipboard, output)
                setCodeText(output)
                decompTitle.Text = "ScreenGui › "..inst.Name.."  [Converted]"
                setPanelExpanded(true)
            end)
        end)
        addSep()
    end
    addItem(">", "Expand Children",     Color3.fromRGB(180,210,255), function()
        local ok2, ch = pcall(inst.GetChildren, inst)
        if ok2 then for _, c in ipairs(ch) do expanded[c] = true end end
        expanded[inst] = true
        rows = buildRows(treeRoot, 0, {}); renderRows()
    end)
    addItem("<", "Collapse Children",   Color3.fromRGB(180,210,255), function()
        local ok2, ch = pcall(inst.GetChildren, inst)
        if ok2 then for _, c in ipairs(ch) do expanded[c] = false end end
        rows = buildRows(treeRoot, 0, {}); renderRows()
    end)
    addItem("+", "Jump to Parent",     Color3.fromRGB(180,210,255), function()
        if inst.Parent and inst.Parent ~= game then
            jumpToInstance(inst.Parent)
            refreshProps()
        end
    end)
    addSep()
    if canClone then
        addItem("+", "Clone",           Color3.fromRGB(210,210,210), function()
            local ok2, cl = pcall(function() return inst:Clone() end)
            if ok2 and cl then
                cl.Parent = inst.Parent
                rows = buildRows(treeRoot, 0, {}); renderRows()
            end
        end)
    end
    addItem("+", "Rename…",            Color3.fromRGB(210,210,210), function()
        local ok2, oldName = pcall(function() return inst.Name end)
        if not ok2 then return end
        local overlay = mk("Frame",{
            Size=UDim2.new(1,0,1,0), BackgroundTransparency=0.5,
            BackgroundColor3=Color3.fromRGB(0,0,0), ZIndex=100,
        }, sg)
        local box = mk("Frame",{
            Size=UDim2.new(0,280,0,60),
            Position=UDim2.new(0.5,-140,0.5,-30),
            BackgroundColor3=Color3.fromRGB(40,40,40), BorderSizePixel=0, ZIndex=101,
        }, overlay)
        mk("UICorner",{CornerRadius=UDim.new(0,6)}, box)
        mk("TextLabel",{
            Size=UDim2.new(1,-10,0,22), Position=UDim2.new(0,5,0,2),
            BackgroundTransparency=1, Text="Rename: "..oldName,
            TextColor3=Color3.fromRGB(170,170,170),
            TextXAlignment=Enum.TextXAlignment.Left,
            Font=Enum.Font.SourceSansBold, TextSize=11, ZIndex=102,
        }, box)
        local inp = mk("TextBox",{
            Size=UDim2.new(1,-10,0,24), Position=UDim2.new(0,5,0,28),
            BackgroundColor3=Color3.fromRGB(25,25,25), BorderSizePixel=1,
            Text=oldName, TextColor3=Color3.fromRGB(230,230,230),
            TextXAlignment=Enum.TextXAlignment.Left,
            Font=Enum.Font.Code, TextSize=9, ZIndex=102,
            ClearTextOnFocus=false,
        }, box)
        inp:CaptureFocus()
        inp.FocusLost:Connect(function(enter)
            if enter then
                local newName = inp.Text:match("^%s*(.-)%s*$")
                if newName ~= "" then pcall(function() inst.Name = newName end) end
            end
            overlay:Destroy()
            rows = buildRows(treeRoot, 0, {}); renderRows()
        end)
    end)
    if canDelete then
        addItem("X", "Delete",          Color3.fromRGB(255,100,100), function()
            pcall(function() inst:Destroy() end)
            if selected == inst then selected = nil end
            rows = buildRows(treeRoot, 0, {}); renderRows(); refreshProps()
        end)
    end
    local ITEM_H = 20
    local SEP_H  = 7
    local totalH = 0
    for _, item in ipairs(ITEMS) do
        totalH += (item == "sep") and SEP_H or ITEM_H
    end
    local cam      = workspace.CurrentCamera
    local screenH  = cam and cam.ViewportSize.Y or 800
    local screenW  = cam and cam.ViewportSize.X or 1280
    local menuY    = math.min(screenPos.Y, screenH - totalH - 6)
    local menuX    = math.min(screenPos.X, screenW - 186)
    local menu = mk("Frame", {
        Name="CtxMenu",
        Size=UDim2.new(0,182,0,totalH+2),
        Position=UDim2.fromOffset(menuX, menuY),
        BackgroundColor3=Color3.fromRGB(36,36,36),
        BorderSizePixel=0, ZIndex=60,
        ClipsDescendants=true,
    }, sg)
    mk("UICorner",{CornerRadius=UDim.new(0,5)}, menu)
    mk("UIStroke",{Color=Color3.fromRGB(65,65,65),Thickness=1}, menu)
    mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,
        Padding=UDim.new(0,0)}, menu)
    local ord = 0
    for _, item in ipairs(ITEMS) do
        ord += 1
        if item == "sep" then
            mk("Frame",{
                Size=UDim2.new(1,-16,0,1),
                BackgroundColor3=Color3.fromRGB(60,60,60),
                BackgroundTransparency=0, BorderSizePixel=0,
                LayoutOrder=ord,
            }, menu)
            local sep = menu:FindFirstChild(tostring(ord))
            local spacer = mk("Frame",{
                Size=UDim2.new(1,0,0,SEP_H),
                BackgroundTransparency=1, BorderSizePixel=0,
                LayoutOrder=ord,
            }, menu)
            mk("Frame",{
                Size=UDim2.new(1,-16,0,1),
                Position=UDim2.new(0,8,0.5,-1),
                BackgroundColor3=Color3.fromRGB(58,58,58),
                BorderSizePixel=0,
            }, spacer)
        else
            local btn = mk("TextButton",{
                Size=UDim2.new(1,0,0,ITEM_H),
                BackgroundColor3=Color3.fromRGB(36,36,36),
                BackgroundTransparency=1,
                BorderSizePixel=0,
                Text="",
                ZIndex=61, LayoutOrder=ord,
            }, menu)
            mk("TextLabel",{
                Size=UDim2.new(0,20,1,0), Position=UDim2.new(0,5,0,0),
                BackgroundTransparency=1,
                Text=item.icon,
                TextColor3=item.color,
                TextXAlignment=Enum.TextXAlignment.Center,
                Font=Enum.Font.SourceSans, TextSize=9, ZIndex=62,
            }, btn)
            mk("TextLabel",{
                Size=UDim2.new(1,-28,1,0), Position=UDim2.new(0,26,0,0),
                BackgroundTransparency=1,
                Text=item.label,
                TextColor3=item.color,
                TextXAlignment=Enum.TextXAlignment.Left,
                Font=Enum.Font.SourceSans, TextSize=9, ZIndex=62,
            }, btn)
            btn.MouseEnter:Connect(function()
                btn.BackgroundTransparency=0
                btn.BackgroundColor3=Color3.fromRGB(0,100,210)
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundTransparency=1
                btn.BackgroundColor3=Color3.fromRGB(36,36,36)
            end)
            local fn = item.fn
            btn.MouseButton1Click:Connect(function()
                closeCtx(); fn()
            end)
        end
    end
    ctxMenu = menu
end
local PINNED_SERVICES = {
    "Workspace", "ReplicatedStorage", "ReplicatedFirst", "StarterGui",
    "CoreGui", "StarterPlayer", "StarterPack", "Players",
    "ServerScriptService", "ServerStorage", "Lighting", "SoundService",
    "Teams", "Chat",
}
local function getOrderedChildren(inst)
    local ok, children = pcall(inst.GetChildren, inst)
    if not ok then return {} end
    if inst ~= game then return children end
    -- For game root: pinned services first, then everything else
    local pinned = {}
    local seen = {}
    for _, svcName in ipairs(PINNED_SERVICES) do
        local ok2, svc = pcall(function() return game:GetService(svcName) end)
        if ok2 and svc then
            table.insert(pinned, svc)
            seen[svc] = true
        end
    end
    for _, child in ipairs(children) do
        if not seen[child] then
            table.insert(pinned, child)
        end
    end
    return pinned
end
local function buildRows(inst, depth, result)
    depth = depth or 0; result = result or {}
    local ok, name = pcall(function() return inst.Name end)
    if not ok then name = "???" end
    if filterText == "" or name:lower():find(filterText:lower(), 1, true) then
        table.insert(result, {inst=inst, depth=depth})
    end
    if expanded[inst] then
        local ch = getOrderedChildren(inst)
        for _, c in ipairs(ch) do buildRows(c, depth+1, result) end
    end
    return result
end
local function renderRows()
    for _, f in ipairs(rowFrames) do f:Destroy() end
    table.clear(rowFrames)
    instanceCountLabel.Text = #rows .. " item" .. (#rows == 1 and "" or "s")
    local visH   = listFrame.AbsoluteSize.Y
    local startI = math.floor(scrollOffset / ROW_H) + 1
    local endI   = math.min(#rows, startI + math.ceil(visH / ROW_H) + 1)
    for i = startI, endI do
        local row = rows[i]; if not row then break end
        local inst      = row.inst
        local isSel     = inst == selected
        local isScript  = SCRIPT_CLASSES[inst.ClassName] == true
        local entry = mk("TextButton",{
            Size=UDim2.new(1,0,0,ROW_H),
            Position=UDim2.fromOffset(0, (i-1)*ROW_H - scrollOffset),
            BackgroundColor3=isSel and Color3.fromRGB(0,120,215) or Color3.fromRGB(35,35,35),
            BackgroundTransparency=isSel and 0 or 1,
            BorderSizePixel=0, Text=""
        }, listFrame)
        local indent = mk("Frame",{
            Size=UDim2.new(1,-(row.depth*INDENT_PER),1,0),
            Position=UDim2.fromOffset(row.depth*INDENT_PER+4,0),
            BackgroundTransparency=1
        }, entry)
        local iconData = CLASS_ICONS[inst.ClassName]
        local iconW = 0
        if iconData then
            iconW = 18
            local ico = Instance.new("ImageLabel")
            ico.Size                  = UDim2.fromOffset(ICON_SIZE, ICON_SIZE)
            ico.Position              = UDim2.fromOffset(1, math.floor((ROW_H - ICON_SIZE) / 2))
            ico.BackgroundTransparency= 1
            ico.ScaleType             = Enum.ScaleType.Fit
            ico.ZIndex                = 2
            if type(iconData) == "string" then
                ico.Image = iconData
            else
                ico.Image           = iconData.sheet
                ico.ImageRectOffset = Vector2.new(iconData.ox, iconData.oy)
                ico.ImageRectSize   = Vector2.new(16, 16)
            end
            ico.Parent = indent
        end
        mk("TextLabel",{
            Size=UDim2.new(1,-(iconW+2),1,0), Position=UDim2.fromOffset(iconW+2,0),
            BackgroundTransparency=1,
            Text=inst.Name,
            TextColor3=isScript and Color3.fromRGB(253,251,172) or Color3.fromRGB(220,220,220),
            TextXAlignment=Enum.TextXAlignment.Left, TextSize=9
        }, indent)
        entry.MouseButton1Click:Connect(function()
            closeCtx(); selected = inst
            if isScript then
                decompTitle.Text = inst.ClassName .. " › " .. inst.Name .. "   (press View)"
            else
                decompTitle.Text = inst.ClassName .. " › " .. inst.Name
            end
            renderRows()
            refreshProps()
        end)
        entry.MouseButton2Click:Connect(function()
            selected = inst; renderRows()
            refreshProps()
            openCtxMenu(inst, UserInputService:GetMouseLocation())
        end)
        if hasChildren(inst) then
            local exp = mk("TextButton",{
                Size=UDim2.fromOffset(16,ROW_H), Position=UDim2.fromOffset(-16,0),
                BackgroundTransparency=1,
                Text=expanded[inst] and "+" or "+",
                TextColor3=Color3.fromRGB(170,170,170), TextSize=8
            }, indent)
            exp.MouseButton1Click:Connect(function()
                expanded[inst] = not expanded[inst]
                rows = buildRows(treeRoot, 0, {})
                renderRows()
            end)
        end
        table.insert(rowFrames, entry)
    end
end
local function jumpToInstance(inst)
    expanded[game] = true; selected = inst
    rows = buildRows(treeRoot, 0, {})
    local targetI = 1
    for i, row in ipairs(rows) do if row.inst == inst then targetI = i; break end end
    local maxOff = math.max(0, (#rows*ROW_H) - listFrame.AbsoluteSize.Y)
    scrollOffset = math.clamp((targetI-1)*ROW_H, 0, maxOff)
    renderRows()
end
decompBtn.MouseButton1Click:Connect(function()
    if not selected then
        codeLabel.Text = '<font color="#ff6060">-- No instance selected.</font>'
        return
    end
    if not SCRIPT_CLASSES[selected.ClassName] then
        codeLabel.Text = '<font color="#ff9030">-- "'..tostring(selected.Name)..'" is a '
            ..tostring(selected.ClassName)..'.\n-- Pick a Script, LocalScript or ModuleScript.</font>'
        return
    end
    decompBtn.Text = "Working…"
    decompBtn.BackgroundColor3 = Color3.fromRGB(80,60,20)
    codeLabel.Text = '<font color="#555555">-- Decompiling '..selected.Name..'…</font>'
    task.defer(function()
        local raw = runDecompile(selected)
        lastDecompResult = raw
        setCodeText(raw)
        setTab(false)
        decompTitle.Text = selected.ClassName .. " › " .. selected.Name
        decompBtn.Text   = "View"
        decompBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
        setPanelExpanded(true)
    end)
end)
local copyResetPending = false
copyBtn.MouseButton1Click:Connect(function()
    local src = editorPane.Visible and editorBox.Text or lastDecompResult
    if src ~= "" then
        pcall(setclipboard, src)
        copyBtn.Text = "✓ Copied"
        if not copyResetPending then
            copyResetPending = true
            task.delay(1.5, function()
                copyBtn.Text = "Copy"
                copyResetPending = false
            end)
        end
    end
end)
execBtn.MouseButton1Click:Connect(function()
    local src = editorPane.Visible and editorBox.Text or lastDecompResult
    if src == "" then return end
    local fn, err = loadstring(src)
    if fn then
        task.spawn(fn)
        execBtn.Text = "✓ Ran"
        task.delay(1.5, function() execBtn.Text = "Execute" end)
    else
        execBtn.Text = "Error"
        warn("[zukv2] Exec error: " .. tostring(err))
        task.delay(2, function() execBtn.Text = "Execute" end)
    end
end)
local function setTab(toEditor)
    if toEditor then
        viewerPane.Visible  = false
        editorPane.Visible  = true
        tabViewer.BackgroundColor3 = Color3.fromRGB(35,35,35)
        tabViewer.TextColor3       = Color3.fromRGB(140,140,140)
        tabEditor.BackgroundColor3 = Color3.fromRGB(22,22,22)
        tabEditor.TextColor3       = Color3.fromRGB(220,220,220)
        tabUnderline.Position      = UDim2.new(0,70,1,-2)
        if editorBox.Text == "-- Write your script here\n" and lastDecompResult ~= "" then
            editorBox.Text = lastDecompResult
        end
    else
        viewerPane.Visible  = true
        editorPane.Visible  = false
        tabViewer.BackgroundColor3 = Color3.fromRGB(22,22,22)
        tabViewer.TextColor3       = Color3.fromRGB(220,220,220)
        tabEditor.BackgroundColor3 = Color3.fromRGB(35,35,35)
        tabEditor.TextColor3       = Color3.fromRGB(140,140,140)
        tabUnderline.Position      = UDim2.new(0,0,1,-2)
    end
end
tabViewer.MouseButton1Click:Connect(function() setTab(false) end)
tabEditor.MouseButton1Click:Connect(function() setTab(true) end)
setTab(false)
local gutterLabels = {}
local lastLineCount = 0
local LINE_H = 16
local function updateGutter()
    local text = editorBox.Text
    local lineCount = 1
    for _ in text:gmatch("\n") do lineCount += 1 end
    if lineCount == lastLineCount then return end
    lastLineCount = lineCount
    for i = lineCount + 1, #gutterLabels do
        gutterLabels[i]:Destroy(); gutterLabels[i] = nil
    end
    for i = #gutterLabels + 1, lineCount do
        local lbl = mk("TextLabel",{
            Size=UDim2.new(1,0,0,LINE_H),
            BackgroundTransparency=1,
            Text=tostring(i),
            TextColor3=Color3.fromRGB(90,90,90),
            TextXAlignment=Enum.TextXAlignment.Right,
            Font=Enum.Font.Code, TextSize=9,
            LayoutOrder=i,
        }, gutterScroll)
        gutterLabels[i] = lbl
    end
end
editorScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    gutterScroll.CanvasPosition = Vector2.new(0, editorScroll.CanvasPosition.Y)
end)
editorBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateGutter()
end)
updateGutter()
convertBtn.MouseButton1Click:Connect(function()
    if not selected then
        codeLabel.Text = '<font color="#ff6060">-- No instance selected.</font>'
        return
    end
    if selected.ClassName ~= "ScreenGui" then
        codeLabel.Text = '<font color="#ff9030">-- "'..tostring(selected.Name)..'" is not a ScreenGui.\n-- Select a ScreenGui to use Convert GUI.</font>'
        return
    end
    convertBtn.Text = "Working…"
    convertBtn.BackgroundColor3 = Color3.fromRGB(60,40,80)
    codeLabel.Text = '<font color="#555555">-- Converting '..selected.Name..'…</font>'
    task.defer(function()
        local output = convertGuiToScript(selected)
        lastDecompResult = output
        setCodeText(output)
        decompTitle.Text = "ScreenGui › " .. selected.Name .. "  [Converted]"
        convertBtn.Text = "Conv GUI"
        convertBtn.BackgroundColor3 = Color3.fromRGB(50,40,70)
        setPanelExpanded(true)
    end)
end)
local propRowFrames = {}
local propsFilterText = ""
local PROPS_ROW_H = 18
local SKIP_PROP_TYPES = { RBXScriptSignal=true, Instance=true }
local function serializeValShort(v)
    local t = typeof(v)
    if t == "string"     then return #v > 40 and ('"'..v:sub(1,37)..'..."') or string.format("%q",v)
    elseif t == "number" then return tostring(v)
    elseif t == "boolean"then return tostring(v)
    elseif t == "nil"    then return "nil"
    elseif t == "Vector3"then return ("%.3g, %.3g, %.3g"):format(v.X,v.Y,v.Z)
    elseif t == "Vector2"then return ("%.3g, %.3g"):format(v.X,v.Y)
    elseif t == "UDim2"  then return ("{%.3g,%.3g},{%.3g,%.3g}"):format(v.X.Scale,v.X.Offset,v.Y.Scale,v.Y.Offset)
    elseif t == "UDim"   then return ("%.3g, %.3g"):format(v.Scale,v.Offset)
    elseif t == "Color3" then return ("%d, %d, %d"):format(math.floor(v.R*255),math.floor(v.G*255),math.floor(v.B*255))
    elseif t == "EnumItem" then return tostring(v):match("%.(.+)$") or tostring(v)
    elseif t == "CFrame" then return "CFrame"
    elseif t == "BrickColor" then return v.Name
    elseif t == "Rect"   then return ("%.3g,%.3g,%.3g,%.3g"):format(v.Min.X,v.Min.Y,v.Max.X,v.Max.Y)
    elseif t == "NumberRange" then return ("%.3g .. %.3g"):format(v.Min,v.Max)
    elseif t == "FontFace" then return v.Family:match("[^/]+$") or "Font"
    else return t end
end
local function getTypeColor(v)
    local t = typeof(v)
    if t == "string"   then return Color3.fromRGB(173,241,149)
    elseif t == "number" then return Color3.fromRGB(255,198,0)
    elseif t == "boolean" then return Color3.fromRGB(255,198,0)
    elseif t == "Color3" then return v
    elseif t == "EnumItem" then return Color3.fromRGB(132,214,247)
    else return Color3.fromRGB(180,180,180) end
end
refreshProps = function()
    for _, f in ipairs(propRowFrames) do f:Destroy() end
    table.clear(propRowFrames)
    if not selected then return end
    local inst = selected
    local allPropNames = {}
    local seen = {}
    local function addProp(name)
        if not seen[name] then seen[name] = true; table.insert(allPropNames, name) end
    end
    if type(getgenv().getproperties) == "function" then
        local ok2, result = pcall(getgenv().getproperties, inst)
        if ok2 and type(result) == "table" then
            for _, p in ipairs(result) do
                if type(p) == "table" and p.Name then addProp(p.Name)
                elseif type(p) == "string" then addProp(p) end
            end
        end
    end
    if #allPropNames == 0 then
        local cls = inst.ClassName
        local base = {"Name","ClassName","Parent","Archivable"}
        for _, p in ipairs(base) do addProp(p) end
        local classProps = {
            GuiBase2d = {"AbsolutePosition","AbsoluteSize","AbsoluteRotation","AutoLocalize"},
            GuiObject = {"Active","AnchorPoint","AutomaticSize","BackgroundColor3",
                "BackgroundTransparency","BorderColor3","BorderSizePixel","ClipsDescendants",
                "LayoutOrder","Position","Rotation","Selectable","Size","SizeConstraint",
                "Visible","ZIndex"},
            TextLabel = {"Font","FontFace","LineHeight","MaxVisibleGraphemes","RichText","Text",
                "TextBounds","TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3",
                "TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped",
                "TextXAlignment","TextYAlignment","AutomaticSize"},
            TextButton = {"Font","FontFace","LineHeight","RichText","Text","TextBounds",
                "TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3",
                "TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped",
                "TextXAlignment","TextYAlignment","AutoButtonColor","Modal","Style"},
            TextBox = {"Font","FontFace","LineHeight","RichText","Text","TextBounds",
                "TextColor3","TextFits","TextScaled","TextSize","TextStrokeColor3",
                "TextStrokeTransparency","TextTransparency","TextTruncate","TextWrapped",
                "TextXAlignment","TextYAlignment","ClearTextOnFocus","MultiLine",
                "PlaceholderColor3","PlaceholderText","TextEditable"},
            Frame = {"Style"},
            ScrollingFrame = {"CanvasPosition","CanvasSize","ScrollBarImageColor3",
                "ScrollBarImageTransparency","ScrollBarThickness","ScrollingDirection",
                "ScrollingEnabled","VerticalScrollBarInset","HorizontalScrollBarInset",
                "BottomImage","MidImage","TopImage"},
            ImageLabel = {"Image","ImageColor3","ImageRectOffset","ImageRectSize",
                "ImageTransparency","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize"},
            ImageButton = {"Image","ImageColor3","ImageRectOffset","ImageRectSize",
                "ImageTransparency","ResampleMode","ScaleType","SliceCenter","SliceScale","TileSize",
                "HoverImage","PressedImage","AutoButtonColor","Modal","Style"},
            ScreenGui = {"DisplayOrder","Enabled","IgnoreGuiInset","ResetOnSpawn",
                "ScreenInsets","ZIndexBehavior"},
            UICorner = {"CornerRadius"},
            UIStroke = {"ApplyStrokeMode","Color","Enabled","LineJoinMode","Thickness","Transparency"},
            UIGradient = {"Color","Enabled","Offset","Rotation","Transparency"},
            UIPadding = {"PaddingBottom","PaddingLeft","PaddingRight","PaddingTop"},
            UIListLayout = {"FillDirection","HorizontalAlignment","HorizontalFlex",
                "ItemLineAlignment","Padding","SortOrder","VerticalAlignment","VerticalFlex","Wraps"},
            UIGridLayout = {"CellPadding","CellSize","FillDirection","FillDirectionMaxCells",
                "HorizontalAlignment","SortOrder","StartCorner","VerticalAlignment"},
            UIScale = {"Scale"},
            UIAspectRatioConstraint = {"AspectRatio","AspectType","DominantAxis"},
            UISizeConstraint = {"MaxSize","MinSize"},
            UITextSizeConstraint = {"MaxTextSize","MinTextSize"},
            BasePart = {"Anchored","CanCollide","CastShadow","CFrame","Color","Locked",
                "Material","Reflectance","Size","Transparency","BrickColor","Massless",
                "CollisionGroupId","RootPriority"},
            Part = {"Shape"},
            MeshPart = {"MeshId","TextureID"},
            Humanoid = {"DisplayName","Health","HipHeight","JumpHeight","JumpPower",
                "MaxHealth","MaxSlopeAngle","RootPart","WalkSpeed","AutoRotate",
                "BreakJointsOnDeath","DisplayDistanceType","HealthDisplayDistance",
                "NameDisplayDistance","NameOcclusion","RequiresNeck","RigType"},
            Script = {"Disabled","LinkedSource","RunContext","Source"},
            LocalScript = {"Disabled","LinkedSource","Source"},
            ModuleScript = {"LinkedSource","Source"},
            StringValue = {"Value"},
            IntValue = {"Value"},
            NumberValue = {"Value"},
            BoolValue = {"Value"},
            Vector3Value = {"Value"},
            Color3Value = {"Value"},
            ObjectValue = {"Value"},
            Sound = {"Looped","MaxDistance","Pitch","PlayOnRemove","Playing",
                "RollOffMaxDistance","RollOffMinDistance","RollOffMode","SoundId",
                "TimeLength","TimePosition","Volume"},
            Lighting = {"Ambient","Brightness","ClockTime","ColorShift_Bottom",
                "ColorShift_Top","EnvironmentDiffuseScale","EnvironmentSpecularScale",
                "ExposureCompensation","FogColor","FogEnd","FogStart",
                "GeographicLatitude","GlobalShadows","OutdoorAmbient","ShadowSoftness","TimeOfDay"},
            Camera = {"CFrame","CameraSubject","CameraType","FieldOfView",
                "Focus","HeadLocked","HeadScale","MaxAxisFieldOfView","NearPlaneZ","ViewportSize"},
        }
        local chain = {
            TextLabel  = {"GuiBase2d","GuiObject","TextLabel"},
            TextButton = {"GuiBase2d","GuiObject","TextButton"},
            TextBox    = {"GuiBase2d","GuiObject","TextBox"},
            Frame      = {"GuiBase2d","GuiObject","Frame"},
            ScrollingFrame = {"GuiBase2d","GuiObject","ScrollingFrame"},
            ImageLabel = {"GuiBase2d","GuiObject","ImageLabel"},
            ImageButton= {"GuiBase2d","GuiObject","ImageButton"},
            ScreenGui  = {"ScreenGui"},
            UICorner   = {"UICorner"},UIStroke={"UIStroke"},UIGradient={"UIGradient"},
            UIPadding  = {"UIPadding"},UIListLayout={"UIListLayout"},
            UIGridLayout={"UIGridLayout"},UIScale={"UIScale"},
            UIAspectRatioConstraint={"UIAspectRatioConstraint"},
            UISizeConstraint={"UISizeConstraint"},UITextSizeConstraint={"UITextSizeConstraint"},
            Part={"BasePart","Part"},MeshPart={"BasePart","MeshPart"},
            UnionOperation={"BasePart"},SpecialMesh={"BasePart"},
            Humanoid={"Humanoid"},
            Script={"Script"},LocalScript={"LocalScript"},ModuleScript={"ModuleScript"},
            StringValue={"StringValue"},IntValue={"IntValue"},NumberValue={"NumberValue"},
            BoolValue={"BoolValue"},Vector3Value={"Vector3Value"},
            Color3Value={"Color3Value"},ObjectValue={"ObjectValue"},
            Sound={"Sound"},Lighting={"Lighting"},Camera={"Camera"},
        }
        local hierarchy = chain[cls] or {"GuiBase2d","GuiObject"}
        for _, c in ipairs(hierarchy) do
            if classProps[c] then
                for _, p in ipairs(classProps[c]) do addProp(p) end
            end
        end
    end
    local filter = propsFilterText:lower()
    local order = 0
    for _, propName in ipairs(allPropNames) do
        if filter ~= "" and not propName:lower():find(filter, 1, true) then continue end
        local okV, val = pcall(function() return inst[propName] end)
        if not okV then continue end
        if typeof(val) == "RBXScriptSignal" then continue end
        if typeof(val) == "Instance" then continue end
        order += 1
        local isEven = order % 2 == 0
        local row = mk("Frame",{
            Size=UDim2.new(1,0,0,PROPS_ROW_H),
            BackgroundColor3=isEven and Color3.fromRGB(28,28,28) or Color3.fromRGB(33,33,33),
            BackgroundTransparency=0, BorderSizePixel=0,
            LayoutOrder=order, ClipsDescendants=true
        }, propsScroll)
        mk("TextLabel",{
            Size=UDim2.new(0.5,0,1,0), Position=UDim2.new(0,4,0,0),
            BackgroundTransparency=1,
            Text=propName,
            TextColor3=Color3.fromRGB(190,190,190),
            TextXAlignment=Enum.TextXAlignment.Left,
            Font=Enum.Font.SourceSans, TextSize=11,
            TextTruncate=Enum.TextTruncate.AtEnd,
        }, row)
        local valType = typeof(val)
        local valColor = valType=="Color3" and Color3.fromRGB(180,180,180) or getTypeColor(val)
        local valLabel = mk("TextLabel",{
            Size=UDim2.new(0.5,-2,1,0), Position=UDim2.new(0.5,0,0,0),
            BackgroundTransparency=1,
            Text=serializeValShort(val),
            TextColor3=valColor,
            TextXAlignment=Enum.TextXAlignment.Left,
            Font=Enum.Font.SourceSans, TextSize=11,
            TextTruncate=Enum.TextTruncate.AtEnd,
        }, row)
        local swatch
        if valType == "Color3" then
            swatch = mk("Frame",{
                Size=UDim2.new(0,11,0,11),
                Position=UDim2.new(0.5,2,0.5,-5),
                BackgroundColor3=val, BorderSizePixel=1,
                ZIndex=2
            }, row)
            valLabel.Position = UDim2.new(0.5,15,0,0)
            valLabel.Size     = UDim2.new(0.5,-17,1,0)
        end
        local activeEdit = nil
        local function closeEdit()
            if activeEdit then activeEdit:Destroy(); activeEdit = nil end
            row.Size = UDim2.new(1,0,0,PROPS_ROW_H)
        end
        local function applyVal(newVal)
            local ok, err = pcall(function() inst[propName] = newVal end)
            if ok then
                val = newVal
                valLabel.Text = serializeValShort(newVal)
                valLabel.TextColor3 = getTypeColor(newVal)
                if swatch and typeof(newVal)=="Color3" then
                    swatch.BackgroundColor3 = newVal
                end
            else
                warn("[zukv2] prop set failed: "..tostring(err))
            end
            closeEdit()
        end
        local function makeInlineBox(startText, onConfirm)
            closeEdit()
            row.Size = UDim2.new(1,0,0,PROPS_ROW_H+2)
            local box = mk("TextBox",{
                Size=UDim2.new(0.5,-2,1,-2), Position=UDim2.new(0.5,0,0,1),
                BackgroundColor3=Color3.fromRGB(20,20,20),
                BorderSizePixel=1, BorderColor3=Color3.fromRGB(0,120,215),
                Text=startText, TextColor3=Color3.fromRGB(220,220,220),
                TextXAlignment=Enum.TextXAlignment.Left,
                Font=Enum.Font.Code, TextSize=11,
                ClearTextOnFocus=false, ZIndex=10
            }, row)
            activeEdit = box
            box:CaptureFocus()
            box.FocusLost:Connect(function(enterPressed)
                if enterPressed then onConfirm(box.Text) end
                closeEdit()
            end)
            return box
        end
        local hitbox = mk("TextButton",{
            Size=UDim2.new(0.5,0,1,0), Position=UDim2.new(0.5,0,0,0),
            BackgroundTransparency=1, Text="", ZIndex=3
        }, row)
        hitbox.MouseEnter:Connect(function()
            row.BackgroundColor3 = Color3.fromRGB(45,45,55)
        end)
        hitbox.MouseLeave:Connect(function()
            row.BackgroundColor3 = isEven and Color3.fromRGB(28,28,28) or Color3.fromRGB(33,33,33)
        end)
        hitbox.MouseButton1Click:Connect(function()
            if valType == "boolean" then
                applyVal(not inst[propName])
            elseif valType == "string" then
                makeInlineBox(inst[propName], function(t) applyVal(t) end)
            elseif valType == "number" then
                makeInlineBox(tostring(inst[propName]), function(t)
                    local n = tonumber(t)
                    if n then applyVal(n) else closeEdit() end
                end)
            elseif valType == "EnumItem" then
                local ok2, items = pcall(function()
                    return inst[propName].EnumType:GetEnumItems()
                end)
                if ok2 and items then
                    local cur = inst[propName]
                    local nextItem = items[1]
                    for i2, item in ipairs(items) do
                        if item == cur then
                            nextItem = items[(i2 % #items) + 1]; break
                        end
                    end
                    applyVal(nextItem)
                end
            elseif valType == "Color3" then
                closeEdit()
                row.Size = UDim2.new(1,0,0,PROPS_ROW_H + 22)
                local popup = mk("Frame",{
                    Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,0,PROPS_ROW_H),
                    BackgroundColor3=Color3.fromRGB(22,22,22), BorderSizePixel=0, ZIndex=10
                }, row)
                activeEdit = popup
                local cur = inst[propName]
                local rBox = mk("TextBox",{
                    Size=UDim2.new(0,38,1,-4), Position=UDim2.new(0,2,0,2),
                    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=1,
                    Text=tostring(math.floor(cur.R*255)),
                    TextColor3=Color3.fromRGB(255,100,100),
                    Font=Enum.Font.Code, TextSize=11, ZIndex=11, ClearTextOnFocus=false
                }, popup)
                local gBox = mk("TextBox",{
                    Size=UDim2.new(0,38,1,-4), Position=UDim2.new(0,42,0,2),
                    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=1,
                    Text=tostring(math.floor(cur.G*255)),
                    TextColor3=Color3.fromRGB(100,220,100),
                    Font=Enum.Font.Code, TextSize=11, ZIndex=11, ClearTextOnFocus=false
                }, popup)
                local bBox = mk("TextBox",{
                    Size=UDim2.new(0,38,1,-4), Position=UDim2.new(0,82,0,2),
                    BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=1,
                    Text=tostring(math.floor(cur.B*255)),
                    TextColor3=Color3.fromRGB(100,150,255),
                    Font=Enum.Font.Code, TextSize=11, ZIndex=11, ClearTextOnFocus=false
                }, popup)
                local applyBtn = mk("TextButton",{
                    Size=UDim2.new(0,30,1,-4), Position=UDim2.new(0,122,0,2),
                    BackgroundColor3=Color3.fromRGB(0,100,200), BorderSizePixel=0,
                    Text="OK", TextColor3=Color3.fromRGB(255,255,255),
                    Font=Enum.Font.SourceSansBold, TextSize=11, ZIndex=11
                }, popup)
                applyBtn.MouseButton1Click:Connect(function()
                    local r2 = tonumber(rBox.Text) or 0
                    local g2 = tonumber(gBox.Text) or 0
                    local b2 = tonumber(bBox.Text) or 0
                    applyVal(Color3.fromRGB(
                        math.clamp(r2,0,255),
                        math.clamp(g2,0,255),
                        math.clamp(b2,0,255)
                    ))
                end)
            elseif valType == "Vector3" then
                local cur = inst[propName]
                makeInlineBox(("%.4g,%.4g,%.4g"):format(cur.X,cur.Y,cur.Z), function(t)
                    local x,y,z = t:match("([^,]+),([^,]+),([^,]+)")
                    local nx,ny,nz = tonumber(x),tonumber(y),tonumber(z)
                    if nx and ny and nz then applyVal(Vector3.new(nx,ny,nz)) else closeEdit() end
                end)
            elseif valType == "Vector2" then
                local cur = inst[propName]
                makeInlineBox(("%.4g,%.4g"):format(cur.X,cur.Y), function(t)
                    local x,y = t:match("([^,]+),([^,]+)")
                    local nx,ny = tonumber(x),tonumber(y)
                    if nx and ny then applyVal(Vector2.new(nx,ny)) else closeEdit() end
                end)
            elseif valType == "UDim2" then
                local cur = inst[propName]
                makeInlineBox(("%.4g,%.4g,%.4g,%.4g"):format(
                    cur.X.Scale,cur.X.Offset,cur.Y.Scale,cur.Y.Offset), function(t)
                    local a,b2,c,d = t:match("([^,]+),([^,]+),([^,]+),([^,]+)")
                    local na,nb,nc,nd = tonumber(a),tonumber(b2),tonumber(c),tonumber(d)
                    if na and nb and nc and nd then
                        applyVal(UDim2.new(na,nb,nc,nd))
                    else closeEdit() end
                end)
            elseif valType == "UDim" then
                local cur = inst[propName]
                makeInlineBox(("%.4g,%.4g"):format(cur.Scale,cur.Offset), function(t)
                    local s,o = t:match("([^,]+),([^,]+)")
                    local ns,no = tonumber(s),tonumber(o)
                    if ns and no then applyVal(UDim.new(ns,no)) else closeEdit() end
                end)
            elseif valType == "BrickColor" then
                makeInlineBox(inst[propName].Name, function(t)
                    local ok3, bc = pcall(BrickColor.new, t)
                    if ok3 then applyVal(bc) else closeEdit() end
                end)
            end
        end)
        table.insert(propRowFrames, row)
    end
end
propsSearchInput:GetPropertyChangedSignal("Text"):Connect(function()
    propsFilterText = propsSearchInput.Text
    refreshProps()
end)
for i, svcName in ipairs(QUICK_NAV_SERVICES) do
end
closeBtn.MouseButton1Click:Connect(function() sg:Destroy() end)
local TweenService = game:GetService("TweenService")
local TWEEN_INFO   = TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
setPanelExpanded = function(expand)
    panelExpanded = expand
    if expand then
        rightCol.Visible = true
        TweenService:Create(rightCol, TWEEN_INFO, {
            Position = UDim2.new(1, -(PANEL_W + DECOMP_W), 0, 0),
        }):Play()
        toggleBtn.Text = "<"
    else
        local tw = TweenService:Create(rightCol, TWEEN_INFO, {
            Position = UDim2.new(1, 0, 0, 0),
        })
        tw:Play()
        tw.Completed:Connect(function()
            if not panelExpanded then
                rightCol.Visible = false
            end
        end)
        toggleBtn.Text = ">"
    end
end
toggleBtn.MouseButton1Click:Connect(function()
    setPanelExpanded(not panelExpanded)
end)
local resizing, resStart, resStartH
resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing=true; resStart=input.Position
        resStartH = main.AbsoluteSize.Y
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - resStart
        local newH = math.max(300, resStartH + d.Y)
        main.Size = UDim2.new(0, main.AbsoluteSize.X, 0, newH)
        renderRows()
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing=false
    end
end)
listFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        local maxOff = math.max(0, (#rows*ROW_H) - listFrame.AbsoluteSize.Y)
        scrollOffset = math.clamp(scrollOffset - input.Position.Z*ROW_H*3, 0, maxOff)
        renderRows()
    end
end)
listFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then closeCtx() end
end)
searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    filterText=searchInput.Text; scrollOffset=0
    rows=buildRows(treeRoot,0,{}); renderRows()
end)
refreshBtn2.MouseButton1Click:Connect(function()
    rows = buildRows(treeRoot, 0, {})
    renderRows()
end)
local function expandAllRecursive(inst)
    local ok, ch = pcall(inst.GetChildren, inst)
    if ok and #ch > 0 then
        expanded[inst] = true
        for _, c in ipairs(ch) do expandAllRecursive(c) end
    end
end
expandAllBtn.MouseButton1Click:Connect(function()
    expandAllRecursive(treeRoot)
    rows = buildRows(treeRoot, 0, {})
    renderRows()
end)
collapseAllBtn.MouseButton1Click:Connect(function()
    expanded = {}
    expanded[game] = true
    rows = buildRows(treeRoot, 0, {})
    renderRows()
end)
expanded[game] = true
rows = buildRows(treeRoot, 0, {})
renderRows()
