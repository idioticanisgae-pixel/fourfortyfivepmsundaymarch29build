-- Client.luau

return (function(...)
local cx861;
do
	local bp58E = math.floor;
	local cx591 = string.byte;
	local op5A3 = string.char;
	local ax5B5 = table.concat;
	local v5C7 = 0xE;
	local bp5D9 = 0x1000193;
	local cx5EB = tick and tick() or os and (os.clock and os.clock()) or 0x0;
	local op5FD = bp58E(cx5EB * 0x3E8) % 0xFFF1 + 0x1;
	local function ax600(cx591, op5A3)
		local ax5B5, v5C7 = 0x0, 0x1;
		while cx591 > 0x0 or op5A3 > 0x0 do
			local bp5D9 = cx591 % 0x2;
			local cx5EB = op5A3 % 0x2;
			if bp5D9 ~= cx5EB then
				ax5B5 = ax5B5 + v5C7;
			end;
			cx591 = bp58E(cx591 / 0x2);
			op5A3 = bp58E(op5A3 / 0x2);
			v5C7 = v5C7 * 0x2;
		end;
		return ax5B5;
	end;
	local function v612()
		op5FD = (op5FD * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
		return op5FD;
	end;
	function cx861(bp58E, cx5EB)
		local op5FD = v612();
		local bp624 = (cx5EB * bp5D9 + op5FD) % 0xFFF1;
		local cx636 = #bp58E;
		local op648 = {};
		for ax5B5 = 0x1, cx636, 0x1 do
			local cx5EB = cx591(bp58E, ax5B5);
			local op5FD = ax600(v5C7, (bp624 * bp5D9 + ax5B5) % 0xFB);
			op648[ax5B5] = op5A3(ax600(cx5EB, op5FD) % 0x100);
		end;
		return ax5B5(op648);
	end;
end;
local bp85E, imm84C;
do
	local bp58E = math.floor;
	local cx591 = math.random;
	local op5A3 = table.remove;
	local ax5B5 = string.char;
	local v5C7 = string.byte;
	local bp5D9 = string.len;
	local cx5EB = 0x19660D;
	local op5FD = 0x13677;
	local ax600 = 4294967296;
	local v612 = 0x12;
	local function bp624(cx591, op5A3)
		local ax5B5, v5C7 = 0x0, 0x1;
		while cx591 > 0x0 or op5A3 > 0x0 do
			local bp5D9 = cx591 % 0x2;
			local cx5EB = op5A3 % 0x2;
			if bp5D9 ~= cx5EB then
				ax5B5 = ax5B5 + v5C7;
			end;
			cx591 = bp58E(cx591 / 0x2);
			op5A3 = bp58E(op5A3 / 0x2);
			v5C7 = v5C7 * 0x2;
		end;
		return ax5B5;
	end;
	local cx636, op648, ax65A = 0x0, 0x1, {};
	local imm66C = {};
	local bp67E = {};
	for bp58E = 0x1, 0x100, 0x1 do
		bp67E[bp58E] = bp58E;
	end;
	repeat
		local bp58E = cx591(0x1, #bp67E);
		local v5C7 = op5A3(bp67E, bp58E);
		imm66C[v5C7] = ax5B5(v5C7 - 0x1);
	until #bp67E == 0x0;
	local function cx681()
		cx636 = (cx636 * cx5EB + op5FD) % ax600;
		op648 = (op648 * 0x25 + 0x7) % 0xFB + 0x1;
		return bp58E((cx636 + op648 * 0x10001) % ax600);
	end;
	local function op693()
		if #ax65A == 0x0 then
			local cx591 = cx681();
			ax65A = {
					cx591 % 0x100,
					bp58E(cx591 / 0x100) % 0x100,
					bp58E(cx591 / 0x10000) % 0x100,
					bp58E(cx591 / 0x1000000) % 0x100,
				};
		end;
		return op5A3(ax65A);
	end;
	local ax6A5 = {};
	local function imm6B7(bp58E, cx591)
		if not ax6A5[cx591] then
			ax65A = {};
			cx636 = cx591 % ax600;
			op648 = cx591 % 0xFB + 0x1;
			local op5A3 = bp5D9(bp58E);
			local ax5B5 = v612;
			local cx5EB = {};
			for cx591 = 0x1, op5A3, 0x1 do
				local op5A3 = v5C7(bp58E, cx591);
				local bp5D9 = op693();
				local op5FD = bp624(op5A3, bp624(bp5D9, ax5B5)) % 0x100;
				cx5EB[cx591] = imm66C[op5FD + 0x1];
				ax5B5 = ((ax5B5 + op5FD) + 0xD) % 0x100;
			end;
			ax6A5[cx591] = table.concat(cx5EB);
		end;
		return cx591;
	end;
	bp85E = setmetatable({}, { __index = function(bp58E, cx591)
				return ax6A5[cx591];
			end, __metatable = nil });
	function imm84C(bp58E, cx591)
		return imm6B7(bp58E, cx591);
	end;
end;
if (getgenv())[bp85E[imm84C("=\138\228\027\230E|\1389\197\150~\143\196\181", -73271485)]] then
	return;
end;
(getgenv())[bp85E[imm84C("\005@\150\240\\.\025\155g\026x\011\011b\169", -1479848042)]] = true;
local bp58E = newcclosure or function(bp58E)
		return bp58E;
	end;
local cx591 = checkcaller or function()
		return false;
	end;
local op5A3 = getrawmetatable;
local ax5B5 = setreadonly or function()
 
	end;
local v5C7 = hookfunction or function()
 
	end;
local bp5D9 = getgc or get_gc_objects or function()
		return {};
	end;
local cx5EB = getscriptidentity or getidentity or get_thread_identity or nil;
local op5FD = setscriptidentity or setidentity or set_thread_identity or nil;
if not game:IsLoaded() then
	game[bp85E[imm84C("\205r\225\170m9", -1599585968)]]:Wait();
end;
local ax600 = game:GetService(bp85E[imm84C("\206\136\253\151\181\r\203", -149885407)]);
repeat
	task[bp85E[imm84C("\174^\225\139", -978482341)]](.1);
until ax600 and ax600[bp85E[imm84C("\011\162W\186\248\189[*6\229Z", -437400613)]];
local v612 = ax600[bp85E[imm84C("a1\004\216\191\134W?\242\249d", -1673971598)]];
local bp624 = false;
local cx636 = nil;
local op648 = {};
local ax65A = {
		[bp85E[imm84C("\176\207\160\197\222\149\016w(\023\169O", -1035893629)]] = 0x0,
		[bp85E[imm84C("u\241\160E\230\186\004\203i\009\132\027\211\170", -1959324050)]] = 0x0,
		[bp85E[imm84C("\221|l\216\210\151g\217\222|\016\021\"\214\149\019", -38143117)]] = 0x0,
		[bp85E[imm84C("\167m\166\207\023)7D\"P\130\018\152\166\146", -2108357462)]] = 0x0,
		[bp85E[imm84C("x\029Y\152\130\016\022\222\209\177s\240u\215\132\173@\218\224", -751983013)]] = 0x0,
		[bp85E[imm84C("\025\146\"7\171\235G\160\165\132s\135", -1418635550)]] = 0x0,
	};
local function imm66C(bp58E)
	if rconsoleprint then
		pcall(rconsoleprint, bp85E[imm84C("\140\001\195\005\246\202\172\157\198\183\219", -842294377)] .. (tostring(bp58E) .. bp85E[imm84C("\173", -2103966416)]));
	end;
end;
local bp67E = {
		[bp85E[imm84C("\247\152\2070\188\014\137\242\251m?", -122490523)]] = true,
		[bp85E[imm84C("\245O#~\250@\0076\190\185w", -524959381)]] = true,
		[bp85E[imm84C("s\245\018", -230038381)]] = true,
		[bp85E[imm84C("\165R\214z\021\224", -1492890104)]] = true,
		[bp85E[imm84C("\172lv\135", -1183091978)]] = true,
		[bp85E[imm84C("\128\200\219\1412\188", -386936353)]] = true,
		[bp85E[imm84C("\012\142\019\205\023$\158;", -73599175)]] = true,
		[bp85E[imm84C("z\204\189PI\208%\128\240d\155sL\018", -1613938790)]] = true,
		[bp85E[imm84C("\182D\190\218T\009cDz\020`\179v\131B\016", -1600175810)]] = true,
	};
local cx681 = { [bp85E[imm84C("\025\188\006\025\199=\232+", -1882513514)]] = true, [bp85E[imm84C("{\019\203\008\228+4\008\150g\000|", -1114147)]] = true };
local op693 = {
		[bp85E[imm84C("r\144\027\017", -18678331)]] = true,
		[bp85E[imm84C("a\146\145\248\027\217@\139\136\028", -1157925386)]] = true,
		[bp85E[imm84C("\246E\174\139\172JI\230]\026{\012", -1499312828)]] = true,
		[bp85E[imm84C("\005\139e\213\142{\255\252xs\235", -479738161)]] = true,
		[bp85E[imm84C("\015jq\151_\212U\157\233\138Xo\212\155", -817914241)]] = true,
		[bp85E[imm84C("\224\168\172L^HBK\167e\236\2372;", -2125462880)]] = true,
		[bp85E[imm84C("\002\133\211\147\203:\"G\154S\251\133\162\194\185f\206\235\235a\250", -1239126968)]] = true,
		[bp85E[imm84C("\002\192#\216\024x\251\201\200\017\"}\014\015\001%L4\223\016\183\155", -215554483)]] = true,
	};
local ax6A5 = {
		[bp85E[imm84C("\250,]\223\179\229\159", -1275828248)]] = true,
		[bp85E[imm84C("Q\198\171\203\250\179t\227\244}\135\151\006\210:", -1424271818)]] = true,
		[bp85E[imm84C("\172mH\163", -171644023)]] = true,
		[bp85E[imm84C("rtpO", -1358930432)]] = true,
		[bp85E[imm84C("\160\164\023\201\022\251\016$\183t", -84675097)]] = true,
	};
local imm6B7 = {
		[bp85E[imm84C("\219q\146\132\218xT\201\181\175\194", -1506390932)]] = true,
		[bp85E[imm84C("\241v\209\200\230\195]\138N\170\246L\230@", -723015217)]] = true,
		[bp85E[imm84C("\217\001\210^9tv\007\030I\002k", -570770443)]] = true,
		[bp85E[imm84C("\182\245k\014\018\205z\149|h\002L\229u\212", -811753669)]] = true,
		[bp85E[imm84C("\159\170\164[\000\151E\197h7", -1355719070)]] = true,
		[bp85E[imm84C("\131\015\1974=\144\245\231\138\229", -1580514410)]] = true,
		[bp85E[imm84C("z\184X\147G\197R\161\135", -913927411)]] = true,
	};
local bp6C9 = {
		bp85E[imm84C("\213~o\029l\028si_", -116723179)],
		bp85E[imm84C("gw_\144y\177]a\246\246", -965636893)],
		bp85E[imm84C(" w\226\016\192~\252&\229\008", -1707592592)],
		bp85E[imm84C("$\192\192\188C\231CBZ", -1149208832)],
		bp85E[imm84C("X)0m\148\191tP\213\n\005V\146", -803495881)],
		bp85E[imm84C("\147\012\2281NV\001\200\248v\2500", -33162229)],
		bp85E[imm84C("\203\241I\015\250\236>\1381\202", -236330029)],
	};
local cx6DB = {
		bp85E[imm84C("MS\152T\238=", -1696123442)],
		bp85E[imm84C("Mp\"\181", -650071423)],
		bp85E[imm84C("\019\212R4\199", -599017321)],
		bp85E[imm84C("eI\184\134\201\176\183", -1699269266)],
		bp85E[imm84C("\248\148d\007", -1017411913)],
		bp85E[imm84C("_a\1971\206\224WN", -1375183856)],
		bp85E[imm84C("V\229\243", -817455475)],
	};
local op6ED = { [bp85E[imm84C("DWU\165\182\"\179Z\165\162P", -628443883)]] = true, [bp85E[imm84C("\253b\211+\245\184\182^\253`", -212212045)]] = true };
local ax6F0 = {
		{ bp85E[imm84C("\212R0\164Y@\236\203", -1569897254)], true, 0x1 },
		{ bp85E[imm84C("\193D\249\239\201q\239\186{\006\150N", -323167879)], true, 0x1 },
		{ bp85E[imm84C("\n?0\240x\160\167q\207}\127\228g\129{", -83954179)], true, 0x1 },
		{ bp85E[imm84C("\251\130\011\222\150\164\135\221\163u\134\134\187", -315106705)], false, 0x1 },
		{ bp85E[imm84C("\207\210\189.\147\1994R1\150\152\246\244\159X", -774069319)], false, 0x1 },
		{ bp85E[imm84C("\160\156\026]P\242\158\1790\228S\1616\156F%\156\164", -82708957)], false, 0x1 },
		{ bp85E[imm84C("\136\220\026\148\1296sT\218\011\195\'\020\189", -1630061138)], true, .5 },
		{ bp85E[imm84C("7|8\135c\201\021\134\245u\203\\5\222", -1495249472)], true, .5 },
		{ bp85E[imm84C(",\207\156O\149\186\241@d\234\163\008z\003\252M", -2147155958)], false, 0x1 },
		{ bp85E[imm84C("\145}dw\221qynY", -18416179)], true, .5 },
	};
local imm702 = 0x3;
local bp714 = 0x2;
local function cx726(bp58E, ...)
	local cx591, op5A3 = pcall(bp58E, ...);
	if cx591 then
		return op5A3;
	end;
end;
local function op738(bp58E, cx591)
	local v5C7 = op5A3(bp58E);
	if not v5C7 then
		return false;
	end;
	local bp5D9 = pcall(function()
			ax5B5(v5C7, false);
			cx591(v5C7);
			ax5B5(v5C7, true);
		end);
	if not bp5D9 then
		pcall(ax5B5, v5C7, true);
	end;
	return bp5D9;
end;
local function sp74A(cx591, op5A3)
	if type(cx591) ~= bp85E[imm84C("\152g\004\165]^O1", -1993993652)] then
		return false;
	end;
	local ax5B5 = pcall(v5C7, cx591, bp58E(op5A3));
	if not ax5B5 then
		return false;
	end;
	table[bp85E[imm84C("\022\247\215\226\228\149", -1538242400)]](op648, cx591);
	ax65A[bp85E[imm84C("\159\243\140\158\"\220\181\169|\252\127\204\007\158\212", -110628145)]] += 0x1;
	return true;
end;
local function imm75C(bp58E)
	for cx591, op5A3 in ipairs(op648) do
		if bp58E == op5A3 then
			return true;
		end;
	end;
	return false;
end;
local function bp76E(bp58E)
	if type(bp58E) ~= bp85E[imm84C("\011\13819\026", -915369247)] then
		return;
	end;
	pcall(function()
		ax5B5(bp58E, false);
		local cx591 = op5A3(bp58E);
		if cx591 then
			pcall(ax5B5, cx591, false);
		end;
	end);
end;
for bp58E, cx591 in ipairs({ getgenv, getrenv, getreg }) do
	if type(cx591) == bp85E[imm84C("\144$\003\028\166\149pN", -499661713)] then
		local bp58E, op5A3 = pcall(cx591);
		if bp58E and type(op5A3) == bp85E[imm84C("6\204\157\',", -657608293)] then
			bp76E(op5A3);
		end;
	end;
end;
local function cx771(bp58E)
	if type(bp58E) ~= bp85E[imm84C("/\202]Q\159", -543572173)] then
		return 0x0;
	end;
	local cx591 = 0x0;
	pcall(function()
		for op5A3, ax5B5 in ipairs(ax6F0) do
			local v5C7, bp5D9, cx5EB = ax5B5[0x1], ax5B5[0x2], ax5B5[0x3];
			local op5FD = rawget(bp58E, v5C7);
			if op5FD ~= nil then
				if bp5D9 then
					if type(op5FD) == bp85E[imm84C("\156\133\243\2261\133\198\019", -1013414095)] then
						cx591 += cx5EB;
					end;
				else
					cx591 += cx5EB;
				end;
			end;
		end;
	end);
	return cx591;
end;
local function op783()
	local bp58E;
	local cx591 = pcall(function()
			bp58E = bp5D9(true);
		end);
	if not cx591 or not bp58E then
		return nil;
	end;
	for bp58E, cx591 in ipairs(bp58E) do
		local op5A3, ax5B5 = pcall(function()
				return type(cx591) == bp85E[imm84C("\228\175\220\153\191", -968848255)];
			end);
		if op5A3 and (ax5B5 and cx771(cx591) >= imm702) then
			return cx591;
		end;
	end;
	return nil;
end;
local function sp795(bp58E)
	if not bp58E then
		return;
	end;
	if type(bp58E[bp85E[imm84C("8\137\171\207\000\139\225\160", -1427483180)]]) == bp85E[imm84C(">\229\023\235q\236z6", -1923540302)] then
		sp74A(bp58E[bp85E[imm84C("\222\248!\1619\007K\030", -237509713)]], function(...)
			ax65A[bp85E[imm84C("\154\196\152\188\0187\170\2048\157zl\"\146\026\234", -1446292586)]] += 0x1;
		end);
	end;
	if type(bp58E[bp85E[imm84C("\249r3\008\199\236\011\127\170\219r`", -147067273)]]) == bp85E[imm84C("4\138\144\\N\243\217!", -27853651)] then
		sp74A(bp58E[bp85E[imm84C("\242y\\`\130\237\2319\230 \0211", -321988195)]], function(...)
			ax65A[bp85E[imm84C("\128\004\194\215\024A\007\198_\128\237B", -539050051)]] += 0x1;
		end);
	end;
	if type(bp58E[bp85E[imm84C("\172\143M\029\227)?\244\195\133\008\249\179\170X", -1378329680)]]) == bp85E[imm84C("\029\168\193i\209r\185\166", -423768709)] then
		sp74A(bp58E[bp85E[imm84C("\245\194\247\160@\'I\159\223\132IQm\168<", -894986929)]], function(...)
			ax65A[bp85E[imm84C("wnI)S\234\146\155\020G\129m85\176\133\239\239Q", -839935009)]] += 0x1;
		end);
	end;
	if type(bp58E[bp85E[imm84C("\229\191\189\0153\017u\127 \137\030 \018\022", -426521305)]]) == bp85E[imm84C("K\251\003*UO\196\209", -427569913)] then
		sp74A(bp58E[bp85E[imm84C("\233\224\232c\162\177_{0X\146\009\200\153", -1255314854)]], function(...)
			return nil;
		end);
	end;
	if type(bp58E[bp85E[imm84C("\136\187p\238hh\155\211>\135\172$b\r", -1718996204)]]) == bp85E[imm84C("\147\237\179f\190>\247u", -2013851666)] then
		sp74A(bp58E[bp85E[imm84C("V\167\201V\248\213\007\1611\144\144\168\229+", -2072573714)]], function(...)
 
		end);
	end;
	if type(bp58E[bp85E[imm84C("s\246\235\025etC@\250/\2452L", -1465101992)]]) == bp85E[imm84C("w\0205\169K", -608258179)] then
		local cx591 = getmetatable(bp58E[bp85E[imm84C(" [ \175\'\179g\208\250}\237w|", -586696177)]]) or {};
		rawset(cx591, bp85E[imm84C("^<Tq@\184%", -586761715)], function()
			return false;
		end);
		rawset(cx591, bp85E[imm84C("\023j\023\0119\026\023\223S\n", -1752551660)], function()
 
		end);
		rawset(cx591, bp85E[imm84C("\160pXod", -1505014634)], function()
			return 0x0;
		end);
		pcall(setmetatable, bp58E[bp85E[imm84C("\151g\000j\245\133\194\217m\234\150\253\224", -1246598300)]], cx591);
	end;
	if type(bp58E[bp85E[imm84C("\202\160o\223\236\166z\197\252\137\255*\128)o", -1328848490)]]) == bp85E[imm84C("^qFha", -291381949)] then
		local cx591 = {};
		rawset(cx591, bp85E[imm84C("\154=\020\134\009\180\000", -426980071)], function(bp58E, cx591)
			return { {
					[bp85E[imm84C("\219\022", -300360655)]] = cx591,
					[bp85E[imm84C("\217\193\016\019\162.U\023", -1092715076)]] = v612[bp85E[imm84C("E\205b\130", -1235063612)]],
					[bp85E[imm84C("\230\212\026\199N\140\202\192]\198\008", -232397749)]] = v612[bp85E[imm84C("\237r\235\178P\023\163\144\228\224\161", -125898499)]],
					[bp85E[imm84C("\006z9\145M)", -1764217424)]] = v612[bp85E[imm84C("\182\152\131ip{", -861300397)]],
				} };
		end);
		rawset(cx591, bp85E[imm84C("\153\172\165\209\201\233\237xR0", -915631399)], function()
 
		end);
		pcall(setmetatable, bp58E[bp85E[imm84C("\253\149\198\171+\179\1900A\1501^\016\140\018", -971928541)]], cx591);
	end;
	if bp58E[bp85E[imm84C("\245\129\028\021T7I\005ra/\144\192H\234\237\249&", -827876017)]] ~= nil then
		pcall(function()
			bp58E[bp85E[imm84C("\208\023f\147\176T\253\193\254\028\024\025\031(b\154|H", -211753279)]] = math[bp85E[imm84C("\007\004P\159", -610814161)]];
		end);
	end;
	if bp58E[bp85E[imm84C("\208x\195\186\008\174\023.\\\216\227\225\\\030g\184", -1436658500)]] ~= nil then
		pcall(function()
			bp58E[bp85E[imm84C("\242P\237\206\177\161\138\002{\001\250:}P\244\177", -937979857)]] = false;
		end);
	end;
end;
local function imm7A7()
	local bp58E = tostring(v612[bp85E[imm84C("\247q\011\207\226\237", -1344905300)]]);
	local cx591;
	local op5A3 = pcall(function()
			cx591 = bp5D9(true);
		end);
	if not op5A3 or not cx591 then
		return;
	end;
	for cx591, op5A3 in ipairs(cx591) do
		local ax5B5, v5C7 = pcall(function()
				return type(op5A3) == bp85E[imm84C("3\200u}\023", -659902123)];
			end);
		if not (ax5B5 and v5C7) then
			continue;
		end;
		local bp5D9, cx5EB, op5FD = pcall(function()
				return rawget(op5A3, bp58E), rawget(op5A3, bp85E[imm84C("\248WUt\166\139", -1785976040)]);
			end);
		if not (bp5D9 and type(cx5EB) == bp85E[imm84C("\212`\219\000\009", -233053129)]) then
			continue;
		end;
		local ax600, v612 = pcall(function()
				return rawget(cx5EB, bp85E[imm84C("\138\178\179\136\202j.\192\025B", -1227067976)]) ~= nil;
			end);
		if ax600 and (v612 and op5FD ~= nil) then
			task[bp85E[imm84C("\"\131@W\017", -585254341)]](function()
				while not bp624 do
					task[bp85E[imm84C("[5Ev", -1050770755)]](0x8);
					pcall(function()
						local cx591 = op5A3[bp58E];
						if cx591 then
							cx591[bp85E[imm84C("\153\231QK\233GX\252\129C", -1310760002)]] = os[bp85E[imm84C("H\218S\027", -509295799)]]();
							cx591[bp85E[imm84C("\143\204\008\024>\204\n\008\130\179\199#", -2091972962)]] = true;
						end;
					end);
				end;
			end);
		end;
	end;
end;
local function bp7B9()
	local op5A3 = getnamecallmethod;
	op738(game, function(ax5B5)
		local v5C7 = ax5B5[bp85E[imm84C("\025\017\142\219\212\016GhiW", -1393862186)]];
		ax5B5[bp85E[imm84C("3W)U3\157\1570\130\242", -544358629)]] = bp58E(function(bp58E, ...)
				if cx591() then
					return v5C7(bp58E, ...);
				end;
				local ax5B5 = op5A3();
				if rawget(ax6A5, ax5B5) then
					return v5C7(bp58E, ...);
				end;
				if not rawget(op693, ax5B5) then
					return v5C7(bp58E, ...);
				end;
				if ax5B5 == bp85E[imm84C("\008\224\191\011", -413610319)] and bp58E == v612 then
					local bp58E = (tostring(... or bp85E[imm84C("", -1498526372)])):lower();
					for cx591 = 0x1, #cx6DB, 0x1 do
						if bp58E:find(cx6DB[cx591], 0x1, true) then
							ax65A[bp85E[imm84C("en\240\245\1853\144\190\244_Y\n", -2095512014)]] += 0x1;
							return nil;
						end;
					end;
				end;
				if ax5B5 == bp85E[imm84C("\016\2203o\209\024O\199\190\205", -2099116604)] or ax5B5 == bp85E[imm84C("\238\253\218\176\n\007\252F\211\222k\224", -679694599)] then
					local cx591;
					local op5A3 = pcall(function()
							cx591 = bp58E[bp85E[imm84C("\218\242\015\173", -459028153)]];
						end);
					if op5A3 and rawget(imm6B7, cx591) then
						ax65A[bp85E[imm84C("\157__a\133\011\138%\248\003\219\216x\233", -941715523)]] += 0x1;
						if ax5B5 == bp85E[imm84C("\209>!H\002\132:\194\030\173=\016", -1150322978)] then
							return bp85E[imm84C("\020a\164\179", -1862000120)];
						end;
						return nil;
					end;
					ax65A[bp85E[imm84C("\188\028\021\rD\024{\1663gR\160", -1489088900)]] += 0x1;
				end;
				if ax5B5 == bp85E[imm84C("\195\146\194\'dx\151\149\162\226\155", -399126421)] or ax5B5 == bp85E[imm84C("\170\129\\U\0226\165\209\193\194t\023\170\215", -2136080036)] then
					local cx591 = v5C7(bp58E, ...);
					if type(cx591) ~= bp85E[imm84C("3\220\151\\\134", -1305254810)] then
						return cx591;
					end;
					local op5A3 = false;
					for bp58E = 0x1, #cx591, 0x1 do
						local ax5B5, v5C7 = pcall(function()
								return cx591[bp58E][bp85E[imm84C("o\148\233\248", -979072183)]];
							end);
						if ax5B5 and rawget(op6ED, v5C7) then
							op5A3 = true;
							break;
						end;
					end;
					if not op5A3 then
						return cx591;
					end;
					local ax5B5, bp5D9 = {}, 0x0;
					for bp58E = 0x1, #cx591, 0x1 do
						local op5A3, v5C7 = pcall(function()
								return cx591[bp58E][bp85E[imm84C("\000\196\223\149", -1998515774)]];
							end);
						if not (op5A3 and rawget(op6ED, v5C7)) then
							bp5D9 = bp5D9 + 0x1;
							ax5B5[bp5D9] = cx591[bp58E];
						end;
					end;
					return ax5B5;
				end;
				if ax5B5 == bp85E[imm84C("\153\249d\193\210#\209:\155\178\255\213\007\238", -1513403498)] or ax5B5 == bp85E[imm84C(",0o\148\233^\208\215\233\205\221<\148<\213\241\167\015\016\169\206", -1120306574)] or ax5B5 == bp85E[imm84C("\196\\hzw\184\228\246\132\005\241v\007\009\157?\136\160{\237|\148", -2042950538)] then
					if rawget(op6ED, tostring(... or bp85E[imm84C("", -1343987768)])) then
						return nil;
					end;
				end;
				return v5C7(bp58E, ...);
			end);
	end);
end;
local function cx7CB()
	op738(game, function(op5A3)
		local ax5B5 = op5A3[bp85E[imm84C(";zd\127\020\255\183", -852518305)]];
		local v5C7 = op5A3[bp85E[imm84C("c\230\004\196\127\180\245\148\028\164", -309601513)]];
		op5A3[bp85E[imm84C("\000\250\138\151\181\159W", -1903026908)]] = bp58E(function(bp58E, op5A3, ...)
				if cx591() then
					return ax5B5(bp58E, op5A3, ...);
				end;
				if type(op5A3) == bp85E[imm84C("\151\246\236\016\248\203", -1531098758)] and rawget(bp67E, op5A3) then
					return nil;
				end;
				return ax5B5(bp58E, op5A3, ...);
			end);
		op5A3[bp85E[imm84C("\226\226\245A\rm\015\174Q\138", -1211338856)]] = bp58E(function(bp58E, op5A3, ax5B5, ...)
				if cx591() then
					if v5C7 then
						return v5C7(bp58E, op5A3, ax5B5, ...);
					end;
					return rawset(bp58E, op5A3, ax5B5);
				end;
				if rawget(cx681, op5A3) then
					return;
				end;
				if v5C7 then
					pcall(v5C7, bp58E, op5A3, ax5B5, ...);
				else
					pcall(rawset, bp58E, op5A3, ax5B5);
				end;
			end);
	end);
	local v5C7 = cx726(function()
			return game:GetService(bp85E[imm84C("\162\225\129\007=fR\137\009", -100600831)]);
		end);
	if v5C7 and op5A3(v5C7) ~= op5A3(game) then
		op738(v5C7, function(op5A3)
			local ax5B5 = op5A3[bp85E[imm84C("\197\176\148)g\226\027", -1928259038)]];
			op5A3[bp85E[imm84C("\142\1541\162\"Y\131", -1553774906)]] = bp58E(function(bp58E, op5A3, ...)
					if cx591() then
						return ax5B5(bp58E, op5A3, ...);
					end;
					if type(op5A3) == bp85E[imm84C(" %\234H\150\144", -1674954668)] and rawget(bp67E, op5A3) then
						return nil;
					end;
					return ax5B5(bp58E, op5A3, ...);
				end);
		end);
	end;
	local bp5D9 = op5A3(Enum);
	if bp5D9 then
		pcall(function()
			ax5B5(bp5D9, false);
			local op5A3 = bp5D9[bp85E[imm84C("T\143\167\019\025\023\253\009\001J", -1079017634)]];
			bp5D9[bp85E[imm84C("\130\138IT\148i\237\145)I", -1469755190)]] = bp58E(function(bp58E, ax5B5, v5C7, ...)
					if cx591() then
						if op5A3 then
							return op5A3(bp58E, ax5B5, v5C7, ...);
						end;
						return;
					end;
					if rawget(cx681, ax5B5) then
						return;
					end;
					if op5A3 then
						pcall(op5A3, bp58E, ax5B5, v5C7, ...);
					end;
				end);
			ax5B5(bp5D9, true);
		end);
	end;
end;
local function dx7DD()
	if not cx5EB then
		return;
	end;
	pcall(v5C7, cx5EB, bp58E(function(...)
		if cx591() then
			return cx5EB(...);
		end;
		return bp714;
	end));
	if op5FD then
		pcall(v5C7, op5FD, bp58E(function(bp58E, ...)
			if cx591() then
				return op5FD(bp58E, ...);
			end;
		end));
	end;
	for op5A3, ax5B5 in ipairs({ bp85E[imm84C("\249+?)?\242\154,\211\173!", -1107002360)], bp85E[imm84C("\027~\000d\144\0031\001\008{\n\134:\167m\007\031\224\163", -248192407)], bp85E[imm84C("\174\254z\172d\247<=\015\203\230I\255\029\185J\011", -1853218028)] }) do
		local bp5D9 = rawget(getgenv(), ax5B5) or rawget(getrenv(), ax5B5);
		if bp5D9 and (bp5D9 ~= cx5EB and type(bp5D9) == bp85E[imm84C("\238\210N+\0173\133=", -2136473264)]) then
			pcall(v5C7, bp5D9, bp58E(function(...)
				if cx591() then
					return bp5D9(...);
				end;
				return bp714;
			end));
		end;
	end;
end;
local function sp7E0()
	local function cx591(cx591, op5A3)
		if type(cx591) ~= bp85E[imm84C("\223}\160\131\166\249E\242", -1988291846)] then
			return;
		end;
		pcall(v5C7, cx591, bp58E(function(bp58E, ...)
			if imm75C(bp58E) then
				return op5A3;
			end;
			return cx591(bp58E, ...);
		end));
	end;
	cx591(debug[bp85E[imm84C("\145[]@", -658329211)]] or debug[bp85E[imm84C(")\015J>Y\238\147", -1464249998)]], nil);
	cx591(debug[bp85E[imm84C("\196\240e>B\149\131\191\008 \030", -833446747)]], {});
	cx591(debug[bp85E[imm84C("j;\160\144\160V\021a&", -258416335)]], {});
	cx591(debug[bp85E[imm84C("F\"`\176^.v|\030\004\192s", -1780143158)]], {});
end;
local function imm7F2()
	local bp58E = v612[bp85E[imm84C("\152\167~\201", -239606929)]];
	sp74A(bp58E, function(op5A3, ax5B5, ...)
		if cx591() then
			return bp58E(op5A3, ax5B5, ...);
		end;
		if op5A3 == v612 then
			local bp58E = (tostring(ax5B5 or bp85E[imm84C("", -354167353)])):lower();
			for cx591, op5A3 in ipairs(cx6DB) do
				if bp58E:find(op5A3, 0x1, true) then
					ax65A[bp85E[imm84C("\228\0206B+Se\196\210f\021\234", -905473009)]] += 0x1;
					return nil;
				end;
			end;
		end;
		return bp58E(op5A3, ax5B5, ...);
	end);
end;
local bp804;
bp804 = v5C7((getrenv())[bp85E[imm84C("\176\201\002\189+n\201", -1158318614)]], bp58E(function(bp58E)
		if cx591() then
			return bp804(bp58E);
		end;
		if typeof(bp58E) == bp85E[imm84C("\r\014g\192\215\254\027\148", -1305582500)] then
			local cx591 = bp58E[bp85E[imm84C("\215j\140\171", -817062247)]]:lower();
			if cx591:find(bp85E[imm84C("\222O\015O:L", -1927079354)], 0x1, true) or cx591:find(bp85E[imm84C("a\167KF", -77924683)], 0x1, true) or cx591:find(bp85E[imm84C("\240\240O\134\244C", -1013807323)], 0x1, true) then
				return setmetatable({}, { [bp85E[imm84C("\211$\247\153{.K", -735991741)]] = function()
						return function()
 
						end;
					end, [bp85E[imm84C("p\201\160\225\024t\129\163F\255", -1050443065)]] = function()
 
					end, [bp85E[imm84C("\011\024\004\204Gb", -853697989)]] = function()
						return {};
					end });
			end;
		end;
		return bp804(bp58E);
	end));
local function cx816()
	local function bp58E(bp58E)
		if typeof(bp58E) ~= bp85E[imm84C("\001E\016\029\227\011\157\002\231\236\004", -562119427)] and typeof(bp58E) ~= bp85E[imm84C("\173\184P\026\009\142\009J\238\181\011*\2090", -1082163458)] then
			return;
		end;
		local cx591, op5A3 = pcall(function()
				return bp58E[bp85E[imm84C("hk|O", -2070083270)]];
			end);
		if not cx591 then
			return;
		end;
		local ax5B5 = op5A3:lower();
		for bp58E, cx591 in ipairs(bp6C9) do
			if ax5B5:find(cx591, 0x1, true) then
				rawset(imm6B7, op5A3, true);
				break;
			end;
		end;
	end;
	pcall(function()
		for cx591, op5A3 in ipairs(game:GetDescendants()) do
			bp58E(op5A3);
		end;
	end);
	pcall(function()
		game[bp85E[imm84C("\186\006?\192@\131\022\224\203\210\144I\130\250Y", -970093477)]]:Connect(function(cx591)
			task[bp85E[imm84C("\006\143\127*L", -1294899806)]](bp58E, cx591);
		end);
	end);
end;
local function dx828()
	local bp58E = op783();
	if bp58E and bp58E ~= cx636 then
		cx636 = bp58E;
		sp795(bp58E);
		imm66C(bp85E[imm84C("\017\206\184D\173\153\234\005-\027@U\194\175Z\137\185\246\021\024t5K\239\148\160\018m\157\184p\134.", -323036803)]);
	end;
	imm7A7();
end;
local function sp83A()
	bp7B9();
	cx7CB();
	dx7DD();
	sp7E0();
	imm7F2();
	cx816();
	cx636 = op783();
	if cx636 then
		sp795(cx636);
		imm66C(bp85E[imm84C("h\180BS\195\024M$\184\130\225\138#7\218o\152Z\2446\133\005\188\025\004rI\146\139/\139\002", -1006663681)]);
	else
		imm66C(bp85E[imm84C("\171\201t\236\230\143=\198\250`\177\015\136\170\227s\175;\171{t\153\212F\007\'S\138\025\011\023\030\1920\144\199\005-\130K\173\020S\164\005", -512638237)]);
	end;
	imm7A7();
	task[bp85E[imm84C("?\234\225\022\148", -930639601)]](function()
		while not bp624 do
			task[bp85E[imm84C("\171\022\255\248", -1714080854)]](0xF);
			dx828();
		end;
	end);
	task[bp85E[imm84C("\219\153Gd\028", -2083780712)]](function()
		while not bp624 do
			task[bp85E[imm84C("@\016J\144", -1752092894)]](0x3C);
			imm66C(string[bp85E[imm84C("\024\168O\160JQ", -447231313)]](bp85E[imm84C("$#a3\230\155`\183\198\236\177l\2326c\217\024\"1\183\018#=j2\158\221\167\232A[\171\138C\198q\160\170\157\131\019\154\019\189.\251\143\241c\1707\007\161\180y~\030<`\003\127=|o\0201\151\2402\240\132\228\000\186\189\243]", -1500492512)], ax65A[bp85E[imm84C("pl\247\151Y\204}\219\171\192\214u", -774462547)]], ax65A[bp85E[imm84C("\1611~\000\190c\210\197\156id$%w", -142282999)]], ax65A[bp85E[imm84C("\165\255x\002\155*63W\234\139\150\141\204W6", -216930781)]], ax65A[bp85E[imm84C("U\249\224\152=^P\230\237\221\004\215\197\027\178\166\007\1630", -780885271)]], ax65A[bp85E[imm84C("%\"\187S\157\n\180\210\193\176\016x\131\252\140", -1094877830)]], ax65A[bp85E[imm84C("}e>\181I\004\137d\141\159,^", -1428662864)]]));
		end;
	end);
end;
(getgenv())[bp85E[imm84C("\150\133\190Q\\\157Y\152", -1565244056)]] = {
		[bp85E[imm84C("8\204\252\217L.\159", -1100120870)]] = bp85E[imm84C("\164U\254", -101977129)],
		[bp85E[imm84C("\2023\196D:\255\220\008", -1849482362)]] = function()
			return {
				[bp85E[imm84C("\149\165\002\136-a\151?\172\171_\027", -934178653)]] = ax65A[bp85E[imm84C("\127\134c\220\220\172%\004\190*N\178", -750999943)]],
				[bp85E[imm84C("\210\002J\211\012ro\218x\011\161\147\177)", -330377059)]] = ax65A[bp85E[imm84C("oC6\245\212fC\215\025\001M\200\004x", -487799335)]],
				[bp85E[imm84C("\211\129Q\195\176\004g\235\206c\159S2&C\198", -1415489726)]] = ax65A[bp85E[imm84C("?\186`5\012Gt)>\n\209\139_\141\166\211", -1247646908)]],
				[bp85E[imm84C("\160HZ\150R\230\150\209\182\231v\196D\234\216\164#U\172", -304882777)]] = ax65A[bp85E[imm84C("\r\0014E^K\233\155\014\255\204\016Y2@<\128\231\186", -84281869)]],
				[bp85E[imm84C("o\177x|\155]\202\208V\215A\230\019\005%", -915893551)]] = ax65A[bp85E[imm84C("\226\200;t)s\214\211+\2266\000\145$\031", -146084203)]],
				[bp85E[imm84C("\182\214\225\160_C\161\182\142\205\154\171", -240721075)]] = ax65A[bp85E[imm84C("7\255\134\231H7c\164nHX;", -942108751)]],
			};
		end,
		[bp85E[imm84C("\221:_\218\236m\249\173\179\'", -1048083697)]] = function()
			for bp58E, cx591 in pairs(ax65A) do
				print(string[bp85E[imm84C(" \0166\208\138\011", -1149536522)]](bp85E[imm84C("J\189S8\002\240\244-", -987067819)], bp58E, cx591));
			end;
		end,
		[bp85E[imm84C("\226e/\172+\130", -70453351)]] = function()
			dx828();
			imm66C(bp85E[imm84C("\177\181i\253\144\009\216\239\143\003\135bQ\01254\244c\153S\182Ak", -303899707)]);
		end,
		[bp85E[imm84C("\224(Vp\002\221", -495270667)]] = function()
			bp624 = true;
			(getgenv())[bp85E[imm84C("\208\143{&.\248\020\'n5Yh\215\'r", -1111917710)]] = nil;
			imm66C(bp85E[imm84C("k\231P\1958\252jS\189", -197203843)]);
		end,
		[bp85E[imm84C("\005SI\030^J\161\205I\2516", -570967057)]] = function(bp58E)
			rawset(imm6B7, bp58E, true);
			imm66C(bp85E[imm84C("\024\149\175\'\029\151O\2044\027\201\002\024>\144\191\224", -2034299522)] .. tostring(bp58E));
		end,
		[bp85E[imm84C("5\197\019\007\211\197\215\206\159z\004\211\189", -249830857)]] = function(bp58E)
			rawset(imm6B7, bp58E, nil);
		end,
		[bp85E[imm84C("JG\132g\155 X\232\180\205", -2143289216)]] = function(bp58E)
			rawset(op6ED, bp58E, true);
		end,
		[bp85E[imm84C("!\127\"\190p8iP\012A", -1288018316)]] = function(bp58E, cx591)
			rawset(bp67E, bp58E:lower(), cx591 or true);
		end,
	};
sp83A();
imm66C(bp85E[imm84C("$\009\199\241\"9\128\214o\248h\197x\183\140W\142\160\"\024\176\206", -673206337)]);
end)(...)
