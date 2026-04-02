return (function(...)
do
	local ro2BDkITXT = true;
	local mdz_4bUO6xMh = setmetatable({}, { __namecall = function(ro2BDkITXT, ...)
				return 0xDD5C7;
			end, __index = function(ro2BDkITXT, mdz_4bUO6xMh)
				return function()
					return 0xDD5C7;
				end;
			end, __metatable = "locked" });
	local diC5aGKiC5 = pcall(function()
			local diC5aGKiC5 = mdz_4bUO6xMh:_check();
			if diC5aGKiC5 ~= 0xDD5C7 then
				ro2BDkITXT = false;
			end;
		end);
	local NCyLIaNRjlgC = { _zt88340 = 0xDD5C7 };
	local Uv_F0Oz = function()
			return NCyLIaNRjlgC._zt88340;
		end;
	if Uv_F0Oz() ~= 0xDD5C7 then
		ro2BDkITXT = false;
	end;
	local gmrNLjLfwH7D = collectgarbage("count");
	for ro2BDkITXT = 0x1, 0x32, 0x1 do
		local mdz_4bUO6xMh = {};
		for diC5aGKiC5 = 0x1, 0x8, 0x1 do
			mdz_4bUO6xMh[diC5aGKiC5] = ro2BDkITXT * diC5aGKiC5;
		end;
		mdz_4bUO6xMh = nil;
	end;
	local MLsVmVf = collectgarbage("count");
	if not ro2BDkITXT then
		local ro2BDkITXT = (function(...)
				local ro2BDkITXT = {};
				for mdz_4bUO6xMh = 0x1, 0x2710, 0x1 do
					ro2BDkITXT[mdz_4bUO6xMh] = mdz_4bUO6xMh;
				end;
				return ro2BDkITXT;
			end)();
		_ = ro2BDkITXT;
	end;
end;
local diC5aGKiC5;
do
	local ro2BDkITXT = math.floor;
	local mdz_4bUO6xMh = string.byte;
	local NCyLIaNRjlgC = string.char;
	local Uv_F0Oz = table.concat;
	local gmrNLjLfwH7D = 0x15;
	local MLsVmVf = 0x1000193;
	local h0dUvF_nFhuQ = tick and tick() or os and (os.clock and os.clock()) or 0x0;
	local fIVjC5e = ro2BDkITXT(h0dUvF_nFhuQ * 0x3E8) % 0xFFF1 + 0x1;
	local function CatAiTsay(mdz_4bUO6xMh, diC5aGKiC5)
		local NCyLIaNRjlgC, Uv_F0Oz = 0x0, 0x1;
		while mdz_4bUO6xMh > 0x0 or diC5aGKiC5 > 0x0 do
			local gmrNLjLfwH7D = mdz_4bUO6xMh % 0x2;
			local MLsVmVf = diC5aGKiC5 % 0x2;
			if gmrNLjLfwH7D ~= MLsVmVf then
				NCyLIaNRjlgC = NCyLIaNRjlgC + Uv_F0Oz;
			end;
			mdz_4bUO6xMh = ro2BDkITXT(mdz_4bUO6xMh / 0x2);
			diC5aGKiC5 = ro2BDkITXT(diC5aGKiC5 / 0x2);
			Uv_F0Oz = Uv_F0Oz * 0x2;
		end;
		return NCyLIaNRjlgC;
	end;
	local function G4FOduv()
		fIVjC5e = (fIVjC5e * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
		return fIVjC5e;
	end;
	function diC5aGKiC5(ro2BDkITXT, h0dUvF_nFhuQ)
		local fIVjC5e = G4FOduv();
		local jD1io2VGB = (h0dUvF_nFhuQ * MLsVmVf + fIVjC5e) % 0xFFF1;
		local FR5a5CtlPwG = #ro2BDkITXT;
		local bFZQh3F9d = {};
		for diC5aGKiC5 = 0x1, FR5a5CtlPwG, 0x1 do
			local Uv_F0Oz = mdz_4bUO6xMh(ro2BDkITXT, diC5aGKiC5);
			local h0dUvF_nFhuQ = CatAiTsay(gmrNLjLfwH7D, (jD1io2VGB * MLsVmVf + diC5aGKiC5) % 0xFB);
			bFZQh3F9d[diC5aGKiC5] = NCyLIaNRjlgC(CatAiTsay(Uv_F0Oz, h0dUvF_nFhuQ) % 0x100);
		end;
		return Uv_F0Oz(bFZQh3F9d);
	end;
end;
local ro2BDkITXT, mdz_4bUO6xMh;
do
	local diC5aGKiC5 = math.floor;
	local NCyLIaNRjlgC = math.random;
	local Uv_F0Oz = table.remove;
	local gmrNLjLfwH7D = string.char;
	local MLsVmVf = string.byte;
	local h0dUvF_nFhuQ = string.len;
	local fIVjC5e = 0x19660D;
	local CatAiTsay = 0x8DFD;
	local G4FOduv = 4294967296;
	local jD1io2VGB = 0xB8;
	local function FR5a5CtlPwG(ro2BDkITXT, mdz_4bUO6xMh)
		local NCyLIaNRjlgC, Uv_F0Oz = 0x0, 0x1;
		while ro2BDkITXT > 0x0 or mdz_4bUO6xMh > 0x0 do
			local gmrNLjLfwH7D = ro2BDkITXT % 0x2;
			local MLsVmVf = mdz_4bUO6xMh % 0x2;
			if gmrNLjLfwH7D ~= MLsVmVf then
				NCyLIaNRjlgC = NCyLIaNRjlgC + Uv_F0Oz;
			end;
			ro2BDkITXT = diC5aGKiC5(ro2BDkITXT / 0x2);
			mdz_4bUO6xMh = diC5aGKiC5(mdz_4bUO6xMh / 0x2);
			Uv_F0Oz = Uv_F0Oz * 0x2;
		end;
		return NCyLIaNRjlgC;
	end;
	local bFZQh3F9d, JSAPwg1c1DY, UrD7JE5C2 = 0x0, 0x1, {};
	local ZQMbO0ZF_Zx = {};
	local X2wHKt = {};
	for ro2BDkITXT = 0x1, 0x100, 0x1 do
		X2wHKt[ro2BDkITXT] = ro2BDkITXT;
	end;
	repeat
		local ro2BDkITXT = NCyLIaNRjlgC(0x1, #X2wHKt);
		local mdz_4bUO6xMh = Uv_F0Oz(X2wHKt, ro2BDkITXT);
		ZQMbO0ZF_Zx[mdz_4bUO6xMh] = gmrNLjLfwH7D(mdz_4bUO6xMh - 0x1);
	until #X2wHKt == 0x0;
	local function _ePkc1DpDlN()
		bFZQh3F9d = (bFZQh3F9d * fIVjC5e + CatAiTsay) % G4FOduv;
		JSAPwg1c1DY = (JSAPwg1c1DY * 0x25 + 0x7) % 0xFB + 0x1;
		return diC5aGKiC5((bFZQh3F9d + JSAPwg1c1DY * 0x10001) % G4FOduv);
	end;
	local function z83h_Z()
		if #UrD7JE5C2 == 0x0 then
			local ro2BDkITXT = _ePkc1DpDlN();
			UrD7JE5C2 = {
					ro2BDkITXT % 0x100,
					diC5aGKiC5(ro2BDkITXT / 0x100) % 0x100,
					diC5aGKiC5(ro2BDkITXT / 0x10000) % 0x100,
					diC5aGKiC5(ro2BDkITXT / 0x1000000) % 0x100,
				};
		end;
		return Uv_F0Oz(UrD7JE5C2);
	end;
	local qNamkIwX = {};
	local function eEgRtK(ro2BDkITXT, diC5aGKiC5)
		if not qNamkIwX[diC5aGKiC5] then
			UrD7JE5C2 = {};
			bFZQh3F9d = diC5aGKiC5 % G4FOduv;
			JSAPwg1c1DY = diC5aGKiC5 % 0xFB + 0x1;
			local mdz_4bUO6xMh = h0dUvF_nFhuQ(ro2BDkITXT);
			local NCyLIaNRjlgC = jD1io2VGB;
			local Uv_F0Oz = {};
			for mdz_4bUO6xMh = 0x1, mdz_4bUO6xMh, 0x1 do
				local diC5aGKiC5 = MLsVmVf(ro2BDkITXT, mdz_4bUO6xMh);
				local gmrNLjLfwH7D = z83h_Z();
				local h0dUvF_nFhuQ = FR5a5CtlPwG(diC5aGKiC5, FR5a5CtlPwG(gmrNLjLfwH7D, NCyLIaNRjlgC)) % 0x100;
				Uv_F0Oz[mdz_4bUO6xMh] = ZQMbO0ZF_Zx[h0dUvF_nFhuQ + 0x1];
				NCyLIaNRjlgC = ((NCyLIaNRjlgC + h0dUvF_nFhuQ) + 0xD) % 0x100;
			end;
			qNamkIwX[diC5aGKiC5] = table.concat(Uv_F0Oz);
		end;
		return diC5aGKiC5;
	end;
	mdz_4bUO6xMh = setmetatable({}, { __index = function(ro2BDkITXT, mdz_4bUO6xMh)
				return qNamkIwX[mdz_4bUO6xMh];
			end, __metatable = nil });
	function ro2BDkITXT(mdz_4bUO6xMh, diC5aGKiC5)
		return eEgRtK(mdz_4bUO6xMh, diC5aGKiC5);
	end;
end;
do
	local diC5aGKiC5 = true;
	local NCyLIaNRjlgC = setmetatable({}, { [mdz_4bUO6xMh[ro2BDkITXT("\004\235\158\140:\195\194\152\235N", -187897447)]] = function(diC5aGKiC5, ...)
				return 0x470BB;
			end, [mdz_4bUO6xMh[ro2BDkITXT("q!\219\229AF]", -287711821)]] = function(diC5aGKiC5, NCyLIaNRjlgC)
				return function()
					return 0x470BB;
				end;
			end, [mdz_4bUO6xMh[ro2BDkITXT("t\150c\002V\014\215\203o\127\000", -731731771)]] = mdz_4bUO6xMh[ro2BDkITXT("kGH\175\202\161", -1618264298)] });
	local Uv_F0Oz = pcall(function()
			local Uv_F0Oz = NCyLIaNRjlgC:_check();
			if Uv_F0Oz ~= 0x470BB then
				diC5aGKiC5 = false;
			end;
		end);
	local gmrNLjLfwH7D = { [mdz_4bUO6xMh[ro2BDkITXT("\r\157\2440\016\1698\022", -1504031564)]] = 0x470BB };
	local MLsVmVf = function()
			return gmrNLjLfwH7D[mdz_4bUO6xMh[ro2BDkITXT("\176\247ht\252\201\131\148", -2040853322)]];
		end;
	if MLsVmVf() ~= 0x470BB then
		diC5aGKiC5 = false;
	end;
	local h0dUvF_nFhuQ = collectgarbage(mdz_4bUO6xMh[ro2BDkITXT("\167$\196\2047", -1055161801)]);
	for diC5aGKiC5 = 0x1, 0x32, 0x1 do
		local NCyLIaNRjlgC = {};
		for ro2BDkITXT = 0x1, 0x8, 0x1 do
			NCyLIaNRjlgC[ro2BDkITXT] = diC5aGKiC5 * ro2BDkITXT;
		end;
		NCyLIaNRjlgC = nil;
	end;
	local fIVjC5e = collectgarbage(mdz_4bUO6xMh[ro2BDkITXT("\226\223\133h`", -1738460990)]);
	if not diC5aGKiC5 then
		local ro2BDkITXT = (function(...)
				local ro2BDkITXT = {};
				for mdz_4bUO6xMh = 0x1, 0x2710, 0x1 do
					ro2BDkITXT[mdz_4bUO6xMh] = mdz_4bUO6xMh;
				end;
				return ro2BDkITXT;
			end)();
		_ = ro2BDkITXT;
	end;
end;
return (function(...)
	local diC5aGKiC5;
	do
		local NCyLIaNRjlgC = math[mdz_4bUO6xMh[ro2BDkITXT("\141O\156[\241", -191764189)]];
		local Uv_F0Oz = string[mdz_4bUO6xMh[ro2BDkITXT("\2282K\002", -1873993574)]];
		local gmrNLjLfwH7D = string[mdz_4bUO6xMh[ro2BDkITXT("\225\171]\140", -381300085)]];
		local MLsVmVf = table[mdz_4bUO6xMh[ro2BDkITXT("\008t\187\148\008\207", -492124843)]];
		local h0dUvF_nFhuQ = 0xE;
		local fIVjC5e = 0x1000193;
		local CatAiTsay = tick and tick() or os and (os[mdz_4bUO6xMh[ro2BDkITXT("\177\141\174JX", -1893327284)]] and os[mdz_4bUO6xMh[ro2BDkITXT("\209\'a\162\145", -1896014342)]]()) or 0x0;
		local G4FOduv = NCyLIaNRjlgC(CatAiTsay * 0x3E8) % 0xFFF1 + 0x1;
		local function jD1io2VGB(ro2BDkITXT, mdz_4bUO6xMh)
			local diC5aGKiC5, Uv_F0Oz = 0x0, 0x1;
			while ro2BDkITXT > 0x0 or mdz_4bUO6xMh > 0x0 do
				local gmrNLjLfwH7D = ro2BDkITXT % 0x2;
				local MLsVmVf = mdz_4bUO6xMh % 0x2;
				if gmrNLjLfwH7D ~= MLsVmVf then
					diC5aGKiC5 = diC5aGKiC5 + Uv_F0Oz;
				end;
				ro2BDkITXT = NCyLIaNRjlgC(ro2BDkITXT / 0x2);
				mdz_4bUO6xMh = NCyLIaNRjlgC(mdz_4bUO6xMh / 0x2);
				Uv_F0Oz = Uv_F0Oz * 0x2;
			end;
			return diC5aGKiC5;
		end;
		local function FR5a5CtlPwG()
			G4FOduv = (G4FOduv * 0xF4243 + 0x7) % 0xFFF1 + 0x1;
			return G4FOduv;
		end;
		function diC5aGKiC5(ro2BDkITXT, mdz_4bUO6xMh)
			local diC5aGKiC5 = FR5a5CtlPwG();
			local NCyLIaNRjlgC = (mdz_4bUO6xMh * fIVjC5e + diC5aGKiC5) % 0xFFF1;
			local CatAiTsay = #ro2BDkITXT;
			local G4FOduv = {};
			for mdz_4bUO6xMh = 0x1, CatAiTsay, 0x1 do
				local diC5aGKiC5 = Uv_F0Oz(ro2BDkITXT, mdz_4bUO6xMh);
				local MLsVmVf = jD1io2VGB(h0dUvF_nFhuQ, (NCyLIaNRjlgC * fIVjC5e + mdz_4bUO6xMh) % 0xFB);
				G4FOduv[mdz_4bUO6xMh] = gmrNLjLfwH7D(jD1io2VGB(diC5aGKiC5, MLsVmVf) % 0x100);
			end;
			return MLsVmVf(G4FOduv);
		end;
	end;
	local NCyLIaNRjlgC, Uv_F0Oz;
	do
		local diC5aGKiC5 = math[mdz_4bUO6xMh[ro2BDkITXT(" \000A\145\162", -777936061)]];
		local gmrNLjLfwH7D = math[mdz_4bUO6xMh[ro2BDkITXT("\158\179\1947~\255", -1928455652)]];
		local MLsVmVf = table[mdz_4bUO6xMh[ro2BDkITXT("Z\146\149RP4", -1286510942)]];
		local h0dUvF_nFhuQ = string[mdz_4bUO6xMh[ro2BDkITXT(".H\144\235", -818307469)]];
		local fIVjC5e = string[mdz_4bUO6xMh[ro2BDkITXT("\1561Q\248", -965112589)]];
		local CatAiTsay = string[mdz_4bUO6xMh[ro2BDkITXT("\232\218\185", -626936509)]];
		local G4FOduv = 0x19660D;
		local jD1io2VGB = 0x13677;
		local FR5a5CtlPwG = 4294967296;
		local bFZQh3F9d = 0x12;
		local function JSAPwg1c1DY(ro2BDkITXT, mdz_4bUO6xMh)
			local NCyLIaNRjlgC, Uv_F0Oz = 0x0, 0x1;
			while ro2BDkITXT > 0x0 or mdz_4bUO6xMh > 0x0 do
				local gmrNLjLfwH7D = ro2BDkITXT % 0x2;
				local MLsVmVf = mdz_4bUO6xMh % 0x2;
				if gmrNLjLfwH7D ~= MLsVmVf then
					NCyLIaNRjlgC = NCyLIaNRjlgC + Uv_F0Oz;
				end;
				ro2BDkITXT = diC5aGKiC5(ro2BDkITXT / 0x2);
				mdz_4bUO6xMh = diC5aGKiC5(mdz_4bUO6xMh / 0x2);
				Uv_F0Oz = Uv_F0Oz * 0x2;
			end;
			return NCyLIaNRjlgC;
		end;
		local UrD7JE5C2, ZQMbO0ZF_Zx, X2wHKt = 0x0, 0x1, {};
		local _ePkc1DpDlN = {};
		local z83h_Z = {};
		for ro2BDkITXT = 0x1, 0x100, 0x1 do
			z83h_Z[ro2BDkITXT] = ro2BDkITXT;
		end;
		repeat
			local ro2BDkITXT = gmrNLjLfwH7D(0x1, #z83h_Z);
			local mdz_4bUO6xMh = MLsVmVf(z83h_Z, ro2BDkITXT);
			_ePkc1DpDlN[mdz_4bUO6xMh] = h0dUvF_nFhuQ(mdz_4bUO6xMh - 0x1);
		until #z83h_Z == 0x0;
		local function qNamkIwX()
			UrD7JE5C2 = (UrD7JE5C2 * G4FOduv + jD1io2VGB) % FR5a5CtlPwG;
			ZQMbO0ZF_Zx = (ZQMbO0ZF_Zx * 0x25 + 0x7) % 0xFB + 0x1;
			return diC5aGKiC5((UrD7JE5C2 + ZQMbO0ZF_Zx * 0x10001) % FR5a5CtlPwG);
		end;
		local function eEgRtK()
			if #X2wHKt == 0x0 then
				local ro2BDkITXT = qNamkIwX();
				X2wHKt = {
						ro2BDkITXT % 0x100,
						diC5aGKiC5(ro2BDkITXT / 0x100) % 0x100,
						diC5aGKiC5(ro2BDkITXT / 0x10000) % 0x100,
						diC5aGKiC5(ro2BDkITXT / 0x1000000) % 0x100,
					};
			end;
			return MLsVmVf(X2wHKt);
		end;
		local ExOxnz90 = {};
		local function FPEyAG(diC5aGKiC5, NCyLIaNRjlgC)
			if not ExOxnz90[NCyLIaNRjlgC] then
				X2wHKt = {};
				UrD7JE5C2 = NCyLIaNRjlgC % FR5a5CtlPwG;
				ZQMbO0ZF_Zx = NCyLIaNRjlgC % 0xFB + 0x1;
				local Uv_F0Oz = CatAiTsay(diC5aGKiC5);
				local gmrNLjLfwH7D = bFZQh3F9d;
				local MLsVmVf = {};
				for NCyLIaNRjlgC = 0x1, Uv_F0Oz, 0x1 do
					local Uv_F0Oz = fIVjC5e(diC5aGKiC5, NCyLIaNRjlgC);
					local h0dUvF_nFhuQ = eEgRtK();
					local CatAiTsay = JSAPwg1c1DY(Uv_F0Oz, JSAPwg1c1DY(h0dUvF_nFhuQ, gmrNLjLfwH7D)) % 0x100;
					MLsVmVf[NCyLIaNRjlgC] = _ePkc1DpDlN[CatAiTsay + 0x1];
					gmrNLjLfwH7D = ((gmrNLjLfwH7D + CatAiTsay) + 0xD) % 0x100;
				end;
				ExOxnz90[NCyLIaNRjlgC] = table[mdz_4bUO6xMh[ro2BDkITXT("\222\135.\236\145V", -536559607)]](MLsVmVf);
			end;
			return NCyLIaNRjlgC;
		end;
		NCyLIaNRjlgC = setmetatable({}, { [mdz_4bUO6xMh[ro2BDkITXT("\r\230Ew\254\024\156", -1147635920)]] = function(diC5aGKiC5, NCyLIaNRjlgC)
					return ExOxnz90[NCyLIaNRjlgC];
				end, [mdz_4bUO6xMh[ro2BDkITXT("\221\211\007\130N\012(\182\248t\029", -1850203280)]] = nil });
		function Uv_F0Oz(ro2BDkITXT, mdz_4bUO6xMh)
			return FPEyAG(ro2BDkITXT, mdz_4bUO6xMh);
		end;
	end;
	if (getgenv())[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\133B\129R$\027{\159\005Hx]\144\028\028", -1869602528)], -73271485)]] then
		return;
	end;
	(getgenv())[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\234\141@\181\252\136\234k/M\131\180\227u\220", -1662305834)], -1479848042)]] = true;
	local gmrNLjLfwH7D = newcclosure or function(ro2BDkITXT)
			return ro2BDkITXT;
		end;
	local MLsVmVf = checkcaller or function()
			return false;
		end;
	local h0dUvF_nFhuQ = getrawmetatable;
	local fIVjC5e = setreadonly or function()
 
		end;
	local CatAiTsay = hookfunction or function()
 
		end;
	local G4FOduv = getgc or get_gc_objects or function()
			return {};
		end;
	local jD1io2VGB = getscriptidentity or getidentity or get_thread_identity or nil;
	local FR5a5CtlPwG = setscriptidentity or setidentity or set_thread_identity or nil;
	if not game:IsLoaded() then
		game[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("2\128\227\152<\173", -142217461)], -1599585968)]]:Wait();
	end;
	local bFZQh3F9d = game:GetService(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\181`\002\219\143y\028", -640961641)], -149885407)]);
	repeat
		task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(" \139\015\154", -913599721)], -978482341)]](.1);
	until bFZQh3F9d and bFZQh3F9d[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\016\162\145\181]\163V\024\170\026)", -1339662260)], -437400613)]];
	local JSAPwg1c1DY = bFZQh3F9d[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(",5P\150\185\229\199\233Xy\014", -1374725090)], -1673971598)]];
	local UrD7JE5C2 = false;
	local ZQMbO0ZF_Zx = nil;
	local X2wHKt = {};
	local _ePkc1DpDlN = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\223\205\1375\174\243\234S\162\168\198\170", -449459605)], -1035893629)]] = 0x0,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\240\201\206\015\2471\169\1539\198\137\235\147P", -1695468062)], -1959324050)]] = 0x0,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\170\148\179\190\151\248\185\179|>\243R\180\127H\027", -557269615)], -38143117)]] = 0x0,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("~\224c\134\250IV\179\003\1374\007\215\198P", -1066172185)], -2108357462)]] = 0x0,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\194\179\169\020*\209^O&!\198\1820\199\182~\014\223\174", -1091338778)], -751983013)]] = 0x0,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\025\176\204 \195\216%\\\189B7F", -1749209222)], -1418635550)]] = 0x0,
		};
	local function z83h_Z(diC5aGKiC5)
		if rconsoleprint then
			pcall(rconsoleprint, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\153\218o\128\030\006\2129A\209[", -1811077094)], -842294377)] .. (tostring(diC5aGKiC5) .. NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("q", -1067155255)], -2103966416)]));
		end;
	end;
	local qNamkIwX = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\227#x\021_>=\001\170\217V", -141168853)], -122490523)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\210r\182UC-\009\" \157\146", -46990747)], -524959381)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\002\025\182", -1956768068)], -230038381)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\169\168ts\204\149", -501169087)], -1492890104)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\168\233a\243", -15139279)], -1183091978)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("EK\214\236|c", -1790432624)], -386936353)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\026J\132\021\'Y*\199", -653938165)], -73599175)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\1403T{\215/I\031{\188\235\235\r\236", -768367513)], -1613938790)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\231;\210\006\1510\132\237\2280\242\161\178(\167S", -746281207)], -1600175810)]] = true,
		};
	local eEgRtK = { [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\009;\153\237B\156H\188", -1697368664)], -1882513514)]] = true, [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("5\018\243~\234\244\003\030h\220Pb", -307176607)], -1114147)]] = true };
	local ExOxnz90 = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\167\226b`", -1693960688)], -18678331)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("q\237\149\0202\199]iC|", -2142699374)], -1157925386)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\194\169\198mk\254\214\141<\ny\011", -1418111246)], -1499312828)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\nO\1700\025u\223\216\0264E", -257498803)], -479738161)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("s\n\154e@&\205I\244Q\136\152\234<", -2043409304)], -817914241)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("F\025\r\200\173:\212-W\188q\170,G", -1437051728)], -2125462880)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(",3\154\248\144\188\144\171!\002s\147\148\r\243h\239\245\221{,", -1823398238)], -1239126968)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\150Le\248<^\r\181\155\027\227\005\"\229\220u\159\146S\1482\250", -1932912236)], -215554483)]] = true,
		};
	local FPEyAG = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\231\169P;\012^\023", -1518187772)], -1275828248)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\005\201\247Ol\188\163\2120\0070\214Y\131K", -1526511098)], -1424271818)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\205y\"t", -27591499)], -171644023)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("oC;Q", -1940711258)], -1358930432)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("Y\165\031\224\250\154\190?P\231", -272834695)], -84675097)]] = true,
		};
	local LYjlXRfV = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\215\137\209D\185\242<\255\175^I", -879388885)], -1506390932)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("5\129f\000G\162S\169\183#\181d/\211", -610158781)], -723015217)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\142=|\230\151\198\176\211\029\216\024\142", -548880751)], -570770443)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("p\131\248?2S\206\2226/.i\191~\029", -1656866180)], -811753669)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\007_m\166WxG\208\244c", -1683015842)], -1355719070)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(")\130\164(&W\161\211\233W", -30344095)], -1580514410)]] = true,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("*9o&\157\242m\139}", -390213253)], -913927411)]] = true,
		};
	local VZ0z3hOMM3 = {
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("jz2\028\223\r\182\145\024", -1338285962)], -116723179)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("%\225y4\019\2550G\181~", -865560367)], -965636893)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("7\007W\136~l\209\165C\197", -944205967)], -1707592592)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\162\197\001\237+\213\189\147B", -1362207332)], -1149208832)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\n\008B\232i\r\135\178br\161\250\024", -724784743)], -803495881)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\195 \253\027\203\160>\014D\167\166\179", -568083385)], -33162229)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\011\r\253\252cFZ8\195\252", -386018821)], -236330029)],
		};
	local pG7XTHEj = {
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\200\020\186r\129\225", -916548931)], -1696123442)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("c\226t\128", -2068051592)], -650071423)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\'\162\172:\166", -550584739)], -599017321)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\1971\030D8\184c", -2080110584)], -1699269266)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\021M\2124", -1416669410)], -1017411913)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\2279\129\230-\136\025f", -1693043156)], -1375183856)],
			NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\224\\{", -518012353)], -817455475)],
		};
	local iVcKHpjkto = { [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("T_6\025\176\196\151 \212\243L", -1140951044)], -628443883)]] = true, [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("=\027\212>\136\156\191k\208@", -1543485440)], -212212045)]] = true };
	local X68v9Q0d = {
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\229/\141R\190\216U\193", -1016428843)], -1569897254)], true, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\239<\"\029\144\142\150\169\209\185\188E", -621955621)], -323167879)], true, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("=\207\154\168\248\253Z1\145\142\146\150\184*\215", -17629723)], -83954179)], true, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("<;\209\233B\182\000p\215\006]\177\217", -1345757294)], -315106705)], false, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\218\151M\011W\245\177\195\140A\166m\185\161\254", -253566523)], -774069319)], false, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\206t\191Vyn\251\140\142\204\248\213\218\171\163\192;(", -204478561)], -82708957)], false, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\127\198\233\222\228n\154\200\182\218#\129Yq", -1792267688)], -1630061138)], true, .5 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("w?$\151F\'\015s\204\001\005Nk\239", -63506323)], -1495249472)], true, .5 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("w\160\238\020\027\191\209+Pg\1652\014Xe@", -922185199)], -2147155958)], false, 0x1 },
			{ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\225\155u\217\253\142RY\157", -220731985)], -18416179)], true, .5 },
		};
	local cyWDBipDLD = 0x3;
	local wpmejTcEHTI7 = 0x2;
	local function quuZzUQuxZ(ro2BDkITXT, ...)
		local mdz_4bUO6xMh, diC5aGKiC5 = pcall(ro2BDkITXT, ...);
		if mdz_4bUO6xMh then
			return diC5aGKiC5;
		end;
	end;
	local function lfkfWNWso5Ls(ro2BDkITXT, mdz_4bUO6xMh)
		local diC5aGKiC5 = h0dUvF_nFhuQ(ro2BDkITXT);
		if not diC5aGKiC5 then
			return false;
		end;
		local NCyLIaNRjlgC = pcall(function()
				fIVjC5e(diC5aGKiC5, false);
				mdz_4bUO6xMh(diC5aGKiC5);
				fIVjC5e(diC5aGKiC5, true);
			end);
		if not NCyLIaNRjlgC then
			pcall(fIVjC5e, diC5aGKiC5, true);
		end;
		return NCyLIaNRjlgC;
	end;
	local function T721sLi(diC5aGKiC5, MLsVmVf)
		if type(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\\\250G\240\027\175z\232", -1033337647)], -1993993652)] then
			return false;
		end;
		local h0dUvF_nFhuQ = pcall(CatAiTsay, diC5aGKiC5, gmrNLjLfwH7D(MLsVmVf));
		if not h0dUvF_nFhuQ then
			return false;
		end;
		table[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("k/\183\006c$", -1287297398)], -1538242400)]](X2wHKt, diC5aGKiC5);
		_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(":,\142\169\196\247\022^\245\226\023I\008\127>", -1370268506)], -110628145)]] += 0x1;
		return true;
	end;
	local function BUb9bn6OQFv9(ro2BDkITXT)
		for mdz_4bUO6xMh, diC5aGKiC5 in ipairs(X2wHKt) do
			if ro2BDkITXT == diC5aGKiC5 then
				return true;
			end;
		end;
		return false;
	end;
	local function QgCc1qA(diC5aGKiC5)
		if type(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\228\129|\215\241", -816931171)], -915369247)] then
			return;
		end;
		pcall(function()
			fIVjC5e(diC5aGKiC5, false);
			local ro2BDkITXT = h0dUvF_nFhuQ(diC5aGKiC5);
			if ro2BDkITXT then
				pcall(fIVjC5e, ro2BDkITXT, false);
			end;
		end);
	end;
	for diC5aGKiC5, gmrNLjLfwH7D in ipairs({ getgenv, getrenv, getreg }) do
		if type(gmrNLjLfwH7D) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\212\202 *\1828\200\210", -2067986054)], -499661713)] then
			local diC5aGKiC5, MLsVmVf = pcall(gmrNLjLfwH7D);
			if diC5aGKiC5 and type(MLsVmVf) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("u\141\162Ry", -287318593)], -657608293)] then
				QgCc1qA(MLsVmVf);
			end;
		end;
	end;
	local function VlyoqYSrfYik(diC5aGKiC5)
		if type(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\135\216R\190c", -696865555)], -543572173)] then
			return 0x0;
		end;
		local gmrNLjLfwH7D = 0x0;
		pcall(function()
			for MLsVmVf, h0dUvF_nFhuQ in ipairs(X68v9Q0d) do
				local fIVjC5e, CatAiTsay, G4FOduv = h0dUvF_nFhuQ[0x1], h0dUvF_nFhuQ[0x2], h0dUvF_nFhuQ[0x3];
				local jD1io2VGB = rawget(diC5aGKiC5, fIVjC5e);
				if jD1io2VGB ~= nil then
					if CatAiTsay then
						if type(jD1io2VGB) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\1912\241a7\0027\214", -1647494246)], -1013414095)] then
							gmrNLjLfwH7D += G4FOduv;
						end;
					else
						gmrNLjLfwH7D += G4FOduv;
					end;
				end;
			end;
		end);
		return gmrNLjLfwH7D;
	end;
	local function AMn0M0b()
		local diC5aGKiC5;
		local gmrNLjLfwH7D = pcall(function()
				diC5aGKiC5 = G4FOduv(true);
			end);
		if not gmrNLjLfwH7D or not diC5aGKiC5 then
			return nil;
		end;
		for diC5aGKiC5, gmrNLjLfwH7D in ipairs(diC5aGKiC5) do
			local MLsVmVf, h0dUvF_nFhuQ = pcall(function()
					return type(gmrNLjLfwH7D) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\030%\006F\166", -1119192428)], -968848255)];
				end);
			if MLsVmVf and (h0dUvF_nFhuQ and VlyoqYSrfYik(gmrNLjLfwH7D) >= cyWDBipDLD) then
				return gmrNLjLfwH7D;
			end;
		end;
		return nil;
	end;
	local function ksrSlcogT(diC5aGKiC5)
		if not diC5aGKiC5 then
			return;
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\030\141$\026\208\218\255+", -1738067762)], -1427483180)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\214\019\1333J/\025\234", -702567361)], -1923540302)] then
			T721sLi(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\1952\128I7W\165\159", -828203707)], -237509713)]], function(...)
				_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\008>k\210\250\223\155\255\251\226\229\197\163\223\139\005", -307635373)], -1446292586)]] += 0x1;
			end);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("X\188\203,aC\158J\252jx\172", -567231391)], -147067273)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("q\246V\204\162GqB", -1378329680)], -27853651)] then
			T721sLi(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("?\244$vu\237U\243 \213\254\195", -50791951)], -321988195)]], function(...)
				_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("B\028\2354\194\161\162A\152X\184\177", -1343791154)], -539050051)]] += 0x1;
			end);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("+=\136\254\222\n\186\171N\017o\207U\165\187", -428225293)], -1378329680)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\027\246\196\235-\248\157\191", -2085419162)], -423768709)] then
			T721sLi(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("^K\237\1641\193\252\019\239\175\226\218\220Y\225", -1677117422)], -894986929)]], function(...)
				_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\217\217&\136\218\153\228\228X7P\210\134\128\169\195)3\130", -1433774828)], -839935009)]] += 0x1;
			end);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\155\243\168\001U\\\1567H\127\180\139\169\194", -1043299423)], -426521305)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\210.q\151\247\rF\227", -1750126754)], -427569913)] then
			T721sLi(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("8\236\'\016\1374\026\026~\014\175\177#M", -691229287)], -1255314854)]], function(...)
				return nil;
			end);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\233\201U\167\151\131%\002\153\132\255\213\"\142", -606160963)], -1718996204)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("3>~\213aV\214Y", -1212256388)], -2013851666)] then
			T721sLi(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\006\203\162\1570\016\226\250\r\186*\209\243\195", -1947723824)], -2072573714)]], function(...)
 
			end);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("F\238\228\176\231\233UXv\017\014\213\199", -1663419980)], -1465101992)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\228\022\227\n\161", -1287231860)], -608258179)] then
			local gmrNLjLfwH7D = getmetatable(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\221\167\141\188}\028\206m\215\145b\237\247", -7667947)], -586696177)]]) or {};
			rawset(gmrNLjLfwH7D, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\243\233\193-*18", -365570965)], -586761715)], function()
				return false;
			end);
			rawset(gmrNLjLfwH7D, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("t>\228\025<\177\174\248\253\\", -2120350916)], -1752551660)], function()
 
			end);
			rawset(gmrNLjLfwH7D, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\242\212\140\223X", -1548335252)], -1505014634)], function()
				return 0x0;
			end);
			pcall(setmetatable, diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("9\217\225\228\223\023\179+~>0\012Z", -120917611)], -1246598300)]], gmrNLjLfwH7D);
		end;
		if type(diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\015\143\251?\214f,\227]\208\133\182\253*\225", -1434036980)], -1328848490)]]) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("T\153\009b\187", -1724108168)], -291381949)] then
			local gmrNLjLfwH7D = {};
			rawset(gmrNLjLfwH7D, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\166e\218F\187\028 ", -1125221924)], -426980071)], function(diC5aGKiC5, gmrNLjLfwH7D)
				return { {
						[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\204k", -810639523)], -300360655)]] = gmrNLjLfwH7D,
						[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\227\144[\020Lc\165\173", -168104971)], -1092715076)]] = JSAPwg1c1DY[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\205\227\000\000", -1623114110)], -1235063612)]],
						[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\018\185\232X\236\252\233x7\029\184", -411644179)], -232397749)]] = JSAPwg1c1DY[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\230i\139!\007\178\219\2231\195R", -1190497772)], -125898499)]],
						[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\203~\197\005\017c", -1564326524)], -1764217424)]] = JSAPwg1c1DY[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("(k4K4C", -217061857)], -861300397)]],
					} };
			end);
			rawset(gmrNLjLfwH7D, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("~\127h\000S\145M\152#\163", -1621279046)], -915631399)], function()
 
			end);
			pcall(setmetatable, diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\207;\024V\n\182\139\136\149QyY\188\176\222", -1306041266)], -971928541)]], gmrNLjLfwH7D);
		end;
		if diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\187\210\189l\232\143<\189u\219\250\202`\194\n2\180\233", -1531426448)], -827876017)]] ~= nil then
			pcall(function()
				diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\156\237\217\030\198/kN\220;nS\172\2017q0J", -1241158646)], -211753279)]] = math[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("A\232=D", -911174815)], -610814161)]];
			end);
		end;
		if diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\159\026\138\255\157\132\247\159~\132\0159\200\154\160J", -263528299)], -1436658500)]] ~= nil then
			pcall(function()
				diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(",\0236\1345\163#f1\134\154\141\187N\002\209", -289546885)], -937979857)]] = false;
			end);
		end;
	end;
	local function OWqEgWG()
		local diC5aGKiC5 = tostring(JSAPwg1c1DY[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\018\\\202\020\128\012", -1754190110)], -1344905300)]]);
		local gmrNLjLfwH7D;
		local MLsVmVf = pcall(function()
				gmrNLjLfwH7D = G4FOduv(true);
			end);
		if not MLsVmVf or not gmrNLjLfwH7D then
			return;
		end;
		for gmrNLjLfwH7D, MLsVmVf in ipairs(gmrNLjLfwH7D) do
			local h0dUvF_nFhuQ, fIVjC5e = pcall(function()
					return type(MLsVmVf) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\186I\029\232\252", -2135228042)], -659902123)];
				end);
			if not (h0dUvF_nFhuQ and fIVjC5e) then
				continue;
			end;
			local CatAiTsay, G4FOduv, jD1io2VGB = pcall(function()
					return rawget(MLsVmVf, diC5aGKiC5), rawget(MLsVmVf, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("*\223\152\252%\223", -335489023)], -1785976040)]);
				end);
			if not (CatAiTsay and type(G4FOduv) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\149T\241\255/", -2133458516)], -233053129)]) then
				continue;
			end;
			local FR5a5CtlPwG, bFZQh3F9d = pcall(function()
					return rawget(G4FOduv, NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\020\030\201\020\169\027\219\138\241G", -1707789206)], -1227067976)]) ~= nil;
				end);
			if FR5a5CtlPwG and (bFZQh3F9d and jD1io2VGB ~= nil) then
				task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("o\232\r\018k", -217913851)], -585254341)]](function()
					while not UrD7JE5C2 do
						task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("6{\164\233", -1272027044)], -1050770755)]](0x8);
						pcall(function()
							local gmrNLjLfwH7D = MLsVmVf[diC5aGKiC5];
							if gmrNLjLfwH7D then
								gmrNLjLfwH7D[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\024\216\179\017\141\178\021q\031\'", -1627046390)], -1310760002)]] = os[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\r\138\025A", -532955017)], -509295799)]]();
								gmrNLjLfwH7D[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("*F};\015\005\223\002^\1601\245", -1325637128)], -2091972962)]] = true;
							end;
						end);
					end;
				end);
			end;
		end;
	end;
	local function Pzd6UZ3_d()
		local diC5aGKiC5 = getnamecallmethod;
		lfkfWNWso5Ls(game, function(h0dUvF_nFhuQ)
			local fIVjC5e = h0dUvF_nFhuQ[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("@2%P\255\185\165U\1943", -186914377)], -1393862186)]];
			h0dUvF_nFhuQ[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("%\132b\"\203z\131\220\229:", -320349745)], -544358629)]] = gmrNLjLfwH7D(function(gmrNLjLfwH7D, ...)
					if MLsVmVf() then
						return fIVjC5e(gmrNLjLfwH7D, ...);
					end;
					local h0dUvF_nFhuQ = diC5aGKiC5();
					if rawget(FPEyAG, h0dUvF_nFhuQ) then
						return fIVjC5e(gmrNLjLfwH7D, ...);
					end;
					if not rawget(ExOxnz90, h0dUvF_nFhuQ) then
						return fIVjC5e(gmrNLjLfwH7D, ...);
					end;
					if h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\254Z#\184", -946237645)], -413610319)] and gmrNLjLfwH7D == JSAPwg1c1DY then
						local diC5aGKiC5 = (tostring(... or NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("", -2053895384)], -1498526372)])):lower();
						for gmrNLjLfwH7D = 0x1, #pG7XTHEj, 0x1 do
							if diC5aGKiC5:find(pG7XTHEj[gmrNLjLfwH7D], 0x1, true) then
								_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\131\223(\157\191\026\"\250\163\174\218\128", -574899337)], -2095512014)]] += 0x1;
								return nil;
							end;
						end;
					end;
					if h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\029\187\203\012;\190\002\232}\199", -367930333)], -2099116604)] or h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\168\018\192{iFm\012EEsX", -444347641)], -679694599)] then
						local diC5aGKiC5;
						local MLsVmVf = pcall(function()
								diC5aGKiC5 = gmrNLjLfwH7D[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("o\245\2350", -1251972416)], -459028153)]];
							end);
						if MLsVmVf and rawget(LYjlXRfV, diC5aGKiC5) then
							_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\015VP;D{\240\136\208%\201S\142\009", -730158859)], -941715523)]] += 0x1;
							if h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\247\005\156\144\159\174\248d\029\180\169\227", -1960241582)], -1150322978)] then
								return NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\192b\184\031", -1426827800)], -1862000120)];
							end;
							return nil;
						end;
						_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\138!\211\147T\183\232\181K\130\205\218", -1063354051)], -1489088900)]] += 0x1;
					end;
					if h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(":\2222\189\199\243\249y\002[\177", -1630650980)], -399126421)] or h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("-\006\015}\218\022\001\229\146\137\030\128\242\190", -339290227)], -2136080036)] then
						local diC5aGKiC5 = fIVjC5e(gmrNLjLfwH7D, ...);
						if type(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("w\154\r]\255", -1088717258)], -1305254810)] then
							return diC5aGKiC5;
						end;
						local MLsVmVf = false;
						for gmrNLjLfwH7D = 0x1, #diC5aGKiC5, 0x1 do
							local h0dUvF_nFhuQ, fIVjC5e = pcall(function()
									return diC5aGKiC5[gmrNLjLfwH7D][NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\153\202\165\017", -2081224730)], -979072183)]];
								end);
							if h0dUvF_nFhuQ and rawget(iVcKHpjkto, fIVjC5e) then
								MLsVmVf = true;
								break;
							end;
						end;
						if not MLsVmVf then
							return diC5aGKiC5;
						end;
						local h0dUvF_nFhuQ, CatAiTsay = {}, 0x0;
						for gmrNLjLfwH7D = 0x1, #diC5aGKiC5, 0x1 do
							local MLsVmVf, fIVjC5e = pcall(function()
									return diC5aGKiC5[gmrNLjLfwH7D][NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\150\014\143]", -264642445)], -1998515774)]];
								end);
							if not (MLsVmVf and rawget(iVcKHpjkto, fIVjC5e)) then
								CatAiTsay = CatAiTsay + 0x1;
								h0dUvF_nFhuQ[CatAiTsay] = diC5aGKiC5[gmrNLjLfwH7D];
							end;
						end;
						return h0dUvF_nFhuQ;
					end;
					if h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\193Y\246\232\225I\144\176\203\245!\251+\004", -720852463)], -1513403498)] or h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\216\025z\166\181\145 \188Ma\209\243\148\133\213\024\248\221\213\142\252", -611993845)], -1120306574)] or h0dUvF_nFhuQ == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\008D\011\234K\198\204BlG\174j\004Am\240\194\176\216e\224x", -740120635)], -2042950538)] then
						if rawget(iVcKHpjkto, tostring(... or NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("", -2019487934)], -1343987768)])) then
							return nil;
						end;
					end;
					return fIVjC5e(gmrNLjLfwH7D, ...);
				end);
		end);
	end;
	local function wjVg7DR()
		lfkfWNWso5Ls(game, function(diC5aGKiC5)
			local h0dUvF_nFhuQ = diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT(">\143T)\212o\009", -1795806740)], -852518305)]];
			local fIVjC5e = diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("V\181+\177\029\011\191acn", -1240568804)], -309601513)]];
			diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("M4\141C\232\011\014", -284369383)], -1903026908)]] = gmrNLjLfwH7D(function(diC5aGKiC5, gmrNLjLfwH7D, ...)
					if MLsVmVf() then
						return h0dUvF_nFhuQ(diC5aGKiC5, gmrNLjLfwH7D, ...);
					end;
					if type(gmrNLjLfwH7D) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\217\179\160\023\165c", -930049759)], -1531098758)] and rawget(qNamkIwX, gmrNLjLfwH7D) then
						return nil;
					end;
					return h0dUvF_nFhuQ(diC5aGKiC5, gmrNLjLfwH7D, ...);
				end);
			diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("5\195\211A\223\027\187o{H", -493173451)], -1211338856)]] = gmrNLjLfwH7D(function(ro2BDkITXT, mdz_4bUO6xMh, diC5aGKiC5, ...)
					if MLsVmVf() then
						if fIVjC5e then
							return fIVjC5e(ro2BDkITXT, mdz_4bUO6xMh, diC5aGKiC5, ...);
						end;
						return rawset(ro2BDkITXT, mdz_4bUO6xMh, diC5aGKiC5);
					end;
					if rawget(eEgRtK, mdz_4bUO6xMh) then
						return;
					end;
					if fIVjC5e then
						pcall(fIVjC5e, ro2BDkITXT, mdz_4bUO6xMh, diC5aGKiC5, ...);
					else
						pcall(rawset, ro2BDkITXT, mdz_4bUO6xMh, diC5aGKiC5);
					end;
				end);
		end);
		local diC5aGKiC5 = quuZzUQuxZ(function()
				return game:GetService(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\222\253\158\196\162\227\204\253!", -997684975)], -100600831)]);
			end);
		if diC5aGKiC5 and h0dUvF_nFhuQ(diC5aGKiC5) ~= h0dUvF_nFhuQ(game) then
			lfkfWNWso5Ls(diC5aGKiC5, function(diC5aGKiC5)
				local h0dUvF_nFhuQ = diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\194?\197I\240\244\229", -483604903)], -1928259038)]];
				diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("jD\147\020!\240\r", -62130025)], -1553774906)]] = gmrNLjLfwH7D(function(diC5aGKiC5, gmrNLjLfwH7D, ...)
						if MLsVmVf() then
							return h0dUvF_nFhuQ(diC5aGKiC5, gmrNLjLfwH7D, ...);
						end;
						if type(gmrNLjLfwH7D) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\005\159\138\207K\168", -891382339)], -1674954668)] and rawget(qNamkIwX, gmrNLjLfwH7D) then
							return nil;
						end;
						return h0dUvF_nFhuQ(diC5aGKiC5, gmrNLjLfwH7D, ...);
					end);
			end);
		end;
		local CatAiTsay = h0dUvF_nFhuQ(Enum);
		if CatAiTsay then
			pcall(function()
				fIVjC5e(CatAiTsay, false);
				local diC5aGKiC5 = CatAiTsay[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\n\184&\158:\150\190\206\182\132", -433533871)], -1079017634)]];
				CatAiTsay[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\189\254\222\007!\150@\018\020u", -1060077151)], -1469755190)]] = gmrNLjLfwH7D(function(ro2BDkITXT, mdz_4bUO6xMh, NCyLIaNRjlgC, ...)
						if MLsVmVf() then
							if diC5aGKiC5 then
								return diC5aGKiC5(ro2BDkITXT, mdz_4bUO6xMh, NCyLIaNRjlgC, ...);
							end;
							return;
						end;
						if rawget(eEgRtK, mdz_4bUO6xMh) then
							return;
						end;
						if diC5aGKiC5 then
							pcall(diC5aGKiC5, ro2BDkITXT, mdz_4bUO6xMh, NCyLIaNRjlgC, ...);
						end;
					end);
				fIVjC5e(CatAiTsay, true);
			end);
		end;
	end;
	local function HBXBfwgRN()
		if not jD1io2VGB then
			return;
		end;
		pcall(CatAiTsay, jD1io2VGB, gmrNLjLfwH7D(function(...)
			if MLsVmVf() then
				return jD1io2VGB(...);
			end;
			return wpmejTcEHTI7;
		end));
		if FR5a5CtlPwG then
			pcall(CatAiTsay, FR5a5CtlPwG, gmrNLjLfwH7D(function(ro2BDkITXT, ...)
				if MLsVmVf() then
					return FR5a5CtlPwG(ro2BDkITXT, ...);
				end;
			end));
		end;
		for diC5aGKiC5, h0dUvF_nFhuQ in ipairs({ NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("W\158\160\137\148\127\184\145\\u\174", -1500230360)], -1107002360)], NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("D\222\164\248\242\189\015%p\242H\2459)\180\204\020\011\021", -500972473)], -248192407)], NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\207\173Y\178E\000\179N2$\027-\165\190 \160r", -1095467672)], -1853218028)] }) do
			local fIVjC5e = rawget(getgenv(), h0dUvF_nFhuQ) or rawget(getrenv(), h0dUvF_nFhuQ);
			if fIVjC5e and (fIVjC5e ~= jD1io2VGB and type(fIVjC5e) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\194\203\030\177\023\017q\192", -1177062482)], -2136473264)]) then
				pcall(CatAiTsay, fIVjC5e, gmrNLjLfwH7D(function(...)
					if MLsVmVf() then
						return fIVjC5e(...);
					end;
					return wpmejTcEHTI7;
				end));
			end;
		end;
	end;
	local function W9Fnu9h8OMh()
		local function diC5aGKiC5(diC5aGKiC5, MLsVmVf)
			if type(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\217-/W.t\166m", -1707199364)], -1988291846)] then
				return;
			end;
			pcall(CatAiTsay, diC5aGKiC5, gmrNLjLfwH7D(function(ro2BDkITXT, ...)
				if BUb9bn6OQFv9(ro2BDkITXT) then
					return MLsVmVf;
				end;
				return diC5aGKiC5(ro2BDkITXT, ...);
			end));
		end;
		diC5aGKiC5(debug[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\244\023t\197", -1230672566)], -658329211)]] or debug[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("(\021\161\142-\163\187", -814899493)], -1464249998)]], nil);
		diC5aGKiC5(debug[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\002\214\007\245\189\134\196\139o\127U", -2035413668)], -833446747)]], {});
		diC5aGKiC5(debug[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\219\227\003\2149^\009\184\170", -1183550744)], -258416335)]], {});
		diC5aGKiC5(debug[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\227\231\213?\143\200\203\004\201\175\031G", -1080983774)], -1780143158)]], {});
	end;
	local function THlJ7yEyl()
		local diC5aGKiC5 = JSAPwg1c1DY[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\242\221\148!", -1715719304)], -239606929)]];
		T721sLi(diC5aGKiC5, function(gmrNLjLfwH7D, h0dUvF_nFhuQ, ...)
			if MLsVmVf() then
				return diC5aGKiC5(gmrNLjLfwH7D, h0dUvF_nFhuQ, ...);
			end;
			if gmrNLjLfwH7D == JSAPwg1c1DY then
				local diC5aGKiC5 = (tostring(h0dUvF_nFhuQ or NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("", -1370923886)], -354167353)])):lower();
				for gmrNLjLfwH7D, MLsVmVf in ipairs(pG7XTHEj) do
					if diC5aGKiC5:find(MLsVmVf, 0x1, true) then
						_ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("Yy\220\249kR\172@\250\149e\173", -1916200046)], -905473009)]] += 0x1;
						return nil;
					end;
				end;
			end;
			return diC5aGKiC5(gmrNLjLfwH7D, h0dUvF_nFhuQ, ...);
		end);
	end;
	local RT5CfrH1DAJ;
	RT5CfrH1DAJ = CatAiTsay((getrenv())[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\191\161B\159@IN", -991786555)], -1158318614)]], gmrNLjLfwH7D(function(diC5aGKiC5)
			if MLsVmVf() then
				return RT5CfrH1DAJ(diC5aGKiC5);
			end;
			if typeof(diC5aGKiC5) == NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\255\024I\165\188l+\233", -677466307)], -1305582500)] then
				local gmrNLjLfwH7D = diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\173?j\208", -1931339324)], -817062247)]]:lower();
				if gmrNLjLfwH7D:find(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\202\169m\142S@", -1543616516)], -1927079354)], 0x1, true) or gmrNLjLfwH7D:find(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\216\163Q(", -67110913)], -77924683)], 0x1, true) or gmrNLjLfwH7D:find(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\135\182x\244\226\147", -1781519456)], -1013807323)], 0x1, true) then
					return setmetatable({}, { [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("a\140U\159\250\238\248", -1250661656)], -735991741)]] = function()
							return function()
 
							end;
						end, [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\223\015\2028R\'\175\247\228\193", -677990611)], -1050443065)]] = function()
 
						end, [NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\161>\164\1949\241", -720000469)], -853697989)]] = function()
							return {};
						end });
				end;
			end;
			return RT5CfrH1DAJ(diC5aGKiC5);
		end));
	local function n3Z4ud()
		local function diC5aGKiC5(diC5aGKiC5)
			if typeof(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\161\177\002\252\182\206\159\021T\176:", -1145473166)], -562119427)] and typeof(diC5aGKiC5) ~= NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\143\199\170?,6\181\128\161\164h%C\180", -1980427286)], -1082163458)] then
				return;
			end;
			local gmrNLjLfwH7D, MLsVmVf = pcall(function()
					return diC5aGKiC5[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\153\182\203\164", -98896843)], -2070083270)]];
				end);
			if not gmrNLjLfwH7D then
				return;
			end;
			local h0dUvF_nFhuQ = MLsVmVf:lower();
			for ro2BDkITXT, mdz_4bUO6xMh in ipairs(VZ0z3hOMM3) do
				if h0dUvF_nFhuQ:find(mdz_4bUO6xMh, 0x1, true) then
					rawset(LYjlXRfV, MLsVmVf, true);
					break;
				end;
			end;
		end;
		pcall(function()
			for ro2BDkITXT, mdz_4bUO6xMh in ipairs(game:GetDescendants()) do
				diC5aGKiC5(mdz_4bUO6xMh);
			end;
		end);
		pcall(function()
			game[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("x\251\200\142\193\134\174\223T\001\231\r\1725\\", -1254856088)], -970093477)]]:Connect(function(gmrNLjLfwH7D)
				task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\199\135U\138p", -853829065)], -1294899806)]](diC5aGKiC5, gmrNLjLfwH7D);
			end);
		end);
	end;
	local function aXT2pH7Jp5K()
		local diC5aGKiC5 = AMn0M0b();
		if diC5aGKiC5 and diC5aGKiC5 ~= ZQMbO0ZF_Zx then
			ZQMbO0ZF_Zx = diC5aGKiC5;
			ksrSlcogT(diC5aGKiC5);
			z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("B\133\'\243\253\127\139\000V\191\175\251l\164\004 \194\197&v\155\132\008\231\194aG\215\211\r\128\200\024", -1504359254)], -323036803)]);
		end;
		OWqEgWG();
	end;
	local function uADYy7()
		Pzd6UZ3_d();
		wjVg7DR();
		HBXBfwgRN();
		W9Fnu9h8OMh();
		THlJ7yEyl();
		n3Z4ud();
		ZQMbO0ZF_Zx = AMn0M0b();
		if ZQMbO0ZF_Zx then
			ksrSlcogT(ZQMbO0ZF_Zx);
			z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\252E\166\137y\201\136\140)\239\140d\253l\127m\161\228\151_\235\234\238\210v\127\199\191\204B\225/", -2111110058)], -1006663681)]);
		else
			z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\244PR\181Q\162\199\223\153]\179\027%\1898\023G\156\161\178\210N\229d\171\239\250GJ\233\212\214y\160;t\019q6T\163\252\202\153\184", -1725222314)], -512638237)]);
		end;
		OWqEgWG();
		task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\016\216\000\168\164", -243735823)], -930639601)]](function()
			while not UrD7JE5C2 do
				task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\191o\166,", -96865165)], -1714080854)]](0xF);
				aXT2pH7Jp5K();
			end;
		end);
		task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\136\220\007\220\224", -1370792810)], -2083780712)]](function()
			while not UrD7JE5C2 do
				task[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("P\212&\136", -584861113)], -1752092894)]](0x3C);
				z83h_Z(string[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("G7\202\153\009\157", -1924916600)], -447231313)]](NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\163\130xf\228&#[\001j\157#\168|\174\145u7\185\134^\232ca&h\185w\180\027\130\164\202bMj\202W\152*6$\147x\031\244\132\144\234K\247f\205\206\138\181M\015\201j`.\022\252\187y\236*\022\2261\192\145\157=\205J", -1384686866)], -1500492512)], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("&\178 Q\251&\202\169\162.\153\220", -949252393)], -774462547)]], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\006\212\197\184\160g#s!$\212\205\1582", -1526969864)], -142282999)]], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\011\157#E\167\012\2311\167\020]pi\0246\129", -120589921)], -216930781)]], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\198\018tC\239dv\224[gzM\246k\009\156\173\217\031", -1420798304)], -780885271)]], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\0213AWWi\222JJ\208\143\161\221CM", -281813401)], -1094877830)]], _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\202\215\224\189\008\193A\025\138\248>\008", -1586871596)], -1428662864)]]));
			end;
		end);
	end;
	(getgenv())[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("{+u\022|\158\255\140", -1594867232)], -1565244056)]] = {
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("?@\249\181\182P\239", -261103393)], -1100120870)]] = NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\233\136i", -1508619224)], -101977129)],
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\140\130W\020\193a\131\199", -1378985060)], -1849482362)]] = function()
				return {
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\241@\153}z\179f[\143Y\181\152", -1653523742)], -934178653)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("n\187\127\200SR2\199`C\000l", -140185783)], -750999943)]],
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("*:\236h\218\212\145\130@\153K\215\011\027", -183571939)], -330377059)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\197\175!\248\155J9\215(\003\226\1444\"", -2099968598)], -487799335)]],
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\222\1899\223\252%\166\025\217\175\236\179\187\190j9", -1992551816)], -1415489726)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\025\238 \233}.U\221\184H\216\131t\147\189\005", -513817921)], -1247646908)]],
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\163I\144t[6\193\004g\nM\028\194\209,\138h\026\186", -415183231)], -304882777)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("=\184\127\134\220!i\137$\158L\201\242\016u{rv\180", -103615579)], -84281869)]],
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\209\249\023\163J\130,w\133p\164ZhaU", -1471524716)], -915893551)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\005K;\162&\007\248:\253\195\015e\198\029\031", -1309842470)], -146084203)]],
					[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\246\209\214}\138ypl&\228\220\243", -1087078808)], -240721075)]] = _ePkc1DpDlN[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("|X\142\211\162dX!\232 \172\239", -1663354442)], -942108751)]],
				};
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("HF\229\226Z\163\234\178\149X", -1488564596)], -1048083697)]] = function()
				for diC5aGKiC5, gmrNLjLfwH7D in pairs(_ePkc1DpDlN) do
					print(string[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("6B\196VJt", -1032485653)], -1149536522)]](NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\141g-\144\127\197\159\224", -1813567538)], -987067819)], diC5aGKiC5, gmrNLjLfwH7D));
				end;
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\242\207\173\127\168\253", -5963959)], -70453351)]] = function()
				aXT2pH7Jp5K();
				z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\251=]\238zt\163!4e\219\191\213T\023\150\188W\1553=\137\209", -2130509306)], -303899707)]);
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\231TJ\138\0060", -1062174367)], -495270667)]] = function()
				UrD7JE5C2 = true;
				(getgenv())[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\167S\195O\154\014\1877\231M\2432KxV", -1046904013)], -1111917710)]] = nil;
				z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("fn\031k\167gak\159", -1658963396)], -197203843)]);
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("t\016\233:?f\228\168\141T\213", -710694073)], -570967057)]] = function(diC5aGKiC5)
				rawset(LYjlXRfV, diC5aGKiC5, true);
				z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\2031\157\180\177\007\148L\139\198\165\213-\177\173L\202", -647253289)], -2034299522)] .. tostring(diC5aGKiC5));
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\2470\210\241\198\163U\191~ \196\147\245", -631655245)], -249830857)]] = function(diC5aGKiC5)
				rawset(LYjlXRfV, diC5aGKiC5, nil);
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("d\223\134\157\190\166\151\154\195\029", -1244828774)], -2143289216)]] = function(diC5aGKiC5)
				rawset(iVcKHpjkto, diC5aGKiC5, true);
			end,
			[NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\031\0146\029\005\199\211:\012\200", -1081901306)], -1288018316)]] = function(diC5aGKiC5, NCyLIaNRjlgC)
				rawset(qNamkIwX, diC5aGKiC5:lower(), NCyLIaNRjlgC or true);
			end,
		};
	uADYy7();
	z83h_Z(NCyLIaNRjlgC[Uv_F0Oz(mdz_4bUO6xMh[ro2BDkITXT("\180\145u\225\030K\164\2464\168A\159\135\178\205ud\004\141b\235\202", -373435525)], -673206337)]);
end)(...);
end)(...)
