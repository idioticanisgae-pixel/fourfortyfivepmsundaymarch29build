-- The Mole
return (function(...)
local OYdoZ5baa55;
do
	local lJ9RpJ9JmKh = math.floor;
	local PDHmXN3lr = string.byte;
	local MgEX6X = string.char;
	local ZmPjXDVsSN0 = table.concat;
	local Hiw5Zw = 0x27;
	local WQlG6SkR28O = 0x1000193;
	local muST3c = tick and tick() or os and (os.clock and os.clock()) or 0x0;
	local UMBq7iW7 = lJ9RpJ9JmKh(muST3c * 0x3E8) % 0xFFF1 + 0x1;
	local function hvcJkL(PDHmXN3lr, OYdoZ5baa55)
		local MgEX6X, ZmPjXDVsSN0 = 0x0, 0x1;
		while PDHmXN3lr > 0x0 or OYdoZ5baa55 > 0x0 do
			local Hiw5Zw = PDHmXN3lr % 0x2;
			local WQlG6SkR28O = OYdoZ5baa55 % 0x2;
			if Hiw5Zw ~= WQlG6SkR28O then
				MgEX6X = MgEX6X + ZmPjXDVsSN0;
			end;
			PDHmXN3lr = lJ9RpJ9JmKh(PDHmXN3lr / 0x2);
			OYdoZ5baa55 = lJ9RpJ9JmKh(OYdoZ5baa55 / 0x2);
			ZmPjXDVsSN0 = ZmPjXDVsSN0 * 0x2;
		end;
		return MgEX6X;
	end;
	local function el_uHs_h()
		UMBq7iW7 = (UMBq7iW7 * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
		return UMBq7iW7;
	end;
	function OYdoZ5baa55(lJ9RpJ9JmKh, muST3c)
		local UMBq7iW7 = el_uHs_h();
		local loM7o1 = (muST3c * WQlG6SkR28O + UMBq7iW7) % 0xFFF1;
		local wHhKlvhL = #lJ9RpJ9JmKh;
		local Rk8OvxRDXu = {};
		for OYdoZ5baa55 = 0x1, wHhKlvhL, 0x1 do
			local ZmPjXDVsSN0 = PDHmXN3lr(lJ9RpJ9JmKh, OYdoZ5baa55);
			local muST3c = hvcJkL(Hiw5Zw, (loM7o1 * WQlG6SkR28O + OYdoZ5baa55) % 0xFB);
			Rk8OvxRDXu[OYdoZ5baa55] = MgEX6X(hvcJkL(ZmPjXDVsSN0, muST3c) % 0x100);
		end;
		return ZmPjXDVsSN0(Rk8OvxRDXu);
	end;
end;
local lJ9RpJ9JmKh, PDHmXN3lr;
do
	local OYdoZ5baa55 = math.floor;
	local MgEX6X = math.random;
	local ZmPjXDVsSN0 = table.remove;
	local Hiw5Zw = string.char;
	local WQlG6SkR28O = string.byte;
	local muST3c = string.len;
	local UMBq7iW7 = 0x19660D;
	local hvcJkL = 0xA65;
	local el_uHs_h = 4294967296;
	local loM7o1 = 0x2F;
	local wHhKlvhL = math.floor;
	local function Rk8OvxRDXu(lJ9RpJ9JmKh, PDHmXN3lr)
		local OYdoZ5baa55, MgEX6X = 0x0, 0x1;
		while lJ9RpJ9JmKh > 0x0 or PDHmXN3lr > 0x0 do
			local ZmPjXDVsSN0 = lJ9RpJ9JmKh % 0x2;
			local Hiw5Zw = PDHmXN3lr % 0x2;
			if ZmPjXDVsSN0 ~= Hiw5Zw then
				OYdoZ5baa55 = OYdoZ5baa55 + MgEX6X;
			end;
			lJ9RpJ9JmKh = wHhKlvhL(lJ9RpJ9JmKh / 0x2);
			PDHmXN3lr = wHhKlvhL(PDHmXN3lr / 0x2);
			MgEX6X = MgEX6X * 0x2;
		end;
		return OYdoZ5baa55;
	end;
	local M7adMyao = 0x0;
	local J3NruVNXhK = 0x1;
	local p6Q9QkQOvxKT = {};
	local LZ5BiW5dw5 = {};
	local dX2gmr2_Ovp8 = {};
	for lJ9RpJ9JmKh = 0x1, 0x100, 0x1 do
		dX2gmr2_Ovp8[lJ9RpJ9JmKh] = lJ9RpJ9JmKh;
	end;
	repeat
		local lJ9RpJ9JmKh = MgEX6X(0x1, #dX2gmr2_Ovp8);
		local PDHmXN3lr = ZmPjXDVsSN0(dX2gmr2_Ovp8, lJ9RpJ9JmKh);
		LZ5BiW5dw5[PDHmXN3lr] = Hiw5Zw(PDHmXN3lr - 0x1);
	until #dX2gmr2_Ovp8 == 0x0;
	local function UpXlg4XxgN()
		M7adMyao = (M7adMyao * UMBq7iW7 + hvcJkL) % el_uHs_h;
		J3NruVNXhK = (J3NruVNXhK * 0x25 + 0x7) % 0xFB + 0x1;
		return wHhKlvhL((M7adMyao + J3NruVNXhK * 0x10001) % el_uHs_h);
	end;
	local function xayZYZbiyaZW()
		if #p6Q9QkQOvxKT == 0x0 then
			local lJ9RpJ9JmKh = UpXlg4XxgN();
			local PDHmXN3lr = lJ9RpJ9JmKh % 0x100;
			local OYdoZ5baa55 = wHhKlvhL(lJ9RpJ9JmKh / 0x100) % 0x100;
			local MgEX6X = wHhKlvhL(lJ9RpJ9JmKh / 0x10000) % 0x100;
			local ZmPjXDVsSN0 = wHhKlvhL(lJ9RpJ9JmKh / 0x1000000) % 0x100;
			p6Q9QkQOvxKT = {
					PDHmXN3lr,
					OYdoZ5baa55,
					MgEX6X,
					ZmPjXDVsSN0,
				};
		end;
		return ZmPjXDVsSN0(p6Q9QkQOvxKT);
	end;
	local uKmVDJm = {};
	PDHmXN3lr = setmetatable({}, { __index = uKmVDJm, __metatable = nil });
	function lJ9RpJ9JmKh(PDHmXN3lr, OYdoZ5baa55)
		local MgEX6X = uKmVDJm;
		if not MgEX6X[OYdoZ5baa55] then
			p6Q9QkQOvxKT = {};
			M7adMyao = OYdoZ5baa55 % el_uHs_h;
			J3NruVNXhK = OYdoZ5baa55 % 0xFB + 0x1;
			local lJ9RpJ9JmKh = muST3c(PDHmXN3lr);
			local ZmPjXDVsSN0 = loM7o1;
			local Hiw5Zw = {};
			local UMBq7iW7 = LZ5BiW5dw5;
			for lJ9RpJ9JmKh = 0x1, lJ9RpJ9JmKh, 0x1 do
				local OYdoZ5baa55 = WQlG6SkR28O(PDHmXN3lr, lJ9RpJ9JmKh);
				local MgEX6X = xayZYZbiyaZW();
				local muST3c = Rk8OvxRDXu(OYdoZ5baa55, Rk8OvxRDXu(MgEX6X, ZmPjXDVsSN0)) % 0x100;
				Hiw5Zw[lJ9RpJ9JmKh] = UMBq7iW7[muST3c + 0x1];
				ZmPjXDVsSN0 = ((ZmPjXDVsSN0 + muST3c) + 0xD) % 0x100;
			end;
			MgEX6X[OYdoZ5baa55] = table.concat(Hiw5Zw);
		end;
		return OYdoZ5baa55;
	end;
end;
return (function(...)
	local OYdoZ5baa55;
	do
		local MgEX6X = math[PDHmXN3lr[lJ9RpJ9JmKh("D\233$\006\206", -1563081302)]];
		local ZmPjXDVsSN0 = string[PDHmXN3lr[lJ9RpJ9JmKh("SH\130\227", -969896863)]];
		local Hiw5Zw = string[PDHmXN3lr[lJ9RpJ9JmKh("?\205\241\148", -717641101)]];
		local WQlG6SkR28O = table[PDHmXN3lr[lJ9RpJ9JmKh("\157\209\134\197U\018", -958624327)]];
		local muST3c = 0xE;
		local UMBq7iW7 = 0x1000193;
		local hvcJkL = tick and tick() or os and (os[PDHmXN3lr[lJ9RpJ9JmKh("\161\144\173B\016", -1215729902)]] and os[PDHmXN3lr[lJ9RpJ9JmKh("\028\167\149\026\143", -279716185)]]()) or 0x0;
		local el_uHs_h = MgEX6X(hvcJkL * 0x3E8) % 0xFFF1 + 0x1;
		local function loM7o1(lJ9RpJ9JmKh, PDHmXN3lr)
			local OYdoZ5baa55, ZmPjXDVsSN0 = 0x0, 0x1;
			while lJ9RpJ9JmKh > 0x0 or PDHmXN3lr > 0x0 do
				local Hiw5Zw = lJ9RpJ9JmKh % 0x2;
				local WQlG6SkR28O = PDHmXN3lr % 0x2;
				if Hiw5Zw ~= WQlG6SkR28O then
					OYdoZ5baa55 = OYdoZ5baa55 + ZmPjXDVsSN0;
				end;
				lJ9RpJ9JmKh = MgEX6X(lJ9RpJ9JmKh / 0x2);
				PDHmXN3lr = MgEX6X(PDHmXN3lr / 0x2);
				ZmPjXDVsSN0 = ZmPjXDVsSN0 * 0x2;
			end;
			return OYdoZ5baa55;
		end;
		local function wHhKlvhL()
			el_uHs_h = (el_uHs_h * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
			return el_uHs_h;
		end;
		function OYdoZ5baa55(lJ9RpJ9JmKh, PDHmXN3lr)
			local OYdoZ5baa55 = wHhKlvhL();
			local MgEX6X = (PDHmXN3lr * UMBq7iW7 + OYdoZ5baa55) % 0xFFF1;
			local hvcJkL = #lJ9RpJ9JmKh;
			local el_uHs_h = {};
			for PDHmXN3lr = 0x1, hvcJkL, 0x1 do
				local OYdoZ5baa55 = ZmPjXDVsSN0(lJ9RpJ9JmKh, PDHmXN3lr);
				local WQlG6SkR28O = loM7o1(muST3c, (MgEX6X * UMBq7iW7 + PDHmXN3lr) % 0xFB);
				el_uHs_h[PDHmXN3lr] = Hiw5Zw(loM7o1(OYdoZ5baa55, WQlG6SkR28O) % 0x100);
			end;
			return WQlG6SkR28O(el_uHs_h);
		end;
	end;
	local MgEX6X, ZmPjXDVsSN0;
	do
		local OYdoZ5baa55 = math[PDHmXN3lr[lJ9RpJ9JmKh("\210\241\238r\186", -623594071)]];
		local Hiw5Zw = math[PDHmXN3lr[lJ9RpJ9JmKh("\240\170\248\187#\229", -1900012160)]];
		local WQlG6SkR28O = table[PDHmXN3lr[lJ9RpJ9JmKh("N\245\127\231\174\132", -1031764735)]];
		local muST3c = string[PDHmXN3lr[lJ9RpJ9JmKh("\133\004\165\244", -532496251)]];
		local UMBq7iW7 = string[PDHmXN3lr[lJ9RpJ9JmKh("\227\144\204\199", -1522120052)]];
		local hvcJkL = string[PDHmXN3lr[lJ9RpJ9JmKh("\245\237\137", -546455845)]];
		local el_uHs_h = 0x19660D;
		local loM7o1 = 0x13677;
		local wHhKlvhL = 4294967296;
		local Rk8OvxRDXu = 0x12;
		local function M7adMyao(lJ9RpJ9JmKh, PDHmXN3lr)
			local MgEX6X, ZmPjXDVsSN0 = 0x0, 0x1;
			while lJ9RpJ9JmKh > 0x0 or PDHmXN3lr > 0x0 do
				local Hiw5Zw = lJ9RpJ9JmKh % 0x2;
				local WQlG6SkR28O = PDHmXN3lr % 0x2;
				if Hiw5Zw ~= WQlG6SkR28O then
					MgEX6X = MgEX6X + ZmPjXDVsSN0;
				end;
				lJ9RpJ9JmKh = OYdoZ5baa55(lJ9RpJ9JmKh / 0x2);
				PDHmXN3lr = OYdoZ5baa55(PDHmXN3lr / 0x2);
				ZmPjXDVsSN0 = ZmPjXDVsSN0 * 0x2;
			end;
			return MgEX6X;
		end;
		local J3NruVNXhK, p6Q9QkQOvxKT, LZ5BiW5dw5 = 0x0, 0x1, {};
		local dX2gmr2_Ovp8 = {};
		local UpXlg4XxgN = {};
		for lJ9RpJ9JmKh = 0x1, 0x100, 0x1 do
			UpXlg4XxgN[lJ9RpJ9JmKh] = lJ9RpJ9JmKh;
		end;
		repeat
			local lJ9RpJ9JmKh = Hiw5Zw(0x1, #UpXlg4XxgN);
			local PDHmXN3lr = WQlG6SkR28O(UpXlg4XxgN, lJ9RpJ9JmKh);
			dX2gmr2_Ovp8[PDHmXN3lr] = muST3c(PDHmXN3lr - 0x1);
		until #UpXlg4XxgN == 0x0;
		local function xayZYZbiyaZW()
			J3NruVNXhK = (J3NruVNXhK * el_uHs_h + loM7o1) % wHhKlvhL;
			p6Q9QkQOvxKT = (p6Q9QkQOvxKT * 0x25 + 0x7) % 0xFB + 0x1;
			return OYdoZ5baa55((J3NruVNXhK + p6Q9QkQOvxKT * 0x10001) % wHhKlvhL);
		end;
		local function uKmVDJm()
			if #LZ5BiW5dw5 == 0x0 then
				local lJ9RpJ9JmKh = xayZYZbiyaZW();
				LZ5BiW5dw5 = {
						lJ9RpJ9JmKh % 0x100,
						OYdoZ5baa55(lJ9RpJ9JmKh / 0x100) % 0x100,
						OYdoZ5baa55(lJ9RpJ9JmKh / 0x10000) % 0x100,
						OYdoZ5baa55(lJ9RpJ9JmKh / 0x1000000) % 0x100,
					};
			end;
			return WQlG6SkR28O(LZ5BiW5dw5);
		end;
		local jc0hJT0jRh3u = {};
		local function r1fbWFf(OYdoZ5baa55, MgEX6X)
			if not jc0hJT0jRh3u[MgEX6X] then
				LZ5BiW5dw5 = {};
				J3NruVNXhK = MgEX6X % wHhKlvhL;
				p6Q9QkQOvxKT = MgEX6X % 0xFB + 0x1;
				local ZmPjXDVsSN0 = hvcJkL(OYdoZ5baa55);
				local Hiw5Zw = Rk8OvxRDXu;
				local WQlG6SkR28O = {};
				for MgEX6X = 0x1, ZmPjXDVsSN0, 0x1 do
					local ZmPjXDVsSN0 = UMBq7iW7(OYdoZ5baa55, MgEX6X);
					local muST3c = uKmVDJm();
					local hvcJkL = M7adMyao(ZmPjXDVsSN0, M7adMyao(muST3c, Hiw5Zw)) % 0x100;
					WQlG6SkR28O[MgEX6X] = dX2gmr2_Ovp8[hvcJkL + 0x1];
					Hiw5Zw = ((Hiw5Zw + hvcJkL) + 0xD) % 0x100;
				end;
				jc0hJT0jRh3u[MgEX6X] = table[PDHmXN3lr[lJ9RpJ9JmKh("\252\\d\n\181{", -1456319900)]](WQlG6SkR28O);
			end;
			return MgEX6X;
		end;
		MgEX6X = setmetatable({}, { [PDHmXN3lr[lJ9RpJ9JmKh("0\133\209\144\219+\188", -406073449)]] = function(OYdoZ5baa55, MgEX6X)
					return jc0hJT0jRh3u[MgEX6X];
				end, [PDHmXN3lr[lJ9RpJ9JmKh(">\247\024\176\018\235\197u\193B\196", -1969810130)]] = nil });
		function ZmPjXDVsSN0(lJ9RpJ9JmKh, PDHmXN3lr)
			return r1fbWFf(lJ9RpJ9JmKh, PDHmXN3lr);
		end;
	end;
	if (getgenv())[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\152\186\177\129w\015\006\250dD)\015\205\023\211", -1350672644)], -73271485)]] then
		return;
	end;
	(getgenv())[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\239\174\209\031\0218\187=5\"%\255\151@\191", -575161489)], -1479848042)]] = true;
	local Hiw5Zw = newcclosure or function(lJ9RpJ9JmKh)
			return lJ9RpJ9JmKh;
		end;
	local WQlG6SkR28O = checkcaller or function()
			return false;
		end;
	local muST3c = getrawmetatable;
	local UMBq7iW7 = setreadonly or function()
 
		end;
	local hvcJkL = hookfunction or function()
 
		end;
	local el_uHs_h = getgc or get_gc_objects or function()
			return {};
		end;
	local loM7o1 = getscriptidentity or getidentity or get_thread_identity or nil;
	local wHhKlvhL = setscriptidentity or setidentity or set_thread_identity or nil;
	if not game:IsLoaded() then
		game[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\\\2381\141\216\169", -305079391)], -1599585968)]]:Wait();
	end;
	local Rk8OvxRDXu = game:GetService(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("^\022\168\205\237\008\141", -661802725)], -149885407)]);
	repeat
		task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\140\223\190@", -984839527)], -978482341)]](.1);
	until Rk8OvxRDXu and Rk8OvxRDXu[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012\165c\160,\0141\220\194\203\014", -1107723278)], -437400613)]];
	local M7adMyao = Rk8OvxRDXu[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("F\165\015\182\231=*\1378_\127", -2050749560)], -1673971598)]];
	local J3NruVNXhK = false;
	local p6Q9QkQOvxKT = nil;
	local LZ5BiW5dw5 = {};
	local dX2gmr2_Ovp8 = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("x\003\254k\139\134Q\144\159\1877\202", -1925244290)], -1035893629)]] = 0x0,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\024\1890\137o7 \001\181\143\246#V\205", -1119520118)], -1959324050)]] = 0x0,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\236\1532\031\253\129P\000(\167\031F\029e\241\135", -258088645)], -38143117)]] = 0x0,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\198d\127\139-\150\200\149R\215\132\019\001\028\148", -2014769198)], -2108357462)]] = 0x0,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\228\159gBd9\029\128\138\183\187^t\157\229\188\173,I", -77662531)], -751983013)]] = 0x0,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\153\028\234B\007\242C\187\204\182Q\006", -854943211)], -1418635550)]] = 0x0,
		};
	local function UpXlg4XxgN(OYdoZ5baa55)
		if rconsoleprint then
			pcall(rconsoleprint, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("S\019R\251\158\011I\'th?", -1951328414)], -842294377)] .. (tostring(OYdoZ5baa55) .. MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\194", -851076469)], -2103966416)]));
		end;
	end;
	local xayZYZbiyaZW = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\132n^\228\005\148\184/O6,", -2042819462)], -122490523)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\242\193\146\020/b\211U\031\005r", -1085571434)], -524959381)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("|\029 ", -1860885974)], -230038381)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("PQ}a\236\135", -362162989)], -1492890104)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\173\155\028\136", -509295799)], -1183091978)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\133\173\165\210Ai", -463353661)], -386936353)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("@0;\127\209\222\020\201", -1935009452)], -73599175)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\162\186;\235Y\149\140\189\219\176\168\205]\242", -2065692224)], -1613938790)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\213\002\231\253_B\128\225\204\149\203\139\240\159K ", -2124873038)], -1600175810)]] = true,
		};
	local uKmVDJm = { [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("9\218\189.\212e,\224", -206575777)], -1882513514)]] = true, [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\158i\207<J\215\204\014\159I\1486", -532823941)], -1114147)]] = true };
	local jc0hJT0jRh3u = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("z\254\140\213", -1619509520)], -18678331)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\158\011\155-{}\185\212\180\213", -1536538412)], -1157925386)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\224Km<}U\171\182\'\244\242\151", -1715981456)], -1499312828)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\192(\134\154\'4\222\181\225y\234", -1993338272)], -479738161)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("&\212\215\153\197\024\190>\212\149\134\"\224\221", -114036121)], -817914241)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\198\190Y\019!\176\183\135\208\190\245]5<", -1472507786)], -2125462880)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\252\147\006\025-\"i\175\193\157\155L\127I\206\184\241i\229\028?", -1358995970)], -1239126968)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("@c^,\164p{\181\186w\170\"?\212\130\185n\210\021\131N\205", -336799783)], -215554483)]] = true,
		};
	local r1fbWFf = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\249\187\149\245E\238g", -620055019)], -1275828248)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\131\149:\224\146Z:\021\002o\002\147\000\224\170", -1890443612)], -1424271818)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("`m-=", -744315067)], -171644023)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\028\027HM", -251010541)], -1358930432)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\168\024\185&\221\159A\247$$", -261693235)], -84675097)]] = true,
		};
	local bP6_EK6tk = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\200\156\169;\195\235R\152(\165\230", -404434999)], -1506390932)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\209\158\176z\168c\187\018\176\145\189\224\2353", -340469911)], -723015217)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\178\184\141\251\213\182Q\205\154\252\225p", -2143747982)], -570770443)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("i\147\251HT\023{\025\000\127j\232\022v\246", -2040591170)], -811753669)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("R\211\030\000=\003Y\232\203\142", -31523779)], -1355719070)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("6\176\254\156b\0243,\229M", -1201835846)], -1580514410)]] = true,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\211\153H\216 P+\159u", -1527232016)], -913927411)]] = true,
		};
	local zjG2RmG = {
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("3\r\222\n:\180&a\246", -843932827)], -116723179)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\140`d\160*\218I\199\150\129", -2043409304)], -965636893)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\217\152\220{\011\0024\140\007\248", -1984818332)], -1707592592)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("M5\184\145\178\131\147\234\235", -386543125)], -1149208832)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("c\203n\231\139\2447\215\216\2370\189P", -75303163)], -803495881)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\002K\199\214\202\191\127\223\207V\239\130", -1440066476)], -33162229)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("A\138{\0170e\135\225o\020", -984249685)], -236330029)],
		};
	local fnYWBfYWe = {
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("X\148(\157\n\247", -1338089348)], -1696123442)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\135V\0185", -455685715)], -650071423)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\021\'\217\253\222", -1486598456)], -599017321)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("d\007\174\174\004\175R", -1110672488)], -1699269266)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("O3\244\007", -1557248420)], -1017411913)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(":\004\141-\147)\197$", -254942821)], -1375183856)],
			MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("B1\208", -403779619)], -817455475)],
		};
	local pVOQxGj = { [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\136sg\003\224 \246\141M|\236", -1767887552)], -628443883)]] = true, [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("a0\244\002=\182\175\005M\160", -233380819)], -212212045)]] = true };
	local v4C68cCp_ = {
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\015\185!\238\174>?X", -39716029)], -1569897254)], true, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("Y\193\167[{\214\009\158\251\152\235\244", -1014266089)], -323167879)], true, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\136\242y;\187\154\168k\250\231\017I~_k", -1321442696)], -83954179)], true, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\212\222\231\196\022\238^\129\216_\183t\210", -22151845)], -315106705)], false, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("A\223b\155\183U~D\001,&\183V;\139", -1805506364)], -774069319)], false, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\166\209\165\192WP\239L\127\194\019\149\227$\139\153\2407", -729831169)], -82708957)], false, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("}#\0211AsQQ\169.\203R\210\177", -561857275)], -1630061138)], true, .5 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("4\151\190\195GT0\024\199,\021\134\227\009", -1221104018)], -1495249472)], true, .5 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\203\222p\144\170\205\181\246%\189\231$c\017+L", -2022895910)], -2147155958)], false, 0x1 },
			{ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\249\152\249\191\248F\254\145=", -1944381386)], -18416179)], true, .5 },
		};
	local g571qMoe1AM = 0x3;
	local BzI028IGD = 0x2;
	local function EhJILURNGxQ(lJ9RpJ9JmKh, ...)
		local PDHmXN3lr, OYdoZ5baa55 = pcall(lJ9RpJ9JmKh, ...);
		if PDHmXN3lr then
			return OYdoZ5baa55;
		end;
	end;
	local function uFnyfn1qZ(lJ9RpJ9JmKh, PDHmXN3lr)
		local OYdoZ5baa55 = muST3c(lJ9RpJ9JmKh);
		if not OYdoZ5baa55 then
			return false;
		end;
		local MgEX6X = pcall(function()
				UMBq7iW7(OYdoZ5baa55, false);
				PDHmXN3lr(OYdoZ5baa55);
				UMBq7iW7(OYdoZ5baa55, true);
			end);
		if not MgEX6X then
			pcall(UMBq7iW7, OYdoZ5baa55, true);
		end;
		return MgEX6X;
	end;
	local function SSTC9HTgxvm(OYdoZ5baa55, WQlG6SkR28O)
		if type(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\030\031\1990`\200\029\023", -785538469)], -1993993652)] then
			return false;
		end;
		local muST3c = pcall(hvcJkL, OYdoZ5baa55, Hiw5Zw(WQlG6SkR28O));
		if not muST3c then
			return false;
		end;
		table[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("a\215e+\146\225", -1351196948)], -1538242400)]](LZ5BiW5dw5, OYdoZ5baa55);
		dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("Q\0093\017\183\136\169\173C@\212\251\232\150\018", -676221085)], -110628145)]] += 0x1;
		return true;
	end;
	local function FIHxCE(lJ9RpJ9JmKh)
		for PDHmXN3lr, OYdoZ5baa55 in ipairs(LZ5BiW5dw5) do
			if lJ9RpJ9JmKh == OYdoZ5baa55 then
				return true;
			end;
		end;
		return false;
	end;
	local function bdFiwyF1oaY(OYdoZ5baa55)
		if type(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\215\026@\158\203", -217258471)], -915369247)] then
			return;
		end;
		pcall(function()
			UMBq7iW7(OYdoZ5baa55, false);
			local lJ9RpJ9JmKh = muST3c(OYdoZ5baa55);
			if lJ9RpJ9JmKh then
				pcall(UMBq7iW7, lJ9RpJ9JmKh, false);
			end;
		end);
	end;
	for OYdoZ5baa55, Hiw5Zw in ipairs({ getgenv, getrenv, getreg }) do
		if type(Hiw5Zw) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("1\141\248\195\199\162\168\173", -1930880558)], -499661713)] then
			local OYdoZ5baa55, WQlG6SkR28O = pcall(Hiw5Zw);
			if OYdoZ5baa55 and type(WQlG6SkR28O) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\166e\225\176\250", -1017870679)], -657608293)] then
				bdFiwyF1oaY(WQlG6SkR28O);
			end;
		end;
	end;
	local function TGEHT0(OYdoZ5baa55)
		if type(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("O\172\135\023\144", -56559295)], -543572173)] then
			return 0x0;
		end;
		local Hiw5Zw = 0x0;
		pcall(function()
			for WQlG6SkR28O, muST3c in ipairs(v4C68cCp_) do
				local UMBq7iW7, hvcJkL, el_uHs_h = muST3c[0x1], muST3c[0x2], muST3c[0x3];
				local loM7o1 = rawget(OYdoZ5baa55, UMBq7iW7);
				if loM7o1 ~= nil then
					if hvcJkL then
						if type(loM7o1) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\142\187aG\154\246F`", -1050443065)], -1013414095)] then
							Hiw5Zw += el_uHs_h;
						end;
					else
						Hiw5Zw += el_uHs_h;
					end;
				end;
			end;
		end);
		return Hiw5Zw;
	end;
	local function DsPp_6KU()
		local OYdoZ5baa55;
		local Hiw5Zw = pcall(function()
				OYdoZ5baa55 = el_uHs_h(true);
			end);
		if not Hiw5Zw or not OYdoZ5baa55 then
			return nil;
		end;
		for OYdoZ5baa55, Hiw5Zw in ipairs(OYdoZ5baa55) do
			local WQlG6SkR28O, muST3c = pcall(function()
					return type(Hiw5Zw) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\132{\006\201\255", -835478425)], -968848255)];
				end);
			if WQlG6SkR28O and (muST3c and TGEHT0(Hiw5Zw) >= g571qMoe1AM) then
				return Hiw5Zw;
			end;
		end;
		return nil;
	end;
	local function IbAnAY(OYdoZ5baa55)
		if not OYdoZ5baa55 then
			return;
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\230b{\147\248R\154\181", -816996709)], -1427483180)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("=\169.\193\009\003\176\134", -352922131)], -1923540302)] then
			SSTC9HTgxvm(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\142 \227\160\228\176\016\242", -1167887162)], -237509713)]], function(...)
				dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("a5\001!\197ik\204w\155\129+\175c\236\\", -1494200864)], -1446292586)]] += 0x1;
			end);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("p<\167Z\144`U\169\141\129JA", -895642309)], -147067273)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("`\191\022\243 ibG", -164828071)], -27853651)] then
			SSTC9HTgxvm(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("D\219\0223\1821\241\137\150\140\190w", -133304293)], -321988195)]], function(...)
				dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\215\210D\198\128\205\167\221 \158g\175", -875653219)], -539050051)]] += 0x1;
			end);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\169!\158=\232\031\031\249\152\132d\227\190\205\242", -819093925)], -1378329680)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("}#\176E\027\234~,", -390475405)], -423768709)] then
			SSTC9HTgxvm(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\197\024\r\161\247r\185\241\234\243\":\229\204\021", -1838406440)], -894986929)]], function(...)
				dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("#\009)\177`e\183\150U\250\2170\136E\166\157\129\020\164", -832660291)], -839935009)]] += 0x1;
			end);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("A\205\001\165\n\023?_\152\192\231\249\144\127", -616712581)], -426521305)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\165\252l\252\225\177\141\193", -284238307)], -427569913)] then
			SSTC9HTgxvm(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\180}\219\003\014\163\249\141$Z\028\007\231\n", -828400321)], -1255314854)]], function(...)
				return nil;
			end);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("{\154\153\245\200[\250\008\148\159\031\132\222;", -1074954278)], -1718996204)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("U\011x\146E8M\151", -657346141)], -2013851666)] then
			SSTC9HTgxvm(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(":\220\143\217\229\002\211f\202\174\025\128\017\174", -1320197474)], -2072573714)]], function(...)
 
			end);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\198r\205+3\130\142\169\207\024\237\020\174", -1045789867)], -1465101992)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\141^\230\130\234", -114888115)], -608258179)] then
			local Hiw5Zw = getmetatable(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("a{\197 ~;b>\016\232\129\193G", -1227133514)], -586696177)]]) or {};
			rawset(Hiw5Zw, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\222E\245\166\029zK", -1211011166)], -586761715)], function()
				return false;
			end);
			rawset(Hiw5Zw, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\155\214\021#zTd\172\247\185", -1828968968)], -1752551660)], function()
 
			end);
			rawset(Hiw5Zw, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\006u(\154`", -2107112240)], -1505014634)], function()
				return 0x0;
			end);
			pcall(setmetatable, OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\203\139lB\r\025>g:\159\226\229Y", -1607647142)], -1246598300)]], Hiw5Zw);
		end;
		if type(OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\164C!\136\193\132\135,7v;S\211\171\138", -162075475)], -1328848490)]]) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("J\174bhV", -893414017)], -291381949)] then
			local Hiw5Zw = {};
			rawset(Hiw5Zw, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\254\016\244\241\173;w", -655969843)], -426980071)], function(OYdoZ5baa55, Hiw5Zw)
				return { {
						[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("]\145", -1675872200)], -300360655)]] = Hiw5Zw,
						[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012\211[+\022\191>8", -1710607340)], -1092715076)]] = M7adMyao[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\025\017L\179", -673009723)], -1235063612)]],
						[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\024\247\173\147[\030EeB\135\030", -1937565434)], -232397749)]] = M7adMyao[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("E*,P?\198\002M\253\133]", -1527559706)], -125898499)]],
						[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("P\138\135\223jH", -163845001)], -1764217424)]] = M7adMyao[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("a=\020a+\130", -1176013874)], -861300397)]],
					} };
			end);
			rawset(Hiw5Zw, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\137\200\172\017zNj\147\189w", -227875627)], -915631399)], function()
 
			end);
			pcall(setmetatable, OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\169\209\232p\152\140g\167\016Z\021\237R)\153", -2145517508)], -971928541)]], Hiw5Zw);
		end;
		if OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("j\127\160k\135\166\249\130\015\156\nb\152\007\202c\138\226", -1411688522)], -827876017)]] ~= nil then
			pcall(function()
				OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\245\161\185\237b\008\243\020V\127\129dL~\014ZUf", -93522727)], -211753279)]] = math[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\232\154{\198", -395325217)], -610814161)]];
			end);
		end;
		if OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\201\240t{\200\231m\240\223\251\149\007\171\140\1522", -468596701)], -1436658500)]] ~= nil then
			pcall(function()
				OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\000\017g\129\0128\172\142\006h\006\240P\132\006\021", -407449747)], -937979857)]] = false;
			end);
		end;
	end;
	local function qtlzN_uJ()
		local OYdoZ5baa55 = tostring(M7adMyao[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\127s\019c\133\240", -495270667)], -1344905300)]]);
		local Hiw5Zw;
		local WQlG6SkR28O = pcall(function()
				Hiw5Zw = el_uHs_h(true);
			end);
		if not WQlG6SkR28O or not Hiw5Zw then
			return;
		end;
		for Hiw5Zw, WQlG6SkR28O in ipairs(Hiw5Zw) do
			local muST3c, UMBq7iW7 = pcall(function()
					return type(WQlG6SkR28O) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\016\018R\193J", -450246061)], -659902123)];
				end);
			if not (muST3c and UMBq7iW7) then
				continue;
			end;
			local hvcJkL, el_uHs_h, loM7o1 = pcall(function()
					return rawget(WQlG6SkR28O, OYdoZ5baa55), rawget(WQlG6SkR28O, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012\160G\148!\212", -1208193032)], -1785976040)]);
				end);
			if not (hvcJkL and type(el_uHs_h) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("L\150d[\147", -747460891)], -233053129)]) then
				continue;
			end;
			local wHhKlvhL, Rk8OvxRDXu = pcall(function()
					return rawget(el_uHs_h, MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\252\004U\175\155M\180G\r\205", -1752223970)], -1227067976)]) ~= nil;
				end);
			if wHhKlvhL and (Rk8OvxRDXu and loM7o1 ~= nil) then
				task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\019$3\219\229", -792026731)], -585254341)]](function()
					while not J3NruVNXhK do
						task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\160\231\156R", -114232735)], -1050770755)]](0x8);
						pcall(function()
							local Hiw5Zw = WQlG6SkR28O[OYdoZ5baa55];
							if Hiw5Zw then
								Hiw5Zw[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\252\009\179\153L\\\141\209\201\r", -1790301548)], -1310760002)]] = os[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\199\224ep", -1939072808)], -509295799)]]();
								Hiw5Zw[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\149,\004\211\024\137{\151\160F\241~", -490420855)], -2091972962)]] = true;
							end;
						end);
					end;
				end);
			end;
		end;
	end;
	local function gUzsrh()
		local OYdoZ5baa55 = getnamecallmethod;
		uFnyfn1qZ(game, function(muST3c)
			local UMBq7iW7 = muST3c[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\188\003\'|f\227p\223\195\162", -1840307042)], -1393862186)]];
			muST3c[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\188g\245e\n\222\165e\196\128", -91622125)], -544358629)]] = Hiw5Zw(function(Hiw5Zw, ...)
					if WQlG6SkR28O() then
						return UMBq7iW7(Hiw5Zw, ...);
					end;
					local muST3c = OYdoZ5baa55();
					if rawget(r1fbWFf, muST3c) then
						return UMBq7iW7(Hiw5Zw, ...);
					end;
					if not rawget(jc0hJT0jRh3u, muST3c) then
						return UMBq7iW7(Hiw5Zw, ...);
					end;
					if muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012\129 \027", -241179841)], -413610319)] and Hiw5Zw == M7adMyao then
						local OYdoZ5baa55 = (tostring(... or MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("", -2145583046)], -1498526372)])):lower();
						for Hiw5Zw = 0x1, #fnYWBfYWe, 0x1 do
							if OYdoZ5baa55:find(fnYWBfYWe[Hiw5Zw], 0x1, true) then
								dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\232\242\192f\133\005?C\131z\149\254", -1338679190)], -2095512014)]] += 0x1;
								return nil;
							end;
						end;
					end;
					if muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\203\178\197X\142O\021p\'\185", -1463332466)], -2099116604)] or muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\171< \152ev\228\031\015\011\158w", -1848695906)], -679694599)] then
						local OYdoZ5baa55;
						local WQlG6SkR28O = pcall(function()
								OYdoZ5baa55 = Hiw5Zw[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(",\023\209\140", -695423719)], -459028153)]];
							end);
						if WQlG6SkR28O and rawget(bP6_EK6tk, OYdoZ5baa55) then
							dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("5\2098\136\020\145\201\213T\181\218\233)g", -525811375)], -941715523)]] += 0x1;
							if muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("yY3x*3\159\021\193=\218\198", -236526643)], -1150322978)] then
								return MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\192 \169f", -976647277)], -1862000120)];
							end;
							return nil;
						end;
						dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("]\019C\230\212\017\184\144\167\027\206\027", -1336188746)], -1489088900)]] += 0x1;
					end;
					if muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\151*\014uI\029,\231\000\001\030", -2034102908)], -399126421)] or muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\"\011\219;5\2077\131_\006N\003\150\240", -1496691308)], -2136080036)] then
						local OYdoZ5baa55 = UMBq7iW7(Hiw5Zw, ...);
						if type(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\142\166Wo8", -330377059)], -1305254810)] then
							return OYdoZ5baa55;
						end;
						local WQlG6SkR28O = false;
						for Hiw5Zw = 0x1, #OYdoZ5baa55, 0x1 do
							local muST3c, UMBq7iW7 = pcall(function()
									return OYdoZ5baa55[Hiw5Zw][MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("[\001\169\"", -1124304392)], -979072183)]];
								end);
							if muST3c and rawget(pVOQxGj, UMBq7iW7) then
								WQlG6SkR28O = true;
								break;
							end;
						end;
						if not WQlG6SkR28O then
							return OYdoZ5baa55;
						end;
						local muST3c, hvcJkL = {}, 0x0;
						for Hiw5Zw = 0x1, #OYdoZ5baa55, 0x1 do
							local WQlG6SkR28O, UMBq7iW7 = pcall(function()
									return OYdoZ5baa55[Hiw5Zw][MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\138\149\n\146", -249961933)], -1998515774)]];
								end);
							if not (WQlG6SkR28O and rawget(pVOQxGj, UMBq7iW7)) then
								hvcJkL = hvcJkL + 0x1;
								muST3c[hvcJkL] = OYdoZ5baa55[Hiw5Zw];
							end;
						end;
						return muST3c;
					end;
					if muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("$s\254\233\171\199\031\148\216g\236\181\235\218", -2066085452)], -1513403498)] or muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\218\209\n\127t\025\240\000[]\001U\001\228\000\'\230\206\199\242z", -1852234958)], -1120306574)] or muST3c == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\254E\018\153\020\227:\211\009\252\031N\225\243d\223A\245W\233\147>", -899181361)], -2042950538)] then
						if rawget(pVOQxGj, tostring(... or MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("", -1649198234)], -1343987768)])) then
							return nil;
						end;
					end;
					return UMBq7iW7(Hiw5Zw, ...);
				end);
		end);
	end;
	local function GyBAyaqZ()
		uFnyfn1qZ(game, function(OYdoZ5baa55)
			local muST3c = OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("2\005w3G1\191", -1707461516)], -852518305)]];
			local UMBq7iW7 = OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\228m\170\029\177K\193lCR", -1296997022)], -309601513)]];
			OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\212k\019-\024\195b", -1422305678)], -1903026908)]] = Hiw5Zw(function(OYdoZ5baa55, Hiw5Zw, ...)
					if WQlG6SkR28O() then
						return muST3c(OYdoZ5baa55, Hiw5Zw, ...);
					end;
					if type(Hiw5Zw) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("cj\146\188\030\187", -139661479)], -1531098758)] and rawget(xayZYZbiyaZW, Hiw5Zw) then
						return nil;
					end;
					return muST3c(OYdoZ5baa55, Hiw5Zw, ...);
				end);
			OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\238]\203T\202\191Z\170`\202", -1127908982)], -1211338856)]] = Hiw5Zw(function(lJ9RpJ9JmKh, PDHmXN3lr, OYdoZ5baa55, ...)
					if WQlG6SkR28O() then
						if UMBq7iW7 then
							return UMBq7iW7(lJ9RpJ9JmKh, PDHmXN3lr, OYdoZ5baa55, ...);
						end;
						return rawset(lJ9RpJ9JmKh, PDHmXN3lr, OYdoZ5baa55);
					end;
					if rawget(uKmVDJm, PDHmXN3lr) then
						return;
					end;
					if UMBq7iW7 then
						pcall(UMBq7iW7, lJ9RpJ9JmKh, PDHmXN3lr, OYdoZ5baa55, ...);
					else
						pcall(rawset, lJ9RpJ9JmKh, PDHmXN3lr, OYdoZ5baa55);
					end;
				end);
		end);
		local OYdoZ5baa55 = EhJILURNGxQ(function()
				return game:GetService(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\237K=6\004#\005\024\231", -931950361)], -100600831)]);
			end);
		if OYdoZ5baa55 and muST3c(OYdoZ5baa55) ~= muST3c(game) then
			uFnyfn1qZ(OYdoZ5baa55, function(OYdoZ5baa55)
				local muST3c = OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("w\168:\181R\025|", -980645095)], -1928259038)]];
				OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\183L\227\187\202,S", -1700580026)], -1553774906)]] = Hiw5Zw(function(OYdoZ5baa55, Hiw5Zw, ...)
						if WQlG6SkR28O() then
							return muST3c(OYdoZ5baa55, Hiw5Zw, ...);
						end;
						if type(Hiw5Zw) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("1\172\235{X\149", -271851625)], -1674954668)] and rawget(xayZYZbiyaZW, Hiw5Zw) then
							return nil;
						end;
						return muST3c(OYdoZ5baa55, Hiw5Zw, ...);
					end);
			end);
		end;
		local hvcJkL = muST3c(Enum);
		if hvcJkL then
			pcall(function()
				UMBq7iW7(hvcJkL, false);
				local OYdoZ5baa55 = hvcJkL[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\241F\019\230/\017p\170\007p", -2040656708)], -1079017634)]];
				hvcJkL[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("E\005!W;\184\159.\254\028", -2036986580)], -1469755190)]] = Hiw5Zw(function(lJ9RpJ9JmKh, PDHmXN3lr, MgEX6X, ...)
						if WQlG6SkR28O() then
							if OYdoZ5baa55 then
								return OYdoZ5baa55(lJ9RpJ9JmKh, PDHmXN3lr, MgEX6X, ...);
							end;
							return;
						end;
						if rawget(uKmVDJm, PDHmXN3lr) then
							return;
						end;
						if OYdoZ5baa55 then
							pcall(OYdoZ5baa55, lJ9RpJ9JmKh, PDHmXN3lr, MgEX6X, ...);
						end;
					end);
				UMBq7iW7(hvcJkL, true);
			end);
		end;
	end;
	local function Nrc8UgpVIz()
		if not loM7o1 then
			return;
		end;
		pcall(hvcJkL, loM7o1, Hiw5Zw(function(...)
			if WQlG6SkR28O() then
				return loM7o1(...);
			end;
			return BzI028IGD;
		end));
		if wHhKlvhL then
			pcall(hvcJkL, wHhKlvhL, Hiw5Zw(function(lJ9RpJ9JmKh, ...)
				if WQlG6SkR28O() then
					return wHhKlvhL(lJ9RpJ9JmKh, ...);
				end;
			end));
		end;
		for OYdoZ5baa55, muST3c in ipairs({ MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\003\251\140O\216z\189\213P\255\130", -404172847)], -1107002360)], MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\019*\205\231\201\193\220\215\234ctN\224\018\029\154\212\2434", -728848099)], -248192407)], MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("W\166\130\160\174\016\165\008\191q\250\187\152\241\145\140\233", -115543495)], -1853218028)] }) do
			local UMBq7iW7 = rawget(getgenv(), muST3c) or rawget(getrenv(), muST3c);
			if UMBq7iW7 and (UMBq7iW7 ~= loM7o1 and type(UMBq7iW7) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012\030\151\148\182\216-W", -1224446456)], -2136473264)]) then
				pcall(hvcJkL, UMBq7iW7, Hiw5Zw(function(...)
					if WQlG6SkR28O() then
						return UMBq7iW7(...);
					end;
					return BzI028IGD;
				end));
			end;
		end;
	end;
	local function YNrDt9tI()
		local function OYdoZ5baa55(OYdoZ5baa55, WQlG6SkR28O)
			if type(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(";\135\220\\\251\232\160\153", -110628145)], -1988291846)] then
				return;
			end;
			pcall(hvcJkL, OYdoZ5baa55, Hiw5Zw(function(lJ9RpJ9JmKh, ...)
				if FIHxCE(lJ9RpJ9JmKh) then
					return WQlG6SkR28O;
				end;
				return OYdoZ5baa55(lJ9RpJ9JmKh, ...);
			end));
		end;
		OYdoZ5baa55(debug[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\248(i\215", -2122579208)], -658329211)]] or debug[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\1825\193\163\253\015\220", -254549593)], -1464249998)]], nil);
		OYdoZ5baa55(debug[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\1408\195C\175E\023\129Gc5", -334178263)], -833446747)]], {});
		OYdoZ5baa55(debug[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\011\241\165e^#\018\n_", -1101955934)], -258416335)]], {});
		OYdoZ5baa55(debug[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\014\249x\026\215&\207\246\136x\218\170", -600983461)], -1780143158)]], {});
	end;
	local function nAMMbdiAfA()
		local OYdoZ5baa55 = M7adMyao[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\239\1532\229", -483342751)], -239606929)]];
		SSTC9HTgxvm(OYdoZ5baa55, function(Hiw5Zw, muST3c, ...)
			if WQlG6SkR28O() then
				return OYdoZ5baa55(Hiw5Zw, muST3c, ...);
			end;
			if Hiw5Zw == M7adMyao then
				local OYdoZ5baa55 = (tostring(muST3c or MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("", -1854659864)], -354167353)])):lower();
				for Hiw5Zw, WQlG6SkR28O in ipairs(fnYWBfYWe) do
					if OYdoZ5baa55:find(WQlG6SkR28O, 0x1, true) then
						dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\005i2\243\247\004U\026o\213m\236", -846226657)], -905473009)]] += 0x1;
						return nil;
					end;
				end;
			end;
			return OYdoZ5baa55(Hiw5Zw, muST3c, ...);
		end);
	end;
	local F_43sKO8;
	F_43sKO8 = hvcJkL((getrenv())[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\'g\139R8\217|", -769940425)], -1158318614)]], Hiw5Zw(function(OYdoZ5baa55)
			if WQlG6SkR28O() then
				return F_43sKO8(OYdoZ5baa55);
			end;
			if typeof(OYdoZ5baa55) == MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("^\200~\235\140\195\007=", -1322294690)], -1305582500)] then
				local Hiw5Zw = OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\232\172\011\159", -941846599)], -817062247)]]:lower();
				if Hiw5Zw:find(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\137\170Su\021\145", -1943857082)], -1927079354)], 0x1, true) or Hiw5Zw:find(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\253\174G>", -55838377)], -77924683)], 0x1, true) or Hiw5Zw:find(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("@\142K\208\213\155", -1804850984)], -1013807323)], 0x1, true) then
					return setmetatable({}, { [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("c\144\025\005\194\190\142", -202709035)], -735991741)]] = function()
							return function()
 
							end;
						end, [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\020@9\n\233 e\003\182U", -121704067)], -1050443065)]] = function()
 
						end, [MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\012Z\031C\141\183", -106302637)], -853697989)]] = function()
							return {};
						end });
				end;
			end;
			return F_43sKO8(OYdoZ5baa55);
		end));
	local function aT8cGuLmQx()
		local function OYdoZ5baa55(OYdoZ5baa55)
			if typeof(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\190\255 \239\219\008^\001\015\157o", -1664730740)], -562119427)] and typeof(OYdoZ5baa55) ~= MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\194\225\179\243\030A\200\201\184\193\\\005qp", -2052846776)], -1082163458)] then
				return;
			end;
			local Hiw5Zw, WQlG6SkR28O = pcall(function()
					return OYdoZ5baa55[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\162\157\")", -922840579)], -2070083270)]];
				end);
			if not Hiw5Zw then
				return;
			end;
			local muST3c = WQlG6SkR28O:lower();
			for lJ9RpJ9JmKh, PDHmXN3lr in ipairs(zjG2RmG) do
				if muST3c:find(PDHmXN3lr, 0x1, true) then
					rawset(bP6_EK6tk, WQlG6SkR28O, true);
					break;
				end;
			end;
		end;
		pcall(function()
			for lJ9RpJ9JmKh, PDHmXN3lr in ipairs(game:GetDescendants()) do
				OYdoZ5baa55(PDHmXN3lr);
			end;
		end);
		pcall(function()
			game[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("#\152\227\144\166\176<G<WN\139y\147\177", -412889401)], -970093477)]]:Connect(function(Hiw5Zw)
				task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\136\234\127\229h", -336930859)], -1294899806)]](OYdoZ5baa55, Hiw5Zw);
			end);
		end);
	end;
	local function Kwaedq77AFfe()
		local OYdoZ5baa55 = DsPp_6KU();
		if OYdoZ5baa55 and OYdoZ5baa55 ~= p6Q9QkQOvxKT then
			p6Q9QkQOvxKT = OYdoZ5baa55;
			IbAnAY(OYdoZ5baa55);
			UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\226\158\142N\222zE\163\180:\220\206\166\031\183\133\209\189\201\204\223\240\210\206\180j\220Je\144eZ\\", -1274976254)], -323036803)]);
		end;
		qtlzN_uJ();
	end;
	local function DCUSItsKcv()
		gUzsrh();
		GyBAyaqZ();
		Nrc8UgpVIz();
		YNrDt9tI();
		nAMMbdiAfA();
		aT8cGuLmQx();
		p6Q9QkQOvxKT = DsPp_6KU();
		if p6Q9QkQOvxKT then
			IbAnAY(p6Q9QkQOvxKT);
			UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\219%r\026\237n\164\243&\202\208\0276\246; \231:\254\'\131\019\166=\206ejmbs\192~", -1136035694)], -1006663681)]);
		else
			UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\007\204O;\183}\252\226E\009j\174\195\210\000\176\238\251%\182\r\239\225\1743\148w\213L\210\161L\169\174hD\252\252\132\228w\191\247\018\184", -1659487700)], -512638237)]);
		end;
		qtlzN_uJ();
		task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\196\215g4:", -69929047)], -930639601)]](function()
			while not J3NruVNXhK do
				task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("t\2550\233", -771709951)], -1714080854)]](0xF);
				Kwaedq77AFfe();
			end;
		end);
		task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\193\208\1537?", -690442831)], -2083780712)]](function()
			while not J3NruVNXhK do
				task[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("b\018\225\134", -695554795)], -1752092894)]](0x3C);
				UpXlg4XxgN(string[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\151\127\179\198\242.", -2687059)], -447231313)]](MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\1993WS>\139X\231\006\200\148PJ\134Jz\028\203\128A>\011T\r\190EAk\156\255\222\209\016Z\176|\210=3(u\241\021\015i+\017\178V\2046\148\2444\230\134M\1634\009\189\228\217\187?GfH\143(\244\1270o\186\217\176", -778460365)], -1500492512)], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\201\004#\144L\210\168}\146r\210\135", -554844709)], -774462547)]], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("@\155mx\21689\011\026:S\254\212\215", -1402644278)], -142282999)]], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\009\007\"\r.)\203\200zJH\128\162\199\1553", -1414178966)], -216930781)]], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("8\139\012\251vs-sE\156\138~\150\028\153\149\137\145\021", -563102497)], -780885271)]], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\231\203\235t\242\184?\025-66\139\182\015F", -1126794836)], -1094877830)]], dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("`\191\007\210D\214,\019\012\135\142D", -466630561)], -1428662864)]]));
			end;
		end);
	end;
	(getgenv())[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\241\196\242\231\163[\179\188", -209328373)], -1565244056)]] = {
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\213\244ZTB\146\191", -1909187480)], -1100120870)]] = MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(")j\157", -1717226678)], -101977129)],
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\005\147\164\217,\168@-", -2078013368)], -1849482362)]] = function()
				return {
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\019G\192\148qqQ\164\192%\247\148", -2143027064)], -934178653)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\171\188\253hD\230s1\166\192\230&", -220207681)], -750999943)]],
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\220\162\213\222\180M\\\209\158\009\230!b8", -659771047)], -330377059)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("E\029\1940\255K\006\'?\148\027\184\1670", -692277895)], -487799335)]],
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\240qtw\227\133\014 D\223Y4\184\201\245\212", -717706639)], -1415489726)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\008H\147\141%\249\130 \177c\168\004\230EJO", -1701890786)], -1247646908)]],
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\154DN3.\031\205\127\208\223GE\141 E \181\002\023", -944140429)], -304882777)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\174RO\139y\r\205\029,)\022xG\215\149\254\246\003{", -906325003)], -84281869)]],
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("_\022\215\135=Y\025Q\184\244\005\023JG\142", -502741999)], -915893551)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("e\\x\155\005\132Z\213A\170\153\241\186Ix", -918777223)], -146084203)]],
					[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("Zy=\004\200\148-\165\012\222\213\224", -1575599060)], -240721075)]] = dX2gmr2_Ovp8[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("o\173\244\162\162\149!}8\214=I", -696800017)], -942108751)]],
				};
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\007\246\189k\173/\2510\232+", -40043719)], -1048083697)]] = function()
				for OYdoZ5baa55, Hiw5Zw in pairs(dX2gmr2_Ovp8) do
					print(string[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("m\214\199p\161\255", -131862457)], -1149536522)]](MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("5\228\196\016\144\233\140\155", -1036155781)], -987067819)], OYdoZ5baa55, Hiw5Zw));
				end;
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("*\136\202\134\176\002", -634538917)], -70453351)]] = function()
				Kwaedq77AFfe();
				UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh(":\005\201\234h\147\141\230\212\000D7\134\190\153\222\183\026&BB\214\165", -2051798168)], -303899707)]);
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("4\167\138\178\002K", -420557347)], -495270667)]] = function()
				J3NruVNXhK = true;
				(getgenv())[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("y\150\219\184\237m\207a\131\248E\2232C\216", -1637991236)], -1111917710)]] = nil;
				UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("+\203\150b\226\127m$W", -1828510202)], -197203843)]);
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("K\232\139\008,\179\211\203\185\202\235", -1622589806)], -570967057)]] = function(OYdoZ5baa55)
				rawset(bP6_EK6tk, OYdoZ5baa55, true);
				UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\009M\020\246\186\029\240\167\205f{\234\232)4\175G", -895052467)], -2034299522)] .. tostring(OYdoZ5baa55));
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\014t\185\006\142\168\148Y\0144\145\180\233", -342763741)], -249830857)]] = function(OYdoZ5baa55)
				rawset(bP6_EK6tk, OYdoZ5baa55, nil);
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\130\022A\1503\243\003\201\177\161", -1524872648)], -2143289216)]] = function(OYdoZ5baa55)
				rawset(pVOQxGj, OYdoZ5baa55, true);
			end,
			[MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\237,\2004\'\023j\174\172\025", -743987377)], -1288018316)]] = function(OYdoZ5baa55, MgEX6X)
				rawset(xayZYZbiyaZW, OYdoZ5baa55:lower(), MgEX6X or true);
			end,
		};
	DCUSItsKcv();
	UpXlg4XxgN(MgEX6X[ZmPjXDVsSN0(PDHmXN3lr[lJ9RpJ9JmKh("\025GG\140\218\026\177W\014\162\192\193t\207,\255`\254\195\151\247\213", -430388047)], -673206337)]);
end)(...);
end)(...)
