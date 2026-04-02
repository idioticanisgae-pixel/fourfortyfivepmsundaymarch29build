return (function(...)
local _zukac4ffdcc8, _zuka3448292c;
do
	local _zuka2e1b6728 = math.floor;
	local _zukab64fe0d0 = math.random;
	local _zuka1efaa2a8 = table.remove;
	local _zuka7fae8658 = string.char;
	local _zukadba6f6d8 = string.byte;
	local _zuka6533cc90 = string.len;
	local _zuka21a35d94 = 0x19660D;
	local _zuka2273a0c8 = 0x9C4D;
	local _zukaeb51c438 = 4294967296;
	local _zukaf658a5f8 = 0x19;
	local _zukafba5e2e0 = math.floor;
	local function _zukaa5e45558(_zuka2e1b6728, _zukab64fe0d0)
		local _zuka1efaa2a8, _zuka7fae8658 = 0x0, 0x1;
		while _zuka2e1b6728 > 0x0 or _zukab64fe0d0 > 0x0 do
			local _zukadba6f6d8 = _zuka2e1b6728 % 0x2;
			local _zuka6533cc90 = _zukab64fe0d0 % 0x2;
			if _zukadba6f6d8 ~= _zuka6533cc90 then
				_zuka1efaa2a8 = _zuka1efaa2a8 + _zuka7fae8658;
			end;
			_zuka2e1b6728 = _zukafba5e2e0(_zuka2e1b6728 / 0x2);
			_zukab64fe0d0 = _zukafba5e2e0(_zukab64fe0d0 / 0x2);
			_zuka7fae8658 = _zuka7fae8658 * 0x2;
		end;
		return _zuka1efaa2a8;
	end;
	local _zuka9de8ce50 = 0x0;
	local _zuka9723b180 = 0x1;
	local _zukac9f0c791 = {};
	local _zukadb2794d8 = {};
	local _zuka3908dbc0 = {};
	for _zuka2e1b6728 = 0x1, 0x100, 0x1 do
		_zuka3908dbc0[_zuka2e1b6728] = _zuka2e1b6728;
	end;
	repeat
		local _zuka2e1b6728 = _zukab64fe0d0(0x1, #_zuka3908dbc0);
		local _zukadba6f6d8 = _zuka1efaa2a8(_zuka3908dbc0, _zuka2e1b6728);
		_zukadb2794d8[_zukadba6f6d8] = _zuka7fae8658(_zukadba6f6d8 - 0x1);
	until #_zuka3908dbc0 == 0x0;
	local function _zuka1b94b660()
		_zuka9de8ce50 = (_zuka9de8ce50 * _zuka21a35d94 + _zuka2273a0c8) % _zukaeb51c438;
		_zuka9723b180 = (_zuka9723b180 * 0x25 + 0x7) % 0xFB + 0x1;
		return _zukafba5e2e0((_zuka9de8ce50 + _zuka9723b180 * 0x10001) % _zukaeb51c438);
	end;
	local function _zukafd79f788()
		if #_zukac9f0c791 == 0x0 then
			local _zuka2e1b6728 = _zuka1b94b660();
			local _zukab64fe0d0 = _zuka2e1b6728 % 0x100;
			local _zuka1efaa2a8 = _zukafba5e2e0(_zuka2e1b6728 / 0x100) % 0x100;
			local _zuka7fae8658 = _zukafba5e2e0(_zuka2e1b6728 / 0x10000) % 0x100;
			local _zukadba6f6d8 = _zukafba5e2e0(_zuka2e1b6728 / 0x1000000) % 0x100;
			_zukac9f0c791 = {
					_zukab64fe0d0,
					_zuka1efaa2a8,
					_zuka7fae8658,
					_zukadba6f6d8,
				};
		end;
		return _zuka1efaa2a8(_zukac9f0c791);
	end;
	local _zuka24fad45f = {};
	_zuka3448292c = setmetatable({}, { __index = _zuka24fad45f, __metatable = nil });
	function _zukac4ffdcc8(_zuka2e1b6728, _zukab64fe0d0)
		local _zuka1efaa2a8 = _zuka24fad45f;
		if not _zuka1efaa2a8[_zukab64fe0d0] then
			_zukac9f0c791 = {};
			_zuka9de8ce50 = _zukab64fe0d0 % _zukaeb51c438;
			_zuka9723b180 = _zukab64fe0d0 % 0xFB + 0x1;
			local _zuka7fae8658 = _zuka6533cc90(_zuka2e1b6728);
			local _zuka21a35d94 = _zukaf658a5f8;
			local _zuka2273a0c8 = {};
			local _zukafba5e2e0 = _zukadb2794d8;
			for _zukab64fe0d0 = 0x1, _zuka7fae8658, 0x1 do
				local _zuka1efaa2a8 = _zukadba6f6d8(_zuka2e1b6728, _zukab64fe0d0);
				local _zuka7fae8658 = _zukafd79f788();
				local _zuka6533cc90 = _zukaa5e45558(_zuka1efaa2a8, _zukaa5e45558(_zuka7fae8658, _zuka21a35d94)) % 0x100;
				_zuka2273a0c8[_zukab64fe0d0] = _zukafba5e2e0[_zuka6533cc90 + 0x1];
				_zuka21a35d94 = ((_zuka21a35d94 + _zuka6533cc90) + 0xD) % 0x100;
			end;
			_zuka1efaa2a8[_zukab64fe0d0] = table.concat(_zuka2273a0c8);
		end;
		return _zukab64fe0d0;
	end;
end;
if (getgenv())[_zuka3448292c[_zukac4ffdcc8("\218\245l\229\024\022\211.l\161\226\178^\128\211", -2024730974)]] then
	return;
end;
(getgenv())[_zuka3448292c[_zukac4ffdcc8(".\213H}\"\15269\026*K\165m\000I", -113970583)]] = true;
local _zuka2e1b6728 = newcclosure or function(_zuka2e1b6728)
		return _zuka2e1b6728;
	end;
local _zukab64fe0d0 = checkcaller or function()
		return false;
	end;
local _zuka1efaa2a8 = getrawmetatable;
local _zuka7fae8658 = setreadonly or function()
 
	end;
local _zukadba6f6d8 = hookfunction or function()
 
	end;
local _zuka6533cc90 = getgc or get_gc_objects or function()
		return {};
	end;
local _zuka21a35d94 = getscriptidentity or getidentity or get_thread_identity or nil;
local _zuka2273a0c8 = setscriptidentity or setidentity or set_thread_identity or nil;
if not game:IsLoaded() then
	game[_zuka3448292c[_zukac4ffdcc8("\1897$<Ia", -745953517)]]:Wait();
end;
local _zukaeb51c438 = game:GetService(_zuka3448292c[_zukac4ffdcc8("\230\214\139!%\161p", -610289857)]);
repeat
	task[_zuka3448292c[_zukac4ffdcc8("\137\028\189\133", -923823649)]](.1);
until _zukaeb51c438 and _zukaeb51c438[_zuka3448292c[_zukac4ffdcc8("#c\179\225\199\211\140\158>\031\002", -807886927)]];
local _zukaf658a5f8 = _zukaeb51c438[_zuka3448292c[_zukac4ffdcc8("o\137\130\148\131v\255\128o?\220", -270213175)]];
local _zukafba5e2e0 = false;
local _zukaa5e45558 = nil;
local _zuka9de8ce50 = {};
local _zuka9723b180 = {
		[_zuka3448292c[_zukac4ffdcc8("9\147\157X\174\227x\011\024f$F", -847602955)]] = 0x0,
		[_zuka3448292c[_zukac4ffdcc8("\021<?\144\225\216\171e\179\184\223\002\202\205", -1487057222)]] = 0x0,
		[_zuka3448292c[_zukac4ffdcc8("\134\022?-\151bt\005\194\156\135\197]\160g\002", -28246879)]] = 0x0,
		[_zuka3448292c[_zukac4ffdcc8("\007g\024\246\199\149\221(\237XYk^\255\030", -705844261)]] = 0x0,
		[_zuka3448292c[_zukac4ffdcc8("l\188\236\182\255\240i\227\189\163\132\185\216\238\204\211\160\199F", -624314989)]] = 0x0,
		[_zuka3448292c[_zukac4ffdcc8("JF\196\029\226P\235\007\216\228-\197", -2047800350)]] = 0x0,
	};
local function _zukac9f0c791(_zuka2e1b6728)
	if rconsoleprint then
		pcall(rconsoleprint, _zuka3448292c[_zukac4ffdcc8("\"\025\135/\131\148\186\009}\203!", -2133720668)] .. (tostring(_zuka2e1b6728) .. _zuka3448292c[_zukac4ffdcc8("\029", -562643731)]));
	end;
end;
local _zukadb2794d8 = {
		[_zuka3448292c[_zukac4ffdcc8("\144\186\171\129-H\202\\o>\n", -792223345)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\024\011}\245\137\167B\200J\195\238", -1242731558)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\0201c", -121507453)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("}\216\213-\251\152", -1514189954)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("7\"jf", -1721552186)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\008I\134!\n\218", -42927391)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\005T-DDkZ\252", -940470301)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("^J\009I\004\172Y\235\206t|\214\028\137", -1446882428)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\146\019Y%p }\174\254\193^7&\146\202\188", -1872748352)]] = true,
	};
local _zuka3908dbc0 = { [_zuka3448292c[_zukac4ffdcc8("Q\024\r\210\232k\175\007", -2011033532)]] = true, [_zuka3448292c[_zukac4ffdcc8("\127\188\001\237~7F\183f+\161\190", -291709639)]] = true };
local _zuka1b94b660 = {
		[_zuka3448292c[_zukac4ffdcc8("\241z\146\226", -1606467458)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\022\0008\001\014\021\179\1600-", -1322163614)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("6\145\157<\167Eh\140\148\174~\234", -845309125)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\177\189\147\194\242\012\143\004\221M\140", -259596019)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\198;\0122\000\014\208\213\192@\1669\130z", -644762845)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("[\'J\204\008:\143\185\252%Z\251\242]", -1180929224)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\012\r\206\\\236sV\146\150\r1\204\243\n!W\001\174\160\236\227", -2105342714)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("St\241\031cv\029\131s\159/*mt\007x\173\177B\251\196\186", -49874419)]] = true,
	};
local _zukafd79f788 = {
		[_zuka3448292c[_zukac4ffdcc8("\171\161\140\223\254\2440", -1662699062)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\205Z\221j\242D\133\022#Akq\199\137\188", -1578744884)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("v*\180-", -325199557)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("`@^A", -1466412752)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\1551-\192\150\167\235\229X\230", -464402269)]] = true,
	};
local _zuka24fad45f = {
		[_zuka3448292c[_zukac4ffdcc8("\012\207\026\243~t\026\162\155\185x", -705188881)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\166Y\002U\173f\222\006\175\204A\030b\151", -148509109)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\237})\245\248b\'D\162\190\132\127", -1014266089)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("O\029\207+\183\220b\242\009\236%\185\127\237\208", -677662921)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\000\214\169!\184`\022\169\194]", -730617625)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\144U=\211\162+\165\225(w", -2073753398)]] = true,
		[_zuka3448292c[_zukac4ffdcc8("\129\146\183\226\2183Fd\142", -865101601)]] = true,
	};
local _zuka93379960 = {
		_zuka3448292c[_zukac4ffdcc8("\021\031Dxh\150\000O\203", -893217403)],
		_zuka3448292c[_zukac4ffdcc8("\000\177\224\"e\128\0168\015\229", -229972843)],
		_zuka3448292c[_zukac4ffdcc8("D\024%\148\156\154%u\222\236", -491076235)],
		_zuka3448292c[_zukac4ffdcc8("%.\149.G\138\194e\220", -1331666624)],
		_zuka3448292c[_zukac4ffdcc8("]\155\020\225\026X\138}R\144w\196\251", -1403234120)],
		_zuka3448292c[_zukac4ffdcc8("\014F\182qJa\141\248\006\224\198\029", -5505193)],
		_zuka3448292c[_zukac4ffdcc8("\168\216\\!7\234\255Na\148", -1916068970)],
	};
local _zuka81348043 = {
		_zuka3448292c[_zukac4ffdcc8("\252E\185\185\204o", -124128973)],
		_zuka3448292c[_zukac4ffdcc8("\141\205DT", -1330421402)],
		_zuka3448292c[_zukac4ffdcc8("\012\228M@\233", -1230410414)],
		_zuka3448292c[_zukac4ffdcc8("\200f\202\175+\225\167", -1836505838)],
		_zuka3448292c[_zukac4ffdcc8("\203\221\216\163", -1946937368)],
		_zuka3448292c[_zukac4ffdcc8("\173?~\144\188(\016\245", -1247909060)],
		_zuka3448292c[_zukac4ffdcc8("\221\176:", -5308579)],
	};
local _zuka7c7defb4 = { [_zuka3448292c[_zukac4ffdcc8("c\179\134\1968\246\230W\189\145\031", -236264491)]] = true, [_zuka3448292c[_zukac4ffdcc8(")G=\190\015\r`\031\165\241", -112987513)]] = true };
local _zuka4a461664 = {
		{ _zuka3448292c[_zukac4ffdcc8("\193\129\185\248<\150\244\210", -1692453314)], true, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("\168\173\134\163K~?\179\018\2040\015", -677204155)], true, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("\177w\216\'\247w\208\'\197\205m\012\185J\163", -1637598008)], true, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("\198?+$}\007\154\142\209;\231\237\018", -309208285)], false, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("g\246q\127\002\235\201\243\242\009.\216\242\127D", -1933567616)], false, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("d\226T7$v\143\021^\181\130\\\191\147\136X\217\163", -472201291)], false, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("j\156`a\134\139\003\131\142U\250\219\254\031", -265625515)], true, .5 },
		{ _zuka3448292c[_zukac4ffdcc8("\175(\204\249\159\"\179\1679\208=h\131\006", -944337043)], true, .5 },
		{ _zuka3448292c[_zukac4ffdcc8("\025\130\144j\148\245\n\027J\018\204N\251\155\248i", -139595941)], false, 0x1 },
		{ _zuka3448292c[_zukac4ffdcc8("b\190c\007j\019!\218^", -4063357)], true, .5 },
	};
local _zuka10ffd370 = 0x3;
local _zukaff0c6ee4 = 0x2;
local function _zuka7dd6a481(_zuka2e1b6728, ...)
	local _zukab64fe0d0, _zuka1efaa2a8 = pcall(_zuka2e1b6728, ...);
	if _zukab64fe0d0 then
		return _zuka1efaa2a8;
	end;
end;
local function _zuka7dcba65e(_zuka2e1b6728, _zukab64fe0d0)
	local _zukadba6f6d8 = _zuka1efaa2a8(_zuka2e1b6728);
	if not _zukadba6f6d8 then
		return false;
	end;
	local _zuka6533cc90 = pcall(function()
			_zuka7fae8658(_zukadba6f6d8, false);
			_zukab64fe0d0(_zukadba6f6d8);
			_zuka7fae8658(_zukadba6f6d8, true);
		end);
	if not _zuka6533cc90 then
		pcall(_zuka7fae8658, _zukadba6f6d8, true);
	end;
	return _zuka6533cc90;
end;
local function _zuka57714590(_zukab64fe0d0, _zuka1efaa2a8)
	if type(_zukab64fe0d0) ~= _zuka3448292c[_zukac4ffdcc8("\014\128\152 \164\223\216\029", -1406642096)] then
		return false;
	end;
	local _zuka7fae8658 = pcall(_zukadba6f6d8, _zukab64fe0d0, _zuka2e1b6728(_zuka1efaa2a8));
	if not _zuka7fae8658 then
		return false;
	end;
	table[_zuka3448292c[_zukac4ffdcc8("\196B\219\1884\216", -211884355)]](_zuka9de8ce50, _zukab64fe0d0);
	_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\253m\225\162G\231\235J\156\022?^C\030\206", -1450093790)]] += 0x1;
	return true;
end;
local function _zuka52575300(_zuka2e1b6728)
	for _zukab64fe0d0, _zuka1efaa2a8 in ipairs(_zuka9de8ce50) do
		if _zuka2e1b6728 == _zuka1efaa2a8 then
			return true;
		end;
	end;
	return false;
end;
local function _zuka6806eea8(_zuka2e1b6728)
	if type(_zuka2e1b6728) ~= _zuka3448292c[_zukac4ffdcc8("_\214\224\031\215", -800546671)] then
		return;
	end;
	pcall(function()
		_zuka7fae8658(_zuka2e1b6728, false);
		local _zukab64fe0d0 = _zuka1efaa2a8(_zuka2e1b6728);
		if _zukab64fe0d0 then
			pcall(_zuka7fae8658, _zukab64fe0d0, false);
		end;
	end);
end;
for _zuka2e1b6728, _zukab64fe0d0 in ipairs({ getgenv, getrenv, getreg }) do
	if type(_zukab64fe0d0) == _zuka3448292c[_zukac4ffdcc8("\141\247\244I\135B\002\139", -104860801)] then
		local _zuka2e1b6728, _zuka1efaa2a8 = pcall(_zukab64fe0d0);
		if _zuka2e1b6728 and type(_zuka1efaa2a8) == _zuka3448292c[_zukac4ffdcc8("\204\011\220\163\195", -136908883)] then
			_zuka6806eea8(_zuka1efaa2a8);
		end;
	end;
end;
local function _zukadf9d2fcb(_zuka2e1b6728)
	if type(_zuka2e1b6728) ~= _zuka3448292c[_zukac4ffdcc8("\246\141\165\179\011", -735008671)] then
		return 0x0;
	end;
	local _zukab64fe0d0 = 0x0;
	pcall(function()
		for _zuka1efaa2a8, _zuka7fae8658 in ipairs(_zuka4a461664) do
			local _zukadba6f6d8, _zuka6533cc90, _zuka21a35d94 = _zuka7fae8658[0x1], _zuka7fae8658[0x2], _zuka7fae8658[0x3];
			local _zuka2273a0c8 = rawget(_zuka2e1b6728, _zukadba6f6d8);
			if _zuka2273a0c8 ~= nil then
				if _zuka6533cc90 then
					if type(_zuka2273a0c8) == _zuka3448292c[_zukac4ffdcc8("0\149\143\0181)\224\000", -1458679268)] then
						_zukab64fe0d0 += _zuka21a35d94;
					end;
				else
					_zukab64fe0d0 += _zuka21a35d94;
				end;
			end;
		end;
	end);
	return _zukab64fe0d0;
end;
local function _zuka11b31345()
	local _zuka2e1b6728;
	local _zukab64fe0d0 = pcall(function()
			_zuka2e1b6728 = _zuka6533cc90(true);
		end);
	if not _zukab64fe0d0 or not _zuka2e1b6728 then
		return nil;
	end;
	for _zuka2e1b6728, _zukab64fe0d0 in ipairs(_zuka2e1b6728) do
		local _zuka1efaa2a8, _zuka7fae8658 = pcall(function()
				return type(_zukab64fe0d0) == _zuka3448292c[_zukac4ffdcc8(";\166!y\210", -482359681)];
			end);
		if _zuka1efaa2a8 and (_zuka7fae8658 and _zukadf9d2fcb(_zukab64fe0d0) >= _zuka10ffd370) then
			return _zukab64fe0d0;
		end;
	end;
	return nil;
end;
local function _zukad6820580(_zuka2e1b6728)
	if not _zuka2e1b6728 then
		return;
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("g\199\022\150\176\149\148s", -425931463)]]) == _zuka3448292c[_zukac4ffdcc8("\244r\145\199\173[\014G", -238492783)] then
		_zuka57714590(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\227\025\172\136Z\183\176\170", -816865633)]], function(...)
			_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\243[\027/s9\016.\201L\136\212B\193\142\016", -1121420720)]] += 0x1;
		end);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("w\192\248>\172\241(m\"+\236Z", -1784403128)]]) == _zuka3448292c[_zukac4ffdcc8("\250]V\185\222\008\161\214", -970486705)] then
		_zuka57714590(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\156\006zU\253\008\030\143\208O\149\018", -426980071)]], function(...)
			_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\023\003;\209\142\167n\222\017;\167m", -1876942784)]] += 0x1;
		end);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\\\171\004\131~\152\175\205\214H\005U\027\209+", -781540651)]]) == _zuka3448292c[_zukac4ffdcc8("\147\141dh\"r9\230", -125046505)] then
		_zuka57714590(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("*dI\235\127\2337RP\208!z?[\174", -1828837892)]], function(...)
			_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("q\148\0243\1847\184\132\180l\208\134>\240\236\021\157\237\160", -508312729)]] += 0x1;
		end);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\214J0\028\150\165\220+\154*\166\182\182h", -222567049)]]) == _zuka3448292c[_zukac4ffdcc8("\137:\198vBb\210\147", -2109995912)] then
		_zuka57714590(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("HvG)Bx\140\161\141\244\212\148\170\201", -1648739468)]], function(...)
			return nil;
		end);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\249\165\002\216L\162\1911\018X\128\016\200\029", -137564263)]]) == _zuka3448292c[_zukac4ffdcc8("=9\015\018\\\029\156G", -2075981690)] then
		_zuka57714590(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("z\143\027e\152\'8\150&rYo\020\012", -303375403)]], function(...)
 
		end);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("+\160\189\190Z\187\253\232i$\249\174\219", -1499181752)]]) == _zuka3448292c[_zukac4ffdcc8("G1\221\206\172", -218700307)] then
		local _zukab64fe0d0 = getmetatable(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("m\217f\157bR\156\017I\238\224$v", -472528981)]]) or {};
		rawset(_zukab64fe0d0, _zuka3448292c[_zukac4ffdcc8("\242rJ\165!\n\194", -1547221106)], function()
			return false;
		end);
		rawset(_zukab64fe0d0, _zuka3448292c[_zukac4ffdcc8("5t\241\203\027\164\162\128@\182", -1340841944)], function()
 
		end);
		rawset(_zukab64fe0d0, _zuka3448292c[_zukac4ffdcc8("\1931I\166\243", -615401821)], function()
			return 0x0;
		end);
		pcall(setmetatable, _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\150\160\018\205\212,f\212\0263=\149\129", -1954801928)]], _zukab64fe0d0);
	end;
	if type(_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("4\134O\205\143\204\024q\140\183\179\016\192\247 ", -1100776250)]]) == _zuka3448292c[_zukac4ffdcc8("\200z\026^\221", -1874255726)] then
		local _zukab64fe0d0 = {};
		rawset(_zukab64fe0d0, _zuka3448292c[_zukac4ffdcc8("\135\206\179\204\204r,", -61409107)], function(_zuka2e1b6728, _zukab64fe0d0)
			return { {
					[_zuka3448292c[_zukac4ffdcc8(")`", -297411445)]] = _zukab64fe0d0,
					[_zuka3448292c[_zukac4ffdcc8("K\184\218CW\208\236G", -1538635628)]] = _zukaf658a5f8[_zuka3448292c[_zukac4ffdcc8("1\216\176\134", -1802426078)]],
					[_zuka3448292c[_zukac4ffdcc8("=U\189\131O\137d\008\'m\196", -1421257070)]] = _zukaf658a5f8[_zuka3448292c[_zukac4ffdcc8("\153\167vB\141i\153q0P\019", -1798755950)]],
					[_zuka3448292c[_zukac4ffdcc8(";\192v\025\163\n", -497105731)]] = _zukaf658a5f8[_zuka3448292c[_zukac4ffdcc8("\254+\242\139\150\206", -499858327)]],
				} };
		end);
		rawset(_zukab64fe0d0, _zuka3448292c[_zukac4ffdcc8("\176\221\251J\011QW\141t*", -729700093)], function()
 
		end);
		pcall(setmetatable, _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("x\200\1841(\019lj\155912\004u\240", -444806407)]], _zukab64fe0d0);
	end;
	if _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8(".\247\210\157n\127\018\175-\141s\025\145\203\200L!u", -2097936920)]] ~= nil then
		pcall(function()
			_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("W\205\027_\204!*\219n\170\226$\219\"\242\245\031\019", -517684663)]] = math[_zuka3448292c[_zukac4ffdcc8("l\223\214-", -346368331)]];
		end);
	end;
	if _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\210HGL\196\026\"^\152\225WG\175\226W9", -994604689)]] ~= nil then
		pcall(function()
			_zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\162\029Q9\137\1342\137\137\216\209aM)\254\248", -575620255)]] = false;
		end);
	end;
end;
local function _zukad8b0c600()
	local _zuka2e1b6728 = tostring(_zukaf658a5f8[_zuka3448292c[_zukac4ffdcc8("\135\151\1653O\179", -1134200630)]]);
	local _zukab64fe0d0;
	local _zuka1efaa2a8 = pcall(function()
			_zukab64fe0d0 = _zuka6533cc90(true);
		end);
	if not _zuka1efaa2a8 or not _zukab64fe0d0 then
		return;
	end;
	for _zukab64fe0d0, _zuka1efaa2a8 in ipairs(_zukab64fe0d0) do
		local _zuka7fae8658, _zukadba6f6d8 = pcall(function()
				return type(_zuka1efaa2a8) == _zuka3448292c[_zukac4ffdcc8("\2099G\129\131", -1728695828)];
			end);
		if not (_zuka7fae8658 and _zukadba6f6d8) then
			continue;
		end;
		local _zuka6533cc90, _zuka21a35d94, _zuka2273a0c8 = pcall(function()
				return rawget(_zuka1efaa2a8, _zuka2e1b6728), rawget(_zuka1efaa2a8, _zuka3448292c[_zukac4ffdcc8("\185\\\1453-\205", -125374195)]);
			end);
		if not (_zuka6533cc90 and type(_zuka21a35d94) == _zuka3448292c[_zukac4ffdcc8("\197M\169\202U", -1675544510)]) then
			continue;
		end;
		local _zukaeb51c438, _zukaf658a5f8 = pcall(function()
				return rawget(_zuka21a35d94, _zuka3448292c[_zukac4ffdcc8("\133U\030Z\1606,W\158\141", -1002600325)]) ~= nil;
			end);
		if _zukaeb51c438 and (_zukaf658a5f8 and _zuka2273a0c8 ~= nil) then
			task[_zuka3448292c[_zukac4ffdcc8("\009Sh\235\139", -977892499)]](function()
				while not _zukafba5e2e0 do
					task[_zuka3448292c[_zukac4ffdcc8("1(\021#", -63768475)]](0x8);
					pcall(function()
						local _zukab64fe0d0 = _zuka1efaa2a8[_zuka2e1b6728];
						if _zukab64fe0d0 then
							_zukab64fe0d0[_zuka3448292c[_zukac4ffdcc8("\217P\1449\213\199\\tM|", -283451851)]] = os[_zuka3448292c[_zukac4ffdcc8("\208\248\018\002", -1105494986)]]();
							_zukab64fe0d0[_zuka3448292c[_zukac4ffdcc8("!\241\223\023\211%\242{p\168\"b", -646270219)]] = true;
						end;
					end);
				end;
			end);
		end;
	end;
end;
local function _zukade2e8bbc()
	local _zuka1efaa2a8 = getnamecallmethod;
	_zuka7dcba65e(game, function(_zuka7fae8658)
		local _zukadba6f6d8 = _zuka7fae8658[_zuka3448292c[_zukac4ffdcc8("g[\159\164zq\0044\205\127", -1349755112)]];
		_zuka7fae8658[_zuka3448292c[_zukac4ffdcc8("\182\243\133\149\171\001!\137Y{", -1328127572)]] = _zuka2e1b6728(function(_zuka2e1b6728, ...)
				if _zukab64fe0d0() then
					return _zukadba6f6d8(_zuka2e1b6728, ...);
				end;
				local _zuka7fae8658 = _zuka1efaa2a8();
				if rawget(_zukafd79f788, _zuka7fae8658) then
					return _zukadba6f6d8(_zuka2e1b6728, ...);
				end;
				if not rawget(_zuka1b94b660, _zuka7fae8658) then
					return _zukadba6f6d8(_zuka2e1b6728, ...);
				end;
				if _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\023\248M\206", -297280369)] and _zuka2e1b6728 == _zukaf658a5f8 then
					local _zuka2e1b6728 = (tostring(... or _zuka3448292c[_zukac4ffdcc8("", -828728011)])):lower();
					for _zukab64fe0d0 = 0x1, #_zuka81348043, 0x1 do
						if _zuka2e1b6728:find(_zuka81348043[_zukab64fe0d0], 0x1, true) then
							_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("b\243\244f\2184\174V[\170\203\021", -1912726532)]] += 0x1;
							return nil;
						end;
					end;
				end;
				if _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\135\158\197\141\130\185\136\1573\003", -271917163)] or _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\189ZA\029\200+\211\009\183\012\161\184", -414331237)] then
					local _zukab64fe0d0;
					local _zuka1efaa2a8 = pcall(function()
							_zukab64fe0d0 = _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\138)W\219", -207427771)]];
						end);
					if _zuka1efaa2a8 and rawget(_zuka24fad45f, _zukab64fe0d0) then
						_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("%\221\235\251\rr\213\243\132\227u/\0287", -648891739)]] += 0x1;
						if _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\005\211\223\186\024\134\188\158\195\133\029\147", -1639498610)] then
							return _zuka3448292c[_zukac4ffdcc8("\184:\192\235", -349514155)];
						end;
						return nil;
					end;
					_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("w\146i1\135h\231\198o\233&A", -137302111)]] += 0x1;
				end;
				if _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\162C\154}4\021\004\170d\219\202", -465516415)] or _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("8A?\235\237\154%\193\009\236\244F\240\131", -489241171)] then
					local _zukab64fe0d0 = _zukadba6f6d8(_zuka2e1b6728, ...);
					if type(_zukab64fe0d0) ~= _zuka3448292c[_zukac4ffdcc8("$z\005\172\227", -365702041)] then
						return _zukab64fe0d0;
					end;
					local _zuka1efaa2a8 = false;
					for _zuka2e1b6728 = 0x1, #_zukab64fe0d0, 0x1 do
						local _zuka7fae8658, _zukadba6f6d8 = pcall(function()
								return _zukab64fe0d0[_zuka2e1b6728][_zuka3448292c[_zukac4ffdcc8("vxWr", -1639039844)]];
							end);
						if _zuka7fae8658 and rawget(_zuka7c7defb4, _zukadba6f6d8) then
							_zuka1efaa2a8 = true;
							break;
						end;
					end;
					if not _zuka1efaa2a8 then
						return _zukab64fe0d0;
					end;
					local _zuka7fae8658, _zuka6533cc90 = {}, 0x0;
					for _zuka2e1b6728 = 0x1, #_zukab64fe0d0, 0x1 do
						local _zuka1efaa2a8, _zukadba6f6d8 = pcall(function()
								return _zukab64fe0d0[_zuka2e1b6728][_zuka3448292c[_zukac4ffdcc8("\024\198\158\225", -390475405)]];
							end);
						if not (_zuka1efaa2a8 and rawget(_zuka7c7defb4, _zukadba6f6d8)) then
							_zuka6533cc90 = _zuka6533cc90 + 0x1;
							_zuka7fae8658[_zuka6533cc90] = _zukab64fe0d0[_zuka2e1b6728];
						end;
					end;
					return _zuka7fae8658;
				end;
				if _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("\134\002\189:\170E\"IG\190A\245\158\246", -984380761)] or _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("S[\216\241\014D@\004`\2398\247\232\222s\011EZ\223\139\020", -339159151)] or _zuka7fae8658 == _zuka3448292c[_zukac4ffdcc8("d\172\209\169M\236\r\210w\251\143\r\180\"\148A;\204~;MC", -1271961506)] then
					if rawget(_zuka7c7defb4, tostring(... or _zuka3448292c[_zukac4ffdcc8("", -1779094550)])) then
						return nil;
					end;
				end;
				return _zukadba6f6d8(_zuka2e1b6728, ...);
			end);
	end);
end;
local function _zukab27f56d8()
	_zuka7dcba65e(game, function(_zuka1efaa2a8)
		local _zuka7fae8658 = _zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("\205\146X\237W\177\138", -1262065268)]];
		local _zukadba6f6d8 = _zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("\199\149B\186\179\178\241\134\026\175", -323167879)]];
		_zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("9\212B\161\n\009\193", -1523955116)]] = _zuka2e1b6728(function(_zuka2e1b6728, _zuka1efaa2a8, ...)
				if _zukab64fe0d0() then
					return _zuka7fae8658(_zuka2e1b6728, _zuka1efaa2a8, ...);
				end;
				if type(_zuka1efaa2a8) == _zuka3448292c[_zukac4ffdcc8("\128H\229\1554y", -1036221319)] and rawget(_zukadb2794d8, _zuka1efaa2a8) then
					return nil;
				end;
				return _zuka7fae8658(_zuka2e1b6728, _zuka1efaa2a8, ...);
			end);
		_zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("\212\154\223\2110Y\181\207\138\224", -1576778744)]] = _zuka2e1b6728(function(_zuka2e1b6728, _zuka1efaa2a8, _zuka7fae8658, ...)
				if _zukab64fe0d0() then
					if _zukadba6f6d8 then
						return _zukadba6f6d8(_zuka2e1b6728, _zuka1efaa2a8, _zuka7fae8658, ...);
					end;
					return rawset(_zuka2e1b6728, _zuka1efaa2a8, _zuka7fae8658);
				end;
				if rawget(_zuka3908dbc0, _zuka1efaa2a8) then
					return;
				end;
				if _zukadba6f6d8 then
					pcall(_zukadba6f6d8, _zuka2e1b6728, _zuka1efaa2a8, _zuka7fae8658, ...);
				else
					pcall(rawset, _zuka2e1b6728, _zuka1efaa2a8, _zuka7fae8658);
				end;
			end);
	end);
	local _zukadba6f6d8 = _zuka7dd6a481(function()
			return game:GetService(_zuka3448292c[_zukac4ffdcc8("]Q\005\002\252b\236\225a", -8192251)]);
		end);
	if _zukadba6f6d8 and _zuka1efaa2a8(_zukadba6f6d8) ~= _zuka1efaa2a8(game) then
		_zuka7dcba65e(_zukadba6f6d8, function(_zuka1efaa2a8)
			local _zuka7fae8658 = _zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("\129v[\159*\236A", -887581135)]];
			_zuka1efaa2a8[_zuka3448292c[_zukac4ffdcc8("\180\161C\006\026\144\233", -327690001)]] = _zuka2e1b6728(function(_zuka2e1b6728, _zuka1efaa2a8, ...)
					if _zukab64fe0d0() then
						return _zuka7fae8658(_zuka2e1b6728, _zuka1efaa2a8, ...);
					end;
					if type(_zuka1efaa2a8) == _zuka3448292c[_zukac4ffdcc8("\165@O\173Y\150", -1425451502)] and rawget(_zukadb2794d8, _zuka1efaa2a8) then
						return nil;
					end;
					return _zuka7fae8658(_zuka2e1b6728, _zuka1efaa2a8, ...);
				end);
		end);
	end;
	local _zuka6533cc90 = _zuka1efaa2a8(Enum);
	if _zuka6533cc90 then
		pcall(function()
			_zuka7fae8658(_zuka6533cc90, false);
			local _zuka1efaa2a8 = _zuka6533cc90[_zuka3448292c[_zukac4ffdcc8("b\130H\011\252\"\194\170\002\169", -1172868050)]];
			_zuka6533cc90[_zuka3448292c[_zukac4ffdcc8("\137\219\168w $zg\031|", -735139747)]] = _zuka2e1b6728(function(_zuka2e1b6728, _zuka7fae8658, _zukadba6f6d8, ...)
					if _zukab64fe0d0() then
						if _zuka1efaa2a8 then
							return _zuka1efaa2a8(_zuka2e1b6728, _zuka7fae8658, _zukadba6f6d8, ...);
						end;
						return;
					end;
					if rawget(_zuka3908dbc0, _zuka7fae8658) then
						return;
					end;
					if _zuka1efaa2a8 then
						pcall(_zuka1efaa2a8, _zuka2e1b6728, _zuka7fae8658, _zukadba6f6d8, ...);
					end;
				end);
			_zuka7fae8658(_zuka6533cc90, true);
		end);
	end;
end;
local function _zuka68384eb0()
	if not _zuka21a35d94 then
		return;
	end;
	pcall(_zukadba6f6d8, _zuka21a35d94, _zuka2e1b6728(function(...)
		if _zukab64fe0d0() then
			return _zuka21a35d94(...);
		end;
		return _zukaff0c6ee4;
	end));
	if _zuka2273a0c8 then
		pcall(_zukadba6f6d8, _zuka2273a0c8, _zuka2e1b6728(function(_zuka2e1b6728, ...)
			if _zukab64fe0d0() then
				return _zuka2273a0c8(_zuka2e1b6728, ...);
			end;
		end));
	end;
	for _zuka1efaa2a8, _zuka7fae8658 in ipairs({ _zuka3448292c[_zukac4ffdcc8("\029\241\031rFm\188B1\128\019", -109710613)], _zuka3448292c[_zukac4ffdcc8("\018\021o\163*\209\200n\016=]\240\250\020?\210\137\203\029", -1827527132)], _zuka3448292c[_zukac4ffdcc8("M\218\014\156\005\246\223\146\186\175^^\176U/\1414", -1112310938)] }) do
		local _zuka6533cc90 = rawget(getgenv(), _zuka7fae8658) or rawget(getrenv(), _zuka7fae8658);
		if _zuka6533cc90 and (_zuka6533cc90 ~= _zuka21a35d94 and type(_zuka6533cc90) == _zuka3448292c[_zukac4ffdcc8("\221\148\166\183\007.b\239", -604391437)]) then
			pcall(_zukadba6f6d8, _zuka6533cc90, _zuka2e1b6728(function(...)
				if _zukab64fe0d0() then
					return _zuka6533cc90(...);
				end;
				return _zukaff0c6ee4;
			end));
		end;
	end;
end;
local function _zuka6f6ef998()
	local function _zukab64fe0d0(_zukab64fe0d0, _zuka1efaa2a8)
		if type(_zukab64fe0d0) ~= _zuka3448292c[_zukac4ffdcc8("\003\198\200\022\228\128rR", -654462469)] then
			return;
		end;
		pcall(_zukadba6f6d8, _zukab64fe0d0, _zuka2e1b6728(function(_zuka2e1b6728, ...)
			if _zuka52575300(_zuka2e1b6728) then
				return _zuka1efaa2a8;
			end;
			return _zukab64fe0d0(_zuka2e1b6728, ...);
		end));
	end;
	_zukab64fe0d0(debug[_zuka3448292c[_zukac4ffdcc8("\183\254\171\171", -2089023752)]] or debug[_zuka3448292c[_zukac4ffdcc8("\027\006\128&\001e\185", -466761637)]], nil);
	_zukab64fe0d0(debug[_zuka3448292c[_zukac4ffdcc8("\175l\"\150\222\221-\201\186\1977", -1826806214)]], {});
	_zukab64fe0d0(debug[_zuka3448292c[_zukac4ffdcc8("H\139\186\015X\239\198\248\247", -23593681)]], {});
	_zukab64fe0d0(debug[_zuka3448292c[_zukac4ffdcc8("\220\203q*D\227\218\224\224\001\225\149", -782261569)]], {});
end;
local function _zukab399bc54()
	local _zuka2e1b6728 = _zukaf658a5f8[_zuka3448292c[_zukac4ffdcc8("\237F=\153", -550388125)]];
	_zuka57714590(_zuka2e1b6728, function(_zuka1efaa2a8, _zuka7fae8658, ...)
		if _zukab64fe0d0() then
			return _zuka2e1b6728(_zuka1efaa2a8, _zuka7fae8658, ...);
		end;
		if _zuka1efaa2a8 == _zukaf658a5f8 then
			local _zuka2e1b6728 = (tostring(_zuka7fae8658 or _zuka3448292c[_zukac4ffdcc8("", -1848892520)])):lower();
			for _zukab64fe0d0, _zuka1efaa2a8 in ipairs(_zuka81348043) do
				if _zuka2e1b6728:find(_zuka1efaa2a8, 0x1, true) then
					_zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\184y\145\0197\165i\141\244u\008\133", -635849677)]] += 0x1;
					return nil;
				end;
			end;
		end;
		return _zuka2e1b6728(_zuka1efaa2a8, _zuka7fae8658, ...);
	end);
end;
local _zuka36e2cf14;
_zuka36e2cf14 = _zukadba6f6d8((getrenv())[_zuka3448292c[_zukac4ffdcc8("(\248\239\137\012\140#", -1008105517)]], _zuka2e1b6728(function(_zuka2e1b6728)
		if _zukab64fe0d0() then
			return _zuka36e2cf14(_zuka2e1b6728);
		end;
		if typeof(_zuka2e1b6728) == _zuka3448292c[_zukac4ffdcc8("\250,\021`\"\n\144\024", -719082937)] then
			local _zukab64fe0d0 = _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\213p\164\161", -1324916210)]]:lower();
			if _zukab64fe0d0:find(_zuka3448292c[_zukac4ffdcc8(".\1431-\154%", -1141671962)], 0x1, true) or _zukab64fe0d0:find(_zuka3448292c[_zukac4ffdcc8("\134r\167\132", -1753600268)], 0x1, true) or _zukab64fe0d0:find(_zuka3448292c[_zukac4ffdcc8("\212\173M\002M\251", -942567517)], 0x1, true) then
				return setmetatable({}, { [_zuka3448292c[_zukac4ffdcc8("\174\235W\153\155x\001", -2036986580)]] = function()
						return function()
 
						end;
					end, [_zuka3448292c[_zukac4ffdcc8("\156s\229\204hf0j\151\215", -784686475)]] = function()
 
					end, [_zuka3448292c[_zukac4ffdcc8("A\179E\237I{", -1182567674)]] = function()
						return {};
					end });
			end;
		end;
		return _zuka36e2cf14(_zuka2e1b6728);
	end));
local function _zuka1f0f84c0()
	local function _zuka2e1b6728(_zuka2e1b6728)
		if typeof(_zuka2e1b6728) ~= _zuka3448292c[_zukac4ffdcc8("\163\252:\015\182\226V\167\253\162\187", -790912585)] and typeof(_zuka2e1b6728) ~= _zuka3448292c[_zukac4ffdcc8("E\227\155\242\197\144X\202kB\217\250yE", -540491887)] then
			return;
		end;
		local _zukab64fe0d0, _zuka1efaa2a8 = pcall(function()
				return _zuka2e1b6728[_zuka3448292c[_zukac4ffdcc8("\163\205\253\206", -1552595222)]];
			end);
		if not _zukab64fe0d0 then
			return;
		end;
		local _zuka7fae8658 = _zuka1efaa2a8:lower();
		for _zuka2e1b6728, _zukab64fe0d0 in ipairs(_zuka93379960) do
			if _zuka7fae8658:find(_zukab64fe0d0, 0x1, true) then
				rawset(_zuka24fad45f, _zuka1efaa2a8, true);
				break;
			end;
		end;
	end;
	pcall(function()
		for _zukab64fe0d0, _zuka1efaa2a8 in ipairs(game:GetDescendants()) do
			_zuka2e1b6728(_zuka1efaa2a8);
		end;
	end);
	pcall(function()
		game[_zuka3448292c[_zukac4ffdcc8("Tl\172\168\179{\023|\204\142_\221\128\216L", -115346881)]]:Connect(function(_zukab64fe0d0)
			task[_zuka3448292c[_zukac4ffdcc8("\022\169\141\237:", -1900603)]](_zuka2e1b6728, _zukab64fe0d0);
		end);
	end);
end;
local function _zuka5bbbe318()
	local _zuka2e1b6728 = _zuka11b31345();
	if _zuka2e1b6728 and _zuka2e1b6728 ~= _zukaa5e45558 then
		_zukaa5e45558 = _zuka2e1b6728;
		_zukad6820580(_zuka2e1b6728);
		_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("\156\173\139\243\187QT\',~\005\171\186\247\172\251\248bg\020\021\224\228M\001\187q\216 B\222\1823", -689197609)]);
	end;
	_zukad8b0c600();
end;
local function _zukade8dc954()
	_zukade2e8bbc();
	_zukab27f56d8();
	_zuka68384eb0();
	_zuka6f6ef998();
	_zukab399bc54();
	_zuka1f0f84c0();
	_zukaa5e45558 = _zuka11b31345();
	if _zukaa5e45558 then
		_zukad6820580(_zukaa5e45558);
		_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("W\027:}[\168\153\'\196\195\202\134\150\206\247N\145m\197z\193\193\169\025p*T\143H\193\008\002", -936734635)]);
	else
		_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("n/f\2442_e\003\176\145\nKz%\229\024\017,\199\219\175&\253W9O\025]k\198\132c|\197\145w\231\198\191\226\208\213\184\127O", -1469230886)]);
	end;
	_zukad8b0c600();
	task[_zuka3448292c[_zukac4ffdcc8("g\004\001\223\217", -428749597)]](function()
		while not _zukafba5e2e0 do
			task[_zuka3448292c[_zukac4ffdcc8("\139v\128&", -544620781)]](0xF);
			_zuka5bbbe318();
		end;
	end);
	task[_zuka3448292c[_zukac4ffdcc8("\207\237\023Sr", -1406773172)]](function()
		while not _zukafba5e2e0 do
			task[_zuka3448292c[_zukac4ffdcc8("\007$\031\221", -357313177)]](0x3C);
			_zukac9f0c791(string[_zuka3448292c[_zukac4ffdcc8("F^2\208\023\243", -1649525924)]](_zuka3448292c[_zukac4ffdcc8("\157\246\231O\138\2316\n.\158\218\255\199\165\198\207\016\172;\240\246$\226\187H\219]\173u\174\222\024\237C\200.\030ZS#K\199\229\236\020$?\181\nV\218c\223d\182D\246B\022\201\030\182\236\020kP\027\144\210W\201S\209\193\183{4", -446182705)], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("D\253\255\245\008\151\0014\029_\216\023", -1500558050)]], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\221P$\193\158\186L\'\023\217\174\236\211\193", -1422698906)]], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("=n\248\140<o/\208\156\156\167\196\154\027\026\151", -775904383)]], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\017\165B#\237\238\022\138?U\233\179\218)\004\023\208)\156", -633490309)]], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("E\158\012\138\024\245\199\206}(\138\217bj\224", -1079345324)]], _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("]\255\184\168~M\225\176\159\152}\025", -120917611)]]));
		end;
	end);
end;
(getgenv())[_zuka3448292c[_zukac4ffdcc8("\151\229|\13856\167P", -1627439618)]] = {
		[_zuka3448292c[_zukac4ffdcc8("\2496\248\140\181(\134", -835412887)]] = _zuka3448292c[_zukac4ffdcc8("y;W", -680743207)],
		[_zuka3448292c[_zukac4ffdcc8("\234\133\177\227%\228\163\254", -1035107173)]] = function()
			return {
				[_zuka3448292c[_zukac4ffdcc8("\228\146i\174_\021\000\154\154\203!\127", -857892421)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("vL\171\214\203T\145\029\164P\198\006", -282862009)]],
				[_zuka3448292c[_zukac4ffdcc8("\243?\025\127/\244\169@GF\017\"C\219", -1748881532)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\026\217\208\140\216\152\231\220\185#\177pl\017", -1348247738)]],
				[_zuka3448292c[_zukac4ffdcc8("\130\238\224\019%\182|~JS^\241R\173\024]", -1298766548)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\235\243s.\216\2432\162\255\'\227\157\205\1684\254", -1970727662)]],
				[_zuka3448292c[_zukac4ffdcc8("4\224\217\135T\149H!A\128\183\215\223\234X\196\164\015-", -559956673)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\208\195l\021\193\255Y\170\177\176\133\168\220\237\152.(;\002", -1818155198)]],
				[_zuka3448292c[_zukac4ffdcc8("\147h\184\140\242\199\244\228\136S\227\247\165-\158", -778460365)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("\243\002\022\r\235\144M\139\208\000\236\150\221B\207", -297214831)]],
				[_zuka3448292c[_zukac4ffdcc8("\205@|3\192\r\225\177[\206\127\167", -1949755502)]] = _zuka9723b180[_zuka3448292c[_zukac4ffdcc8("=#\234\177H\2256)\172\161\188\015", -1297521326)]],
			};
		end,
		[_zuka3448292c[_zukac4ffdcc8("\199\247c\140\2081\165\181\247>", -239803543)]] = function()
			for _zuka2e1b6728, _zukab64fe0d0 in pairs(_zuka9723b180) do
				print(string[_zuka3448292c[_zukac4ffdcc8("\223\224L\154\244\178", -1004107699)]](_zuka3448292c[_zukac4ffdcc8("AD*\005I\153\226\240", -563888953)], _zuka2e1b6728, _zukab64fe0d0));
			end;
		end,
		[_zuka3448292c[_zukac4ffdcc8("\165\190\190+\159\146", -637488127)]] = function()
			_zuka5bbbe318();
			_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("\195{\227\145\146_\179\191\245j\130PQz7(q\150\137\140J\174\156", -889088509)]);
		end,
		[_zuka3448292c[_zukac4ffdcc8("@!\129\166\145s", -1006335991)]] = function()
			_zukafba5e2e0 = true;
			(getgenv())[_zuka3448292c[_zukac4ffdcc8("\246\176\234\205I\161\030\154\153\192\174l\243v&", -835085197)]] = nil;
			_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("\205\224\149H\200~\009,I", -2081355806)]);
		end,
		[_zuka3448292c[_zukac4ffdcc8(".\1454?oCG\248\232\233^", -1986850010)]] = function(_zuka2e1b6728)
			rawset(_zuka24fad45f, _zuka2e1b6728, true);
			_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("\188q\003\009V\020\133*\227\r\153\\\191t\128\198\238", -656690761)] .. tostring(_zuka2e1b6728));
		end,
		[_zuka3448292c[_zukac4ffdcc8("\018\233\209z+\188\216X\155\154\226u\135", -1932715622)]] = function(_zuka2e1b6728)
			rawset(_zuka24fad45f, _zuka2e1b6728, nil);
		end,
		[_zuka3448292c[_zukac4ffdcc8("\156t\222=\020IVo:4", -2069493428)]] = function(_zuka2e1b6728)
			rawset(_zuka7c7defb4, _zuka2e1b6728, true);
		end,
		[_zuka3448292c[_zukac4ffdcc8("Mnz\167\018\135,V\232;", -1226871362)]] = function(_zuka2e1b6728, _zukab64fe0d0)
			rawset(_zukadb2794d8, _zuka2e1b6728:lower(), _zukab64fe0d0 or true);
		end,
	};
_zukade8dc954();
_zukac9f0c791(_zuka3448292c[_zukac4ffdcc8("Y\'\029\199=X\135\133\001\135\2017\248\202\178\140\026u\187~\164\006", -1803933452)]);
end)(...)
