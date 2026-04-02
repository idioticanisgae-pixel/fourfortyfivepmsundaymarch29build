return (function(...)
local IlllIl11I1l1l1lll11111;
do
	local l1lIl1lll1l1I111IlI = math.floor;
	local I11IIllIl11lIIII1llIl1 = string.byte;
	local I11II1IIIlI1I111llI11 = string.char;
	local lII1lI1ll1I1IIIIIIII11 = table.concat;
	local lIlllIII1l1I1II1I1III = 0x3B;
	local l1l1II1llI1IllIl1IlI = 0x1000193;
	local IIIIll1l1l1II1III11l11 = tick and tick() or os and (os.clock and os.clock()) or 0x0;
	local Il1l1IIlllll1lI11llI1 = l1lIl1lll1l1I111IlI(IIIIll1l1l1II1III11l11 * 0x3E8) % 0xFFF1 + 0x1;
	local function ll1lIIIIIlII1l1l1111I1(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		local l1111Il1I11II1I1l11111, ll11ll1I11lII1I1lll1I = 0x0, 0x1;
		while IlIIl11l1lIIIl11l11ll1 > 0x0 or I111I1l111Il1IIIl1ll1 > 0x0 do
			local I1Illl1IllIIl11II111 = IlIIl11l1lIIIl11l11ll1 % 0x2;
			local lIlIIll1Illlll1lI1IIl1 = I111I1l111Il1IIIl1ll1 % 0x2;
			if I1Illl1IllIIl11II111 ~= lIlIIll1Illlll1lI1IIl1 then
				l1111Il1I11II1I1l11111 = l1111Il1I11II1I1l11111 + ll11ll1I11lII1I1lll1I;
			end;
			IlIIl11l1lIIIl11l11ll1 = l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1 / 0x2);
			I111I1l111Il1IIIl1ll1 = l1lIl1lll1l1I111IlI(I111I1l111Il1IIIl1ll1 / 0x2);
			ll11ll1I11lII1I1lll1I = ll11ll1I11lII1I1lll1I * 0x2;
		end;
		return l1111Il1I11II1I1l11111;
	end;
	local function lI1I1IlI111IIl1ll1l1l1()
		Il1l1IIlllll1lI11llI1 = (Il1l1IIlllll1lI11llI1 * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
		return Il1l1IIlllll1lI11llI1;
	end;
	function IlllIl11I1l1l1lll11111(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		local l1111Il1I11II1I1l11111 = lI1I1IlI111IIl1ll1l1l1();
		local ll11ll1I11lII1I1lll1I = (I111I1l111Il1IIIl1ll1 * l1l1II1llI1IllIl1IlI + l1111Il1I11II1I1l11111) % 0xFFF1;
		local ll1I11llIl1l1lIIllI = #IlIIl11l1lIIIl11l11ll1;
		local I1l1IlI11l1llII11II1l1 = {};
		for I1Illl1IllIIl11II111 = 0x1, ll1I11llIl1l1lIIllI, 0x1 do
			local lIlIIll1Illlll1lI1IIl1 = I11IIllIl11lIIII1llIl1(IlIIl11l1lIIIl11l11ll1, I1Illl1IllIIl11II111);
			local l1ll11IlIIl111I1l11I1 = ll1lIIIIIlII1l1l1111I1(lIlllIII1l1I1II1I1III, (ll11ll1I11lII1I1lll1I * l1l1II1llI1IllIl1IlI + I1Illl1IllIIl11II111) % 0xFB);
			I1l1IlI11l1llII11II1l1[I1Illl1IllIIl11II111] = I11II1IIIlI1I111llI11(ll1lIIIIIlII1l1l1111I1(lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1) % 0x100);
		end;
		return lII1lI1ll1I1IIIIIIII11(I1l1IlI11l1llII11II1l1);
	end;
end;
local lIIlI1Il1l1IIlI1111ll1, l1I1l1IIl11lllI1l1ll1;
do
	local l1lIl1lll1l1I111IlI = math.floor;
	local I11IIllIl11lIIII1llIl1 = math.random;
	local I11II1IIIlI1I111llI11 = table.remove;
	local lII1lI1ll1I1IIIIIIII11 = string.char;
	local lIlllIII1l1I1II1I1III = string.byte;
	local l1l1II1llI1IllIl1IlI = string.len;
	local IIIIll1l1l1II1III11l11 = 0x19660D;
	local Il1l1IIlllll1lI11llI1 = 0xCCD1;
	local ll1lIIIIIlII1l1l1111I1 = 4294967296;
	local lI1I1IlI111IIl1ll1l1l1 = 0x3;
	local function llIIll1I1Il1Il1l1lIl1(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		local l1111Il1I11II1I1l11111, ll11ll1I11lII1I1lll1I = 0x0, 0x1;
		while IlIIl11l1lIIIl11l11ll1 > 0x0 or I111I1l111Il1IIIl1ll1 > 0x0 do
			local I1Illl1IllIIl11II111 = IlIIl11l1lIIIl11l11ll1 % 0x2;
			local lIlIIll1Illlll1lI1IIl1 = I111I1l111Il1IIIl1ll1 % 0x2;
			if I1Illl1IllIIl11II111 ~= lIlIIll1Illlll1lI1IIl1 then
				l1111Il1I11II1I1l11111 = l1111Il1I11II1I1l11111 + ll11ll1I11lII1I1lll1I;
			end;
			IlIIl11l1lIIIl11l11ll1 = l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1 / 0x2);
			I111I1l111Il1IIIl1ll1 = l1lIl1lll1l1I111IlI(I111I1l111Il1IIIl1ll1 / 0x2);
			ll11ll1I11lII1I1lll1I = ll11ll1I11lII1I1lll1I * 0x2;
		end;
		return l1111Il1I11II1I1l11111;
	end;
	local Il1I1ll1lIll111l1llI11, IlII1III111lll1lllI1I, Ill1l1Ill1l111I1ll11 = 0x0, 0x1, {};
	local llllIIIl111lll1l1I1Il1 = {};
	local l11Il1lIl111111I1IlI1 = {};
	for IlIIl11l1lIIIl11l11ll1 = 0x1, 0x100, 0x1 do
		l11Il1lIl111111I1IlI1[IlIIl11l1lIIIl11l11ll1] = IlIIl11l1lIIIl11l11ll1;
	end;
	repeat
		local IlIIl11l1lIIIl11l11ll1 = I11IIllIl11lIIII1llIl1(0x1, #l11Il1lIl111111I1IlI1);
		local I111I1l111Il1IIIl1ll1 = I11II1IIIlI1I111llI11(l11Il1lIl111111I1IlI1, IlIIl11l1lIIIl11l11ll1);
		llllIIIl111lll1l1I1Il1[I111I1l111Il1IIIl1ll1] = lII1lI1ll1I1IIIIIIII11(I111I1l111Il1IIIl1ll1 - 0x1);
	until #l11Il1lIl111111I1IlI1 == 0x0;
	local function IlIl111lIl11llI1I11lI1()
		Il1I1ll1lIll111l1llI11 = (Il1I1ll1lIll111l1llI11 * IIIIll1l1l1II1III11l11 + Il1l1IIlllll1lI11llI1) % ll1lIIIIIlII1l1l1111I1;
		IlII1III111lll1lllI1I = (IlII1III111lll1lllI1I * 0x25 + 0x7) % 0xFB + 0x1;
		return l1lIl1lll1l1I111IlI((Il1I1ll1lIll111l1llI11 + IlII1III111lll1lllI1I * 0x10001) % ll1lIIIIIlII1l1l1111I1);
	end;
	local function IlIlI1I11lII111II1lll1()
		if #Ill1l1Ill1l111I1ll11 == 0x0 then
			local I1Illl1IllIIl11II111 = IlIl111lIl11llI1I11lI1();
			Ill1l1Ill1l111I1ll11 = {
					I1Illl1IllIIl11II111 % 0x100,
					l1lIl1lll1l1I111IlI(I1Illl1IllIIl11II111 / 0x100) % 0x100,
					l1lIl1lll1l1I111IlI(I1Illl1IllIIl11II111 / 0x10000) % 0x100,
					l1lIl1lll1l1I111IlI(I1Illl1IllIIl11II111 / 0x1000000) % 0x100,
				};
		end;
		return I11II1IIIlI1I111llI11(Ill1l1Ill1l111I1ll11);
	end;
	local IllIlI1IlllIlI1111II = {};
	local function l1Il1l1llIl11I11Ill111(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		if not IllIlI1IlllIlI1111II[I111I1l111Il1IIIl1ll1] then
			Ill1l1Ill1l111I1ll11 = {};
			Il1I1ll1lIll111l1llI11 = I111I1l111Il1IIIl1ll1 % ll1lIIIIIlII1l1l1111I1;
			IlII1III111lll1lllI1I = I111I1l111Il1IIIl1ll1 % 0xFB + 0x1;
			local I1Illl1IllIIl11II111 = l1l1II1llI1IllIl1IlI(IlIIl11l1lIIIl11l11ll1);
			local lIlIIll1Illlll1lI1IIl1 = lI1I1IlI111IIl1ll1l1l1;
			local l1ll11IlIIl111I1l11I1 = {};
			for lI111lIIII1I1IlIlIl1l1 = 0x1, I1Illl1IllIIl11II111, 0x1 do
				local l1111111l1I11lII11Il1 = lIlllIII1l1I1II1I1III(IlIIl11l1lIIIl11l11ll1, lI111lIIII1I1IlIlIl1l1);
				local IIlll1lI1I1I1I1lI1lI11 = IlIlI1I11lII111II1lll1();
				local I1l1ll11lIlI1lIl1I1II = llIIll1I1Il1Il1l1lIl1(l1111111l1I11lII11Il1, llIIll1I1Il1Il1l1lIl1(IIlll1lI1I1I1I1lI1lI11, lIlIIll1Illlll1lI1IIl1)) % 0x100;
				l1ll11IlIIl111I1l11I1[lI111lIIII1I1IlIlIl1l1] = llllIIIl111lll1l1I1Il1[I1l1ll11lIlI1lIl1I1II + 0x1];
				lIlIIll1Illlll1lI1IIl1 = ((lIlIIll1Illlll1lI1IIl1 + I1l1ll11lIlI1lIl1I1II) + 0xD) % 0x100;
			end;
			IllIlI1IlllIlI1111II[I111I1l111Il1IIIl1ll1] = table.concat(l1ll11IlIIl111I1l11I1);
		end;
		return I111I1l111Il1IIIl1ll1;
	end;
	l1I1l1IIl11lllI1l1ll1 = setmetatable({}, { __index = function(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
				return IllIlI1IlllIlI1111II[I111I1l111Il1IIIl1ll1];
			end, __metatable = nil });
	function lIIlI1Il1l1IIlI1111ll1(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		return l1Il1l1llIl11I11Ill111(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1);
	end;
end;
if (getgenv())[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("WC\207\246\007\204U\134\222t\r\255\195H\131", -1830869570)]] then
	return;
end;
(getgenv())[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("8\007m\2234\251z\145\251\163\197\180\230\n\242", -576210097)]] = true;
local lIIIlIIlI1llll1llIIII = newcclosure or function(l1lIl1lll1l1I111IlI)
		return l1lIl1lll1l1I111IlI;
	end;
local ll11111I1I111I1lll1I = checkcaller or function()
		return false;
	end;
local IlIIllIl1I1lll11I11l11 = getrawmetatable;
local IIII1l1Il1111llIIlllI = setreadonly or function()
 
	end;
local lII1I1ll1Il1ll1II111I1 = hookfunction or function()
 
	end;
local lIIlI1I1IlII11lllIl1l1 = getgc or get_gc_objects or function()
		return {};
	end;
local l1IIlI1l1llIl1I11Il11 = getscriptidentity or getidentity or get_thread_identity or nil;
local I11Il11ll1IIlIlIIllI11 = setscriptidentity or setidentity or set_thread_identity or nil;
if not game:IsLoaded() then
	game[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("L\146\164\1596\184", -1737019154)]]:Wait();
end;
local IlI1III1ll1IIllll1I1I = game:GetService(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\156\236\170\143\025\202\168", -1625473478)]);
repeat
	task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\000[G>", -1942218632)]](.1);
until IlI1III1ll1IIllll1I1I and IlI1III1ll1IIllll1I1I[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("5\134S\\7~\'\174|x\161", -1900208774)]];
local Illl1I1IIl1IIIlI1l11 = IlI1III1ll1IIllll1I1I[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("m\246\167\"od\172\161Q\\\020", -2106850088)]];
local llII1I11II1Il111lIlIl1 = false;
local llllIIIIIlIII1lll1Il1 = nil;
local Il1IIllI1lll111II11lI1 = {};
local Ill11l1ll1lllIl1Illl11 = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\007\231\132\165\202\022\147]\252\136\019\141", -346171717)]] = 0x0,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\212Z\247\009\139\024\165\129\rwlz\223\142", -2082666566)]] = 0x0,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\009!\011\202&N6 g\230\180\023-\161\181Y", -1569110798)]] = 0x0,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\156\130%\202\024\181o\139J\250\005`\003>\156", -1474342850)]] = 0x0,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(",\197}\253<\002\030\145|\017\249Z\1962\178\137Y\254>", -447886693)]] = 0x0,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\228\205g\009\161~\189z,\234\2395", -1413982352)]] = 0x0,
	};
local function I1IIllIIIIII11llIIII(l1lIl1lll1l1I111IlI)
	if rconsoleprint then
		pcall(rconsoleprint, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\158\128\222\226)\235\220\137\219\203\152", -442250425)] .. (tostring(l1lIl1lll1l1I111IlI) .. l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\157", -1154582948)]));
	end;
end;
local l1l11lII11lllllII1l111 = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\006\205\227F[\156\179\136\160\182\143", -264445831)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("*\144\190(\194J9\\}\":", -1320000860)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\r\229j", -1990126910)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\174:k\016\145\242", -1156352474)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("M\003R7", -1796068892)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\133\218\179\183M\180", -1530771068)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("7\128\009\141wk\\\251", -1642447820)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("Q\210\180[\154\171\164\150\2446\252{\141\128", -192288493)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\174\137\255#\191\249\150\218\143\231\239\1492e\137\216", -1284806954)]] = true,
	};
local lI1I1IllIl11lI1l11IlI = { [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\176\011{?2\225\004\007", -746281207)]] = true, [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("o\171i\132\150\000\026\201\nC\188\145", -1290836450)]] = true };
local lIIIIII1II11lIlI111 = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("[u1\214", -1833163400)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\\\205c\1992:\241\169Z\255", -11141461)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\181\221>\141\187\219\206\227\1623`\243", -1023572485)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\002\171\233`\235]\194\ni\153\198", -1766183564)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\011\198t\015\136}S\n:f\227sY\191", -835478425)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\130\194\248\218rk\178%\154\139\145\149\195\174", -1555413356)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("*\nH>1\177\225\127<\235\214\189\218\186\027\197k\222w\213r", -1227788894)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\229\169\214\248\024B\128t\n\140\155\029\155s\211\190\130\170\\\170B\175", -203036725)]] = true,
	};
local Il1Il1II1IllII1Il1I1l1 = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\236\252Y\004\158=C", -2055402758)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\154\"\187z\167\149\223\214V\252\233\161f\223=", -1496494694)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("a\1603\168", -286794289)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\005\003\211\241", -947220715)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\161\019E\208\0204\\=\172U", -878864581)]] = true,
	};
local IIl1IlIIl111l1lll1111 = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("h\003x\179\245\236\184\008\237\204\"", -217717237)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("O\171\237 \1372+\217\243\159\009\194})", -1992813968)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\014}\137\226\130\130\182\151\247\208S\193", -345188647)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\226\227\n\002\241l\026\253\220\r[\138\2142\\", -1204457366)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\202\141\018Xe\177+pPT", -1841617802)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\211<\021\191\186z\223\146fn", -1285855562)]] = true,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\248f\228=\207\210sY\218", -1317510416)]] = true,
	};
local llllIlII1llIlII1llII11 = {
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("v\176Sg\219\026\160:\198", -2055992600)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\244:\023[\003\199\240N\173L", -2045572058)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\'Kj\020\142y\196\241\002s", -1747964000)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("q\142\1821I\127\217\016\244", -874735687)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\147\128\249)\193\229\025\187\129/\233\002z", -943681663)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("=\215c\021\191RfJ\194\154|\249", -796090087)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\173|\169F1\253#\020\249\241", -1290901988)],
	};
local llll11lI1IIl1l1l1l1II = {
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\218@!\247\236\026", -35324983)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\167\231t\232", -886925755)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("B\170\231W\207", -1950804110)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\2330q\186^\157\147", -61933411)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\157\233]\211", -778591441)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\207\029\253j\239\255B\001", -495598357)],
		l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\015\001\148", -1405331336)],
	};
local lIl1Il1I111I1IlllllI = { [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\163\251\143\135\211\220\142Y\196H\136", -1911284696)]] = true, [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\180\212\181UU\158\141$K\240", -837510103)]] = true };
local Il11l11lI1IIl1I1lIll11 = {
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("p\185\203\1678\154\016\023", -1269995366)], true, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("&44\014\149+d\198CU\226\232", -897149683)], true, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(":\156\'w\127\133l!\168\217\184\246)nC", -1165921022)], true, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\214\015\1713\218@\129g&bq]}", -357771943)], false, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("3\187\029\003uO^_\182\196\198\1357\142\156", -777542833)], false, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("Q,\171#\229\178l\167\174\194V\192\202\230pboO", -1898963552)], false, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("g\165\141\015\148\221\217\133\2501\127\192\196\254", -1218810188)], true, .5 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("k\201x\026\2354\141\145\205\239\028\0236\235", -1161857666)], true, .5 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\174\238\189\221\236\128\011\246\215i3\188\148\190\031\024", -1571470166)], false, 0x1 },
		{ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("^\142HR\144\1803}\212", -1680394322)], true, .5 },
	};
local IIlIl11Il1lIIll1III1l = 0x3;
local ll1111llIlIIl1llI1l1I1 = 0x2;
local function lIlII1II1l1lII11I1Ill1(l1lIl1lll1l1I111IlI, ...)
	local I11IIllIl11lIIII1llIl1, I11II1IIIlI1I111llI11 = pcall(l1lIl1lll1l1I111IlI, ...);
	if I11IIllIl11lIIII1llIl1 then
		return I11II1IIIlI1I111llI11;
	end;
end;
local function l1lll111111I11ll111l1(l1lIl1lll1l1I111IlI, I11IIllIl11lIIII1llIl1)
	local I11II1IIIlI1I111llI11 = IlIIllIl1I1lll11I11l11(l1lIl1lll1l1I111IlI);
	if not I11II1IIIlI1I111llI11 then
		return false;
	end;
	local lII1lI1ll1I1IIIIIIII11 = pcall(function()
			IIII1l1Il1111llIIlllI(I11II1IIIlI1I111llI11, false);
			I11IIllIl11lIIII1llIl1(I11II1IIIlI1I111llI11);
			IIII1l1Il1111llIIlllI(I11II1IIIlI1I111llI11, true);
		end);
	if not lII1lI1ll1I1IIIIIIII11 then
		pcall(IIII1l1Il1111llIIlllI, I11II1IIIlI1I111llI11, true);
	end;
	return lII1lI1ll1I1IIIIIIII11;
end;
local function IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI, I11IIllIl11lIIII1llIl1)
	if type(l1lIl1lll1l1I111IlI) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\245\222\249o\238\157\145\221", -841507921)] then
		return false;
	end;
	local I11II1IIIlI1I111llI11 = pcall(lII1I1ll1Il1ll1II111I1, l1lIl1lll1l1I111IlI, lIIIlIIlI1llll1llIIII(I11IIllIl11lIIII1llIl1));
	if not I11II1IIIlI1I111llI11 then
		return false;
	end;
	table[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\215E\0170\235\226", -1906893650)]](Il1IIllI1lll111II11lI1, l1lIl1lll1l1I111IlI);
	Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\019\239\155t\170\154\251\249I\0250z\246\137\020", -215554483)]] += 0x1;
	return true;
end;
local function Ill111111I1II111Il11I(l1lIl1lll1l1I111IlI)
	for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in ipairs(Il1IIllI1lll111II11lI1) do
		if l1lIl1lll1l1I111IlI == I111I1l111Il1IIIl1ll1 then
			return true;
		end;
	end;
	return false;
end;
local function III1lIlIlllll1Il1ll1(l1lIl1lll1l1I111IlI)
	if type(l1lIl1lll1l1I111IlI) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\127\016Z\189\143", -1806096206)] then
		return;
	end;
	pcall(function()
		IIII1l1Il1111llIIlllI(l1lIl1lll1l1I111IlI, false);
		local IlIIl11l1lIIIl11l11ll1 = IlIIllIl1I1lll11I11l11(l1lIl1lll1l1I111IlI);
		if IlIIl11l1lIIIl11l11ll1 then
			pcall(IIII1l1Il1111llIIlllI, IlIIl11l1lIIIl11l11ll1, false);
		end;
	end);
end;
for l1lIl1lll1l1I111IlI, I11IIllIl11lIIII1llIl1 in ipairs({ getgenv, getrenv, getreg }) do
	if type(I11IIllIl11lIIII1llIl1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("D\232l5\148\165\155F", -1171557290)] then
		local IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 = pcall(I11IIllIl11lIIII1llIl1);
		if IlIIl11l1lIIIl11l11ll1 and type(I111I1l111Il1IIIl1ll1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\143\019\200\232g", -2088499448)] then
			III1lIlIlllll1Il1ll1(I111I1l111Il1IIIl1ll1);
		end;
	end;
end;
local function lI11I1111ll1lI11ll1Il1(l1lIl1lll1l1I111IlI)
	if type(l1lIl1lll1l1I111IlI) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\139\180m \162", -1311218768)] then
		return 0x0;
	end;
	local I11IIllIl11lIIII1llIl1 = 0x0;
	pcall(function()
		for I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1 in ipairs(Il11l11lI1IIl1I1lIll11) do
			local l1ll11IlIIl111I1l11I1, II111lI11111ll1I1lIlI1, IIIllI11llI1l1IlIl1ll1 = lIlIIll1Illlll1lI1IIl1[0x1], lIlIIll1Illlll1lI1IIl1[0x2], lIlIIll1Illlll1lI1IIl1[0x3];
			local IIIlIlIll1lIl1Illlll1 = rawget(l1lIl1lll1l1I111IlI, l1ll11IlIIl111I1l11I1);
			if IIIlIlIll1lIl1Illlll1 ~= nil then
				if II111lI11111ll1I1lIlI1 then
					if type(IIIlIlIll1lIl1Illlll1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\153p\021\194\'t\129\000", -1756221788)] then
						I11IIllIl11lIIII1llIl1 += IIIllI11llI1l1IlIl1ll1;
					end;
				else
					I11IIllIl11lIIII1llIl1 += IIIllI11llI1l1IlIl1ll1;
				end;
			end;
		end;
	end);
	return I11IIllIl11lIIII1llIl1;
end;
local function lIIIIIl1Il11l1IlIII11()
	local l1lIl1lll1l1I111IlI;
	local I11IIllIl11lIIII1llIl1 = pcall(function()
			l1lIl1lll1l1I111IlI = lIIlI1I1IlII11lllIl1l1(true);
		end);
	if not I11IIllIl11lIIII1llIl1 or not l1lIl1lll1l1I111IlI then
		return nil;
	end;
	for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in ipairs(l1lIl1lll1l1I111IlI) do
		local l1111Il1I11II1I1l11111, ll11ll1I11lII1I1lll1I = pcall(function()
				return type(I111I1l111Il1IIIl1ll1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\175\143\131=\201", -1495839314)];
			end);
		if l1111Il1I11II1I1l11111 and (ll11ll1I11lII1I1lll1I and lI11I1111ll1lI11ll1Il1(I111I1l111Il1IIIl1ll1) >= IIlIl11Il1lIIll1III1l) then
			return I111I1l111Il1IIIl1ll1;
		end;
	end;
	return nil;
end;
local IllI1II111l1lIII1IllI1 = nil;
local function III1I11I1Ill1lIlIIIIl()
	local l1lIl1lll1l1I111IlI;
	local I11IIllIl11lIIII1llIl1 = pcall(function()
			l1lIl1lll1l1I111IlI = lIIlI1I1IlII11lllIl1l1(true);
		end);
	if not I11IIllIl11lIIII1llIl1 or not l1lIl1lll1l1I111IlI then
		return nil;
	end;
	for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in ipairs(l1lIl1lll1l1I111IlI) do
		local l1111Il1I11II1I1l11111, ll11ll1I11lII1I1lll1I = pcall(function()
				return type(I111I1l111Il1IIIl1ll1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("(\017T\000\021", -998405893)];
			end);
		if not (l1111Il1I11II1I1l11111 and ll11ll1I11lII1I1lll1I) then
			continue;
		end;
		local ll1I11llIl1l1lIIllI, I1l1IlI11l1llII11II1l1, Il111I1lllll1ll1II111, lIIII11lI1llI1III1II11, lll1Il11ll111ll1lI1II = pcall(function()
				return type(rawget(I111I1l111Il1IIIl1ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("1\152BU4\150\224a", -1564654214)])) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("T\172\169\225\253\237Ru", -822698515)], type(rawget(I111I1l111Il1IIIl1ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\230\015\141\2288\165", -273752227)])) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\023\191\212\232~/,X", -294462235)], type(rawget(I111I1l111Il1IIIl1ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\002\220\184\001\205rj\213hVb", -1674626978)])) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("hX\236j2\250\245\219", -294855463)], rawget(I111I1l111Il1IIIl1ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\142V$\177\181U\144\209\\", -1733938868)]) ~= nil;
			end);
		if ll1I11llIl1l1lIIllI and (I1l1IlI11l1llII11II1l1 and (Il111I1lllll1ll1II111 and (lIIII11lI1llI1III1II11 and lll1Il11ll111ll1lI1II))) then
			return I111I1l111Il1IIIl1ll1;
		end;
	end;
	return nil;
end;
local function Il1II1IlIlI1I1IIlI1I(l1lIl1lll1l1I111IlI)
	if not l1lIl1lll1l1I111IlI then
		return false;
	end;
	local I11IIllIl11lIIII1llIl1 = IlIIllIl1I1lll11I11l11(l1lIl1lll1l1I111IlI);
	local I11II1IIIlI1I111llI11 = pcall(function()
			if I11IIllIl11lIIII1llIl1 then
				IIII1l1Il1111llIIlllI(I11IIllIl11lIIII1llIl1, false);
			end;
			IIII1l1Il1111llIIlllI(l1lIl1lll1l1I111IlI, false);
			local IlIIl11l1lIIIl11l11ll1 = rawget(l1lIl1lll1l1I111IlI, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\225\0020R\183e\029\203", -583878043)]);
			rawset(l1lIl1lll1l1I111IlI, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("f\021\143\025R\172\018Y", -1816909976)], lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1)
				if I1Illl1IllIIl11II111 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\180", -1169132384)] then
					return true;
				end;
				if I1Illl1IllIIl11II111 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\001\187\189\008", -1536931640)] or I1Illl1IllIIl11II111 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("&", -679432447)] or I1Illl1IllIIl11II111 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(":8f)\128", -1997532704)] or I1Illl1IllIIl11II111 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("e", -135860275)] then
					Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\\\244\224\204|G\241\212\135&\161\174", -1232769782)]] += 0x1;
					I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\234\144\0035\012\021\240\221)\132\025", -667570069)] .. (tostring(I1Illl1IllIIl11II111) .. (l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\001\190\237", -1706150756)] .. tostring(lIlIIll1Illlll1lI1IIl1))));
					return true;
				end;
				if IlIIl11l1lIIIl11l11ll1 then
					pcall(IlIIl11l1lIIIl11l11ll1, I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1);
				end;
				Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\133\247J\167\237\247\128[8\135\006\161\147m\004C", -551698885)]] += 0x1;
				return true;
			end));
			rawset(l1lIl1lll1l1I111IlI, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\159\151\242-\2529", -1381147814)], lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1)
 
			end));
			IIII1l1Il1111llIIlllI(l1lIl1lll1l1I111IlI, true);
			if I11IIllIl11lIIII1llIl1 then
				IIII1l1Il1111llIIlllI(I11IIllIl11lIIII1llIl1, true);
			end;
		end);
	if I11II1IIIlI1I111llI11 then
		IllI1II111l1lIII1IllI1 = l1lIl1lll1l1I111IlI;
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\004\148\027\003\140\n\134\002(\246\203\023\004\021\137\178\188\128", -267067351)]);
		return true;
	else
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("1\187\202\137\r\196\228\012U@\175e\001\198&,5\129", -814965031)]);
		return false;
	end;
end;
local function lll1I1lIIllIl1lI11Il11(l1lIl1lll1l1I111IlI)
	if not l1lIl1lll1l1I111IlI then
		return;
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\254I\163\"\005 ad", -347416939)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\200\244y\185\012.@\r", -1588575584)] then
		IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("d<\164I\224\174m\230", -59705119)]], function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1)
			if I1Illl1IllIIl11II111 ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("f", -448083307)] then
				Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\167\252\139\144N8\186!\196\171\149}j\146\143\000", -1499443904)]] += 0x1;
			end;
			return true;
		end);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\215i\174\213Q\148\196\195\155Rm\012", -280830331)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\213\210,%\228\186\144\140", -1367384834)] then
		IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("[\185WN\203\012-$\025\024\133\169", -1473163166)]], function(...)
			Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\219\245\177n\011\007\000{s\154\163j", -864970525)]] += 0x1;
		end);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\012\250\196\241\140\161+\227\161^QV\166\237\017", -989885953)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("?q\149rR\160\199\157", -1619312906)] then
		IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\131\185\028\196I$\190\171na#\224`[\015", -1486663994)]], function(...)
			Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("[\026\174|\219\190\134kF\157Z0\240S6\225.\169\157", -567886771)]] += 0x1;
		end);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\236D\029\253\129a\199\17605P5\185\153", -793075339)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("TV\183\243\170\1796\208", -310584583)] then
		IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\138,@\197\159\204P\208q\165\205_\1705", -829973233)]], function(...)
			return nil;
		end);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("3>B\201\164\020\162@\004#\250\230\242T", -2030170628)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("I\129\"\254\133\223]\012", -2044326836)] then
		IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\016cH;\018\226\1968\014\016\180\027\215Y", -1659356624)]], function(...)
 
		end);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\031\012\168\226c\184\018TT\183\011\178C", -1328389724)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("K\024\245\'\202", -360131311)] then
		local IlIIl11l1lIIIl11l11ll1 = getmetatable(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("M\172BU\248\226\r\213\250,\029\200&", -1559804402)]]) or {};
		rawset(IlIIl11l1lIIIl11l11ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\023\140\003A\135\202\014", -1145604242)], function()
			return false;
		end);
		rawset(IlIIl11l1lIIIl11l11ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\203\150n\142\024^\235>\'-", -1846205462)], function()
 
		end);
		rawset(IlIIl11l1lIIIl11l11ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\206\198M,f", -1176407102)], function()
			return 0x0;
		end);
		pcall(setmetatable, l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\253Z\011\247\194.\165\001\209\216A!\226", -545800465)]], IlIIl11l1lIIIl11l11ll1);
	end;
	if type(l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\200n\150\222\201\127\000f\190\194\167\022\202\007x", -21562003)]]) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\199B4\031\143", -120983149)] then
		local IlIIl11l1lIIIl11l11ll1 = {};
		rawset(IlIIl11l1lIIIl11l11ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\235NWi\007\233\226", -1414637732)], function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1)
			return { {
					[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\026\"", -168301585)]] = lIlIIll1Illlll1lI1IIl1,
					[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\220l\143\215R\199\0175", -616384891)]] = Illl1I1IIl1IIIlI1l11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\146Q\129\026", -675565705)]],
					[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\146\247\243\197\001\252\2467M\155\215", -1294506578)]] = Illl1I1IIl1IIIlI1l11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("f0\246L\000\170\003K\025p\016", -281223559)]],
					[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\154\003`/\017\147", -755980831)]] = Illl1I1IIl1IIIlI1l11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("_\199B_V\138", -1762120208)]],
				} };
		end);
		rawset(IlIIl11l1lIIIl11l11ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\243\168{Jxh\200\128\160\156", -1878515696)], function()
 
		end);
		pcall(setmetatable, l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\015fO\006\152;\147\199\180\207\rY(\197\198", -575227027)]], IlIIl11l1lIIIl11l11ll1);
	end;
	if l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("K\245\193\196\199N\157\144\182\165\236\020\250\251\008\165\2103", -249568705)]] ~= nil then
		pcall(function()
			l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("}\211\199t\150\133\168\213\168\230\233\154X\171\005q\003\167", -1940449106)]] = math[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\148\014\031\193", -1712901170)]];
		end);
	end;
	if l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\163\028*}\200\"\203\246\004\14077-&\209\168", -186586687)]] ~= nil then
		pcall(function()
			l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\014\242\224o@\150{\153\148Q\243\149t\196\224\030", -1257346532)]] = false;
		end);
	end;
end;
local function l1I1lII1I1I1lllIl11lI()
	local l1lIl1lll1l1I111IlI = tostring(Illl1I1IIl1IIIlI1l11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\224_\216\154X`", -1391830508)]]);
	local I11IIllIl11lIIII1llIl1;
	local I11II1IIIlI1I111llI11 = pcall(function()
			I11IIllIl11lIIII1llIl1 = lIIlI1I1IlII11lllIl1l1(true);
		end);
	if not I11II1IIIlI1I111llI11 or not I11IIllIl11lIIII1llIl1 then
		return;
	end;
	for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in ipairs(I11IIllIl11lIIII1llIl1) do
		local l1111Il1I11II1I1l11111, ll11ll1I11lII1I1lll1I = pcall(function()
				return type(I111I1l111Il1IIIl1ll1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\0280\133q ", -669732823)];
			end);
		if not (l1111Il1I11II1I1l11111 and ll11ll1I11lII1I1lll1I) then
			continue;
		end;
		local ll1I11llIl1l1lIIllI, I1l1IlI11l1llII11II1l1, Il111I1lllll1ll1II111 = pcall(function()
				return rawget(I111I1l111Il1IIIl1ll1, l1lIl1lll1l1I111IlI), rawget(I111I1l111Il1IIIl1ll1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\238~\163{M\169", -1471590254)]);
			end);
		if not (ll1I11llIl1l1lIIllI and type(I1l1IlI11l1llII11II1l1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("kd\225\226-", -457455241)]) then
			continue;
		end;
		local lIIII11lI1llI1III1II11, lll1Il11ll111ll1lI1II = pcall(function()
				return rawget(I1l1IlI11l1llII11II1l1, l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\190\247\n\019jN\241\006M8", -2063398394)]) ~= nil;
			end);
		if lIIII11lI1llI1III1II11 and (lll1Il11ll111ll1lI1II and Il111I1lllll1ll1II111 ~= nil) then
			task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\152\146\031\167f", -857368117)]](function()
				while not llII1I11II1Il111lIlIl1 do
					task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("?\227\003a", -1100645174)]](0x8);
					pcall(function()
						local IIlll1I1IlIIII11III1l1 = I111I1l111Il1IIIl1ll1[l1lIl1lll1l1I111IlI];
						if IIlll1I1IlIIII11III1l1 then
							IIlll1I1IlIIII11III1l1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("J\196\183\179\207\141\234\223\183\217", -2071918334)]] = os[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\214\219hI", -1071218611)]]();
							IIlll1I1IlIIII11III1l1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("P\131Q\172g?\165\154%\025\157@", -1982000198)]] = true;
						end;
					end);
				end;
			end);
		end;
	end;
end;
local function l1l1I1IllllI1II1l1()
	local l1lIl1lll1l1I111IlI = getnamecallmethod;
	l1lll111111I11ll111l1(game, function(IlIIl11l1lIIIl11l11ll1)
		local I111I1l111Il1IIIl1ll1 = IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\139<\244\157\219\150\226l\022\151", -2095905242)]];
		IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("#\142M\151\200Lm\178\008\188", -277881121)]] = lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, ...)
				if ll11111I1I111I1lll1I() then
					return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, ...);
				end;
				if type(I1Illl1IllIIl11II111) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("y\248v\179Q\'\018\179", -785145241)] and typeof(I1Illl1IllIIl11II111) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\140\225\232\136L\235Z\215", -353315359)] then
					return nil;
				end;
				local lIlIIll1Illlll1lI1IIl1 = l1lIl1lll1l1I111IlI();
				if rawget(Il1Il1II1IllII1Il1I1l1, lIlIIll1Illlll1lI1IIl1) then
					return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, ...);
				end;
				if not rawget(lIIIIII1II11lIlI111, lIlIIll1Illlll1lI1IIl1) then
					return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, ...);
				end;
				if lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(" B\241l", -2048062502)] and I1Illl1IllIIl11II111 == Illl1I1IIl1IIIlI1l11 then
					local lI111lIIII1I1IlIlIl1l1 = (tostring(... or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("", -865494829)])):lower();
					for llIIlll1Il1ll1IIIIlI = 0x1, #llll11lI1IIl1l1l1l1II, 0x1 do
						if lI111lIIII1I1IlIlIl1l1:find(llll11lI1IIl1l1l1l1II[llIIlll1Il1ll1IIIIlI], 0x1, true) then
							Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\243\130\254u\025\252\206v\022\194ga", -2106587936)]] += 0x1;
							return nil;
						end;
					end;
				end;
				if lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\149p\243~z\254\135|\134 ", -1803998990)] or lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("w\165o\190D\026\024},|\199o", -1873665884)] then
					local lI111lIIII1I1IlIlIl1l1;
					local l1111111l1I11lII11Il1 = pcall(function()
							lI111lIIII1I1IlIlIl1l1 = I1Illl1IllIIl11II111[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("#6*W", -603932671)]];
						end);
					if l1111111l1I11lII11Il1 and rawget(IIl1IlIIl111l1lll1111, lI111lIIII1I1IlIlIl1l1) then
						Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("5\017\003lKzi\160s\017\221\215\216\\", -65406925)]] += 0x1;
						if lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("4L\214<F\232\178%\251\157c\130", -1879695380)] then
							return l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\171s\026U", -1087078808)];
						end;
						return nil;
					end;
					Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\195\004\139\252\001\226_;.\240\246e", -619661791)]] += 0x1;
				end;
				if lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\148\026\206Z\030\203,\216\1272\015", -1937237744)] or lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\207\007t\004\194\238\205\230\231\253\242>\015\134", -1551350000)] then
					local lI111lIIII1I1IlIlIl1l1 = I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, ...);
					if type(lI111lIIII1I1IlIlIl1l1) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("%\004+\230\012", -325002943)] then
						return lI111lIIII1I1IlIlIl1l1;
					end;
					local l1111111l1I11lII11Il1 = false;
					for llIIlll1Il1ll1IIIIlI = 0x1, #lI111lIIII1I1IlIlIl1l1, 0x1 do
						local IlII1lllIIlIII1lI1l111, I1111l1I11lI1II1I1llI = pcall(function()
								return lI111lIIII1I1IlIlIl1l1[llIIlll1Il1ll1IIIIlI][l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\1690\187r", -165745603)]];
							end);
						if IlII1lllIIlIII1lI1l111 and rawget(lIl1Il1I111I1IlllllI, I1111l1I11lI1II1I1llI) then
							l1111111l1I11lII11Il1 = true;
							break;
						end;
					end;
					if not l1111111l1I11lII11Il1 then
						return lI111lIIII1I1IlIlIl1l1;
					end;
					local IIlll1lI1I1I1I1lI1lI11, I1l1ll11lIlI1lIl1I1II = {}, 0x0;
					for llIIlll1Il1ll1IIIIlI = 0x1, #lI111lIIII1I1IlIlIl1l1, 0x1 do
						local IlII1lllIIlIII1lI1l111, I1111l1I11lI1II1I1llI = pcall(function()
								return lI111lIIII1I1IlIlIl1l1[llIIlll1Il1ll1IIIIlI][l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\163\221\160:", -1104970682)]];
							end);
						if not (IlII1lllIIlIII1lI1l111 and rawget(lIl1Il1I111I1IlllllI, I1111l1I11lI1II1I1llI)) then
							I1l1ll11lIlI1lIl1I1II = I1l1ll11lIlI1lIl1I1II + 0x1;
							IIlll1lI1I1I1I1lI1lI11[I1l1ll11lIlI1lIl1I1II] = lI111lIIII1I1IlIlIl1l1[llIIlll1Il1ll1IIIIlI];
						end;
					end;
					return IIlll1lI1I1I1I1lI1lI11;
				end;
				if lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(")\2371\2005(\026\217U-7\222\023\180", -1070759845)] or lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("?4\193\171N\142\173\131\162J\022S\150\212w<w,\244\130\140", -720262621)] or lIlIIll1Illlll1lI1IIl1 == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\235$\200\162\129y\014V\203\222d3\000\183,Y\231\208\2429\'\"", -1989274916)] then
					if rawget(lIl1Il1I111I1IlllllI, tostring(... or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("", -2029515248)])) then
						return nil;
					end;
				end;
				return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, ...);
			end);
	end);
end;
local function I1IllI1II1IIlllI1l11l1()
	l1lll111111I11ll111l1(game, function(IlIIl11l1lIIIl11l11ll1)
		local I111I1l111Il1IIIl1ll1 = IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\031\201>\007\229\235\212", -1564850828)]];
		local l1111Il1I11II1I1l11111 = IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("h\187\008Q\188\149\024\225\2446", -1535817494)]];
		IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\201\192\229$A\175\204", -1444523060)]] = lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, ...)
				if ll11111I1I111I1lll1I() then
					return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, ...);
				end;
				if type(I1Illl1IllIIl11II111) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\194r}c\178O\199\245", -1636156172)] and typeof(I1Illl1IllIIl11II111) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\017\254\177\190\246R\239\031", -2087123150)] then
					return nil;
				end;
				if type(lIlIIll1Illlll1lI1IIl1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("_\158zgg\017", -688149001)] and rawget(l1l11lII11lllllII1l111, lIlIIll1Illlll1lI1IIl1) then
					return nil;
				end;
				return I111I1l111Il1IIIl1ll1(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, ...);
			end);
		IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\129c\216\217?\137\\F\210\170", -1297783478)]] = lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1, ...)
				if ll11111I1I111I1lll1I() then
					if l1111Il1I11II1I1l11111 then
						return l1111Il1I11II1I1l11111(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1, ...);
					end;
					return rawset(I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1);
				end;
				if rawget(lI1I1IllIl11lI1l11IlI, lIlIIll1Illlll1lI1IIl1) then
					return;
				end;
				if type(l1ll11IlIIl111I1l11I1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("}\172(\1501_\131\222", -1006008301)] then
					return;
				end;
				if l1111Il1I11II1I1l11111 then
					pcall(l1111Il1I11II1I1l11111, I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1, ...);
				else
					pcall(rawset, I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1, l1ll11IlIIl111I1l11I1);
				end;
			end);
	end);
	local l1lIl1lll1l1I111IlI = lIlII1II1l1lII11I1Ill1(function()
			return game:GetService(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("P\242\217\"q\139\216\025\027", -246947185)]);
		end);
	if l1lIl1lll1l1I111IlI and IlIIllIl1I1lll11I11l11(l1lIl1lll1l1I111IlI) ~= IlIIllIl1I1lll11I11l11(game) then
		l1lll111111I11ll111l1(l1lIl1lll1l1I111IlI, function(I1Illl1IllIIl11II111)
			local lIlIIll1Illlll1lI1IIl1 = I1Illl1IllIIl11II111[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("U\196\006.y\025\223", -1717488830)]];
			I1Illl1IllIIl11II111[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\008\nqe(\018\138", -748509499)]] = lIIIlIIlI1llll1llIIII(function(lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, ...)
					if ll11111I1I111I1lll1I() then
						return lIlIIll1Illlll1lI1IIl1(lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, ...);
					end;
					if type(lI111lIIII1I1IlIlIl1l1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\026\197\186\167N6|\009", -2071852796)] and typeof(lI111lIIII1I1IlIlIl1l1) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("q\144>\193\242\029\022\238", -1316265194)] then
						return nil;
					end;
					if type(l1111111l1I11lII11Il1) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("l\187`F\002;", -1769984768)] and rawget(l1l11lII11lllllII1l111, l1111111l1I11lII11Il1) then
						return nil;
					end;
					return lIlIIll1Illlll1lI1IIl1(lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, ...);
				end);
		end);
	end;
	local I11IIllIl11lIIII1llIl1 = IlIIllIl1I1lll11I11l11(Enum);
	if I11IIllIl11lIIII1llIl1 then
		pcall(function()
			IIII1l1Il1111llIIlllI(I11IIllIl11lIIII1llIl1, false);
			local I1Illl1IllIIl11II111 = I11IIllIl11lIIII1llIl1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\016\232\207_\236k\232#-\244", -611993845)]];
			I11IIllIl11lIIII1llIl1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\156\234V\028V\200x\176\185y", -929263303)]] = lIIIlIIlI1llll1llIIII(function(lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, IIlll1lI1I1I1I1lI1lI11, ...)
					if ll11111I1I111I1lll1I() then
						if I1Illl1IllIIl11II111 then
							return I1Illl1IllIIl11II111(lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, IIlll1lI1I1I1I1lI1lI11, ...);
						end;
						return;
					end;
					if rawget(lI1I1IllIl11lI1l11IlI, l1111111l1I11lII11Il1) then
						return;
					end;
					if I1Illl1IllIIl11II111 then
						pcall(I1Illl1IllIIl11II111, lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1, IIlll1lI1I1I1I1lI1lI11, ...);
					end;
				end);
			IIII1l1Il1111llIIlllI(I11IIllIl11lIIII1llIl1, true);
		end);
	end;
end;
local function I1lIII1l1II11lI1Ill11()
	if not l1IIlI1l1llIl1I11Il11 then
		return;
	end;
	pcall(lII1I1ll1Il1ll1II111I1, l1IIlI1l1llIl1I11Il11, lIIIlIIlI1llll1llIIII(function(...)
		if ll11111I1I111I1lll1I() then
			return l1IIlI1l1llIl1I11Il11(...);
		end;
		return ll1111llIlIIl1llI1l1I1;
	end));
	if I11Il11ll1IIlIlIIllI11 then
		pcall(lII1I1ll1Il1ll1II111I1, I11Il11ll1IIlIlIIllI11, lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, ...)
			if ll11111I1I111I1lll1I() then
				return I11Il11ll1IIlIlIIllI11(I1Illl1IllIIl11II111, ...);
			end;
		end));
	end;
	for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in ipairs({ l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\176\030\212bs4\241\135\183/&", -982086931)], l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\230\006h\008\220|\134\031\145E\"\1548\156\021}\005\175\n", -657083989)], l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\151\017\136\177M\214D\170\142\190\197W\198\174\185\153\233", -1106936822)] }) do
		local l1111Il1I11II1I1l11111 = rawget(getgenv(), I111I1l111Il1IIIl1ll1) or rawget(getrenv(), I111I1l111Il1IIIl1ll1);
		if l1111Il1I11II1I1l11111 and (l1111Il1I11II1I1l11111 ~= l1IIlI1l1llIl1I11Il11 and type(l1111Il1I11II1I1l11111) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\195)\194\146\188\1434\184", -1184927042)]) then
			pcall(lII1I1ll1Il1ll1II111I1, l1111Il1I11II1I1l11111, lIIIlIIlI1llll1llIIII(function(...)
				if ll11111I1I111I1lll1I() then
					return l1111Il1I11II1I1l11111(...);
				end;
				return ll1111llIlIIl1llI1l1I1;
			end));
		end;
	end;
end;
local function ll1I1Il111IIll1lll1I11()
	local function l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1)
		if type(IlIIl11l1lIIIl11l11ll1) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\003\022\128@\135\134\144\252", -333522883)] then
			return;
		end;
		pcall(lII1I1ll1Il1ll1II111I1, IlIIl11l1lIIIl11l11ll1, lIIIlIIlI1llll1llIIII(function(I1Illl1IllIIl11II111, ...)
			if Ill111111I1II111Il11I(I1Illl1IllIIl11II111) then
				return I111I1l111Il1IIIl1ll1;
			end;
			return IlIIl11l1lIIIl11l11ll1(I1Illl1IllIIl11II111, ...);
		end));
	end;
	l1lIl1lll1l1I111IlI(debug[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\215\008\192\024", -1261540964)]] or debug[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\174\"\248\252/\136\030", -1979247602)]], nil);
	l1lIl1lll1l1I111IlI(debug[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("|\168\230q\151I\218\142\142|\155", -967603033)]], {});
	l1lIl1lll1l1I111IlI(debug[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\020(?Ab>\193\173\175", -1072070605)]], {});
	l1lIl1lll1l1I111IlI(debug[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("M\201U8\190\014\255\154\149r\178\219", -551961037)]], {});
end;
local function ll11lIll1l1I1ll1lllII()
	local l1lIl1lll1l1I111IlI = Illl1I1IIl1IIIlI1l11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("/\222*|", -734877595)]];
	IIlI11lIIIIII11l1Il111(l1lIl1lll1l1I111IlI, function(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1, ...)
		if ll11111I1I111I1lll1I() then
			return l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1, ...);
		end;
		if IlIIl11l1lIIIl11l11ll1 == Illl1I1IIl1IIIlI1l11 then
			local I1Illl1IllIIl11II111 = (tostring(I111I1l111Il1IIIl1ll1 or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("", -647187751)])):lower();
			for lI111lIIII1I1IlIlIl1l1, l1111111l1I11lII11Il1 in ipairs(llll11lI1IIl1l1l1l1II) do
				if I1Illl1IllIIl11II111:find(l1111111l1I11lII11Il1, 0x1, true) then
					Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("3\225\174\127{\128~7,E\131\245", -876963979)]] += 0x1;
					return nil;
				end;
			end;
		end;
		return l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1, ...);
	end);
end;
local lI1llI11Il1Il1IlII11;
lI1llI11Il1Il1IlII11 = lII1I1ll1Il1ll1II111I1((getrenv())[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("|\226\164\212o\027\031", -1607712680)]], lIIIlIIlI1llll1llIIII(function(l1lIl1lll1l1I111IlI)
		if ll11111I1I111I1lll1I() then
			return lI1llI11Il1Il1IlII11(l1lIl1lll1l1I111IlI);
		end;
		if typeof(l1lIl1lll1l1I111IlI) == l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\242\008\130d\135>0\n", -858547801)] then
			local IlIIl11l1lIIIl11l11ll1 = l1lIl1lll1l1I111IlI[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\218d\186\213", -2068379282)]]:lower();
			if IlIIl11l1lIIIl11l11ll1:find(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("y\166\166\215\205\145", -1341235172)], 0x1, true) or IlIIl11l1lIIIl11l11ll1:find(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\215&\183\150", -816537943)], 0x1, true) or IlIIl11l1lIIIl11l11ll1:find(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("PW\192\232\\ ", -21627541)], 0x1, true) then
				return setmetatable({}, { [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\162\182\193\026\014V\128", -1245418616)]] = function()
						return function()
 
						end;
					end, [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\247\244Q\1449W\212|&\190", -1164741338)]] = function()
 
					end, [l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("&Z\144\1328\164", -2122382594)]] = function()
						return {};
					end });
			end;
		end;
		return lI1llI11Il1Il1IlII11(l1lIl1lll1l1I111IlI);
	end));
local function II111II1l1l1IllllIIIl1()
	local function l1lIl1lll1l1I111IlI(IlIIl11l1lIIIl11l11ll1)
		if typeof(IlIIl11l1lIIIl11l11ll1) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("7\191\207\144\174\162\212\024\158\164!", -222435973)] and typeof(IlIIl11l1lIIIl11l11ll1) ~= l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\132?\167\232\127t\233\1312\029\165\029\1317", -1160612444)] then
			return;
		end;
		local I111I1l111Il1IIIl1ll1, l1111Il1I11II1I1l11111 = pcall(function()
				return IlIIl11l1lIIIl11l11ll1[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("qQ_x", -2051208326)]];
			end);
		if not I111I1l111Il1IIIl1ll1 then
			return;
		end;
		local ll11ll1I11lII1I1lll1I = l1111Il1I11II1I1l11111:lower();
		for I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1 in ipairs(llllIlII1llIlII1llII11) do
			if ll11ll1I11lII1I1lll1I:find(lIlIIll1Illlll1lI1IIl1, 0x1, true) then
				rawset(IIl1IlIIl111l1lll1111, l1111Il1I11II1I1l11111, true);
				break;
			end;
		end;
	end;
	pcall(function()
		for I1Illl1IllIIl11II111, lIlIIll1Illlll1lI1IIl1 in ipairs(game:GetDescendants()) do
			l1lIl1lll1l1I111IlI(lIlIIll1Illlll1lI1IIl1);
		end;
	end);
	pcall(function()
		game[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\174\200\154\1337^\213M\192e{x\194_\238", -1748357228)]]:Connect(function(I1Illl1IllIIl11II111)
			task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\r\224c\203\172", -1270454132)]](l1lIl1lll1l1I111IlI, I1Illl1IllIIl11II111);
		end);
	end);
end;
local function Illl1l1I1ll1IlI1lI1I1()
	local l1lIl1lll1l1I111IlI = lIIIIIl1Il11l1IlIII11();
	if l1lIl1lll1l1I111IlI and l1lIl1lll1l1I111IlI ~= llllIIIIIlIII1lll1Il1 then
		llllIIIIIlIII1lll1Il1 = l1lIl1lll1l1I111IlI;
		lll1I1lIIllIl1lI11Il11(l1lIl1lll1l1I111IlI);
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\158\143\213 \020\212\251\166\239\234\247\193 \242\020{\130\'U.\229&}\011\162\007i\205\131\128\1413\182\182\1588f\236B\246|\235\216\138\1705Z\216\214\131\1458Nn", -1514386568)]);
	end;
	if not IllI1II111l1lIII1IllI1 then
		local IlIIl11l1lIIIl11l11ll1 = III1I11I1Ill1lIlIIIIl();
		if IlIIl11l1lIIIl11l11ll1 then
			Il1II1IlIlI1I1IIlI1I(IlIIl11l1lIIIl11l11ll1);
		end;
	end;
	l1I1lII1I1I1lllIl11lI();
end;
local function l1I1llI11I11Ill111IlI1()
	l1l1I1IllllI1II1l1();
	I1IllI1II1IIlllI1l11l1();
	I1lIII1l1II11lI1Ill11();
	ll1I1Il111IIll1lll1I11();
	ll11lIll1l1I1ll1lllII();
	II111II1l1l1IllllIIIl1();
	llllIIIIIlIII1lll1Il1 = lIIIIIl1Il11l1IlIII11();
	if llllIIIIIlIII1lll1Il1 then
		lll1I1lIIllIl1lI11Il11(llllIIIIIlIII1lll1Il1);
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\163!\195\250\188\136\255]1\191\001V\233\157^`\234(\175\146\144\254\213\207\178s\224\228\235\225\189\221\140\161Q\165\216\1298W\r\025\021\146\175", -2144796590)]);
	else
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\222\200u}\164V\148\226\017\025@)flI\184l\206\221{\210Q<N\243\023\183\\8\151\236\131\136\181\205[R\029\169\027\154\214\156!b\228\245H", -1714932848)]);
	end;
	local l1lIl1lll1l1I111IlI = III1I11I1Ill1lIlIIIIl();
	if l1lIl1lll1l1I111IlI then
		Il1II1IlIlI1I1IIlI1I(l1lIl1lll1l1I111IlI);
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\007\166\219\144\159\253\246\233]\211\208\009.\210\1347P\211\0084>\213\137g\171\138,\211\187\178\133\164x\182\171c\170\143\145\149\011\007", -230497147)]);
	else
		I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\0202\014k\205\243\175y,3\197`\194\204X\018\144V}\235\241##\216\166\166^\244\158a[\150\215g\208\129\163\219\169\009\175\005\030X\239e\240\255\128 \186", -660229813)]);
	end;
	l1I1lII1I1I1lllIl11lI();
	task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\026S\146\206\181", -157291201)]](function()
		while not llII1I11II1Il111lIlIl1 do
			task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\251\252{\020", -2020143314)]](0xF);
			Illl1l1I1ll1IlI1lI1I1();
		end;
	end);
	task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\240\236I\161\142", -1190366696)]](function()
		while not llII1I11II1Il111lIlIl1 do
			task[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\023\229\161\131", -932933431)]](0x3C);
			I1IIllIIIIII11llIIII(string[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(", \191\133\129\195", -53937775)]](l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\016B\250\016/\152\230{T\195\186\233;*\159\221n\005\228=\245\134\166\236\148\030\246\17816\248\018Z\210/\149)\008\029`\128\193<\129g`\129\142\148\254]&q\165\024\174\187\221\244\187\194\028*\149\180\239\232\157\168\"D\130;x\193\005:", -1885135034)], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\185x\246I\004\255\201a9\196\014O", -2129853926)]], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\238\221\188\186G\202qo\144\132\001\245u\133", -1062174367)]], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\169\134\187g\236\198\201\149\239X\022\245\149\015\171\163", -793534105)]], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\'-1\152\230\232}\163\218K\022\251}\212\195\238eId", -734549905)]], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("$\rA\140\020\217\252\150\182\189=:\197X\009", -1911219158)]], Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\008\215\180\210\135\243r\235\141ap\175", -1240765418)]]));
		end;
	end);
end;
(getgenv())[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\183\023\235\220\140\196\000\r", -1794627056)]] = {
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\012)\019{T\015\254", -1396156016)]] = l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("~\n\200", -612976915)],
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\187\023\145wKb\142\248", -244325665)]] = function()
			return {
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("P\168\237\145\020J\001\249\243v-\233", -32965615)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("u&\224\197\172.\187\140\237|D\185", -1895817728)]],
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\164&\189<\154\224\015\169\197\\\018u\141\029", -1864359488)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("UA\203p\141\132\127v\193swa/1", -1581628556)]],
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\226\245c0\188\239\008\014\002<\127\025A\134\223\148", -850683241)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\132\020\015\137\174\229\\\224\133\197\195M\155\145;\018", -1953818858)]],
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("N\003\188{\148\230\011\029`Z\178\223+R,y\207\207\197", -1140885506)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\230t~\000d\139\223Cx\184\148\004\231\'\194\016\225+7", -1629930062)]],
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("|\159YM\220\135x_jl[\245\192\002\182", -1204195214)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(":\019\'\225X\229\176\175V\138\023\017\184^=", -1968958136)]],
				[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("UT1\132\171\148u\176\208\173ua", -891972181)]] = Ill11l1ll1lllIl1Illl11[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\205\142\168\202\202\157D\178\169\164\165z", -357116563)]],
			};
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\183\201\147\216ER\168=\000\029", -1790694776)]] = function()
			for IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1 in pairs(Ill11l1ll1lllIl1Illl11) do
				I1IIllIIIIII11llIIII(string[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\254,\186\201\030\186", -1268946758)]](l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("f\153N!V(\220\023", -2099771984)], IlIIl11l1lIIIl11l11ll1, I111I1l111Il1IIIl1ll1));
			end;
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("(\128\127&+\023", -1142786108)]] = function()
			I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\227\009\031(j\132V\"m\230\136\148\151\028\149U\149\159k\2486\141r\184bf\251", -336930859)] .. (llllIIIIIlIII1lll1Il1 and l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("j\188>S\223\009", -1330552478)] or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("u_\017\175#F\019!\130", -255139435)]));
			I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\"\226\027\186\196i\024b\023M\249\165\148l\179\139\227\011\196\151{%e\236Z?\222z\247r", -1644086270)] .. (IllI1II111l1lIII1IllI1 and l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\020H\233\138Z\181", -1016297767)] or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("A\218y\026+\197i\027\224", -1421125994)]));
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\242n^^\186\252:\201X\173s\254\244\251\132\176\218", -1923474764)]] = function()
			local l1lIl1lll1l1I111IlI = lIIIIIl1Il11l1IlIII11();
			if l1lIl1lll1l1I111IlI then
				lll1I1lIIllIl1lI11Il11(l1lIl1lll1l1I111IlI);
				llllIIIIIlIII1lll1Il1 = l1lIl1lll1l1I111IlI;
				I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("t\210$S\156/\227Pt\012\001\134\187[\199 zYT}\197lUa\193\147\160\170", -201791503)]);
			else
				I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("p\166\241l\198F;V\"\229\133\191\024\022~Q\226\239P}`\193\241|\185\162||\156\209\232", -867329893)]);
			end;
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\138\1581=\226\025\163\205\232\001\015\0257\129\184xo\159J", -955019737)]] = function()
			local l1lIl1lll1l1I111IlI = III1I11I1Ill1lIlIIIIl();
			if l1lIl1lll1l1I111IlI then
				local IlIIl11l1lIIIl11l11ll1 = Il1II1IlIlI1I1IIlI1I(l1lIl1lll1l1I111IlI);
				I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\018.\171\210\189b\163\003\139\199\031\144d\222D)_\133H\0183u~\224\246\243\178,\024", -1837226756)] .. (IlIIl11l1lIIIl11l11ll1 and l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("{\242t\253\149\177\220", -405286993)] or l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\161\194\144\247C\012", -1064468197)]));
			else
				I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1(")\153\139\214\190\231\024b\2374\165\189q\1411\1413M&\248\00681\195\228c>A-\138\'\167\225\175", -1114735844)]);
			end;
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("9\134\208F\138\194", -1803081458)]] = function()
			Illl1l1I1ll1IlI1lI1I1();
			I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\254\'\148E\167\217D<\169U\226\172\183\158\154\250\255C\1403i\221\232", -1767756476)]);
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\128<\029]\138\011", -1517335778)]] = function()
			llII1I11II1Il111lIlIl1 = true;
			(getgenv())[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\233C\1912D\143\2351\242\139]\236\2474U", -98503615)]] = nil;
			I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("Q%2\021\213\163\234\149\137", -181147033)]);
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\177\194\023L\009}$\192\242\255\216", -482752909)]] = function(l1lIl1lll1l1I111IlI)
			rawset(IIl1IlIIl111l1lll1111, l1lIl1lll1l1I111IlI, true);
			I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\222\022~8\156}xF\200\161k\246\171=\157\028.", -558449299)] .. tostring(l1lIl1lll1l1I111IlI));
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\203\171\214 \193\131B\174\028\171a\n\245", -1314561206)]] = function(l1lIl1lll1l1I111IlI)
			rawset(IIl1IlIIl111l1lll1111, l1lIl1lll1l1I111IlI, nil);
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("8\127\197t,\202\177Q\210\246", -428356369)]] = function(l1lIl1lll1l1I111IlI)
			rawset(lIl1Il1I111I1IlllllI, l1lIl1lll1l1I111IlI, true);
		end,
		[l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("[a.yJ\242\179\025We", -2052060320)]] = function(l1lIl1lll1l1I111IlI, I11IIllIl11lIIII1llIl1)
			rawset(l1l11lII11lllllII1l111, l1lIl1lll1l1I111IlI:lower(), I11IIllIl11lIIII1llIl1 or true);
		end,
	};
l1I1llI11I11Ill111IlI1();
I1IIllIIIIII11llIIII(l1I1l1IIl11lllI1l1ll1[lIIlI1Il1l1IIlI1111ll1("\154n3@3:\133\236`\213\019\164v&\173+\220LMc\212\242", -615991663)]);
end)(...)
