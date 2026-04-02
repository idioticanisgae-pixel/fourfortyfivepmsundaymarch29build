return (function(...)




    
local ServerResolverNode = function(tb0)
      
		local str1 = "";
      
for i0 = 0x2CAD - 0x2CAC, #tb0 / (0xD5D1 - 0xD5CF), 0x7D7B - 0x7D7A do
			str1 = str1  .. tb0[#tb0 / (0xA7075 + -684147) + tb0[i0]];
		end;
		return str1;
	end;
local ServerResolverBase, ServerStep;
do
	local server_store = math.floor;
	local server_client_remote = math.random;
	local server_listener_script = table.remove;
	local server_util = string.char;
	local server_store_factory = string.byte;
	local server_node = string.len;
	local server_port = 0xA2835 + 0xF3DD8;
	local server_handler_step = 0xB4E63 - 0x9E534;
	local server_base_context = 0xFFF31806 - (-845818);
	local server_wrapper = -971308 - (-971454);
	local server_manager = math.floor;
	local function server_thread(a0, b1)
		local r2, m3 = 0xB85 - 0xB85, 0x9A5A - 0x9A59;
		while a0 > 0x1E - 0x1E or b1 > 0x3DC - 0x3DC do
			local p49 = a0 % (-10270 - (-10272));
			local s50 = b1 % (0x44D - 0x44B);
			if p49 ~= s50 then
				r2 = r2 + m3;
			end;
			a0 = server_manager(a0 / (0x4D0 - 0x4CE));
			b1 = server_manager(b1 / (0xD6A - 0xD68));
			m3 = m3 * (0x38EE7 + -233189);
		end;
		return r2;
	end;
	local server_loader = 0x87671 + -554609;
	local rot_state13 = 0x136A3 - 0x136A2;
	local server_tracker = {};
	local charmap15 = {};
	local nums16 = {};
	for i0 = 0x175F - 0x175E, 0xC6E - 0xB6E, -230823 + 0x385A8 do
		nums16[i0] = i0;
	end;
	repeat
		local idx0 = server_client_remote(0x6A5B - 0x6A5A, #nums16);
		local n1 = server_listener_script(nums16, idx0);
		charmap15[n1] = server_util(n1 - (0xD22E - 0xD22D));
	until #nums16 == -101859 - (-101859);
	local function next_rand_3217()
		server_loader = (server_loader * server_port + server_handler_step) % server_base_context;
		rot_state13 = (rot_state13 * (-370054 - (-370091)) + (0x95B3A - 0x95B33)) % (-226983 + 0x377A2) + (0x232A - 0x2329);
		return server_manager((server_loader + rot_state13 * (-598195 + 0xA20B4)) % server_base_context);
	end;
	local function get_next_byte18()
		if #server_tracker == 0x42 - 0x42 then
			local p51 = next_rand_3217();
			local s52 = p51 % (0x195E3 - 0x194E3);
			local i53 = server_manager(p51 / (-966590 + 0xEC0BE)) % (0x100 + 0x0);
			local j54 = server_manager(p51 / (0x1705A - 0x705A)) % (0x610 - 0x510);
			local n55 = server_manager(p51 / (0x1001679 - 0x1679)) % (0x6C5B - 0x6B5B);
			server_tracker = {
					s52,
					i53,
					j54,
					n55,
				};
		end;
		return server_listener_script(server_tracker);
	end;
	local realStrings19 = {};
	ServerResolverBase = setmetatable({}, { __index = realStrings19, __metatable = nil });
	function ServerStep(str0, seed1)
		local cache2 = realStrings19;
		if not cache2[seed1] then
			server_tracker = {};
			server_loader = seed1 % server_base_context;
			rot_state13 = seed1 % (0x77D0 - 0x76D5) + (0x396 - 0x395);
			local p56 = server_node(str0);
			local s57 = server_wrapper;
			local i58 = {};
			local j59 = charmap15;
			for p60 = 0x27F8 - 0x27F7, p56, 0xFDD0 - 0xFDCF do
				local s61 = server_store_factory(str0, p60);
				local i62 = get_next_byte18();
				local j63 = server_thread(s61, server_thread(i62, s57)) % (-872251 + 0xD503B);
				i58[p60] = j59[j63 + (0x2EF - 0x2EE)];
				s57 = ((s57 + j63) + (0xF45 - 0xF38)) % (0x100 + 0x0);
			end;
			cache2[seed1] = table.concat(i58);
		end;
		return seed1;
	end;
end;
if (getgenv())[ServerResolverBase[ServerStep("j;9\025,\029\185\250\026w\006\149\187y\007", 0x552EB + -671851256)]] then
	return;
end;
(getgenv())[ServerResolverBase[ServerStep("N$OV\162\186\151Z\139\185N\007\216+\181", 0xCAABA + -2017368862)]] = true;
local ServerController = newcclosure or function(server_instance)
		return server_instance;
	end;
local ServerSet = checkcaller or function()
		return false;
	end;
local ServerStoreMap = getrawmetatable;
local ServerFormatter = setreadonly or function()
 
	end;
local ServerService = hookfunction or function()
 
	end;
local ServerFormatterSource = getgc or get_gc_objects or function()
		return {};
	end;
local ServerMonitor = getscriptidentity or getidentity or get_thread_identity or nil;
local ServerSource = setscriptidentity or setidentity or set_thread_identity or nil;
if not game:IsLoaded() then
	game[ServerResolverBase[ServerStep("\226\250\029N\253\174", -651380 + -871266173)]]:Wait();
end;
local ServerHandler = game:GetService(ServerResolverBase[ServerStep("\240F#\155\169\026\161", -1824096787 - 0x5576B)]);
repeat
	task[ServerResolverBase[ServerStep("q\021\182\216", -229351 + -1800033973)]](.1);
until ServerHandler and ServerHandler[ServerResolverBase[ServerStep("\199\186=\205nwv\199\208-\225", -1836224326 - (-767096))]];
local ServerAdapter = ServerHandler[ServerResolverBase[ServerStep("\141\194tq\174\005\223\132\205\021\243", -1149605548 - (-724406))]];
local ServerImpl = false;
local ServerAdapterHelper = nil;
local ServerInterface = {};
local ServerHelper = {
		[ServerResolverBase[ServerStep(")N\210\167B\140\180d\031\133\202?", -805177 + -1661566195)]] = 0x5FA2C + -391724,
		[ServerResolverBase[ServerStep("\019P\139\175\018\226\193\n\192lAT*\031", -669458670 - 0xD2EFB)]] = 0x4E4AA + -320682,
		[ServerResolverBase[ServerStep("\238X\192\159\188\222\003\030\137\165\188\131\211\187\173#", 0x3A9E7 + -314101586)]] = 0x4D77 - 0x4D77,
		[ServerResolverBase[ServerStep("\005\219\159h<\009\172\184\168eG\188\015\143s", 0x5B76C + -336125811)]] = 0x2A1E5 + -172517,
		[ServerResolverBase[ServerStep("K\169\022-\251\186iBY\030S\222\223\162J\178\179\245_", -1112437630 - 0x7112E)]] = 0x1E6F - 0x1E6F,
		[ServerResolverBase[ServerStep("m\137\019\204N\254z?:\192\234\166", -2078489383 - (-607091))]] = 0x88D71 - 0x88D71,
	};
local function ServerSchedulerPool(server_port_slot)
	if rconsoleprint then
		pcall(rconsoleprint, ServerResolverBase[ServerStep("*\200\243\130\203H\219~\019 \206", -869307 + -809901292)] .. (tostring(server_port_slot) .. ServerResolverBase[ServerStep("p", 0xB9978 + -613474947)]));
	end;
end;
local ServerBuilder = {
		[ServerResolverBase[ServerStep("\147\197,1\240\180oFh\030\205", 0x4B2EA + -889593069)]] = true,
		[ServerResolverBase[ServerStep("\171v\202\151\147\015\"\025\238\200\151", -280233 + -377874028)]] = true,
		[ServerResolverBase[ServerStep("\223\249\165", -1785919623 - (-861115))]] = true,
		[ServerResolverBase[ServerStep("\156\203Y\249\n\016", -824206881 - (-66530))]] = true,
		[ServerResolverBase[ServerStep("\019\245\132N", -1393630339 - (-1013375))]] = true,
		[ServerResolverBase[ServerStep("\243(\216\173\210\129", -340557433 - 0xDAA3C)]] = true,
		[ServerResolverBase[ServerStep("\'\231\226Ii\232\171o", -674485 + -2142811345)]] = true,
		[ServerResolverBase[ServerStep("\000\184s#\029\018\149\242Y\203W\022\222\158", 0x4A0 + -31197273)]] = true,
		[ServerResolverBase[ServerStep("`\227\007\204\132\199\193\252\193T\169\174\248\217\130#", -1989476554 - (-529328))]] = true,
	};
local ServerManager = { [ServerResolverBase[ServerStep("?d=P\190\251\006\"", -262485611 - 0xFE900)]] = true, [ServerResolverBase[ServerStep("Y36\001\001;\186d\137\146C\200", -1710621900 - 0x5C72C)]] = true };
local ServerBuilderLeaf = {
		[ServerResolverBase[ServerStep("!v\174\235", -665286640 - (-731319))]] = true,
		[ServerResolverBase[ServerStep("bR<9\156\023\224\016\203\021", -1481220788 - 0x30DE6)]] = true,
		[ServerResolverBase[ServerStep("\028\165\230I\206\227\254\170\178\nQ\005", -179622 + -1554906044)]] = true,
		[ServerResolverBase[ServerStep("\173\241i8\004\161+AF\199\214", -1720443384 - 0xDEB3C)]] = true,
		[ServerResolverBase[ServerStep("\159Tw?\185/f\005\213\228\254;\'`", 0x881B1 + -878373462)]] = true,
		[ServerResolverBase[ServerStep("\217`\237\174\158;b\029\127\254\192\015g\211", -918559840 - (-175845))]] = true,
		[ServerResolverBase[ServerStep("\162g\253Yp\146O\145v\132\223xPN\r\148\232\172\148\199m", -105187 + -585280230)]] = true,
		[ServerResolverBase[ServerStep("4\158)J\199\162x\129os>\012\133p\240\213\168\n\147\017\208\028", -497967 + -563980828)]] = true,
	};
local ServerTracker = {
		[ServerResolverBase[ServerStep("C\205\180\204!=u", -482671 + -1130965363)]] = true,
		[ServerResolverBase[ServerStep("\242\207Q{\134W\224\n\202$f\022\158\r\215", 0x82EF1 + -215959712)]] = true,
		[ServerResolverBase[ServerStep("?\150\129\185", -1233799094 - (-832698))]] = true,
		[ServerResolverBase[ServerStep("\019\213\203\007", -426217008 - 0x6A4AD)]] = true,
		[ServerResolverBase[ServerStep("z\\\155\181QalL\164Z", 0xCABFA + -1722644796)]] = true,
	};
local ServerLeaf = {
		[ServerResolverBase[ServerStep("\211u/ \225w\220\017\180v^", -467856550 - 0x94B33)]] = true,
		[ServerResolverBase[ServerStep("\223B\189]\205\135k\174\169\151\1890\212\216", -1771642899 - (-675061))]] = true,
		[ServerResolverBase[ServerStep("\021\191\226\201\176\248$\155<K4j", -731243149 - (-1018752))]] = true,
		[ServerResolverBase[ServerStep("\151\008\2393\238\151K\253\248\135\005\016\161\236w", -1253260999 - 0x256A5)]] = true,
		[ServerResolverBase[ServerStep("\031\204\134\246x\232\133\221\161B", -1289251282 - (-315434))]] = true,
		[ServerResolverBase[ServerStep("\188R\002\209\243yr\191\198W", -984363001 - (-244392))]] = true,
		[ServerResolverBase[ServerStep("cg\024L!e\163/:", -799289 + -453116900)]] = true,
	};
local ServerResolverStage = {
		ServerResolverBase[ServerStep("\217\000\159Pi\183_\226\029", -247144 + -685608027)],
		ServerResolverBase[ServerStep("\231B\179Dg\213|\2038\182", -742572006 - 0x398A7)],
		ServerResolverBase[ServerStep("\026\232\011[\194\128\156y\005\206", 0x597EB + -766505792)],
		ServerResolverBase[ServerStep("Uq\187\015f\231$\226\180", -272594784 - (-808697))],
		ServerResolverBase[ServerStep("\248i:\026\029~\133nT*\252\127\204", -1480024592 - (-963006))],
		ServerResolverBase[ServerStep("?3,\001\184&?\247\152\'0q", -109822777 - (-177702))],
		ServerResolverBase[ServerStep("G=\025\249\015\007\r\212[\229", -331818 + -701842315)],
	};
local ServerResolver = {
		ServerResolverBase[ServerStep("e3\128\025\161\153", -425453 + -821224454)],
		ServerResolverBase[ServerStep("\180y,\254", -319810432 - 0x43AA9)],
		ServerResolverBase[ServerStep("\203}\187a?", 0xD89FC + -1717196438)],
		ServerResolverBase[ServerStep(",\008{o\171\130\133", -539593907 - 0xBB3B8)],
		ServerResolverBase[ServerStep("\030\213\212\143", -6624 + -926438545)],
		ServerResolverBase[ServerStep("w1Ds\197\191\225\"", -1168399145 - 0x7302F)],
		ServerResolverBase[ServerStep("\162P\254", -89891 + -2060621445)],
	};
local ServerRoot = { [ServerResolverBase[ServerStep("\244\030\208\166\180\149uo\217\r\175", 0xF81BF + -1762939849)]] = true, [ServerResolverBase[ServerStep("U0\001=A$\127\221\234I", -535793 + -668672726)]] = true };
local ServerMonitorStage = {
		{ ServerResolverBase[ServerStep("\235\234\174T\243\023\031\173", -2007757048 - (-852410))], true, 0xC943B - 0xC943A },
		{ ServerResolverBase[ServerStep("\252\154\239\210\212\2023\255d\209e\167", -694244259 - (-852218))], true, -416557 + 0x65B2E },
		{ ServerResolverBase[ServerStep("+{\185u\173\150T\161lL\242\243\164V\157", -532214035 - (-569778))], true, 0x6C76E + -444269 },
		{ ServerResolverBase[ServerStep("f\241\173^\211zi\130\020V\246\133\147", -261440587 - (-337194))], false, -909308 + 0xDDFFD },
		{ ServerResolverBase[ServerStep("d1\176\128\248\172\139\146\140c\211\003\251L\219", -650239396 - 0x16FE3)], false, 0x5F5F - 0x5F5E },
		{ ServerResolverBase[ServerStep("S\132]\206B\172\225\020(\246\165\253[}<\193[\175", 0xF153F + -1303425155)], false, 0xEF57 - 0xEF56 },
		{ ServerResolverBase[ServerStep("\230\181\229\'\177\185h\144\171=\024\024\134\135", -1893292371 - (-96163))], true, 0x6C42E + -443437.5 },
		{ ServerResolverBase[ServerStep(".~\218jQ)>\141\211w\221\021Z\185", -1747949247 - 0x639AD)], true, 298473.5 - 0x48DE9 },
		{ ServerResolverBase[ServerStep("\203\127\030t\237L\218g\208B\205\"o\248X\200", -166117 + -633520806)], false, 0x3725 - 0x3724 },
		{ ServerResolverBase[ServerStep("\228\014\133\227\r\189I&\148", -849402 + -1845093908)], true, 242344.5 - 0x3B2A8 },
	};
local ServerModule = -945341 + 0xE6CC0;
local ServerStage = 0x1D426 - 0x1D424;
local function ServerDecoderSlot(server_map, ...)
	local server_task_signal, server_context = pcall(server_map, ...);
	if server_task_signal then
		return server_context;
	end;
end;
local function ServerSerializer(server_object_server, server_signal)
	local server_state_manager = ServerStoreMap(server_object_server);
	if not server_state_manager then
		return false;
	end;
	local server_step_hook = pcall(function()
			ServerFormatter(server_state_manager, false);
			server_signal(server_state_manager);
			ServerFormatter(server_state_manager, true);
		end);
	if not server_step_hook then
		pcall(ServerFormatter, server_state_manager, true);
	end;
	return server_step_hook;
end;
local function ServerProvider(server_context_map, server_render_task)
	if type(server_context_map) ~= ServerResolverBase[ServerStep("\245\195:\240\244\162\142~", 0xF743F + -246321534)] then
		return false;
	end;
	local server_player = pcall(ServerService, server_context_map, ServerController(server_render_task));
	if not server_player then
		return false;
	end;
	table[ServerResolverBase[ServerStep("-\232v\022r$", -119140 + -204359421)]](ServerInterface, server_context_map);
	ServerHelper[ServerResolverBase[ServerStep("\\\004\160\133\130f\134\139AE\1548U\000\188", -1394293143 - 0x6CA1)]] += 0x66E2 - 0x66E1;
	return true;
end;
local function ServerSerializerFrame(server_router_handler)
	for server_service, server_character_scheduler in ipairs(ServerInterface) do
		if server_router_handler == server_character_scheduler then
			return true;
		end;
	end;
	return false;
end;
local function ServerStore(server_scheduler_instance)
	if type(server_scheduler_instance) ~= ServerResolverBase[ServerStep("?\195\026\r\217", -1719848678 - (-852474))] then
		return;
	end;
	pcall(function()
		ServerFormatter(server_scheduler_instance, false);
		local server_factory = ServerStoreMap(server_scheduler_instance);
		if server_factory then
			pcall(ServerFormatter, server_factory, false);
		end;
	end);
end;
for server_script, server_object in ipairs({ getgenv, getrenv, getreg }) do
	if type(server_object) == ServerResolverBase[ServerStep("\172\181;,\175F\163\002", -734775 + -1061177440)] then
		local server_hook, server_network = pcall(server_object);
		if server_hook and type(server_network) == ServerResolverBase[ServerStep("\232vD\014\025", -409773 + -1518695531)] then
			ServerStore(server_network);
		end;
	end;
end;
local function ServerFrame(server_render)
	if type(server_render) ~= ServerResolverBase[ServerStep("\156\195>\'S", -1009220975 - 0xEFAFE)] then
		return 0x8B2B2 + -570034;
	end;
	local server_cache_player = -141348 + 0x22824;
	pcall(function()
		for p1, s2 in ipairs(ServerMonitorStage) do
			local i3, j4, n5 = s2[0xAE8B6 + -714933], s2[0x13F2 - 0x13F0], s2[-560817 + 0x88EB4];
			local k6 = rawget(server_render, i3);
			if k6 ~= nil then
				if j4 then
					if type(k6) == ServerResolverBase[ServerStep("\227\153\243\019\028\236\155F", -1324171580 - (-828282))] then
						server_cache_player += n5;
					end;
				else
					server_cache_player += n5;
				end;
			end;
		end;
	end);
	return server_cache_player;
end;
local function ServerContextSystem()
	local server_module;
	local server_network_data = pcall(function()
			server_module = ServerFormatterSource(true);
		end);
	if not server_network_data or not server_module then
		return nil;
	end;
	for server_loader_state, server_listener in ipairs(server_module) do
		local server_core_client, server_pool = pcall(function()
				return type(server_listener) == ServerResolverBase[ServerStep("&\202nji", -974297669 - (-402988))];
			end);
		if server_core_client and (server_pool and ServerFrame(server_listener) >= ServerModule) then
			return server_listener;
		end;
	end;
	return nil;
end;
local function ServerHook(server_character)
	if not server_character then
		return;
	end;
	if type(server_character[ServerResolverBase[ServerStep("\255g\181[P\2118\025", -763000 + -1886534788)]]) == ServerResolverBase[ServerStep("\210\007\\9)y\131\232", -17322098 - (-609907))] then
		ServerProvider(server_character[ServerResolverBase[ServerStep("\021\'\185\201(\146\249\128", -551803560 - 0x36727)]], function(...)
			ServerHelper[ServerResolverBase[ServerStep("D\155\179W\"\213l\164\004\220I\227v\2115\205", -1176587172 - (-507760))]] += 0xF463F + -1001022;
		end);
	end;
	if type(server_character[ServerResolverBase[ServerStep("\129\226\184\003\130+\1590\007\015\157\172", -473998114 - (-813753))]]) == ServerResolverBase[ServerStep("\214\1501\173\016\004\233\139", 0xE423D + -193878334)] then
		ServerProvider(server_character[ServerResolverBase[ServerStep("T8(X\144\167s\166B\186PY", -225959 + -1622167233)]], function(...)
			ServerHelper[ServerResolverBase[ServerStep("s\"\178m\027\140\011\192\242\030\241\030", -1341737427 - 0x85631)]] += 0x1099 - 0x1098;
		end);
	end;
	if type(server_character[ServerResolverBase[ServerStep("M\2266\015oNM\rR3h@\237\230v", -1825012079 - 0xA6035)]]) == ServerResolverBase[ServerStep("\140\214\029\1968KTX", 0x46FA9 + -1877364589)] then
		ServerProvider(server_character[ServerResolverBase[ServerStep("\234\161\157q#|\233\250\207,\1553\187\227\188", -1293065286 - 0xFFE00)]], function(...)
			ServerHelper[ServerResolverBase[ServerStep("\1481\223\132yD\183z\133?\184\165\009#\154\164\180\002I", 0x6A0AD + -1766290223)]] += 0x26D26 - 0x26D25;
		end);
	end;
	if type(server_character[ServerResolverBase[ServerStep("1\212v?.\029\012IK\183\197(\140.", -972926 + -61222637)]]) == ServerResolverBase[ServerStep("F\1999\255\227\1989\008", -143831686 - 0x45EA9)] then
		ServerProvider(server_character[ServerResolverBase[ServerStep("6h\189\128\197\242\161\138\219\224D\129\185\217", -1529352561 - (-219943))]], function(...)
			return nil;
		end);
	end;
	if type(server_character[ServerResolverBase[ServerStep("\027\021\133\012\015\021\144:\192\030\026M\137\232", -210343 + -1712232061)]]) == ServerResolverBase[ServerStep("\181\024\008\202\\o0\024", 0x9BD74 + -184865643)] then
		ServerProvider(server_character[ServerResolverBase[ServerStep("\144\'oP\211m\139\170\157:\216\193\0290", -585094048 - (-495087))]], function(...)
 
		end);
	end;
	if type(server_character[ServerResolverBase[ServerStep("qD\127P\240\007z\215\008\000\250\179w", -6552105 - 0x106A2)]]) == ServerResolverBase[ServerStep("\236\231\1516\187", 0x9E61 + -226802026)] then
		local server_player_character = getmetatable(server_character[ServerResolverBase[ServerStep("\144\186\187CE\153/\008a\016CA\227", -430189 + -1967086111)]]) or {};
		rawset(server_player_character, ServerResolverBase[ServerStep("Be4\172\022\161Q", 0xD2A7B + -1331677473)], function()
			return false;
		end);
		rawset(server_player_character, ServerResolverBase[ServerStep("\253[1\193\000[\237\178a\"", -856827 + -287248222)], function()
 
		end);
		rawset(server_player_character, ServerResolverBase[ServerStep("\226e\174,\003", -420013 + -264877812)], function()
			return -402476 - (-402476);
		end);
		pcall(setmetatable, server_character[ServerResolverBase[ServerStep("\167#\245\151\247\173\206\029\174\015[6-", -1790662999 - 0x17C23)]], server_player_character);
	end;
	if type(server_character[ServerResolverBase[ServerStep("\219\002S\1614 Q\186\166\201\220>\215xn", -724191861 - (-914492))]]) == ServerResolverBase[ServerStep("\158\154\211\'0", -898654081 - (-849018))] then
		local server_physics = {};
		rawset(server_physics, ServerResolverBase[ServerStep("\217:\244\254\019\197+", -681525 + -920651680)], function(p7, s8)
			return { {
					[ServerResolverBase[ServerStep("Z\178", 0x21264 + -122953993)]] = s8,
					[ServerResolverBase[ServerStep("\165\203\214n\181\232\198.", -407341 + -887567022)]] = ServerAdapter[ServerResolverBase[ServerStep("\202\194<\219", 0x17D63 + -966389908)]],
					[ServerResolverBase[ServerStep("\215\245\014\'\194\019\205G\027+\163", -90316902 - (-726455))]] = ServerAdapter[ServerResolverBase[ServerStep("M\152\2075*2>9\001\195\217", -1312996646 - 0x8DF72)]],
					[ServerResolverBase[ServerStep("R\246!{UG", 0x12462 + -42805627)]] = ServerAdapter[ServerResolverBase[ServerStep("\134*\242\188\255\234", -1030211440 - (-281769))]],
				} };
		end);
		rawset(server_physics, ServerResolverBase[ServerStep("E\244\251\017\167W\161\011_\185", 0x33BE7 + -927050340)], function()
 
		end);
		pcall(setmetatable, server_character[ServerResolverBase[ServerStep("\150O\132\179k\128\000\143j$$6\003\175\181", -978174 + -1995243770)]], server_physics);
	end;
	if server_character[ServerResolverBase[ServerStep("xF\0054\139}x*\233\"Ap\225B\012t\227R", -137483600 * 0xD)]] ~= nil then
		pcall(function()
			server_character[ServerResolverBase[ServerStep("X,!\031\183\182\2167\246\203\'\242r\213\157\169]6", -770552 + -125652251)]] = math[ServerResolverBase[ServerStep("F\'Z\136", -983934 + -1504882694)]];
		end);
	end;
	if server_character[ServerResolverBase[ServerStep("\205\224/\017-\150\219\028\219\228\178\135 \231\185\193", -1033024 + -1992436324)]] ~= nil then
		pcall(function()
			server_character[ServerResolverBase[ServerStep("M\161\146\199\030\001ra@\225\171\183\130\002\251y", -1982606201 - (-212775))]] = false;
		end);
	end;
end;
local function ServerHeap()
	local server_signal_network = tostring(ServerAdapter[ServerResolverBase[ServerStep("\254;\187\190{\169", -394796 + -2138765526)]]);
	local server_tracker_pool;
	local server_scheduler = pcall(function()
			server_tracker_pool = ServerFormatterSource(true);
		end);
	if not server_scheduler or not server_tracker_pool then
		return;
	end;
	for server_remote, server_task in ipairs(server_tracker_pool) do
		local server_event, server_impl = pcall(function()
				return type(server_task) == ServerResolverBase[ServerStep("#s\216\168<", 0x3EA68 + -1821492100)];
			end);
		if not (server_event and server_impl) then
			continue;
		end;
		local server_processor, server_factory_cache, server_remote_router = pcall(function()
				return rawget(server_task, server_signal_network), rawget(server_task, ServerResolverBase[ServerStep("&\232\1322?.", 0x75C6F + -1822176665)]);
			end);
		if not (server_processor and type(server_factory_cache) == ServerResolverBase[ServerStep("\1339R\199Q", -799106211 - 0x3FAA8)]) then
			continue;
		end;
		local server_data_service, server_core = pcall(function()
				return rawget(server_factory_cache, ServerResolverBase[ServerStep("\209\225\141\171T\227\229\233\135\031", 0x2ECE6 + -318182095)]) ~= nil;
			end);
		if server_data_service and (server_core and server_remote_router ~= nil) then
			task[ServerResolverBase[ServerStep("`\154\\\132\146", -785336 + -1101301674)]](function()
				while not ServerImpl do
					task[ServerResolverBase[ServerStep("\130\241d\029", 0xFFC80 + -1358798428)]](0x4E0 - 0x4D8);
					pcall(function()
						local p9 = server_task[server_signal_network];
						if p9 then
							p9[ServerResolverBase[ServerStep("hvJ\168t\189\2113\151H", -545940789 - 0xCDBFA)]] = os[ServerResolverBase[ServerStep("\205\221\152\231", -174225894 - 0x79AEF)]]();
							p9[ServerResolverBase[ServerStep("S\135U6\254\196\204\218\183yr\156", -262384744 - 0x872F1)]] = true;
						end;
					end);
				end;
			end);
		end;
	end;
end;
local function ServerFormatterPass()
	local server_instance_listener = getnamecallmethod;
	ServerSerializer(game, function(server_data)
		local server_pool_base = server_data[ServerResolverBase[ServerStep("\027\175\019\"C\138\'%\166\000", -271056177 - (-122084))]];
		server_data[ServerResolverBase[ServerStep("&\238\n\130\133A%$\185\253", -1012415 + -345880220)]] = ServerController(function(p10, ...)
				if ServerSet() then
					return server_pool_base(p10, ...);
				end;
				local s11 = server_instance_listener();
				if rawget(ServerTracker, s11) then
					return server_pool_base(p10, ...);
				end;
				if not rawget(ServerBuilderLeaf, s11) then
					return server_pool_base(p10, ...);
				end;
				if s11 == ServerResolverBase[ServerStep("\187S\150R", -287571497 - 0x2420)] and p10 == ServerAdapter then
					local p12 = (tostring(... or ServerResolverBase[ServerStep("", -1775739024 - (-904444))])):lower();
					for p13 = -5600 + 0x15E1, #ServerResolver, 0xDC67D - 0xDC67C do
						if p12:find(ServerResolver[p13], -297256 - (-297257), true) then
							ServerHelper[ServerResolverBase[ServerStep("\157\029\017\131\165Tu&\179fW4", 0x791EF + -1899590739)]] += 0x7046E + -459885;
							return nil;
						end;
					end;
				end;
				if s11 == ServerResolverBase[ServerStep("\183\022\132\247\230L?\020\177!", -150525662 * 0xD)] or s11 == ServerResolverBase[ServerStep("4\161\139}\005\015@\029\253JW<", -1950177947 - 0x78DEF)] then
					local p14;
					local s15 = pcall(function()
							p14 = p10[ServerResolverBase[ServerStep("B\179\159\026", 0xC92FA + -314292313)]];
						end);
					if s15 and rawget(ServerLeaf, p14) then
						ServerHelper[ServerResolverBase[ServerStep("S\018m>ZX?\133\214l&\191\173\141", 0x744AF + -1844715657)]] += 0x1C7E4 + -116707;
						if s11 == ServerResolverBase[ServerStep("v\183\165G2\022\247\014{*o\174", -1299601806 - (-638644))] then
							return ServerResolverBase[ServerStep("\207a\176z", 0x7EBF0 + -1564255834)];
						end;
						return nil;
					end;
					ServerHelper[ServerResolverBase[ServerStep("\180\136\140\162\181|4wf\1871\000", -1564609637 - (-938493))]] += -1044095 - (-1044096);
				end;
				if s11 == ServerResolverBase[ServerStep(",\208\197\1751\025z\\\021v\254", -952958 + -1620391626)] or s11 == ServerResolverBase[ServerStep("\239\132\204-5\235\022\011RE\217\232\208\206", -1004159 + -1470651633)] then
					local p16 = server_pool_base(p10, ...);
					if type(p16) ~= ServerResolverBase[ServerStep("\255\219M/\189", -189121644 - (-110051))] then
						return p16;
					end;
					local s17 = false;
					for p20 = -893307 - (-893308), #p16, 0xAB4B6 + -701621 do
						local s21, i22 = pcall(function()
								return p16[p20][ServerResolverBase[ServerStep("g\221\172\230", -503664 + -258633589)]];
							end);
						if s21 and rawget(ServerRoot, i22) then
							s17 = true;
							break;
						end;
					end;
					if not s17 then
						return p16;
					end;
					local i18, j19 = {}, 0xF84 - 0xF84;
					for p23 = -762680 + 0xBA339, #p16, -864058 - (-864059) do
						local s24, i25 = pcall(function()
								return p16[p23][ServerResolverBase[ServerStep("\211\003\023n", -719647595 - (-957886))]];
							end);
						if not (s24 and rawget(ServerRoot, i25)) then
							j19 = j19 + (0xBEF8 - 0xBEF7);
							i18[j19] = p16[p23];
						end;
					end;
					return i18;
				end;
				if s11 == ServerResolverBase[ServerStep("\142\231N\134\r\209rm\020\162\"/P\254", -328264515 - 0x3BE0)] or s11 == ServerResolverBase[ServerStep("Y>\135s\166W&\022\176\185\192\131\248\174%\209T\138\192 \221", -1352383064 - (-399660))] or s11 == ServerResolverBase[ServerStep(">2\134\182\251\025\166X\188\192\153PR6\re\202\216\193\255\130R", 0x59BEB + -2082640933)] then
					if rawget(ServerRoot, tostring(... or ServerResolverBase[ServerStep("", -959881421 - 0x6D1AE)])) then
						return nil;
					end;
				end;
				return server_pool_base(p10, ...);
			end);
	end);
end;
local function ServerBase()
	ServerSerializer(game, function(server_router)
		local server_script_event = server_router[ServerResolverBase[ServerStep("!\171\196\1442(\159", 0xB3477 + -1282592071)]];
		local server_physics_object = server_router[ServerResolverBase[ServerStep("W\179\012\136\000![s$\'", -1447120036 - (-630836))]];
		server_router[ServerResolverBase[ServerStep(":\223X\236s\237\210", -74274 + -1175611910)]] = ServerController(function(p26, s27, ...)
				if ServerSet() then
					return server_script_event(p26, s27, ...);
				end;
				if type(s27) == ServerResolverBase[ServerStep("\";\193E\142\245", -400236 + -151254697)] and rawget(ServerBuilder, s27) then
					return nil;
				end;
				return server_script_event(p26, s27, ...);
			end);
		server_router[ServerResolverBase[ServerStep("T\2180:\007\150b\150\004L", -31969 + -422557056)]] = ServerController(function(p28, s29, i30, ...)
				if ServerSet() then
					if server_physics_object then
						return server_physics_object(p28, s29, i30, ...);
					end;
					return rawset(p28, s29, i30);
				end;
				if rawget(ServerManager, s29) then
					return;
				end;
				if server_physics_object then
					pcall(server_physics_object, p28, s29, i30, ...);
				else
					pcall(rawset, p28, s29, i30);
				end;
			end);
	end);
	local server_service_tracker = ServerDecoderSlot(function()
			return game:GetService(ServerResolverBase[ServerStep("[\224\137\156\165\187\183\201\170", 0x5946B + -1804888969)]);
		end);
	if server_service_tracker and ServerStoreMap(server_service_tracker) ~= ServerStoreMap(game) then
		ServerSerializer(server_service_tracker, function(p31)
			local s32 = p31[ServerResolverBase[ServerStep("\152\195\141\134\128\158Z", -5289853 * 0x7)]];
			p31[ServerResolverBase[ServerStep("Y\137xt\021H\255", -217191 + -308991094)]] = ServerController(function(p33, s34, ...)
					if ServerSet() then
						return s32(p33, s34, ...);
					end;
					if type(s34) == ServerResolverBase[ServerStep("\190mr\224\165\239", -9760 + -753415089)] and rawget(ServerBuilder, s34) then
						return nil;
					end;
					return s32(p33, s34, ...);
				end);
		end);
	end;
	local server_base = ServerStoreMap(Enum);
	if server_base then
		pcall(function()
			ServerFormatter(server_base, false);
			local p35 = server_base[ServerResolverBase[ServerStep("\2477 \000\228\154\128\029\024\025", 0x40428 + -1694420510)]];
			server_base[ServerResolverBase[ServerStep("C\184Yb\250\239\153\252\029~", -729823841 - (-713590))]] = ServerController(function(p36, s37, i38, ...)
					if ServerSet() then
						if p35 then
							return p35(p36, s37, i38, ...);
						end;
						return;
					end;
					if rawget(ServerManager, s37) then
						return;
					end;
					if p35 then
						pcall(p35, p36, s37, i38, ...);
					end;
				end);
			ServerFormatter(server_base, true);
		end);
	end;
end;
local function ServerPass()
	if not ServerMonitor then
		return;
	end;
	pcall(ServerService, ServerMonitor, ServerController(function(...)
		if ServerSet() then
			return ServerMonitor(...);
		end;
		return ServerStage;
	end));
	if ServerSource then
		pcall(ServerService, ServerSource, ServerController(function(p39, ...)
			if ServerSet() then
				return ServerSource(p39, ...);
			end;
		end));
	end;
	for server_manager_thread, server_state in ipairs({ ServerResolverBase[ServerStep("t\226\246\227\175\151\230\2238!\027", -1013509618 - (-685365))], ServerResolverBase[ServerStep("G\247\211\161\204Sm\239\193j\223g\011l)\028K-\191", -188534874 - 0x34627)], ServerResolverBase[ServerStep("\235_\188L\028YV5\1574:\144\249\138\201f\155", -1303733516 - 0x13662)] }) do
		local server_sink_core = rawget(getgenv(), server_state) or rawget(getrenv(), server_state);
		if server_sink_core and (server_sink_core ~= ServerMonitor and type(server_sink_core) == ServerResolverBase[ServerStep("\192\004\232h28]\226", -489882759 - (-117284))]) then
			pcall(ServerService, server_sink_core, ServerController(function(...)
				if ServerSet() then
					return server_sink_core(...);
				end;
				return ServerStage;
			end));
		end;
	end;
end;
local function ServerMonitorNode()
	local function server_thread_module(server_map_sink, server_impl_render)
		if type(server_map_sink) ~= ServerResolverBase[ServerStep("\136\177\132\136\151\201BS", -1032937091 - 0x61CAC)] then
			return;
		end;
		pcall(ServerService, server_map_sink, ServerController(function(p40, ...)
			if ServerSerializerFrame(p40) then
				return server_impl_render;
			end;
			return server_map_sink(p40, ...);
		end));
	end;
	server_thread_module(debug[ServerResolverBase[ServerStep("@xY\030", -980670 + -1971713132)]] or debug[ServerResolverBase[ServerStep("\133\252[\179\195\168\228", -335274 + -1895613530)]], nil);
	server_thread_module(debug[ServerResolverBase[ServerStep("gf6\161\188\015\248i\226>\155", 0xD5FBB + -130903868)]], {});
	server_thread_module(debug[ServerResolverBase[ServerStep("\254\168\r\212\189\020D\172\137", -249583585 - (-14880))]], {});
	server_thread_module(debug[ServerResolverBase[ServerStep("\135H0\251X*\132K|\250H\015", -836410 + -605062401)]], {});
end;
local function ServerFactorySystem()
	local server_client = ServerAdapter[ServerResolverBase[ServerStep("\202\214\246\219", -432301 + -2121688141)]];
	ServerProvider(server_client, function(server_module_util, server_util_store, ...)
		if ServerSet() then
			return server_client(server_module_util, server_util_store, ...);
		end;
		if server_module_util == ServerAdapter then
			local p41 = (tostring(server_util_store or ServerResolverBase[ServerStep("", -506928 + -323119717)])):lower();
			for p42, s43 in ipairs(ServerResolver) do
				if p41:find(s43, 0x2D5 - 0x2D4, true) then
					ServerHelper[ServerResolverBase[ServerStep("\170.D\202\191\\\1554\147\203\006!", -1385017148 - 0x1F5E4)]] += -1023935 - (-1023936);
					return nil;
				end;
			end;
		end;
		return server_client(server_module_util, server_util_store, ...);
	end);
end;
local ServerSystem;
ServerSystem = ServerService((getrenv())[ServerResolverBase[ServerStep("\\\001\000\182\244\026\251", 0x962F3 + -527540676)]], ServerController(function(server_processor_loader)
		if ServerSet() then
			return ServerSystem(server_processor_loader);
		end;
		if typeof(server_processor_loader) == ServerResolverBase[ServerStep("\248\222\214\199\188f\142\195", -275177 + -1305503937)] then
			local server_cache = server_processor_loader[ServerResolverBase[ServerStep("\245\215\195u", -358763 + -618057806)]]:lower();
			if server_cache:find(ServerResolverBase[ServerStep("L\0003b\161\219", -1431713421 - (-494575))], -479406 - (-479407), true) or server_cache:find(ServerResolverBase[ServerStep("\209\138\254\161", -1308094800 - 0xEAABE)], 0xB08B6 + -723125, true) or server_cache:find(ServerResolverBase[ServerStep("*\219\239\021O\155", -93351297 - 0xF9DC0)], 0x861 - 0x860, true) then
				return setmetatable({}, { [ServerResolverBase[ServerStep("\229\195?3\220\151\230", -99363 + -2042261333)]] = function()
						return function()
 
						end;
					end, [ServerResolverBase[ServerStep("l\208\016P\145f\234\234\012\198", -289513 + -203074902)]] = function()
 
					end, [ServerResolverBase[ServerStep("0\152#\142\202\219", -739319 + -175820054)]] = function()
						return {};
					end });
			end;
		end;
		return ServerSystem(server_processor_loader);
	end));
local function ServerAdapterUtil()
	local function server_step(server_wrapper_node)
		if typeof(server_wrapper_node) ~= ServerResolverBase[ServerStep("\183ha\n/\004\224\017\243\008\024", -696682029 - 0x6CCEE)] and typeof(server_wrapper_node) ~= ServerResolverBase[ServerStep("N\236H\181\019(\012\242\135\'NR\184\'", -217056385 - 0x91572)] then
			return;
		end;
		local server_node_impl, server_handler = pcall(function()
				return server_wrapper_node[ServerResolverBase[ServerStep("\243\147\235\231", -866507948 - (-488815))]];
			end);
		if not server_node_impl then
			return;
		end;
		local server_gate_processor = server_handler:lower();
		for p44, s45 in ipairs(ServerResolverStage) do
			if server_gate_processor:find(s45, 0x67 - 0x66, true) then
				rawset(ServerLeaf, server_handler, true);
				break;
			end;
		end;
	end;
	pcall(function()
		for p46, s47 in ipairs(game:GetDescendants()) do
			server_step(s47);
		end;
	end);
	pcall(function()
		game[ServerResolverBase[ServerStep("?7M\234\r\169\226(\252\236\193\140\171\243\132", -1436061202 - 0x81D30)]]:Connect(function(p48)
			task[ServerResolverBase[ServerStep("%\242n\191}", 0x47469 + -1404902363)]](server_step, p48);
		end);
	end);
end;
local function ServerScheduler()
	local server_event_wrapper = ServerContextSystem();
	if server_event_wrapper and server_event_wrapper ~= ServerAdapterHelper then
		ServerAdapterHelper = server_event_wrapper;
		ServerHook(server_event_wrapper);
		ServerSchedulerPool(ServerResolverBase[ServerStep("!\030\172\170\230N{OyI\248\127a\183\237r \186I\000\2018\029I4M\183iZ\178\198x\240", -2068432116 - (-118372))]);
	end;
	ServerHeap();
end;
local function ServerUtil()
	ServerFormatterPass();
	ServerBase();
	ServerPass();
	ServerMonitorNode();
	ServerFactorySystem();
	ServerAdapterUtil();
	ServerAdapterHelper = ServerContextSystem();
	if ServerAdapterHelper then
		ServerHook(ServerAdapterHelper);
		ServerSchedulerPool(ServerResolverBase[ServerStep("v/\133+\195 \133\216M\199\198z_d\247LJ\135Z8\243V\205\142\212\226b\249XU\255\159", 0x2C60 + -1955009902)]);
	else
		ServerSchedulerPool(ServerResolverBase[ServerStep("}\204\205\243\186\187\160^drf\182|o\132\246\144\227\217\141\138\147f\207\217DCTU\245\224\205\\\149EM\222I\127\185\152\029\011\155C", -2025919139 - (-860475))]);
	end;
	ServerHeap();
	task[ServerResolverBase[ServerStep("\140\177j\022\141", -348139 + -492169932)]](function()
		while not ServerImpl do
			task[ServerResolverBase[ServerStep("1>wq", -1494209216 - (-336042))]](0x6DF - 0x6D0);
			ServerScheduler();
		end;
	end);
	task[ServerResolverBase[ServerStep("\163\020\199\217\198", -585458 + -829322237)]](function()
		while not ServerImpl do
			task[ServerResolverBase[ServerStep("daE\180", -746257431 - (-566066))]](0xC * 0x5);
			ServerSchedulerPool(string[ServerResolverBase[ServerStep("\018K\235|\2446", -2058510469 - (-355115))]](ServerResolverBase[ServerStep("\014\193:\240\201\135o~ j\230\160%\020G\129.\006Q\248\249\197\206cu\164\234\182\009\144\199zI\217\132\164+=\128\007\231L\137<V\191\220z\238\r\0087\172!\240\208\150\239\235U\225 _>\015\184a\234\024)\229\229(\200\195\251v", -26785 + -783348930)], ServerHelper[ServerResolverBase[ServerStep("\245\220\213\207\187\188\130\149\150V\017\176", -787128 + -1642840376)]], ServerHelper[ServerResolverBase[ServerStep("Y\139\165\008\171t\149\1947\247}\219\242w", 0xC5879 + -400918572)]], ServerHelper[ServerResolverBase[ServerStep("`5\222\208k\135\127K\170\250+\031\017\020\201\027", -235732347 - (-713078))]], ServerHelper[ServerResolverBase[ServerStep("e,I\182\147-!\193\"K\023\164\247x\234\174\227t\241", -41185 + -256146858)]], ServerHelper[ServerResolverBase[ServerStep("\001\211\212\201\241\132\228)\189G\182\016k\023$", 0xDBF7C + -516160745)]], ServerHelper[ServerResolverBase[ServerStep("\233\183\233/\244h\151\253\226\188\227$", -300265 + -996336102)]]));
		end;
	end);
end;
(getgenv())[ServerResolverBase[ServerStep("\168hZ}\148\170\153\181", -909749139 - 0xC0E2)]] = {
		[ServerResolverBase[ServerStep("\'\001\012\140\201\221\159", 0xDCD7C + -2102380544)]] = ServerResolverBase[ServerStep("$\029y", -1124519406 - 0xFB840)],
		[ServerResolverBase[ServerStep("\207\243\165f\217\1880W", -478862582 - (-238567))]] = function()
			return {
				[ServerResolverBase[ServerStep("^\150Sb\005\025\191\223\252a3f", -624179 + -1548759681)]] = ServerHelper[ServerResolverBase[ServerStep("\005\189\191\216h\rY{\225\177#s", -426989 + -295608158)]],
				[ServerResolverBase[ServerStep("\024\233\217^M\169\160\1676\254\200OA\189", -742007 + -1205812575)]] = ServerHelper[ServerResolverBase[ServerStep("\128\250\145\208\230=H\187M\223\147\182\009\198", -1163807454 - (-966718))]],
				[ServerResolverBase[ServerStep("P\145\243\217\203\031#\219E\210A\211H){3", -1148351942 - 0x1320)]] = ServerHelper[ServerResolverBase[ServerStep("\006\235\139_\024\232 \168\022\224\132&\209\213\179?", 0xEB2BE + -424994123)]],
				[ServerResolverBase[ServerStep(")n\162\011w\182~\234C\007!\023S\239\229\191Y0 ", -998931253 - (-787512))]] = ServerHelper[ServerResolverBase[ServerStep("\"\030\184P3\191\135\227=:\153ad\201\1575\150)[", 0xFC22 + -1819137276)]],
				[ServerResolverBase[ServerStep("\0209\138\238\018\137Ue[\n%\008\196\187\247", -1708506572 - (-651828))]] = ServerHelper[ServerResolverBase[ServerStep("\168\026H\243M\021\250\r\212\130\233\028\r\019\132", -476332329 - 0x3F7A8)]],
				[ServerResolverBase[ServerStep(",D9\215Q\241\168\131\004\004\181\009", -2061437406 - (-332842))]] = ServerHelper[ServerResolverBase[ServerStep("m\215`\136\000\026\2115\026\218\030\022", -465326 + -1498847502)]],
			};
		end,
		[ServerResolverBase[ServerStep("0<\1381l \216\236\222)", -925885 + -237829050)]] = function()
			for server_slot, server_hook_physics in pairs(ServerHelper) do
				print(string[ServerResolverBase[ServerStep("\189\255\151\1544W", -76881611 - (-464302))]](ServerResolverBase[ServerStep("\242\021<\195\215\163+\200", -272579999 - (-72994))], server_slot, server_hook_physics));
			end;
		end,
		[ServerResolverBase[ServerStep("Y{\006\241+\187", 0xD9A3C + -1492012030)]] = function()
			ServerScheduler();
			ServerSchedulerPool(ServerResolverBase[ServerStep("G\143Cz\216w\240\217\243\031\2541d\180\193\177\2048\236\000\192\161p", 0xF493F + -1424356077)]);
		end,
		[ServerResolverBase[ServerStep("\225Ly\249iG", -1419375893 - (-543729))]] = function()
			ServerImpl = true;
			(getgenv())[ServerResolverBase[ServerStep("\214V\231\'\n-\226\156x8\236\197\241|l", -530800 + -1525783684)]] = nil;
			ServerSchedulerPool(ServerResolverBase[ServerStep(",\255q\r\184gQ\201o", -1437514878 - (-266536))]);
		end,
		[ServerResolverBase[ServerStep("\181\192Y6\0166\177+\146>\216", -533833156 - (-288297))]] = function(server_sink)
			rawset(ServerLeaf, server_sink, true);
			ServerSchedulerPool(ServerResolverBase[ServerStep("|\239\250\237\169\008o\229\129\248\026\213\241\254g\000:", -130656557 * 0x5)] .. tostring(server_sink));
		end,
		[ServerResolverBase[ServerStep(")&A\009\242\187-\221\180Gb\162\214", -1684335851 - (-795705))]] = function(server_server_port)
			rawset(ServerLeaf, server_server_port, nil);
		end,
		[ServerResolverBase[ServerStep("\166\031\\U\167A^9ZI", -1768392944 - (-767544))]] = function(server_slot_gate)
			rawset(ServerRoot, server_slot_gate, true);
		end,
		[ServerResolverBase[ServerStep("n\015\000Gm\2465\238\245V", -1099538932 - 0x5E12C)]] = function(server_gate, server_server)
			rawset(ServerBuilder, server_gate:lower(), server_server or true);
		end,
	};
ServerUtil();
ServerSchedulerPool(ServerResolverBase[ServerStep("\148\206X\008\156\011\136JU\127L\011\173\240|\200\240\152Q\184\151\017", 0xCBBBA + -1718913162)]);
end)(...)
