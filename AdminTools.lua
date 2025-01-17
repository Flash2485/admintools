script_name("AdminTools")
script_authors("James Turner")
script_dependencies("SAMPFUNCS", "SAMP")
script_version("2.7.0.4")
script_description("AdminTools for Advance-RP")
script_moonloader(26)
script_properties("work-in-pause")
require("lib.sampfuncs")
require("lib.moonloader")

local var_0_0 = require("inicfg")
local var_0_1 = require("memory")
local var_0_2 = require("ffi")
local var_0_3 = require("matrix3x3")
local var_0_4 = require("vector3d")
local var_0_5 = require("vkeys")
local var_0_6 = require("encoding")

var_0_6.default = "CP1251"
u8 = var_0_6.UTF8
settings = {
	u8("\xCE\xE1\xF9\xE8\xE5 \xED\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE8"),
	u8("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9"),
	u8("\xC3\xEE\xF0\xFF\xF7\xE8\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xE8"),
	u8("\xD7\xE5\xEA\xE5\xF0"),
	u8("\xD7\xE8\xF2\xFB"),
	u8("\xD7\xE0\xF2")
}
help = {
	u8("\xCA\xEE\xEC\xE0\xED\xE4\xFB"),
	u8("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9"),
	u8("\xCC\xE5\xED\xFE \xE1\xFB\xF1\xF2\xF0\xFB\xF5 \xEA\xEE\xEC\xE0\xED\xE4"),
	u8("\xCE\xF2\xEB\xE0\xE2\xEB\xE8\xE2\xE0\xED\xE8\xE5 \xE0\xE4\xEC\xE8\xED. \xEA\xEE\xEC\xE0\xED\xE4")
}
key_name = {
	u8("\xC3\xEB\xE0\xE2\xED\xEE\xE5 \xEC\xE5\xED\xFE"),
	u8("Reconnect"),
	u8("WallHack"),
	u8("GodMode \xE8 \xEF\xEE\xF7\xE8\xED\xEA\xE0 \xD2/\xD1"),
	u8("AirBreak"),
	u8("\xCA\xEB\xE0\xE2\xE8\xF8\xE0 \xEF\xEE\xE4\xF2\xE2\xE5\xF0\xE6\xE4\xE5\xED\xE8\xFF"),
	u8("\xCA\xEB\xE0\xE2\xE8\xF8\xE0 \xEE\xF2\xEC\xE5\xED\xFB"),
	u8("\xCC\xE5\xED\xFE \xE1\xFB\xF1\xF2\xF0\xFB\xF5 \xEA\xEE\xEC\xE0\xED\xE4"),
	u8("\xCF\xF0\xE5\xE4\xFB\xE4\xF3\xF9\xE8\xE9 ID"),
	u8("\xD1\xEB\xE5\xE4\xF3\xFE\xF9\xE8\xE9 ID")
}
ping_list = {}

var_0_2.cdef("    int MultiByteToWideChar(unsigned int CodePage, unsigned int dwFlags, const char* lpMultiByteStr, int cbMultiByte, wchar_t* lpWideCharStr, int cchWideChar);              \n    int WideCharToMultiByte(unsigned int CodePage, unsigned int dwFlags, wchar_t* lpWideCharStr, int cchWideChar, char* lpMultiByteStr, int cbMultiByte, char* lpDefaultChar, int* lpUsedDefaultChar);\n\tint __stdcall GetVolumeInformationA(\n    const char* lpRootPathName,\n    char* lpVolumeNameBuffer,\n    uint32_t nVolumeNameSize,\n    uint32_t* lpVolumeSerialNumber,\n    uint32_t* lpMaximumComponentLength,\n    uint32_t* lpFileSystemFlags,\n    char* lpFileSystemNameBuffer,\n    uint32_t nFileSystemNameSize\n);\n")

local var_0_7 = false
local var_0_8 = false
local var_0_9 = false
local var_0_10 = -1
local var_0_11 = false
local var_0_12 = false
local var_0_13 = false
local var_0_14 = 0
local var_0_15 = false
local var_0_16 = false
local var_0_17 = false
local var_0_18 = false
local var_0_19 = false

askick_status = false

local var_0_20 = false
local var_0_21 = false

first_sp = false
capture_warns_counter = false
account_not_found = false

local var_0_22 = false

pl_processing = false
pl_processing_auto_mode = false
askick_player_connected = false

local var_0_23 = 0
local var_0_24 = 0

fast_commands_dialog_status = false
command_from_admin_chat_status = false

local var_0_25 = false
local var_0_26 = 0

first_sp_tick = 0

local var_0_27 = 0
local var_0_28 = 0
local var_0_29 = 0

adm_chat_cmd_tick = 0

local var_0_30 = 0
local var_0_31 = 0
local var_0_32 = 1
local var_0_33 = 0
local var_0_34 = false
local var_0_35 = false

pl_open_menu = false
adm_command_check_server_answer = false
adm_comm_tick = 0
menu_check_update = false
stp_tick = 0
command_from_admin_chat_confirm_status = false
activity_tick = 0
activity_tick2 = 0
askick_tick = 0
askick_counter = 0
plCheckServerAnswer = false
sp_score = 0
msg_text = ""

local var_0_36 = 0
local var_0_37 = 0
local var_0_38 = 0
local var_0_39 = 0
local var_0_40 = 0
local var_0_41 = 0
local var_0_42 = 0
local var_0_43 = 0
local var_0_44 = 0
local var_0_45 = 0

authorization_dialog_status = false

local var_0_46

audio_handle2Process = false
askick_player_connected = false
askick_player_connected2 = false
askick_logged_counter = 0
askick_player_kicked = false
sp_player_id = 1005
setKeyButtonLock = false
sp_info = true
mp_processing = false
window_open = false
inSrvMsgHookCmd = nil
ilipCheckServerAnswer = false
killedOnCapture = {}
capture_vagos_warns = 0
capture_grove_warns = 0
capture_ballas_warns = 0
capture_rifa_warns = 0
capture_aztecas_warns = 0
noupdatefound = false

local var_0_47 = {
	k0x71 = "VK_F2",
	k0x2A = "VK_PRINT",
	k0x76 = "VK_F7",
	k0xAF = "VK_VOLUME_UP",
	k0x5D = "VK_APPS",
	k0x12 = "VK_MENU",
	k0x68 = "VK_NUMPAD8",
	k0x63 = "VK_NUMPAD3",
	k0x50 = "VK_P",
	k0x4D = "VK_M",
	k0x6F = "VK_DIVIDE",
	k0xB7 = "VK_LAUNCH_APP2",
	k0x37 = "VK_7",
	k0x4A = "VK_J",
	k0x4F = "VK_O",
	k0x4E = "VK_N",
	k0x10 = "VK_SHIFT",
	k0x6B = "VK_ADD",
	k0x28 = "VK_DOWN",
	k0x17 = "VK_JUNJA",
	k0x27 = "VK_RIGHT",
	k0x58 = "VK_X",
	k0x1 = "VK_LBUTTON",
	k0x6C = "VK_SEPARATOR",
	k0x59 = "VK_Y",
	k0x51 = "VK_Q",
	k0xC2 = "VK_ABNT_C2",
	k0x18 = "VK_FINAL",
	k0x6A = "VK_MULTIPLY",
	k0x82 = "VK_F19",
	k0x52 = "VK_R",
	k0x80 = "VK_F17",
	k0x33 = "VK_3",
	k0xB0 = "VK_MEDIA_NEXT_TRACK",
	k0x36 = "VK_6",
	k0x83 = "VK_F20",
	k0xA4 = "VK_LMENU",
	k0x7F = "VK_F16",
	k0xA5 = "VK_RMENU",
	k0x48 = "VK_H",
	k0xA8 = "VK_BROWSER_REFRESH",
	k0xAB = "VK_BROWSER_FAVORITES",
	k0xAD = "VK_VOLUME_MUTE",
	k0x6D = "VK_SUBTRACT",
	k0xA3 = "VK_RCONTROL",
	k0x49 = "VK_I",
	k0x93 = "VK_OEM_FJ_MASSHOU",
	k0xEF = "VK_OEM_CUSEL",
	k0x25 = "VK_LEFT",
	k0xF6 = "VK_ATTN",
	k0xB6 = "VK_LAUNCH_APP1",
	k0x41 = "VK_A",
	k0x31 = "VK_1",
	k0xAA = "VK_BROWSER_SEARCH",
	k0xBB = "VK_OEM_PLUS",
	k0xEB = "VK_OEM_PA1",
	k0x92 = "VK_OEM_FJ_JISHO",
	k0x84 = "VK_F21",
	k0x73 = "VK_F4",
	k0xC0 = "VK_OEM_3",
	k0x2B = "VK_EXECUTE",
	k0x57 = "VK_W",
	k0x30 = "VK_0",
	k0x85 = "VK_F22",
	k0xDE = "VK_OEM_7",
	k0xE2 = "VK_OEM_102",
	k0xE5 = "VK_PROCESSKEY",
	k0x6E = "VK_DECIMAL",
	k0x72 = "VK_F3",
	k0x53 = "VK_S",
	k0xE6 = "VK_ICO_CLEAR",
	k0x56 = "VK_V",
	k0xE7 = "VK_PACKET",
	k0xEA = "VK_OEM_JUMP",
	k0x95 = "VK_OEM_FJ_LOYA",
	k0xBC = "VK_OEM_COMMA",
	k0x35 = "VK_5",
	k0xBD = "VK_OEM_MINUS",
	k0xEC = "VK_OEM_PA2",
	k0x11 = "VK_CONTROL",
	k0x1E = "VK_ACCEPT",
	k0xED = "VK_OEM_PA3",
	k0xB1 = "VK_MEDIA_PREV_TRACK",
	k0xF2 = "VK_OEM_COPY",
	k0x94 = "VK_OEM_FJ_TOUROKU",
	k0xF3 = "VK_OEM_AUTO",
	k0x34 = "VK_4",
	k0xF4 = "VK_OEM_ENLW",
	k0xE9 = "VK_OEM_RESET",
	k0x43 = "VK_C",
	k0x1D = "VK_NONCONVERT",
	k0xB4 = "VK_LAUNCH_MAIL",
	k0xF7 = "VK_CRSEL",
	k0xBF = "VK_OEM_2",
	k0xF9 = "VK_EREOF",
	k0x22 = "VK_NEXT",
	k0xFD = "VK_PA1",
	k0xFE = "VK_OEM_CLEAR",
	k0x61 = "VK_NUMPAD1",
	k0x1C = "VK_CONVERT",
	k0x23 = "VK_END",
	k0x75 = "VK_F6",
	k0xF5 = "VK_OEM_BACKTAB",
	k0xF0 = "VK_OEM_ATTN",
	k0x79 = "VK_F10",
	k0x1B = "VK_ESCAPE",
	k0x74 = "VK_F5",
	k0x4 = "VK_MBUTTON",
	k0x8 = "VK_BACK",
	k0x26 = "VK_UP",
	k0x78 = "VK_F9",
	k0x70 = "VK_F1",
	k0xEE = "VK_OEM_WSCTRL",
	k0x2 = "VK_RBUTTON",
	k0x6 = "VK_XBUTTON2",
	k0xBA = "VK_OEM_1",
	k0x96 = "VK_OEM_FJ_ROYA",
	k0x5A = "VK_Z",
	k0x91 = "VK_SCROLL",
	k0x1F = "VK_MODECHANGE",
	k0xDD = "VK_OEM_6",
	k0x32 = "VK_2",
	k0x90 = "VK_NUMLOCK",
	k0xA9 = "VK_BROWSER_STOP",
	k0xFB = "VK_ZOOM",
	k0x55 = "VK_U",
	k0x20 = "VK_SPACE",
	k0x2D = "VK_INSERT",
	k0xA2 = "VK_LCONTROL",
	k0xBE = "VK_OEM_PERIOD",
	k0x21 = "VK_PRIOR",
	k0x2E = "VK_DELETE",
	k0x54 = "VK_T",
	k0xF8 = "VK_EXSEL",
	k0x44 = "VK_D",
	k0x66 = "VK_NUMPAD6",
	k0xA7 = "VK_BROWSER_FORWARD",
	k0x7C = "VK_F13",
	k0x45 = "VK_E",
	k0x67 = "VK_NUMPAD7",
	k0x62 = "VK_NUMPAD2",
	k0xE1 = "VK_OEM_AX",
	k0x24 = "VK_HOME",
	k0xA6 = "VK_BROWSER_BACK",
	k0x7B = "VK_F12",
	k0x5C = "VK_RWIN",
	k0x5F = "VK_SLEEP",
	k0x77 = "VK_F8",
	k0xDF = "VK_OEM_8",
	k0x5B = "VK_LWIN",
	k0xDB = "VK_OEM_4",
	k0x4B = "VK_K",
	k0x0D = "VK_RETURN",
	k0xB5 = "VK_LAUNCH_MEDIA_SELECT",
	k0xDC = "VK_OEM_5",
	k0x4C = "VK_L",
	k0xC1 = "VK_ABNT_C1",
	k0x29 = "VK_SELECT",
	k0xFA = "VK_PLAY",
	k0x46 = "VK_F",
	k0xAE = "VK_VOLUME_DOWN",
	k0x2C = "VK_SNAPSHOT",
	k0x7E = "VK_F15",
	k0x47 = "VK_G",
	k0x42 = "VK_B",
	k0x64 = "VK_NUMPAD4",
	k0xE3 = "VK_ICO_HELP",
	k0x7A = "VK_F11",
	k0x0C = "VK_CLEAR",
	k0x7D = "VK_F14",
	k0x65 = "VK_NUMPAD5",
	k0x60 = "VK_NUMPAD0",
	k0xA1 = "VK_RSHIFT",
	k0x2F = "VK_HELP",
	k0xAC = "VK_BROWSER_HOME",
	k0x69 = "VK_NUMPAD9",
	k0x39 = "VK_9",
	k0x86 = "VK_F23",
	k0x15 = "VK_KANA",
	k0xA0 = "VK_LSHIFT",
	k0x87 = "VK_F24",
	k0x38 = "VK_8",
	k0xB2 = "VK_MEDIA_STOP",
	k0x14 = "VK_CAPITAL",
	k0xF1 = "VK_OEM_FINISH",
	k0xB3 = "VK_MEDIA_PLAY_PAUSE",
	k0x81 = "VK_F18",
	k0x5 = "VK_XBUTTON1",
	k0x9 = "VK_TAB",
	k0x13 = "VK_PAUSE",
	k0x3 = "VK_CANCEL",
	k0x19 = "VK_KANJI"
}

function main()
	while not isSampAvailable() do
		wait(100)
	end

	if not isSampLoaded() then
		return
	end

	local var_1_0 = 15
	local var_1_1 = os.time()

	while not isSampfuncsLoaded() do
		wait(1000)

		if os.time() > var_1_1 + var_1_0 then
			message("{FF0000}\xCE\xF8\xE8\xE1\xEA\xE0! \xCF\xEB\xE0\xE3\xE8\xED \"SAMPFUNCS\" \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED.")
			print("{FF0000}\xCE\xF8\xE8\xE1\xEA\xE0! \xCF\xEB\xE0\xE3\xE8\xED \"SAMPFUNCS\" \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED.")
			thisScript():unload()
		end
	end

	local var_1_2, var_1_3 = sampGetCurrentServerAddress()

	if not string.match(var_1_2, string.char(53, 46, 49, 57, 54, 46, 49, 49, 50)) then
		message("\xC4\xE0\xED\xED\xFB\xE9 \xF1\xEA\xF0\xE8\xEF\xF2 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 Advance-RP.")
		thisScript():unload()
	end

	local var_1_4 = var_0_2.new("unsigned long[1]", 0)

	var_0_2.C.GetVolumeInformationA(nil, nil, 0, var_1_4, nil, nil, nil, 0)

	pass = checkLen(string.format("%X", var_1_4[0]) .. string.char(55, 86, 50, 53, 104, 67, 56, 53))
	pass2 = string.format("%X", var_1_4[0]) .. string.char(55, 86, 50, 53, 104, 67, 56, 53)
	pass_stats_ans = checkLen(string.format("%X", var_1_4[0]) .. string.char(97, 110, 115, 53, 104, 67, 56, 53))
	pass_stats_mute = checkLen(string.format("%X", var_1_4[0]) .. string.char(109, 117, 116, 101, 104, 67, 56, 53))
	pass_stats_kick = checkLen(string.format("%X", var_1_4[0]) .. string.char(107, 105, 99, 107, 104, 67, 56, 53))
	pass_stats_skick = checkLen(string.format("%X", var_1_4[0]) .. string.char(115, 107, 105, 99, 107, 67, 56, 53))
	pass_stats_jail = checkLen(string.format("%X", var_1_4[0]) .. string.char(106, 97, 105, 108, 104, 67, 56, 53))
	pass_stats_warn = checkLen(string.format("%X", var_1_4[0]) .. string.char(119, 97, 114, 110, 104, 67, 56, 53))
	pass_stats_ban = checkLen(string.format("%X", var_1_4[0]) .. string.char(98, 97, 110, 53, 104, 67, 56, 53))
	pass_stats_seconds = checkLen(string.format("%X", var_1_4[0]) .. string.char(115, 101, 99, 53, 104, 67, 56, 53))
	webpass = string.char(55, 86, 50, 53, 104, 67, 56, 53, 68, 54, 50, 110, 54, 57, 70, 98)

	local var_1_5 = sampGetBase()

	writeMemory(var_1_5 + 643864, 2, 37008, true)

	if not doesDirectoryExist("moonloader\\AdminTools") then
		createDirectory("moonloader\\AdminTools")
		message("\xCA\xEE\xED\xF4\xE8\xE3\xF3\xF0\xE0\xF6\xE8\xEE\xED\xED\xFB\xE5 \xF4\xE0\xE9\xEB\xFB \xF3\xF1\xEF\xE5\xF8\xED\xEE \xF1\xEE\xE7\xE4\xE0\xED\xFB.")
	end

	if not doesDirectoryExist("moonloader\\AdminTools\\logs") then
		createDirectory("moonloader\\AdminTools\\logs")
	end

	if not doesDirectoryExist("moonloader\\AdminTools\\data") then
		createDirectory("moonloader\\AdminTools\\data")
	end

	if not doesDirectoryExist("moonloader\\AdminTools\\data\\audio") then
		createDirectory("moonloader\\AdminTools\\data\\audio")
	end

	if not doesDirectoryExist("moonloader\\AdminTools\\checker") then
		createDirectory("moonloader\\AdminTools\\checker")
	end

	if not doesDirectoryExist("moonloader\\AdminTools\\reasons") then
		createDirectory("moonloader\\AdminTools\\reasons")
	end

	if not doesDirectoryExist("moonloader\\config") then
		createDirectory("moonloader\\config")
	end

	if not doesDirectoryExist("moonloader\\config\\AdminTools") then
		createDirectory("moonloader\\config\\AdminTools")
	end

	if not doesFileExist("moonloader\\AdminTools\\checker\\admins.txt") then
		local var_1_6 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "w")
		local var_1_7 = "James_Turner 7"

		var_1_6:write(var_1_7)
		io.close(var_1_6)
	end

	if not doesFileExist("moonloader\\AdminTools\\checker\\leaders.txt") then
		local var_1_8 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "w")
		local var_1_9 = ""

		var_1_8:write(var_1_9)
		io.close(var_1_8)
	end

	if not doesFileExist("moonloader\\AdminTools\\checker\\friends.txt") then
		local var_1_10 = io.open("moonloader\\AdminTools\\checker\\friends.txt", "w")
		local var_1_11 = ""

		var_1_10:write(var_1_11)
		io.close(var_1_10)
	end

	if not doesFileExist("moonloader\\AdminTools\\reasons\\bans.txt") then
		local var_1_12 = io.open("moonloader\\AdminTools\\reasons\\bans.txt", "w")
		local var_1_13 = "30 \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xEE\xE2\xE0\xED\xE8\xE5 \xF7\xE8\xF2-\xEF\xF0\xEE\xE3\xF0\xE0\xEC\xEC\n20 \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xEE\xE2\xE0\xED\xE8\xE5 \xF7\xE8\xF2-\xEF\xF0\xEE\xE3\xF0\xE0\xEC\xEC\n30 \xCE\xF1\xEA\xEE\xF0\xE1\xEB\xE5\xED\xE8\xE5 \xF0\xEE\xE4\xED\xFB\xF5\n30 \xD3\xEF\xEE\xEC\xE8\xED\xE0\xED\xE8\xE5 \xF0\xEE\xE4\xED\xFB\xF5\n15 \xCF\xF0\xEE\xE4\xE0\xE6\xE0 \xED\xEE\xEC\xE5\xF0\xE0 \xE2 \xEE\xF2\xE5\xEB\xE5\n15 \xCE\xE1\xF5\xEE\xE4 \xF1\xE8\xF1\xF2\xE5\xEC\xFB"

		var_1_12:write(var_1_13)
		io.close(var_1_12)
	end

	if not doesFileExist("moonloader\\AdminTools\\reasons\\jails.txt") then
		local var_1_14 = io.open("moonloader\\AdminTools\\reasons\\jails.txt", "w")
		local var_1_15 = "30 DeathMatch\n60 DeathMatch \xE2 \xE7\xE5\xEB\xB8\xED\xEE\xE9 \xE7\xEE\xED\xE5\n100 RP/NonRP \xF1\xEE\xED \xE2\xEE \xF4\xF0\xE0\xEA\xF6\xE8\xE8\n20 \xCF\xEE\xEC\xE5\xF5\xE0\n80 /drugs \xE2 \xE7\xE5\xEB\xB8\xED\xEE\xE9 \xE7\xEE\xED\xE5\n90 NonRP \xF1\xEE\xED"

		var_1_14:write(var_1_15)
		io.close(var_1_14)
	end

	if not doesFileExist("moonloader\\AdminTools\\reasons\\kicks.txt") then
		local var_1_16 = io.open("moonloader\\AdminTools\\reasons\\kicks.txt", "w")
		local var_1_17 = "DeathMatch\nPowerGaming\n\xCF\xEE\xEC\xE5\xF5\xE0\nNonRP \xE8\xE3\xF0\xEE\xEA"

		var_1_16:write(var_1_17)
		io.close(var_1_16)
	end

	if not doesFileExist("moonloader\\AdminTools\\reasons\\mutes.txt") then
		local var_1_18 = io.open("moonloader\\AdminTools\\reasons\\mutes.txt", "w")
		local var_1_19 = "30 \xCD\xE5\xF6\xE5\xED\xE7\xF3\xF0\xED\xE0\xFF \xEB\xE5\xEA\xF1\xE8\xEA\xE0\n60 \xCE\xF1\xEA\xEE\xF0\xE1\xEB\xE5\xED\xE8\xE5\n20 \xD4\xEB\xF3\xE4\n15 \xCA\xE0\xEF\xF1\n15 \xD2\xF0\xE0\xED\xF1\xEB\xE8\xF2\n30 \xCD\xE0\xF0\xF3\xF8\xE5\xED\xE8\xE5 \xE8\xED\xF2\xE5\xF0\xE2\xE0\xEB\xE0\n300 \xD3\xEF\xEE\xEC\xE8\xED\xE0\xED\xE8\xE5 \xF0\xEE\xE4\xED\xFB\xF5"

		var_1_18:write(var_1_19)
		io.close(var_1_18)
	end

	if not doesFileExist("moonloader\\AdminTools\\reasons\\warns.txt") then
		local var_1_20 = io.open("moonloader\\AdminTools\\reasons\\warns.txt", "w")
		local var_1_21 = "DeathMatch\nTeamKill\n\xD1\xE1\xE8\xE2 \xE0\xED\xE8\xEC\xE0\xF6\xE8\xE8\n/drugs \xE2 \xE7\xE5\xEB\xB8\xED\xEE\xE9 \xE7\xEE\xED\xE5"

		var_1_20:write(var_1_21)
		io.close(var_1_20)
	end

	if not doesFileExist("moonloader\\AdminTools\\punishment_list.txt") then
		local var_1_22 = io.open("moonloader\\AdminTools\\punishment_list.txt", "w")

		io.close(var_1_22)
	end

	if not doesFileExist("moonloader\\AdminTools\\logs\\online_leaders_log.html") then
		local var_1_23 = io.open("moonloader\\AdminTools\\logs\\online_leaders_log.html", "w")
		local var_1_24 = "<!DOCTYPE HTML>\n<html>\n <head>\n  <meta charset=\"windows-1251\">\n  <title>\xCE\xED\xEB\xE0\xE9\xED \xEB\xE8\xE4\xE5\xF0\xEE\xE2 - AdminTools 2</title>\n </head>\n<body>\n<style type=\"text/css\"> \n .tftable {font-size:12px;color:#333333;border-width: 1px;border-collapse: collapse;}\n  .tftable th {font-size:15px;background-color:#E0E0E0;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable tr:hover {background-color:#F5F5F5;}\n  .tftable ballas {font-size:13px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n </style>\n<table border=\"1\" cellpadding=\"5\" align=\"center\" class=\"tftable\">\n   <tr bgcolor=\"E0E0E0\"> \n    <th>\xC4\xE0\xF2\xE0, \xE2\xF0\xE5\xEC\xFF</th>\n    <th>\xCD\xE8\xEA \xEB\xE8\xE4\xE5\xF0\xE0</th>\n    <th>\xC2 \xE8\xE3\xF0\xE5 \xF1\xE5\xE3\xEE\xE4\xED\xFF</th>\n\t<th>\xC2 \xE8\xE3\xF0\xE5 \xE2\xF7\xE5\xF0\xE0</th>\n\t<th>AFK \xF1\xE5\xE3\xEE\xE4\xED\xFF</th>   \n\t<th>AFK \xE2\xF7\xE5\xF0\xE0</th>\n\t<th>\xD4\xE0\xEA\xF2. \xE7\xE0 \xF1\xE5\xE3\xEE\xE4\xED\xFF</th>\n\t<th>\xD4\xE0\xEA\xF2. \xE7\xE0 \xE2\xF7\xE5\xF0\xE0</th>\n   </tr>"

		var_1_23:write(var_1_24)
		io.close(var_1_23)
	end

	if not doesFileExist("moonloader\\AdminTools\\logs\\adm_chat_cmds_log.html") then
		local var_1_25 = io.open("moonloader\\AdminTools\\logs\\adm_chat_cmds_log.html", "w")
		local var_1_26 = "<!DOCTYPE HTML>\n<html>\n <head>\n  <meta charset=\"windows-1251\">\n  <title>\xCD\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xEE\xF2 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 - AdminTools 2</title>\n </head>\n <body>\n <style type=\"text/css\"> \n  .tftable {font-size:12px;color:#333333;border-width: 1px;border-collapse: collapse;}\n  .tftable th {font-size:15px;background-color:#E0E0E0;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable tr:hover {background-color:#F5F5F5;}\n  .tftable ballas {font-size:13px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n </style>\n  <table border=\"1\" cellpadding=\"5\" align=\"center\" class=\"tftable\">\n   <tr bgcolor=\"E0E0E0\"> \n    <th>\xC4\xE0\xF2\xE0, \xE2\xF0\xE5\xEC\xFF</th>\n    <th>\xCD\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0</th>\n    <th>\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0</th>\n    <th>\xD1\xEE\xE1\xFB\xF2\xE8\xE5</th>\n\t<th>\xCA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE</th>\n\t<th>\xCF\xF0\xE8\xF7\xE8\xED\xE0</th>\n   </tr>\n   "

		var_1_25:write(var_1_26)
		io.close(var_1_25)
	end

	if not doesFileExist("moonloader\\AdminTools\\logs\\find_log.html") then
		local var_1_27 = io.open("moonloader\\AdminTools\\logs\\find_log.html", "w")
		local var_1_28 = "<!DOCTYPE HTML>\n<html>\n <head>\n  <meta charset=\"windows-1251\">\n  <title>\xCE\xED\xEB\xE0\xE9\xED \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 - AdminTools 2</title>\n </head>\n <body>\n <style type=\"text/css\"> \n  .tftable {font-size:12px;color:#333333;border-width: 1px;border-collapse: collapse;}\n  .tftable th {font-size:15px;background-color:#E0E0E0;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable tr:hover {background-color:#F5F5F5;}\n  .tftable ballas {font-size:13px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n </style>\n  <table border=\"1\" cellpadding=\"5\" align=\"center\" class=\"tftable\">\n   <tr bgcolor=\"E0E0E0\"> \n    <th>\xC4\xE0\xF2\xE0, \xE2\xF0\xE5\xEC\xFF</th>\n    <th>\xCE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xFF</th>\n    <th>\xCE\xED\xEB\xE0\xE9\xED</th>\n\t<th>\xCD\xE0 \xEF\xE0\xF3\xE7\xE5</th>\n   </tr>"

		var_1_27:write(var_1_28)
		io.close(var_1_27)
	end

	if not doesFileExist("moonloader\\AdminTools\\logs\\pl_log.html") then
		local var_1_29 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "w")
		local var_1_30 = "<!DOCTYPE HTML>\n<html>\n <head>\n  <meta charset=\"windows-1251\">\n  <title>\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9 - AdminTools 2</title>\n </head>\n <body>\n <style type=\"text/css\"> \n  .tftable {font-size:12px;color:#333333;border-width: 1px;border-collapse: collapse;}\n  .tftable th {font-size:15px;background-color:#E0E0E0;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n  .tftable tr:hover {background-color:#F5F5F5;}\n  .tftable ballas {font-size:13px;border-width: 1px;padding: 8px;border-style: solid;text-align:center;}\n </style>\n  <table border=\"1\" cellpadding=\"5\" align=\"center\" class=\"tftable\">\n   <tr bgcolor=\"E0E0E0\"> \n    <th>\xC4\xE0\xF2\xE0, \xE2\xF0\xE5\xEC\xFF</th>\n    <th>\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0</th>\n    <th>\xD1\xEE\xE1\xFB\xF2\xE8\xE5</th>\n\t<th>\xCA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE</th>\n\t<th>\xCF\xF0\xE8\xF7\xE8\xED\xE0</th>\n   </tr>"

		var_1_29:write(var_1_30)
		io.close(var_1_29)
	end

	if not doesFileExist("moonloader\\AdminTools\\events.json") then
		local var_1_31 = io.open("moonloader\\AdminTools\\events.json", "w")
		local var_1_32 = "{\"events\":[{\"start\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xD1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xE9\xE4\xE5\xF2 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname}.\",\"str2\":\"\xC6\xE5\xEB\xE0\xFE\xF9\xE8\xE5 \xEF\xEE\xEF\xE0\xF1\xF2\xFC \xED\xE0 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 - \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 \\/tp.\",\"str3\":\"\xCF\xF0\xE8\xE7: {prize}. \xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}.\"},\"name\":\"\xC4\xE5\xF0\xE1\xE8\",\"finish\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname} \xEE\xEA\xEE\xED\xF7\xE5\xED\xEE.\",\"str2\":\"\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}. \xCF\xF0\xE8\xE7: {prize}.\",\"str3\":\"\xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}. \xD1\xEF\xE0\xF1\xE8\xE1\xEE \xE7\xE0 \xF3\xF7\xE0\xF1\xF2\xE8\xE5!\"}},{\"start\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xD1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xE9\xE4\xE5\xF2 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname}.\",\"str2\":\"\xC6\xE5\xEB\xE0\xFE\xF9\xE8\xE5 \xEF\xEE\xEF\xE0\xF1\xF2\xFC \xED\xE0 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 - \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 \\/tp.\",\"str3\":\"\xCF\xF0\xE8\xE7: {prize}. \xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}.\"},\"name\":\"\xCF\xEE\xEB\xE8\xE2\xE0\xEB\xEA\xE0\",\"finish\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname} \xEE\xEA\xEE\xED\xF7\xE5\xED\xEE.\",\"str2\":\"\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}. \xCF\xF0\xE8\xE7: {prize}.\",\"str3\":\"\xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}. \xD1\xEF\xE0\xF1\xE8\xE1\xEE \xE7\xE0 \xF3\xF7\xE0\xF1\xF2\xE8\xE5!\"}},{\"start\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xFB \xED\xE0\xF7\xE8\xED\xE0\xE5\xEC \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname}.\",\"str2\":\"\xC2 \xF0\xE0\xE9\xEE\xED\xE5 {param1} \xEA\xE0\xF2\xE0\xFE\xF2\xF1\xFF (\xEA\xE0\xF2\xE0\xE5\xF2\xF1\xFF) {sponsor} \xED\xE0 {param2}.\",\"str3\":\"\xC8\xF5 (\xE5\xE3\xEE) \xED\xF3\xE6\xED\xEE \xED\xE0\xE9\xF2\xE8, \xE4\xEE\xE3\xED\xE0\xF2\xFC \xE8 \xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC 1$. \xCF\xF0\xE8\xE7: {prize}. \xD3\xE4\xE0\xF7\xE8! :)\"},\"name\":\"\xC4\xEE\xE3\xEE\xED\xE8 \xE8 \xEF\xE5\xF0\xE5\xE4\xE0\xE9\",\"finish\":{\"str1\":\"\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname} \xEE\xEA\xEE\xED\xF7\xE5\xED\xEE.\",\"str2\":\"\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}. \xCF\xF0\xE8\xE7: {prize}.\",\"str3\":\"\xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}. \xD1\xEF\xE0\xF1\xE8\xE1\xEE \xE7\xE0 \xF3\xF7\xE0\xF1\xF2\xE8\xE5!\"}}]}"

		var_1_31:write(var_1_32)
		io.close(var_1_31)
	end

	if not doesFileExist("moonloader\\AdminTools\\logs\\killList_log.txt") then
		local var_1_33 = io.open("moonloader\\AdminTools\\logs\\killList_log.txt", "w")

		io.close(var_1_33)
	end

	local var_1_34 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "r")

	leaders_nick = {}
	leaders_org = {}
	leaders_id = {}

	repeat
		local var_1_35 = var_1_34:read()

		if var_1_35 ~= nil then
			local var_1_36 = string.match(var_1_35, "(%S+)")

			if var_1_36 ~= nil then
				local var_1_37 = string.match(var_1_35, "%S+%s+(%d+)")

				if var_1_37 ~= nil then
					table.insert(leaders_org, var_1_37)
				else
					table.insert(leaders_org, -1)
				end

				table.insert(leaders_nick, var_1_36)
				table.insert(leaders_id, -1)
			end
		end
	until var_1_35 == nil

	io.close(var_1_34)

	local var_1_38 = io.open("moonloader\\AdminTools\\checker\\friends.txt", "r")

	friends_nick = {}
	friends_id = {}

	repeat
		local var_1_39 = var_1_38:read()

		if var_1_39 ~= nil then
			table.insert(friends_nick, var_1_39)
			table.insert(friends_id, -1)
		end
	until var_1_39 == nil

	io.close(var_1_38)

	local var_1_40 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "r")

	admins_nick = {}
	admins_lvl = {}
	admins_id = {}

	repeat
		local var_1_41 = var_1_40:read()

		if var_1_41 ~= nil then
			local var_1_42 = string.match(var_1_41, "(%S+)")

			if var_1_42 ~= nil then
				local var_1_43 = string.match(var_1_41, "%S+%s+(%d+)")

				if var_1_43 ~= nil then
					table.insert(admins_lvl, var_1_43)
				else
					table.insert(admins_lvl, -1)
				end

				table.insert(admins_nick, var_1_42)
				table.insert(admins_id, -1)
			end
		end
	until var_1_41 == nil

	io.close(var_1_40)

	local var_1_44 = io.open("moonloader\\AdminTools\\reasons\\mutes.txt", "r")

	mute_reasons_mass = {}
	mute_reasons_mass_2 = {}

	repeat
		local var_1_45 = var_1_44:read()

		if var_1_45 ~= nil then
			local var_1_46, var_1_47 = string.match(var_1_45, "(%d+)%s+(.+)")

			if var_1_46 ~= nil and var_1_47 ~= nil then
				table.insert(mute_reasons_mass, var_1_45)
				table.insert(mute_reasons_mass_2, u8(string.format("%s (%d \xEC\xE8\xED.)", var_1_47, var_1_46)))
			end
		end
	until var_1_45 == nil

	io.close(var_1_44)

	local var_1_48 = io.open("moonloader\\AdminTools\\reasons\\kicks.txt", "r")

	kick_reasons_mass = {}
	kick_reasons_mass_2 = {}

	repeat
		local var_1_49 = var_1_48:read()

		if var_1_49 ~= nil then
			table.insert(kick_reasons_mass, var_1_49)
			table.insert(kick_reasons_mass_2, u8(var_1_49))
		end
	until var_1_49 == nil

	io.close(var_1_48)

	local var_1_50 = io.open("moonloader\\AdminTools\\reasons\\jails.txt", "r")

	jail_reasons_mass = {}
	jail_reasons_mass_2 = {}

	repeat
		local var_1_51 = var_1_50:read()

		if var_1_51 ~= nil then
			local var_1_52, var_1_53 = string.match(var_1_51, "(%d+)%s+(.+)")

			if var_1_52 ~= nil and var_1_53 ~= nil then
				table.insert(jail_reasons_mass, var_1_51)
				table.insert(jail_reasons_mass_2, u8(string.format("%s (%d \xEC\xE8\xED.)", var_1_53, var_1_52)))
			end
		end
	until var_1_51 == nil

	io.close(var_1_50)

	local var_1_54 = io.open("moonloader\\AdminTools\\reasons\\warns.txt", "r")

	warn_reasons_mass = {}
	warn_reasons_mass_2 = {}

	repeat
		local var_1_55 = var_1_54:read()

		if var_1_55 ~= nil then
			table.insert(warn_reasons_mass, var_1_55)
			table.insert(warn_reasons_mass_2, u8(var_1_55))
		end
	until var_1_55 == nil

	io.close(var_1_54)

	local var_1_56 = io.open("moonloader\\AdminTools\\reasons\\bans.txt", "r")

	ban_reasons_mass = {}
	ban_reasons_mass_2 = {}

	repeat
		local var_1_57 = var_1_56:read()

		if var_1_57 ~= nil then
			local var_1_58, var_1_59 = string.match(var_1_57, "(%d+)%s+(.+)")

			if var_1_58 ~= nil and var_1_59 ~= nil then
				table.insert(ban_reasons_mass_2, u8(string.format("%s (%d \xE4\xED\xE5\xE9)", var_1_59, var_1_58)))
				table.insert(ban_reasons_mass, var_1_57)
			end
		end
	until var_1_57 == nil

	io.close(var_1_56)

	if not doesDirectoryExist("moonloader\\lib\\aeslua") and not createDirectory("moonloader\\lib\\aeslua") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'aeslua'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\mime") and not createDirectory("moonloader\\lib\\mime") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'mime'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\socket") and not createDirectory("moonloader\\lib\\socket") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'socket'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\ssl") and not createDirectory("moonloader\\lib\\ssl") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'ssl'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\cjson") and not createDirectory("moonloader\\lib\\cjson") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'cjson'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lub") and not createDirectory("moonloader\\lib\\lub") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lub'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\md5") and not createDirectory("moonloader\\lib\\md5") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'md5'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\xml") and not createDirectory("moonloader\\lib\\xml") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'xml'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lanes") and not createDirectory("moonloader\\lib\\lanes") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lanes'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox") and not createDirectory("moonloader\\lib\\lockbox") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\cipher") and not createDirectory("moonloader\\lib\\lockbox\\cipher") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/cipher'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\cipher\\mode") and not createDirectory("moonloader\\lib\\lockbox\\cipher\\mode") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/cipher/mode'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\digest") and not createDirectory("moonloader\\lib\\lockbox\\digest") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/digest'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\kdf") and not createDirectory("moonloader\\lib\\lockbox\\kdf") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/kdf'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\mac") and not createDirectory("moonloader\\lib\\lockbox\\mac") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/mac'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\padding") and not createDirectory("moonloader\\lib\\lockbox\\padding") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/padding'.")
	end

	if not doesDirectoryExist("moonloader\\lib\\lockbox\\util") and not createDirectory("moonloader\\lib\\lockbox\\util") then
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xF1\xEE\xE7\xE4\xE0\xED\xE8\xE8 \xEF\xE0\xEF\xEA\xE8 'lockbox/util'.")
	end

	local var_1_60 = {
		"lib\\aeslua.lua",
		"lib\\aeslua\\aes.lua",
		"lib\\aeslua\\buffer.lua",
		"lib\\aeslua\\ciphermode.lua",
		"lib\\aeslua\\gf.lua",
		"lib\\aeslua\\util.lua",
		"lib\\imgui.lua",
		"lib\\MoonImGui.dll",
		"lib\\samp\\events.lua",
		"lib\\samp\\events\\bitstream_io.lua",
		"lib\\samp\\events\\core.lua",
		"lib\\samp\\events\\extra_types.lua",
		"lib\\samp\\events\\handlers.lua",
		"lib\\samp\\events\\utils.lua",
		"lib\\samp\\raknet.lua",
		"lib\\samp\\synchronization.lua",
		"lib\\mime.lua",
		"lib\\ltn12.lua",
		"lib\\socket.lua",
		"lib\\ssl.lua",
		"lib\\ssl.dll",
		"lib\\mime\\core.dll",
		"lib\\ssl\\https.lua",
		"lib\\socket\\core.dll",
		"lib\\socket\\headers.lua",
		"lib\\socket\\smtp.lua",
		"lib\\socket\\url.lua",
		"lib\\socket\\ftp.lua",
		"lib\\socket\\http.lua",
		"lib\\socket\\tp.lua",
		"lib\\cjson\\util.lua",
		"lib\\lub\\Autoload.lua",
		"lib\\lub\\Dir.lua",
		"lib\\lub\\init.lua",
		"lib\\lub\\Param.lua",
		"lib\\lub\\Template.lua",
		"lib\\md5\\core.dll",
		"lib\\xml\\core.dll",
		"lib\\xml\\init.lua",
		"lib\\xml\\Parser.lua",
		"lib\\base64.dll",
		"lib\\cjson.dll",
		"lib\\des56.dll",
		"lib\\json2lua.lua",
		"lib\\lfs.dll",
		"lib\\ltn12.lua",
		"lib\\lua2json.lua",
		"lib\\md5.lua",
		"lib\\requests.lua",
		"lib\\lanes\\core.dll",
		"lib\\lanes.lua",
		"lib\\lockbox.lua",
		"lib\\lockbox\\cipher\\aes128.lua",
		"lib\\lockbox\\cipher\\mode\\ecb.lua",
		"lib\\lockbox\\digest\\md5.lua",
		"lib\\lockbox\\digest\\sha2_256.lua",
		"lib\\lockbox\\init.lua",
		"lib\\lockbox\\mac\\hmac.lua",
		"lib\\lockbox\\padding\\zero.lua",
		"lib\\lockbox\\util\\array.lua",
		"lib\\lockbox\\util\\base64.lua",
		"lib\\lockbox\\util\\bit.lua",
		"lib\\lockbox\\util\\queue.lua",
		"lib\\lockbox\\util\\stream.lua"
	}

	if doesFileExist("moonloader\\lib\\requests.lua") and doesFileExist("moonloader\\lib\\lanes.lua") then
		lanes = require("lanes").configure()

		local var_1_61 = false

		for iter_1_0, iter_1_1 in ipairs(var_1_60) do
			if not doesFileExist("moonloader\\" .. iter_1_1) then
				if not var_1_61 then
					var_1_61 = true

					message("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE4\xEE\xEF\xEE\xEB\xED\xE8\xF2\xE5\xEB\xFC\xED\xFB\xF5 \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA...")
				end

				download_state = -1

				local var_1_62 = {}
				local var_1_63 = string.gsub(iter_1_1, "\\", "/")

				var_1_62.data = iter_1_1

				download("GET", string.format("https://raw.githubusercontent.com/Garrus93/admintools/master/%s", var_1_63), var_1_62)

				while download_state == -1 do
					wait(0)
				end

				print("\xD3\xF1\xF2\xE0\xED\xEE\xE2\xEB\xE5\xED \xF4\xE0\xE9\xEB \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA\xE8: " .. iter_1_1)
			end
		end
	else
		local var_1_64 = false

		for iter_1_2, iter_1_3 in ipairs(var_1_60) do
			if not doesFileExist("moonloader\\" .. iter_1_3) then
				if not var_1_64 then
					var_1_64 = true

					message("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE4\xEE\xEF\xEE\xEB\xED\xE8\xF2\xE5\xEB\xFC\xED\xFB\xF5 \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA...")
				end

				download_state = -1
				responseTxtDL = downloadUrlToFile(string.format("https://raw.githubusercontent.com/Garrus93/admintools/master/%s", iter_1_3), "moonloader\\" .. iter_1_3, downloadProcess)

				while download_state == -1 do
					wait(0)
				end

				print("\xD3\xF1\xF2\xE0\xED\xEE\xE2\xEB\xE5\xED \xF4\xE0\xE9\xEB \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA\xE8: " .. iter_1_3)
			end
		end

		lanes = require("lanes").configure()
	end

	Lockbox = require("lockbox")
	Lockbox.ALLOW_INSECURE = true
	String = require("string")
	Array = require("lockbox.util.array")
	Stream = require("lockbox.util.stream")
	ECBMode = require("lockbox.cipher.mode.ecb")
	ZeroPadding = require("lockbox.padding.zero")
	AES128Cipher = require("lockbox.cipher.aes128")
	Queue = require("lockbox.util.queue")
	HMAC = require("lockbox.mac.hmac")

	if doesFileExist("moonloader\\lib\\aeslua.lua") and doesFileExist("moonloader\\lib\\aeslua\\aes.lua") and doesFileExist("moonloader\\lib\\aeslua\\buffer.lua") and doesFileExist("moonloader\\lib\\aeslua\\ciphermode.lua") and doesFileExist("moonloader\\lib\\aeslua\\gf.lua") and doesFileExist("moonloader\\lib\\aeslua\\util.lua") then
		require("aeslua")
	else
		message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xE7\xE0\xE3\xF0\xF3\xE7\xE8\xF2\xFC \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA\xF3 \"aeslua.lua\". \xCF\xEE\xEC\xE5\xF1\xF2\xE8\xF2\xE5 \xE5\xE5 \xE2 \xEF\xE0\xEF\xEA\xF3 lib \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
		thisScript():unload()
	end

	if doesFileExist("moonloader\\lib\\samp\\events\\utils.lua") and doesFileExist("moonloader\\lib\\samp\\synchronization.lua") and doesFileExist("moonloader\\lib\\samp\\events.lua") and doesFileExist("moonloader\\lib\\samp\\raknet.lua") then
		sampev = require("lib.samp.events")
		raknet = require("lib.samp.raknet")
		sampev.onSetPlayerHealth = sampOnSetPlayerHealth
		sampev.onTextDrawSetString = sampOnTextDrawSetString
		sampev.onPlayerDeathNotification = sampOnDeathMessage
		sampev.onPlayerJoin = sampOnPlayerJoin
		sampev.onPlayerQuit = sampOnPlayerQuit
		sampev.onChatMessage = sampOnChatMessage
		sampev.onServerMessage = sampOnServerMessage
		sampev.onSendCommand = sampOnSendCommand
		sampev.onShowDialog = sampOnShowDialog
		sampev.onInitMenu = sampevonInitMenu
		sampev.onShowMenu = sampevonShowMenu
		sampev.onHideMenu = sampevonHideMenu
		sampev.onSendQuitMenu = sampevonSendQuitMenu
	else
		message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xE7\xE0\xE3\xF0\xF3\xE7\xE8\xF2\xFC \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA\xF3 \"SAMP.Lua\". \xCF\xEE\xEC\xE5\xF1\xF2\xE8\xF2\xE5 \xE5\xE5 \xE2 \xEF\xE0\xEF\xEA\xF3 lib \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
		thisScript():unload()
	end

	if doesFileExist("moonloader\\lib\\MoonImGui.dll") and doesFileExist("moonloader\\lib\\imgui.lua") then
		imgui = require("imgui")
		imgui.OnDrawFrame = imguiOnDrawFrame
		imgui.BeforeDrawFrame = imguiBeforeDrawFrame

		apply_custom_style()
	else
		message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xE7\xE0\xE3\xF0\xF3\xE7\xE8\xF2\xFC \xE1\xE8\xE1\xEB\xE8\xEE\xF2\xE5\xEA\xF3 \"ImGui\". \xCF\xEE\xEC\xE5\xF1\xF2\xE8\xF2\xE5 \xE5\xE5 \xE2 \xEF\xE0\xEF\xEA\xF3 lib \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
		thisScript():unload()
	end

	show_main_window = imgui.ImBool(false)
	show_imgui_example = imgui.ImBool(false)
	slider_float = imgui.ImFloat(0)
	clear_color = imgui.ImVec4(0.45, 0.55, 0.6, 1)
	show_test_window = imgui.ImBool(false)
	show_another_window = imgui.ImBool(false)
	teleportation_window = imgui.ImBool(false)
	mute_window = imgui.ImBool(false)
	jail_window = imgui.ImBool(false)
	kick_window = imgui.ImBool(false)
	warn_window = imgui.ImBool(false)
	ban_window = imgui.ImBool(false)
	rban_window = imgui.ImBool(false)
	about_window = imgui.ImBool(false)
	reg_window = imgui.ImBool(false)
	leaders_online_window = imgui.ImBool(false)
	templeader_window = imgui.ImBool(false)
	settings_window = imgui.ImBool(false)
	weather_window = imgui.ImBool(false)
	help_window = imgui.ImBool(false)
	settings_window = imgui.ImBool(false)
	statistic_window = imgui.ImBool(false)
	subscription = imgui.ImBool(false)
	event_window = imgui.ImBool(false)
	punishment_window = imgui.ImBool(false)
	forum_window = imgui.ImBool(false)
	register_window = imgui.ImBool(false)
	update_window = imgui.ImBool(false)
	show_moon_imgui_tutorial = {
		imgui.ImBool(false),
		imgui.ImBool(false),
		imgui.ImBool(false)
	}
	password_text_buffer = imgui.ImBuffer("", 128)
	skin_text_buffer = imgui.ImBuffer("", 256)
	sponsor_text_buffer = imgui.ImBuffer("", 256)
	priz_text_buffer = imgui.ImBuffer("", 256)
	pobeditel_text_buffer = imgui.ImBuffer("", 256)
	param1 = imgui.ImBuffer("", 256)
	param2 = imgui.ImBuffer("", 256)
	passBuffer = imgui.ImBuffer("", 256)
	emailBuffer = imgui.ImBuffer("", 256)
	EditBoxBuffer = imgui.ImBuffer(512)
	newEventBuffer = imgui.ImBuffer(128)
	fast_command_reason_buffer = imgui.ImBuffer("", 256)
	imgui.RenderInMenu = false
	help_selected = 1
	nomer_mp = imgui.ImInt(0)
	finish_event = imgui.ImBool(false)
	fast_commands_dialog = imgui.ImBool(false)
	selected_item = imgui.ImInt(-1)
	btn_size = imgui.ImVec2(100, 22)
	togphonehookcmd = false

	getevents()

	ping_history_cleanup_tick = 0
	menuTime = 0

	if not doesFileExist("moonloader\\AdminTools\\data\\audio\\notification.mp3") then
		download_state = -1
		responseTxtDL = downloadUrlToFile("https://github.com/Garrus93/admintools/raw/master/data/audio/notification.mp3", "moonloader\\AdminTools\\data\\audio\\notification.mp3", downloadProcess)

		while download_state == -1 do
			wait(0)
		end
	end

	local var_1_65, var_1_66 = getScreenResolution()
	local var_1_67
	local var_1_68
	local var_1_69
	local var_1_70 = var_1_65 < 1600 and 8 or 10
	local var_1_71 = {
		player_info_panel = {
			xpos = 5,
			prev_id_key = "VK_LEFT",
			next_id_key = "VK_RIGHT",
			show_ping_chart = true,
			id_indication = false,
			ping_chart_xpos = 640,
			font = "Arial",
			ping_chart_ypos = 435,
			ypos = 183,
			panel_status = true,
			font_size = var_1_70
		},
		checker = {
			admin_checker_auto_update = true,
			leaders_checker_status = true,
			admins_checker_status = true,
			friends_checker_status = true,
			capture_warns_counter_status = true
		},
		cheats = {
			wh_on_start = true,
			ab_on_key2 = 0,
			gm_on_key1 = "VK_INSERT",
			gun_anticheat_upd_notice = true,
			ts_info = false,
			teleport_anticheat_upd_notice = true,
			gm_on_start = true,
			wh_on_key1 = "VK_MENU",
			gm_on_key2 = 0,
			pos_indication = false,
			marker_enable_key = "VK_MBUTTON",
			ab_on_key1 = "VK_OEM_COMMA",
			tp_on_marker_key = "VK_LBUTTON",
			wh_on_key2 = "VK_F3",
			player_id_in_mask_and_mvd = true,
			panel_status = true
		},
		skin_changer = {
			skin = 230,
			status = false
		},
		auto_invite = {
			organisation = "0 0",
			status = true
		},
		sound = {
			status = true
		},
		reconnect = {
			reconnect_on_key2 = "VK_0",
			reconnect_on_key1 = "VK_SHIFT"
		},
		update = {
			auto_check_update = true
		},
		punishment_list = {
			auto_mode = true
		},
		menus = {
			fast_command_menu_key = "VK_RBUTTON",
			main_menu_key = "VK_M"
		},
		spawn_vehicle = {
			color1 = 0,
			color2 = 0
		},
		admin_chat_commands = {
			notice_mode = 1,
			admin_chat_notifications = true,
			cancel_key = "VK_END",
			status = true,
			confirm_key = "VK_DELETE"
		},
		auto_login = {
			password = "0",
			status = false
		},
		temp_pos = {
			Xpos = 0,
			Ypos = 0,
			Zpos = 0
		},
		chat = {
			togphone = false,
			chatid = false,
			adm_nick_in_msg = true,
			auto_perenos = true
		}
	}
	local var_1_72 = var_0_0.load(var_1_71, "moonloader\\config\\AdminTools\\config.ini")

	cheats_panel_status = var_1_72.cheats.panel_status
	player_id_in_mask_and_mvd = var_1_72.cheats.player_id_in_mask_and_mvd
	ab_on_key1 = var_1_72.cheats.ab_on_key1
	ab_on_key2 = var_1_72.cheats.ab_on_key2
	wh_on_key1 = var_1_72.cheats.wh_on_key1
	wh_on_key2 = var_1_72.cheats.wh_on_key2
	gm_on_key1 = var_1_72.cheats.gm_on_key1
	gm_on_key2 = var_1_72.cheats.gm_on_key2
	adm_textdraw_upd_notice = var_1_72.cheats.adm_textdraw_upd_notice
	teleport_anticheat_upd_notice = var_1_72.cheats.teleport_anticheat_upd_notice
	gun_anticheat_upd_notice = var_1_72.cheats.gun_anticheat_upd_notice
	gm_on_start = var_1_72.cheats.gm_on_start
	ts_info = var_1_72.cheats.ts_info
	marker_enable_key = var_1_72.cheats.marker_enable_key
	tp_on_marker_key = var_1_72.cheats.tp_on_marker_key

	if not string.find(tp_on_marker_key, "VK_") then
		local var_1_73 = var_0_0.load(var_1_72, "moonloader\\config\\AdminTools\\config.ini")

		var_1_73.cheats.ab_on_key1 = "VK_OEM_COMMA"
		var_1_73.cheats.ab_on_key2 = 0
		var_1_73.cheats.tp_on_marker_key = "VK_LBUTTON"
		var_1_73.cheats.marker_enable_key = "VK_MBUTTON"
		var_1_73.cheats.wh_on_key1 = "VK_MENU"
		var_1_73.cheats.wh_on_key2 = "VK_F3"
		var_1_73.cheats.gm_on_key1 = "VK_INSERT"
		var_1_73.cheats.gm_on_key2 = 0
		var_1_73.reconnect.reconnect_on_key1 = "VK_SHIFT"
		var_1_73.reconnect.reconnect_on_key2 = "VK_0"
		var_1_73.player_info_panel.prev_id_key = "VK_LEFT"
		var_1_73.player_info_panel.next_id_key = "VK_RIGHT"
		var_1_73.admin_chat_commands.confirm_key = "VK_DELETE"
		var_1_73.admin_chat_commands.cancel_key = "VK_END"
		var_1_73.menus.main_menu_key = "VK_M"
		var_1_73.menus.fast_command_menu_key = "VK_RBUTTON"

		var_0_0.save(var_1_73, "AdminTools\\config.ini")

		ab_on_key1 = "VK_OEM_COMMA"
		ab_on_key2 = 0
		tp_on_marker_key = "VK_LBUTTON"
		marker_enable_key = "VK_MBUTTON"
		wh_on_key1 = "VK_MENU"
		wh_on_key2 = "VK_F3"
		gm_on_key1 = "VK_INSERT"
		gm_on_key2 = 0
		reconnect_on_key1 = "VK_SHIFT"
		reconnect_on_key2 = "VK_0"
		sp_prev_id_key = "VK_LEFT"
		sp_next_id_key = "VK_RIGHT"
		admin_chat_confirm_key = "VK_DELETE"
		admin_chat_cancel_key = "VK_END"
		main_menu_key = "VK_M"
		fast_command_menu_key = "VK_RBUTTON"

		message("\xC7\xED\xE0\xF7\xE5\xED\xE8\xFF \xE3\xEE\xF0\xFF\xF7\xE8\xF5 \xEA\xEB\xE0\xE2\xE8\xF8 \xF3\xF1\xF2\xE0\xED\xEE\xE2\xEB\xE5\xED\xFB \xED\xE0 \xE7\xED\xE0\xF7\xE5\xED\xE8\xFF \xEF\xEE-\xF3\xEC\xEE\xEB\xF7\xE0\xED\xE8\xFE.")
	end

	if gm_on_start == true then
		godmode = true
	else
		godmode = false
	end

	wh_on_start = var_1_72.cheats.wh_on_start
	pos_indication = var_1_72.cheats.pos_indication
	skin_changer = var_1_72.skin_changer.status
	skin = var_1_72.skin_changer.skin
	main_menu_key = var_1_72.menus.main_menu_key
	fast_command_menu_key = var_1_72.menus.fast_command_menu_key
	punishment_list_auto_mode = var_1_72.punishment_list.auto_mode
	admin_chat_commands_status = var_1_72.admin_chat_commands.status
	admin_chat_confirm_key = var_1_72.admin_chat_commands.confirm_key
	admin_chat_cancel_key = var_1_72.admin_chat_commands.cancel_key
	comm_from_adm_chat_notice_mode = var_1_72.admin_chat_commands.notice_mode
	admin_chat_notifications = var_1_72.admin_chat_commands.admin_chat_notifications
	reconnect_on_key1 = var_1_72.reconnect.reconnect_on_key1
	reconnect_on_key2 = var_1_72.reconnect.reconnect_on_key2
	player_info_panel_xpos = var_1_72.player_info_panel.xpos
	player_info_panel_ypos = var_1_72.player_info_panel.ypos
	player_info_panel_status = var_1_72.player_info_panel.panel_status
	sp_next_id_key = var_1_72.player_info_panel.next_id_key
	sp_prev_id_key = var_1_72.player_info_panel.prev_id_key
	id_indication = var_1_72.player_info_panel.id_indication
	show_ping_chart = var_1_72.player_info_panel.show_ping_chart
	admins_checker_status = var_1_72.checker.admins_checker_status
	leaders_checker_status = var_1_72.checker.leaders_checker_status
	friends_checker_status = var_1_72.checker.friends_checker_status
	capture_warns_counter_status = var_1_72.checker.capture_warns_counter_status
	chatid = var_1_72.chat.chatid
	admin_checker_auto_update = var_1_72.checker.admin_checker_auto_update
	auto_invite_status = var_1_72.auto_invite.status
	adm_nick_in_msg = var_1_72.chat.adm_nick_in_msg
	auto_invite_organisation = var_1_72.auto_invite.organisation
	pip_x_pos = var_1_72.player_info_panel.xpos
	pip_y_pos = var_1_72.player_info_panel.ypos
	ping_chart_x_pos = var_1_72.player_info_panel.ping_chart_xpos
	ping_chart_y_pos = var_1_72.player_info_panel.ping_chart_ypos
	auto_check_update = var_1_72.update.auto_check_update
	sound = var_1_72.sound.status
	font = var_1_72.player_info_panel.font

	local var_1_74 = var_1_72.player_info_panel.font_size

	font = renderCreateFont(font, var_1_74, 13)
	auto_perenos = var_1_72.chat.auto_perenos
	togphone = var_1_72.chat.togphone
	autoLoginStatus = var_1_72.auto_login.status

	local var_1_75 = var_1_72.auto_login.password

	if var_1_75 and var_1_75 ~= 0 then
		local var_1_76 = string.sub(var_1_75, 1, 64)
		local var_1_77 = string.sub(var_1_75, 65)

		if var_1_76 == getHmac(var_1_77) then
			password_text_buffer.v = aesDecrypt(pass, var_1_77)
		end
	end

	skin_text_buffer.v = tostring(skin)

	if not doesFileExist("moonloader\\config\\AdminTools\\config.ini") then
		var_0_0.save(var_1_72, "AdminTools\\config.ini")
	end

	stats = {
		admin_stats = {
			stats_ans_counter_all = getHmac(aesEncrypt(pass_stats_ans, "0")) .. aesEncrypt(pass_stats_ans, "0"),
			stats_mute_counter_all = getHmac(aesEncrypt(pass_stats_mute, "0")) .. aesEncrypt(pass_stats_mute, "0"),
			stats_kick_counter_all = getHmac(aesEncrypt(pass_stats_kick, "0")) .. aesEncrypt(pass_stats_kick, "0"),
			stats_skick_counter_all = getHmac(aesEncrypt(pass_stats_skick, "0")) .. aesEncrypt(pass_stats_skick, "0"),
			stats_jail_counter_all = getHmac(aesEncrypt(pass_stats_jail, "0")) .. aesEncrypt(pass_stats_jail, "0"),
			stats_warn_counter_all = getHmac(aesEncrypt(pass_stats_warn, "0")) .. aesEncrypt(pass_stats_warn, "0"),
			stats_ban_counter_all = getHmac(aesEncrypt(pass_stats_ban, "0")) .. aesEncrypt(pass_stats_ban, "0"),
			seconds_all = getHmac(aesEncrypt(pass_stats_seconds, "0")) .. aesEncrypt(pass_stats_seconds, "0")
		}
	}

	if not doesFileExist("moonloader\\config\\AdminTools\\stats.ini") then
		var_0_0.save(stats, "AdminTools\\stats.ini")
	end

	sampRegisterChatCommand("at", menu)
	sampRegisterChatCommand("hist", history)
	sampRegisterChatCommand("iget", get)
	sampRegisterChatCommand("forum", forum)
	sampRegisterChatCommand("reg", reg)
	sampRegisterChatCommand("areg", areg)
	sampRegisterChatCommand("getcar", getcar)
	sampRegisterChatCommand("ilip", ilip)
	sampRegisterChatCommand("lipbans", lipbans)
	sampRegisterChatCommand("apay", apay)
	sampRegisterChatCommand("rskin", rskin)
	sampRegisterChatCommand("rskins", rskins)
	sampRegisterChatCommand("2warns", wwarns)
	sampRegisterChatCommand("carsp", carsp)
	sampRegisterChatCommand("stp", stp)
	sampRegisterChatCommand("askick", askick)
	sampRegisterChatCommand("findd", findd)
	sampRegisterChatCommand("afindd", afindd)
	sampRegisterChatCommand("mban", mban)
	sampRegisterChatCommand("guns", guns)
	sampRegisterChatCommand("checker", checker)
	sampRegisterChatCommand("reconn", relog)
	sampRegisterChatCommand("warnlast", warnlast)
	sampRegisterChatCommand("banlast", banlast)
	sampRegisterChatCommand("klist", klist)
	sampRegisterChatCommand("jaillast", jaillast)
	sampRegisterChatCommand("mutelast", mutelast)
	sampRegisterChatCommand("ilog", ilog)
	sampRegisterChatCommand("iskill", iskill)
	sampRegisterChatCommand("rk", rk)

	local var_1_78 = var_0_0.load(stats, "moonloader\\config\\AdminTools\\stats.ini")

	stats_ans_counter_all = var_1_78.admin_stats.stats_ans_counter_all

	if stats_ans_counter_all then
		local var_1_79 = string.sub(stats_ans_counter_all, 1, 64)
		local var_1_80 = string.sub(stats_ans_counter_all, 65)

		if var_1_79 == getHmac(var_1_80) then
			stats_ans_counter_all = tonumber(aesDecrypt(pass_stats_ans, var_1_80))
		else
			stats_ans_counter_all = tonumber(decrypt(stats_ans_counter_all))
		end
	end

	stats_mute_counter_all = var_1_78.admin_stats.stats_mute_counter_all

	if stats_mute_counter_all then
		local var_1_81 = string.sub(stats_mute_counter_all, 1, 64)
		local var_1_82 = string.sub(stats_mute_counter_all, 65)

		if var_1_81 == getHmac(var_1_82) then
			stats_mute_counter_all = tonumber(aesDecrypt(pass_stats_mute, var_1_82))
		else
			stats_mute_counter_all = tonumber(decrypt(stats_mute_counter_all))
		end
	end

	stats_kick_counter_all = var_1_78.admin_stats.stats_kick_counter_all

	if stats_kick_counter_all then
		local var_1_83 = string.sub(stats_kick_counter_all, 1, 64)
		local var_1_84 = string.sub(stats_kick_counter_all, 65)

		if var_1_83 == getHmac(var_1_84) then
			stats_kick_counter_all = tonumber(aesDecrypt(pass_stats_kick, var_1_84))
		else
			stats_kick_counter_all = tonumber(decrypt(stats_kick_counter_all))
		end
	end

	stats_skick_counter_all = var_1_78.admin_stats.stats_skick_counter_all

	if stats_skick_counter_all then
		local var_1_85 = string.sub(stats_skick_counter_all, 1, 64)
		local var_1_86 = string.sub(stats_skick_counter_all, 65)

		if var_1_85 == getHmac(var_1_86) then
			stats_skick_counter_all = tonumber(aesDecrypt(pass_stats_skick, var_1_86))
		else
			stats_skick_counter_all = tonumber(decrypt(stats_skick_counter_all))
		end
	end

	stats_jail_counter_all = var_1_78.admin_stats.stats_jail_counter_all

	if stats_jail_counter_all then
		local var_1_87 = string.sub(stats_jail_counter_all, 1, 64)
		local var_1_88 = string.sub(stats_jail_counter_all, 65)

		if var_1_87 == getHmac(var_1_88) then
			stats_jail_counter_all = tonumber(aesDecrypt(pass_stats_jail, var_1_88))
		else
			stats_jail_counter_all = tonumber(decrypt(stats_jail_counter_all))
		end
	end

	stats_warn_counter_all = var_1_78.admin_stats.stats_warn_counter_all

	if stats_warn_counter_all then
		local var_1_89 = string.sub(stats_warn_counter_all, 1, 64)
		local var_1_90 = string.sub(stats_warn_counter_all, 65)

		if var_1_89 == getHmac(var_1_90) then
			stats_warn_counter_all = tonumber(aesDecrypt(pass_stats_warn, var_1_90))
		else
			stats_warn_counter_all = tonumber(decrypt(stats_warn_counter_all))
		end
	end

	stats_ban_counter_all = var_1_78.admin_stats.stats_ban_counter_all

	if stats_ban_counter_all then
		local var_1_91 = string.sub(stats_ban_counter_all, 1, 64)
		local var_1_92 = string.sub(stats_ban_counter_all, 65)

		if var_1_91 == getHmac(var_1_92) then
			stats_ban_counter_all = tonumber(aesDecrypt(pass_stats_ban, var_1_92))
		else
			stats_ban_counter_all = tonumber(decrypt(stats_ban_counter_all))
		end
	end

	seconds_all = var_1_78.admin_stats.seconds_all

	if seconds_all then
		local var_1_93 = string.sub(seconds_all, 1, 64)
		local var_1_94 = string.sub(seconds_all, 65)

		if var_1_93 == getHmac(var_1_94) then
			seconds_all = tonumber(aesDecrypt(pass_stats_seconds, var_1_94))
		else
			seconds_all = tonumber(decrypt(seconds_all))
		end
	end

	local var_1_95 = "\xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFF \xEE\xE1 \xE8\xE3\xF0\xEE\xEA\xE5.\n"
	local var_1_96 = "\xCD\xE0\xF7\xED\xE8\xF2\xE5 \xF1\xEB\xE5\xE6\xEA\xF3 \xE7\xE0 \xE8\xE3\xF0\xEE\xEA\xEE\xEC."

	renderText = var_1_95 .. var_1_96

	if doesFileExist("moonloader\\AdminTools\\data\\temp") then
		local var_1_97 = io.open("moonloader\\AdminTools\\data\\temp", "r")
		local var_1_98 = var_1_97:read()

		if var_1_98 ~= nil then
			local var_1_99 = tonumber(var_1_98)

			if var_1_99 >= 1 and var_1_99 <= 5 then
				admin_lvl = var_1_99

				if sampIsLocalPlayerSpawned() then
					local var_1_100 = var_1_97:read()

					if var_1_100 ~= nil then
						mainSkin = tonumber(var_1_100)
					end
				end
			end
		end

		io.close(var_1_97)
		os.remove("moonloader\\AdminTools\\data\\temp")

		local var_1_101 = sampGetMaxPlayerId(false)

		for iter_1_4, iter_1_5 in ipairs(admins_nick) do
			for iter_1_6 = 0, var_1_101 do
				if sampIsPlayerConnected(iter_1_6) and iter_1_5 == sampGetPlayerNickname(iter_1_6) then
					admins_id[iter_1_4] = iter_1_6
				end
			end
		end

		for iter_1_7, iter_1_8 in ipairs(friends_nick) do
			for iter_1_9 = 0, var_1_101 do
				if sampIsPlayerConnected(iter_1_9) and iter_1_8 == sampGetPlayerNickname(iter_1_9) then
					friends_id[iter_1_7] = iter_1_9
				end
			end
		end

		for iter_1_10, iter_1_11 in ipairs(leaders_nick) do
			for iter_1_12 = 0, var_1_101 do
				if sampIsPlayerConnected(iter_1_12) and iter_1_11 == sampGetPlayerNickname(iter_1_12) then
					leaders_id[iter_1_10] = iter_1_12
				end
			end
		end

		local var_1_102 = sampGetServerSettingsPtr()

		NTdistStart = var_0_1.getfloat(var_1_102 + 39)
		NTwallsStart = var_0_1.getint8(var_1_102 + 47)
		NTshowStart = var_0_1.getint8(var_1_102 + 56)

		if wh_on_start == true then
			nameTagOn()

			var_0_8 = true
		end
	else
		admin_lvl = 0
	end

	lua_thread.create(firstThread)
	message(string.format("\xD1\xEA\xF0\xE8\xEF\xF2 \xE7\xE0\xE3\xF0\xF3\xE6\xE5\xED. \xC2\xE5\xF0\xF1\xE8\xFF: %s. \xD0\xE0\xE7\xF0\xE0\xE1\xEE\xF2\xF7\xE8\xEA: James Turner.", thisScript().version))
	message(string.format("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /at \xE8\xEB\xE8 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 \"%s\" \xE4\xEB\xFF \xE2\xFB\xE7\xEE\xE2\xE0 \xEC\xE5\xED\xFE.", var_0_5.id_to_name(var_0_5[main_menu_key])))

	local var_1_103 = 50
	local var_1_104 = os.time()

	while admin_lvl == 0 do
		wait(0)

		if os.time() > var_1_104 + var_1_103 then
			message("\xC4\xE0\xED\xED\xFB\xE9 \xF1\xEA\xF0\xE8\xEF\xF2 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 Advance-RP.")
			thisScript():unload()
		end
	end

	analytics("event", "Script started.")

	analytics_tick = localClock()
	authorization_delay = 50
	authorization_startTime = os.time()

	if auto_check_update == true then
		print("\xCF\xF0\xEE\xE2\xE5\xF0\xEA\xE0 \xED\xE0\xEB\xE8\xF7\xE8\xFF \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE9...")
		download("GET", "https://raw.githubusercontent.com/Garrus93/admintools/master/version.json")
	end

	getpunishments()

	repeat
		wait(0)

		if sampIsLocalPlayerSpawned() then
			local var_1_105, var_1_106 = sampGetPlayerIdByCharHandle(PLAYER_PED)
			local var_1_107 = sampGetPlayerNickname(var_1_106)

			if not mainSkin then
				mainSkin = getCharModel(PLAYER_PED)
			end

			local var_1_108 = sampGetServerSettingsPtr()

			NTdistStart = var_0_1.getfloat(var_1_108 + 39)
			NTwallsStart = var_0_1.getint8(var_1_108 + 47)
			NTshowStart = var_0_1.getint8(var_1_108 + 56)

			if wh_on_start == true then
				nameTagOn()

				var_0_8 = true
			end
		end
	until sampIsLocalPlayerSpawned()

	while true do
		wait(0)
		removePointMarker()

		local var_1_109, var_1_110 = sampGetCurrentServerAddress()

		if not string.match(var_1_109, string.char(53, 46, 49, 57, 54, 46, 49, 49, 50)) then
			message("\xC4\xE0\xED\xED\xFB\xE9 \xF1\xEA\xF0\xE8\xEF\xF2 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 Advance-RP.")
			thisScript():unload()
		end

		while isPauseMenuActive() do
			wait(0)

			if cursorEnabled then
				show_Cursor(false)
			end

			local var_1_111 = string.format("%s %s for Advance-RP by James Turner ", thisScript().name, thisScript().version)
			local var_1_112, var_1_113 = getScreenResolution()
			local var_1_114 = renderGetFontDrawHeight(font)
			local var_1_115 = renderGetFontDrawTextLength(font, var_1_111)

			renderFontDrawText(font, var_1_111, var_1_112 - var_1_115, var_1_113 - var_1_114, 2431183080)

			if askick_status == true then
				askick_status = false
			end

			if command_from_admin_chat_status == true then
				command_from_admin_chat_status = false
			end

			if os.clock() - analytics_tick > 300 then
				analytics("event", "Standard activity report (AFK).")

				analytics_tick = os.clock()
			end
		end

		if os.clock() - activity_tick > 2 then
			if activity_tick2 == 0 then
				activity_tick2 = os.clock()
			elseif os.clock() - activity_tick2 > 4 then
				activity_tick = os.clock()
				activity_tick2 = 0
			end
		else
			activity_tick = os.clock()
		end

		if os.clock() - analytics_tick > 300 then
			analytics("event", "Standard activity report.")

			analytics_tick = os.clock()
		end

		if var_0_5[reconnect_on_key2] ~= 0 then
			if isKeyDown(var_0_5[reconnect_on_key1]) and isKeyJustPressed(var_0_5[reconnect_on_key2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
				local var_1_116 = sampGetCurrentServerName()

				message(string.format("\xCF\xE5\xF0\xE5\xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED\xE8\xE5 \xEA \xF1\xE5\xF0\xE2\xE5\xF0\xF3 %s...", var_1_116))

				local var_1_117, var_1_118 = sampGetCurrentServerAddress()

				sampConnectToServer(var_1_117, var_1_118)
			end
		elseif isKeyDown(var_0_5[reconnect_on_key1]) and not sampIsChatInputActive() and not sampIsDialogActive() then
			local var_1_119 = sampGetCurrentServerName()

			message(string.format("\xCF\xE5\xF0\xE5\xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED\xE8\xE5 \xEA \xF1\xE5\xF0\xE2\xE5\xF0\xF3 %s...", var_1_119))

			local var_1_120, var_1_121 = sampGetCurrentServerAddress()

			sampConnectToServer(var_1_120, var_1_121)
		end

		if sampGetGamestate() ~= 3 then
			for iter_1_13, iter_1_14 in ipairs(friends_id) do
				friends_id[iter_1_13] = -1
			end

			for iter_1_15, iter_1_16 in ipairs(admins_id) do
				admins_id[iter_1_15] = -1
			end

			for iter_1_17, iter_1_18 in ipairs(leaders_id) do
				leaders_id[iter_1_17] = -1
			end
		end

		if not isPauseMenuActive() and sampIsLocalPlayerSpawned() and admin_lvl ~= 0 then
			if processDownloadChangelog then
				download("GET", "https://raw.githubusercontent.com/Garrus93/admintools/master/changelog")

				processDownloadChangelog = false
			end

			if first_sp == true then
				if sampIsPlayerConnected(sp_player_id) then
					sp_player_name = sampGetPlayerNickname(sp_player_id)
					sp_score = sampGetPlayerScore(sp_player_id)

					if sp_player_id == var_0_10 then
						if sp_player_name == temp_name then
							var_1_95 = string.format("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0: %s [%i]\n", sp_player_name, sp_player_id)
							var_1_96 = string.format("\xD3\xF0\xEE\xE2\xE5\xED\xFC \xE8\xE3\xF0\xEE\xEA\xE0: %i", sp_score)
							renderText = var_1_95 .. var_1_96
						else
							var_1_95 = string.format("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0: %s\n", temp_name)
							var_1_96 = "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB"
							renderText = var_1_95 .. var_1_96
						end
					else
						var_1_95 = string.format("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0: %s [%i]\n", sp_player_name, sp_player_id)
						var_1_96 = string.format("\xD3\xF0\xEE\xE2\xE5\xED\xFC \xE8\xE3\xF0\xEE\xEA\xE0: %i", sp_score)
						renderText = var_1_95 .. var_1_96
						temp_name = sp_player_name
						var_0_10 = sp_player_id
					end
				elseif sp_player_name ~= nil then
					var_1_95 = "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.\n"
					var_1_96 = string.format("\xCF\xF0\xE5\xE4\xFB\xE4\xF3\xF9\xE8\xE9: %s [%i]", temp_name, var_0_10)
					renderText = var_1_95 .. var_1_96
				end
			end

			if player_info_panel_status == true and sampIsChatVisible() then
				local var_1_122
				local var_1_123, var_1_124 = convertGameScreenCoordsToWindowScreenCoords(pip_x_pos, pip_y_pos)
				local var_1_125 = renderGetFontDrawTextLength(font, var_1_95)
				local var_1_126 = renderGetFontDrawTextLength(font, var_1_96)

				if var_1_126 < var_1_125 then
					var_1_122 = var_1_125
				else
					var_1_122 = var_1_126
				end

				pip_height = renderGetFontDrawHeight(font)

				renderDrawBoxWithBorder(var_1_123, var_1_124 - 5, var_1_122 + 14, pip_height * 2.1 + 10, 2013265920, 2, 2365564160)
				renderFontDrawText(font, renderText, var_1_123 + 7, var_1_124, -1)
			end

			if godmode == false then
				var_1_68 = "{696969}GodMode"

				setCharProofs(PLAYER_PED, false, false, false, false, false)

				if isCharInAnyCar(PLAYER_PED) then
					local var_1_127 = storeCarCharIsInNoSave(PLAYER_PED)

					setCarProofs(var_1_127, false, false, false, false, false)
				end
			else
				var_1_68 = "{00FF00}GodMode"

				setCharProofs(PLAYER_PED, true, true, true, true, true)

				if isCharInAnyCar(PLAYER_PED) then
					local var_1_128 = storeCarCharIsInNoSave(PLAYER_PED)

					setCarProofs(var_1_128, true, true, true, true, true)
				end
			end

			if var_0_8 == false then
				var_1_68 = var_1_68 .. " {696969}WallHack"
			elseif var_0_8 == true then
				var_1_68 = var_1_68 .. " {00FF00}WallHack"

				local var_1_129 = sampGetServerSettingsPtr()
				local var_1_130 = var_0_1.getfloat(var_1_129 + 39)
				local var_1_131 = var_0_1.getint8(var_1_129 + 47)
				local var_1_132 = var_0_1.getint8(var_1_129 + 56)

				if var_1_130 == NTdistStart then
					nameTagOn()
				end
			end

			if var_1_109 ~= "5.254.104.132" then
				if var_0_7 == false then
					var_1_68 = var_1_68 .. " {696969}AirBreak"
				else
					var_1_68 = var_1_68 .. " {00FF00}AirBreak"
				end
			end

			if id_indication == true then
				local var_1_133, var_1_134 = sampGetPlayerIdByCharHandle(PLAYER_PED)

				var_1_68 = var_1_68 .. string.format("  {00FF00}ID: %d", var_1_134)
			end

			if pos_indication == true then
				local var_1_135, var_1_136, var_1_137 = getCharCoordinates(PLAYER_PED)

				var_1_68 = var_1_68 .. string.format("  {00FF00}%.1f %.1f %.1f", var_1_135, var_1_136, var_1_137)
			end

			if cheats_panel_status == true and sampIsChatVisible() then
				local var_1_138 = renderGetFontDrawTextLength(font, var_1_68)
				local var_1_139 = renderGetFontDrawHeight(font)
				local var_1_140, var_1_141 = getScreenResolution()
				local var_1_142 = var_1_140 - var_1_138
				local var_1_143 = var_1_141 - var_1_139

				renderDrawBoxWithBorder(var_1_142 - 13, var_1_143 - 7, var_1_138 + 13, var_1_139 + 7, 2013265920, 2, 4278190080)
				renderFontDrawText(font, var_1_68, var_1_142 - 7, var_1_143 - 5, 2348810240)
			end

			if gm_on_key2 ~= 0 then
				if isKeyDown(var_0_5[gm_on_key1]) and isKeyJustPressed(var_0_5[gm_on_key2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if godmode == true then
						godmode = false
					elseif godmode == false then
						godmode = true

						if isCharInAnyCar(PLAYER_PED) and var_1_109 ~= "5.254.104.132" then
							local var_1_144 = storeCarCharIsInNoSave(PLAYER_PED)

							setCarRoll(var_1_144, 0)
							setCarHealth(var_1_144, 1000)
							fixCar(var_1_144)
							setCarProofs(var_1_144, true, true, true, true, true)
							message("\xD2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2 \xEE\xF2\xF0\xE5\xEC\xEE\xED\xF2\xE8\xF0\xEE\xE2\xE0\xED.")
						end
					end
				end
			elseif isKeyJustPressed(var_0_5[gm_on_key1]) and not sampIsChatInputActive() and not sampIsDialogActive() then
				if godmode == true then
					godmode = false
				elseif godmode == false then
					godmode = true

					if isCharInAnyCar(PLAYER_PED) and var_1_109 ~= "5.254.104.132" then
						local var_1_145 = storeCarCharIsInNoSave(PLAYER_PED)

						setCarRoll(var_1_145, 0)
						setCarHealth(var_1_145, 1000)
						fixCar(var_1_145)
						setCarProofs(var_1_145, true, true, true, true, true)
						message("\xD2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2 \xEE\xF2\xF0\xE5\xEC\xEE\xED\xF2\xE8\xF0\xEE\xE2\xE0\xED.")
					end
				end
			end

			if wh_on_key2 ~= 0 then
				if isKeyDown(var_0_5[wh_on_key1]) and isKeyJustPressed(var_0_5[wh_on_key2]) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if var_0_8 == true then
						var_0_8 = false

						nameTagOff()
					elseif var_0_8 == false then
						var_0_8 = true

						nameTagOn()
					end
				end
			elseif isKeyJustPressed(var_0_5[wh_on_key1]) and not sampIsChatInputActive() and not sampIsDialogActive() then
				if var_0_8 == true then
					var_0_8 = false

					nameTagOff()
				elseif var_0_8 == false then
					var_0_8 = true

					nameTagOn()
				end
			end

			if ab_on_key2 ~= 0 then
				if isKeyDown(var_0_5[ab_on_key1]) and isKeyJustPressed(var_0_5[ab_on_key2]) and not sampIsChatInputActive() and var_1_109 ~= "5.254.104.132" and not sampIsDialogActive() then
					if admin_lvl >= 3 then
						if var_0_7 == true then
							var_0_7 = false

							freezeCharPosition(PLAYER_PED, false)

							if isCharInAnyCar(PLAYER_PED) then
								local var_1_146 = storeCarCharIsInNoSave(PLAYER_PED)

								freezeCarPosition(var_1_146, false)
								setCarCollision(var_1_146, true)
							else
								freezeCharPosition(PLAYER_PED, false)
								setCharCollision(PLAYER_PED, true)
								clearCharTasks(PLAYER_PED)
							end
						elseif var_0_7 == false then
							var_0_7 = true
							var_1_69 = 0.5

							if isCharInAnyCar(PLAYER_PED) then
								local var_1_147 = storeCarCharIsInNoSave(PLAYER_PED)

								freezeCarPosition(var_1_147, true)
								setCarCollision(var_1_147, false)
							else
								freezeCharPosition(PLAYER_PED, true)
								setCharCollision(PLAYER_PED, false)
							end
						end
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0 \xF2\xEE\xEB\xFC\xEA\xEE \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0\xEC 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end
			elseif isKeyJustPressed(var_0_5[ab_on_key1]) and not sampIsChatInputActive() and var_1_109 ~= "5.254.104.132" and not sampIsDialogActive() then
				if admin_lvl >= 3 then
					if var_0_7 == true then
						var_0_7 = false

						freezeCharPosition(PLAYER_PED, false)

						if isCharInAnyCar(PLAYER_PED) then
							local var_1_148 = storeCarCharIsInNoSave(PLAYER_PED)

							freezeCarPosition(var_1_148, false)
							setCarCollision(var_1_148, true)
						else
							freezeCharPosition(PLAYER_PED, false)
							setCharCollision(PLAYER_PED, true)
							clearCharTasks(PLAYER_PED)
						end
					elseif var_0_7 == false then
						var_0_7 = true
						var_1_69 = 0.5

						if isCharInAnyCar(PLAYER_PED) then
							local var_1_149 = storeCarCharIsInNoSave(PLAYER_PED)

							freezeCarPosition(var_1_149, true)
							setCarCollision(var_1_149, false)
						else
							freezeCharPosition(PLAYER_PED, true)
							setCharCollision(PLAYER_PED, false)
						end
					end
				else
					message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0 \xF2\xEE\xEB\xFC\xEA\xEE \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0\xEC 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
				end
			end

			if var_0_7 == true then
				if isKeyDown(81) and not sampIsChatInputActive() and not sampIsDialogActive() then
					var_1_69 = var_1_69 - 0.01

					printStringNow(string.format("Speed: %.2f", var_1_69), 2000)
				elseif isKeyDown(69) and not sampIsChatInputActive() and not sampIsDialogActive() then
					var_1_69 = var_1_69 + 0.01

					printStringNow(string.format("Speed: %.2f", var_1_69), 2000)
				end

				if isCharInAnyCar(PLAYER_PED) then
					local var_1_150 = storeCarCharIsInNoSave(PLAYER_PED)
					local var_1_151 = getCarForwardY(var_1_150)
					local var_1_152, var_1_153, var_1_154 = getActiveCameraCoordinates()
					local var_1_155, var_1_156, var_1_157 = getOffsetFromCarInWorldCoords(var_1_150, 0, 0, 0)
					local var_1_158 = var_1_155 - var_1_152
					local var_1_159 = var_1_156 - var_1_153
					local var_1_160 = getHeadingFromVector2d(var_1_158, var_1_159)

					setCarHeading(var_1_150, var_1_160)
				else
					local var_1_161, var_1_162, var_1_163 = getActiveCameraCoordinates()
					local var_1_164, var_1_165, var_1_166 = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, 0, 0)
					local var_1_167 = var_1_164 - var_1_161
					local var_1_168 = var_1_165 - var_1_162
					local var_1_169 = getHeadingFromVector2d(var_1_167, var_1_168)

					setCharHeading(PLAYER_PED, var_1_169)
					freezeCharPosition(PLAYER_PED, true)
				end

				if isKeyDown(87) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, var_1_69, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_170 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_170, 0, var_1_69, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end

				if isKeyDown(65) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, -var_1_69, 0, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_171 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_171, -var_1_69, 0, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end

				if isKeyDown(83) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, -var_1_69, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_172 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_172, 0, -var_1_69, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end

				if isKeyDown(68) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, var_1_69, 0, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_173 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_173, var_1_69, 0, 0)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end

				if isKeyDown(32) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, 0, var_1_69)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_174 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_174, 0, 0, var_1_69)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end

				if isKeyDown(16) and not sampIsChatInputActive() and not sampIsDialogActive() then
					if not isCharInAnyCar(PLAYER_PED) then
						X, Y, Z = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, 0, -var_1_69)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportWithAnimAndVelocity()
					else
						local var_1_175 = storeCarCharIsInNoSave(PLAYER_PED)

						X, Y, Z = getOffsetFromCarInWorldCoords(var_1_175, 0, 0, -var_1_69)
						X = representFloatAsInt(X)
						Y = representFloatAsInt(Y)
						Z = representFloatAsInt(Z)

						TeleportVehicleAndSaveVelocity()
					end
				end
			end

			if isKeyJustPressed(var_0_5[marker_enable_key]) then
				if var_1_109 ~= "5.254.104.132" then
					if admin_lvl >= 3 then
						cursorEnabled = not cursorEnabled

						show_Cursor(cursorEnabled)
					else
						text = "\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0\xEC 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

						message(text)
					end
				else
					text = "\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xED\xE5\xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0 \xE4\xEB\xFF \xE2\xE0\xF8\xE5\xE3\xEE \xF1\xE5\xF0\xE2\xE5\xF0\xE0."

					message(text)
				end
			end

			if cursorEnabled and show_main_window.v == false and fast_commands_dialog.v == false then
				if sampGetCursorMode() == 0 then
					show_Cursor(true)
				end

				local var_1_176, var_1_177 = getCursorPos()
				local var_1_178, var_1_179 = getScreenResolution()

				if var_1_176 >= 0 and var_1_177 >= 0 and var_1_176 < var_1_178 and var_1_177 < var_1_179 then
					local var_1_180, var_1_181, var_1_182 = convertScreenCoordsToWorld3D(var_1_176, var_1_177, 700)
					local var_1_183, var_1_184, var_1_185 = getActiveCameraCoordinates()
					local var_1_186, var_1_187 = processLineOfSight(var_1_183, var_1_184, var_1_185, var_1_180, var_1_181, var_1_182, true, true, false, true, false, false, false, false)

					if var_1_186 and var_1_187.entity ~= 0 then
						local var_1_188 = var_1_187.normal
						local var_1_189 = var_0_4(var_1_187.pos[1], var_1_187.pos[2], var_1_187.pos[3]) - var_0_4(var_1_188[1], var_1_188[2], var_1_188[3]) * 0.1
						local var_1_190 = 300

						if var_1_188[3] >= 0.5 then
							var_1_190 = 1
						end

						local var_1_191, var_1_192 = processLineOfSight(var_1_189.x, var_1_189.y, var_1_189.z + var_1_190, var_1_189.x, var_1_189.y, var_1_189.z - 0.3, true, true, false, true, false, false, false)

						if var_1_191 then
							local var_1_193 = var_0_4(var_1_192.pos[1], var_1_192.pos[2], var_1_192.pos[3] + 1)
							local var_1_194, var_1_195, var_1_196 = getCharCoordinates(PLAYER_PED)
							local var_1_197 = getDistanceBetweenCoords3d(var_1_194, var_1_195, var_1_196, var_1_193.x, var_1_193.y, var_1_193.z)
							local var_1_198 = renderGetFontDrawHeight(font)
							local var_1_199 = var_1_177 - 2
							local var_1_200 = var_1_176 - 2

							renderFontDrawText(font, string.format("%0.2f \xEC.", var_1_197), var_1_200, var_1_199 - var_1_198, 4008636142)

							local var_1_201

							if var_1_187.entityType == 2 then
								local var_1_202 = getVehiclePointerHandle(var_1_187.entity)

								if doesVehicleExist(var_1_202) and (not isCharInAnyCar(PLAYER_PED) or storeCarCharIsInNoSave(PLAYER_PED) ~= var_1_202) then
									displayVehicleName(var_1_200, var_1_199 - var_1_198 * 2, getNameOfVehicleModel(getCarModel(var_1_202)))

									local var_1_203 = 2868903935

									if isKeyDown(VK_RBUTTON) then
										var_1_201 = var_1_202
										var_1_203 = 4294967295
									end

									renderFontDrawText(font, "\xD3\xE4\xE5\xF0\xE6\xE8\xE2\xE0\xE9\xF2\xE5 \xEF\xF0\xE0\xE2\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3 \xEC\xFB\xF8\xE8, \xF7\xF2\xEE\xE1\xFB \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC\xF1\xFF \xE2 \xEC\xE0\xF8\xE8\xED\xF3", var_1_200, var_1_199 - var_1_198 * 3, var_1_203)
								end
							end

							createPointMarker(var_1_193.x, var_1_193.y, var_1_193.z)

							if isKeyJustPressed(var_0_5[tp_on_marker_key]) then
								if var_1_201 then
									if not jumpIntoCar(var_1_201) then
										teleportPlayer(var_1_193.x, var_1_193.y, var_1_193.z)
									end
								else
									if isCharInAnyCar(PLAYER_PED) then
										local var_1_204 = var_0_4(var_1_187.normal[1], var_1_187.normal[2], 0)
										local var_1_205 = var_0_4(var_1_192.normal[1], var_1_192.normal[2], var_1_192.normal[3])

										rotateCarAroundUpAxis(storeCarCharIsInNoSave(PLAYER_PED), var_1_205)

										var_1_193 = var_1_193 - var_1_204 * 1.8
										var_1_193.z = var_1_193.z - 0.8
									end

									teleportPlayer(var_1_193.x, var_1_193.y, var_1_193.z)
								end

								removePointMarker()
								clearCharTasks(PLAYER_PED)
								show_Cursor(false)
							end
						end
					end
				end
			end

			if player_id_in_mask_and_mvd == true and sampIsChatVisible() then
				if sampGetPlayerCount(true) ~= 0 then
					local var_1_206 = sampGetMaxPlayerId(true)

					for iter_1_19 = 0, var_1_206 do
						if sampIsPlayerConnected(iter_1_19) then
							local var_1_207, var_1_208 = sampGetCharHandleBySampPlayerId(iter_1_19)

							if doesCharExist(var_1_208) then
								local var_1_209 = sampGetPlayerColor(iter_1_19)

								if var_1_209 == 4278190335 or var_1_209 == 2236962 then
									if sampIs3dTextDefined(iter_1_19) then
										local var_1_210, var_1_211, var_1_212, var_1_213, var_1_214, var_1_215, var_1_216, var_1_217, var_1_218 = sampGet3dTextInfoById(iter_1_19)

										if var_1_215 ~= 300 and var_1_217 ~= iter_1_19 then
											sampCreate3dTextEx(iter_1_19, iter_1_19, 4294967295, 0, 0, 0.6, 300, true, iter_1_19, -1)
										end
									else
										sampCreate3dTextEx(iter_1_19, iter_1_19, 4294967295, 0, 0, 0.6, 300, true, iter_1_19, -1)
									end
								elseif sampIs3dTextDefined(iter_1_19) then
									local var_1_219, var_1_220, var_1_221, var_1_222, var_1_223, var_1_224, var_1_225, var_1_226, var_1_227 = sampGet3dTextInfoById(iter_1_19)

									if var_1_224 == 300 then
										sampDestroy3dText(iter_1_19)
									end
								end
							end
						end
					end
				end
			elseif player_id_in_mask_and_mvd == false or not sampIsChatVisible() then
				for iter_1_20 = 0, 1000 do
					if sampIs3dTextDefined(iter_1_20) then
						local var_1_228, var_1_229, var_1_230, var_1_231, var_1_232, var_1_233, var_1_234, var_1_235, var_1_236 = sampGet3dTextInfoById(iter_1_20)

						if var_1_233 == 300 then
							sampDestroy3dText(iter_1_20)
						end
					end
				end
			end

			if ts_info == true and sampIsChatVisible() then
				local var_1_237, var_1_238, var_1_239 = getCharCoordinates(PLAYER_PED)
				local var_1_240, var_1_241 = findAllRandomVehiclesInSphere(var_1_237, var_1_238, var_1_239, 50, true, true)

				if var_1_240 == true then
					local var_1_242, var_1_243 = sampGetVehicleIdByCarHandle(var_1_241)

					if doesVehicleExist(var_1_241) then
						local var_1_244 = getCarSpeed(var_1_241)
						local var_1_245 = getCarModel(var_1_241)
						local var_1_246 = getNameOfVehicleModel(var_1_245)
						local var_1_247 = getCarHealth(var_1_241)
						local var_1_248 = string.format("\xCC\xEE\xE4\xE5\xEB\xFC: %s[%i]\n\xD1\xEA\xEE\xF0\xEE\xF1\xF2\xFC: %.1f \xCA\xEC/\xF7\nHP: %i | ID: %i", var_1_246, var_1_245, var_1_244 * 2, var_1_247, var_1_243)

						if sampIs3dTextDefined(var_1_243) then
							local var_1_249, var_1_250, var_1_251, var_1_252, var_1_253, var_1_254, var_1_255, var_1_256, var_1_257 = sampGet3dTextInfoById(var_1_243)

							if var_1_254 == 50 then
								sampCreate3dTextEx(var_1_243, var_1_248, 2547834076, 0, 0, 0.2, 50, true, -1, var_1_243)
							end
						else
							sampCreate3dTextEx(var_1_243, var_1_248, 2547834076, 0, 0, 0.2, 50, true, -1, var_1_243)
						end
					end
				end

				for iter_1_21 = 0, 1000 do
					if sampIs3dTextDefined(iter_1_21) then
						local var_1_258, var_1_259, var_1_260, var_1_261, var_1_262, var_1_263, var_1_264, var_1_265, var_1_266 = sampGet3dTextInfoById(iter_1_21)

						if var_1_263 == 50 then
							local var_1_267, var_1_268 = sampGetCarHandleBySampVehicleId(iter_1_21)

							if not doesVehicleExist(var_1_268) then
								sampDestroy3dText(iter_1_21)
							end
						end
					end
				end
			elseif ts_info == false or not sampIsChatVisible() then
				local var_1_269, var_1_270, var_1_271 = getCharCoordinates(PLAYER_PED)
				local var_1_272, var_1_273 = findAllRandomVehiclesInSphere(var_1_269, var_1_270, var_1_271, 50, true, true)

				if var_1_272 == true then
					local var_1_274, var_1_275 = sampGetVehicleIdByCarHandle(var_1_273)

					if sampIs3dTextDefined(var_1_275) then
						local var_1_276, var_1_277, var_1_278, var_1_279, var_1_280, var_1_281, var_1_282, var_1_283, var_1_284 = sampGet3dTextInfoById(var_1_275)

						if var_1_281 == 50 then
							sampDestroy3dText(var_1_275)
						end
					end
				end
			end

			if sampIsChatVisible() then
				wposX, wposY = convertGameScreenCoordsToWindowScreenCoords(pip_x_pos, pip_y_pos)

				if player_info_panel_status == true then
					wposY = wposY + pip_height * 3.2
				end

				if leaders_checker_status == true then
					local var_1_285
					local var_1_286
					local var_1_287 = 0
					local var_1_288 = "\xCB\xE8\xE4\xE5\xF0\xFB \xE2 \xF1\xE5\xF2\xE8:"

					renderFontDrawText(font, var_1_288, wposX, wposY, 4211081215)

					wposY = wposY + 0.5

					for iter_1_22, iter_1_23 in ipairs(leaders_id) do
						if iter_1_23 ~= -1 then
							var_1_287 = var_1_287 + 1

							local var_1_289 = leaders_nick[iter_1_22]
							local var_1_290 = leaders_org[iter_1_22]
							local var_1_291 = tonumber(var_1_290)
							local var_1_292 = sampGetPlayerColor(iter_1_23)
							local var_1_293, var_1_294, var_1_295, var_1_296 = explode_argb(var_1_292)

							if var_1_294 == 34 and var_1_295 == 34 and var_1_296 == 34 then
								var_1_294 = 110
								var_1_295 = 110
								var_1_296 = 110
							elseif var_1_294 == 0 and var_1_295 == 0 and var_1_296 == 255 then
								var_1_294 = 30
								var_1_295 = 144
								var_1_296 = 255
							end

							if sampIsPlayerPaused(iter_1_23) then
								var_1_288 = string.format("{%0.2X%0.2X%0.2X}%i. %s [%i] {FF0000}[AFK]", var_1_294, var_1_295, var_1_296, var_1_287, var_1_289, iter_1_23)
							else
								var_1_288 = string.format("{%0.2X%0.2X%0.2X}%i. %s [%i]", var_1_294, var_1_295, var_1_296, var_1_287, var_1_289, iter_1_23)
							end

							local var_1_297 = renderGetFontDrawHeight(font)

							wposY = wposY + var_1_297

							if sampIsPlayerConnected(iter_1_23) then
								local var_1_298, var_1_299 = sampGetCharHandleBySampPlayerId(iter_1_23)

								var_1_286 = doesCharExist(var_1_299) and " {808080}[#]" or ""
							end

							renderFontDrawText(font, var_1_288 .. var_1_286, wposX, wposY, 4294967295)
						end
					end

					if var_1_287 == 0 then
						local var_1_300 = "\xCB\xE8\xE4\xE5\xF0\xEE\xE2 \xE2 \xF1\xE5\xF2\xE8 \xED\xE5\xF2"
						local var_1_301 = renderGetFontDrawHeight(font)

						wposY = wposY + var_1_301

						renderFontDrawText(font, var_1_300, wposX, wposY, 1694498815)
					end
				end

				if friends_checker_status == true then
					local var_1_302
					local var_1_303
					local var_1_304 = 0
					local var_1_305 = "\xC4\xF0\xF3\xE7\xFC\xFF \xE2 \xF1\xE5\xF2\xE8:"

					if leaders_checker_status == true then
						local var_1_306 = renderGetFontDrawHeight(font)

						wposY = wposY + var_1_306 * 1.3
					end

					renderFontDrawText(font, var_1_305, wposX, wposY, 4211081215)

					wposY = wposY + 0.5

					for iter_1_24, iter_1_25 in ipairs(friends_id) do
						if iter_1_25 ~= -1 then
							var_1_304 = var_1_304 + 1

							local var_1_307 = friends_nick[iter_1_24]
							local var_1_308 = sampGetPlayerColor(iter_1_25)
							local var_1_309, var_1_310, var_1_311, var_1_312 = explode_argb(var_1_308)

							if var_1_310 == 34 and var_1_311 == 34 and var_1_312 == 34 then
								var_1_310 = 110
								var_1_311 = 110
								var_1_312 = 110
							elseif var_1_310 == 0 and var_1_311 == 0 and var_1_312 == 255 then
								var_1_310 = 30
								var_1_311 = 144
								var_1_312 = 255
							end

							if sampIsPlayerPaused(iter_1_25) then
								var_1_305 = string.format("{%0.2X%0.2X%0.2X}%i. %s [%i] {FF0000}[AFK]", var_1_310, var_1_311, var_1_312, var_1_304, var_1_307, iter_1_25)
							else
								var_1_305 = string.format("{%0.2X%0.2X%0.2X}%i. %s [%i]", var_1_310, var_1_311, var_1_312, var_1_304, var_1_307, iter_1_25)
							end

							local var_1_313 = renderGetFontDrawHeight(font)

							wposY = wposY + var_1_313

							if sampIsPlayerConnected(iter_1_25) then
								local var_1_314, var_1_315 = sampGetCharHandleBySampPlayerId(iter_1_25)

								var_1_303 = doesCharExist(var_1_315) and " {808080}[#]" or ""
							end

							renderFontDrawText(font, var_1_305 .. var_1_303, wposX, wposY, "0xFFFFFFFF")
						end
					end

					if var_1_304 == 0 then
						local var_1_316 = "\xC4\xF0\xF3\xE7\xE5\xE9 \xE2 \xF1\xE5\xF2\xE8 \xED\xE5\xF2"
						local var_1_317 = renderGetFontDrawHeight(font)

						wposY = wposY + var_1_317

						renderFontDrawText(font, var_1_316, wposX, wposY, 1694498815)
					end
				end

				if admins_checker_status == true then
					local var_1_318
					local var_1_319
					local var_1_320 = 0
					local var_1_321 = "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xFB \xE2 \xF1\xE5\xF2\xE8:"

					if leaders_checker_status == true or friends_checker_status == true then
						local var_1_322 = renderGetFontDrawHeight(font)

						wposY = wposY + var_1_322 * 1.3
					end

					renderFontDrawText(font, var_1_321, wposX, wposY, 4211081215)

					wposY = wposY + 0.5

					for iter_1_26, iter_1_27 in ipairs(admins_id) do
						if iter_1_27 ~= -1 then
							var_1_320 = var_1_320 + 1

							local var_1_323 = admins_nick[iter_1_26]
							local var_1_324 = admins_lvl[iter_1_26]
							local var_1_325 = tonumber(var_1_324)

							if sampIsPlayerPaused(iter_1_27) then
								var_1_321 = string.format("%i. %s [%i] {FF0000}[AFK]", var_1_320, var_1_323, iter_1_27)
							else
								var_1_321 = string.format("%i. %s [%i]", var_1_320, var_1_323, iter_1_27)
							end

							if sampIsPlayerConnected(iter_1_27) then
								local var_1_326, var_1_327 = sampGetCharHandleBySampPlayerId(iter_1_27)

								if doesCharExist(var_1_327) then
									local var_1_328 = "FF"

									var_1_319 = " {808080}[#]"
								else
									local var_1_329 = "C8"

									var_1_319 = ""
								end
							end

							local var_1_330 = renderGetFontDrawHeight(font)

							wposY = wposY + var_1_330

							if var_1_325 == 7 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "FF0000")
							elseif var_1_325 == 6 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "36b90e")
							elseif var_1_325 == 5 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "4ff87b")
							elseif var_1_325 == 4 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "436EEE")
							elseif var_1_325 == 3 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "a73ada")
							elseif var_1_325 == 2 or var_1_325 == 1 then
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "00BFFF")
							else
								renderFontDrawText(font, var_1_321 .. var_1_319, wposX, wposY, "0x" .. "FF" .. "FFFFFF")
							end
						end
					end

					if var_1_320 == 0 then
						local var_1_331 = "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 \xE2 \xF1\xE5\xF2\xE8 \xED\xE5\xF2"
						local var_1_332 = renderGetFontDrawHeight(font)

						wposY = wposY + var_1_332

						renderFontDrawText(font, var_1_331, wposX, wposY, 1694498815)
					end
				end
			end

			if skin_changer == true and admin_lvl > 3 and mainSkin ~= nil and localClock() - var_0_33 > 3 and getCharModel(PLAYER_PED) == mainSkin then
				if skin <= 0 or skin > 311 or skin == mainSkin or skin == 74 then
					message("\xCD\xE5\xEA\xEE\xF0\xF0\xE5\xEA\xF2\xED\xEE\xE5 \xE7\xED\xE0\xF7\xE5\xED\xE8\xE5 ID \xE2\xF0\xE5\xEC\xE5\xED\xED\xEE\xE3\xEE \xF1\xEA\xE8\xED\xE0!")

					var_0_33 = localClock()
				else
					local var_1_333, var_1_334 = sampGetPlayerIdByCharHandle(PLAYER_PED)

					sampSendChat(string.format("/skin %i %i", var_1_334, skin))

					var_0_33 = localClock()
				end
			end

			if var_0_11 == true and localClock() - var_0_27 > 6 then
				if sampIsPlayerConnected(apay_player_id) then
					local var_1_335, var_1_336 = sampGetCharHandleBySampPlayerId(apay_player_id)

					if doesCharExist(var_1_336) then
						if locateCharAnyMeansChar3d(PLAYER_PED, var_1_336, 3, 3, 3, false) then
							if apay_summ <= 5000 then
								sampSendChat(string.format("/pay %i %i", apay_player_id, apay_summ))
								message("\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xEF\xE5\xF0\xE5\xE4\xE0\xF7\xE8 \xE4\xE5\xED\xE5\xE3 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0.")

								apay_summ = 0
								var_0_11 = false
							else
								sampSendChat(string.format("/pay %i 5000", apay_player_id))

								apay_summ = apay_summ - 5000
								var_0_27 = localClock()
								text = string.format("\xCE\xF1\xF2\xE0\xEB\xEE\xF1\xFC \xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC %i$.", apay_summ)

								message(text)
							end
						else
							text = "\xC8\xE3\xF0\xEE\xEA \xF1\xEB\xE8\xF8\xEA\xEE\xEC \xE4\xE0\xEB\xE5\xEA\xEE, \xE2\xF1\xF2\xE0\xED\xFC\xF2\xE5 \xE1\xEB\xE8\xE6\xE5. \xC4\xEB\xFF \xEF\xF0\xE5\xF0\xFB\xE2\xE0\xED\xE8\xFF \xEE\xEF\xE5\xF0\xE0\xF6\xE8\xE8, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 /apay."

							message(text)
						end
					else
						text = "\xC8\xE3\xF0\xEE\xEA \xF1\xEB\xE8\xF8\xEA\xEE\xEC \xE4\xE0\xEB\xE5\xEA\xEE, \xE2\xF1\xF2\xE0\xED\xFC\xF2\xE5 \xE1\xEB\xE8\xE6\xE5. \xC4\xEB\xFF \xEF\xF0\xE5\xF0\xFB\xE2\xE0\xED\xE8\xFF \xEE\xEF\xE5\xF0\xE0\xF6\xE8\xE8, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 /apay."

						message(text)
					end
				else
					text = "\xC8\xE3\xF0\xEE\xEA \xE2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB. \xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

					message(text)

					var_0_11 = false
				end

				var_0_27 = localClock()
			end

			if var_0_17 == true and localClock() - wwarns_tick > 1.5 then
				sampSendChat(string.format("/offwarn %s %s", wwarns_player_nickname, wwarns_reason))

				var_0_17 = false
			end

			if var_0_18 == true and localClock() - carsp_tick > 2 then
				if car_count ~= carsp_car_count and carsp_car_count ~= car_count + 1 then
					sampSendChat(string.format("/vec %d %d %d", car_id, color1, color2))

					carsp_tick = localClock()
					carsp_car_count = carsp_car_count + 1

					local var_1_337, var_1_338, var_1_339 = getOffsetFromCharInWorldCoords(PLAYER_PED, 5, 0, 0)
					local var_1_340 = getGroundZFor3dCoord(var_1_337, var_1_338, 500)

					setCharCoordinates(PLAYER_PED, var_1_337, var_1_338, var_1_340)
				elseif rows == carsp_row_count and car_count == carsp_car_count then
					sampSendChat(string.format("/vec %d %d %d", car_id, color1, color2))

					carsp_tick = localClock()
					carsp_car_count = carsp_car_count + 1
				elseif rows ~= carsp_row_count then
					setCharCoordinates(PLAYER_PED, carsp_X, carsp_Y, carsp_Z)

					carsp_X, carsp_Y, carsp_Z = getOffsetFromCharInWorldCoords(PLAYER_PED, 0, -8, 0)
					carsp_Z = getGroundZFor3dCoord(carsp_X, carsp_Y, 500)

					setCharCoordinates(PLAYER_PED, carsp_X, carsp_Y, carsp_Z)

					carsp_row_count = carsp_row_count + 1
					carsp_car_count = 1

					sampSendChat(string.format("/vec %d %d %d", car_id, color1, color2))

					carsp_tick = localClock()
				else
					text = "\xD1\xEF\xE0\xE2\xED \xD2/\xD1 \xEE\xEA\xEE\xED\xF7\xE5\xED."

					message(text)
					setCharCoordinates(PLAYER_PED, carsp_positionX, carsp_positionY, carsp_positionZ)

					var_0_18 = false
				end
			end

			if first_sp == true and localClock() - first_sp_tick > 0.6 then
				local var_1_341, var_1_342, var_1_343 = getCharCoordinates(PLAYER_PED)

				if var_1_341 == 50 and var_1_342 == 50 and sp_score > 0 then
					sampSendChat(string.format("/sp %d", sp_player_id))
				end

				first_sp = false
			end

			if godmode == true then
				local var_1_344 = getCharHealth(PLAYER_PED)

				if admin_lvl >= 4 and var_1_344 < 80 and localClock() - var_0_26 > 10 then
					local var_1_345, var_1_346 = sampGetPlayerIdByCharHandle(PLAYER_PED)

					sampSendChat(string.format("/hp %i 100", var_1_346))

					var_0_26 = localClock()
				end
			end

			if fast_commands_dialog_status == true and localClock() - first_sp_tick > 1 then
				if not sampIsPlayerConnected(sp_player_id) then
					fast_commands_dialog_status = false
					fast_commands_dialog.v = false
				end

				if isKeyJustPressed(var_0_5[sp_next_id_key]) and not sampIsChatInputActive() then
					sp_player_id = tonumber(sp_player_id)

					if sp_player_id <= 999 then
						repeat
							sp_player_id = sp_player_id + 1

							if sp_player_id == 1000 and not sampIsPlayerConnected(sp_player_id) then
								sp_player_id = 0
							end
						until sampIsPlayerConnected(sp_player_id)

						sampSendChat(string.format("/sp %d", sp_player_id))
					else
						sp_player_id = 0

						repeat
							sp_player_id = sp_player_id + 1
						until sampIsPlayerConnected(sp_player_id)

						sampSendChat(string.format("/sp %d", sp_player_id))
					end
				elseif isKeyJustPressed(var_0_5[sp_prev_id_key]) and not sampIsChatInputActive() then
					sp_player_id = tonumber(sp_player_id)

					if sp_player_id >= 1 then
						repeat
							sp_player_id = sp_player_id - 1

							if sp_player_id == 0 and not sampIsPlayerConnected(sp_player_id) then
								sp_player_id = 1000
							end
						until sampIsPlayerConnected(sp_player_id)

						sampSendChat(string.format("/sp %d", sp_player_id))
					else
						sp_player_id = 1000

						repeat
							sp_player_id = sp_player_id - 1
						until sampIsPlayerConnected(sp_player_id)

						sampSendChat(string.format("/sp %d", sp_player_id))
					end
				end
			end

			if audio_handle2Process == true and getAudioStreamState(audio_handle2) == -1 then
				releaseAudioStream(audio_handle2)

				audio_handle2Process = false
			end

			if isKeyJustPressed(var_0_5[main_menu_key]) and not sampIsChatInputActive() and not sampIsDialogActive(-1) then
				sampProcessChatInput("/at")
			end

			local var_1_347, var_1_348, var_1_349, var_1_350 = sampHasDialogRespond(713)

			if var_1_347 == true and var_0_24 ~= 0 then
				if var_1_348 == 1 then
					var_0_25 = true
				else
					var_0_24 = 0
				end
			end

			if var_0_25 == true then
				if player1_mbanned == false then
					if sampIsPlayerConnected(mban_id1) then
						mban_temp_nick = sampGetPlayerNickname(mban_id1)

						if mban_temp_nick == mban_nick1 then
							player1_mbanned = true

							sampSendChat(string.format("/ban %i %i %s", mban_id1, mban_amount, mban_reason))

							mban_tick = localClock()
						else
							player1_mbanned = true

							sampSendChat(string.format("/offban %s %i %s", mban_nick1, mban_amount, mban_reason))

							mban_tick = localClock()
						end
					else
						sampSendChat(string.format("/offban %s %i %s", mban_nick1, mban_amount, mban_reason))

						mban_tick = localClock()
						player1_mbanned = true
					end
				end

				if player2_mbanned == false and localClock() - mban_tick > 2 then
					if sampIsPlayerConnected(mban_id2) then
						mban_temp_nick = sampGetPlayerNickname(mban_id2)

						if mban_temp_nick == mban_nick2 then
							player2_mbanned = true

							sampSendChat(string.format("/ban %i %i %s", mban_id2, mban_amount, mban_reason))

							mban_tick = localClock()
						else
							player2_mbanned = true

							sampSendChat(string.format("/offban %s %i %s", mban_nick2, mban_amount, mban_reason))

							mban_tick = localClock()
						end
					else
						sampSendChat(string.format("/offban %s %i %s", mban_nick2, mban_amount, mban_reason))

						mban_tick = localClock()
						player2_mbanned = true
					end
				end

				if var_0_24 == 2 and player1_mbanned == true and player2_mbanned == true then
					var_0_23 = os.date("%H%M%S")
					var_0_24 = 0
				end

				if var_0_24 >= 3 then
					if player3_mbanned ~= true and localClock() - mban_tick > 2 then
						if sampIsPlayerConnected(mban_id3) then
							mban_temp_nick = sampGetPlayerNickname(mban_id3)

							if mban_temp_nick == mban_nick3 then
								sampSendChat(string.format("/ban %i %i %s", mban_id3, mban_amount, mban_reason))

								mban_tick = localClock()
								player3_mbanned = true
							else
								sampSendChat(string.format("/offban %s %i %s", mban_nick3, mban_amount, mban_reason))

								mban_tick = localClock()
								player3_mbanned = true
							end
						else
							sampSendChat(string.format("/offban %s %i %s", mban_nick3, mban_amount, mban_reason))

							mban_tick = localClock()
							player3_mbanned = true
						end
					end

					if var_0_24 == 3 and player1_mbanned == true and player2_mbanned == true and player3_mbanned == true then
						var_0_23 = os.date("%H%M%S")
						var_0_24 = 0
					end

					if var_0_24 == 4 and player4_mbanned ~= true and localClock() - mban_tick > 2 then
						if sampIsPlayerConnected(mban_id4) then
							mban_temp_nick = sampGetPlayerNickname(mban_id4)

							if mban_temp_nick == mban_nick4 then
								sampSendChat(string.format("/ban %i %i %s", mban_id4, mban_amount, mban_reason))
							else
								sampSendChat(string.format("/offban %s %i %s", mban_nick4, mban_amount, mban_reason))
							end
						else
							sampSendChat(string.format("/offban %s %i %s", mban_nick4, mban_amount, mban_reason))
						end

						var_0_23 = os.date("%H%M%S")
						var_0_24 = 0
					end
				end
			end

			if command_from_admin_chat_status == true then
				local var_1_351 = 0, var_1_104, adm_chat_cmd_player_id, adm_chat_cmd_player_name, term, reason, command, mark

				command_from_admin_chat_another_admin = false
				adm_chat_cmd_player_id, term, reason = string.match(adm_command, "/jail%s+(%d+)%s+(%d+)%s+(.+)")

				if adm_chat_cmd_player_id ~= nil and term ~= nil and reason ~= nil and admin_lvl >= 2 then
					if sampIsPlayerConnected(adm_chat_cmd_player_id) then
						command = "\xCF\xEE\xF1\xE0\xE4\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xF2\xFE\xF0\xFC\xEC\xF3"
						adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
						text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEF\xEE\xF1\xE0\xE4\xE8\xF2\xFC \xE2 \xF2\xFE\xF0\xFC\xEC\xF3 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

						message(text)

						var_1_351 = 15
						adm_chat_cmd_tick = localClock()
						var_1_104 = os.time()
					elseif admin_chat_notifications == true then
						adm_name = string.match(adm_name, "%a+")

						sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
					end
				else
					adm_chat_cmd_player_id = string.match(adm_command, "/unjail%s+(%d+)")

					if adm_chat_cmd_player_id ~= nil and admin_lvl >= 2 then
						if sampIsPlayerConnected(adm_chat_cmd_player_id) then
							command = "\xC2\xFB\xEF\xF3\xF1\xF2\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB"
							term = "-"
							reason = "-"
							adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
							text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xEF\xF3\xF1\xF2\xE8\xF2\xFC \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

							message(text)

							var_1_351 = 15
							adm_chat_cmd_tick = localClock()
							var_1_104 = os.time()
						elseif admin_chat_notifications == true then
							adm_name = string.match(adm_name, "%a+")

							sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
						end
					else
						adm_chat_cmd_player_id = string.match(adm_command, "/unmute%s+(%d+)")

						if adm_chat_cmd_player_id ~= nil and admin_lvl >= 2 then
							if sampIsPlayerConnected(adm_chat_cmd_player_id) then
								command = "\xD1\xED\xFF\xEB \xF3 \xE8\xE3\xF0\xEE\xEA\xE0 \xE7\xE0\xF2\xFB\xF7\xEA\xF3"
								term = "-"
								reason = "-"
								adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
								text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF1\xED\xFF\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xF3 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

								message(text)

								var_1_351 = 15
								adm_chat_cmd_tick = localClock()
								var_1_104 = os.time()
							elseif admin_chat_notifications == true then
								adm_name = string.match(adm_name, "%a+")

								sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
							end
						else
							adm_chat_cmd_player_id, reason = string.match(adm_command, "/kick%s+(%d+)%s+(.+)")

							if adm_chat_cmd_player_id ~= nil and reason ~= nil and admin_lvl >= 2 then
								if sampIsPlayerConnected(adm_chat_cmd_player_id) then
									command = "\xCA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0"
									term = "-"
									adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
									text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEA\xE8\xEA\xED\xF3\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

									message(text)

									var_1_351 = 15
									adm_chat_cmd_tick = localClock()
									var_1_104 = os.time()
								elseif admin_chat_notifications == true then
									adm_name = string.match(adm_name, "%a+")

									sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
								end
							else
								adm_chat_cmd_player_id, term = string.match(adm_command, "/mute%s+(%d+)%s+(%d+)")

								if adm_chat_cmd_player_id ~= nil and term ~= nil and admin_lvl >= 2 then
									if sampIsPlayerConnected(adm_chat_cmd_player_id) then
										command = "\xCF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xF3 \xE7\xE0\xF2\xFB\xF7\xEA\xF3"
										reason = string.match(adm_command, "/mute%s+%d+%s+%d+%s+(.+)")

										if reason == nil then
											reason = "-"
										end

										adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
										text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

										message(text)

										var_1_351 = 15
										adm_chat_cmd_tick = localClock()
										var_1_104 = os.time()
									elseif admin_chat_notifications == true then
										adm_name = string.match(adm_name, "%a+")

										sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
									end
								else
									adm_chat_cmd_player_id, reason = string.match(adm_command, "/warn%s+(%d+)%s+(.+)")

									if adm_chat_cmd_player_id ~= nil and reason ~= nil and admin_lvl >= 3 then
										if sampIsPlayerConnected(adm_chat_cmd_player_id) then
											command = "\xC2\xFB\xE4\xE0\xEB \xE8\xE3\xF0\xEE\xEA\xF3 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5"
											term = "-"
											adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
											text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

											message(text)

											var_1_351 = 15
											adm_chat_cmd_tick = localClock()
											var_1_104 = os.time()
										elseif admin_chat_notifications == true then
											adm_name = string.match(adm_name, "%a+")

											sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
										end
									else
										adm_chat_cmd_player_id, term, reason = string.match(adm_command, "/ban%s+(%d+)%s+(%d+)%s+(.+)")

										if adm_chat_cmd_player_id ~= nil and term ~= nil and reason ~= nil and admin_lvl >= 3 then
											if sampIsPlayerConnected(adm_chat_cmd_player_id) then
												command = "\xC7\xE0\xE1\xE0\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0"
												adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
												text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE7\xE0\xE1\xE0\xED\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

												message(text)

												var_1_351 = 15
												adm_chat_cmd_tick = localClock()
												var_1_104 = os.time()
											elseif admin_chat_notifications == true then
												adm_name = string.match(adm_name, "%a+")

												sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
											end
										else
											adm_chat_cmd_player_name, term, reason = string.match(adm_command, "/offmute%s+(%S+)%s+(%d+)%s+(.+)")

											if adm_chat_cmd_player_name ~= nil and term ~= nil and reason ~= nil and admin_lvl >= 3 then
												command = "\xCF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
												text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 {FFD700}%s{DCDCDC} \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

												message(text)

												var_1_351 = 15
												adm_chat_cmd_tick = localClock()
												var_1_104 = os.time()
											else
												adm_chat_cmd_player_name, term, reason = string.match(adm_command, "/offjail%s+(%S+)%s+(%d+)%s+(.+)")

												if adm_chat_cmd_player_name ~= nil and term ~= nil and reason ~= nil and admin_lvl >= 3 then
													command = "\xCF\xEE\xF1\xE0\xE4\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xF2\xFE\xF0\xFC\xEC\xF3 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
													text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEF\xEE\xF1\xE0\xE4\xE8\xF2\xFC \xEE\xF4\xF4\xEB\xE0\xE9\xED \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC} \xE2 \xF2\xFE\xF0\xFC\xEC\xF3", adm_name, adm_id, adm_chat_cmd_player_name)

													message(text)

													var_1_351 = 15
													adm_chat_cmd_tick = localClock()
													var_1_104 = os.time()
												else
													adm_chat_cmd_player_id = string.match(adm_command, "/skick%s+(%d+)")

													if adm_chat_cmd_player_id ~= nil and admin_lvl >= 3 then
														if sampIsPlayerConnected(adm_chat_cmd_player_id) then
															command = "\xCA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE1\xE5\xE7 \xF8\xF3\xEC\xE0"
															term = "-"
															reason = "-"
															adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
															text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xEA\xE8\xEA\xED\xF3\xF2\xFC {FFD700}%s[%d] {DCDCDC}\xE1\xE5\xE7 \xEB\xE8\xF8\xED\xE5\xE3\xEE \xF8\xF3\xEC\xE0.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

															message(text)

															var_1_351 = 15
															adm_chat_cmd_tick = localClock()
															var_1_104 = os.time()
														elseif admin_chat_notifications == true then
															adm_name = string.match(adm_name, "%a+")

															sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
														end
													else
														adm_chat_cmd_player_id = string.match(adm_command, "/hp%s+(%d+)%s+%d+")

														if adm_chat_cmd_player_id ~= nil and admin_lvl >= 4 then
															if sampIsPlayerConnected(adm_chat_cmd_player_id) then
																command = "\xC8\xE7\xEC\xE5\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xF3 HP"
																term = "-"
																reason = "-"
																adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
																text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE8\xE7\xEC\xE5\xED\xE8\xF2\xFC HP \xE8\xE3\xF0\xEE\xEA\xF3 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

																message(text)

																var_1_351 = 15
																adm_chat_cmd_tick = localClock()
																var_1_104 = os.time()
															elseif admin_chat_notifications == true then
																adm_name = string.match(adm_name, "%a+")

																sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
															end
														else
															adm_chat_cmd_player_id = string.match(adm_command, "/skin%s+(%d+)%s+%d+")

															if adm_chat_cmd_player_id ~= nil and admin_lvl >= 4 then
																if sampIsPlayerConnected(adm_chat_cmd_player_id) then
																	command = "\xC2\xFB\xE4\xE0\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE2\xF0\xE5\xEC. \xF1\xEA\xE8\xED"
																	term = "-"
																	reason = "-"
																	adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
																	text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xE4\xE0\xF2\xFC \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xE9 \xF1\xEA\xE8\xED \xE8\xE3\xF0\xEE\xEA\xF3 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

																	message(text)

																	var_1_351 = 15
																	adm_chat_cmd_tick = localClock()
																	var_1_104 = os.time()
																elseif admin_chat_notifications == true then
																	adm_name = string.match(adm_name, "%a+")

																	sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
																end
															else
																adm_chat_cmd_player_id = string.match(adm_command, "/unwarn%s+(%d+)")

																if adm_chat_cmd_player_id ~= nil and admin_lvl >= 4 then
																	if sampIsPlayerConnected(adm_chat_cmd_player_id) then
																		command = "\xD1\xED\xFF\xEB \xE8\xE3\xF0\xEE\xEA\xF3 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5"
																		term = "-"
																		reason = "-"
																		adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
																		text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF1\xED\xFF\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xF3 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

																		message(text)

																		var_1_351 = 15
																		adm_chat_cmd_tick = localClock()
																		var_1_104 = os.time()
																	elseif admin_chat_notifications == true then
																		adm_name = string.match(adm_name, "%a+")

																		sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
																	end
																else
																	adm_chat_cmd_player_name, term, reason = string.match(adm_command, "/offban%s+(%S+)%s+(%d+)%s+(.+)")

																	if adm_chat_cmd_player_name ~= nil and term ~= nil and reason ~= nil and admin_lvl >= 4 then
																		command = "\xC7\xE0\xE1\xE0\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
																		text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE7\xE0\xE1\xE0\xED\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC} \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

																		message(text)

																		var_1_351 = 15
																		adm_chat_cmd_tick = localClock()
																		var_1_104 = os.time()
																	else
																		adm_chat_cmd_player_name, reason = string.match(adm_command, "/offwarn%s+(%S+)%s+(.+)")

																		if adm_chat_cmd_player_name ~= nil and reason ~= nil and admin_lvl >= 4 then
																			command = "\xC2\xFB\xE4\xE0\xEB \xEF\xF0\xE5\xE4. \xE8\xE3\xF0\xEE\xEA\xF3 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
																			term = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] {DCDCDC}\xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 {FFD700}%s {DCDCDC}\xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/unban%s+%S+") and admin_lvl >= 4 then
																			adm_chat_cmd_player_name = string.match(adm_command, "/unban%s+(%S+)")
																			command = "\xD0\xE0\xE7\xE1\xE0\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0"
																			term = "-"
																			reason = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF0\xE0\xE7\xE1\xE0\xED\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/unmute%s+%S+") and admin_lvl >= 2 then
																			adm_chat_cmd_player_name = string.match(adm_command, "/unmute%s+(%S+)")
																			command = "\xD1\xED\xFF\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
																			term = "-"
																			reason = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF1\xED\xFF\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC} \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/unwarn%s+%S+") and admin_lvl >= 4 then
																			adm_chat_cmd_player_name = string.match(adm_command, "/unwarn%s+(%S+)")
																			command = "\xD1\xED\xFF\xEB \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
																			term = "-"
																			reason = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF1\xED\xFF\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC} \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/unjail%s+%S+") and admin_lvl >= 2 then
																			adm_chat_cmd_player_name = string.match(adm_command, "/unjail%s+(%S+)")
																			command = "\xC2\xFB\xEF\xF3\xF1\xF2\xE8\xEB \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5"
																			term = "-"
																			reason = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xEF\xF3\xF1\xF2\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s{DCDCDC} \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5.", adm_name, adm_id, adm_chat_cmd_player_name)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/msg%s+.+") and admin_lvl >= 4 then
																			msg_text = string.match(adm_command, "/msg%s+%d+%s+(.+)")
																			reason = msg_text
																			command = "\xCE\xE1\xF9. \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xE5"
																			term = "-"
																			adm_chat_cmd_player_name = "-"
																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xF5\xEE\xF7\xE5\xF2 \xF1\xE4\xE5\xEB\xE0\xF2\xFC \xEE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5.", adm_name, adm_id)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		elseif string.match(adm_command, "/areg%s+%S+") and admin_lvl >= 3 then
																			command = "\xC7\xE0\xEF\xF0\xEE\xF1\xE8\xEB \xF0\xE5\xE3. \xE4\xE0\xED\xED\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE0"
																			term = "-"
																			reason = "-"
																			adm_chat_cmd_player_id = string.match(adm_command, "/areg%s+(%d+)")

																			if adm_chat_cmd_player_id ~= nil then
																				if sampIsPlayerConnected(adm_chat_cmd_player_id) then
																					adm_chat_cmd_player_name = sampGetPlayerNickname(adm_chat_cmd_player_id)
																				elseif admin_chat_notifications == true then
																					adm_name = string.match(adm_name, "%a+")

																					sampSendChat(string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 ID \"%d\" \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.", adm_name, adm_chat_cmd_player_id))
																				end
																			else
																				adm_chat_cmd_player_name = string.match(adm_command, "/areg%s+(%S+)")
																				adm_chat_cmd_player_id = -1
																			end

																			text = string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%d] \xE7\xE0\xEF\xF0\xE0\xF8\xE8\xE2\xE0\xE5\xF2 \xF0\xE5\xE3. \xF0\xE0\xED\xED\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE0 {FFD700}%s[%d]{DCDCDC}.", adm_name, adm_id, adm_chat_cmd_player_name, adm_chat_cmd_player_id)

																			message(text)

																			var_1_351 = 15
																			adm_chat_cmd_tick = localClock()
																			var_1_104 = os.time()
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end

				if var_1_351 ~= 0 then
					local var_1_352 = 0

					if adm_chat_cmd_player_name ~= nil and not string.find(adm_command, "/skin") and not string.find(adm_command, "/hp") and not string.find(adm_command, "/unmute") and not string.find(adm_command, "/unwarn") and not string.find(adm_command, "/unban") and not string.find(adm_command, "/msg") and not string.find(adm_command, "/areg") and not string.find(adm_command, "/unjail") then
						local var_1_353 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "r")

						repeat
							local var_1_354 = var_1_353:read()

							if var_1_354 ~= nil then
								local var_1_355 = string.match(var_1_354, "%S+")

								if adm_chat_cmd_player_name == var_1_355 then
									var_1_352 = 1

									break
								end
							end
						until var_1_354 == nil

						io.close(var_1_353)
					end

					if var_1_352 == 0 then
						text = "\xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 \xEF\xEE\xE4\xF2\xE2\xE5\xF0\xE6\xE4\xE5\xED\xE8\xFF."

						message(text)

						command_from_admin_chat_confirm_status = true

						if sound == true then
							audio_handle2 = loadAudioStream("moonloader\\AdminTools\\data\\audio\\notification.mp3")

							if audio_handle2 then
								setAudioStreamState(audio_handle2, 1)

								audio_handle2Process = true
							end
						end
					else
						message("{EE0000}\xC2\xED\xE8\xEC\xE0\xED\xE8\xE5! \xD3\xEA\xE0\xE7\xE0\xED ID \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0!")
					end
				end

				command_from_admin_chat_status = false
			end

			if command_from_admin_chat_confirm_status == true and isKeyJustPressed(var_0_5[admin_chat_confirm_key]) and not sampIsChatInputActive() and command_from_admin_chat_another_admin == false then
				local var_1_356 = io.open("moonloader\\AdminTools\\logs\\adm_chat_cmds_log.html", "a")

				var_1_356:write(string.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", os.date("%d.%m.%Y %H:%M:%S"), adm_name, adm_chat_cmd_player_name, command, term, reason))
				io.close(var_1_356)

				if string.find(adm_command, "/skin") or string.find(adm_command, "/hp") then
					sampSendChat(adm_command)

					if admin_chat_notifications == true then
						local var_1_357 = string.match(adm_name, "%a+")

						sampSendChat(string.format("/a %s, \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE8\xEC\xE5\xED\xE5\xED\xE0.", var_1_357))
					end
				elseif string.find(adm_command, "/unban") or string.find(adm_command, "/unwarn") or string.find(adm_command, "/unmute") or string.find(adm_command, "/unjail") then
					sampSendChat(adm_command)
				elseif string.find(adm_command, "/mute") or string.find(adm_command, "/jail") or string.find(adm_command, "/kick") or string.find(adm_command, "/skick") or string.find(adm_command, "/ban") or string.find(adm_command, "/warn") or string.find(adm_command, "/offban") or string.find(adm_command, "/offwarn") or string.find(adm_command, "/offmute") or string.find(adm_command, "/offjail") then
					if comm_from_adm_chat_notice_mode == 1 then
						if string.find(adm_command, "/mute") then
							if string.match(adm_command, "/mute%s+%d+%s+%d+%s+(.+)") == nil then
								sampSendChat(adm_command)
							else
								local var_1_358, var_1_359 = string.match(adm_name, "(%a)%a+_(%a+)")

								sampSendChat(string.format("%s \x95 %s. %s", adm_command, var_1_358, var_1_359))
							end
						else
							local var_1_360, var_1_361 = string.match(adm_name, "(%a)%a+_(%a+)")

							sampSendChat(string.format("%s \x95 %s. %s", adm_command, var_1_360, var_1_361))
						end
					elseif comm_from_adm_chat_notice_mode == 2 and not string.find(adm_command, "/offban") and not string.find(adm_command, "/offwarn") and not string.find(adm_command, "/offmute") and not string.find(adm_command, "/offjail") then
						sampSendChat(string.format("/ans %d \xCD\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE2\xFB\xE4\xE0\xED\xEE \xEF\xEE \xEF\xF0\xEE\xF1\xFC\xE1\xE5 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0 %s.", adm_chat_cmd_player_id, adm_name))
						sampSendChat(adm_command)
					end
				elseif string.find(adm_command, "/msg") then
					if adm_nick_in_msg then
						local var_1_362, var_1_363 = string.match(adm_name, "(%a)%a+_(%a+)")

						sampSendChat(string.format("%s \x95 %s. %s", adm_command, var_1_362, var_1_363))
					else
						sampSendChat(adm_command)
					end
				elseif string.find(adm_command, "/areg") then
					sampProcessChatInput(adm_command)
				end

				if admin_chat_notifications == true then
					adm_comm_tick = localClock()
				end

				command_from_admin_chat_confirm_status = false
			elseif localClock() - adm_chat_cmd_tick > 10 and command_from_admin_chat_confirm_status == true then
				text = "\xC2\xF0\xE5\xEC\xFF \xEE\xE6\xE8\xE4\xE0\xED\xE8\xFF \xE8\xF1\xF2\xE5\xEA\xEB\xEE."

				message(text)

				command_from_admin_chat_confirm_status = false
			elseif command_from_admin_chat_another_admin == true and command_from_admin_chat_confirm_status == true then
				text = "\xCA\xEE\xEC\xE0\xED\xE4\xF3 \xE2\xFB\xEF\xEE\xEB\xED\xE8\xEB \xE4\xF0\xF3\xE3\xEE\xE9 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0."

				message(text)

				command_from_admin_chat_another_admin = false
				command_from_admin_chat_confirm_status = false
			end

			if change_pip == true then
				local var_1_364, var_1_365 = getCursorPos()

				pip_x_pos, pip_y_pos = convertWindowScreenCoordsToGameScreenCoords(var_1_364, var_1_365)

				if isKeyJustPressed(1) then
					change_pip = false

					local var_1_366 = var_0_0.load(var_1_72, "moonloader\\config\\AdminTools\\config.ini")

					var_1_366.player_info_panel.xpos = pip_x_pos
					var_1_366.player_info_panel.ypos = pip_y_pos

					var_0_0.save(var_1_366, "AdminTools\\config.ini")
				end
			end

			if change_ping_chart == true then
				local var_1_367, var_1_368 = getCursorPos()

				ping_chart_x_pos, ping_chart_y_pos = convertWindowScreenCoordsToGameScreenCoords(var_1_367, var_1_368)

				if isKeyJustPressed(1) then
					change_ping_chart = false

					local var_1_369 = var_0_0.load(var_1_72, "moonloader\\config\\AdminTools\\config.ini")

					var_1_369.player_info_panel.ping_chart_xpos = ping_chart_x_pos
					var_1_369.player_info_panel.ping_chart_ypos = ping_chart_y_pos

					var_0_0.save(var_1_369, "AdminTools\\config.ini")
				end
			end

			if sampIsChatVisible() then
				local var_1_370 = var_0_1.setint8(12216169, 1, false)
				local var_1_371 = var_0_1.setint8(12216172, 0, false)
			else
				local var_1_372 = var_0_1.setint8(12216169, 0, false)
				local var_1_373 = var_0_1.setint8(12216172, 2, false)
			end

			if askick_player_connected == true and askick_status == true and sampIsPlayerConnected(askick_player_id) and sampGetPlayerNickname(askick_player_id) == askick_player_nickname and sampGetPlayerScore(askick_player_id) > 0 then
				askick_player_connected = false
				askick_player_connected2 = true
				askick_logged_counter = os.clock()
			end

			if askick_player_connected2 == true and os.clock() - askick_logged_counter > 10 and sampIsPlayerConnected(askick_player_id) and askick_status == true and sampGetPlayerNickname(askick_player_id) == askick_player_nickname then
				askick_player_kicked = true

				sampSendChat(string.format("/skick %i", askick_player_id))

				askick_player_connected2 = false
			end

			if wasKeyReleased(var_0_5[fast_command_menu_key]) and not show_main_window.v and fast_commands_dialog_status then
				fast_commands_dialog.v = not fast_commands_dialog.v
				fast_commands_dialog_status = true
			end

			if show_main_window.v == false and sampTextdrawIsExists(420) then
				sampTextdrawDelete(420)
			end

			imgui.Process = show_main_window.v or fast_commands_dialog_status or reg_window.v or forum_window.v or register_window.v or update_window.v or ban_window.v or warn_window.v or jail_window.v or kick_window.v or rban_window.v or mute_window.v
			imgui.ShowCursor = false

			if os.clock() > ping_history_cleanup_tick + 15 then
				for iter_1_28, iter_1_29 in ipairs(ping_list) do
					if os.clock() > iter_1_29.update_tick + 15 then
						ping_list[iter_1_28] = nil
					end
				end

				ping_history_cleanup_tick = os.clock()
			end

			if isPlayerControlLocked() then
				lockPlayerControl(false)
			end

			if mute_window.v == false and ban_window.v == false and warn_window.v == false and jail_window.v == false and kick_window.v == false and window_open == true then
				window_open = false
			end

			if inSrvMsgHookCmd ~= nil then
				sampSendChat(inSrvMsgHookCmd)

				inSrvMsgHookCmd = nil
			end

			if togphonehookcmd then
				sampSendChat("/togphone")

				togphonehookcmd = nil
			end

			if saveEdited then
				local var_1_374 = EditBoxBuffer.v

				repeat
					local var_1_375, var_1_376 = string.find(var_1_374, "\n")

					if var_1_375 and var_1_376 then
						local var_1_377 = string.sub(var_1_374, 1, var_1_375 - 1)

						var_1_374 = string.sub(var_1_374, var_1_375 + 1, #var_1_374)
					else
						return false
					end
				until false

				saveEdited = false
			end
		end
	end
end

function message(arg_2_0)
	sampAddChatMessage("{FFA500}[AdminTools] {E8E8E8}" .. arg_2_0, 15263976)
end

function menu()
	if not fast_commands_dialog.v and not mute_window.v and not warn_window.v and not jail_window.v and not kick_window.v and not ban_window.v and not rban_window.v then
		show_main_window.v = not show_main_window.v

		getpunishments()
	end
end

function sampOnSetPlayerHealth(arg_4_0)
	if godmode == true then
		if var_0_34 == false then
			var_0_34 = true
		elseif arg_4_0 < 5 then
			return false
		end
	end
end

function sampOnTextDrawSetString(arg_5_0)
	if arg_5_0 == 7 and teleport_anticheat_upd_notice == true then
		message("\xD1\xF2\xF0\xEE\xEA\xE0 \xE0\xED\xF2\xE8\xF7\xE8\xF2\xE0 \xED\xE0 \xE1\xFB\xF1\xF2\xF0\xEE\xE5 \xEF\xE5\xF0\xE5\xEC\xE5\xF9\xE5\xED\xE8\xE5 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE0!")
	elseif arg_5_0 == 14 and gun_anticheat_upd_notice == true then
		message("\xD1\xF2\xF0\xEE\xEA\xE0 \xE0\xED\xF2\xE8\xF7\xE8\xF2\xE0 \xED\xE0 \xEE\xF0\xF3\xE6\xE8\xE5 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE0!")
	end
end

function sampOnDeathMessage(arg_6_0, arg_6_1, arg_6_2)
	if sampIsPlayerConnected(arg_6_0) and sampIsPlayerConnected(arg_6_1) and capture_warns_counter then
		local var_6_0 = sampGetPlayerNickname(arg_6_1)
		local var_6_1 = sampGetPlayerNickname(arg_6_0)
		local var_6_2 = false

		for iter_6_0, iter_6_1 in ipairs(killedOnCapture) do
			if string.lower(var_6_0) == string.lower(iter_6_1) then
				var_6_2 = true

				message(string.format("%s[%d] - \xE1\xFB\xEB \xF3\xE1\xE8\xF2 \xF0\xE0\xED\xE5\xE5 (\xEF\xEE\xE4\xEE\xE7\xF0\xE5\xED\xE8\xE5 \xED\xE0 RK).", var_6_0, arg_6_1))

				break
			elseif string.lower(var_6_1) == string.lower(iter_6_1) then
				message(string.format("%s[%d] - \xE1\xFB\xEB \xF3\xE1\xE8\xF2 \xF0\xE0\xED\xE5\xE5 \xE8 \xF1\xEE\xE2\xE5\xF0\xF8\xE8\xEB \xF3\xE1\xE8\xE9\xF1\xF2\xE2\xEE (\xEF\xEE\xE4\xEE\xE7\xF0\xE5\xED\xE8\xE5 \xED\xE0 RK).", var_6_1, arg_6_0))

				break
			end
		end

		if var_6_2 == false then
			table.insert(killedOnCapture, var_6_0)
		end

		if doesFileExist("moonloader\\AdminTools\\logs\\killList_log.txt") then
			if gangs == nil then
				gangs = "-"
			end

			local var_6_3 = string.format("[%s] %s\t| %s \xF3\xE1\xE8\xEB %s.\n", os.date("%d.%m.%Y %H:%M:%S"), gangs, var_6_1, var_6_0)
			local var_6_4 = io.open("moonloader\\AdminTools\\logs\\killList_log.txt", "a")

			var_6_4:write(var_6_3)
			io.close(var_6_4)
		end

		local var_6_5 = io.open("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt", "a")

		if var_6_5 then
			var_6_5:write(string.format("[%s] %s[%d] \xF3\xE1\xE8\xEB(\xE0) %s[%d].\n", os.date("%H:%M:%S"), var_6_1, arg_6_0, var_6_0, arg_6_1))
			io.close(var_6_5)
		end
	end
end

function history(arg_7_0)
	if string.match(arg_7_0, "%d") then
		local var_7_0, var_7_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		if sampIsPlayerConnected(arg_7_0) then
			local var_7_2 = sampGetPlayerNickname(arg_7_0)

			sampSendChat(string.format("/history %s", var_7_2))
		elseif string.match(arg_7_0, var_7_1) then
			local var_7_3 = sampGetPlayerNickname(var_7_1)

			sampSendChat(string.format("/history %s", var_7_3))
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /hist [ID \xE8\xE3\xF0\xEE\xEA\xE0]."

		message(text)
	end
end

function get(arg_8_0)
	if admin_lvl >= 3 then
		if string.match(arg_8_0, "%d") then
			local var_8_0, var_8_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

			if sampIsPlayerConnected(arg_8_0) then
				name = sampGetPlayerNickname(arg_8_0)

				sampSendChat(string.format("/get %s", name))
			elseif string.match(arg_8_0, var_8_1) then
				name = sampGetPlayerNickname(var_8_1)

				sampSendChat(string.format("/get %s", name))
			else
				text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

				message(text)
			end
		else
			text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /iget [ID \xE8\xE3\xF0\xEE\xEA\xE0]."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function ilog(arg_9_0)
	if admin_lvl >= 2 then
		if string.match(arg_9_0, "%d") then
			local var_9_0, var_9_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

			if sampIsPlayerConnected(arg_9_0) then
				name = sampGetPlayerNickname(arg_9_0)

				sampSendChat(string.format("/log %s", name))
			elseif string.match(arg_9_0, var_9_1) then
				name = sampGetPlayerNickname(var_9_1)

				sampSendChat(string.format("/log %s", name))
			else
				text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

				message(text)
			end
		else
			text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /ilog [ID \xE8\xE3\xF0\xEE\xEA\xE0]."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 2 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function iskill(arg_10_0)
	if string.match(arg_10_0, "%d") then
		local var_10_0, var_10_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		if sampIsPlayerConnected(arg_10_0) then
			name = sampGetPlayerNickname(arg_10_0)

			sampSendChat(string.format("/askill %s", name))
		elseif string.match(arg_10_0, var_10_1) then
			name = sampGetPlayerNickname(var_10_1)

			sampSendChat(string.format("/askill %s", name))
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /iskill [ID \xE8\xE3\xF0\xEE\xEA\xE0]."

		message(text)
	end
end

function forum()
	if not check_forum_in_progress then
		check_forum_in_progress = true
		text = "\xCF\xEE\xEB\xF3\xF7\xE5\xED\xE8\xE5 \xF1\xEF\xE8\xF1\xEA\xE0 \xED\xE0\xE7\xE2\xE0\xED\xE8\xE9 \xF2\xE5\xEC \xF1 \xF4\xEE\xF0\xF3\xEC\xE0..."

		message(text)

		local var_11_0
		local var_11_1 = sampGetCurrentServerName()

		if string.match(var_11_1, "Green") then
			var_11_0 = 58
			var_11_1 = "Green"
		elseif string.match(var_11_1, "Yellow") then
			var_11_0 = 102
			var_11_1 = "Yellow"
		elseif string.match(var_11_1, "Orange") then
			var_11_0 = 159
			var_11_1 = "Orange"
		elseif string.match(var_11_1, "Blue") then
			var_11_0 = 213
			var_11_1 = "Blue"
		elseif string.match(var_11_1, "White") then
			var_11_0 = 260
			var_11_1 = "White"
		elseif string.match(var_11_1, "Silver") then
			var_11_0 = 304
			var_11_1 = "Silver"
		elseif string.match(var_11_1, "Purple") then
			var_11_0 = 391
			var_11_1 = "Purple"
		elseif string.match(var_11_1, "Chocolate") then
			var_11_0 = 460

			local var_11_2 = "Chocolate"
		else
			var_11_0 = 15

			local var_11_3 = "Red"
		end

		async_http_request("GET", string.format("https://forum.advance-rp.ru/forums/\xC6\xE0\xEB\xEE\xE1\xFB-\xED\xE0-\xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFE.%d/index.rss", var_11_0), nil, function(arg_12_0)
			forumTitle = {}
			forumCreator = {}
			forumComments = {}

			local var_12_0 = arg_12_0.text
			local var_12_1, var_12_2 = string.find(var_12_0, "<title>")

			if var_12_1 and var_12_2 then
				local var_12_3, var_12_4 = string.find(var_12_0, "</title>")
				local var_12_5 = string.sub(var_12_0, var_12_2 + 1, var_12_3 - 1)

				var_12_0 = string.sub(var_12_0, var_12_4, #var_12_0)
			end

			repeat
				local var_12_6, var_12_7 = string.find(var_12_0, "<title>")

				if var_12_6 and var_12_7 then
					local var_12_8, var_12_9 = string.find(var_12_0, "</title>")
					local var_12_10 = string.sub(var_12_0, var_12_7 + 1, var_12_8 - 1)

					var_12_0 = string.sub(var_12_0, var_12_9, #var_12_0)

					table.insert(forumTitle, var_12_10)
				end

				local var_12_11, var_12_12 = string.find(var_12_0, "<dc:creator>")

				if var_12_11 and var_12_12 then
					local var_12_13, var_12_14 = string.find(var_12_0, "</dc:creator>")
					local var_12_15 = string.sub(var_12_0, var_12_12 + 1, var_12_13 - 1)

					var_12_0 = string.sub(var_12_0, var_12_14, #var_12_0)

					table.insert(forumCreator, var_12_15)
				end

				local var_12_16, var_12_17 = string.find(var_12_0, "<slash:comments>")
				local var_12_18 = var_12_17

				if var_12_16 and var_12_18 then
					local var_12_19, var_12_20 = string.find(var_12_0, "</slash:comments>")
					local var_12_21 = string.sub(var_12_0, var_12_18 + 1, var_12_19 - 1)

					var_12_0 = string.sub(var_12_0, var_12_20, #var_12_0)

					table.insert(forumComments, var_12_21)
				end

				if not string.find(var_12_0, "<slash:comments>") and not string.find(var_12_0, "<dc:creator>") and not string.find(var_12_0, "<title>") then
					break
				end
			until false

			check_forum_in_progress = false
			forum_window.v = not forum_window.v
		end, function(arg_13_0)
			print(arg_13_0)
			message("\xCE\xF8\xE8\xE1\xEA\xE0: " .. arg_13_0)

			check_forum_in_progress = false
		end)
	end
end

function reg(arg_14_0)
	if not check_reg and not check_areg then
		if admin_lvl >= 3 then
			local var_14_0 = string.match(arg_14_0, "%d+")

			if var_14_0 ~= nil then
				local var_14_1, var_14_2 = sampGetPlayerIdByCharHandle(PLAYER_PED)
				local var_14_3 = tonumber(var_14_2)
				local var_14_4 = tonumber(var_14_0)

				if sampIsPlayerConnected(var_14_4) then
					if reg_window.v then
						reg_window.v = not reg_window.v
					end

					reg_nickname = sampGetPlayerNickname(var_14_4)
					reg_player_id = var_14_4
					check_reg = true
					check_reg_areg_in_progress = true
				elseif var_14_4 == var_14_3 then
					if reg_window.v then
						reg_window.v = not reg_window.v
					end

					reg_nickname = sampGetPlayerNickname(var_14_4)
					reg_player_id = var_14_4
					check_reg = true
					check_reg_areg_in_progress = true
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

					message(text)
				end
			elseif string.find(arg_14_0, "%D+") then
				if reg_window.v then
					reg_window.v = not reg_window.v
				end

				reg_nickname = arg_14_0
				reg_player_id = -1
				check_reg = true
				check_reg_areg_in_progress = true
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /reg [ID \xE8\xE3\xF0\xEE\xEA\xE0] \xE8\xEB\xE8 [\xED\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0]."

				message(text)
			end
		else
			text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

			message(text)
		end
	end
end

function areg(arg_15_0)
	if not check_reg and not check_areg then
		if admin_lvl >= 3 then
			local var_15_0 = string.match(arg_15_0, "%d+")

			if var_15_0 ~= nil then
				local var_15_1, var_15_2 = sampGetPlayerIdByCharHandle(PLAYER_PED)
				local var_15_3 = tonumber(var_15_2)
				local var_15_4 = tonumber(var_15_0)

				if sampIsPlayerConnected(var_15_4) then
					if reg_window.v then
						reg_window.v = not reg_window.v
					end

					reg_nickname = sampGetPlayerNickname(var_15_4)
					reg_player_id = var_15_4
					check_areg = true
					check_dist_areg = true
					check_reg_areg_in_progress = true
				elseif var_15_4 == var_15_3 then
					if reg_window.v then
						reg_window.v = not reg_window.v
					end

					reg_nickname = sampGetPlayerNickname(var_15_4)
					reg_player_id = var_15_4
					check_areg = true
					check_dist_areg = true
					check_reg_areg_in_progress = true
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

					message(text)
				end
			elseif string.find(arg_15_0, "%D+") then
				if reg_window.v then
					reg_window.v = not reg_window.v
				end

				reg_nickname = arg_15_0
				reg_player_id = -1
				check_areg = true
				check_dist_areg = true
				check_reg_areg_in_progress = true
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /areg [ID \xE8\xE3\xF0\xEE\xEA\xE0] \xE8\xEB\xE8 [\xED\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0]."

				message(text)
			end
		else
			text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

			message(text)
		end
	end
end

function utf8toansi(arg_16_0)
	local var_16_0 = var_0_2.new("wchar_t[?]", 1024)
	local var_16_1 = var_0_2.new("char[?]", 1024)
	local var_16_2 = var_0_2.new("int[?]", 1)

	var_0_2.C.MultiByteToWideChar(65001, 0, arg_16_0, #arg_16_0, var_16_0, 1024)
	var_0_2.C.WideCharToMultiByte(1251, 0, var_16_0, -1, var_16_1, 1024, nil, var_16_2)

	return var_0_2.string(var_16_1)
end

function ansitoutf8(arg_17_0)
	local var_17_0 = var_0_2.new("wchar_t[?]", 1024)
	local var_17_1 = var_0_2.new("char[?]", 1024)
	local var_17_2 = var_0_2.new("int[?]", 1)

	var_0_2.C.MultiByteToWideChar(1251, 0, arg_17_0, -1, var_17_0, 1024)
	var_0_2.C.WideCharToMultiByte(65001, 0, var_17_0, -1, var_17_1, 1024, nil, nil)

	return var_0_2.string(var_17_1)
end

function downloadProcess(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_0 == responseTxtDL and arg_18_1 == 58 then
		download_state = 0
	end
end

function download(arg_19_0, arg_19_1, arg_19_2)
	async_http_request(arg_19_0, arg_19_1, arg_19_2, function(arg_20_0)
		if arg_19_1 == "https://raw.githubusercontent.com/Garrus93/admintools/master/version.json" then
			local var_20_0 = decodeJson(arg_20_0.text)

			newVersionAT = var_20_0.version

			if var_20_0.version ~= thisScript().version then
				print("\xC4\xEE\xF1\xF2\xF3\xEF\xED\xEE \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE5 \xF1\xEA\xF0\xE8\xEF\xF2\xE0.")

				processDownloadChangelog = true
			else
				if menu_check_update then
					show_main_window.v = not show_main_window.v
				end

				print("\xC4\xEE\xF1\xF2\xF3\xEF\xED\xFB\xF5 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE9 \xED\xE5\xF2.")

				noupdatefound = true
			end
		elseif arg_19_1 == "https://raw.githubusercontent.com/Garrus93/admintools/master/changelog" then
			changelog = arg_20_0.text

			if not update_window.v then
				update_window.v = not update_window.v
			end
		elseif arg_19_1 == "https://raw.githubusercontent.com/Garrus93/admintools/master/AdminTools.luac" then
			local var_20_1 = assert(io.open("moonloader\\AdminTools.luac", "wb"))

			var_20_1:write(arg_20_0.text)
			var_20_1:close()
			print("\xCE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE5...")
			nameTagOff()
			thisScript():reload()
		elseif string.find(arg_19_1, "https://raw.githubusercontent.com/Garrus93/admintools/master/lib") then
			local var_20_2 = assert(io.open("moonloader\\" .. arg_19_2.data, "wb"))

			var_20_2:write(arg_20_0.text)
			var_20_2:close()

			download_state = 1
		end
	end, function(arg_21_0)
		print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE5:")
		print(arg_21_0)
	end)
end

function checkAWS()
	local var_22_0 = false
	local var_22_1, var_22_2 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_22_3 = sampGetPlayerNickname(var_22_2)
	local var_22_4 = tostring(var_22_3)
	local var_22_5 = aesEncrypt(webpass, var_22_4)
	local var_22_6 = getHmac(var_22_5) .. var_22_5
	local var_22_7 = {
		data = "action=check&username=" .. var_22_6,
		headers = {
			["content-type"] = "application/x-www-form-urlencoded"
		}
	}

	download("POST", thisScript().url .. "/auth.php", var_22_7)
end

function downloadNewVersion()
	local var_23_0 = false

	dwnIndexNewVersion = downloadUrlToFile("https://github.com/Garrus93/admintools/raw/master/AdminTools.luac", thisScript().path, function(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
		if arg_24_0 == dwnIndexNewVersion then
			if arg_24_1 == 4 then
				print("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xED\xEE\xE2\xEE\xE9 \xE2\xE5\xF0\xF1\xE8\xE8 \xF1\xEA\xF0\xE8\xEF\xF2\xE0 (" .. arg_24_2 .. " \xE1\xE0\xE9\xF2)...")

				var_23_0 = true
			elseif arg_24_1 == 58 then
				if var_23_0 then
					-- block empty
				else
					print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE5 \xED\xEE\xE2\xEE\xE9 \xE2\xE5\xF0\xF1\xE8\xE8 \xF1\xEA\xF0\xE8\xEF\xF2\xE0.")
				end

				startUpdateProccess = var_23_0
			elseif arg_24_1 == 6 then
				print(string.format("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2.", arg_24_2, arg_24_3))
			elseif arg_24_1 == 5 then
				print(string.format("\xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2.", arg_24_2, arg_24_3))
			end
		end
	end)
end

function downloadChangelog()
	local var_25_0 = false

	dwnChangelog = downloadUrlToFile("https://github.com/Garrus93/admintools/raw/master/changelog", __CHANGELOG, function(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
		if arg_26_0 == dwnChangelog then
			if arg_26_1 == 4 then
				print("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xF1\xEF\xE8\xF1\xEA\xE0 \xE8\xE7\xEC\xE5\xED\xE5\xED\xE8\xE9 (" .. arg_26_2 .. " \xE1\xE0\xE9\xF2)...")

				var_25_0 = true
			elseif arg_26_1 == 58 then
				if var_25_0 then
					-- block empty
				else
					print("\xCF\xF0\xEE\xE8\xE7\xEE\xF8\xEB\xE0 \xEE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE5 \xF1\xEF\xE8\xF1\xEA\xE0 \xE8\xE7\xEC\xE5\xED\xE5\xED\xE8\xE9.")
				end

				showUpdateDialog = var_25_0
			elseif arg_26_1 == 6 then
				print(string.format("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2.", arg_26_2, arg_26_3))
			elseif arg_26_1 == 5 then
				print(string.format("\xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2.", arg_26_2, arg_26_3))
			end
		end
	end)
end

function getcar(arg_27_0)
	if string.match(arg_27_0, "%d") then
		local var_27_0, var_27_1 = sampGetCarHandleBySampVehicleId(arg_27_0)

		if doesVehicleExist(var_27_1) then
			local var_27_2 = getCarModel(var_27_1)

			if getDriverOfCar(var_27_1) == -1 then
				local var_27_3, var_27_4, var_27_5 = getCharCoordinates(PLAYER_PED)

				sampSendEnterVehicle(arg_27_0, false)
				warpCharIntoCar(PLAYER_PED, var_27_1)
				restoreCameraJumpcut()
				setCarCoordinates(var_27_1, var_27_3, var_27_4, var_27_5)
			else
				text = "\xCD\xE5\xEB\xFC\xE7\xFF \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC\xF1\xFF \xE2 \xD2\xD1 \xF1 \xE8\xE3\xF0\xEE\xEA\xEE\xEC."

				message(text)
			end
		else
			text = "\xD2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xED\xEE\xE3\xEE \xF1\xF0\xE5\xE4\xF1\xF2\xE2\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xE2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8 \xED\xE5\xF2."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /getcar [ID \xF2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xED\xEE\xE3\xEE \xF1\xF0\xE5\xE4\xF1\xF2\xE2\xE0]."

		message(text)
	end
end

function ilip(arg_28_0)
	if admin_lvl >= 3 then
		local var_28_0 = string.match(arg_28_0, "%d+")

		LipIP = string.match(arg_28_0, "(%d+.%d+.%d+.%d+)")

		if var_28_0 ~= nil and LipIP == nil then
			if sampIsPlayerConnected(var_28_0) then
				lip_player_nickname = sampGetPlayerNickname(var_28_0)
				var_0_31 = 0
				var_0_13 = true
			else
				text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

				message(text)
			end
		elseif arg_28_0 ~= "" then
			if LipIP ~= nil then
				var_0_14 = 2
			else
				lip_player_nickname = arg_28_0
			end

			var_0_31 = 0
			var_0_13 = true
		else
			text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /ilip [ID \xE8\xE3\xF0\xEE\xEA\xE0 / \xED\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0 / IP-\xE0\xE4\xF0\xE5\xF1]."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function lipbans(arg_29_0)
	if admin_lvl >= 3 then
		if var_0_12 == false then
			local var_29_0 = string.match(arg_29_0, "%d+")

			LipIP = string.match(arg_29_0, "(%d+.%d+.%d+.%d+)")

			if var_29_0 ~= nil and LipIP == nil then
				if sampIsPlayerConnected(var_29_0) then
					lip_player_nickname = sampGetPlayerNickname(var_29_0)
					var_0_31 = 0
					var_0_12 = true
					var_0_13 = true
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

					message(text)
				end
			elseif sp_IP ~= nil and LipIP == nil and arg_29_0 == "" then
				var_0_31 = 0
				LipIP = sp_IP
				var_0_12 = 2
				var_0_13 = true
			elseif arg_29_0 ~= "" then
				if LipIP ~= nil then
					var_0_14 = 2
				else
					lip_player_nickname = arg_29_0
				end

				var_0_31 = 0
				var_0_12 = true
				var_0_13 = true
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /lipbans [ID \xE8\xE3\xF0\xEE\xEA\xE0 / \xED\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0]."

				message(text)
			end
		else
			var_0_12 = false
			text = "\xCF\xF0\xEE\xE2\xE5\xF0\xEA\xE0 \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function apay(arg_30_0)
	if var_0_11 == false then
		apay_player_id, apay_summ = string.match(arg_30_0, "(%d+)%s+(%d+)")

		if apay_player_id ~= nil and apay_summ ~= nil then
			apay_player_id = tonumber(apay_player_id)
			apay_summ = tonumber(apay_summ)

			if sampIsPlayerConnected(apay_player_id) then
				result, actor = sampGetCharHandleBySampPlayerId(apay_player_id)

				if doesCharExist(actor) then
					if locateCharAnyMeansChar3d(PLAYER_PED, actor, 3, 3, 3, false) then
						var_0_11 = true
						var_0_27 = 0
					else
						text = "\xC8\xE3\xF0\xEE\xEA \xED\xE0\xF5\xEE\xE4\xE8\xF2\xF1\xFF \xF1\xEB\xE8\xF8\xEA\xEE\xEC \xE4\xE0\xEB\xE5\xEA\xEE."

						message(text)
					end
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2..."

					message(text)
				end
			else
				text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

				message(text)
			end
		else
			text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /apay [ID \xE8\xE3\xF0\xEE\xEA\xE0] [\xF1\xF3\xEC\xEC\xE0]."

			message(text)
		end
	else
		var_0_11 = false
		text = "\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xEF\xE5\xF0\xE5\xE4\xE0\xF7\xE8 \xE4\xE5\xED\xE5\xE3 \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

		message(text)
	end
end

function rskin(arg_31_0)
	if admin_lvl >= 4 then
		if var_0_15 == false then
			rskin_skin, rskin_radius = string.match(arg_31_0, "(%d+)%s+(%d+)")

			if rskin_skin ~= nil and rskin_radius ~= nil then
				rskin_skin = tonumber(rskin_skin)
				rskin_radius = tonumber(rskin_radius)

				if rskin_skin >= 1 and rskin_skin <= 311 and rskin_skin ~= 74 then
					if rskin_radius >= 3 and rskin_radius <= 80 then
						rskin_player_ids = sampGetMaxPlayerId(true)
						rskin_current_id = 0

						if ids ~= 0 then
							skin1_count = 0
							skin2_count = 0
							skin_case = 0
							rskin_s = 1
							var_0_28 = 0
							var_0_15 = true
						else
							text = "\xC2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xED\xE5\xF2."

							message(text)
						end
					else
						text = "\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xF0\xE0\xE4\xE8\xF3\xF1 \xEE\xF2 3 \xE4\xEE 80 \xEC\xE5\xF2\xF0\xEE\xE2."

						message(text)
					end
				else
					text = "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 ID \xF1\xEA\xE8\xED\xE0."

					message(text)
				end
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /rskin [ID \xF1\xEA\xE8\xED\xE0] [\xF0\xE0\xE4\xE8\xF3\xF1]."

				message(text)
			end
		else
			var_0_15 = false
			text = "\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function rskins(arg_32_0)
	if admin_lvl >= 4 then
		if var_0_16 == false then
			rskin_skin, rskin_skin2, rskin_radius = string.match(arg_32_0, "(%d+)%s+(%d+)%s+(%d+)")

			if rskin_skin ~= nil and rskin_skin2 ~= nil and rskin_radius ~= nil then
				rskin_skin = tonumber(rskin_skin)
				rskin_skin2 = tonumber(rskin_skin2)
				rskin_radius = tonumber(rskin_radius)

				if rskin_skin >= 1 and rskin_skin <= 311 and rskin_skin ~= 74 then
					if rskin_skin2 >= 1 and rskin_skin2 <= 311 and rskin_skin2 ~= 74 then
						if rskin_radius >= 3 and rskin_radius <= 80 then
							rskin_player_ids = sampGetMaxPlayerId(true)
							rskin_current_id = 0

							if ids ~= 0 then
								skin1_count = 0
								skin2_count = 0
								skin_case = 0
								rskin_s = 2
								var_0_28 = 0
								var_0_16 = true
							else
								text = "\xC2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xED\xE5\xF2."

								message(text)
							end
						else
							text = "\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xF0\xE0\xE4\xE8\xF3\xF1 \xEE\xF2 3 \xE4\xEE 80 \xEC\xE5\xF2\xF0\xEE\xE2."

							message(text)
						end
					else
						text = "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 ID \xE2\xF2\xEE\xF0\xEE\xE3\xEE \xF1\xEA\xE8\xED\xE0."

						message(text)
					end
				else
					text = "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 ID \xEF\xE5\xF0\xE2\xEE\xE3\xEE \xF1\xEA\xE8\xED\xE0."

					message(text)
				end
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /rskins [ID \xEF\xE5\xF0\xE2\xEE\xE3\xEE \xF1\xEA\xE8\xED\xE0] [ID \xE2\xF2\xEE\xF0\xEE\xE3\xEE \xF1\xEA\xE8\xED\xE0] [\xF0\xE0\xE4\xE8\xF3\xF1]."

				message(text)
			end
		else
			var_0_16 = false
			text = "\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function wwarns(arg_33_0)
	if admin_lvl >= 4 then
		wwarns_player_id, wwarns_reason = string.match(arg_33_0, "(%d+)%s+(.+)")

		if wwarns_player_id ~= nil and wwarns_reason ~= nil then
			if sampIsPlayerConnected(wwarns_player_id) then
				wwarns_player_nickname = sampGetPlayerNickname(wwarns_player_id)

				sampSendChat(string.format("/warn %d %s", wwarns_player_id, wwarns_reason))

				wwarns_tick = localClock()
				var_0_17 = true
			else
				text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

				message(text)
			end
		else
			text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /2warns [ID \xE8\xE3\xF0\xEE\xEA\xE0] [\xCF\xF0\xE8\xF7\xE8\xED\xE0]."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function carsp(arg_34_0)
	if admin_lvl >= 4 then
		if var_0_18 == false then
			rows, car_count, car_id, color1, color2 = string.match(arg_34_0, "(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)")

			if rows ~= nil and car_count ~= nil and car_id ~= nil and color1 ~= nil and color2 then
				rows = tonumber(rows)
				car_count = tonumber(car_count)
				car_id = tonumber(car_id)
				color1 = tonumber(color1)
				color2 = tonumber(color2)

				if car_id >= 400 and car_id <= 611 then
					if color1 >= 0 and color1 <= 255 and color2 >= 0 and color2 <= 255 then
						text = "\xC4\xEB\xFF \xEF\xF0\xE5\xF0\xFB\xE2\xE0\xED\xE8\xFF \xF1\xEF\xE0\xE2\xED\xE0 \xD2/\xD1, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 \xE5\xF9\xE5 \xF0\xE0\xE7."

						message(text)

						carsp_positionX, carsp_positionY, carsp_positionZ = getCharCoordinates(PLAYER_PED)
						carsp_X, carsp_Y, carsp_Z = carsp_positionX, carsp_positionY, carsp_positionZ
						carsp_tick = 0
						carsp_car_count = 1
						carsp_row_count = 1
						var_0_18 = true
					else
						text = "ID \xF6\xE2\xE5\xF2\xE0 \xD2/\xD1 \xE4\xEE\xEB\xE6\xED\xEE \xE1\xFB\xF2\xFC \xF0\xE0\xE2\xED\xEE \xEE\xF2 0 \xE4\xEE 255."

						message(text)
					end
				else
					text = "ID \xD2/\xD1 \xE4\xEE\xEB\xE6\xED\xEE \xE1\xFB\xF2\xFC \xF0\xE0\xE2\xED\xEE \xEE\xF2 400 \xE4\xEE 611."

					message(text)
				end
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /carsp [\xCA\xEE\xEB-\xE2\xEE \xF0\xFF\xE4\xEE\xE2] [\xCA\xEE\xEB-\xE2\xEE \xD2/\xD1 \xE2 \xF0\xFF\xE4\xF3] [ID \xD2/\xD1] [\xD6\xE2\xE5\xF2 1] [\xD6\xE2\xE5\xF2 2]."

				message(text)
			end
		else
			var_0_18 = false
			text = "\xD1\xEF\xE0\xE2\xED \xD2/\xD1 \xEF\xF0\xE5\xF0\xE2\xE0\xED."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function stp()
	if admin_lvl >= 3 then
		if var_0_19 == false then
			if sampGetMaxPlayerId(true) ~= 0 then
				var_0_19 = true
			else
				text = "\xC2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xED\xE5\xF2."

				message(text)
			end
		else
			var_0_19 = false
			text = "\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xF0\xE2\xE0\xED\xE0."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function askick(arg_36_0)
	local var_36_0

	if admin_lvl >= 3 then
		if askick_status == false then
			local var_36_1 = string.match(arg_36_0, "%d+")

			if var_36_1 ~= nil then
				if sampIsPlayerConnected(var_36_1) then
					askick_player_nickname = sampGetPlayerNickname(var_36_1)

					local var_36_2 = 0

					file = io.open("moonloader\\AdminTools\\checker\\admins.txt", "r")

					repeat
						text2 = file:read()

						if text2 ~= nil then
							local var_36_3 = string.match(text2, "%S+")

							if askick_player_nickname == var_36_3 then
								var_36_2 = 1

								break
							end
						end
					until text2 == nil

					io.close(file)

					if var_36_2 == 0 then
						local var_36_4 = sampGetPlayerScore(var_36_1)

						if var_36_4 < 15 and var_36_4 ~= 0 then
							askick_status = true
							text = string.format("\xC2\xFB \xE1\xF3\xE4\xE5\xF2\xE5 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xEA\xE8\xEA\xE0\xF2\xFC %s \xE1\xE5\xE7 \xEB\xE8\xF8\xED\xE5\xE3\xEE \xF8\xF3\xEC\xE0.", askick_player_nickname)

							message(text)

							askick_tick = os.clock()
							askick_counter = 0

							sampSendChat(string.format("/skick %i", var_36_1))
						else
							text = "\xC4\xE0\xED\xED\xF3\xFE \xEA\xEE\xEC\xE0\xED\xE4\xF3 \xED\xE5\xEB\xFC\xE7\xFF \xEF\xF0\xE8\xEC\xE5\xED\xE8\xF2\xFC \xED\xE0 \xE4\xE0\xED\xED\xEE\xEC \xE8\xE3\xF0\xEE\xEA\xE5."

							message(text)
						end
					else
						text = "\xC4\xE0\xED\xED\xF3\xFE \xEA\xEE\xEC\xE0\xED\xE4\xF3 \xED\xE5\xEB\xFC\xE7\xFF \xEF\xF0\xE8\xEC\xE5\xED\xE8\xF2\xFC \xED\xE0 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE5."

						message(text)
					end
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

					message(text)
				end
			else
				text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /askick [ID \xE8\xE3\xF0\xEE\xEA\xE0]."

				message(text)
			end
		else
			askick_status = false
			text = "\xD4\xF3\xED\xEA\xF6\xE8\xFF \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xEE\xE3\xEE \xEA\xE8\xEA\xE0 \xE8\xE3\xF0\xEE\xEA\xE0 \xE1\xE5\xE7 \xEB\xE8\xF8\xED\xE5\xE3\xEE \xF8\xF3\xEC\xE0 \xEE\xF2\xEA\xEB\xFE\xF7\xE5\xED\xE0."

			message(text)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function findd(arg_37_0)
	fraction_id = string.match(arg_37_0, "%d+")

	if fraction_id ~= nil then
		fraction_id = tonumber(fraction_id)

		if fraction_id > 0 and fraction_id <= 13 then
			var_0_30 = 0

			if fraction_id == 1 or fraction_id == 2 or fraction_id == 5 then
				min_podfrac = 1
				max_podfrac = 4
			elseif fraction_id == 3 or fraction_id == 4 then
				min_podfrac = 1
				max_podfrac = 3
			elseif fraction_id >= 6 and fraction_id <= 10 then
				min_podfrac = 6
				max_podfrac = 10
			elseif fraction_id >= 11 then
				min_podfrac = 11
				max_podfrac = 13
			end

			dialogText = ""
			temp_frac = min_podfrac
			var_0_20 = true
		else
			text = "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8. \xC4\xEE\xF1\xF2\xF3\xEF\xED\xFB\xE5 ID: 1-13."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /findd [ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8]."

		message(text)
	end
end

function afindd(arg_38_0)
	fraction_id = string.match(arg_38_0, "%d+")

	if fraction_id ~= nil then
		fraction_id = tonumber(fraction_id)

		if fraction_id > 0 and fraction_id <= 13 then
			afindd_tick = 0

			if fraction_id == 1 or fraction_id == 2 or fraction_id == 5 then
				min_podfrac = 1
				max_podfrac = 4
			elseif fraction_id == 3 or fraction_id == 4 then
				min_podfrac = 1
				max_podfrac = 3
			elseif fraction_id >= 6 and fraction_id <= 10 then
				min_podfrac = 6
				max_podfrac = 10
			elseif fraction_id >= 11 then
				min_podfrac = 11
				max_podfrac = 13
			end

			temp_frac = min_podfrac
			dialogText = ""
			var_0_21 = true
		else
			text = "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8. \xC4\xEE\xF1\xF2\xF3\xEF\xED\xFB\xE5 ID: 1-13."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /afindd [ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8]."

		message(text)
	end
end

function mban(arg_39_0)
	if admin_lvl >= 3 then
		if var_0_24 == 0 then
			mban_usage = os.date("%H%M%S")
			mban_last_usage_temp = mban_usage - var_0_23

			if mban_last_usage_temp > 60 then
				mban_id1, mban_id2, mban_id3, mban_id4, mban_amount, mban_reason = string.match(arg_39_0, "(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(.+)")

				if mban_id1 ~= nil and mban_id2 ~= nil and mban_id3 ~= nil and mban_id4 ~= nil and mban_amount ~= nil and mban_reason ~= nil then
					mban_id1 = tonumber(mban_id1)
					mban_id2 = tonumber(mban_id2)
					mban_id3 = tonumber(mban_id3)
					mban_id4 = tonumber(mban_id4)
					mban_amount = tonumber(mban_amount)

					if sampIsPlayerConnected(mban_id1) and sampIsPlayerConnected(mban_id2) and sampIsPlayerConnected(mban_id3) then
						player1_mbanned = false
						player2_mbanned = false
						player3_mbanned = false
						player4_mbanned = false
						mban_tick = 0
						var_0_25 = false
						var_0_24 = 4
					else
						text = "\xC8\xE3\xF0\xEE\xEA\xE0 (\xE8\xE3\xF0\xEE\xEA\xEE\xE2) \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

						message(text)
					end
				else
					mban_id1, mban_id2, mban_id3, mban_amount, mban_reason = string.match(arg_39_0, "(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(.+)")

					if mban_id1 ~= nil and mban_id2 ~= nil and mban_id3 ~= nil and mban_amount ~= nil and mban_reason ~= nil then
						mban_id1 = tonumber(mban_id1)
						mban_id2 = tonumber(mban_id2)
						mban_id3 = tonumber(mban_id3)
						mban_amount = tonumber(mban_amount)

						if sampIsPlayerConnected(mban_id1) and sampIsPlayerConnected(mban_id2) and sampIsPlayerConnected(mban_id3) then
							player1_mbanned = false
							player2_mbanned = false
							player3_mbanned = false
							var_0_25 = false
							mban_tick = 0
							var_0_24 = 3
						else
							text = "\xC8\xE3\xF0\xEE\xEA\xE0 (\xE8\xE3\xF0\xEE\xEA\xEE\xE2) \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

							message(text)
						end
					else
						mban_id1, mban_id2, mban_amount, mban_reason = string.match(arg_39_0, "(%d+)%s+(%d+)%s+(%d+)%s+(.+)")

						if mban_id1 ~= nil and mban_id2 ~= nil and mban_amount ~= nil and mban_reason ~= nil then
							mban_id1 = tonumber(mban_id1)
							mban_id2 = tonumber(mban_id2)
							mban_amount = tonumber(mban_amount)

							if sampIsPlayerConnected(mban_id1) and sampIsPlayerConnected(mban_id2) then
								player1_mbanned = false
								player2_mbanned = false
								var_0_25 = false
								mban_tick = 0
								var_0_24 = 2
							else
								text = "\xC8\xE3\xF0\xEE\xEA\xE0 (\xE8\xE3\xF0\xEE\xEA\xEE\xE2) \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

								message(text)
							end
						else
							text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /mban [ID1 ID2 .. ID4] [\xCA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xE4\xED\xE5\xE9] [\xCF\xF0\xE8\xF7\xE8\xED\xE0]"

							message(text)
						end
					end
				end
			else
				text = "\xC4\xE0\xED\xED\xF3\xFE \xEA\xEE\xEC\xE0\xED\xE4\xF3 \xED\xE5\xEB\xFC\xE7\xFF \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xEE\xE2\xE0\xF2\xFC \xF7\xE0\xF9\xE5, \xF7\xE5\xEC \xF0\xE0\xE7 \xE2 60 \xF1\xE5\xEA\xF3\xED\xE4."

				message(text)
			end
		end

		if var_0_24 ~= 0 and var_0_25 ~= true then
			if var_0_24 == 2 then
				mban_nick1 = sampGetPlayerNickname(mban_id1)
				mban_nick2 = sampGetPlayerNickname(mban_id2)
				dialogText = string.format("{DCDCDC}\xD1\xEB\xE5\xE4\xF3\xFE\xF9\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xE8 \xE1\xF3\xE4\xF3\xF2 \xE7\xE0\xE1\xE0\xED\xE5\xED\xFB \xED\xE0 {EE7600}%i \xE4\xED\xE5\xE9 {DCDCDC}\xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: {EE7600}\"%s\"{DCDCDC}. \xCF\xF0\xEE\xE4\xEE\xEB\xE6\xE8\xF2\xFC?\n\n\xCD\xE8\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2: {EE7600}%s[%i], %s[%i].", mban_amount, mban_reason, mban_nick1, mban_id1, mban_nick2, mban_id2)
			elseif var_0_24 == 3 then
				mban_nick1 = sampGetPlayerNickname(mban_id1)
				mban_nick2 = sampGetPlayerNickname(mban_id2)
				mban_nick3 = sampGetPlayerNickname(mban_id3)
				dialogText = string.format("{DCDCDC}\xD1\xEB\xE5\xE4\xF3\xFE\xF9\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xE8 \xE1\xF3\xE4\xF3\xF2 \xE7\xE0\xE1\xE0\xED\xE5\xED\xFB \xED\xE0 {EE7600}%i \xE4\xED\xE5\xE9 {DCDCDC}\xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: {EE7600}\"%s\"{DCDCDC}. \xCF\xF0\xEE\xE4\xEE\xEB\xE6\xE8\xF2\xFC?\n\n\xCD\xE8\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2: {EE7600}%s[%i], %s[%i], %s[%i].", mban_amount, mban_reason, mban_nick1, mban_id1, mban_nick2, mban_id2, mban_nick3, mban_id3)
			elseif var_0_24 == 4 then
				mban_nick1 = sampGetPlayerNickname(mban_id1)
				mban_nick2 = sampGetPlayerNickname(mban_id2)
				mban_nick3 = sampGetPlayerNickname(mban_id3)
				mban_nick4 = sampGetPlayerNickname(mban_id4)
				dialogText = string.format("{DCDCDC}\xD1\xEB\xE5\xE4\xF3\xFE\xF9\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xE8 \xE1\xF3\xE4\xF3\xF2 \xE7\xE0\xE1\xE0\xED\xE5\xED\xFB \xED\xE0 {EE7600}%i \xE4\xED\xE5\xE9 {DCDCDC}\xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: {EE7600}\"%s\"{DCDCDC}. \xCF\xF0\xEE\xE4\xEE\xEB\xE6\xE8\xF2\xFC?\n\n\xCD\xE8\xEA\xE8 \xE8\xE3\xF0\xEE\xEA\xEE\xE2: {EE7600}%s[%i], %s[%i], %s[%i], %s[%i].", mban_amount, mban_reason, mban_nick1, mban_id1, mban_nick2, mban_id2, mban_nick3, mban_id3, mban_nick4, mban_id4)
			end

			sampShowDialog(713, "\xCF\xEE\xE4\xF2\xE2\xE5\xF0\xE6\xE4\xE5\xED\xE8\xE5 \xE4\xE5\xE9\xF1\xF2\xE2\xE8\xFF", dialogText, "\xC4\xE0", "\xCE\xF2\xEC\xE5\xED\xE0", 0)
		end
	else
		text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

		message(text)
	end
end

function rotateCarAroundUpAxis(arg_40_0, arg_40_1)
	local var_40_0 = var_0_3(getVehicleRotationMatrix(arg_40_0))
	local var_40_1 = var_0_4(var_40_0.up:get())

	arg_40_1:normalize()
	var_40_1:normalize()

	local var_40_2 = math.acos(var_40_1:dotProduct(arg_40_1))

	if var_40_2 ~= 0 then
		var_40_1:crossProduct(arg_40_1)
		var_40_1:normalize()
		var_40_1:zeroNearZero()

		var_40_0 = var_40_0:rotate(var_40_1, -var_40_2)
	end

	setVehicleRotationMatrix(arg_40_0, var_40_0:get())
end

function readFloatArray(arg_41_0, arg_41_1)
	return representIntAsFloat(readMemory(arg_41_0 + arg_41_1 * 4, 4, false))
end

function writeFloatArray(arg_42_0, arg_42_1, arg_42_2)
	writeMemory(arg_42_0 + arg_42_1 * 4, 4, representFloatAsInt(arg_42_2), false)
end

function getVehicleRotationMatrix(arg_43_0)
	local var_43_0 = getCarPointer(arg_43_0)

	if var_43_0 ~= 0 then
		local var_43_1 = readMemory(var_43_0 + 20, 4, false)

		if var_43_1 ~= 0 then
			local var_43_2
			local var_43_3
			local var_43_4
			local var_43_5
			local var_43_6
			local var_43_7
			local var_43_8
			local var_43_9
			local var_43_10
			local var_43_11 = readFloatArray(var_43_1, 0)
			local var_43_12 = readFloatArray(var_43_1, 1)
			local var_43_13 = readFloatArray(var_43_1, 2)
			local var_43_14 = readFloatArray(var_43_1, 4)
			local var_43_15 = readFloatArray(var_43_1, 5)
			local var_43_16 = readFloatArray(var_43_1, 6)
			local var_43_17 = readFloatArray(var_43_1, 8)
			local var_43_18 = readFloatArray(var_43_1, 9)
			local var_43_19 = readFloatArray(var_43_1, 10)

			return var_43_11, var_43_12, var_43_13, var_43_14, var_43_15, var_43_16, var_43_17, var_43_18, var_43_19
		end
	end
end

function setVehicleRotationMatrix(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5, arg_44_6, arg_44_7, arg_44_8, arg_44_9)
	local var_44_0 = getCarPointer(arg_44_0)

	if var_44_0 ~= 0 then
		local var_44_1 = readMemory(var_44_0 + 20, 4, false)

		if var_44_1 ~= 0 then
			writeFloatArray(var_44_1, 0, arg_44_1)
			writeFloatArray(var_44_1, 1, arg_44_2)
			writeFloatArray(var_44_1, 2, arg_44_3)
			writeFloatArray(var_44_1, 4, arg_44_4)
			writeFloatArray(var_44_1, 5, arg_44_5)
			writeFloatArray(var_44_1, 6, arg_44_6)
			writeFloatArray(var_44_1, 8, arg_44_7)
			writeFloatArray(var_44_1, 9, arg_44_8)
			writeFloatArray(var_44_1, 10, arg_44_9)
		end
	end
end

function displayVehicleName(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0, arg_45_1 = convertWindowScreenCoordsToGameScreenCoords(arg_45_0, arg_45_1)

	useRenderCommands(true)
	setTextWrapx(640)
	setTextProportional(true)
	setTextJustify(false)
	setTextScale(0.33, 0.8)
	setTextDropshadow(0, 0, 0, 0, 0)
	setTextColour(255, 255, 255, 230)
	setTextEdge(1, 0, 0, 0, 100)
	setTextFont(1)
	displayText(arg_45_0, arg_45_1, arg_45_2)
end

function createPointMarker(arg_46_0, arg_46_1, arg_46_2)
	pointMarker = createUser3dMarker(arg_46_0, arg_46_1, arg_46_2 + 0.3, 4)
end

function removePointMarker()
	if pointMarker then
		removeUser3dMarker(pointMarker)

		pointMarker = nil
	end
end

function getCarFreeSeat(arg_48_0)
	if doesCharExist(getDriverOfCar(arg_48_0)) then
		local var_48_0 = getMaximumNumberOfPassengers(arg_48_0)

		for iter_48_0 = 0, var_48_0 do
			if isCarPassengerSeatFree(arg_48_0, iter_48_0) then
				return iter_48_0 + 1
			end
		end

		return nil
	else
		return 0
	end
end

function jumpIntoCar(arg_49_0)
	local var_49_0 = getCarFreeSeat(arg_49_0)

	if not var_49_0 then
		return false
	end

	if var_49_0 == 0 then
		warpCharIntoCar(PLAYER_PED, arg_49_0)
	else
		warpCharIntoCarAsPassenger(PLAYER_PED, arg_49_0, var_49_0 - 1)
	end

	restoreCameraJumpcut()

	return true
end

function teleportPlayer(arg_50_0, arg_50_1, arg_50_2)
	if isCharInAnyCar(PLAYER_PED) then
		setCharCoordinates(PLAYER_PED, arg_50_0, arg_50_1, arg_50_2)
	end

	setCharCoordinatesDontResetAnim(PLAYER_PED, arg_50_0, arg_50_1, arg_50_2)
end

function setCharCoordinatesDontResetAnim(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	if doesCharExist(arg_51_0) then
		local var_51_0 = getCharPointer(arg_51_0)

		setEntityCoordinates(var_51_0, arg_51_1, arg_51_2, arg_51_3)
	end
end

function setEntityCoordinates(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	if arg_52_0 ~= 0 then
		local var_52_0 = readMemory(arg_52_0 + 20, 4, false)

		if var_52_0 ~= 0 then
			local var_52_1 = var_52_0 + 48

			writeMemory(var_52_1 + 0, 4, representFloatAsInt(arg_52_1), false)
			writeMemory(var_52_1 + 4, 4, representFloatAsInt(arg_52_2), false)
			writeMemory(var_52_1 + 8, 4, representFloatAsInt(arg_52_3), false)
		end
	end
end

function show_Cursor(arg_53_0)
	if arg_53_0 then
		sampSetCursorMode(CMODE_LOCKCAM)
	else
		sampToggleCursor(false)
	end

	cursorEnabled = arg_53_0
end

function nameTagOn()
	local var_54_0 = sampGetServerSettingsPtr()

	var_0_1.setfloat(var_54_0 + 39, 1488)
	var_0_1.setint8(var_54_0 + 47, 0)
	var_0_1.setint8(var_54_0 + 56, 1)
end

function nameTagOff()
	local var_55_0 = sampGetServerSettingsPtr()

	var_0_1.setfloat(var_55_0 + 39, 35)
	var_0_1.setint8(var_55_0 + 47, 1)
	var_0_1.setint8(var_55_0 + 56, 1)
end

function TeleportWithAnimAndVelocity()
	local var_56_0 = getCharPointer(PLAYER_PED)
	local var_56_1 = getStructElement(var_56_0, 20, 4)

	setStructElement(var_56_1, 48, 4, X)
	setStructElement(var_56_1, 52, 4, Y)
	setStructElement(var_56_1, 56, 4, Z)
end

function TeleportVehicleAndSaveVelocity()
	local var_57_0 = storeCarCharIsInNoSave(PLAYER_PED)
	local var_57_1 = getCarPointer(var_57_0)
	local var_57_2 = getStructElement(var_57_1, 20, 4)

	setStructElement(var_57_2, 48, 4, X)
	setStructElement(var_57_2, 52, 4, Y)
	setStructElement(var_57_2, 56, 4, Z)
end

function guns()
	if admin_lvl >= 3 then
		local var_58_0 = getWeapontypeModel(24)

		if var_58_0 ~= 0 then
			if not hasModelLoaded(var_58_0) then
				requestModel(var_58_0)
				loadAllModelsNow()

				while not hasModelLoaded(var_58_0) do
					wait(0)
				end
			end

			giveWeaponToChar(PLAYER_PED, 24, 100)
			setCurrentCharWeapon(PLAYER_PED, 24)
		end

		local var_58_1 = getWeapontypeModel(31)

		if var_58_1 ~= 0 then
			if not hasModelLoaded(var_58_1) then
				requestModel(var_58_1)
				loadAllModelsNow()

				while not hasModelLoaded(var_58_1) do
					wait(0)
				end
			end

			giveWeaponToChar(PLAYER_PED, 31, 500)
			setCurrentCharWeapon(PLAYER_PED, 31)
		end

		local var_58_2 = getWeapontypeModel(29)

		if var_58_2 ~= 0 then
			if not hasModelLoaded(var_58_2) then
				requestModel(var_58_2)
				loadAllModelsNow()

				while not hasModelLoaded(var_58_2) do
					wait(0)
				end
			end

			giveWeaponToChar(PLAYER_PED, 29, 500)
			setCurrentCharWeapon(PLAYER_PED, 29)
		end
	else
		message("\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
	end
end

function checker(arg_59_0)
	local var_59_0
	local var_59_1, var_59_2, var_59_3 = string.match(arg_59_0, "(%a+)%s+(%a+)%s+(%d+)")

	if var_59_1 == "admin" and var_59_2 == "add" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_4 = sampGetPlayerNickname(var_59_3)
			local var_59_5 = string.match(arg_59_0, "%a+%s+%a+%s+%d+%s+(%d+)")

			if var_59_5 ~= nil then
				table.insert(admins_nick, var_59_4)
				table.insert(admins_lvl, var_59_5)
				table.insert(admins_id, var_59_3)

				var_59_0 = "\n" .. var_59_4 .. " " .. var_59_5
			else
				table.insert(admins_nick, var_59_4)
				table.insert(admins_lvl, -1)
				table.insert(admins_id, var_59_3)

				var_59_0 = "\n" .. var_59_4
			end

			local var_59_6 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "a")

			var_59_6:write(var_59_0)
			io.close(var_59_6)

			text = "\xC2\xFB \xED\xE0\xE7\xED\xE0\xF7\xE8\xEB\xE8 " .. var_59_4 .. " \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xEC."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	elseif var_59_1 == "admin" and var_59_2 == "remove" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_7 = sampGetPlayerNickname(var_59_3)

			for iter_59_0, iter_59_1 in ipairs(admins_nick) do
				if iter_59_1 == var_59_7 then
					admins_id[iter_59_0] = -1
					admins_nick[iter_59_0] = -1
					admins_lvl[iter_59_0] = -1
				end
			end

			local var_59_8 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "r")
			local var_59_9 = {}

			repeat
				local var_59_10 = var_59_8:read()

				if var_59_10 ~= nil and string.match(var_59_10, "(%S+)") ~= var_59_7 and string.len(var_59_10) ~= 0 then
					table.insert(var_59_9, var_59_10)
				end
			until var_59_10 == nil

			io.close(var_59_8)

			local var_59_11 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "w")

			for iter_59_2, iter_59_3 in ipairs(var_59_9) do
				var_59_11:write(iter_59_3 .. "\n")
			end

			io.close(var_59_11)

			text = "\xC2\xFB \xF1\xED\xFF\xEB\xE8 " .. var_59_7 .. " \xF1 \xEF\xEE\xF1\xF2\xE0 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	elseif var_59_1 == "leader" and var_59_2 == "add" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_12 = sampGetPlayerNickname(var_59_3)
			local var_59_13 = string.match(arg_59_0, "%a+%s+%a+%s+%d+%s+(%d+)")

			if var_59_13 ~= nil then
				table.insert(leaders_nick, var_59_12)
				table.insert(leaders_org, var_59_13)
				table.insert(leaders_id, var_59_3)

				var_59_0 = "\n" .. var_59_12 .. " " .. var_59_13
			else
				table.insert(leaders_nick, var_59_12)
				table.insert(leaders_org, -1)
				table.insert(leaders_id, var_59_3)

				var_59_0 = "\n" .. var_59_12
			end

			local var_59_14 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "a")

			var_59_14:write(var_59_0)
			io.close(var_59_14)

			text = var_59_12 .. " \xE4\xEE\xE1\xE0\xE2\xEB\xE5\xED \xE2 \xF7\xE5\xEA\xE5\xF0 \xEB\xE8\xE4\xE5\xF0\xEE\xE2."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	elseif var_59_1 == "leader" and var_59_2 == "remove" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_15 = sampGetPlayerNickname(var_59_3)

			for iter_59_4, iter_59_5 in ipairs(leaders_nick) do
				if iter_59_5 == var_59_15 then
					leaders_id[iter_59_4] = -1
					leaders_nick[iter_59_4] = -1
				end
			end

			local var_59_16 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "r")
			local var_59_17 = {}

			repeat
				local var_59_18 = var_59_16:read()

				if var_59_18 ~= nil and string.match(var_59_18, "(%S+)") ~= var_59_15 and string.len(var_59_18) ~= 0 then
					table.insert(var_59_17, var_59_18)
				end
			until var_59_18 == nil

			io.close(var_59_16)

			local var_59_19 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "w")

			for iter_59_6, iter_59_7 in ipairs(var_59_17) do
				var_59_19:write(iter_59_7 .. "\n")
			end

			io.close(var_59_19)

			text = var_59_15 .. " \xF3\xE4\xE0\xEB\xE5\xED \xE8\xE7 \xF7\xE5\xEA\xE5\xF0\xE0 \xEB\xE8\xE4\xE5\xF0\xEE\xE2."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	elseif var_59_1 == "friend" and var_59_2 == "add" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_20 = sampGetPlayerNickname(var_59_3)

			table.insert(friends_nick, var_59_20)
			table.insert(friends_id, var_59_3)

			local var_59_21 = "\n" .. var_59_20
			local var_59_22 = io.open("moonloader\\AdminTools\\checker\\friends.txt", "a")

			var_59_22:write(var_59_21)
			io.close(var_59_22)

			text = var_59_20 .. " \xE4\xEE\xE1\xE0\xE2\xEB\xE5\xED \xE2 \xF7\xE5\xEA\xE5\xF0 \xE4\xF0\xF3\xE7\xE5\xE9."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	elseif var_59_1 == "friend" and var_59_2 == "remove" and var_59_3 ~= nil then
		if sampIsPlayerConnected(var_59_3) then
			local var_59_23 = sampGetPlayerNickname(var_59_3)

			for iter_59_8, iter_59_9 in ipairs(friends_nick) do
				if iter_59_9 == var_59_23 then
					friends_id[iter_59_8] = -1
					friends_nick[iter_59_8] = -1
				end
			end

			local var_59_24 = io.open("moonloader\\AdminTools\\checker\\friends.txt", "r")
			local var_59_25 = {}

			repeat
				local var_59_26 = var_59_24:read()

				if var_59_26 ~= nil and string.match(var_59_26, "(%S+)") ~= var_59_23 and string.len(var_59_26) ~= 0 then
					table.insert(var_59_25, var_59_26)
				end
			until var_59_26 == nil

			io.close(var_59_24)

			local var_59_27 = io.open("moonloader\\AdminTools\\checker\\friends.txt", "w")

			for iter_59_10, iter_59_11 in ipairs(var_59_25) do
				var_59_27:write(iter_59_11 .. "\n")
			end

			io.close(var_59_27)

			text = var_59_23 .. " \xF3\xE4\xE0\xEB\xE5\xED \xE8\xE7 \xF7\xE5\xEA\xE5\xF0\xE0 \xE4\xF0\xF3\xE7\xE5\xE9."

			message(text)
		else
			text = "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2."

			message(text)
		end
	else
		text = "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /checker [admin/leader/friend] [add/remove] [ID \xE8\xE3\xF0\xEE\xEA\xE0] [lvl/ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8]"

		message(text)
	end
end

function relog()
	local var_60_0 = sampGetCurrentServerName()

	text = string.format("\xCF\xE5\xF0\xE5\xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED\xE8\xE5 \xEA \xF1\xE5\xF0\xE2\xE5\xF0\xF3 %s...", var_60_0)

	message(text)

	local var_60_1, var_60_2 = sampGetCurrentServerAddress()

	sampConnectToServer(var_60_1, var_60_2)
end

function explode_argb(arg_61_0)
	local var_61_0 = bit.band(bit.rshift(arg_61_0, 24), 255)
	local var_61_1 = bit.band(bit.rshift(arg_61_0, 16), 255)
	local var_61_2 = bit.band(bit.rshift(arg_61_0, 8), 255)
	local var_61_3 = bit.band(arg_61_0, 255)

	return var_61_0, var_61_1, var_61_2, var_61_3
end

function sampOnPlayerJoin(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local var_62_0
	local var_62_1 = string.lower(arg_62_3)

	for iter_62_0, iter_62_1 in ipairs(admins_nick) do
		if var_62_1 == string.lower(iter_62_1) then
			local var_62_2 = admins_lvl[iter_62_0]
			local var_62_3 = tonumber(var_62_2)

			admins_id[iter_62_0] = arg_62_0

			if sampIsLocalPlayerSpawned() then
				if var_62_3 == 7 or var_62_3 == 6 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xE3\xEB\xE0\xE2\xED\xFB\xE9 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0, %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_3 == 5 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xE7\xE0\xEC. \xE3\xEB\xE0\xE2\xED\xEE\xE3\xEE \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0, %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_3 >= 1 and var_62_3 <= 4 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %i \xF3\xF0\xEE\xE2\xED\xFF, %s[%i].", var_62_3, arg_62_3, arg_62_0)
				else
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%i].", arg_62_3, arg_62_0)
				end

				message(var_62_0)
			end
		end
	end

	for iter_62_2, iter_62_3 in ipairs(leaders_nick) do
		if iter_62_3 == arg_62_3 then
			local var_62_4 = leaders_org[iter_62_2]

			leaders_id[iter_62_2] = arg_62_0

			local var_62_5 = tonumber(var_62_4)

			if sampIsLocalPlayerSpawned() then
				if var_62_5 == 1 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 '\xEF\xF0\xE0\xE2\xE8\xF2\xE5\xEB\xFC\xF1\xF2\xE2\xEE', %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 2 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 '\xCC\xC2\xC4', %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 3 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 '\xCC\xCE', %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 4 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 '\xCC\xC7', %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 5 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 '\xD1\xCC\xC8', %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 6 or var_62_5 == 7 or var_62_5 == 8 or var_62_5 == 9 or var_62_5 == 10 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xE1\xE0\xED\xE4\xFB, %s[%i].", arg_62_3, arg_62_0)
				elseif var_62_5 == 11 or var_62_5 == 12 or var_62_5 == 13 then
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0 \xEC\xE0\xF4\xE8\xE8, %s[%i].", arg_62_3, arg_62_0)
				else
					var_62_0 = string.format("\xCF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEB\xE8\xE4\xE5\xF0, %s[%i].", arg_62_3, arg_62_0)
				end

				message(var_62_0)
			end
		end
	end

	for iter_62_4, iter_62_5 in ipairs(friends_nick) do
		if iter_62_5 == arg_62_3 then
			friends_id[iter_62_4] = arg_62_0

			if sampIsLocalPlayerSpawned() then
				local var_62_6 = string.format("%s[%i] \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF.", arg_62_3, arg_62_0)

				message(var_62_6)
			end
		end
	end

	if askick_status == true and askick_player_nickname == arg_62_3 then
		if os.clock() - askick_tick == 25 and askick_counter >= 5 then
			message("\xD4\xF3\xED\xEA\xF6\xE8\xFF \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xEE\xE3\xEE \xEA\xE8\xEA\xE0 \xEE\xF2\xEA\xEB\xFE\xF7\xE5\xED\xE0 \xE2\xEE \xE8\xE7\xE1\xE5\xE6\xE0\xED\xE8\xE5 \xF1\xED\xFF\xF2\xE8\xFF \xF1 \xE0\xE4\xEC\xE8\xED\xEA\xE8 \xF1\xE8\xF1\xF2\xE5\xEC\xEE\xE9.")

			askick_status = false
		elseif os.clock() - askick_tick > 25 and askick_counter < 5 then
			askick_tick = os.clock()
			askick_counter = 1
			askick_player_connected = true
			askick_player_id = arg_62_0
		else
			askick_counter = askick_counter + 1
			askick_player_connected = true
			askick_player_id = arg_62_0
		end
	end

	if punishment_list_auto_mode == true and pl_processing == false and sampIsLocalPlayerSpawned() and pl_nickname then
		for iter_62_6, iter_62_7 in ipairs(pl_nickname) do
			if string.lower(iter_62_7) == string.lower(arg_62_3) then
				message("[\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9]: " .. arg_62_3 .. "[" .. arg_62_0 .. "] " .. "\xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF \xEA \xF1\xE5\xF0\xE2\xE5\xF0\xF3.")

				if plCommand == "/jail" then
					local var_62_7 = string.format("\xC8\xE3\xF0\xEE\xEA \xE1\xF3\xE4\xE5\xF2 \xEF\xEE\xF1\xE0\xE6\xE5\xED \xE2 \xF2\xFE\xF0\xFC\xEC\xF3 \xED\xE0 %d \xEC\xE8\xED\xF3\xF2 \xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: %s.", plTerm, plReason)

					message(var_62_7)
				elseif plCommand == "/mute" then
					local var_62_8 = string.format("\xC8\xE3\xF0\xEE\xEA\xF3 \xE1\xF3\xE4\xE5\xF2 \xEF\xEE\xF1\xF2\xE0\xE2\xEB\xE5\xED\xE0 \xE7\xE0\xF2\xFB\xF7\xEA\xE0 \xED\xE0 %d \xEC\xE8\xED\xF3\xF2 \xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: %s.", plTerm, plReason)

					message(var_62_8)
				elseif plCommand == "/warn" then
					local var_62_9 = string.format("\xC8\xE3\xF0\xEE\xEA\xF3 \xE1\xF3\xE4\xE5\xF2 \xE2\xFB\xE4\xE0\xED\xEE \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: %s", plReason)

					message(var_62_9)
				elseif plCommand == "/ban" then
					local var_62_10 = string.format("\xC8\xE3\xF0\xEE\xEA \xE1\xF3\xE4\xE5\xF2 \xE7\xE0\xE1\xE0\xED\xE5\xED \xED\xE0 %d \xE4\xED\xE5\xE9 \xEF\xEE \xEF\xF0\xE8\xF7\xE8\xED\xE5: %s.", plTerm, plReason)

					message(var_62_10)
				elseif plCommand == "/unjail" then
					local var_62_11 = "\xC8\xE3\xF0\xEE\xEA \xE1\xF3\xE4\xE5\xF2 \xEE\xF1\xE2\xEE\xE1\xEE\xE6\xE4\xE5\xED \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB."

					message(var_62_11)
				elseif plCommand == "/unwarn" then
					local var_62_12 = "\xC8\xE3\xF0\xEE\xEA\xF3 \xE1\xF3\xE4\xE5\xF2 \xF1\xED\xFF\xF2\xEE \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5."

					message(var_62_12)
				elseif plCommand == "/unmute" then
					local var_62_13 = "\xD3 \xE8\xE3\xF0\xEE\xEA\xE0 \xE1\xF3\xE4\xE5\xF2 \xF1\xED\xFF\xF2\xE0 \xE7\xE0\xF2\xFB\xF7\xEA\xE0."

					message(var_62_13)
				end

				pl_processing = true
				pl_mass_number = iter_62_6
				pl_am_player_id = arg_62_0
				pl_processing_auto_mode = true

				break
			end
		end
	end
end

function sampOnPlayerQuit(arg_63_0, arg_63_1)
	for iter_63_0, iter_63_1 in ipairs(admins_id) do
		if iter_63_1 == arg_63_0 then
			admins_id[iter_63_0] = -1

			local var_63_0 = admins_nick[iter_63_0]

			message(string.format("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 %s[%i] \xEE\xF2\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF.", var_63_0, arg_63_0))
		end
	end

	for iter_63_2, iter_63_3 in ipairs(leaders_id) do
		if iter_63_3 == arg_63_0 then
			leaders_id[iter_63_2] = -1

			local var_63_1 = leaders_nick[iter_63_2]

			message(string.format("\xCB\xE8\xE4\xE5\xF0 %s[%i] \xEE\xF2\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF.", var_63_1, arg_63_0))
		end
	end

	for iter_63_4, iter_63_5 in ipairs(friends_id) do
		if iter_63_5 == arg_63_0 then
			friends_id[iter_63_4] = -1

			local var_63_2 = friends_nick[iter_63_4]

			message(string.format("%s[%i] \xEE\xF2\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF.", var_63_2, arg_63_0))
		end
	end

	if arg_63_0 == askick_player_id and askick_player_kicked == false then
		askick_player_connected = false
		askick_player_connected2 = false
	end
end

function string.fromhex(arg_64_0)
	return (arg_64_0:gsub("..", function(arg_65_0)
		local var_65_0 = tonumber(arg_65_0, 16)

		if var_65_0 ~= nil then
			return string.char(var_65_0)
		end
	end))
end

function firstThread()
	while true do
		wait(0)

		if sampIsDialogActive() and authorization_dialog_status == true then
			if password_text_buffer.v ~= nil and password_text_buffer.v ~= "" and autoLoginStatus then
				sampSetCurrentDialogEditboxText(password_text_buffer.v)
				sampCloseCurrentDialogWithButton(1)
			else
				print("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xF0\xE0\xF1\xF8\xE8\xF4\xF0\xEE\xE2\xE0\xF2\xFC \xEF\xE0\xF0\xEE\xEB\xFC. \xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
				message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xF0\xE0\xF1\xF8\xE8\xF4\xF0\xEE\xE2\xE0\xF2\xFC \xEF\xE0\xF0\xEE\xEB\xFC. \xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
			end

			authorization_dialog_status = false
		end

		if (check_reg == true or check_areg == true) and check_reg_areg_in_progress == true then
			reg_date = 0
			obj_regIP = nil
			obj_lastIP = nil
			dist_obj = nil

			sampCloseCurrentDialogWithButton(1)
			sampSendChat(string.format("/get %s", reg_nickname))

			local var_66_0 = 10
			local var_66_1 = os.time()

			repeat
				wait(0)

				if sampIsDialogActive(-1) or account_not_found == true then
					break
				end
			until os.time() > var_66_1 + var_66_0

			if account_not_found == false and os.time() < var_66_1 + var_66_0 and sampIsDialogActive(-1) then
				local var_66_2 = sampGetDialogCaption()
				local var_66_3

				if string.lower(reg_nickname) == string.lower(var_66_2) then
					message("\xCF\xEE\xEB\xF3\xF7\xE5\xED\xE8\xE5 \xE4\xE0\xED\xED\xFB\xF5 \xEE\xE1 IP-\xE0\xE4\xF0\xE5\xF1\xE0\xF5...")

					var_66_3 = sampGetDialogText()

					local var_66_4 = string.find(var_66_3, "(\xF0\xE5\xE3\xE8\xF1.)")

					if var_66_4 ~= nil then
						local var_66_5 = string.match(var_66_3, "(%d+.%d+.%d+.%d+)", var_66_4)

						var_66_4 = string.find(var_66_3, "(\xEF\xEE\xF1\xEB\xE5\xE4.)")

						if var_66_4 ~= nil then
							last_IP = string.match(var_66_3, "(%d+.%d+.%d+.%d+)", var_66_4)

							local var_66_6 = ansitoutf8("[" .. encodeJson({
								query = var_66_5
							}) .. "," .. encodeJson({
								query = last_IP
							}) .. "]")

							async_http_request("POST", "http://ip-api.com/batch?fields=query,country,regionName,city,org,status,message&lang=ru", {
								data = var_66_6
							}, function(arg_67_0)
								if arg_67_0.status_code == 200 then
									local var_67_0 = string.find(arg_67_0.text, "}")
									local var_67_1 = string.sub(arg_67_0.text, 2, var_67_0)
									local var_67_2 = string.sub(arg_67_0.text, var_67_0 + 2, #arg_67_0.text - 1)

									obj_regIP = decodeJson(var_67_1)
									obj_lastIP = decodeJson(var_67_2)

									if not obj_regIP or obj_regIP.status ~= "success" then
										print("Error: " .. obj_regIP.message)
										message("\xC2\xEE\xE7\xED\xE8\xEA\xEB\xE0 \xEE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xEF\xEE\xEB\xF3\xF7\xE5\xED\xE8\xE8 \xF0\xE5\xE3. \xE4\xE0\xED\xED\xFB\xF5: " .. obj_regIP.message)
									else
										var_66_4 = string.find(var_66_3, "\xD3\xF0\xEE\xE2\xE5\xED\xFC:")

										if var_66_4 ~= nil then
											reg_lvl = string.match(var_66_3, "%d+", var_66_4)
										end

										var_66_4 = string.find(var_66_3, "\xF0\xE5\xE3\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xE8:")

										if var_66_4 ~= nil then
											reg_date = string.match(var_66_3, "(%d+.%d+.%d+)", var_66_4)
										end

										var_66_4 = string.find(var_66_3, "\xC4\xEE\xED\xE0\xF2:")

										if var_66_4 ~= nil then
											reg_donat = string.match(var_66_3, "%d+", var_66_4)
										end

										if check_areg == true then
											sampSendChat(string.format("/a \xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFF \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE0\xF5 \xE8\xE3\xF0\xEE\xEA\xE0 %s[%i]. IP1 - \xF0\xE5\xE3., IP2 - \xEF\xEE\xF1\xEB.", reg_nickname, reg_player_id))
											sampSendChat(string.format("/a IP1: %s, %s, %s, %s, %s.", obj_regIP.query, utf8toansi(obj_regIP.country), utf8toansi(obj_regIP.regionName), utf8toansi(obj_regIP.city), utf8toansi(obj_regIP.org)))
										end

										if not obj_lastIP or obj_lastIP.status ~= "success" then
											print("Error: " .. obj_lastIP.message)
											message("\xC2\xEE\xE7\xED\xE8\xEA\xEB\xE0 \xEE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xEF\xEE\xEB\xF3\xF7\xE5\xED\xE8\xE8 \xF0\xE5\xE3. \xE4\xE0\xED\xED\xFB\xF5: " .. obj_lastIP.message)
										else
											if check_areg == true then
												wait(1000)
												sampSendChat(string.format("/a IP2: %s, %s, %s, %s, %s.", obj_lastIP.query, utf8toansi(obj_lastIP.country), utf8toansi(obj_lastIP.regionName), utf8toansi(obj_lastIP.city), utf8toansi(obj_lastIP.org)))
											end

											if obj_regIP.city ~= obj_lastIP.city then
												check_dist = true
											end

											if check_reg == true then
												sampCloseCurrentDialogWithButton(1)

												reg_window.v = not reg_window.v
											end
										end
									end
								else
									print("Error: " .. arg_67_0.status_code)
									message("\xC2\xEE\xE7\xED\xE8\xEA\xEB\xE0 \xEE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xEF\xEE\xEB\xF3\xF7\xE5\xED\xE8\xE8 \xF0\xE5\xE3. \xE4\xE0\xED\xED\xFB\xF5, \xEA\xEE\xE4 " .. arg_67_0.status_code)
								end

								check_reg = false
								check_areg = false
							end, function(arg_68_0)
								print(arg_68_0)

								check_reg = false
								check_areg = false
							end)
						end
					end
				end
			else
				account_not_found = false
				check_reg = false
				check_areg = false
			end

			check_reg_areg_in_progress = false
		end

		if check_dist then
			local var_66_7

			async_http_request("GET", string.format("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s,%s&destinations=%s,%s&language=ru&key=AIzaSyDrui3Na0hGHXWPiKoLD-cyG7RHC2P5kfA", string.gsub(obj_regIP.country, " ", "+"), string.gsub(obj_regIP.city, " ", "+"), string.gsub(obj_lastIP.country, " ", "+"), string.gsub(obj_lastIP.city, " ", "+")), nil, function(arg_69_0)
				if arg_69_0.status_code == 200 then
					dist_obj = decodeJson(arg_69_0.text)

					if dist_obj.status == "OK" and check_dist_areg == true then
						if dist_obj.rows[1].elements[1].status ~= "ZERO_RESULTS" and dist_obj.rows[1].elements[1].status ~= "NOT_FOUND" then
							var_66_7 = "\xD0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE5 \xEC\xE5\xE6\xE4\xF3 \xE3\xEE\xF0\xEE\xE4\xE0\xEC\xE8: " .. utf8toansi(dist_obj.rows[1].elements[1].distance.text) .. ", " .. "\xE4\xEB\xE8\xF2\xE5\xEB\xFC\xED\xEE\xF1\xF2\xFC \xEF\xEE\xE5\xE7\xE4\xEA\xE8: " .. utf8toansi(dist_obj.rows[1].elements[1].duration.text)
						else
							var_66_7 = "\xD0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE5 \xEC\xE5\xE6\xE4\xF3 \xE3\xEE\xF0\xEE\xE4\xE0\xEC\xE8 \xEE\xEF\xF0\xE5\xE4\xE5\xEB\xE8\xF2\xFC \xED\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC: " .. dist_obj.rows[1].elements[1].status
						end

						wait(1000)
						sampSendChat(string.format("/a %s", var_66_7))
					end
				end

				check_dist_areg = false
			end, function(arg_70_0)
				print(arg_70_0)

				check_dist_areg = false
			end)

			check_dist = false
		end

		if var_0_13 == true then
			if admin_lvl >= 3 then
				local var_66_8
				local var_66_9
				local var_66_10
				local var_66_11
				local var_66_12
				local var_66_13
				local var_66_14
				local var_66_15

				if var_0_14 == 0 and var_0_12 ~= 2 then
					sampCloseCurrentDialogWithButton(1)
					sampSendChat(string.format("/get %s", lip_player_nickname))

					local var_66_16 = 15
					local var_66_17 = os.time()

					repeat
						wait(0)

						if sampIsDialogActive(-1) or ilipCheckServerAnswer then
							break
						end
					until os.time() > var_66_17 + var_66_16

					local var_66_18 = sampGetDialogCaption()

					if string.lower(lip_player_nickname) == string.lower(var_66_18) then
						local var_66_19 = sampGetDialogText()
						local var_66_20 = string.find(var_66_19, "(\xEF\xEE\xF1\xEB\xE5\xE4.)")

						if var_66_20 ~= nil then
							LipIP = string.match(var_66_19, "(%d+.%d+.%d+.%d+)", var_66_20)

							sampCloseCurrentDialogWithButton(1)
						end
					end
				else
					if var_0_14 == 1 then
						LipIP = sp_IP
					end

					var_0_14 = 0
				end

				if LipIP then
					sampSendChat(string.format("/lip %s", LipIP))

					local var_66_21 = 15
					local var_66_22 = os.time()

					repeat
						wait(0)

						if sampIsDialogActive(-1) then
							break
						end
					until os.time() > var_66_22 + var_66_21

					local var_66_23 = sampGetDialogCaption()

					if LipIP == var_66_23 then
						dialog_t = sampGetDialogText()

						local var_66_24 = io.open("moonloader\\AdminTools\\data\\lip_nicks.txt", "w")

						var_66_24:write(dialog_t)
						io.close(var_66_24)

						local var_66_25 = io.open("moonloader\\AdminTools\\data\\lip_nicks.txt", "r")
						local var_66_26 = 0
						local var_66_27 = 0

						lip_players_online = {}

						repeat
							local var_66_28 = var_66_25:read()

							if var_66_28 ~= nil then
								local var_66_29 = 0
								local var_66_30 = sampGetMaxPlayerId(false)

								for iter_66_0 = 0, var_66_30 do
									if sampIsPlayerConnected(iter_66_0) then
										local var_66_31 = sampGetPlayerNickname(iter_66_0)

										if string.lower(var_66_28) == string.lower(var_66_31) then
											if var_66_26 == 0 then
												var_66_26 = var_66_26 + 1
												var_66_27 = var_66_27 + 1

												table.insert(lip_players_online, "/ban " .. var_66_28 .. " 30" .. " \xD7\xE8\xF2 (\xEF\xE5\xF1\xEE\xF7\xED\xE8\xF6\xE0).")

												var_66_8 = string.format("{32CD32}%i. %s [%i]", var_66_26, var_66_28, iter_66_0)
											else
												var_66_26 = var_66_26 + 1
												var_66_27 = var_66_27 + 1

												table.insert(lip_players_online, "/ban " .. var_66_28 .. " 30" .. " \xD7\xE8\xF2 (\xEF\xE5\xF1\xEE\xF7\xED\xE8\xF6\xE0).")

												var_66_8 = string.format("%s\n{32CD32}%i. %s [%i]", var_66_8, var_66_26, var_66_28, iter_66_0)
											end

											var_66_29 = 1
										end
									end
								end

								if var_0_12 ~= false and var_66_29 == 0 then
									text = string.format("\xCF\xF0\xEE\xE2\xE5\xF0\xEA\xE0 {FFD700}%s {DCDCDC}\xED\xE0 \xED\xE0\xEB\xE8\xF7\xE8\xE5 \xE2 \xE1\xE0\xED-\xEB\xE8\xF1\xF2\xE5...", var_66_28)

									message(text)
									sampSendChat(string.format("/baninfo %s", var_66_28))
									wait(1500)

									local var_66_32 = sampGetDialogCaption()

									if string.lower(var_66_28) == string.lower(var_66_32) then
										if var_66_26 == 0 then
											var_66_26 = 1
											var_66_8 = string.format("{FF0000}%i. %s", var_66_26, var_66_28)
										else
											var_66_26 = var_66_26 + 1
											var_66_8 = string.format("%s\n{FF0000}%i. %s", var_66_8, var_66_26, var_66_28)
										end

										var_66_29 = 1
									end
								end

								if var_66_29 == 0 then
									if var_66_26 == 0 then
										var_66_26 = var_66_26 + 1
										var_66_8 = string.format("{9C9C9C}%i. %s", var_66_26, var_66_28)
									else
										var_66_26 = var_66_26 + 1
										var_66_8 = string.format("%s\n{9C9C9C}%i. %s", var_66_8, var_66_26, var_66_28)
									end
								end
							end
						until var_66_28 == nil

						io.close(var_66_25)
						os.remove("moonloader\\AdminTools\\data\\lip_nicks.txt")

						if var_66_27 > 1 then
							var_66_8 = var_66_8 .. "{FFFFFF}\n\n\xC7\xE0\xEF\xE8\xF1\xE0\xF2\xFC \xED\xE8\xEA\xE8 \xE2 \xF2\xE0\xE1\xEB\xE8\xF6\xF3 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9?"

							sampShowDialog(701, LipIP, var_66_8, "\xC4\xE0", "\xC7\xE0\xEA\xF0\xFB\xF2\xFC", 0)

							local var_66_33
							local var_66_34
							local var_66_35
							local var_66_36

							repeat
								wait(0)

								local var_66_37, var_66_38, var_66_39, var_66_40 = sampHasDialogRespond(701)
								local var_66_41 = var_66_40
								local var_66_42 = var_66_39

								var_66_34 = var_66_38
							until var_66_37 == true

							if var_66_34 == 1 then
								for iter_66_1, iter_66_2 in ipairs(lip_players_online) do
									if iter_66_2 ~= nil then
										local var_66_43 = io.open("moonloader\\AdminTools\\punishment_list.txt", "a")

										var_66_43:write("\n" .. iter_66_2)
										io.close(var_66_43)
									end
								end

								text = "\xC4\xE0\xED\xED\xFB\xE5 \xF3\xF1\xEF\xE5\xF8\xED\xEE \xE7\xE0\xED\xE5\xF1\xE5\xED\xFB \xE2 \xF2\xE0\xE1\xEB\xE8\xF6\xF3 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9."

								message(text)
							end
						else
							sampShowDialog(700, LipIP, var_66_8, "\xC7\xE0\xEA\xF0\xFB\xF2\xFC", "", 0)
						end
					end
				end
			else
				text = "\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5."

				message(text)
			end

			var_0_13 = false
			var_0_12 = false
			ilipCheckServerAnswer = false
		end

		if (var_0_20 == true or var_0_21 == true) and localClock() - var_0_30 > 3 then
			if temp_frac <= max_podfrac then
				local var_66_44
				local var_66_45
				local var_66_46
				local var_66_47
				local var_66_48
				local var_66_49 = io.open("moonloader\\AdminTools\\logs\\find_log.html", "r")
				local var_66_50 = var_66_49:read("*all")

				io.close(var_66_49)
				sampCloseCurrentDialogWithButton(1)

				if fraction_id >= 6 then
					sampSendChat(string.format("/templeader %i 0", temp_frac))
				else
					sampSendChat(string.format("/templeader %i %i", fraction_id, temp_frac))
				end

				sampSendChat("/find")

				var_0_30 = localClock()

				local var_66_51 = 15
				local var_66_52 = os.time()

				repeat
					wait(0)

					if sampIsDialogActive(-1) then
						break
					end
				until os.time() > var_66_52 + var_66_51

				if sampIsDialogActive(-1) then
					if temp_frac == 6 then
						var_66_44 = "{009900}Grove Street:\n"
						var_66_45 = "Grove Street"
						var_66_48 = "#009900"
					elseif temp_frac == 7 then
						var_66_44 = "{CD00CD}The Ballas:\n"
						var_66_45 = "The Ballas"
						var_66_48 = "#CD00CD"
					elseif temp_frac == 8 then
						var_66_44 = "{EEC900}Los Santos Vagos:\n"
						var_66_45 = "Los Santos Vagos"
						var_66_48 = "#EEC900"
					elseif temp_frac == 9 then
						var_66_44 = "{836FFF}The Rifa:\n"
						var_66_45 = "The Rifa"
						var_66_48 = "#836FFF"
					elseif temp_frac == 10 then
						var_66_44 = "{00BFFF}Varios Los Aztecas:\n"
						var_66_45 = "Varios Los Aztecas"
						var_66_48 = "#00BFFF"
					elseif temp_frac == 11 then
						var_66_44 = "{8B0A50}La Cosa Nostra:\n"
						var_66_45 = "La Cosa Nostra"
						var_66_48 = "#8B0A50"
					elseif temp_frac == 12 then
						var_66_44 = "{BB0000}Yakuza:\n"
						var_66_45 = "Yakuza"
						var_66_48 = "#BB0000"
					elseif temp_frac == 13 then
						var_66_44 = "{008B8B}\xD0\xF3\xF1\xF1\xEA\xE0\xFF \xEC\xE0\xF4\xE8\xFF:\n"
						var_66_45 = "\xD0\xF3\xF1\xF1\xEA\xE0\xFF \xEC\xE0\xF4\xE8\xFF"
						var_66_48 = "#008B8B"
					elseif fraction_id == 3 then
						if temp_frac == 1 then
							var_66_44 = "{996633}\xD1\xF3\xF5\xEE\xEF\xF3\xF2\xED\xFB\xE5 \xC2\xEE\xE9\xF1\xEA\xE0:\n"
							var_66_45 = "\xD1\xF3\xF5\xEE\xEF\xF3\xF2\xED\xFB\xE5 \xC2\xEE\xE9\xF1\xEA\xE0"
							var_66_48 = "#996633"
						elseif temp_frac == 2 then
							var_66_44 = "{996633}\xC2\xEE\xE5\xED\xED\xEE-\xC2\xEE\xE7\xE4\xF3\xF8\xED\xFB\xE5 \xD1\xE8\xEB\xFB:\n"
							var_66_45 = "\xC2\xEE\xE5\xED\xED\xEE-\xC2\xEE\xE7\xE4\xF3\xF8\xED\xFB\xE5 \xD1\xE8\xEB\xFB"
							var_66_48 = "#996633"
						elseif temp_frac == 3 then
							var_66_44 = "{996633}\xC2\xEE\xE5\xED\xED\xEE-\xCC\xEE\xF0\xF1\xEA\xEE\xE9 \xD4\xEB\xEE\xF2:\n"
							var_66_45 = "\xC2\xEE\xE5\xED\xED\xEE-\xCC\xEE\xF0\xF1\xEA\xEE\xE9 \xD4\xEB\xEE\xF2"
							var_66_48 = "#996633"
						end
					elseif fraction_id == 1 then
						if temp_frac == 1 then
							var_66_44 = "{CCFF00}\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xE7\xE8\xE4\xE5\xED\xF2\xE0:\n"
							var_66_45 = "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xE7\xE8\xE4\xE5\xED\xF2\xE0"
							var_66_48 = "#CCFF00"
						elseif temp_frac == 2 then
							var_66_44 = "{CCFF00}\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1:\n"
							var_66_45 = "\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1"
							var_66_48 = "#EEC900"
						elseif temp_frac == 3 then
							var_66_44 = "{CCFF00}\xCC\xFD\xF0\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE:\n"
							var_66_45 = "\xCC\xFD\xF0\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE"
							var_66_48 = "#CCFF00"
						elseif temp_frac == 4 then
							var_66_44 = "{CCFF00}\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1:\n"
							var_66_45 = "\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1"
							var_66_48 = "#CCFF00"
						end
					elseif fraction_id == 2 then
						if temp_frac == 1 then
							var_66_44 = "{1E90FF}\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1:\n"
							var_66_45 = "\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1"
							var_66_48 = "#1E90FF"
						elseif temp_frac == 2 then
							var_66_44 = "{1E90FF}\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE:\n"
							var_66_45 = "\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE"
							var_66_48 = "#1E90FF"
						elseif temp_frac == 3 then
							var_66_44 = "{1E90FF}\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1:\n"
							var_66_45 = "\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1"
							var_66_48 = "#1E90FF"
						elseif temp_frac == 4 then
							var_66_44 = "{1E90FF}\xD4\xE5\xE4\xE5\xF0\xE0\xEB\xFC\xED\xEE\xE5 \xC1\xFE\xF0\xEE \xD0\xE0\xF1\xF1\xEB\xE5\xE4\xEE\xE2\xE0\xED\xE8\xE9:\n"
							var_66_45 = "\xD4\xE5\xE4\xE5\xF0\xE0\xEB\xFC\xED\xEE\xE5 \xC1\xFE\xF0\xEE \xD0\xE0\xF1\xF1\xEB\xE5\xE4\xEE\xE2\xE0\xED\xE8\xE9"
							var_66_48 = "#1E90FF"
						end
					elseif fraction_id == 4 then
						if temp_frac == 1 then
							var_66_44 = "{FF6666}\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1:\n"
							var_66_45 = "\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1"
							var_66_48 = "#FF6666"
						elseif temp_frac == 2 then
							var_66_44 = "{FF6666}\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE:\n"
							var_66_45 = "\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE"
							var_66_48 = "#FF6666"
						elseif temp_frac == 3 then
							var_66_44 = "{FF6666}\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1:\n"
							var_66_45 = "\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1"
							var_66_48 = "#FF6666"
						end
					elseif fraction_id == 5 then
						if temp_frac == 1 then
							var_66_44 = "{FF6600}\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1:\n"
							var_66_45 = "\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1"
							var_66_48 = "#FF6600"
						elseif temp_frac == 2 then
							var_66_44 = "{FF6600}\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE:\n"
							var_66_45 = "\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE"
							var_66_48 = "#FF6600"
						elseif temp_frac == 3 then
							var_66_44 = "{FF6600}\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1:\n"
							var_66_45 = "\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1"
							var_66_48 = "#FF6600"
						elseif temp_frac == 4 then
							var_66_44 = "{FF6600}\xD2\xE5\xEB\xE5\xF6\xE5\xED\xF2\xF0:\n"
							var_66_45 = "\xD2\xE5\xEB\xE5\xF6\xE5\xED\xF2\xF0"
							var_66_48 = "#FF6600"
						end
					else
						var_66_44 = string.format("{B5B5B5}\xCF\xEE\xE4\xF0\xE0\xE7\xE4\xE5\xEB\xE5\xED\xE8\xE5 %i:\n", temp_frac)
						var_66_45 = var_66_44
					end

					local var_66_53 = sampGetDialogText()
					local var_66_54, var_66_55 = string.find(var_66_53, "\xEE\xED\xEB\xE0\xE9\xED")

					if var_66_55 ~= nil then
						local var_66_56 = string.match(var_66_53, "%d+", var_66_55)
						local var_66_57 = tonumber(var_66_56) - 1
						local var_66_58, var_66_59 = string.find(var_66_53, "\xEF\xE0\xF3\xE7\xE5")

						if var_66_59 ~= nil then
							var_66_46 = string.match(var_66_53, "%d+", var_66_59)
						end

						var_66_50 = var_66_50 .. string.format("<tr><td>%s</td><td><span style='color:%s'>%s</span></td><td>%s</td><td>%s</td>\n", os.date("%d.%m.%Y %H:%M:%S"), var_66_48, var_66_45, var_66_57, var_66_46)

						if var_0_20 == true then
							if temp_frac ~= max_podfrac then
								var_66_44 = string.format("%s{E8E8E8}\xCE\xED\xEB\xE0\xE9\xED: %i \xF7\xE5\xEB, \xED\xE0 \xEF\xE0\xF3\xE7\xE5: %i \xF7\xE5\xEB.\n\n", var_66_44, var_66_57, var_66_46)
							else
								var_66_44 = string.format("%s{E8E8E8}\xCE\xED\xEB\xE0\xE9\xED: %i \xF7\xE5\xEB, \xED\xE0 \xEF\xE0\xF3\xE7\xE5: %i \xF7\xE5\xEB.", var_66_44, var_66_57, var_66_46)
							end

							dialogText = dialogText .. var_66_44
						else
							sampSendChat(string.format("/a " .. var_66_45 .. ": \xEE\xED\xEB\xE0\xE9\xED %d \xF7\xE5\xEB, \xED\xE0 \xEF\xE0\xF3\xE7\xE5 %s \xF7\xE5\xEB.", var_66_57, var_66_46))
						end
					else
						dialogText = string.format("%s\n\xCE\xEF\xF0\xE5\xE4\xE5\xEB\xE8\xF2\xFC \xED\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC.", dialogText)
						var_66_50 = var_66_50 .. string.format("<tr><td>%s</td><td><span style='color:%s'>%s</span></td><td>-</td><td>-</td>\n", os.date("%d-%m-%Y %H:%M:%S"), var_66_48, var_66_45)
					end
				end

				local var_66_60 = io.open("moonloader\\AdminTools\\logs\\find_log.html", "w")

				var_66_60:write(var_66_50)
				io.close(var_66_60)
			end

			if temp_frac == max_podfrac + 1 then
				if var_0_20 == true then
					if fraction_id >= 1 and fraction_id <= 5 then
						dialogName = "\xCE\xED\xEB\xE0\xE9\xED \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8"
					elseif fraction_id >= 6 and fraction_id <= 10 then
						dialogName = "\xCE\xED\xEB\xE0\xE9\xED \xE1\xE0\xED\xE4"
					elseif fraction_id >= 11 then
						dialogName = "\xCE\xED\xEB\xE0\xE9\xED \xEC\xE0\xF4\xE8\xE9"
					end

					sampShowDialog(700, dialogName, dialogText, "\xC7\xE0\xEA\xF0\xFB\xF2\xFC", "", 0)
				end

				local var_66_61 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini").auto_invite.organisation

				if var_66_61 ~= "0 0" then
					sampSendChat(string.format("/templeader %s", var_66_61))
				end

				dialogText = nil
				var_0_20 = false
				var_0_21 = false
			end

			temp_frac = temp_frac + 1
		end

		if var_0_35 == true then
			leaders_online_mass = {}

			local var_66_62
			local var_66_63
			local var_66_64
			local var_66_65
			local var_66_66
			local var_66_67 = sampGetCurrentServerName()

			var_66_67 = string.match(var_66_67, "Green") and "Green" or string.match(var_66_67, "Yellow") and "Yellow" or string.match(var_66_67, "Orange") and "Orange" or string.match(var_66_67, "Blue") and "Blue" or string.match(var_66_67, "White") and "White" or string.match(var_66_67, "Silver") and "Silver" or string.match(var_66_67, "Purple") and "Purple" or string.match(var_66_67, "Chocolate") and "Chocolate" or "Red"

			local var_66_68, var_66_69 = sampGetPlayerIdByCharHandle(PLAYER_PED)
			local var_66_70 = sampGetPlayerNickname(var_66_69)
			local var_66_71 = io.open("moonloader\\AdminTools\\logs\\online_leaders_log.html", "r")
			local var_66_72 = var_66_71:read("*all")

			io.close(var_66_71)

			local var_66_73 = io.open("moonloader\\AdminTools\\checker\\leaders.txt", "r")
			local var_66_74

			repeat
				local var_66_75 = var_66_73:read()

				if var_66_75 ~= nil then
					local var_66_76 = string.match(var_66_75, "(%a+_%a+)")
					local var_66_77 = string.match(var_66_75, "%S+%s+(%d+)")

					if var_66_77 ~= nil then
						if var_66_77 == "1" then
							var_66_77 = "\xCF\xF0\xE0\xE2\xE8\xF2\xE5\xEB\xFC\xF1\xF2\xE2\xEE"
						elseif var_66_77 == "2" then
							var_66_77 = "\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC2\xED\xF3\xF2\xF0\xE5\xED\xED\xE8\xF5 \xC4\xE5\xEB"
						elseif var_66_77 == "3" then
							var_66_77 = "\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xCE\xE1\xEE\xF0\xEE\xED\xFB"
						elseif var_66_77 == "4" then
							var_66_77 = "\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC7\xE4\xF0\xE0\xE2\xEE\xEE\xF5\xF0\xE0\xED\xE5\xED\xE8\xFF"
						elseif var_66_77 == "5" then
							var_66_77 = "\xD1\xF0\xE5\xE4\xF1\xF2\xE2\xE0 \xCC\xE0\xF1\xF1\xEE\xE2\xEE\xE9 \xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8"
						elseif var_66_77 == "6" then
							var_66_77 = "Grove Street"
						elseif var_66_77 == "7" then
							var_66_77 = "The Ballas"
						elseif var_66_77 == "8" then
							var_66_77 = "Los Santos Vagos"
						elseif var_66_77 == "9" then
							var_66_77 = "The Rifa"
						elseif var_66_77 == "10" then
							var_66_77 = "Varios Los Aztecas"
						elseif var_66_77 == "11" then
							var_66_77 = "La Cosa Nostra"
						elseif var_66_77 == "12" then
							var_66_77 = "Yakuza"
						elseif var_66_77 == "13" then
							local var_66_78 = "\xD0\xF3\xF1\xF1\xEA\xE0\xFF \xEC\xE0\xF4\xE8\xFF"
						end
					end

					if var_66_76 ~= nil then
						sampCloseCurrentDialogWithButton(1)
						sampSendChat(string.format("/get %s", var_66_76))

						local var_66_79 = 15
						local var_66_80 = os.time()

						repeat
							wait(0)

							if sampIsDialogActive(-1) then
								break
							end
						until os.time() > var_66_80 + var_66_79

						local var_66_81 = sampGetDialogCaption()

						if var_66_74 == nil then
							var_66_74 = string.format("{FFFFFF}\xCD\xE8\xEA \xEB\xE8\xE4\xE5\xF0\xE0:\t{FFA500}\t%s{FFFFFF}\n", var_66_81)
						else
							var_66_74 = var_66_74 .. string.format("{FFFFFF}\xCD\xE8\xEA \xEB\xE8\xE4\xE5\xF0\xE0:\t{FFA500}\t%s{FFFFFF}\n", var_66_81)
						end

						local var_66_82 = sampGetDialogText()
						local var_66_83 = string.find(var_66_82, "\xF1\xE5\xE3\xEE\xE4\xED\xFF:")

						if var_66_83 ~= nil then
							local var_66_84 = string.find(var_66_82, "%d+", var_66_83)
							local var_66_85, var_66_86 = string.match(var_66_82, "(%d+)%s+%S+%s+(%d+)%s+%S+", var_66_84)
							local var_66_87 = string.find(var_66_82, "\xE8\xE3\xF0\xE5 \xE2\xF7\xE5\xF0\xE0:")
							local var_66_88 = string.find(var_66_82, "%d+", var_66_87)
							local var_66_89, var_66_90 = string.match(var_66_82, "(%d+) \xF7 (%d+) \xEC\xE8\xED", var_66_88)
							local var_66_91 = string.find(var_66_82, "AFK \xF1\xE5\xE3\xEE\xE4\xED\xFF:")
							local var_66_92 = string.find(var_66_82, "%d+", var_66_91)
							local var_66_93, var_66_94 = string.match(var_66_82, "(%d+) \xF7 (%d+) \xEC\xE8\xED", var_66_92)
							local var_66_95 = string.find(var_66_82, "AFK \xE2\xF7\xE5\xF0\xE0:")
							local var_66_96 = string.find(var_66_82, "%d+", var_66_95)
							local var_66_97, var_66_98 = string.match(var_66_82, "(%d+) \xF7 (%d+) \xEC\xE8\xED", var_66_96)

							var_66_74 = var_66_74 .. string.format("{FFFFFF}\xC2 \xE8\xE3\xF0\xE5 \xF1\xE5\xE3\xEE\xE4\xED\xFF:{008B00}\t%d \xF7 %d \xEC\xE8\xED.\n{FFFFFF}\xC2 \xE8\xE3\xF0\xE5 \xE2\xF7\xE5\xF0\xE0:   {008B00}\t%d \xF7 %d \xEC\xE8\xED.\n{FFFFFF}AFK \xE7\xE0 \xF1\xE5\xE3\xEE\xE4\xED\xFF: {BB0000}\t%d \xF7 %d \xEC\xE8\xED.\n{FFFFFF}AFK \xE7\xE0 \xE2\xF7\xE5\xF0\xE0:   {BB0000}\t%d \xF7 %d \xEC\xE8\xED.\n", var_66_85, var_66_86, var_66_89, var_66_90, var_66_93, var_66_94, var_66_97, var_66_98)
							today_mins_ = var_66_85 * 60 + var_66_86
							today_afk_mins_ = var_66_93 * 60 + var_66_94
							yesterday_mins_ = var_66_89 * 60 + var_66_90
							yesterday_afk_mins_ = var_66_97 * 60 + var_66_98
							yesterday_mins_ = yesterday_mins_ - yesterday_afk_mins_
							yesterday_mins_ = yesterday_mins_ / 60

							local var_66_99, var_66_100 = math.modf(yesterday_mins_)
							local var_66_101 = var_66_100 * 60

							today_mins_ = today_mins_ - today_afk_mins_
							today_mins_ = today_mins_ / 60

							local var_66_102, var_66_103 = math.modf(today_mins_)
							local var_66_104 = var_66_103 * 60

							table.insert(leaders_online_mass, var_66_76)
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED", var_66_85, var_66_86))
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED", var_66_89, var_66_90))
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED", var_66_93, var_66_94))
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED", var_66_97, var_66_98))
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED", var_66_102, var_66_104))
							table.insert(leaders_online_mass, string.format("%d \xF7 %d \xEC\xE8\xED#", var_66_99, var_66_101))

							var_66_74 = var_66_74 .. string.format("{FFFFFF}\xD4\xE0\xEA\xF2. \xE7\xE0 \xF1\xE5\xE3\xEE\xE4\xED\xFF: {32CD32}\t%d \xF7 %d \xEC\xE8\xED.\n", var_66_102, var_66_104)
							var_66_74 = var_66_74 .. string.format("{FFFFFF}\xD4\xE0\xEA\xF2. \xE7\xE0 \xE2\xF7\xE5\xF0\xE0: {32CD32}\t%d \xF7 %d \xEC\xE8\xED.\n\n", var_66_99, var_66_101)
							var_66_72 = var_66_72 .. string.format("<tr><td>%s</td><td>%s</td><td>%d \xF7 %d \xEC\xE8\xED</td><td>%d \xF7 %d \xEC\xE8\xED</td><td>%d \xF7 %d \xEC\xE8\xED</td><td>%d \xF7 %d \xEC\xE8\xED</td><td>%d \xF7 %d \xEC\xE8\xED</td><td>%d \xF7 %d \xEC\xE8\xED</td></tr>\n", os.date("%d.%m.%Y, %H:%M:%S"), var_66_81, var_66_85, var_66_86, var_66_89, var_66_90, var_66_93, var_66_94, var_66_97, var_66_98, var_66_102, var_66_104, var_66_99, var_66_101)
						end

						wait(2000)
					end
				end
			until var_66_75 == nil

			io.close(var_66_73)

			local var_66_105 = io.open("moonloader\\AdminTools\\logs\\online_leaders_log.html", "w")

			var_66_105:write(var_66_72)
			io.close(var_66_105)
			sampCloseCurrentDialogWithButton(1)

			leaders_online_window.v = not leaders_online_window.v
			show_main_window.v = not show_main_window.v
			var_0_35 = false
		end

		if pl_processing_auto_mode == true then
			if sound == true then
				result, audio_handle2 = loadAudioStream("moonloader\\AdminTools\\data\\audio\\notification.mp3")

				if result == true then
					setAudioStreamState(audio_handle2, 1)

					audio_handle2Process = true
				end
			end

			local var_66_106 = pl_nickname[pl_mass_number]
			local var_66_107

			repeat
				wait(0)

				if sampIsPlayerConnected(pl_am_player_id) then
					var_66_107 = sampGetPlayerScore(pl_am_player_id)
				else
					text = string.format("[\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9]: %s[%d] \xEE\xF2\xEA\xEB\xFE\xF7\xE8\xEB\xF1\xFF.", var_66_106, pl_am_player_id)

					message(text)

					pl_processing_auto_mode = false

					break
				end
			until var_66_107 > 0

			if pl_processing_auto_mode == true and sampIsPlayerConnected(pl_am_player_id) then
				local var_66_108 = sampGetPlayerNickname(pl_am_player_id)

				if var_66_108 == var_66_106 then
					for iter_66_3, iter_66_4 in ipairs(pl_nickname) do
						if iter_66_4 == var_66_108 then
							plCommand = pl_command[iter_66_3]
							plNickname = pl_nickname[iter_66_3]
							plTerm = pl_term[iter_66_3]
							plReason = pl_reason[iter_66_3]

							if plCommand == "/jail" or plCommand == "/mute" or plCommand == "/ban" and plNickname ~= nil and plTerm ~= nil and plReason ~= nil then
								plCheckServerAnswer = true

								sampSendChat(string.format("%s %d %d %s", plCommand, pl_am_player_id, plTerm, plReason))
							elseif plCommand == "/warn" and plNickname ~= nil and plReason ~= nil then
								plCheckServerAnswer = true

								sampSendChat(string.format("%s %d %s", plCommand, pl_am_player_id, plReason))
							elseif plCommand == "/unwarn" or plCommand == "/unjail" or plCommand == "/unmute" and plNickname ~= nil then
								plCheckServerAnswer = true

								sampSendChat(string.format("%s %d", plCommand, pl_am_player_id))
							end

							if plCheckServerAnswer == true then
								local var_66_109 = 10
								local var_66_110 = os.time()

								repeat
									wait(0)

									if plCheckServerAnswer == false then
										break
									end
								until os.time() > var_66_110 + var_66_109

								if plCheckServerAnswer == true then
									message("\xC2\xF0\xE5\xEC\xFF \xEE\xE6\xE8\xE4\xE0\xED\xE8\xFF \xEE\xF2\xE2\xE5\xF2\xE0 \xE8\xF1\xF2\xE5\xEA\xEB\xEE.")
								end

								plCheckServerAnswer = false

								wait(10000)
							end
						end
					end

					local var_66_111 = io.open("moonloader\\AdminTools\\punishment_list.txt", "w")

					for iter_66_5, iter_66_6 in ipairs(pl_full_command) do
						if iter_66_6 ~= "" then
							var_66_111:write(iter_66_6 .. "\n")
						end
					end

					io.close(var_66_111)
					message("\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0.")
				end
			end

			pl_processing_auto_mode = false
			pl_processing = false

			getpunishments()
		end

		if var_0_19 == true then
			local var_66_112
			local var_66_113
			local var_66_114
			local var_66_115
			local var_66_116

			sampShowDialog(702, "\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE0\xF6\xE8\xFF \xE8\xE3\xF0\xEE\xEA\xEE\xE2", "{DCDCDC}\xCA \xE2\xE0\xEC \xE1\xF3\xE4\xF3\xF2 \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xED\xFB \xE8\xE3\xF0\xEE\xEA\xE8, \xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xE5\xF1\xFF \xE2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8, \xED\xEE \xED\xE5 \xE2 \xD2/\xD1. \xCF\xF0\xEE\xE4\xEE\xEB\xE6\xE8\xF2\xFC?", "\xC4\xE0", "\xCE\xF2\xEC\xE5\xED\xE0", 0)

			repeat
				wait(0)

				local var_66_117, var_66_118, var_66_119, var_66_120 = sampHasDialogRespond(702)
				local var_66_121 = var_66_120
				local var_66_122 = var_66_119

				var_66_113 = var_66_118
			until var_66_117 == true

			if var_66_113 == 1 then
				local var_66_123 = 0
				local var_66_124 = 0
				local var_66_125 = sampGetMaxPlayerId(true)

				for iter_66_7 = 0, var_66_125 do
					if var_0_19 == false then
						break
					end

					if sampIsPlayerConnected(iter_66_7) then
						local var_66_126, var_66_127 = sampGetCharHandleBySampPlayerId(iter_66_7)

						if doesCharExist(var_66_127) then
							if isCharInAnyCar(var_66_127) then
								var_66_124 = var_66_124 + 1
							elseif not locateCharAnyMeansChar3d(PLAYER_PED, var_66_127, 16, 16, 16, false) then
								local var_66_128 = sampGetPlayerNickname(iter_66_7)
								local var_66_129 = 0
								local var_66_130 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "r")

								repeat
									local var_66_131 = var_66_130:read()

									if var_66_131 ~= nil and var_66_128 == string.match(var_66_131, "(%S+)") then
										var_66_129 = 1

										break
									end
								until var_66_131 == nil

								io.close(var_66_130)

								if var_66_129 == 0 then
									sampSendChat(string.format("/gethere %i", iter_66_7))

									var_66_123 = var_66_123 + 1

									wait(3000)
								end
							end
						end
					end
				end

				if var_66_123 > 0 then
					text = string.format("\xC8\xE3\xF0\xEE\xEA\xE8 \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xED\xFB. \xC2\xF1\xE5\xE3\xEE \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xED\xEE \xE8\xE3\xF0\xEE\xEA\xEE\xE2: %d.", var_66_123)

					message(text)
				else
					text = "\xC8\xE3\xF0\xEE\xEA\xE8, \xED\xE5 \xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xE5\xF1\xFF \xE2 \xD2/\xD1, \xED\xE5 \xEE\xE1\xED\xE0\xF0\xF3\xE6\xE5\xED\xFB."

					message(text)
				end

				if var_66_124 > 0 then
					text = string.format("\xCA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xE8\xE3\xF0\xEE\xEA\xEE\xE2, \xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xF5\xF1\xFF \xE2 \xD2/\xD1: %d.", var_66_124)

					message(text)
				end
			end

			var_0_19 = false
		end

		if var_0_15 == true then
			local var_66_132
			local var_66_133 = 0

			for iter_66_8 = 0, rskin_player_ids do
				if var_0_15 == false then
					break
				end

				if sampIsPlayerConnected(iter_66_8) then
					local var_66_134

					_, var_66_134 = sampGetCharHandleBySampPlayerId(iter_66_8)

					if doesCharExist(var_66_134) and locateCharAnyMeansChar3d(PLAYER_PED, var_66_134, rskin_radius, rskin_radius, rskin_radius, false) and not isCharInAnyCar(var_66_134) then
						sampSendChat(string.format("/skin %i %i", iter_66_8, rskin_skin))

						var_66_133 = var_66_133 + 1

						wait(3000)
					end
				end
			end

			if var_66_133 > 0 then
				message(string.format("\xC2\xFB\xE4\xE0\xF7\xE0 \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xF5 \xF1\xEA\xE8\xED\xEE\xE2 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC2\xF1\xE5\xE3\xEE \xE2\xFB\xE4\xE0\xED\xEE \xF1\xEA\xE8\xED\xEE\xE2: %d.", var_66_133))
			else
				message("\xC2 \xF3\xEA\xE0\xE7\xE0\xED\xED\xEE\xEC \xF0\xE0\xE4\xE8\xF3\xF1\xE5 \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xED\xE5\xF2.")
			end

			var_0_15 = false
		end

		if var_0_16 == true then
			local var_66_135 = 0
			local var_66_136 = 0
			local var_66_137 = 0
			local var_66_138

			for iter_66_9 = 0, rskin_player_ids do
				if var_0_16 == false then
					break
				end

				if sampIsPlayerConnected(iter_66_9) then
					local var_66_139

					_, var_66_139 = sampGetCharHandleBySampPlayerId(iter_66_9)

					if doesCharExist(var_66_139) and locateCharAnyMeansChar3d(PLAYER_PED, var_66_139, rskin_radius, rskin_radius, rskin_radius, false) and not isCharInAnyCar(var_66_139) then
						if var_66_137 == 0 then
							sampSendChat(string.format("/skin %i %i", iter_66_9, rskin_skin))

							var_66_135 = var_66_135 + 1
							var_66_137 = 1
						else
							sampSendChat(string.format("/skin %i %i", iter_66_9, rskin_skin2))

							var_66_136 = var_66_136 + 1
							var_66_137 = 0
						end

						wait(3000)
					end
				end
			end

			if var_66_135 > 0 then
				count2 = var_66_135 + var_66_136

				message(string.format("\xC2\xFB\xE4\xE0\xF7\xE0 \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xF5 \xF1\xEA\xE8\xED\xEE\xE2 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC2\xF1\xE5\xE3\xEE \xE2\xFB\xE4\xE0\xED\xEE \xF1\xEA\xE8\xED\xEE\xE2: %d.", count2))
				message(string.format("\xCF\xE5\xF0\xE2\xFB\xE9 \xF1\xEA\xE8\xED - %d \xE5\xE4., \xE2\xF2\xEE\xF0\xEE\xE9 \xF1\xEA\xE8\xED - %d \xE5\xE4.", var_66_135, var_66_136))
			else
				message("\xC2 \xF3\xEA\xE0\xE7\xE0\xED\xED\xEE\xEC \xF0\xE0\xE4\xE8\xF3\xF1\xE5 \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xED\xE5\xF2.")
			end

			var_0_16 = false
		end
	end
end

function analytics(arg_71_0, arg_71_1)
	local var_71_0, var_71_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_71_2 = sampGetPlayerNickname(var_71_1)
	local var_71_3 = string.lower(var_71_2)
	local var_71_4, var_71_5 = string.match(var_71_3, "(%a%a)%a+_(%a%a)")

	if var_71_4 == nil then
		var_71_4 = string.match(var_71_3, "(%a%a)")
		var_71_5 = 0
	end

	local var_71_6 = sampGetCurrentServerName()

	if string.match(var_71_6, "Green") then
		var_71_6 = "Green"
	elseif string.match(var_71_6, "Yellow") then
		var_71_6 = "Yellow"
	elseif string.match(var_71_6, "Orange") then
		var_71_6 = "Orange"
	elseif string.match(var_71_6, "Blue") then
		var_71_6 = "Blue"
	elseif string.match(var_71_6, "White") then
		var_71_6 = "White"
	elseif string.match(var_71_6, "Silver") then
		var_71_6 = "Silver"
	elseif string.match(var_71_6, "Purple") then
		var_71_6 = "Purple"
	elseif string.match(var_71_6, "Chocolate") then
		var_71_6 = "Chocolate"
	elseif string.match(var_71_6, "Red") then
		var_71_6 = "Red"
	end

	local var_71_7 = string.lower(var_71_6)
	local var_71_8, var_71_9 = getScreenResolution()
	local var_71_10 = string.gsub(var_71_7, " ", "+")

	arg_71_1 = string.gsub(arg_71_1, " ", "+")

	async_http_request("GET", string.format("https://www.google-analytics.com/collect?v=1&t=%s&tid=UA-89442785-1&cid=%s-%s-%s&an=AdminTools&av=%s&ds=app&sr=%dx%d&ec=global_event&ea=%s", arg_71_0, var_71_10, var_71_4, var_71_5, thisScript().version, var_71_8, var_71_9, arg_71_1), nil, function(arg_72_0)
		return
	end, function(arg_73_0)
		print("Google Analytics Error: " .. arg_73_0)
	end)
end

function warnlast(arg_74_0)
	if arg_74_0 ~= "" then
		if sp_player_name ~= nil then
			if admin_lvl >= 4 then
				if string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
					sampSendChat(string.format("/offwarn %s %s.", temp_name, arg_74_0))
				else
					sampSendChat(string.format("/offwarn %s %s.", sp_player_name, arg_74_0))
				end
			elseif string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
				sampSendChat(string.format("/a /offwarn %s %s.", temp_name, arg_74_0))
			else
				sampSendChat(string.format("/a /offwarn %s %s.", sp_player_name, arg_74_0))
			end
		else
			message("\xC2\xFB \xE5\xF9\xE5 \xED\xE8 \xE7\xE0 \xEA\xE5\xEC \xED\xE5 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
		end
	else
		message("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /warnlast [\xCF\xF0\xE8\xF7\xE8\xED\xE0].")
	end
end

function banlast(arg_75_0)
	if arg_75_0 ~= "" then
		if sp_player_name ~= nil then
			if admin_lvl >= 4 then
				if string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
					sampSendChat(string.format("/offban %s %s.", temp_name, arg_75_0))
				else
					sampSendChat(string.format("/offban %s %s.", sp_player_name, arg_75_0))
				end
			elseif string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
				sampSendChat(string.format("/a /offban %s %s.", temp_name, arg_75_0))
			else
				sampSendChat(string.format("/a /offban %s %s.", sp_player_name, arg_75_0))
			end
		else
			message("\xC2\xFB \xE5\xF9\xE5 \xED\xE8 \xE7\xE0 \xEA\xE5\xEC \xED\xE5 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
		end
	else
		message("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /banlast [\xCA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xE4\xED\xE5\xE9] [\xCF\xF0\xE8\xF7\xE8\xED\xE0].")
	end
end

function jaillast(arg_76_0)
	if arg_76_0 ~= "" then
		if sp_player_name ~= nil then
			if admin_lvl >= 3 then
				if string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
					sampSendChat(string.format("/offjail %s %s.", temp_name, arg_76_0))
				else
					sampSendChat(string.format("/offjail %s %s.", sp_player_name, arg_76_0))
				end
			elseif string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
				sampSendChat(string.format("/a /offjail %s %s.", temp_name, arg_76_0))
			else
				sampSendChat(string.format("/a /offjail %s %s.", sp_player_name, arg_76_0))
			end
		else
			message("\xC2\xFB \xE5\xF9\xE5 \xED\xE8 \xE7\xE0 \xEA\xE5\xEC \xED\xE5 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
		end
	else
		message("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /jaillast [\xCC\xE8\xED\xF3\xF2\xFB] [\xCF\xF0\xE8\xF7\xE8\xED\xE0].")
	end
end

function mutelast(arg_77_0)
	if arg_77_0 ~= "" then
		if sp_player_name ~= nil then
			if admin_lvl >= 3 then
				if string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
					sampSendChat(string.format("/offmute %s %s.", temp_name, arg_77_0))
				else
					sampSendChat(string.format("/offmute %s %s.", sp_player_name, arg_77_0))
				end
			elseif string.find(renderText, "\xD1\xF2\xE0\xF2\xF3\xF1: \xC2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB") or string.find(renderText, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE5\xED.") then
				sampSendChat(string.format("/a /offmute %s %s.", temp_name, arg_77_0))
			else
				sampSendChat(string.format("/a /offmute %s %s.", sp_player_name, arg_77_0))
			end
		else
			message("\xC2\xFB \xE5\xF9\xE5 \xED\xE8 \xE7\xE0 \xEA\xE5\xEC \xED\xE5 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
		end
	else
		message("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /mutelast [\xCC\xE8\xED\xF3\xF2\xFB] [\xCF\xF0\xE8\xF7\xE8\xED\xE0].")
	end
end

function sampOnChatMessage(arg_78_0, arg_78_1)
	local var_78_0 = io.open("moonloader\\AdminTools\\logs\\chat_log.txt", "a")

	var_78_0:write(string.format("[%s] %s: %s\n", os.date("%d-%m-%Y %H:%M:%S"), sampGetPlayerNickname(arg_78_0), arg_78_1))
	io.close(var_78_0)
end

function sampOnServerMessage(arg_79_0, arg_79_1)
	local var_79_0 = io.open("moonloader\\AdminTools\\logs\\chat_log.txt", "a")

	var_79_0:write(string.format("[%s] %s\n", os.date("%d.%m.%Y %H:%M:%S"), arg_79_1))
	io.close(var_79_0)

	if string.find(arg_79_1, "\xC2\xFB \xE2\xEE\xF8\xEB\xE8 \xEA\xE0\xEA") then
		if admin_lvl == 0 then
			if string.find(arg_79_1, "\xEF\xE5\xF0\xE2\xEE\xE3\xEE") then
				admin_lvl = 1
			elseif string.find(arg_79_1, "\xE2\xF2\xEE\xF0\xEE\xE3\xEE") then
				admin_lvl = 2
			elseif string.find(arg_79_1, "\xF2\xF0\xE5\xF2\xFC\xE5\xE3\xEE") then
				admin_lvl = 3
			elseif string.find(arg_79_1, "\xF7\xE5\xF2\xE2\xB8\xF0\xF2\xEE\xE3\xEE") then
				admin_lvl = 4
			elseif string.find(arg_79_1, "\xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 \xF3\xF0\xEE\xE2\xED\xFF S2") then
				admin_lvl = 4
			elseif string.find(arg_79_1, "\xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 \xF3\xF0\xEE\xE2\xED\xFF S3") then
				admin_lvl = 4
			elseif string.find(arg_79_1, "\xE3\xEB\xE0\xE2\xED\xFB\xE9") then
				admin_lvl = 5
			end
		end

		if togphone == true then
			togphonehookcmd = true
		end
	end

	if auto_invite_status == true and (arg_79_1 == "    \xC1\xC0\xCD\xCA\xCE\xC2\xD1\xCA\xC8\xC9 \xD7\xC5\xCA" or arg_79_1 == "\xC2\xFB \xE2\xEE\xF8\xEB\xE8 \xEA\xE0\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 \xF7\xE5\xF2\xE2\xB8\xF0\xF2\xEE\xE3\xEE \xF3\xF0\xEE\xE2\xED\xFF") then
		local var_79_1 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini").auto_invite.organisation

		if var_79_1 ~= "0 0" then
			inSrvMsgHookCmd = string.format("/templeader %s", var_79_1)
		end
	end

	if arg_79_0 == 1728027135 and sp_info == true then
		sp_IP = string.match(arg_79_1, "|  IP (%d+.%d+.%d+.%d+)")
	end

	if admin_chat_commands_status == true and command_from_admin_chat_status == false and arg_79_0 == -1714683649 and command_from_admin_chat_confirm_status == false and not isGamePaused() and not isPauseMenuActive() then
		adm_name, adm_id, adm_command = string.match(arg_79_1, "%[A%] (.+)%[(%d+)%]%: (.*)")

		if adm_name and adm_id and adm_command and string.find(arg_79_1, "]: /") then
			command_from_admin_chat_status = true
		end
	end

	if var_0_13 and arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC (\xE8\xEB\xE8 \xED\xEE\xEC\xE5\xF0\xEE\xEC \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0) \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED" then
		ilipCheckServerAnswer = true
	end

	if plCheckServerAnswer == true and (arg_79_0 == -11521793 or arg_79_0 == -1717986817 or arg_79_0 == -825307393) then
		local var_79_2, var_79_3 = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local var_79_4 = sampGetPlayerNickname(var_79_3)
		local var_79_5
		local var_79_6
		local var_79_7

		if plCommand == "/jail" then
			var_79_5 = "\xD2\xFE\xF0\xFC\xEC\xE0"
		elseif plCommand == "/warn" then
			var_79_5 = "\xC2\xFB\xE4\xE0\xF7\xE0 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xFF"
		elseif plCommand == "/mute" then
			var_79_5 = "\xC7\xE0\xF2\xFB\xF7\xEA\xE0"
		elseif plCommand == "/ban" then
			var_79_5 = "\xC1\xE0\xED"
		elseif plCommand == "/unwarn" then
			var_79_5 = "\xD1\xED\xFF\xF2\xE8\xE5 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xFF"
		elseif plCommand == "/unjail" then
			var_79_5 = "\xC2\xFB\xEF\xF3\xF1\xEA \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB"
		elseif plCommand == "/unmute" then
			var_79_5 = "\xD1\xED\xFF\xF2\xE8\xE5 \xE7\xE0\xF2\xFB\xF7\xEA\xE8"
		end

		local var_79_8 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "r")
		local var_79_9 = var_79_8:read("*all")

		io.close(var_79_8)

		if string.find(arg_79_1, "%A+" .. var_79_4 .. "%A+" .. plNickname) or string.find(arg_79_1, "[" .. "%a+" .. "] " .. var_79_4 .. "%A+" .. plNickname) then
			local var_79_10 = os.date("%d-%m-%Y %H:%M:%S")

			var_79_9 = var_79_9 .. string.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", var_79_10, plNickname, var_79_5, plTerm, plReason)

			local var_79_11 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "w")

			var_79_11:write(var_79_9)
			io.close(var_79_11)

			plCheckServerAnswer = false
			pl_full_command[pl_mass_number] = ""
		elseif arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xE7\xE0\xE1\xE0\xED\xE5\xED. \xC2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE7\xE0\xE1\xE0\xED\xE5\xED\xED\xEE\xEC\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 \xED\xE5\xEB\xFC\xE7\xFF" or arg_79_1 == "\xD3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9" then
			local var_79_12 = os.date("%d-%m-%Y %H:%M:%S")
			local var_79_13

			if arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xE7\xE0\xE1\xE0\xED\xE5\xED. \xC2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE7\xE0\xE1\xE0\xED\xE5\xED\xED\xEE\xEC\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 \xED\xE5\xEB\xFC\xE7\xFF" then
				var_79_13 = string.sub(arg_79_1, 1, 19) .. "<br>" .. string.sub(arg_79_1, 20, #arg_79_1)
			else
				var_79_13 = arg_79_1
			end

			var_79_9 = var_79_9 .. string.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>-</td><td><font color=\"#ff8000\">%s</font></td></tr>\n", var_79_12, plNickname, var_79_5, var_79_13)

			local var_79_14 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "w")

			var_79_14:write(var_79_9)
			io.close(var_79_14)

			plCheckServerAnswer = false
		elseif arg_79_1 == "The server is restarting" or arg_79_1 == "Server closed the connection" or arg_79_1 == "\xC8\xE3\xF0\xEE\xEA\xF3 \xF3\xE6\xE5 \xE2\xFB\xE4\xE0\xED\xE0 \xE7\xE0\xF2\xFB\xF7\xEA\xE0" or arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF3\xE6\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5" or arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC (\xE8\xEB\xE8 \xED\xEE\xEC\xE5\xF0\xEE\xEC \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0) \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED" or arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xEE\xED\xEB\xE0\xE9\xED. \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /ban" or arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xEE\xED\xEB\xE0\xE9\xED. \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /warn" or arg_79_1 == "\xD2\xE0\xEA\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE2 \xE1\xE0\xE7\xE5 \xE4\xE0\xED\xED\xFB\xF5" or arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED" then
			local var_79_15 = os.date("%d-%m-%Y %H:%M:%S")

			var_79_9 = var_79_9 .. string.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>-</td><td><font color=\"#ff8000\">%s</font></td></tr>\n", var_79_15, plNickname, var_79_5, arg_79_1)

			local var_79_16 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "w")

			var_79_16:write(var_79_9)
			io.close(var_79_16)

			plCheckServerAnswer = false
		elseif arg_79_1 == "\xD3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9" then
			local var_79_17 = os.date("%d-%m-%Y %H:%M:%S")
			local var_79_18 = var_79_9 .. string.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>-</td><td><font color=\"#ff8000\">%s</font></td></tr>\n", var_79_17, plNickname, var_79_5, arg_79_1)
			local var_79_19 = io.open("moonloader\\AdminTools\\logs\\pl_log.html", "w")

			var_79_19:write(var_79_18)
			io.close(var_79_19)

			pl_full_command[pl_mass_number] = ""
			plCheckServerAnswer = false
		end
	end

	if command_from_admin_chat_confirm_status == true and adm_chat_cmd_player_name ~= nil and msg_text ~= nil then
		if arg_79_0 == -11521793 or arg_79_0 == -1717986817 or arg_79_0 == -1714683649 then
			local var_79_20 = string.match(adm_name, "%a+")

			if string.find(arg_79_1, "%S+" .. " \xEF\xEE\xF1\xE0\xE4\xE8\xEB \xE2 \xF2\xFE\xF0\xFC\xEC\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "%S+" .. " \xE2\xFB\xF2\xE0\xF9\xE8\xEB \xE8\xE7 \xF2\xFE\xF0\xFC\xEC\xFB " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "%S+" .. " \xF0\xE0\xE7\xE1\xE0\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "%S+" .. " \xF1\xED\xFF\xEB 1 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xE2\xFB\xE4\xE0\xEB \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xE2\xFB\xE4\xE0\xEB \xEE\xF4\xF4\xEB\xE0\xE9\xED \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xE7\xE0\xE1\xE0\xED\xE8\xEB \xEE\xF4\xF4\xEB\xE0\xE9\xED \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xE7\xE0\xE1\xE0\xED\xE8\xEB \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xEA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xF1\xED\xFF\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xF1\xED\xFF\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xEE\xF4\xF4\xEB\xE0\xE9\xED \xF1 \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. "%S+" .. " \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xEE\xF4\xF4\xEB\xE0\xE9\xED \xE8\xE3\xF0\xEE\xEA\xF3 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, "%S+" .. " \xEA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0 " .. adm_chat_cmd_player_name) or string.find(arg_79_1, var_79_20 .. ",") or string.find(arg_79_1, "\xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFF \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE0\xF5 \xE8\xE3\xF0\xEE\xEA\xE0 ") then
				command_from_admin_chat_another_admin = true
			end
		elseif string.find(adm_command, "/msg", 1, true) and arg_79_0 == -3342081 and string.find(arg_79_1, msg_text, 1, true) then
			command_from_admin_chat_another_admin = true
		end
	end

	if (check_reg == true or check_areg == true) and arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC (\xE8\xEB\xE8 \xED\xEE\xEC\xE5\xF0\xEE\xEC \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0) \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED" then
		account_not_found = true
	end

	local var_79_21, var_79_22 = sampGetCurrentServerAddress()
	local var_79_23, var_79_24 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_79_25 = sampGetPlayerNickname(var_79_24)

	if var_79_21 == "5.254.104.131" and var_79_25 == "James_Turner" and not isGamePaused() and not isPauseMenuActive() and os.clock() - activity_tick < 5 and localClock() - var_0_37 > 3 then
		if string.find(arg_79_1, "[\xD1\xEC\xE5\xED\xE0 non-rp \xE8\xEC\xE5\xED\xE8]") and string.find(arg_79_1, "%a+_%a+ >> ", 21) and arg_79_0 == 1721329407 then
			local var_79_26 = string.match(arg_79_1, "/okay%s+(%d+)")

			if var_79_26 ~= nil and sampIsPlayerConnected(var_79_26) then
				local var_79_27 = sampGetPlayerNickname(var_79_26)

				if string.find(arg_79_1, var_79_27) then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF1\xEC\xE5\xED\xFB \xED\xE8\xEA\xE0 \xE2\xEE\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5\xF1\xFC \xE4\xEE\xED\xE0\xF2-\xF3\xF1\xEB\xF3\xE3\xEE\xE9 (/mn -> 9).", var_79_26))
				end
			end
		elseif arg_79_0 == 1724645631 and arg_79_1 ~= "\xC0\xE4\xEC\xE8\xED\xFB \xEE\xED\xEB\xE0\xE9\xED:" then
			local var_79_28 = string.find(arg_79_1, " : ")

			if var_79_28 ~= nil then
				local var_79_29 = string.sub(arg_79_1, 1, var_79_28)
				local var_79_30 = string.reverse(var_79_29)
				local var_79_31 = string.match(var_79_30, "%d+")
				local var_79_32 = string.reverse(var_79_31)

				if string.find(arg_79_1, "\xF1\xEF\xE0\xF1\xE8\xE1\xEE") or string.find(arg_79_1, "\xF1\xEF\xF1") or string.find(arg_79_1, "\xE1\xEB\xE0\xE3\xEE\xE4\xE0\xF0\xFE") or string.find(arg_79_1, "\xD1\xEF\xE0\xF1\xE8\xE1\xEE") or string.find(arg_79_1, "\xD1\xEF\xF1") or string.find(arg_79_1, "\xC1\xEB\xE0\xE3\xEE\xE4\xE0\xF0\xFE") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xCF\xF0\xE8\xFF\xF2\xED\xEE\xE9 \xE8\xE3\xF0\xFB \xE8 \xEE\xF2\xEB\xE8\xF7\xED\xEE\xE3\xEE \xED\xE0\xF1\xF2\xF0\xEE\xE5\xED\xE8\xFF \xED\xE0 Advance RP | Red! :)", var_79_32))
				elseif string.find(arg_79_1, "\xC7\xE0 \xF7\xF2\xEE") or string.find(arg_79_1, "\xE7\xE0 \xF7\xF2\xEE") then
					if not string.find(arg_79_1, "\xF3\xE1\xE8") and not string.find(arg_79_1, "\xE0\xF0\xE5\xF1\xF2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xCF\xF0\xE8\xF7\xE8\xED\xE0 \xE1\xFB\xEB\xE0 \xF3\xEA\xE0\xE7\xE0\xED\xE0.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xD1\xEA\xEE\xEB\xFC\xEA\xEE \xF1\xF2\xEE\xE8\xF2") or string.find(arg_79_1, "\xF1\xEA\xEE\xEB\xFC\xEA\xEE \xF1\xF2\xEE\xE8\xF2") or string.find(arg_79_1, "\xEA\xE0\xEA\xE0\xFF \xF6\xE5\xED\xE0") or string.find(arg_79_1, "\xCA\xE0\xEA\xE0\xFF \xF6\xE5\xED\xE0") or string.find(arg_79_1, "\xE7\xE0\xF0\xE0\xE1\xEE\xF2\xE0\xF2\xFC") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xD3\xE7\xED\xE0\xE9\xF2\xE5 \xFD\xF2\xEE RP-\xEF\xF3\xF2\xB8\xEC.", var_79_32))
				elseif string.find(arg_79_1, "\xCE\xE3\xF0\xE0\xED\xE8\xF7\xE8\xF2\xE5\xEB\xFC") or string.find(arg_79_1, "\xEE\xE3\xF0\xE0\xED\xE8\xF7\xE8\xF2\xE5\xEB\xFC") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xF1\xED\xFF\xF2\xFC/\xF3\xF1\xF2\xE0\xED\xEE\xE2\xE8\xF2\xFC \xEE\xE3\xF0\xE0\xED\xE8\xF7\xE8\xF2\xE5\xEB\xFC \xF1\xEA\xEE\xF0\xEE\xF1\xF2\xE8, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /sl.", var_79_32))
				elseif string.find(arg_79_1, "\xF1\xED\xFF\xF2\xFC") then
					if string.find(arg_79_1, "\xEC\xE0\xF1\xEA\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xF1\xED\xFF\xF2\xFC \xEC\xE0\xF1\xEA\xF3, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /end.", var_79_32))
					elseif string.find(arg_79_1, "\xE1\xF0\xEE\xED\xE5\xE6\xE8\xEB\xE5\xF2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xF1\xED\xFF\xF2\xFC \xE1\xF0\xEE\xED\xE5\xE6\xE8\xEB\xE5\xF2, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /armoff.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xEF\xEE\xE2\xE5\xF1\xF2\xEA\xF3") or string.find(arg_79_1, "\xEC\xE5\xE4\xEA\xE0\xF0\xF2\xF3") or string.find(arg_79_1, "\xEC\xE5\xE4.\xEA\xE0\xF0\xF2\xF3") or string.find(arg_79_1, "\xEC\xE5\xE4. \xEA\xE0\xF0\xF2\xF3") or string.find(arg_79_1, "\xE4\xE8\xEF\xEB\xEE\xEC") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xFB /me, /do.", var_79_32))
				elseif string.find(arg_79_1, "\xE7\xE0\xEC\xF3\xE6") or string.find(arg_79_1, "\xE6\xE5\xED\xE8\xF2\xFC\xF1\xFF") or string.find(arg_79_1, "\xE6\xE5\xED\xE8\xF2\xF1\xFF") or string.find(arg_79_1, "\xF0\xE0\xE7\xE2\xE5\xF1\xF2\xE8\xF1\xFC") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xEE\xE6\xE5\xED\xE8\xF2\xFC\xF1\xFF, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /wedding. \xC4\xEB\xFF \xF0\xE0\xE7\xE2\xEE\xE4\xE0 - /divorce.", var_79_32))
				elseif string.find(arg_79_1, "\xF1\xEA\xEE\xEB\xFC\xEA\xEE") then
					if string.find(arg_79_1, "\xF0\xE5\xF1\xF2\xE0\xF0\xF2") or string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE0") or string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE7\xE0\xE3\xF0\xF3\xE6\xE0\xE5\xF2\xF1\xFF") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xCF\xE5\xF0\xE5\xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE0 \xEF\xF0\xEE\xE8\xF1\xF5\xEE\xE4\xE8\xF2 \xE2 5:00.", var_79_32))
					elseif string.find(arg_79_1, "\xED\xEE\xEC\xE5\xF0\xE0") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC2\xFB\xF1\xE5\xEB\xE5\xED\xE8\xE5 \xE8\xE7 \xEE\xF2\xE5\xEB\xE5\xE9 \xEF\xF0\xEE\xE8\xF1\xF5\xEE\xE4\xE8\xF2 \xE2 0:00.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xF1\xEF\xE0\xF3\xED") or string.find(arg_79_1, "\xF1\xEF\xE0\xE2\xED") then
					if not string.find(arg_79_1, "\xE0\xE2\xF2\xEE") and not string.find(arg_79_1, "\xEC\xE0\xF8\xE8") and not string.find(arg_79_1, "\xF2\xE0\xF7") and not string.find(arg_79_1, "\xEF\xEE\xEC\xE5\xF5") and not string.find(arg_79_1, "\xEC\xE5\xF8\xE0") and not string.find(arg_79_1, "\xE7\xE0\xF1\xF2\xF0\xFF\xEB") and not string.find(arg_79_1, "\xF0\xE5\xF1\xEF\xE0") and not string.find(arg_79_1, "\xE2\xE5\xEB") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /setspawn.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xF3\xF0\xEE\xE2\xED\xFF") or string.find(arg_79_1, "\xD3\xF0\xEE\xE2\xED\xFF") then
					if string.find(arg_79_1, "\xEE\xF0\xE3") or string.find(arg_79_1, "\xE1\xE0\xED\xE4\xF3") or string.find(arg_79_1, "\xE1\xE0\xED\xE4\xFB") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC2 \xE1\xE0\xED\xE4\xFB/\xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 \xEF\xF0\xE8\xED\xE8\xEC\xE0\xFE\xF2 \xF1 3-\xE3\xEE \xF3\xF0\xEE\xE2\xED\xFF.", var_79_32))
					elseif string.find(arg_79_1, "\xEA\xE0\xE7\xE8\xED\xEE") or string.find(arg_79_1, "\xE0\xEB\xE8\xE3\xF3\xEB") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC2\xEE \xE2\xF1\xE5 \xEA\xE0\xE7\xE8\xED\xEE \xF1 7-\xE3\xEE \xF3\xF0\xEE\xE2\xED\xFF.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xC3\xE4\xE5 \xED\xE0\xF5\xEE\xE4\xE8\xF2\xF1\xFF") or string.find(arg_79_1, "\xE3\xE4\xE5 \xED\xE0\xF5\xEE\xE4\xE8\xF2\xF1\xFF") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /gps.", var_79_32))
				elseif string.find(arg_79_1, "\xCA\xE0\xEA") or string.find(arg_79_1, "\xEA\xE0\xEA") then
					if string.find(arg_79_1, "\xF3\xE7\xED\xE0\xF2\xFC \xED\xEE\xEC\xE5\xF0") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d /ad \xC8\xF9\xF3 \xCD\xE8\xEA_\xC8\xE3\xF0\xEE\xEA\xE0.", var_79_32))
					elseif string.find(arg_79_1, "\xEA\xF3\xEF\xE8\xF2\xFC \xEA\xE0\xED\xE8\xF1\xF2\xF0\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEA\xF3\xEF\xE8\xF2\xFC \xEA\xE0\xED\xE8\xF1\xF2\xF0\xF3, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /buyfuel.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xF0\xEE\xE4\xE0\xF2\xFC \xF2\xEE\xE2\xE0\xF0") or string.find(arg_79_1, "\xEF\xF0\xEE\xE4\xE0\xE2\xE0\xF2\xFC \xF2\xEE\xE2\xE0\xF0") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xF0\xEE\xE4\xE0\xF2\xFC \xF2\xEE\xE2\xE0\xF0, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /market [id] [\xF6\xE5\xED\xE0].", var_79_32))
					elseif string.find(arg_79_1, "\xE7\xE0\xEF\xF0\xE0\xE2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xE7\xE0\xEF\xF0\xE0\xE2\xE8\xF2\xFC \xEC\xE0\xF8\xE8\xED\xF3, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /i, \xEB\xE8\xE1\xEE \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 Num 2.", var_79_32))
					elseif string.find(arg_79_1, "\xF1\xE4\xE5\xEB\xE0\xF2\xFC \xEE\xF0\xF3\xE6") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xF1\xE4\xE5\xEB\xE0\xF2\xFC \xEE\xF0\xF3\xE6\xE5\xE5, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /makegun.", var_79_32))
					elseif string.find(arg_79_1, "\xCF\xE0\xF1\xEF\xEE\xF0\xF2") or string.find(arg_79_1, "\xEF\xE0\xF1\xEF\xEE\xF0\xF2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0\xE5\xF2\xFC/\xEF\xEE\xEA\xE0\xE7\xE0\xF2\xFC \xEF\xE0\xF1\xEF\xEE\xF0\xF2, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /pass", var_79_32))
					elseif string.find(arg_79_1, "\xEB\xE8\xF6\xE5\xED\xE7\xE8\xE8") or string.find(arg_79_1, "\xCB\xE8\xF6\xE5\xED\xE7\xE8\xE8") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0\xE5\xF2\xFC/\xEF\xEE\xEA\xE0\xE7\xE0\xF2\xFC \xEB\xE8\xF6\xE5\xED\xE7\xE8\xE8, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /lic", var_79_32))
					elseif string.find(arg_79_1, "\xF2\xF0\xF3\xE4\xEE\xE2\xF3\xFE") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0\xE5\xF2\xFC/\xEF\xEE\xEA\xE0\xE7\xE0\xF2\xFC \xF2\xF0\xF3\xE4\xEE\xE2\xF3\xFE \xEA\xED\xE8\xE3\xF3, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /wbook", var_79_32))
					elseif string.find(arg_79_1, "\xF1\xEA\xE8\xEB\xEB\xFB") or string.find(arg_79_1, "\xF1\xEA\xE8\xEB\xFB") then
						if not string.find(arg_79_1, "\xEA\xE0\xF7") then
							message(arg_79_1)
							sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0\xE5\xF2\xFC/\xEF\xEE\xEA\xE0\xE7\xE0\xF2\xFC \xF1\xEA\xE8\xEB\xEB\xFB, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /skill", var_79_32))
						end
					elseif string.find(arg_79_1, "\xE2\xFB\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xEE\xF0\xF3\xE6\xE8\xE5") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xE2\xFB\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xEE\xF0\xF3\xE6\xE8\xE5, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /drop.", var_79_32))
					elseif string.find(arg_79_1, "\xEA\xE0\xF0\xF2\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xF0\xEE\xE4\xE0\xF2\xFC sim-\xEA\xE0\xF0\xF2\xF3, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /sellsim.", var_79_32))
					elseif string.find(arg_79_1, "\xE2\xFB\xF1\xE0\xE4\xE8\xF2\xFC") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xE2\xFB\xF1\xE0\xE4\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /eject.", var_79_32))
					elseif string.find(arg_79_1, "\xEE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5") or string.find(arg_79_1, "\xEE\xE1\xFC\xFF\xE2\xEB\xE5\xED\xE8\xE5") or string.find(arg_79_1, "\xEE\xE1\xFC\xE5\xE2\xEB\xE5\xED\xE8\xE5") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xEE\xE4\xE0\xF2\xFC \xEE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5, \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /ad.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEF\xE0\xF2\xF0\xEE\xED\xFB") or string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEF\xF2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEF\xE0\xF2\xF0\xEE\xED\xFB, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /givepatr.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEC\xE5\xF2\xE0\xEB\xEB") or string.find(arg_79_1, "\xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEC\xE5\xF2\xE0\xEB") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xEF\xE5\xF0\xE5\xE4\xE0\xF2\xFC \xEC\xE5\xF2\xE0\xEB\xEB, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /givemet.", var_79_32))
					elseif string.find(arg_79_1, "\xF8\xE5\xEF\xF2\xE0\xF2\xFC") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /w.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xF0\xEE\xE4\xE0\xF2\xFC \xEE\xF0\xF3\xE6\xE8\xE5") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /sellgun.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xF0\xEE\xE4\xE0\xF2\xFC \xED\xE0\xF0\xEA\xEE") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /selldrugs.", var_79_32))
					elseif string.find(arg_79_1, "\xE4\xE0\xF2\xFC \xEA\xEB\xFE\xF7\xE8") or string.find(arg_79_1, "\xE4\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xE0\xE2\xF2\xEE") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /allow.", var_79_32))
					elseif string.find(arg_79_1, "\xEF\xF0\xEE\xE4\xE0\xF2\xFC \xEC\xE0\xF8\xE8\xED\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /sellmycar \xE8\xEB\xE8 \xE2 \xEC\xE5\xED\xFE \xE4\xEE\xEC\xE0/\xEE\xF2\xE5\xEB\xFF.", var_79_32))
					elseif string.find(arg_79_1, "\xE0\xF0\xE5\xED\xE4\xEE\xE2\xE0\xF2\xFC \xEC\xE0\xF8\xE8\xED\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /rentcar.", var_79_32))
					elseif string.find(arg_79_1, "\xED\xE0\xF0\xEA\xEE") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /drugs.", var_79_32))
					elseif string.find(arg_79_1, "\xE8\xF1\xEF\xEE\xEB\xFC\xE7\xEE\xE2\xE0\xF2\xFC \xE0\xEF\xF2\xE5\xF7\xEA\xF3") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /healme.", var_79_32))
					elseif string.find(arg_79_1, "\xE2\xEA\xEB\xFE\xF7\xE8\xF2\xFC \xF0\xE0\xE4\xE8\xEE") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /play \xE8\xEB\xE8 /radio.", var_79_32))
					elseif string.find(arg_79_1, "\xE2\xF0\xE5\xEC\xFF \xE2 \xF7\xE0\xF2\xE5") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /timestamp.", var_79_32))
					elseif string.find(arg_79_1, "\xF0\xE0\xE7\xEC\xE5\xF0 \xF7\xE0\xF2") or string.find(arg_79_1, "\xF3\xE2\xE5\xEB\xE8\xF7\xE8\xF2\xFC \xF7\xE0\xF2") then
						message(arg_79_1)
						sampSendChat(string.format("/ans %d \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xFB /fontsize \xE8 /pagesize.", var_79_32))
					end
				elseif string.find(arg_79_1, "\xD3\xE2\xEE\xEB\xFC\xF2\xE5") or string.find(arg_79_1, "\xF3\xE2\xEE\xEB\xFC\xF2\xE5") or string.find(arg_79_1, "\xEC\xEE\xE6\xE5\xF2\xE5 \xF3\xE2\xEE\xEB\xE8\xF2\xFC") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF \xED\xE5 \xF3\xE2\xEE\xEB\xFC\xED\xFF\xE5\xF2 \xE8\xE3\xF0\xEE\xEA\xEE\xE2. \xCE\xE1\xF0\xE0\xF2\xE8\xF2\xE5\xF1\xFC \xEA \xEB\xE8\xE4\xE5\xF0\xF3, \xEB\xE8\xE1\xEE \xE5\xE3\xEE \xE7\xE0\xEC\xE5\xF1\xF2\xE8\xF2\xE5\xEB\xFF\xEC.", var_79_32))
				elseif string.find(arg_79_1, "\xCA\xE0\xEA\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0") or string.find(arg_79_1, "\xEA\xE0\xEA\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0") then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xF3\xE7\xED\xE0\xF2\xFC \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xF3\xFE \xEA\xEE\xEC\xE0\xED\xE4\xF3, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /mn - \xD1\xEF\xE8\xF1\xEE\xEA \xEA\xEE\xEC\xE0\xED\xE4.", var_79_32))
				elseif (string.find(arg_79_1, "\xCA\xEE\xE3\xE4\xE0") or string.find(arg_79_1, "\xEA\xEE\xE3\xE4\xE0")) and (string.find(arg_79_1, "\xED\xE0\xE1\xEE\xF0") or string.find(arg_79_1, "\xCD\xE0\xE1\xEE\xF0")) then
					message(arg_79_1)
					sampSendChat(string.format("/ans %d \xD1\xEB\xE5\xE4\xE8\xF2\xE5 \xE7\xE0 \xE3\xEE\xF1. \xED\xEE\xE2\xEE\xF1\xF2\xFF\xEC\xE8, \xEB\xE8\xE1\xEE \xF3\xE7\xED\xE0\xE9\xF2\xE5 \xF3 \xEB\xE8\xE4\xE5\xF0\xE0 - /leaders.", var_79_32))
				end
			end
		end
	end

	if localClock() - adm_comm_tick < 3 then
		if arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xE7\xE0\xE1\xE0\xED\xE5\xED. \xC2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE7\xE0\xE1\xE0\xED\xE5\xED\xED\xEE\xEC\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 \xED\xE5\xEB\xFC\xE7\xFF" then
			local var_79_33 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xFD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xE7\xE0\xE1\xE0\xED\xE5\xED.", var_79_33)
		elseif arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC (\xE8\xEB\xE8 \xED\xEE\xEC\xE5\xF0\xEE\xEC \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0) \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED \xE2 \xE1\xE0\xED\xEB\xE8\xF1\xF2\xE5" or arg_79_1 == "\xD2\xE0\xEA\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE2 \xE1\xE0\xE7\xE5 \xE4\xE0\xED\xED\xFB\xF5" then
			local var_79_34 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xF2\xE0\xEA\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE2 \xE1\xE0\xE7\xE5 \xE4\xE0\xED\xED\xFB\xF5.", var_79_34)
		elseif arg_79_1 == "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xED\xE5 \xE7\xE0\xE1\xE0\xED\xE5\xED" then
			local var_79_35 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xFD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xED\xE5 \xE7\xE0\xE1\xE0\xED\xE5\xED.", var_79_35)
		elseif string.find(arg_79_1, "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xEE\xED\xEB\xE0\xE9\xED. \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9 {00ccff}") then
			local var_79_36 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, %s.", var_79_36, string.gsub(arg_79_1, "\xDD", "\xFD"))
		elseif string.find(arg_79_1, "\xC8\xE3\xF0\xEE\xEA \xF3\xE6\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5. \xCE\xF1\xF2\xE0\xE2\xF8\xE5\xE5\xF1\xFF \xE2\xF0\xE5\xEC\xFF: {ff9933}") or string.find(arg_79_1, "\xC8\xE3\xF0\xEE\xEA\xF3 \xF3\xE6\xE5 \xE2\xFB\xE4\xE0\xED\xE0 \xE7\xE0\xF2\xFB\xF7\xEA\xE0. \xCE\xF1\xF2\xE0\xE2\xF8\xE5\xE5\xF1\xFF \xE2\xF0\xE5\xEC\xFF: {ff9933}") then
			local var_79_37 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, %s.", var_79_37, string.gsub(arg_79_1, "\xC8", "\xE8", 1))
		elseif arg_79_1 == "\xD2\xE0\xEA\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE8\xEB\xE8 \xEE\xED \xED\xE5 \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xED" then
			local var_79_38 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xF2\xE0\xEA\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE8\xEB\xE8 \xEE\xED \xED\xE5 \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xED.", var_79_38)
		elseif arg_79_1 == "\xD3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE7\xE0\xF2\xFB\xF7\xEA\xE8" then
			local var_79_39 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xF3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE7\xE0\xF2\xFB\xF7\xEA\xE8.", var_79_39)
		elseif arg_79_1 == "\xD3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xE7\xE0\xF2\xFB\xF7\xEA\xE8" then
			local var_79_40 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xE8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED.", var_79_40)
		elseif string.find(arg_79_1, "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xEE\xED\xEB\xE0\xE9\xED. \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9 {00ccff}/jail") or string.find(arg_79_1, "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xEE\xED\xEB\xE0\xE9\xED. \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9 {00ccff}/mute") then
			local var_79_41 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, %s.", var_79_41, string.gsub(arg_79_1, "\xDD", "\xFD"))
		elseif string.find(arg_79_1, "\xD3 \xE8\xE3\xF0\xEE\xEA\xE0 \xF3\xE6\xE5 \xE5\xF1\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xE0 {FFAA00}") then
			local var_79_42 = string.match(adm_name, "%a+")
			local var_79_43 = string.match(arg_79_1, "%d+:%d+")

			inSrvMsgHookCmd = string.format("/a %s, \xF3 \xE8\xE3\xF0\xEE\xEA\xE0 \xF3\xE6\xE5 \xE5\xF1\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xE0 (\xEE\xF1\xF2\xE0\xEB\xEE\xF1\xFC %s). \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9 /unmute.", var_79_42, var_79_43)
		elseif string.find(arg_79_1, "\xC8\xE3\xF0\xEE\xEA \xF3\xE6\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5 {FFAA00}") then
			local var_79_44 = string.match(adm_name, "%a+")
			local var_79_45 = string.match(arg_79_1, "%d+:%d+")

			inSrvMsgHookCmd = string.format("/a %s, \xE8\xE3\xF0\xEE\xEA \xF3\xE6\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5 (\xEE\xF1\xF2\xE0\xEB\xEE\xF1\xFC %s). \xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9 /unjail.", var_79_44, var_79_45)
		elseif string.find(arg_79_1, "\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5") or string.find(arg_79_1, "\xDD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xED\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5") then
			local var_79_46 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xFD\xF2\xEE\xF2 \xE8\xE3\xF0\xEE\xEA \xED\xE5 \xE2 \xF2\xFE\xF0\xFC\xEC\xE5.", var_79_46)
		elseif string.find(arg_79_1, "\xD3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9") then
			local var_79_47 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xF3 \xFD\xF2\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xED\xE5\xF2 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9.", var_79_47)
		elseif string.find(arg_79_1, "\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC \xE0\xE9\xE4\xE8 \xED\xE5\xF2") then
			local var_79_48 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xE8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC \xE0\xE9\xE4\xE8 \xED\xE5\xF2.", var_79_48)
		elseif arg_79_1 == "\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9: /msg [0-\xF1\xF2\xE0\xED\xE4\xE0\xF0\xF2, 1-\xE2\xE0\xE6\xED\xEE\xE5 \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xE5] [\xF2\xE5\xEA\xF1\xF2]" then
			local var_79_49 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9: /msg [0 \xE8\xEB\xE8 1] [\xF2\xE5\xEA\xF1\xF2].", var_79_49)
		elseif arg_79_1 == "\xC8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED" then
			local var_79_50 = string.match(adm_name, "%a+")

			inSrvMsgHookCmd = string.format("/a %s, \xE8\xE3\xF0\xEE\xEA \xF1 \xF2\xE0\xEA\xE8\xEC \xED\xE8\xEA\xEE\xEC \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED.", var_79_50)
		end
	end

	if string.find(arg_79_1, "\xED\xE0\xF7\xE0\xEB\xE8 \xE7\xE0\xF5\xE2\xE0\xF2 \xF2\xE5\xF0\xF0\xE8\xF2\xEE\xF0\xE8\xE8 \xE1\xE0\xED\xE4\xFB") and arg_79_0 == -10092289 then
		local var_79_51 = io.open("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt", "w")

		io.close(var_79_51)

		capture_warns_counter = true
		capture_vagos_warns = 0
		capture_grove_warns = 0
		capture_ballas_warns = 0
		capture_rifa_warns = 0
		capture_aztecas_warns = 0
		gangs = ""
		killedOnCapture = {}

		if string.find(arg_79_1, "Grove") then
			gangs = gangs .. " - Grove Street "
		end

		if string.find(arg_79_1, "Ballas") then
			gangs = gangs .. " - The Ballas "
		end

		if string.find(arg_79_1, "Vagos") then
			gangs = gangs .. " - Los Santos Vagos "
		end

		if string.find(arg_79_1, "Rifa") then
			gangs = gangs .. " - The Rifa "
		end

		if string.find(arg_79_1, "Aztecas") then
			gangs = gangs .. " - Varios Los Aztecas "
		end

		local var_79_52 = io.open("moonloader\\AdminTools\\logs\\capture_warns_log.txt", "a")

		var_79_52:write(string.format("=================================\n\xC4\xE0\xF2\xE0, \xE2\xF0\xE5\xEC\xFF: %s\n%s\n", os.date("%d-%m-%Y, %H:%M:%S"), arg_79_1))
		io.close(var_79_52)
	elseif string.find(arg_79_1, "\xE8\xED\xE8\xF6\xE8\xE8\xF0\xEE\xE2\xE0\xEB \xE7\xE0\xF5\xE2\xE0\xF2") and arg_79_0 == -10092289 then
		local var_79_53 = io.open("moonloader\\AdminTools\\logs\\capture_warns_log.txt", "a")

		var_79_53:write(arg_79_1 .. "\n=================================\n")
		io.close(var_79_53)
	elseif string.find(arg_79_1, "\xEF\xF0\xEE\xE2\xE0\xEB\xE8\xEB\xE0\xF1\xFC") or string.find(arg_79_1, "\xE7\xE0\xF5\xE2\xE0\xF2\xE8\xEB\xE8 \xF2\xE5\xF0\xF0\xE8\xF2\xEE\xF0\xE8\xFE \xF3 \xE1\xE0\xED\xE4\xFB") and arg_79_0 == -10092289 then
		killedOnCapture = {}

		if capture_warns_counter == true and capture_warns_counter_status == true then
			local var_79_54 = "\n"
			local var_79_55 = ""

			if string.find(arg_79_1, "Grove") then
				var_79_55 = "{009900}Grove Street: " .. capture_grove_warns .. "\n"
				var_79_54 = var_79_54 .. "Grove Street: " .. capture_grove_warns .. "\n"
			end

			if string.find(arg_79_1, "Ballas") then
				var_79_55 = var_79_55 .. "{CD00CD}The Ballas: " .. capture_ballas_warns .. "\n"
				var_79_54 = var_79_54 .. "The Ballas: " .. capture_ballas_warns .. "\n"
			end

			if string.find(arg_79_1, "Vagos") then
				var_79_55 = var_79_55 .. "{EEC900}Los Santos Vagos: " .. capture_vagos_warns .. "\n"
				var_79_54 = var_79_54 .. "Los Santos Vagos: " .. capture_vagos_warns .. "\n"
			end

			if string.find(arg_79_1, "Rifa") then
				var_79_55 = var_79_55 .. "{836FFF}The Rifa: " .. capture_rifa_warns .. "\n"
				var_79_54 = var_79_54 .. "The Rifa: " .. capture_rifa_warns .. "\n"
			end

			if string.find(arg_79_1, "Aztecas") then
				var_79_55 = var_79_55 .. "{00BFFF}Varios Los Aztecas: " .. capture_aztecas_warns .. "\n"

				local var_79_56 = var_79_54 .. "Varios Los Aztecas: " .. capture_aztecas_warns .. "\n"
			end

			sampShowDialog(700, "\xD1\xF7\xB8\xF2\xF7\xE8\xEA \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9", var_79_55, "\xC7\xE0\xEA\xF0\xFB\xF2\xFC", "", 0)

			local var_79_57 = io.open("moonloader\\AdminTools\\logs\\capture_warns_log.txt", "a")

			var_79_57:write("[" .. os.date("%H:%M:%S") .. "] " .. arg_79_1 .. "\n=================================\n\n\n\n")
			io.close(var_79_57)
		end

		capture_warns_counter = false

		if doesFileExist("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt") then
			os.remove("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt")
		end
	end

	if capture_warns_counter == true and (arg_79_0 == -11521793 or arg_79_0 == -1717986817) then
		if string.find(arg_79_1, "\xE2\xFB\xE4\xE0\xEB \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3") or string.find(arg_79_1, "\xE2\xFB\xE4\xE0\xEB \xEE\xF4\xF4\xEB\xE0\xE9\xED \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3") then
			local var_79_58 = false
			local var_79_59 = string.lower(arg_79_1)

			if string.find(var_79_59, "vagos") or string.find(var_79_59, "\xE2\xE0\xE3\xEE\xF1") or string.find(var_79_59, "lsv") or string.find(var_79_59, "\xEB\xF1\xE2") or string.find(var_79_59, "\xC2\xE0\xE3\xEE\xF1") then
				capture_vagos_warns = capture_vagos_warns + 1
				var_79_58 = true
			elseif string.find(var_79_59, "grove") or string.find(var_79_59, "\xE3\xF0\xF3\xE2") or string.find(var_79_59, "\xE6\xF0\xF3\xE2") or string.find(var_79_59, "groove") or string.find(var_79_59, "\xC3\xF0\xF3\xE2") then
				capture_grove_warns = capture_grove_warns + 1
				var_79_58 = true
			elseif string.find(var_79_59, "ballas") or string.find(var_79_59, "\xE1\xE0\xEB\xEB\xE0\xF1") or string.find(var_79_59, "\xE1\xE0\xEB\xE0\xF1") or string.find(var_79_59, "tbg") or string.find(var_79_59, "\xF2\xE1\xE3") or string.find(var_79_59, "balas") or string.find(var_79_59, "\xC1\xE0\xEB\xEB\xE0\xF1") or string.find(var_79_59, "\xC1\xE0\xEB\xE0\xF1") then
				capture_ballas_warns = capture_ballas_warns + 1
				var_79_58 = true
			elseif string.find(var_79_59, "rifa") or string.find(var_79_59, "sfr") or string.find(var_79_59, "\xF0\xE8\xF4\xE0") or string.find(var_79_59, "\xF1\xF4\xF0") or string.find(var_79_59, "\xD0\xE8\xF4\xE0") then
				capture_rifa_warns = capture_rifa_warns + 1
				var_79_58 = true
			elseif string.find(var_79_59, "\xE2\xEB\xE0") or string.find(var_79_59, "vla") or string.find(var_79_59, "\xE0\xF6\xF2\xE5\xEA") or string.find(var_79_59, "aztecas") or string.find(var_79_59, "aztec") or string.find(var_79_59, "actec") or string.find(var_79_59, "\xC0\xF6\xF2\xE5\xEA") or string.find(var_79_59, "\xC0\xF1\xF2\xE5\xEA") then
				capture_aztecas_warns = capture_aztecas_warns + 1
				var_79_58 = true
			end

			if var_79_58 == true then
				local var_79_60 = io.open("moonloader\\AdminTools\\logs\\capture_warns_log.txt", "a")

				var_79_60:write("[" .. os.date("%H:%M:%S") .. "] " .. arg_79_1 .. "\n")
				io.close(var_79_60)
			end
		elseif string.find(arg_79_1, "\xE7\xE0\xE1\xE0\xED\xE8\xEB") then
			local var_79_61 = false
			local var_79_62 = string.lower(arg_79_1)

			if string.find(var_79_62, "vagos") or string.find(var_79_62, "\xE2\xE0\xE3\xEE\xF1") or string.find(var_79_62, "lsv") or string.find(var_79_62, "\xEB\xF1\xE2") or string.find(var_79_62, "\xC2\xE0\xE3\xEE\xF1") then
				var_79_61 = true
			elseif string.find(var_79_62, "grove") or string.find(var_79_62, "\xE3\xF0\xF3\xE2") or string.find(var_79_62, "\xE6\xF0\xF3\xE2") or string.find(var_79_62, "groove") or string.find(var_79_62, "\xC3\xF0\xF3\xE2") then
				var_79_61 = true
			elseif string.find(var_79_62, "ballas") or string.find(var_79_62, "\xE1\xE0\xEB\xEB\xE0\xF1") or string.find(var_79_62, "\xE1\xE0\xEB\xE0\xF1") or string.find(var_79_62, "tbg") or string.find(var_79_62, "\xF2\xE1\xE3") or string.find(var_79_62, "balas") or string.find(var_79_62, "\xC1\xE0\xEB\xEB\xE0\xF1") or string.find(var_79_62, "\xC1\xE0\xEB\xE0\xF1") then
				var_79_61 = true
			elseif string.find(var_79_62, "rifa") or string.find(var_79_62, "sfr") or string.find(var_79_62, "\xF0\xE8\xF4\xE0") or string.find(var_79_62, "\xF1\xF4\xF0") or string.find(var_79_62, "\xD0\xE8\xF4\xE0") then
				var_79_61 = true
			elseif string.find(var_79_62, "\xE2\xEB\xE0") or string.find(var_79_62, "vla") or string.find(var_79_62, "\xE0\xF6\xF2\xE5\xEA") or string.find(var_79_62, "aztecas") or string.find(var_79_62, "aztec") or string.find(var_79_62, "actec") or string.find(var_79_62, "\xC0\xF6\xF2\xE5\xEA") or string.find(var_79_62, "\xC0\xF1\xF2\xE5\xEA") then
				var_79_61 = true
			end

			if var_79_61 == true then
				local var_79_63 = io.open("moonloader\\AdminTools\\logs\\capture_warns_log.txt", "a")

				var_79_63:write("[" .. os.date("%H:%M:%S") .. "] " .. arg_79_1 .. "\n")
				io.close(var_79_63)
			end
		end
	end

	if arg_79_0 == -65281 and admin_checker_auto_update == true then
		local var_79_64 = 0
		local var_79_65, var_79_66 = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local var_79_67 = sampGetPlayerNickname(var_79_66)
		local var_79_68 = string.match(arg_79_1, "[_%w]+")
		local var_79_69 = string.match(arg_79_1, "%d+")
		local var_79_70 = string.match(arg_79_1, "(%d+) lvl")

		if var_79_70 == nil then
			var_79_70 = string.match(arg_79_1, "(%a+) lvl")

			if var_79_70 == "S" then
				var_79_70 = 4
			end
		end

		if var_79_68 ~= nil and var_79_69 ~= nil and var_79_70 ~= nil and var_79_67 ~= var_79_68 then
			local var_79_71 = string.lower(var_79_68)

			for iter_79_0, iter_79_1 in ipairs(admins_nick) do
				if var_79_71 == string.lower(iter_79_1) then
					var_79_64 = 1

					local var_79_72 = admins_lvl[iter_79_0]
					local var_79_73 = tonumber(var_79_72)

					var_79_70 = tonumber(var_79_70)

					if var_79_73 ~= var_79_70 then
						admins_lvl[iter_79_0] = var_79_70
						var_79_64 = 2

						message("\xD3\xF0\xEE\xE2\xE5\xED\xFC \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0 " .. var_79_68 .. " \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED.")
					end
				end
			end

			if var_79_64 == 0 then
				table.insert(admins_nick, var_79_68)
				table.insert(admins_lvl, var_79_70)
				table.insert(admins_id, var_79_69)

				local var_79_74 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "a")

				var_79_74:write("\n" .. var_79_68 .. " " .. var_79_70)
				io.close(var_79_74)
				message("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_70 .. " \xF3\xF0\xEE\xE2\xED\xFF, " .. var_79_68 .. ", \xE4\xEE\xE1\xE0\xE2\xEB\xE5\xED \xE2 \xF7\xE5\xEA\xE5\xF0.")
			elseif var_79_64 == 2 then
				local var_79_75 = io.open("moonloader\\AdminTools\\checker\\admins.txt", "w")

				for iter_79_2, iter_79_3 in ipairs(admins_nick) do
					local var_79_76 = admins_lvl[iter_79_2]

					var_79_75:write(iter_79_3 .. " " .. var_79_76 .. "\n")
				end

				io.close(var_79_75)
			end
		end
	end

	local var_79_77, var_79_78 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local var_79_79 = sampGetPlayerNickname(var_79_78)

	if string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_79) and arg_79_0 == -6732289 then
		var_0_38 = var_0_38 + 1
		stats_ans_counter_all = stats_ans_counter_all + 1
	elseif string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_79 .. " \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 ") and arg_79_0 == -11521793 then
		var_0_39 = var_0_39 + 1
		stats_mute_counter_all = stats_mute_counter_all + 1
	elseif string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_79 .. " \xEA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0") and arg_79_0 == -11521793 then
		var_0_40 = var_0_40 + 1
		stats_kick_counter_all = stats_kick_counter_all + 1
	elseif string.find(arg_79_1, "[SP] " .. var_79_79 .. "[" .. var_79_78 .. "]" .. " \xEA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0", 1, true) or string.find(arg_79_1, "[A] " .. var_79_79 .. "[" .. var_79_78 .. "]" .. " \xEA\xE8\xEA\xED\xF3\xEB \xE8\xE3\xF0\xEE\xEA\xE0", 1, true) then
		if arg_79_0 == -1717986817 then
			var_0_41 = var_0_41 + 1
			stats_skick_counter_all = stats_skick_counter_all + 1
		end
	elseif string.find(arg_79_1, "[A] " .. var_79_79 .. "[" .. var_79_78 .. "]" .. " \xEF\xEE\xF1\xE0\xE4\xE8\xEB \xE2 \xF2\xFE\xF0\xFC\xEC\xF3", 1, true) and arg_79_0 == -1717986817 then
		var_0_42 = var_0_42 + 1
		stats_jail_counter_all = stats_jail_counter_all + 1
	elseif string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_79 .. " \xE2\xFB\xE4\xE0\xEB") and arg_79_0 == -11521793 then
		var_0_43 = var_0_43 + 1
		stats_warn_counter_all = stats_warn_counter_all + 1
	elseif string.find(arg_79_1, "\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. var_79_79 .. " \xE7\xE0\xE1\xE0\xED\xE8\xEB") and arg_79_0 == -11521793 then
		var_0_44 = var_0_44 + 1
		stats_ban_counter_all = stats_ban_counter_all + 1
	end

	if chatid == true then
		getPlayersNickname()

		local var_79_80 = string.len(arg_79_1)
		local var_79_81 = sampGetMaxPlayerId(false)

		for iter_79_4 = 0, var_79_81 do
			if sampIsPlayerConnected(iter_79_4) and PlayersNickname[iter_79_4] then
				local var_79_82, var_79_83 = string.find(arg_79_1, PlayersNickname[iter_79_4], 1, true)

				if var_79_82 and var_79_83 and not string.find(arg_79_1, PlayersNickname[iter_79_4] .. "[" .. iter_79_4 .. "]", 1, true) and not string.find(arg_79_1, "id " .. iter_79_4, 1, true) and not string.find(PlayersNickname[iter_79_4], ".", 1, true) and (string.find(arg_79_1, PlayersNickname[iter_79_4] .. " ", 1, true) or string.find(arg_79_1, PlayersNickname[iter_79_4] .. ".", 1, true) or string.find(arg_79_1, PlayersNickname[iter_79_4] .. ":", 1, true) or var_79_80 == var_79_83) then
					PlayerID = sampGetPlayerID(PlayersNickname[iter_79_4])

					if PlayerID then
						arg_79_1 = string.gsub(arg_79_1, PlayersNickname[iter_79_4], PlayersNickname[iter_79_4] .. "[" .. PlayerID .. "]")
					end
				end
			end
		end

		return {
			arg_79_0,
			arg_79_1
		}
	end
end

function sampGetPlayerID(arg_80_0)
	local var_80_0 = sampGetMaxPlayerId(false)

	for iter_80_0 = 0, var_80_0 do
		if arg_80_0 == PlayersNickname[iter_80_0] then
			return iter_80_0
		end
	end
end

function getPlayersNickname()
	PlayersNickname = {}

	local var_81_0 = sampGetMaxPlayerId(false)

	for iter_81_0 = 0, var_81_0 do
		if sampIsPlayerConnected(iter_81_0) then
			PlayersNickname[iter_81_0] = sampGetPlayerNickname(iter_81_0)
		end
	end
end

function sampOnSendCommand(arg_82_0)
	local var_82_0, var_82_1 = string.match(arg_82_0, "/ans%s+(%d+)%s+(.+)")

	if var_82_0 ~= nil and var_82_1 ~= nil and auto_perenos == true and sampIsPlayerConnected(var_82_0) then
		local var_82_2, var_82_3 = sampGetPlayerIdByCharHandle(PLAYER_PED)

		if string.len("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 " .. sampGetPlayerNickname(var_82_3) .. "[" .. var_82_3 .. "] " .. "\xE4\xEB\xFF " .. sampGetPlayerNickname(var_82_0) .. "[" .. var_82_0 .. "]: " .. var_82_1) > 125 then
			local var_82_4 = string.len(var_82_1) / 2
			local var_82_5 = math.floor(var_82_4)
			local var_82_6 = string.sub(var_82_1, 1, var_82_5) .. "..."
			local var_82_7 = string.sub(var_82_1, var_82_5 + 1, #var_82_1)

			sampSendChat(string.format("/ans %d %s", var_82_0, var_82_6))
			sampSendChat(string.format("/ans %d %s", var_82_0, var_82_7))

			return false
		end
	end

	if arg_82_0 == "/spinfo" then
		sp_info = false
	end

	local var_82_8 = string.match(arg_82_0, "/sp (%d+)")

	if var_82_8 ~= nil and arg_82_0 == string.format("/sp %d", var_82_8) and sampIsPlayerConnected(var_82_8) then
		sp_player_id = var_82_8
		first_sp = true
		first_sp_tick = localClock()
		ping_list = {}

		if not fast_commands_dialog_status then
			fast_commands_dialog_status = true
		end
	end
end

function string.tohex(arg_83_0)
	return (arg_83_0:gsub(".", function(arg_84_0)
		return string.format("%02x", string.byte(arg_84_0))
	end))
end

function string.fromhex(arg_85_0)
	return (arg_85_0:gsub("..", function(arg_86_0)
		local var_86_0 = tonumber(arg_86_0, 16)

		if var_86_0 ~= nil then
			return string.char(var_86_0)
		end
	end))
end

function sampOnShowDialog(arg_87_0, arg_87_1, arg_87_2, arg_87_3, arg_87_4, arg_87_5)
	if arg_87_0 == 1 and not string.find(arg_87_5, "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 \xEF\xE0\xF0\xEE\xEB\xFC!") and string.find(arg_87_2, "\xC0\xE2\xF2\xEE\xF0\xE8\xE7\xE0\xF6\xE8\xFF") and password_text_buffer.v ~= nil and password_text_buffer.v ~= "" and autoLoginStatus then
		authorization_dialog_status = true
	elseif arg_87_0 == 1 and string.find(arg_87_5, "\xCD\xE5\xE2\xE5\xF0\xED\xFB\xE9 \xEF\xE0\xF0\xEE\xEB\xFC!") and string.find(arg_87_2, "\xC0\xE2\xF2\xEE\xF0\xE8\xE7\xE0\xF6\xE8\xFF") and password_hash ~= nil and password_hash ~= "0" and autoLoginStatus then
		message("\xCF\xEE\xF5\xEE\xE6\xE5, \xF7\xF2\xEE-\xF2\xEE \xEF\xEE\xF8\xEB\xEE \xED\xE5 \xF2\xE0\xEA. \xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC \xE2\xF0\xF3\xF7\xED\xF3\xFE.")
	end
end

function decrypt(arg_88_0)
	if string.len(arg_88_0) == 32 then
		arg_88_0 = string.fromhex(arg_88_0)
		arg_88_0 = aeslua.decrypt(pass2, arg_88_0)
		arg_88_0 = tonumber(arg_88_0)

		if arg_88_0 == nil then
			arg_88_0 = 0
		end
	else
		arg_88_0 = 0
	end

	return arg_88_0
end

function onExitScript(arg_89_0)
	if arg_89_0 == false then
		if admin_lvl ~= nil and mainSkin ~= nil then
			local var_89_0 = io.open("moonloader\\AdminTools\\data\\temp", "w")

			var_89_0:write(admin_lvl .. "\n" .. mainSkin)
			io.close(var_89_0)
		end

		if var_0_8 == true then
			nameTagOff()
		end
	end
end

function downReg(arg_90_0)
	local var_90_0 = false

	dwnIndexUpdateFileInfo = downloadUrlToFile(arg_90_0, os.getenv("TEMP") .. "\\" .. "at_reg.tmp", function(arg_91_0, arg_91_1, arg_91_2, arg_91_3)
		if os.clock() - downloading_tick > 15 then
			dwnIndexUpdateFileInfo = nil
			processGetIpInfo = 1

			print("\xCF\xF0\xE5\xE2\xFB\xF8\xE5\xED\xEE \xE2\xF0\xE5\xEC\xFF \xEE\xE6\xE8\xE4\xE0\xED\xE8\xFF \xEE\xF2\xE2\xE5\xF2\xE0. \xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xEE\xF2\xEC\xE5\xED\xE5\xED\xE0.")
			message("\xCF\xF0\xE5\xE2\xFB\xF8\xE5\xED\xEE \xE2\xF0\xE5\xEC\xFF \xEE\xE6\xE8\xE4\xE0\xED\xE8\xFF \xEE\xF2\xE2\xE5\xF2\xE0 \xEE\xF2 \xF1\xE0\xE9\xF2\xE0. \xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xEE\xF2\xEC\xE5\xED\xE5\xED\xE0.")

			return false
		end

		if arg_91_0 == dwnIndexUpdateFileInfo then
			if arg_91_1 == 4 then
				if string.find(arg_90_0, "googleapis") then
					print("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE4\xE0\xED\xED\xFB\xF5 \xEE \xF0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE8 \xEC\xE5\xE6\xE4\xF3 \xE3\xEE\xF0\xEE\xE4\xE0\xEC\xE8 (" .. arg_91_2 .. " \xE1\xE0\xE9\xF2)...")
				else
					print("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE4\xE0\xED\xED\xFB\xF5 \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE5 (" .. arg_91_2 .. " \xE1\xE0\xE9\xF2)...")
				end

				var_90_0 = true
			elseif arg_91_1 == 58 then
				if var_90_0 then
					-- block empty
				else
					processGetIpInfo = 2

					if string.find(arg_90_0, "googleapis") then
						print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE5 \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8 \xEE \xF0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE8 \xEC\xE5\xE6\xE4\xF3 \xE3\xEE\xF0\xEE\xE4\xE0\xEC\xE8!")
					else
						print("\xCE\xF8\xE8\xE1\xEA\xE0 \xEF\xF0\xE8 \xE7\xE0\xE3\xF0\xF3\xE7\xEA\xE5 \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8 \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE5.")
					end
				end

				processGetIpInfo = var_90_0
			elseif arg_91_1 == 6 then
				if string.find(arg_90_0, "googleapis") then
					print(string.format("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8 \xEE \xF0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE8 \xEC\xE5\xE6\xE4\xF3 \xE3\xEE\xF0\xEE\xE4\xE0\xEC\xE8 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2", arg_91_2, arg_91_3))
				else
					print(string.format("\xC7\xE0\xE3\xF0\xF3\xE7\xEA\xE0 \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8 \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE5 \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0. \xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE %d / %d \xE1\xE0\xE9\xF2", arg_91_2, arg_91_3))
				end
			elseif arg_91_1 == 5 then
				print(string.format("\xC7\xE0\xE3\xF0\xF3\xE6\xE5\xED\xEE: %d / %d \xE1\xE0\xE9\xF2", arg_91_2, arg_91_3))
			end
		end
	end)
end

function uploadData(arg_92_0)
	local var_92_0 = false

	dwnIndexUpdateFileInfo = downloadUrlToFile(arg_92_0, os.getenv("TEMP") .. "\\" .. "at_response.tmp", function(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
		if arg_93_0 == dwnIndexUpdateFileInfo then
			if arg_93_1 == 4 then
				var_92_0 = true
			elseif arg_93_1 == 58 and (not var_92_0 or true) then
				processCheckServerAnswer = var_92_0
			elseif arg_93_1 == 6 then
				-- block empty
			elseif arg_93_1 == 5 then
				-- block empty
			end
		end
	end)
end

function onScriptTerminate(arg_94_0, arg_94_1)
	if arg_94_0.name == "AdminTools" then
		local var_94_0 = var_0_0.load(stats, "moonloader\\config\\AdminTools\\stats.ini")

		if seconds_all and arg_94_1 then
			seconds_all = seconds_all + math.floor(gameClock())

			local var_94_1 = tostring(seconds_all)

			aesstr = aesEncrypt(pass_stats_seconds, var_94_1)

			local var_94_2 = getHmac(aesstr) .. aesstr

			var_94_0.admin_stats.seconds_all = var_94_2
		end

		if stats_ans_counter_all then
			val = tostring(stats_ans_counter_all)
			aesstr = aesEncrypt(pass_stats_ans, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_ans_counter_all = val
		end

		if stats_mute_counter_all then
			val = tostring(stats_mute_counter_all)
			aesstr = aesEncrypt(pass_stats_mute, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_mute_counter_all = val
		end

		if stats_kick_counter_all then
			val = tostring(stats_kick_counter_all)
			aesstr = aesEncrypt(pass_stats_kick, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_kick_counter_all = val
		end

		if stats_skick_counter_all then
			val = tostring(stats_skick_counter_all)
			aesstr = aesEncrypt(pass_stats_skick, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_skick_counter_all = val
		end

		if stats_jail_counter_all then
			val = tostring(stats_jail_counter_all)
			aesstr = aesEncrypt(pass_stats_jail, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_jail_counter_all = val
		end

		if stats_warn_counter_all then
			val = tostring(stats_warn_counter_all)
			aesstr = aesEncrypt(pass_stats_warn, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_warn_counter_all = val
		end

		if stats_ban_counter_all then
			val = tostring(stats_ban_counter_all)
			aesstr = aesEncrypt(pass_stats_ban, val)
			val = getHmac(aesstr) .. aesstr
			var_94_0.admin_stats.stats_ban_counter_all = val
		end

		var_0_0.save(var_94_0, "AdminTools\\stats.ini")
		print("\xC4\xE0\xED\xED\xFB\xE5 \xF1\xF2\xE0\xF2\xE8\xF1\xF2\xE8\xEA\xE8 \xF3\xF1\xEF\xE5\xF8\xED\xEE \xF1\xEE\xF5\xF0\xE0\xED\xE5\xED\xFB.")
	end
end

function klist()
	if doesFileExist("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt") then
		local var_95_0 = io.open("moonloader\\AdminTools\\data\\capture_death_nicknames_cmd.txt", "r")

		if var_95_0 then
			local var_95_1 = var_95_0:read("*a")

			io.close(var_95_0)
			sampShowDialog(700, "{ffcc00}KillList", "{FFFFFF}" .. var_95_1, "\xC7\xE0\xEA\xF0\xFB\xF2\xFC", "", 0)
		else
			message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xEE\xF2\xEA\xF0\xFB\xF2\xFC killlist.")
		end
	else
		message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xEE\xF2\xEA\xF0\xFB\xF2\xFC killlist.")
	end
end

function tobase64(arg_96_0)
	return (arg_96_0:gsub(".", function(arg_97_0)
		local var_97_0 = ""
		local var_97_1 = arg_97_0:byte()

		for iter_97_0 = 8, 1, -1 do
			var_97_0 = var_97_0 .. (var_97_1 % 2^iter_97_0 - var_97_1 % 2^(iter_97_0 - 1) > 0 and "1" or "0")
		end

		return var_97_0
	end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_98_0)
		if #arg_98_0 < 6 then
			return ""
		end

		local var_98_0 = 0

		for iter_98_0 = 1, 6 do
			var_98_0 = var_98_0 + (arg_98_0:sub(iter_98_0, iter_98_0) == "1" and 2^(6 - iter_98_0) or 0)
		end

		return b:sub(var_98_0 + 1, var_98_0 + 1)
	end) .. ({
		"",
		"==",
		"="
	})[#arg_96_0 % 3 + 1]
end

function gotozeroworld()
	if getActiveInterior() ~= 0 then
		sampSendChat("/setint 0")
		sampSendChat("/setvw 0")
	end
end

function setTempleader(arg_100_0)
	sampSendChat(string.format("/templeader %s", arg_100_0))

	local var_100_0 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

	var_100_0.auto_invite.organisation = arg_100_0

	var_0_0.save(var_100_0, "AdminTools\\config.ini")
end

local var_0_48

function imguiBeforeDrawFrame()
	if not fontChanged then
		fontChanged = true
		var_0_48 = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()

		imgui.GetIO().Fonts:Clear()
		imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(20) .. "\\arialbd.ttf", 14, nil, var_0_48)
	end
end

function imguiOnDrawFrame()
	if fast_commands_dialog_status and os.time() < menuTime + 1 then
		lockPlayerControl(true)
	end

	if not sampIsChatInputActive() then
		if fast_commands_dialog.v then
			menuTime = os.time()

			local var_102_0, var_102_1 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_0 / 2, var_102_1 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(110, 295), imgui.Cond.FirstUseEver)
			imgui.Begin("Fast Cmd", fast_commands_dialog, imgui.WindowFlags.NoResize)

			local var_102_2 = imgui.ImVec2(-0.1, 0)

			if imgui.Button(u8("UPDATE"), var_102_2) then
				fast_commands_dialog.v = not fast_commands_dialog.v

				sampSendChat(string.format("/sp %d", sp_player_id))
			end

			if imgui.Button(u8("STATS"), var_102_2) then
				fast_commands_dialog.v = not fast_commands_dialog.v

				sampSendChat(string.format("/st %d", sp_player_id))
			end

			if imgui.Button(u8("WEAP"), var_102_2) then
				fast_commands_dialog.v = not fast_commands_dialog.v

				sampSendChat(string.format("/weap %d", sp_player_id))
			end

			if imgui.Button(u8("GET"), var_102_2) then
				fast_commands_dialog.v = not fast_commands_dialog.v

				if admin_lvl >= 3 then
					sampToggleCursor(false)

					if sampIsPlayerConnected(sp_player_id) then
						local var_102_3 = sampGetPlayerNickname(sp_player_id)

						sampSendChat(string.format("/get %s", var_102_3))
					else
						message("\xC8\xE3\xF0\xEE\xEA \xE2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB.")
					end
				else
					message("\xC4\xE0\xED\xED\xE0\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
				end
			end

			if imgui.Button(u8("LIP"), var_102_2) then
				if sp_info == true then
					if sp_IP then
						fast_commands_dialog.v = not fast_commands_dialog.v
						LipIP = sp_IP
						var_0_14 = 2
						var_0_13 = true
					else
						message("\xCD\xE5 \xF3\xE4\xE0\xEB\xEE\xF1\xFC \xEE\xEF\xF0\xE5\xE4\xE5\xEB\xE8\xF2\xFC IP \xE0\xE4\xF0\xE5\xF1.")
					end
				else
					message("\xC2\xEA\xEB\xFE\xF7\xE8\xF2\xE5 \xE8\xED\xF4. \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xFF (/spinfo) \xE8 \xEF\xF0\xEE\xEF\xE8\xF8\xE8\xF2\xE5 \xE5\xF9\xE5 \xF0\xE0\xE7 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /sp [id].")
				end
			end

			if imgui.Button(u8("MUTE"), var_102_2) and not ban_window.v and not warn_window.v and not jail_window.v and not kick_window.v and not rban_window.v then
				mute_window.v = not mute_window.v
			end

			if imgui.Button(u8("KICK"), var_102_2) and not ban_window.v and not warn_window.v and not jail_window.v and not mute_window.v and not rban_window.v then
				kick_window.v = not kick_window.v
			end

			if imgui.Button(u8("JAIL"), var_102_2) and not ban_window.v and not warn_window.v and not mute_window.v and not kick_window.v and not rban_window.v then
				jail_window.v = not jail_window.v
			end

			if imgui.Button(u8("WARN"), var_102_2) and not ban_window.v and not mute_window.v and not jail_window.v and not kick_window.v and not rban_window.v then
				warn_window.v = not warn_window.v
			end

			if imgui.Button(u8("BAN"), var_102_2) and not mute_window.v and not warn_window.v and not jail_window.v and not kick_window.v and not rban_window.v then
				ban_window.v = not ban_window.v
			end

			if imgui.Button(u8("RBAN"), var_102_2) and not mute_window.v and not warn_window.v and not jail_window.v and not kick_window.v and not ban_window.v and sp_info == true then
				if admin_lvl >= 4 then
					rban_window.v = not rban_window.v
				else
					message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
				end
			end

			imgui.End()
		end

		if mute_window.v then
			imgui.ShowCursor = true

			local var_102_4, var_102_5 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_4 / 2, var_102_5 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(610, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8(" \xCF\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 %s[%d]"), sp_player_name, sp_player_id), mute_window)
			imgui.Separator()
			imgui.ListBox(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0"), selected_item, mute_reasons_mass_2, 5)

			if imgui.IsItemHovered() and imgui.IsItemActive() and imgui.IsMouseDoubleClicked(0) then
				if admin_lvl > 1 then
					sampSendChat(string.format("/mute %d %s.", sp_player_id, mute_reasons_mass[selected_item.v + 1]))
				else
					sampSendChat(string.format("/a /mute %d %s.", sp_player_id, mute_reasons_mass[selected_item.v + 1]))
				end

				selected_item = imgui.ImInt(-1)
				mute_window.v = not mute_window.v
				fast_commands_dialog.v = false
			end

			imgui.Separator()
			imgui.Text("\n")

			if selected_item.v == -1 then
				imgui.SetWindowSize(imgui.ImVec2(610, 210))
				imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEA\xEE\xEB-\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3"), fast_command_reason_buffer)

				if window_open == false then
					imgui.SetKeyboardFocusHere()

					window_open = true
				end
			else
				imgui.SetWindowSize(imgui.ImVec2(610, 185))
			end

			if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC"), btn_size) or imgui.IsKeyPressed(var_0_5.VK_RETURN, false) then
				if selected_item.v ~= -1 then
					if admin_lvl > 1 then
						sampSendChat(string.format("/mute %d %s.", sp_player_id, mute_reasons_mass[selected_item.v + 1]))
					else
						sampSendChat(string.format("/a /mute %d %s.", sp_player_id, mute_reasons_mass[selected_item.v + 1]))
					end

					selected_item = imgui.ImInt(-1)
					mute_window.v = not mute_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
				elseif fast_command_reason_buffer.v ~= "" and string.match(fast_command_reason_buffer.v, "%d+%s+%S+") then
					if admin_lvl > 1 then
						sampSendChat(string.format("/mute %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					else
						sampSendChat(string.format("/a /mute %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					end

					selected_item = imgui.ImInt(-1)
					fast_command_reason_buffer.v = ""
					mute_window.v = not mute_window.v
				else
					message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5.")
				end
			end

			imgui.SameLine()

			if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
				selected_item = imgui.ImInt(-1)
				fast_command_reason_buffer.v = ""
			end

			imgui.SameLine()
			ShowHelpMarker(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5, \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\n\xD2\xE0\xEA\xE6\xE5, \xEC\xEE\xE6\xED\xEE \xF1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xE2\xE5\xE4\xE5\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5, \xED\xE0\xE6\xE0\xE2 \xED\xE0 \xF1\xEE\xEE\xF2\xE2\xE5\xF2\xF1\xF2\xE2\xF3\xFE\xF9\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3."))
			imgui.End()
		end

		if jail_window.v then
			imgui.ShowCursor = true

			local var_102_6, var_102_7 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_6 / 2, var_102_7 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(610, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8(" \xCF\xEE\xF1\xE0\xE4\xE8\xF2\xFC \xE2 \xF2\xFE\xF0\xFC\xEC\xF3 %s[%d]"), sp_player_name, sp_player_id), jail_window)
			imgui.Separator()
			imgui.ListBox(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0"), selected_item, jail_reasons_mass_2, 5)

			if imgui.IsItemHovered() and imgui.IsItemActive() and imgui.IsMouseDoubleClicked(0) then
				if admin_lvl > 1 then
					sampSendChat(string.format("/jail %d %s.", sp_player_id, jail_reasons_mass[selected_item.v + 1]))
				else
					sampSendChat(string.format("/a /jail %d %s.", sp_player_id, jail_reasons_mass[selected_item.v + 1]))
				end

				selected_item = imgui.ImInt(-1)
				jail_window.v = not jail_window.v
				fast_commands_dialog.v = false
			end

			imgui.Separator()
			imgui.Text("\n")

			if selected_item.v == -1 then
				imgui.SetWindowSize(imgui.ImVec2(610, 210))

				if window_open == false then
					imgui.SetKeyboardFocusHere()

					window_open = true
				end

				imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEA\xEE\xEB-\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3"), fast_command_reason_buffer)
			else
				imgui.SetWindowSize(imgui.ImVec2(610, 185))
			end

			if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC")) or imgui.IsKeyPressed(var_0_5.VK_RETURN, false) then
				if selected_item.v ~= -1 then
					if admin_lvl > 1 then
						sampSendChat(string.format("/jail %d %s.", sp_player_id, jail_reasons_mass[selected_item.v + 1]))
					else
						sampSendChat(string.format("/a /jail %d %s.", sp_player_id, jail_reasons_mass[selected_item.v + 1]))
					end

					jail_window.v = not jail_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				elseif fast_command_reason_buffer.v ~= "" and string.match(fast_command_reason_buffer.v, "%d+%s+%S+") then
					if admin_lvl > 1 then
						sampSendChat(string.format("/jail %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					else
						sampSendChat(string.format("/a /jail %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					end

					fast_command_reason_buffer.v = ""
					jail_window.v = not jail_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				else
					message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5.")
				end
			end

			imgui.SameLine()

			if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
				selected_item = imgui.ImInt(-1)
				fast_command_reason_buffer.v = ""
			end

			imgui.SameLine()
			ShowHelpMarker(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5, \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\n\xD2\xE0\xEA\xE6\xE5, \xEC\xEE\xE6\xED\xEE \xF1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xE2\xE5\xE4\xE5\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5, \xED\xE0\xE6\xE0\xE2 \xED\xE0 \xF1\xEE\xEE\xF2\xE2\xE5\xF2\xF1\xF2\xE2\xF3\xFE\xF9\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3."))
			imgui.End()
		end

		if kick_window.v then
			imgui.ShowCursor = true

			local var_102_8, var_102_9 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_8 / 2, var_102_9 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(550, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8(" \xCA\xE8\xEA\xED\xF3\xF2\xFC %s[%d]"), sp_player_name, sp_player_id), kick_window)
			imgui.Separator()
			imgui.ListBox(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0"), selected_item, kick_reasons_mass_2, 5)

			if imgui.IsItemHovered() and imgui.IsItemActive() and imgui.IsMouseDoubleClicked(0) then
				if admin_lvl > 1 then
					sampSendChat(string.format("/kick %d %s.", sp_player_id, kick_reasons_mass[selected_item.v + 1]))
				else
					sampSendChat(string.format("/a /kick %d %s.", sp_player_id, kick_reasons_mass[selected_item.v + 1]))
				end

				selected_item = imgui.ImInt(-1)
				kick_window.v = not kick_window.v
				fast_commands_dialog.v = false
			end

			imgui.Separator()
			imgui.Text("\n")

			if selected_item.v == -1 then
				imgui.SetWindowSize(imgui.ImVec2(610, 210))

				if window_open == false then
					imgui.SetKeyboardFocusHere()

					window_open = true
				end

				imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3"), fast_command_reason_buffer)
			else
				imgui.SetWindowSize(imgui.ImVec2(610, 185))
			end

			if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC")) or imgui.IsKeyPressed(var_0_5.VK_RETURN, false) then
				if selected_item.v ~= -1 then
					if admin_lvl > 1 then
						sampSendChat(string.format("/kick %d %s.", sp_player_id, kick_reasons_mass[selected_item.v + 1]))
					else
						sampSendChat(string.format("/a /kick %d %s.", sp_player_id, kick_reasons_mass[selected_item.v + 1]))
					end

					kick_window.v = not kick_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				elseif fast_command_reason_buffer.v ~= "" and string.match(fast_command_reason_buffer.v, "%S+") then
					if admin_lvl > 1 then
						sampSendChat(string.format("/kick %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					else
						sampSendChat(string.format("/a /kick %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					end

					fast_command_reason_buffer.v = ""
					kick_window.v = not kick_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				else
					message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5.")
				end
			end

			imgui.SameLine()

			if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
				selected_item = imgui.ImInt(-1)
				fast_command_reason_buffer.v = ""
			end

			imgui.SameLine()
			ShowHelpMarker(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5, \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\n\xD2\xE0\xEA\xE6\xE5, \xEC\xEE\xE6\xED\xEE \xF1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xE2\xE5\xE4\xE5\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5, \xED\xE0\xE6\xE0\xE2 \xED\xE0 \xF1\xEE\xEE\xF2\xE2\xE5\xF2\xF1\xF2\xE2\xF3\xFE\xF9\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3."))
			imgui.End()
		end

		if warn_window.v then
			imgui.ShowCursor = true

			local var_102_10, var_102_11 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_10 / 2, var_102_11 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(550, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8(" \xC2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 %s[%d]"), sp_player_name, sp_player_id), warn_window)
			imgui.Separator()
			imgui.ListBox(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0"), selected_item, warn_reasons_mass_2, 5)

			if imgui.IsItemHovered() and imgui.IsItemActive() and imgui.IsMouseDoubleClicked(0) then
				if admin_lvl > 2 then
					sampSendChat(string.format("/warn %d %s.", sp_player_id, warn_reasons_mass[selected_item.v + 1]))
				else
					sampSendChat(string.format("/a /warn %d %s.", sp_player_id, warn_reasons_mass[selected_item.v + 1]))
				end

				selected_item = imgui.ImInt(-1)
				warn_window.v = not warn_window.v
				fast_commands_dialog.v = false
			end

			imgui.Separator()
			imgui.Text("\n")

			if selected_item.v == -1 then
				imgui.SetWindowSize(imgui.ImVec2(610, 210))

				if window_open == false then
					imgui.SetKeyboardFocusHere()

					window_open = true
				end

				imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3"), fast_command_reason_buffer)
			else
				imgui.SetWindowSize(imgui.ImVec2(610, 185))
			end

			if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC")) or imgui.IsKeyPressed(var_0_5.VK_RETURN, false) then
				if selected_item.v ~= -1 then
					if admin_lvl > 2 then
						sampSendChat(string.format("/warn %d %s.", sp_player_id, warn_reasons_mass[selected_item.v + 1]))
					else
						sampSendChat(string.format("/a /warn %d %s.", sp_player_id, warn_reasons_mass[selected_item.v + 1]))
					end

					warn_window.v = not warn_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				elseif fast_command_reason_buffer.v ~= "" and string.match(fast_command_reason_buffer.v, "%S+") then
					if admin_lvl > 2 then
						sampSendChat(string.format("/warn %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					else
						sampSendChat(string.format("/a /warn %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					end

					fast_command_reason_buffer.v = ""
					warn_window.v = not warn_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				else
					message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5.")
				end
			end

			imgui.SameLine()

			if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
				selected_item = imgui.ImInt(-1)
				fast_command_reason_buffer.v = ""
			end

			imgui.SameLine()
			ShowHelpMarker(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5, \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\n\xD2\xE0\xEA\xE6\xE5, \xEC\xEE\xE6\xED\xEE \xF1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xE2\xE5\xE4\xE5\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5, \xED\xE0\xE6\xE0\xE2 \xED\xE0 \xF1\xEE\xEE\xF2\xE2\xE5\xF2\xF1\xF2\xE2\xF3\xFE\xF9\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3."))
			imgui.End()
		end

		if ban_window.v then
			imgui.ShowCursor = true

			local var_102_12, var_102_13 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_12 / 2, var_102_13 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(610, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8(" \xC7\xE0\xE1\xE0\xED\xE8\xF2\xFC %s[%d]"), sp_player_name, sp_player_id), ban_window)
			imgui.Separator()
			imgui.ListBox(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0"), selected_item, ban_reasons_mass_2, 5)

			if imgui.IsItemHovered() and imgui.IsItemActive() and imgui.IsMouseDoubleClicked(0) then
				if admin_lvl > 2 then
					sampSendChat(string.format("/ban %d %s.", sp_player_id, ban_reasons_mass[selected_item.v + 1]))
				else
					sampSendChat(string.format("/a /ban %d %s.", sp_player_id, ban_reasons_mass[selected_item.v + 1]))
				end

				selected_item = imgui.ImInt(-1)
				ban_window.v = not ban_window.v
				fast_commands_dialog.v = false
			end

			imgui.Separator()
			imgui.Text("\n")

			if selected_item.v == -1 then
				imgui.SetWindowSize(imgui.ImVec2(610, 210))

				if window_open == false then
					imgui.SetKeyboardFocusHere()

					window_open = true
				end

				imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEA\xEE\xEB-\xE2\xEE \xEC\xE8\xED\xF3\xF2 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3"), fast_command_reason_buffer)
			else
				imgui.SetWindowSize(imgui.ImVec2(610, 185))
			end

			if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC")) or imgui.IsKeyPressed(var_0_5.VK_RETURN, false) then
				if selected_item.v ~= -1 then
					if admin_lvl > 2 then
						sampSendChat(string.format("/ban %d %s.", sp_player_id, ban_reasons_mass[selected_item.v + 1]))
					else
						sampSendChat(string.format("/a /ban %d %s.", sp_player_id, ban_reasons_mass[selected_item.v + 1]))
					end

					ban_window.v = not ban_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
					selected_item = imgui.ImInt(-1)
				elseif fast_command_reason_buffer.v ~= "" and string.match(fast_command_reason_buffer.v, "%d+%s+%S+") then
					if admin_lvl > 2 then
						sampSendChat(string.format("/ban %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					else
						sampSendChat(string.format("/a /ban %d %s", sp_player_id, utf8toansi(fast_command_reason_buffer.v)))
					end

					fast_command_reason_buffer.v = ""
					selected_item = imgui.ImInt(-1)
					ban_window.v = not ban_window.v
					fast_commands_dialog.v = not fast_commands_dialog.v
				else
					message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xE4\xED\xE5\xE9 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5.")
				end
			end

			imgui.SameLine()

			if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
				selected_item = imgui.ImInt(-1)
				fast_command_reason_buffer.v = ""
			end

			imgui.SameLine()
			ShowHelpMarker(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0, \xEB\xE8\xE1\xEE \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xE4\xED\xE5\xE9 \xE8 \xEF\xF0\xE8\xF7\xE8\xED\xF3 \xE2 \xEF\xEE\xEB\xE5, \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xED\xE0\xE6\xEC\xE8\xF2\xE5 \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\n\xD2\xE0\xEA\xE6\xE5, \xEC\xEE\xE6\xED\xEE \xF1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xE2\xE5\xE4\xE5\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5, \xED\xE0\xE6\xE0\xE2 \xED\xE0 \xF1\xEE\xEE\xF2\xE2\xE5\xF2\xF1\xF2\xE2\xF3\xFE\xF9\xF3\xFE \xEA\xED\xEE\xEF\xEA\xF3."))
			imgui.End()
		end

		if rban_window.v then
			imgui.ShowCursor = true

			local var_102_14, var_102_15 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_14 / 2, var_102_15 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(230, 210), imgui.Cond.FirstUseEver)
			imgui.Begin(string.format(u8("\xC7\xE0\xE1\xEB\xEE\xEA\xE8\xF0\xEE\xE2\xE0\xF2\xFC \xEF\xEE\xE4\xF1\xE5\xF2\xFC %s[%d]"), sp_player_name, sp_player_id), rban_window, imgui.WindowFlags.AlwaysAutoResize)
			imgui.Text(u8(string.format("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0: %s [%d]\nIP-\xE0\xE4\xF0\xE5\xF1 \xE8\xE3\xF0\xEE\xEA\xE0: %s.\n", sp_player_name, sp_player_id, sp_IP)))
			imgui.Text(u8("\xCF\xEE\xE4\xF1\xE5\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 \xE1\xF3\xE4\xE5\xF2 \xE7\xE0\xE1\xEB\xEE\xEA\xE8\xF0\xEE\xE2\xE0\xED\xE0 \xED\xE0 10 \xE4\xED\xE5\xE9."))
			imgui.Separator()

			if imgui.Button(u8("\xC7\xE0\xE1\xEB\xEE\xEA\xE8\xF0\xEE\xE2\xE0\xF2\xFC")) then
				sampSendChat(string.format("/rban %d", sp_player_id))
			end

			imgui.End()
		end

		if not fast_commands_dialog.v and show_main_window.v then
			if show_main_window.v then
				imgui.ShowCursor = true

				lockPlayerControl(true)

				local var_102_16, var_102_17 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_16 / 2, var_102_17 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(300, 275), imgui.Cond.FirstUseEver)
				imgui.Begin("AdminTools", show_main_window, imgui.WindowFlags.NoResize)

				local var_102_18 = imgui.ImVec2(-0.1, 0)

				if imgui.Button(u8("\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE0\xF6\xE8\xFF"), var_102_18) then
					if admin_lvl >= 3 then
						teleportation_window.v = not teleportation_window.v
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xCE\xE1\xFA\xFF\xE2\xE8\xF2\xFC \xEE\xE1 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE8"), var_102_18) then
					if admin_lvl >= 4 then
						event_window.v = not event_window.v
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xC2\xF0\xE5\xEC\xE5\xED\xED\xEE\xE5 \xEB\xE8\xE4\xE5\xF0\xF1\xF2\xE2\xEE \xE8 \xF0\xE0\xE1\xEE\xF2\xE0"), var_102_18) then
					if admin_lvl >= 3 then
						templeader_window.v = not templeader_window.v
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9"), var_102_18) then
					if admin_lvl >= 3 then
						punishment_window.v = not punishment_window.v
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xCE\xED\xEB\xE0\xE9\xED \xEB\xE8\xE4\xE5\xF0\xEE\xE2"), var_102_18) then
					if admin_lvl >= 3 then
						show_main_window.v = false
						var_0_35 = true
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xC8\xE7\xEC\xE5\xED\xE8\xF2\xFC \xEF\xEE\xE3\xEE\xE4\xF3"), var_102_18) then
					if admin_lvl >= 4 then
						weather_window.v = not weather_window.v
					else
						message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xF0\xE5\xE4\xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
					end
				end

				if imgui.Button(u8("\xD1\xF2\xE0\xF2\xE8\xF1\xF2\xE8\xEA\xE0"), var_102_18) then
					statistic_window.v = not statistic_window.v
				end

				if imgui.Button(u8("\xCD\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE8"), var_102_18) then
					settings_window.v = not settings_window.v
				end

				if imgui.Button(u8("\xCF\xEE\xEC\xEE\xF9\xFC"), var_102_18) then
					help_window.v = not help_window.v
				end

				if imgui.Button(u8("\xCE \xF1\xEA\xF0\xE8\xEF\xF2\xE5"), var_102_18) then
					about_window.v = not about_window.v
				end

				imgui.End()
			end

			if leaders_online_window.v then
				local var_102_19, var_102_20 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_19 / 2, var_102_20 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(600, 290), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCE\xED\xEB\xE0\xE9\xED \xEB\xE8\xE4\xE5\xF0\xEE\xE2"), leaders_online_window, imgui.WindowFlags.AlwaysAutoResize)
				imgui.Columns(7, "onlinecolumns")
				imgui.Separator()
				imgui.Text(u8("        \xCD\xE8\xEA \xEB\xE8\xE4\xE5\xF0\xE0"))
				imgui.SetColumnWidth(-1, 140)
				imgui.NextColumn()
				imgui.Text(u8("\xC2 \xE8\xE3\xF0\xE5 \xF1\xE5\xE3\xEE\xE4\xED\xFF"))
				imgui.SetColumnWidth(-1, 105)
				imgui.NextColumn()
				imgui.Text(u8("\xC2 \xE8\xE3\xF0\xE5 \xE2\xF7\xE5\xF0\xE0"))
				imgui.SetColumnWidth(-1, 90)
				imgui.NextColumn()
				imgui.Text(u8("AFK \xE7\xE0 \xF1\xE5\xE3\xEE\xE4\xED\xFF"))
				imgui.SetColumnWidth(-1, 105)
				imgui.NextColumn()
				imgui.Text(u8("AFK \xE7\xE0 \xE2\xF7\xE5\xF0\xE0"))
				imgui.SetColumnWidth(-1, 95)
				imgui.NextColumn()
				imgui.Text(u8("\xD4\xE0\xEA\xF2. \xE7\xE0 \xF1\xE5\xE3\xEE\xE4\xED\xFF"))
				imgui.SetColumnWidth(-1, 110)
				imgui.NextColumn()
				imgui.Text(u8("\xD4\xE0\xEA\xF2. \xE7\xE0 \xE2\xF7\xE5\xF0\xE0"))
				imgui.SetColumnWidth(-1, 130)
				imgui.NextColumn()
				imgui.Separator()

				for iter_102_0, iter_102_1 in ipairs(leaders_online_mass) do
					if string.find(iter_102_1, "#") then
						local var_102_21 = string.sub(iter_102_1, 1, #iter_102_1 - 1)

						imgui.Text(u8(var_102_21))
					else
						imgui.Text(u8(iter_102_1))
					end

					imgui.NextColumn()

					if string.find(iter_102_1, "#") and iter_102_0 ~= #leaders_online_mass then
						imgui.Separator()
					end
				end

				imgui.Columns(1)
				imgui.Separator()
				imgui.Text(u8("                                                                                                                                                                                                                      "))
				imgui.End()
			end

			if about_window.v then
				local var_102_22, var_102_23 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_22 / 2, var_102_23 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(330, 150), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCE \xF1\xEA\xF0\xE8\xEF\xF2\xE5"), about_window, imgui.WindowFlags.AlwaysAutoResize)
				imgui.Text(u8("AdminTools"))
				imgui.Text(u8("\xC2\xE5\xF0\xF1\xE8\xFF: ") .. thisScript().version)
				imgui.Text(u8("\xD0\xE0\xE7\xF0\xE0\xE1\xEE\xF2\xF7\xE8\xEA: James Turner"))
				imgui.Text(u8("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE5\xEC\xE0\xFF \xE2\xE5\xF0\xF1\xE8\xFF MoonLoader: ") .. getMoonloaderVersion())
				imgui.Text(u8("\xCE\xF2\xE4\xE5\xEB\xFC\xED\xE0\xFF \xE1\xEB\xE0\xE3\xEE\xE4\xE0\xF0\xED\xEE\xF1\xF2\xFC \xEA\xEE\xEC\xE0\xED\xE4\xE5 \xEF\xEE\xF0\xF2\xE0\xEB\xE0 blast.hk."))
				imgui.Separator()

				if imgui.Button(u8("\xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xFF")) then
					noupdatefound = false

					print("\xCF\xF0\xEE\xE2\xE5\xF0\xEA\xE0 \xED\xE0\xEB\xE8\xF7\xE8\xFF \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE9...")
					download("GET", "https://raw.githubusercontent.com/Garrus93/admintools/master/version.json")

					if not update_window.v then
						update_window.v = not update_window.v
					end
				end

				imgui.SameLine()

				if imgui.Button(u8("\xCF\xEE\xE4\xE4\xE5\xF0\xE6\xE0\xF2\xFC \xF0\xE0\xE7\xF0\xE0\xE1\xEE\xF2\xF7\xE8\xEA\xE0")) then
					var_0_2.cdef("\t\t\t\t\tvoid* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n\t\t\t\t\tuint32_t __stdcall CoInitializeEx(void*, uint32_t);\n\t\t\t\t")

					local var_102_24 = var_0_2.load("Shell32")

					var_0_2.load("Ole32").CoInitializeEx(nil, 6)
					print(var_102_24.ShellExecuteA(nil, "open", "http://donatepay.ru/donation/75267", nil, nil, 1))
				end

				imgui.End()
			end

			if statistic_window.v then
				local var_102_25, var_102_26 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_25 / 2, var_102_26 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(330, 290), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xD1\xF2\xE0\xF2\xE8\xF1\xF2\xE8\xEA\xE0"), statistic_window, imgui.WindowFlags.AlwaysAutoResize)

				local var_102_27 = math.floor(gameClock())
				local var_102_28 = math.floor(var_102_27 / 86400)
				local var_102_29 = var_102_27 - var_102_28 * 86400
				local var_102_30 = math.floor(var_102_29 / 3600)
				local var_102_31 = var_102_29 - var_102_30 * 3600
				local var_102_32 = math.floor(var_102_31 / 60)
				local var_102_33 = var_102_31 - var_102_32 * 60

				if seconds_all then
					seconds_all2 = seconds_all + math.floor(gameClock())
					days_all = math.floor(seconds_all2 / 86400)
					seconds_all2 = seconds_all2 - days_all * 86400
					hours_all = math.floor(seconds_all2 / 3600)
					seconds_all2 = seconds_all2 - hours_all * 3600
					minutes_all = math.floor(seconds_all2 / 60)
					seconds_all2 = seconds_all2 - math.floor(minutes_all * 60)
				else
					days_all = 0
					hours_all = 0
					minutes_all = 0
					seconds_all2 = 0
				end

				imgui.Columns(3, "statcolumns")
				imgui.Separator()
				imgui.Text(u8("             \xCD\xE0\xE7\xE2\xE0\xED\xE8\xE5"))
				imgui.SetColumnWidth(-1, 170)
				imgui.NextColumn()
				imgui.Text(u8("\xC7\xE0 \xF2\xE5\xEA\xF3\xF9\xF3\xFE\n   \xF1\xE5\xF1\xF1\xE8\xFE"))
				imgui.SetColumnWidth(-1, 80)
				imgui.NextColumn()
				imgui.Text(u8("    \xC2\xF1\xE5\xE3\xEE"))
				imgui.SetColumnWidth(-1, 180)
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xCE\xF2\xE2\xE5\xF2\xEE\xE2 \xED\xE0 \xF0\xE5\xEF\xEE\xF0\xF2\xFB"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_38))
				imgui.NextColumn()
				imgui.Text(tostring(stats_ans_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xCF\xEE\xF1\xF2\xE0\xE2\xEB\xE5\xED\xEE \xE7\xE0\xF2\xFB\xF7\xE5\xEA"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_39))
				imgui.NextColumn()
				imgui.Text(tostring(stats_mute_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xCA\xE8\xEA\xEE\xE2 \xE8\xE3\xF0\xEE\xEA\xEE\xE2"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_40))
				imgui.NextColumn()
				imgui.Text(tostring(stats_kick_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xD2\xE8\xF5\xE8\xF5 \xEA\xE8\xEA\xEE\xE2 \xE8\xE3\xF0\xEE\xEA\xEE\xE2"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_41))
				imgui.NextColumn()
				imgui.Text(tostring(stats_skick_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xCF\xEE\xF1\xE0\xE6\xE5\xED\xEE \xE2 \xCA\xCF\xC7"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_42))
				imgui.NextColumn()
				imgui.Text(tostring(stats_jail_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xC2\xFB\xE4\xE0\xED\xEE \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_43))
				imgui.NextColumn()
				imgui.Text(tostring(stats_warn_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xC1\xE0\xED\xEE\xE2 \xE8\xE3\xF0\xEE\xEA\xEE\xE2"))
				imgui.NextColumn()
				imgui.Text(tostring(var_0_44))
				imgui.NextColumn()
				imgui.Text(tostring(stats_ban_counter_all))
				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xCF\xF0\xEE\xE2\xE5\xE4\xE5\xED\xEE \xE2\xF0\xE5\xEC\xE5\xED\xE8 \xE2\n\xE8\xE3\xF0\xE5"))
				imgui.NextColumn()
				imgui.Text(u8(var_102_28 .. " \xE4\xED\xE5\xE9\n" .. var_102_30 .. " \xF7\xE0\xF1\xEE\xE2\n" .. var_102_32 .. " \xEC\xE8\xED\xF3\xF2\n" .. var_102_33 .. " \xF1\xE5\xEA\xF3\xED\xE4"))
				imgui.NextColumn()
				imgui.Text(u8(days_all .. " \xE4\xED\xE5\xE9\n" .. hours_all .. " \xF7\xE0\xF1\xEE\xE2\n" .. minutes_all .. " \xEC\xE8\xED\xF3\xF2\n" .. seconds_all2 .. " \xF1\xE5\xEA\xF3\xED\xE4"))
				imgui.Columns(1)
				imgui.Separator()
				imgui.Text(u8("                                                                                          "))
				imgui.End()
			end

			if punishment_window.v then
				local var_102_34, var_102_35 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_34 / 2, var_102_35 / 3), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(600, 300), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9"), punishment_window, imgui.WindowFlags.AlwaysAutoResize)
				imgui.Columns(6, "plcolumns")
				imgui.Separator()
				imgui.Text(" #")
				imgui.SetColumnWidth(-1, 25)
				imgui.NextColumn()
				imgui.Text("  ID")
				imgui.SetColumnWidth(-1, 40)
				imgui.NextColumn()
				imgui.Text(u8("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0"))
				imgui.SetColumnWidth(-1, 180)
				imgui.NextColumn()
				imgui.Text(u8("\xC4\xE5\xE9\xF1\xF2\xE2\xE8\xE5"))
				imgui.SetColumnWidth(-1, 70)
				imgui.NextColumn()
				imgui.Text(u8("\xCA\xEE\xEB-\xE2\xEE"))
				imgui.SetColumnWidth(-1, 50)
				imgui.NextColumn()
				imgui.Text(u8(" \xCF\xF0\xE8\xF7\xE8\xED\xE0"))
				imgui.NextColumn()
				imgui.Separator()

				for iter_102_2, iter_102_3 in ipairs(pl_nickname) do
					plCommand = pl_command[iter_102_2]

					if plCommand ~= -1 then
						if plCommand == "/jail" then
							nak = "  \xD2\xFE\xF0\xFC\xEC\xE0"
						elseif plCommand == "/warn" then
							nak = "    \xCF\xF0\xE5\xE4."
						elseif plCommand == "/mute" then
							nak = "  \xC7\xE0\xF2\xFB\xF7\xEA\xE0"
						elseif plCommand == "/ban" then
							nak = "     \xC1\xE0\xED"
						elseif plCommand == "/unwarn" then
							nak = "  \xD1\xED. \xEF\xF0\xE5\xE4."
						elseif plCommand == "/unjail" then
							nak = " \xC2\xFB\xEF\xF3\xF1\xF2\xE8\xF2\xFC"
						elseif plCommand == "/unmute" then
							nak = "    \xD1\xED. \xE7\xE0\xF2."
						end

						plTerm = pl_term[iter_102_2]

						if plTerm == -1 then
							plTerm = "---"
						end

						if pl_ids[iter_102_2] ~= "  ---" then
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(iter_102_2))
							imgui.NextColumn()
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(pl_ids[iter_102_2]))
							imgui.NextColumn()
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(iter_102_3))
							imgui.NextColumn()
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(nak))
							imgui.NextColumn()
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(plTerm))
							imgui.NextColumn()
							imgui.TextColored(imgui.ImVec4(0.2, 0.8, 0.2, 1), u8(pl_reason[iter_102_2]))
							imgui.NextColumn()
						else
							imgui.Text(u8(iter_102_2))
							imgui.NextColumn()
							imgui.Text(u8(pl_ids[iter_102_2]))
							imgui.NextColumn()
							imgui.Text(u8(iter_102_3))
							imgui.NextColumn()
							imgui.Text(u8(nak))
							imgui.NextColumn()
							imgui.Text(u8(plTerm))
							imgui.NextColumn()
							imgui.Text(u8(pl_reason[iter_102_2]))
							imgui.NextColumn()
						end
					else
						ShowHelpMarker(u8("\xCF\xF0\xEE\xE2\xE5\xF0\xFC\xF2\xE5 \xEF\xF0\xE0\xE2\xE8\xEB\xFC\xED\xEE\xF1\xF2\xFC \xED\xE0\xEF\xE8\xF1\xE0\xED\xE8\xFF \xEA\xEE\xEC\xE0\xED\xE4\xFB \xE2 \xF4\xE0\xE9\xEB\xE5 punishment_list.txt"))
						imgui.NextColumn()
						imgui.Text("  ---")
						imgui.NextColumn()
						imgui.Text("---")
						imgui.NextColumn()
						imgui.Text("      ---")
						imgui.NextColumn()
						imgui.Text("---")
						imgui.NextColumn()
						imgui.Text("---")
						imgui.NextColumn()
					end

					if iter_102_2 ~= #pl_nickname then
						imgui.Separator()
					end
				end

				if #pl_nickname == 0 then
					ShowHelpMarker(u8("\xD4\xE0\xE9\xEB \xF1 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF\xEC\xE8 (punishment_list.txt) \xEF\xF3\xF1\xF2."))
					imgui.NextColumn()
					imgui.Text("  ---")
					imgui.NextColumn()
					imgui.Text("---")
					imgui.NextColumn()
					imgui.Text("      ---")
					imgui.NextColumn()
					imgui.Text("---")
					imgui.NextColumn()
					imgui.Text("---")
					imgui.NextColumn()
				end

				imgui.Columns(1)
				imgui.Separator()
				imgui.Text(u8("                                                                                                                                                              "))

				if #pl_nickname ~= 0 then
					if pl_processing == false then
						if imgui.Button(u8("\xC2\xFB\xE4\xE0\xF2\xFC")) then
							lua_thread.create(pl_thread)
						end
					else
						imgui.Text(u8("  \xCF\xF0\xEE\xE2\xEE\xE4\xE8\xF2\xF1\xFF \xE2\xFB\xE4\xE0\xF7\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9..."))
					end
				end

				imgui.End()
			end

			if event_window.v then
				local var_102_36, var_102_37 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_36 / 2, var_102_37 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(400, 300), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCE\xE1\xFA\xFF\xE2\xE8\xF2\xFC \xEE \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE8"), event_window, imgui.WindowFlags.AlwaysAutoResize)

				if not edit_mp then
					imgui.Combo(u8("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5"), nomer_mp, eventsNameMass)

					if nomer_mp.v + 1 > 5 then
						message("\xC2\xEE\xE7\xEC\xEE\xE6\xED\xEE\xF1\xF2\xFC \xE2\xFB\xE1\xEE\xF0\xE0 \xE1\xEE\xEB\xE5\xE5 5-\xF2\xE8 \xED\xEE\xE2\xEE\xF1\xF2\xE5\xE9 \xE2 \xE4\xE0\xED\xED\xFB\xE9 \xEC\xEE\xEC\xE5\xED\xF2 \xED\xE5\xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0.")

						nomer_mp.v = 0
					end

					if imgui.Button(u8("\xC4\xEE\xE1\xE0\xE2\xE8\xF2\xFC")) then
						if #eventsNameMass < 5 then
							editedText = {}
							EditBoxBuffer.v = u8("\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xD1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xE9\xE4\xE5\xF2 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname}.\n\xC6\xE5\xEB\xE0\xFE\xF9\xE8\xE5 \xEF\xEE\xEF\xE0\xF1\xF2\xFC \xED\xE0 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 - \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /tp.\n\xCF\xF0\xE8\xE7: {prize}. \xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}.\n")
							add_mp = not add_mp
							edit_mp = not edit_mp
						else
							message("\xC2\xEE\xE7\xEC\xEE\xE6\xED\xEE\xF1\xF2\xFC \xE2\xFB\xE1\xEE\xF0\xE0 \xE1\xEE\xEB\xE5\xE5 5-\xF2\xE8 \xED\xEE\xE2\xEE\xF1\xF2\xE5\xE9 \xE2 \xE4\xE0\xED\xED\xFB\xE9 \xEC\xEE\xEC\xE5\xED\xF2 \xED\xE5\xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0.")
						end
					end

					imgui.SameLine()

					if imgui.Button(u8("\xD0\xE5\xE4\xE0\xEA\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC")) then
						edit_mp = not edit_mp
						EditBoxBuffer.v = ""
						newEventBuffer.v = eventsNameMass[nomer_mp.v + 1]
						editedText = {}

						if not finish_event.v then
							for iter_102_4, iter_102_5 in pairs(eventsMass.events[nomer_mp.v + 1].start) do
								EditBoxBuffer.v = EditBoxBuffer.v .. u8(iter_102_5) .. "\n"
							end
						else
							for iter_102_6, iter_102_7 in pairs(eventsMass.events[nomer_mp.v + 1].finish) do
								EditBoxBuffer.v = EditBoxBuffer.v .. u8(iter_102_7) .. "\n"
							end
						end
					end

					imgui.SameLine()

					if imgui.Button(u8("\xD3\xE4\xE0\xEB\xE8\xF2\xFC")) then
						table.remove(eventsMass.events, nomer_mp.v + 1)
						table.remove(eventsNameMass, nomer_mp.v + 1)

						local var_102_38 = io.open("moonloader\\AdminTools\\events.json", "w")

						var_102_38:write(encodeJson(eventsMass))
						io.close(var_102_38)

						nomer_mp.v = 0
					end
				end

				if edit_mp then
					imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xED\xE0\xE7\xE2\xE0\xED\xE8\xE5 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF"), newEventBuffer)
					imgui.Separator()
					imgui.InputTextMultiline("##source", EditBoxBuffer, imgui.ImVec2(-1, imgui.GetTextLineHeight() * 16))
					imgui.Separator()

					if imgui.Button(u8("\xD1\xEE\xF5\xF0\xE0\xED\xE8\xF2\xFC")) then
						local var_102_39 = EditBoxBuffer.v

						repeat
							local var_102_40, var_102_41 = string.find(var_102_39, "\n")

							if var_102_40 and var_102_41 then
								local var_102_42 = string.sub(var_102_39, 1, var_102_40 - 1)

								var_102_39 = string.sub(var_102_39, var_102_40 + 1, #var_102_39)

								table.insert(editedText, utf8toansi(var_102_42))
							else
								break
							end
						until false

						if not finish_event.v then
							if not add_mp then
								eventsMass.events[nomer_mp.v + 1].start.str1 = editedText[1]
								eventsMass.events[nomer_mp.v + 1].start.str2 = editedText[2]
								eventsMass.events[nomer_mp.v + 1].start.str3 = editedText[3]
								eventsMass.events[nomer_mp.v + 1].name = utf8toansi(newEventBuffer.v)
								eventsNameMass[nomer_mp.v + 1] = newEventBuffer.v
							else
								local var_102_43 = {
									name = utf8toansi(newEventBuffer.v),
									start = {
										str1 = editedText[1],
										str2 = editedText[2],
										str3 = editedText[3]
									},
									finish = {
										str3 = "\xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}. \xD1\xEF\xE0\xF1\xE8\xE1\xEE \xE7\xE0 \xF3\xF7\xE0\xF1\xF2\xE8\xE5!",
										str2 = "\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}. \xCF\xF0\xE8\xE7: {prize}.",
										str1 = "\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname} \xEE\xEA\xEE\xED\xF7\xE5\xED\xEE."
									}
								}

								table.insert(eventsMass.events, var_102_43)
								table.insert(eventsNameMass, newEventBuffer.v)

								add_mp = false
							end
						elseif not add_mp then
							eventsMass.events[nomer_mp.v + 1].finish.str1 = editedText[1]
							eventsMass.events[nomer_mp.v + 1].finish.str2 = editedText[2]
							eventsMass.events[nomer_mp.v + 1].finish.str3 = editedText[3]
							eventsMass.events[nomer_mp.v + 1].name = utf8toansi(newEventBuffer.v)
							eventsNameMass[nomer_mp.v + 1] = newEventBuffer.v
						else
							local var_102_44 = {
								name = utf8toansi(newEventBuffer.v),
								start = {
									str1 = editedText[1],
									str2 = editedText[2],
									str3 = editedText[3]
								},
								finish = {
									str3 = "\xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}. \xD1\xEF\xE0\xF1\xE8\xE1\xEE \xE7\xE0 \xF3\xF7\xE0\xF1\xF2\xE8\xE5!",
									str2 = "\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}. \xCF\xF0\xE8\xE7: {prize}.",
									str1 = "\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xCC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname} \xEE\xEA\xEE\xED\xF7\xE5\xED\xEE."
								}
							}

							table.insert(eventsMass.events, var_102_44)
							table.insert(eventsNameMass, newEventBuffer.v)

							add_mp = false
						end

						local var_102_45 = io.open("moonloader\\AdminTools\\events.json", "w")

						var_102_45:write(encodeJson(eventsMass))
						io.close(var_102_45)

						edit_mp = not edit_mp
					end

					imgui.SameLine()

					if imgui.Button(u8("\xCE\xF2\xEC\xE5\xED\xE0")) then
						edit_mp = not edit_mp
					end

					imgui.SameLine()

					if imgui.Button(u8("\xD2\xFD\xE3\xE8")) then
						tags_mp = not tags_mp
					end

					imgui.SameLine()

					if imgui.Button(u8("\xC2\xEE\xF1\xF1\xF2\xE0\xED\xEE\xE2\xE8\xF2\xFC")) then
						EditBoxBuffer.v = u8("\xD3\xE2\xE0\xE6\xE0\xE5\xEC\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE8! \xD1\xE5\xE9\xF7\xE0\xF1 \xEF\xF0\xEE\xE9\xE4\xE5\xF2 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 {eventname}.\n\xC6\xE5\xEB\xE0\xFE\xF9\xE8\xE5 \xEF\xEE\xEF\xE0\xF1\xF2\xFC \xED\xE0 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 - \xE2\xE2\xE5\xE4\xE8\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 /tp.\n\xCF\xF0\xE8\xE7: {prize}. \xD1\xEF\xEE\xED\xF1\xEE\xF0(-\xFB) \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {sponsor}.\n")
					end

					if tags_mp then
						imgui.Separator()
						imgui.Text(u8("\xCD\xE0\xE7\xE2\xE0\xED\xE8\xE5 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF: {eventname}\n\xD1\xEF\xEE\xED\xF1\xEE\xF0: {sponsor}\n\xCF\xF0\xE8\xE7: {prize}\n\xCF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFC: {winner}\n\xC4\xEE\xEF. \xEF\xE0\xF0\xE0\xEC\xE5\xF2\xF0 1: {param1}\n\xC4\xEE\xEF. \xEF\xE0\xF0\xE0\xEC\xE5\xF2\xF0 2: {param2}"))
					end
				else
					imgui.Checkbox(u8("\xCE\xE1\xFA\xFF\xE2\xE8\xF2\xFC \xEE \xEA\xEE\xED\xF6\xE5 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xFF"), finish_event)
					imgui.Text("\n")
					imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xF1\xEF\xEE\xED\xF1\xEE\xF0\xE0"), sponsor_text_buffer)
					imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEF\xF0\xE8\xE7"), priz_text_buffer)
					imgui.InputText(u8("\xC4\xEE\xEF. \xEF\xE0\xF0\xE0\xEC\xE5\xF2\xF0"), param1)
					imgui.InputText(u8("\xC4\xEE\xEF. \xEF\xE0\xF0\xE0\xEC\xE5\xF2\xF0 2"), param2)

					eventsMass2 = {}

					if finish_event.v then
						imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 \xEF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFF"), pobeditel_text_buffer)
						imgui.Text(u8("\n\xCF\xF0\xE5\xE4\xE2\xE0\xF0\xE8\xF2\xE5\xEB\xFC\xED\xFB\xE9 \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0:"))
						imgui.Separator()

						for iter_102_8, iter_102_9 in pairs(eventsMass.events[nomer_mp.v + 1].finish) do
							endStr = iter_102_9
							endStr = string.gsub(endStr, "{eventname}", "\"" .. utf8toansi(eventsNameMass[nomer_mp.v + 1]) .. "\"")
							endStr = string.gsub(endStr, "{sponsor}", utf8toansi(sponsor_text_buffer.v))
							endStr = string.gsub(endStr, "{prize}", utf8toansi(priz_text_buffer.v))
							endStr = string.gsub(endStr, "{winner}", utf8toansi(pobeditel_text_buffer.v))
							endStr = string.gsub(endStr, "{param1}", utf8toansi(param1.v))
							endStr = string.gsub(endStr, "{param2}", utf8toansi(param2.v))

							imgui.Text(string.format(u8(endStr)))
							table.insert(eventsMass2, endStr)
						end
					else
						imgui.Text(u8("\n\xCF\xF0\xE5\xE4\xE2\xE0\xF0\xE8\xF2\xE5\xEB\xFC\xED\xFB\xE9 \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0:"))
						imgui.Separator()

						for iter_102_10, iter_102_11 in pairs(eventsMass.events[nomer_mp.v + 1].start) do
							startStr = iter_102_11
							startStr = string.gsub(startStr, "{eventname}", "\"" .. utf8toansi(eventsNameMass[nomer_mp.v + 1]) .. "\"")
							startStr = string.gsub(startStr, "{sponsor}", utf8toansi(sponsor_text_buffer.v))
							startStr = string.gsub(startStr, "{prize}", utf8toansi(priz_text_buffer.v))
							startStr = string.gsub(startStr, "{winner}", utf8toansi(pobeditel_text_buffer.v))
							startStr = string.gsub(startStr, "{param1}", utf8toansi(param1.v))
							startStr = string.gsub(startStr, "{param2}", utf8toansi(param2.v))

							imgui.Text(string.format(u8(startStr)))
							table.insert(eventsMass2, startStr)
						end
					end

					imgui.Separator()
					imgui.Text("\n")

					if mp_processing == false then
						if imgui.Button(u8("\xCE\xE1\xFA\xFF\xE2\xE8\xF2\xFC"), btn_size) then
							if nomer_mp.v ~= -1 then
								local var_102_46 = string.len(sponsor_text_buffer.v)
								local var_102_47 = string.len(priz_text_buffer.v)
								local var_102_48 = string.len(pobeditel_text_buffer.v)

								if var_102_46 > 0 and var_102_47 > 0 and not finish_event.v then
									lua_thread.create(event_msg_thread, "start", nomer_mp, priz_text_buffer, sponsor_text_buffer, pobeditel_text_buffer)
								elseif var_102_46 > 0 and var_102_47 > 0 and finish_event.v then
									if var_102_48 > 0 then
										lua_thread.create(event_msg_thread, "end", nomer_mp, priz_text_buffer, sponsor_text_buffer, pobeditel_text_buffer)

										event_msg = "end"
									else
										message("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xED\xE8\xEA \xEF\xEE\xE1\xE5\xE4\xE8\xF2\xE5\xEB\xFF!")
									end
								else
									message("\xC2\xE2\xE5\xE4\xE5\xED\xFB \xED\xE5 \xE2\xF1\xE5 \xE4\xE0\xED\xED\xFB\xE5!")
								end
							else
								message("\xC2\xFB\xE1\xE5\xF0\xE8\xF2\xE5 \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE5 \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0!")
							end
						end
					else
						imgui.Text(u8("\xCE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE5 \xED\xEE\xE2\xEE\xF1\xF2\xE8..."))
					end
				end

				imgui.End()
			end

			if help_window.v then
				local var_102_49, var_102_50 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_49 / 2, var_102_50 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(1000, 440), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCF\xEE\xEC\xEE\xF9\xFC"), help_window)
				imgui.BeginChild("help left pane", imgui.ImVec2(200, 0), true)

				for iter_102_12 = 1, 4 do
					if imgui.Selectable(help[iter_102_12], help_selected == iter_102_12) then
						help_selected = iter_102_12
					end
				end

				imgui.EndChild()
				imgui.SameLine()

				if help_selected == 1 then
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))
					imgui.Columns(2, "helpcolumns", false)
					show_help("/at", "\xCE\xF2\xEA\xF0\xFB\xF2\xFC \xE3\xEB\xE0\xE2\xED\xEE\xE5 \xEC\xE5\xED\xFE \xF1\xEA\xF0\xE8\xEF\xF2\xE0.")
					show_help("/hist [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xE8\xF1\xF2\xEE\xF0\xE8\xFE \xE8\xE7\xEC\xE5\xED\xE5\xED\xE8\xFF \xED\xE8\xEA\xEE\xE2 \xE8\xE3\xF0\xEE\xEA\xE0.")
					show_help("/getcar [ID \xD2/\xD1]", "\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC \xF2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xED\xEE\xE5 \xF1\xF0\xE5\xE4\xF1\xF2\xE2\xEE \xEA \xF1\xE5\xE1\xE5.")
					show_help("/reg [ID \xE8\xEB\xE8 \xED\xE8\xEA]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFE \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE5 \xE8\xE3\xF0\xEE\xEA\xE0.")
					show_help("/areg [ID \xE8\xEB\xE8 \xED\xE8\xEA]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFE \xEE\xE1 IP \xE0\xE4\xF0\xE5\xF1\xE5 \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 \xE0\xE4\xEC. \xF7\xE0\xF2\xE5.")
					show_help("/iget [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFE \xEE\xE1 \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE5.")
					show_help("/ilip [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC /lip \xEF\xEE ID \xE8\xE3\xF0\xEE\xEA\xE0.")
					show_help("/lipbans [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xE0\xEA\xEA\xE0\xF3\xED\xF2\xFB \xE8\xE7 \xF1\xEF\xE8\xF1\xEA\xE0 LIP \xED\xE0 \xED\xE0\xEB\xE8\xF7\xE8\xE5 \xE2 \xE1\xE0\xED-\xEB\xE8\xF1\xF2\xE5.")
					show_help("/forum", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xED\xE0\xE7\xE2\xE0\xED\xE8\xFF 20 \xEF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xF5 \xF2\xE5\xEC \xF1 \xF0\xE0\xE7\xE4\xE5\xEB\xE0 \xE6\xE0\xEB\xEE\xE1\n\xED\xE0 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFE.")
					show_help("/apay [ID \xE8\xE3\xF0\xEE\xEA\xE0] [\xF1\xF3\xEC\xEC\xE0]", "\xCF\xE5\xF0\xE5\xE4\xE0\xF7\xE0 \xE1\xEE\xEB\xE5\xE5 5000$ \xE4\xF0\xF3\xE3\xEE\xEC\xF3 \xE8\xE3\xF0\xEE\xEA\xF3.")
					show_help("/rskin [ID \xF1\xEA\xE8\xED\xE0] [\xF0\xE0\xE4\xE8\xF3\xF1]", "\xC2\xFB\xE4\xE0\xF7\xE0 \xF1\xEA\xE8\xED\xEE\xE2 \xE8\xE3\xF0\xEE\xEA\xE0\xEC, \xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xEC\xF1\xFF\n\xE2 \xE7\xE0\xE4\xE0\xED\xED\xEE\xEC \xF0\xE0\xE4\xE8\xF3\xF1\xE5.")
					show_help("/rskins [ID \xF1\xEA\xE8\xED\xEE\xE2] [\xF0\xE0\xE4\xE8\xF3\xF1]", "\xC2\xFB\xE4\xE0\xF7\xE0 \xE4\xE2\xF3\xF5 \xF1\xEA\xE8\xED\xEE\xE2 \xEF\xEE\xEE\xF7\xE5\xF0\xE5\xE4\xED\xEE, \xE8\xE3\xF0\xEE\xEA\xE0\xEC, \xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xEC\xF1\xFF \xE2\n\xE7\xE0\xE4\xE0\xED\xED\xEE\xEC \xF0\xE0\xE4\xE8\xF3\xF1\xE5.")
					show_help("/askick [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xC0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8\xE9 \xEA\xE8\xEA \xE4\xE0\xED\xED\xEE\xE3\xEE \xE8\xE3\xF0\xEE\xEA\xE0 \xE1\xE5\xE7 \xEB\xE8\xF8\xED\xE5\xE3\xEE \xF8\xF3\xEC\xE0, \xEF\xF0\xE8\n\xE2\xF5\xEE\xE4\xE5 \xE5\xE3\xEE \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0.")
					show_help("/2warns [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xC2\xFB\xE4\xE0\xF7\xE0 \xE8\xE3\xF0\xEE\xEA\xF3 \xE4\xE2\xF3\xF5 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9.")
					show_help("/carsp", "\xD1\xEF\xE0\xE2\xED \xF3\xEA\xE0\xE7\xE0\xED\xED\xEE\xE3\xEE \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xE0 \xD2/\xD1.")
					show_help("/stp", "\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC/\xEE\xF1\xF2\xE0\xED\xEE\xE2\xE8\xF2\xFC \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE0\xF6\xE8\xFE \xE8\xE3\xF0\xEE\xEA\xEE\xE2, \xED\xE5\n\xED\xE0\xF5\xEE\xE4\xFF\xF9\xE8\xF5\xF1\xFF \xE2 \xF2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xED\xEE\xEC \xF1\xF0\xE5\xE4\xF1\xF2\xE2\xE5, \xE2 \xE7\xEE\xED\xE5 \xEF\xF0\xEE\xF0\xE8\xF1\xEE\xE2\xEA\xE8.")
					show_help("/findd [ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8]", " \xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xEE\xED\xEB\xE0\xE9\xED \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8/\xE1\xE0\xED\xE4/\xEC\xE0\xF4\xE8\xE9 \xE8 \xF1\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xEE\xF2\xF7\xB8\xF2.")
					show_help("/afindd [ID \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8]", "\xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xEE\xED\xEB\xE0\xE9\xED \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8/\xE1\xE0\xED\xE4/\xEC\xE0\xF4\xE8\xE9 \xE8 \xF1\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xEE\xF2\xF7\xB8\xF2.")
					show_help("/mban", "\xC7\xE0\xE1\xE0\xED\xE8\xF2\xFC \xED\xE5\xF1\xEA\xEE\xEB\xFC\xEA\xEE \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xF1\xF0\xE0\xE7\xF3 (\xE4\xEE 4-\xF5).")
					show_help("/checker", "\xC4\xE0\xE1\xE0\xE2\xE8\xF2\xFC/\xF3\xE4\xE0\xEB\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xE2/\xE8\xE7 \xF7\xE5\xEA\xE5\xF0\xE0.")
					show_help("/reconn", "\xCF\xE5\xF0\xE5\xEF\xEE\xE4\xEA\xEB\xFE\xF7\xE8\xF2\xFC\xF1\xFF \xEA \xF1\xE5\xF0\xE2\xE5\xF0\xF3.")
					show_help("/mutelast [\xCC\xE8\xED\xF3\xF2\xFB] [\xCF\xF0\xE8\xF7\xE8\xED\xE0]", "\xCF\xEE\xF1\xF2\xE0\xE2\xE8\xF2\xFC \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 \xEE\xF4\xF4\xEB\xE0\xE9\xED, \xE7\xE0 \xEA\xEE\xF2\xEE\xF0\xFB\xEC \xE2\xFB \xEF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xE9\n\xF0\xE0\xE7 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
					show_help("/jaillast [\xCC\xE8\xED\xF3\xF2\xFB] [\xCF\xF0\xE8\xF7\xE8\xED\xE0]", "\xCF\xEE\xF1\xE0\xE4\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0 \xEE\xF4\xF4\xEB\xE0\xE9\xED \xE2 \xF2\xFE\xF0\xFC\xEC\xF3, \xE7\xE0 \xEA\xEE\xF2\xEE\xF0\xFB\xEC \xE2\xFB \xEF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xE9\n\xF0\xE0\xE7 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
					show_help("/warnlast [\xCF\xF0\xE8\xF7\xE8\xED\xE0]", "\xC2\xFB\xE4\xE0\xF2\xFC \xEE\xF4\xF4\xEB\xE0\xE9\xED \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xF3, \xE7\xE0 \xEA\xEE\xF2\xEE\xF0\xFB\xEC \xE2\xFB\n\xEF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xE9 \xF0\xE0\xE7 \xF1\xEB\xE5\xE4\xE8\xEB\xE8.")
					show_help("/banlast [\xCA\xEE\xEB-\xE2\xEE] [\xCF\xF0\xE8\xF7\xE8\xED\xE0]", "\xC7\xE0\xE1\xE0\xED\xE8\xF2\xFC \xE8\xE3\xF0\xEE\xEA\xE0, \xE7\xE0 \xEA\xEE\xF2\xEE\xF0\xFB\xEC \xE2\xFB \xEF\xEE\xF1\xEB\xE5\xE4. \xF0\xE0\xE7. \xF1\xEB\xE5\xE4\xE8\xEB\xE8, \xE2 \xEE\xF4\xF4\xE5.")
					show_help("/guns", "\xC2\xFB\xE4\xE0\xF2\xFC \xF1\xE5\xE1\xE5 \xEE\xF0\xF3\xE6\xE8\xE5.")
					show_help("/klist", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC killlist \xF2\xE5\xEA\xF3\xF9\xE5\xE3\xEE \xEA\xE0\xEF\xF2\xE0.")
					show_help("/iskill [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xF1\xEA\xE8\xEB\xEB\xFB \xE8\xE3\xF0\xEE\xEA\xE0 \xEF\xEE \xE5\xE3\xEE ID.")
					show_help("/ilog [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCE\xF2\xEE\xE1\xF0\xE0\xE7\xE8\xF2\xFC \xEF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xE5 \xE0\xE4\xEC\xE8\xED. \xE4\xE5\xE9\xF1\xF2\xE2\xE8\xFF \xED\xE0\xE4 \xE8\xE3\xF0\xEE\xEA\xEE\xEC \xEF\xEE \xE5\xE3\xEE ID.")
					show_help("/rk [ID \xE8\xE3\xF0\xEE\xEA\xE0]", "\xCF\xF0\xEE\xE2\xE5\xF0\xE8\xF2\xFC \xED\xE0\xEB\xE8\xF7\xE8\xE5 \xE8\xE3\xF0\xEE\xEA\xE0 \xE2 kill-\xEB\xE8\xF1\xF2\xE5.")
					imgui.Columns(1)
					imgui.EndChild()
					imgui.EndGroup()
				elseif help_selected == 2 then
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))
					imgui.Text(u8("\xD4\xF3\xED\xEA\xF6\xE8\xFF '\xF2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9' \xEF\xEE\xEB\xE5\xE7\xED\xE0, \xEA \xEF\xF0\xE8\xEC\xE5\xF0\xF3, \xEF\xF0\xE8 \xE2\xFB\xE4\xE0\xF7\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9 \xEF\xEE \xE6\xE0\xEB\xEE\xE1\xE0\xEC \xED\xE0 \xF4\xEE\xF0\xF3\xEC\xE5.\n\xD0\xE0\xF1\xF1\xEC\xEE\xF2\xF0\xE8\xEC \xF4\xF3\xED\xEA\xF6\xE8\xFE \xEF\xEE\xE4\xF0\xEE\xE1\xED\xE5\xE5. \xC2 \xEF\xE0\xEF\xEA\xE5 'moonloader/AdminTools' \xE8\xEC\xE5\xE5\xF2\xF1\xFF \xF4\xE0\xE9\xEB 'punishment_list.txt'.\n\xC2 \xED\xE5\xE3\xEE \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xEE \xE7\xE0\xEF\xE8\xF1\xFB\xE2\xE0\xF2\xFC \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF, \xEA\xE0\xE6\xE4\xEE\xE5 \xF1 \xED\xEE\xE2\xEE\xE9 \xF1\xF2\xF0\xEE\xEA\xE8, \xE2 \xF4\xEE\xF0\xEC\xE0\xF2\xE5 [\xEA\xEE\xEC\xE0\xED\xE4\xE0] [\xED\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0] [\xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE] [\xEF\xF0\xE8\xF7\xE8\xED\xE0]"))
					imgui.Text(u8("\xCD\xE0\xEF\xF0\xE8\xEC\xE5\xF0: "))
					imgui.SameLine()
					imgui.TextColored(imgui.ImVec4(1, 0.51, 0, 1), u8("/jail Nick_Name 50 \xC6\xE0\xEB\xEE\xE1\xE0 \xED\xE0 \xED\xE5 \xF1\xEE\xF1\xF2. \xE2 \xEE\xF0\xE3. #1"))
					imgui.Text(u8("\xC2 \xEA\xE0\xF7\xE5\xF1\xF2\xE2\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9, \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xEE \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC \xEA\xEE\xEC\xE0\xED\xE4\xFB: /mute, /jail, /warn, /ban.\n\xCF\xF0\xE8 \xE2\xFB\xE4\xE0\xF7\xE5 \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xFF, \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC \xED\xE5 \xED\xF3\xE6\xED\xEE.\n\xCA\xF0\xEE\xEC\xE5 \xF2\xEE\xE3\xEE, \xEF\xEE\xE4\xE4\xE5\xF0\xE6\xE8\xE2\xE0\xE5\xF2\xF1\xFF \xEA\xEE\xEC\xE0\xED\xE4\xE0 \xF1\xED\xFF\xF2\xE8\xFF \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xFF, /unwarn.\n\n\xCF\xEE\xE4\xE4\xE5\xF0\xE6\xE8\xE2\xE0\xE5\xF2\xF1\xFF 2 \xF0\xE5\xE6\xE8\xEC\xE0 \xE2\xFB\xE4\xE0\xF7\xE8 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9:\n\x95 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8\xE9 \xF0\xE5\xE6\xE8\xEC\n\xCF\xF0\xE8 \xE4\xE0\xED\xED\xEE\xEC \xF0\xE5\xE6\xE8\xEC\xE5, \xF1\xEA\xF0\xE8\xEF\xF2 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xE2\xFB\xE4\xE0\xE5\xF2 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xE8\xE3\xF0\xEE\xEA\xE0\xEC, \xEA\xEE\xE3\xE4\xE0 \xEE\xED\xE8 \xE7\xE0\xF5\xEE\xE4\xFF\xF2 \xE2 \xE8\xE3\xF0\xF3.\n\xC4\xE0\xED\xED\xFB\xE9 \xF0\xE5\xE6\xE8\xEC \xEC\xEE\xE6\xED\xEE \xEE\xF2\xEA\xEB\xFE\xF7\xE8\xF2\xFC \xE2 \xED\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE0\xF5 \xF1\xEA\xF0\xE8\xEF\xF2\xE0.\n\x95 \xEF\xEE\xEB\xF3-\xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8\xE9 \xF0\xE5\xE6\xE8\xEC\n\xCF\xF0\xE8 \xE4\xE0\xED\xED\xEE\xEC \xF0\xE5\xE6\xE8\xEC\xE5, \xE4\xEB\xFF \xE2\xFB\xE4\xE0\xF7\xE8 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9, \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xEE \xEE\xF2\xEA\xF0\xFB\xF2\xFC \xF2\xE0\xE1\xEB\xE8\xF6\xF3 \xF1 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF\xEC\xE8 \xE8 \xED\xE0\xE6\xE0\xF2\xFC \xEA\xED\xEE\xEF\xEA\xF3 '\xC2\xFB\xE4\xE0\xF2\xFC'.\n\xCF\xF0\xE8 \xFD\xF2\xEE\xEC, \xE1\xF3\xE4\xF3\xF2 \xE2\xFB\xE4\xE0\xED\xFB \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xF2\xE5\xEC \xE8\xE3\xF0\xEE\xEA\xE0\xEC, \xEA\xEE\xF2\xEE\xF0\xFB\xE5 \xEE\xED\xEB\xE0\xE9\xED, \xE2 \xE4\xE0\xED\xED\xFB\xE9 \xEC\xEE\xEC\xE5\xED\xF2.\n\xCA\xF0\xEE\xEC\xE5 \xF2\xEE\xE3\xEE, \xE1\xF3\xE4\xF3\xF2 \xE2\xFB\xE4\xE0\xED\xFB \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xFF \xE8 \xE1\xE0\xED\xFB \xE8\xE3\xF0\xEE\xEA\xE0\xEC \xE2 \xEE\xF4\xF4\xEB\xE0\xE9\xED\xE5 (\xE4\xEB\xFF \xE0\xE4\xEC. 4 \xF3\xF0\xEE\xE2\xED\xFF \xE8 \xE2\xFB\xF8\xE5).\n\n\xCF\xEE\xF1\xEB\xE5 \xE2\xFB\xE4\xE0\xF7\xE8, \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xF3\xE4\xE0\xEB\xFF\xFE\xF2\xF1\xFF \xE8\xE7 \xF4\xE0\xE9\xEB\xE0."))
					imgui.EndChild()
					imgui.EndGroup()
				elseif help_selected == 3 then
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))
					imgui.Text(u8("\xC2 \xF1\xEA\xF0\xE8\xEF\xF2\xE5 \xE8\xEC\xE5\xE5\xF2\xF1\xFF \xEC\xE5\xED\xFE \xE1\xFB\xF1\xF2\xF0\xFB\xF5 \xEA\xEE\xEC\xE0\xED\xE4.\n\xC4\xE0\xED\xED\xEE\xE5 \xEC\xE5\xED\xFE \xEF\xEE\xE7\xE2\xEE\xEB\xFF\xE5\xF2 \xE8\xE7 \xF0\xE5\xE6\xE8\xEC\xE0 \xF1\xEB\xE5\xE6\xEA\xE8 \xEF\xF0\xEE\xF1\xEC\xEE\xF2\xF0\xE5\xF2\xFC \xF0\xE0\xE7\xEB\xE8\xF7\xED\xF3\xFE \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFE \xEE\xE1 \xE8\xE3\xF0\xEE\xEA\xE5, \xEB\xE8\xE1\xEE \xE2\xFB\xE4\xE0\xF2\xFC \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5.\n\xC4\xEB\xFF \xF2\xEE\xE3\xEE, \xF7\xF2\xEE\xE1 \xE2\xFB\xE7\xE2\xE0\xF2\xFC \xE4\xE0\xED\xED\xEE\xE5 \xEC\xE5\xED\xFE, \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xEE \xEF\xE5\xF0\xE5\xE9\xF2\xE8 \xE2 \xF0\xE5\xE6\xE8\xEC \xF1\xEB\xE5\xE6\xEA\xE8 \xE7\xE0 \xE8\xE3\xF0\xEE\xEA\xEE\xEC (/sp) \xE8 \xED\xE0\xE6\xE0\xF2\xFC \xCF\xCA\xCC.\n\xCD\xE0\xF1\xF2\xF0\xEE\xE8\xF2\xFC \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xEC\xEE\xE6\xED\xEE \xE2 \xEF\xE0\xEF\xEA\xE5 AdminTools/reasons."))
					imgui.EndChild()
					imgui.EndGroup()
				elseif help_selected == 4 then
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))
					imgui.Text(u8("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xEF\xEE\xE7\xE2\xEE\xEB\xFF\xE5\xF2 \xE2\xFB\xEF\xEE\xEB\xED\xE8\xF2\xFC \xE0\xE4\xEC\xE8\xED. \xEA\xEE\xEC\xE0\xED\xE4\xF3, \xED\xE5 \xED\xE0\xE1\xE8\xF0\xE0\xFF \xE5\xE5.\n\xCA \xEF\xF0\xE8\xEC\xE5\xF0\xF3, \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 2 \xF3\xF0\xEE\xE2\xED\xFF \xEF\xE8\xF8\xE5\xF2 \xE2 \xE0\xE4\xEC\xE8\xED. \xF7\xE0\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3: /offwarn Nick_Name DeathMatch.\n\xD1\xEA\xF0\xE8\xEF\xF2 \xE5\xE5 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xEE\xF2\xEB\xEE\xE2\xE8\xF2 \xE8 \xF3\xE2\xE5\xE4\xEE\xEC\xE8\xF2 \xEE \xF2\xEE\xEC, \xF7\xF2\xEE \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 \xF5\xEE\xF7\xE5\xF2 \xE2\xFB\xE4\xE0\xF2\xFC \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE5.\n\xC4\xEB\xFF \xEF\xEE\xE4\xF2\xE2\xE5\xF0\xE6\xE4\xE5\xED\xE8\xFF \xE8 \xE2\xFB\xE4\xE0\xF7\xE8 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF, \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC\xEE \xE1\xF3\xE4\xE5\xF2 \xED\xE0\xE6\xE0\xF2\xFC \xEA\xEB\xE0\xE2\xE8\xF8\xF3 Delete \xE2 \xF2\xE5\xF7\xE5\xED\xE8\xE5 15 \xF1\xE5\xEA\xF3\xED\xE4.\n\xC2 \xF1\xEB\xF3\xF7\xE0\xE5, \xE5\xF1\xEB\xE8 \xFD\xF2\xEE\xE3\xEE \xED\xE5 \xEF\xF0\xEE\xE8\xF1\xF5\xEE\xE4\xE8\xF2 - \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xED\xE5 \xE2\xFB\xE4\xE0\xE5\xF2\xF1\xFF. \xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xE2\xEA\xEB\xFE\xF7\xE0\xE5\xF2\xF1\xFF \xE2 \xED\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE0\xF5."))
					imgui.EndChild()
					imgui.EndGroup()
				end

				imgui.End()
			end

			if weather_window.v then
				local var_102_51, var_102_52 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_51 / 2 + 300, var_102_52 / 2 - 95), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(250, 255), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xC8\xE7\xEC\xE5\xED\xE5\xED\xE8\xE5 \xEF\xEE\xE3\xEE\xE4\xFB"), weather_window, imgui.WindowFlags.AlwaysAutoResize)

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:0)")) then
					sampSendChat("/setweather 0")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:1)\"")) then
					sampSendChat("/setweather 1")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:2)")) then
					sampSendChat("/setweather 2")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:3)")) then
					sampSendChat("/setweather 3")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:4)")) then
					sampSendChat("/setweather 4")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:5)")) then
					sampSendChat("/setweather 5")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:6)")) then
					sampSendChat("/setweather 6")
				end

				if imgui.Selectable(u8("\xD1\xE8\xED\xE8\xE5 \xED\xE5\xE1\xE5\xF1\xE0/\xEE\xE1\xEB\xE0\xEA\xE0 (ID:7)")) then
					sampSendChat("/setweather 7")
				end

				if imgui.Selectable(u8("\xC3\xF0\xEE\xE7\xE0 (ID:8)")) then
					sampSendChat("/setweather 8")
				end

				if imgui.Selectable(u8("\xCF\xE0\xF1\xEC\xF3\xF0\xED\xEE \xE8 \xF2\xF3\xEC\xE0\xED (ID:9)")) then
					sampSendChat("/setweather 9")
				end

				if imgui.Selectable(u8("\xDF\xF1\xED\xEE\xE5 \xF1\xE8\xED\xE5\xE5 \xED\xE5\xE1\xEE (ID:10)")) then
					sampSendChat("/setweather 10")
				end

				if imgui.Selectable(u8("\xCE\xE1\xE6\xE8\xE3\xE0\xFE\xF9\xE0\xFF \xE6\xE0\xF0\xEA\xE0\xFF (ID:11)")) then
					sampSendChat("/setweather 11")
				end

				if imgui.Selectable(u8("\xCE\xF7\xE5\xED\xFC \xF2\xF3\xF1\xEA\xEB\xFB\xE9, \xE1\xE5\xF1\xF6\xE2, \xF1\xEC\xF3\xF2\xED\xFB\xE5 (ID:12)")) then
					sampSendChat("/setweather 12")
				end

				if imgui.Selectable(u8("\xCE\xF7\xE5\xED\xFC \xF2\xF3\xF1\xEA\xEB\xFB\xE9, \xE1\xE5\xF1\xF6\xE2, \xF1\xEC\xF3\xF2\xED\xFB\xE5 (ID:13)")) then
					sampSendChat("/setweather 13")
				end

				if imgui.Selectable(u8("\xCE\xF7\xE5\xED\xFC \xF2\xF3\xF1\xEA\xEB\xFB\xE9, \xE1\xE5\xF1\xF6\xE2, \xF1\xEC\xF3\xF2\xED\xFB\xE5 (ID:14)")) then
					sampSendChat("/setweather 14")
				end

				if imgui.Selectable(u8("\xCE\xF7\xE5\xED\xFC \xF2\xF3\xF1\xEA\xEB\xFB\xE9, \xE1\xE5\xF1\xF6\xE2, \xF1\xEC\xF3\xF2\xED\xFB\xE5 (ID:15)")) then
					sampSendChat("/setweather 15")
				end

				if imgui.Selectable(u8("\xD2\xF3\xF1\xEA\xEB\xFB\xE9, \xED\xE5\xFF\xF1\xED\xFB\xE9, \xE4\xEE\xE6\xE4\xEB\xE8\xE2\xFB\xE5 (ID:16)")) then
					sampSendChat("/setweather 16")
				end

				if imgui.Selectable(u8("\xCE\xEF\xE0\xEB\xE8\xE2\xE0\xFF \xE3\xEE\xF0\xFF\xF7\xE8\xE5 (ID:17)")) then
					sampSendChat("/setweather 17")
				end

				if imgui.Selectable(u8("\xCE\xEF\xE0\xEB\xE8\xE2\xE0\xFF \xE3\xEE\xF0\xFF\xF7\xE8\xE5 (ID:18)")) then
					sampSendChat("/setweather 18")
				end

				if imgui.Selectable(u8("\xCF\xE5\xF1\xF7\xE0\xED\xE0\xFF \xE1\xF3\xF0\xFF (ID:19)")) then
					sampSendChat("/setweather 19")
				end

				if imgui.Selectable(u8("\xD2\xF3\xEC\xE0\xED\xED\xFB\xE9/\xE7\xE5\xEB\xE5\xED\xEE\xE2\xE0\xF2\xFB\xE5 (ID:20)")) then
					sampSendChat("/setweather 20")
				end

				imgui.End()
			end

			if teleportation_window.v then
				local var_102_53, var_102_54 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_53 / 2 + 300, var_102_54 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(250, 300), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE0\xF6\xE8\xFF"), teleportation_window, imgui.WindowFlags.AlwaysAutoResize)

				if imgui.CollapsingHeader(u8("\xCE\xE1\xF9\xE5\xF1\xF2\xE2\xE5\xED\xED\xFB\xE5 \xEC\xE5\xF1\xF2\xE0")) then
					if imgui.Selectable(u8("\xC0\xE2\xF2\xEE\xF1\xF2\xE0\xED\xF6\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1157.38, -1777.41, 33.63)
					end

					if imgui.Selectable(u8("\xC6/\xC4 \xE2\xEE\xEA\xE7\xE0\xEB \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1744.2, -1904.76, 30.45)
					end

					if imgui.Selectable(u8("\xC0\xE2\xF2\xEE\xF1\xF2\xE0\xED\xF6\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -1979.37, 157.71, 39.85)
					end

					if imgui.Selectable(u8("\xC0\xE2\xF2\xEE\xF1\xF2\xE0\xED\xF6\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2842.95, 1303.15, 22.74)
					end

					if imgui.Selectable(u8("\xC1\xE0\xED\xEA \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1423.5, -1628.6, 13.5)
					end

					if imgui.Selectable(u8("\xC1\xE0\xED\xEA \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -1503.58, 919.92, 7.19)
					end

					if imgui.Selectable(u8("\xC2\xEE\xE5\xED\xEA\xEE\xEC\xE0\xF2")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1051.44, 1332.05, 10.82)
					end

					if imgui.Selectable(u8("\xD8\xE0\xF5\xF2\xE0")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -1818.7054, -1620.4059, 35.4024)
					end

					if imgui.Selectable(u8("\xC7\xE0\xE2\xEE\xE4")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -112.1463, -316.2928, 28.8565)
					end

					if imgui.Selectable(u8("\xD1\xEA\xEB\xE0\xE4")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2237.3, -2264.7, 24)
					end

					if imgui.Selectable(u8("\xD4\xEE\xF0\xEC\xE0\xF6\xE5\xE2\xF2\xE8\xF7\xE5\xF1\xEA\xE0\xFF \xF4\xE0\xE1\xF0\xE8\xEA\xE0")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1342.3, 343.7, 19.7)
					end
				end

				if imgui.CollapsingHeader(u8("\xC3\xEE\xF1\xF3\xE4\xE0\xF0\xF1\xF2\xE2\xE5\xED\xED\xFB\xE5 \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 ")) then
					if imgui.TreeNode(u8("\xCF\xF0\xE0\xE2\xE8\xF2\xE5\xEB\xFC\xF1\xF2\xE2\xEE")) then
						if imgui.Selectable(u8("\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF \xEF\xF0\xE5\xE7\xE8\xE4\xE5\xED\xF2\xE0")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 943.782, -933.2716, 61.6)
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1479.782, -1656.2716, 14.0469)
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2706.49, 376.27, 4.97)
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 2359.9, 2475.61, 10.82)
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC2\xED\xF3\xF2\xF0\xE5\xED\xED\xE8\xF5 \xC4\xE5\xEB")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC2\xED\xF3\xF2\xF0\xE5\xED\xED\xE8\xF5 \xC4\xE5\xEB")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2024.134, 488.0721, 35.2265)
						end

						if imgui.Selectable(u8("\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1541.99, -1658.85, 13.6)
						end

						if imgui.Selectable(u8("\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -1626.99, 721.85, 14.6)
						end

						if imgui.Selectable(u8("\xCF\xEE\xEB\xE8\xF6\xE8\xFF \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 2303.4, 2428, 10.82)
						end

						if imgui.Selectable(u8("\xD4\xE5\xE4\xE5\xF0\xE0\xEB\xFC\xED\xEE\xE5 \xC1\xFE\xF0\xEE \xD0\xE0\xF1\xF1\xEB\xE5\xE4\xEE\xE2\xE0\xED\xE8\xE9")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2464.8, 494.1, 30.1)
						end

						if imgui.Selectable(u8("\xD2\xFE\xF0\xFC\xEC\xE0")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1817.8, -1571.1, 14)
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xCE\xE1\xEE\xF0\xEE\xED\xFB")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xCE\xE1\xEE\xF0\xEE\xED\xFB")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1042.88, 1032.48, 11)
						end

						if imgui.Selectable(u8("\xD1\xF3\xF5\xEE\xEF\xF3\xF2\xED\xFB\xE5 \xC2\xEE\xE9\xF1\xEA\xE0")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 346.59, 1947.27, 32.92)
						end

						if imgui.Selectable(u8("\xC2\xEE\xE5\xED\xED\xEE-\xC2\xEE\xE7\xE4\xF3\xF8\xED\xFB\xE5 \xD1\xE8\xEB\xFB")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 404.7473, 2472.325, 29.6439)
						end

						if imgui.Selectable(u8("\xC2\xEE\xE5\xED\xED\xEE-\xCC\xEE\xF0\xF1\xEA\xEE\xE9 \xD4\xEB\xEE\xF2")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2232.062, 2358.2217, 20.6625)
						end

						if imgui.Selectable(u8("\xC0\xE2\xE8\xE0\xED\xEE\xF1\xE5\xF6")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -1475.134, 356.0721, 54.4265)
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC7\xE4\xF0\xE0\xE2\xEE\xEE\xF5\xF0\xE0\xED\xE5\xED\xE8\xFF")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC7\xE4\xF0\xE0\xE2\xEE\xEE\xF5\xF0\xE0\xED\xE5\xED\xE8\xFF")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2751.59, -281.3, 7.1)
						end

						if imgui.Selectable(u8("\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1187.59, -1318.83, 13.57)
						end

						if imgui.Selectable(u8("\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -2644.99, 615.35, 14.45)
						end

						if imgui.Selectable(u8("\xC1\xEE\xEB\xFC\xED\xE8\xF6\xE0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1603.8, 1829.1, 10.82)
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xD1\xF0\xE5\xE4\xF1\xF2\xE2\xE0 \xCC\xE0\xF1\xF1\xEE\xE2\xEE\xE9 \xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8")) then
						if imgui.Selectable(u8("\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1670.4, -1677.3, 21.4)
						end

						if imgui.Selectable(u8("\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, -1798.6, 547.1, 35.2)
						end

						if imgui.Selectable(u8("\xD0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 2127.8, 2331.3, 11.7)
						end

						if imgui.Selectable(u8("\xD2\xE5\xEB\xE5\xF6\xE5\xED\xF2\xF0")) then
							gotozeroworld()
							setCharCoordinates(PLAYER_PED, 1779.9, -1273.7, 13.6)
						end

						imgui.TreePop()
					end
				end

				if imgui.CollapsingHeader(u8("\xC1\xE0\xE7\xFB \xE1\xE0\xED\xE4 \xE8 \xEC\xE0\xF4\xE8\xE9")) then
					if imgui.Selectable(u8("Grove Street")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2494.3, -1694.1, 23.7)
					end

					if imgui.Selectable(u8("The Ballas")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2010.3, -1135.9, 25)
					end

					if imgui.Selectable(u8("Los Santos Vagos")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2766.1, -1177.9, 69.4)
					end

					if imgui.Selectable(u8("The Rifa")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2745, -1925.2, 21.6)
					end

					if imgui.Selectable(u8("Varios Los Aztecas")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2188.8, -1820.6, 18.9)
					end

					if imgui.Selectable(u8("La Cosa Nostra")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1491, 2773.9, 16)
					end

					if imgui.Selectable(u8("Yakuza")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2597, 1913.1, 28.3)
					end

					if imgui.Selectable(u8("\xD0\xF3\xF1\xF1\xEA\xE0\xFF \xEC\xE0\xF4\xE8\xFF")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 989.2, 1733.3, 10.8)
					end
				end

				if imgui.CollapsingHeader(u8("\xD0\xE0\xE7\xE2\xEB\xE5\xF7\xE5\xED\xE8\xFF")) then
					if imgui.Selectable(u8("\xCA\xE0\xE7\xE8\xED\xEE \"\xCA\xE0\xEB\xE8\xE3\xF3\xEB\xE0\"")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2150.74, 1678.9, 10.82)
					end

					if imgui.Selectable(u8("\xCC\xCF \"\xC4\xE5\xF0\xE1\xE8\"")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2690.4063, -1705.3776, 11.2673)
					end

					if imgui.Selectable(u8("\xCC\xCF \"\xCF\xEE\xEB\xE8\xE2\xE0\xEB\xEA\xE0\"")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1571.9076, -1247.4485, 277.8782)
					end

					if imgui.Selectable(u8("\xCA\xE0\xE7\xE0\xEA\xE8-\xF0\xE0\xE7\xE1\xEE\xE9\xED\xE8\xEA\xE8 \xED\xE0 \xE7\xE0\xE1\xF0. \xE7\xE0\xE2\xEE\xE4\xE5")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2486.54, 2788.77, 10.82)
					end

					if imgui.Selectable(u8("\xCA\xE0\xE7\xE0\xEA\xE8-\xF0\xE0\xE7\xE1\xEE\xE9\xED\xE8\xEA\xE8 \xED\xE0 \xE8\xF1\xEF. \xEF\xEE\xEB\xE8\xE3\xEE\xED\xE5")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2801.49, 895.83, 10.76)
					end

					if imgui.Selectable(u8("\xCA\xE0\xE7\xE0\xEA\xE8-\xF0\xE0\xE7\xE1\xEE\xE9\xED\xE8\xEA\xE8 \xED\xE0 \xF4\xE5\xF0\xEC\xE5 \xED\xE0\xF0\xEA.")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -1048.42, -1195.41, 129.04)
					end

					if imgui.Selectable(u8("\xCA\xE0\xE7\xE0\xEA\xE8-\xF0\xE0\xE7\xE1\xEE\xE9\xED\xE8\xEA\xE8 \xEF\xEE\xE4 \xE2\xEE\xE4\xEE\xE9")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2152.42, -92.91, 2.7)
					end

					if imgui.Selectable(u8("\xC3\xEE\xED\xEA\xE8 \xEF\xEE \xF6\xE5\xED\xF2\xF0\xE0\xEB\xFC\xED\xEE\xEC\xF3 San Andreas")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 1559.8, 30.58, 24.16)
					end

					if imgui.Selectable(u8("\xC3\xEE\xED\xEA\xE8 \"\xEF\xEE\xE4\xFA\xE5\xEC \xED\xE0 \xE3\xEE\xF0\xF3 \xD7\xE8\xEB\xE8\xE0\xE4\"")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, -2400.97, -2177.23, 33.29)
					end

					if imgui.Selectable(u8("\xC3\xEE\xED\xEA\xE8 \xE7\xE0\xEF\xE0\xE4\xED\xEE\xEC\xF3 San Andreas")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 2338.18, -1055.79, 52.39)
					end

					if imgui.Selectable(u8("\xC3\xEE\xED\xEA\xE8 \xEF\xEE \xEF\xF3\xF1\xF2\xFB\xED\xE5")) then
						gotozeroworld()
						setCharCoordinates(PLAYER_PED, 802.62, 1690.03, 5.28)
					end
				end

				if imgui.CollapsingHeader(u8("\xC4\xF0\xF3\xE3\xEE\xE5")) then
					if imgui.Button(u8("\xD1\xEE\xF5\xF0\xE0\xED\xE8\xF2\xFC \xF2\xE5\xEA\xF3\xF9\xF3\xFE \xEF\xEE\xE7\xE8\xF6\xE8\xFE")) then
						local var_102_55, var_102_56, var_102_57 = getCharCoordinates(PLAYER_PED)
						local var_102_58 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_58.temp_pos.Xpos = var_102_55
						var_102_58.temp_pos.Ypos = var_102_56
						var_102_58.temp_pos.Zpos = var_102_57

						var_0_0.save(var_102_58, "AdminTools\\config.ini")
						message("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEF\xEE\xE7\xE8\xF6\xE8\xFF \xF3\xF1\xEF\xE5\xF8\xED\xEE \xF1\xEE\xF5\xF0\xE0\xED\xE5\xED\xE0.")
					end

					if imgui.Button(u8("\xD2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xF2\xFC\xF1\xFF \xED\xE0 \xF1\xEE\xF5\xF0. \xEF\xEE\xE7\xE8\xF6\xE8\xFE")) then
						if admin_lvl >= 3 then
							local var_102_59 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")
							local var_102_60 = var_102_59.temp_pos.Xpos
							local var_102_61 = var_102_59.temp_pos.Ypos
							local var_102_62 = var_102_59.temp_pos.Zpos

							gotozeroworld()
							setCharCoordinates(PLAYER_PED, var_102_60, var_102_61, var_102_62)
							message("\xC2\xFB \xE1\xFB\xEB\xE8 \xF2\xE5\xEB\xE5\xEF\xEE\xF0\xF2\xE8\xF0\xEE\xE2\xE0\xED\xFB \xED\xE0 \xF0\xE0\xED\xE5\xE5 \xF1\xEE\xF5\xF0\xE0\xED\xE5\xED\xED\xF3\xFE \xEF\xEE\xE7\xE8\xF6\xE8\xFE.")
						else
							message("\xC4\xE0\xED\xED\xE0\xFF \xF4\xF3\xED\xEA\xF6\xE8\xFF \xE4\xEE\xF1\xF2\xF3\xEF\xED\xE0 \xE4\xEB\xFF \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 3 \xF3\xF0\xEE\xE2\xED\xFF \xE8\xEB\xE8 \xE2\xFB\xF8\xE5.")
						end
					end
				end

				imgui.End()
			end

			if templeader_window.v then
				local var_102_63, var_102_64 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_63 / 2 + 300, var_102_64 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(270, 300), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xC2\xF0\xE5\xEC\xE5\xED\xED\xEE\xE5 \xEB\xE8\xE4\xE5\xF0\xF1\xF2\xE2\xEE \xE8 \xF0\xE0\xE1\xEE\xF2\xE0"), templeader_window, imgui.WindowFlags.AlwaysAutoResize)

				if admin_lvl >= 4 then
					if imgui.TreeNode(u8("\xCF\xF0\xE0\xE2\xE8\xF2\xE5\xEB\xFC\xF1\xF2\xE2\xEE")) then
						if imgui.Selectable(u8("\xCF\xF0\xE5\xE7\xE8\xE4\xE5\xED\xF2")) then
							setTempleader("1 1")
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							setTempleader("1 2")
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							setTempleader("1 3")
						end

						if imgui.Selectable(u8("\xCC\xFD\xF0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							setTempleader("1 4")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC2\xED\xF3\xF2\xF0\xE5\xED\xED\xE8\xF5 \xC4\xE5\xEB")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xF0 \xC2\xED\xF3\xF2\xF0\xE5\xED\xED\xE8\xF5 \xC4\xE5\xEB")) then
							setTempleader("2 0")
						end

						if imgui.Selectable(u8("\xC3\xE5\xED\xE5\xF0\xE0\xEB \xEF\xEE\xEB\xE8\xF6\xE8\xE8 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							setTempleader("2 1")
						end

						if imgui.Selectable(u8("\xC3\xE5\xED\xE5\xF0\xE0\xEB \xEF\xEE\xEB\xE8\xF6\xE8\xE8 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							setTempleader("2 2")
						end

						if imgui.Selectable(u8("\xC3\xE5\xED\xE5\xF0\xE0\xEB \xEF\xEE\xEB\xE8\xF6\xE8\xE8 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							setTempleader("2 3")
						end

						if imgui.Selectable(u8("\xC4\xE8\xF0\xE5\xEA\xF2\xEE\xF0 \xD4\xC1\xD0")) then
							setTempleader("2 4")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xCE\xE1\xEE\xF0\xEE\xED\xFB")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xF0 \xCE\xE1\xEE\xF0\xEE\xED\xFB")) then
							setTempleader("3 0")
						end

						if imgui.Selectable(u8("\xC3\xE5\xED\xE5\xF0\xE0\xEB \xD1\xF3\xF5\xEE\xEF\xF3\xF2\xED\xFB\xF5 \xC2\xEE\xE9\xF1\xEA")) then
							setTempleader("3 1")
						end

						if imgui.Selectable(u8("\xC3\xE5\xED\xE5\xF0\xE0\xEB \xC2\xEE\xE5\xED\xED\xEE-\xC2\xEE\xE7\xE4\xF3\xF8\xED\xFB\xF5 \xD1\xE8\xEB")) then
							setTempleader("3 2")
						end

						if imgui.Selectable(u8("\xC0\xE4\xEC\xE8\xF0\xE0\xEB \xC2\xEE\xE5\xED\xED\xEE-\xCC\xEE\xF0\xF1\xEA\xEE\xE3\xEE \xD4\xEB\xEE\xF2\xE0")) then
							setTempleader("3 3")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE8\xED\xE8\xF1\xF2\xE5\xF0\xF1\xF2\xE2\xEE \xC7\xE4\xF0\xE0\xE2\xEE\xEE\xF5\xF0\xE0\xED\xE5\xED\xE8\xFF")) then
						if imgui.Selectable(u8("\xCC\xE8\xED\xE8\xF1\xF2\xF0 \xC7\xE4\xF0\xE0\xE2\xEE\xEE\xF5\xF0\xE0\xED\xE5\xED\xE8\xFF")) then
							setTempleader("4 0")
						end

						if imgui.Selectable(u8("\xC3\xEB\xE0\xE2. \xE2\xF0\xE0\xF7 \xE1\xEE\xEB\xFC\xED\xE8\xF6\xFB \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							setTempleader("4 1")
						end

						if imgui.Selectable(u8("\xC3\xEB\xE0\xE2. \xE2\xF0\xE0\xF7 \xE1\xEE\xEB\xFC\xED\xE8\xF6\xFB \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							setTempleader("4 2")
						end

						if imgui.Selectable(u8("\xC3\xEB\xE0\xE2. \xE2\xF0\xE0\xF7 \xE1\xEE\xEB\xFC\xED\xE8\xF6\xFB \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							setTempleader("4 3")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xD1\xF0\xE5\xE4\xF1\xF2\xE2\xE0 \xCC\xE0\xF1\xF1\xEE\xE2\xEE\xE9 \xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE8")) then
						if imgui.Selectable(u8("\xD3\xEF\xF0\xE0\xE2\xEB\xFF\xFE\xF9\xE8\xE9 \xD1\xCC\xC8")) then
							setTempleader("5 0")
						end

						if imgui.Selectable(u8("\xC4\xE8\xF0\xE5\xEA\xF2\xEE\xF0 \xF0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0\xE0 \xE3. \xCB\xEE\xF1-\xD1\xE0\xED\xF2\xEE\xF1")) then
							setTempleader("5 1")
						end

						if imgui.Selectable(u8("\xC4\xE8\xF0\xE5\xEA\xF2\xEE\xF0 \xF0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0\xE0 \xE3. \xD1\xE0\xED-\xD4\xE8\xE5\xF0\xF0\xEE")) then
							setTempleader("5 2")
						end

						if imgui.Selectable(u8("\xC4\xE8\xF0\xE5\xEA\xF2\xEE\xF0 \xF0\xE0\xE4\xE8\xEE\xF6\xE5\xED\xF2\xF0\xE0 \xE3. \xCB\xE0\xF1-\xC2\xE5\xED\xF2\xF3\xF0\xE0\xF1")) then
							setTempleader("5 3")
						end

						if imgui.Selectable(u8("\xC4\xE8\xF0\xE5\xEA\xF2\xEE\xF0 \xF2\xE5\xEB\xE5\xF6\xE5\xED\xF2\xF0\xE0")) then
							setTempleader("5 4")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xC1\xE0\xED\xE4\xFB")) then
						if imgui.Selectable(u8("Grove Street")) then
							setTempleader("6 0")
						end

						if imgui.Selectable(u8("The Ballas")) then
							setTempleader("7 0")
						end

						if imgui.Selectable(u8("Los Santos Vagos")) then
							setTempleader("8 0")
						end

						if imgui.Selectable(u8("The Rifa")) then
							setTempleader("9 0")
						end

						if imgui.Selectable(u8("Varios Los Aztecas")) then
							setTempleader("10 0")
						end

						imgui.TreePop()
					end

					if imgui.TreeNode(u8("\xCC\xE0\xF4\xE8\xE8")) then
						if imgui.Selectable(u8("La Cosa Nostra")) then
							setTempleader("11 0")
						end

						if imgui.Selectable(u8("Yakuza")) then
							setTempleader("12 0")
						end

						if imgui.Selectable(u8("\xD0\xF3\xF1\xF1\xEA\xE0\xFF \xEC\xE0\xF4\xE8\xFF")) then
							setTempleader("13 0")
						end

						imgui.TreePop()
					end
				end

				imgui.Separator()

				if imgui.TreeNode(u8("\xD0\xE0\xE1\xEE\xF2\xFB")) then
					if imgui.Selectable(u8("\xC2\xEE\xE4\xE8\xF2\xE5\xEB\xFC \xE0\xE2\xF2\xEE\xE1\xF3\xF1\xE0")) then
						sampSendChat("/tempwork 1")
					end

					if imgui.Selectable(u8("\xD2\xE0\xEA\xF1\xE8\xF1\xF2")) then
						sampSendChat("/tempwork 2")
					end

					if imgui.Selectable(u8("\xCC\xE0\xF8\xE8\xED\xE8\xF1\xF2")) then
						sampSendChat("/tempwork 3")
					end

					if imgui.Selectable(u8("\xC2\xEE\xE4\xE8\xF2\xE5\xEB\xFC \xF2\xF0\xE0\xEC\xE2\xE0\xFF")) then
						sampSendChat("/tempwork 4")
					end

					if imgui.Selectable(u8("\xC0\xE2\xF2\xEE\xEC\xE5\xF5\xE0\xED\xE8\xEA")) then
						sampSendChat("/tempwork 5")
					end

					if imgui.Selectable(u8("\xD3\xEB\xE8\xF7\xED\xFB\xE9 \xF2\xEE\xF0\xE3\xEE\xE2\xE5\xF6")) then
						sampSendChat("/tempwork 6")
					end

					imgui.TreePop()
				end

				imgui.Text("\n")
				imgui.Separator()

				if admin_lvl >= 4 and imgui.Button(u8("\xD1\xED\xFF\xF2\xFC \xF1 \xF1\xE5\xE1\xFF \xE2\xF0\xE5\xEC\xE5\xED\xED\xEE\xE5 \xEB\xE8\xE4\xE5\xF0\xF1\xF2\xE2\xEE")) then
					setTempleader("0 0")
				end

				if imgui.Button(u8("\xD3\xE2\xEE\xEB\xE8\xF2\xFC\xF1\xFF \xF1 \xE2\xF0\xE5\xEC\xE5\xED\xED\xEE\xE9 \xF0\xE0\xE1\xEE\xF2\xFB")) then
					sampSendChat("/tempwork 0")
				end

				imgui.End()
			end

			if subscription.v then
				local var_102_65, var_102_66 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_65 / 2, var_102_66 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(510, 440), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCF\xEE\xE4\xEF\xE8\xF1\xEA\xE0 AdminTools"), subscription, imgui.WindowFlags.AlwaysAutoResize)
				imgui.Text(u8("\xCF\xEE\xE4\xEF\xE8\xF1\xEA\xE0 \xEF\xEE\xE7\xE2\xEE\xEB\xFF\xE5\xF2 \xF0\xE0\xF1\xF8\xE8\xF0\xE8\xF2\xFC \xE2\xEE\xE7\xEC\xEE\xE6\xED\xEE\xF1\xF2\xE8 \xF1\xEA\xF0\xE8\xEF\xF2\xE0, \xF1\xED\xE8\xEC\xE0\xFF \xEE\xE3\xF0\xE0\xED\xE8\xF7\xE5\xED\xE8\xFF \xED\xE0 \xED\xE5\xEA\xEE\xF2\xEE\xF0\xFB\xE5 \xF4\xF3\xED\xEA\xF6\xE8\xE8.\n\xCF\xF0\xE8\xEE\xE1\xF0\xE5\xF1\xF2\xE8 \xEF\xEE\xE4\xEF\xE8\xF1\xEA\xF3, \xEB\xE8\xE1\xEE \xE6\xE5 \xEF\xF0\xEE\xE4\xEB\xE8\xF2\xFC \xE5\xE5, \xEC\xEE\xE6\xED\xEE \xED\xE8\xE6\xE5.  \xCF\xF0\xE8 \xE2\xEE\xE7\xED\xE8\xEA\xED\xEE\xE2\xE5\xED\xE8\xE8 \xEF\xF0\xEE\xE1\xEB\xE5\xEC - \xEE\xE1\xF0\xE0\xF2\xE8\xF2\xE5\xF1\xFC \xEA \xF0\xE0\xE7\xF0\xE0\xE1\xEE\xF2\xF7\xE8\xEA\xF3.\n\t\t\n\xCF\xF0\xE5\xE8\xEC\xF3\xF9\xE5\xF1\xF2\xE2\xE0 \xE8\xF1\xEF\xEE\xEB\xFC\xE7\xEE\xE2\xE0\xED\xE8\xFF \xEF\xEE\xE4\xEF\xE8\xF1\xEA\xE8:\n\t- \xCD\xE5\xEE\xE3\xF0\xE0\xED\xE8\xF7\xE5\xED\xED\xEE\xE5 \xEA\xEE\xEB\xE8\xF7\xE5\xF1\xF2\xE2\xEE \xED\xEE\xE2\xEE\xF1\xF2\xE5\xE9 \xEE \xEC\xE5\xF0\xEE\xEF\xF0\xE8\xFF\xF2\xE8\xE8;"))
				imgui.Separator()
				imgui.NewLine()
				imgui.Text(u8("\xC8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFF \xEE \xEF\xEE\xE4\xEF\xE8\xF1\xEA\xE5:\n\xC2\xE0\xF8\xE0 \xEF\xEE\xE4\xEF\xE8\xF1\xEA\xE0 \xE4\xE5\xE9\xF1\xF2\xE2\xF3\xE5\xF2 \xE4\xEE:"))
				imgui.NewLine()

				if imgui.Button(u8("\xCF\xEE\xE4\xEF\xE8\xF1\xEA\xE0")) then
					-- block empty
				end

				imgui.End()
			end

			if settings_window.v then
				local var_102_67, var_102_68 = getScreenResolution()

				imgui.SetNextWindowPos(imgui.ImVec2(var_102_67 / 2, var_102_68 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(510, 440), imgui.Cond.FirstUseEver)
				imgui.Begin(u8("\xCD\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE8"), settings_window, imgui.WindowFlags.NoResize)
				imgui.SetWindowSize(imgui.ImVec2(530, 440))

				if selected == nil then
					selected = 1
				end

				imgui.BeginChild("left pane", imgui.ImVec2(150, 0), true)

				for iter_102_13 = 1, 6 do
					if imgui.Selectable(settings[iter_102_13], selected == iter_102_13) then
						selected = iter_102_13
					end
				end

				imgui.EndChild()
				imgui.SameLine()

				if selected == 1 then
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))

					if imgui.Checkbox(u8("\xC2\xFB\xE4\xE0\xE2\xE0\xF2\xFC \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xE9 \xF1\xEA\xE8\xED"), imgui.ImBool(skin_changer)) then
						if skin_changer then
							skin_changer = false

							local var_102_69 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_69.skin_changer.status = false

							var_0_0.save(var_102_69, "AdminTools\\config.ini")
						else
							skin_changer = true

							local var_102_70 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_70.skin_changer.status = true

							var_0_0.save(var_102_70, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xC5\xF1\xEB\xE8 \xE2\xFB \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 4-\xE3\xEE \xF3\xF0\xEE\xE2\xED\xFF - \xF1\xEA\xF0\xE8\xEF\xF2 \xE1\xF3\xE4\xE5\xF2 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xE2\xFB\xE4\xE0\xE2\xE0\xF2\xFC \xC2\xE0\xEC \xE7\xE0\xE4\xE0\xED\xED\xFB\xE9 \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xE9 \xF1\xEA\xE8\xED \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xE2 \xE8\xE3\xF0\xF3 \xE8\xEB\xE8 \xE2\xFB\xF5\xEE\xE4\xE5 \xE8\xE7 \xF0\xE5\xE6\xE8\xEC\xE0 \xF1\xEB\xE5\xE6\xEA\xE8."))

					if skin_changer then
						imgui.InputText(u8("\xD3\xEA\xE0\xE6\xE8\xF2\xE5 ID \xF1\xEA\xE8\xED\xE0"), skin_text_buffer)

						if imgui.Button(u8("\xCE\xE1\xE7\xEE\xF0 \xF1\xEA\xE8\xED\xE0")) then
							local var_102_71 = string.match(skin_text_buffer.v, "%d+")

							if var_102_71 ~= nil then
								local var_102_72 = tonumber(var_102_71)

								if var_102_72 >= 0 and var_102_72 <= 311 and var_102_72 ~= 74 then
									sampTextdrawCreate(420, "Skin", 450, 175)
									sampTextdrawSetBoxColorAndSize(420, true, 4294967295, 105, 105)
									sampTextdrawSetStyle(420, 5)
									sampTextdrawSetModelRotationZoomVehColor(420, var_102_72, 0, 0, 0, 0.9, 1, 1)
								else
									message("\xCD\xE5\xEA\xEE\xF0\xF0\xE5\xEA\xF2\xED\xEE\xE5 \xE7\xED\xE0\xF7\xE5\xED\xE8\xE5 ID \xF1\xEA\xE8\xED\xE0!")
								end
							else
								message("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xE7\xED\xE0\xF7\xE5\xED\xE8\xE5 ID \xF1\xEA\xE8\xED\xE0!")
							end
						end

						imgui.SameLine()

						if imgui.Button(u8("\xCF\xF0\xE8\xEC\xE5\xED\xE8\xF2\xFC")) then
							local var_102_73 = string.match(skin_text_buffer.v, "%d+")

							if var_102_73 ~= nil then
								local var_102_74 = tonumber(var_102_73)

								if var_102_74 >= 0 and var_102_74 <= 311 and var_102_74 ~= 74 and var_102_74 ~= mainSkin then
									local var_102_75 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

									var_102_75.skin_changer.skin = var_102_74

									var_0_0.save(var_102_75, "AdminTools\\config.ini")

									local var_102_76, var_102_77 = sampGetPlayerIdByCharHandle(PLAYER_PED)

									sampSendChat(string.format("/skin %i %i", var_102_77, var_102_74))

									skin = var_102_74

									if sampTextdrawIsExists(420) then
										sampTextdrawDelete(420)
									end
								else
									message("\xCD\xE5\xEA\xEE\xF0\xF0\xE5\xEA\xF2\xED\xEE\xE5 \xE7\xED\xE0\xF7\xE5\xED\xE8\xE5 ID \xF1\xEA\xE8\xED\xE0!")
								end
							else
								message("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xE7\xED\xE0\xF7\xE5\xED\xE8\xE5 ID \xF1\xEA\xE8\xED\xE0!")
							end
						end

						imgui.NewLine()
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF2\xE5\xEA\xF3\xF9\xE8\xE5 \xEA\xEE\xEE\xF0\xE4\xE8\xED\xE0\xF2\xFB"), imgui.ImBool(pos_indication)) then
						if pos_indication then
							pos_indication = false

							local var_102_78 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_78.cheats.pos_indication = false

							var_0_0.save(var_102_78, "AdminTools\\config.ini")
						else
							pos_indication = true

							local var_102_79 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_79.cheats.pos_indication = true

							var_0_0.save(var_102_79, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xF1\xEB\xE5\xE6\xE8\xE2\xE0\xF2\xFC \xE0\xE4\xEC\xE8\xED. \xEA\xEE\xEC\xE0\xED\xE4\xFB \xE8\xE7 \xE0\xE4\xEC\xE8\xED. \xF7\xE0\xF2\xE0"), imgui.ImBool(admin_chat_commands_status)) then
						if admin_chat_commands_status then
							admin_chat_commands_status = false

							local var_102_80 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_80.admin_chat_commands.status = false

							var_0_0.save(var_102_80, "AdminTools\\config.ini")
						else
							admin_chat_commands_status = true

							local var_102_81 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_81.admin_chat_commands.status = true

							var_0_0.save(var_102_81, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xC2 \xF1\xEB\xF3\xF7\xE0\xE5, \xE5\xF1\xEB\xE8 \xE4\xF0\xF3\xE3\xEE\xE9 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 (\xEA \xEF\xF0\xE8\xEC\xE5\xF0\xF3, \xF5\xE5\xEB\xEF\xE5\xF0) \xEF\xF0\xEE\xEF\xE8\xF8\xE5\xF2 \xE2 \xE0\xE4\xEC\xE8\xED. \xF7\xE0\xF2\xE5 \xE0\xE4\xEC\xE8\xED. \xEA\xEE\xEC\xE0\xED\xE4\xF3 - \xF1\xEA\xF0\xE8\xEF\xF2 \xEF\xF0\xE5\xE4\xEB\xEE\xE6\xE8\xF2 \xE5\xE5 \xE2\xFB\xEF\xEE\xEB\xED\xE8\xF2\xFC."))

					if imgui.Checkbox(u8("\xC0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xED\xE0\xE7\xED\xE0\xF7\xE0\xF2\xFC \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xEC \xEB\xE8\xE4\xE5\xF0\xEE\xEC"), imgui.ImBool(auto_invite_status)) then
						if auto_invite_status then
							auto_invite_status = false

							local var_102_82 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_82.auto_invite.status = false

							var_0_0.save(var_102_82, "AdminTools\\config.ini")
						else
							auto_invite_status = true

							local var_102_83 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_83.auto_invite.status = true

							var_0_0.save(var_102_83, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xC5\xF1\xEB\xE8 \xE2\xFB \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 4-\xE3\xEE \xF3\xF0\xEE\xE2\xED\xFF - \xF1\xEA\xF0\xE8\xEF\xF2 \xE1\xF3\xE4\xE5\xF2 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xED\xE0\xE7\xED\xE0\xF7\xE0\xF2\xFC \xC2\xE0\xF1 \xE2\xF0\xE5\xEC\xE5\xED\xED\xFB\xEC \xEB\xE8\xE4\xE5\xF0\xEE\xEC \xEE\xF0\xE3\xE0\xED\xE8\xE7\xE0\xF6\xE8\xE8 \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xE2 \xE8\xE3\xF0\xF3 \xE8\xEB\xE8 \xEF\xEE\xF1\xEB\xE5 \xE2\xFB\xE4\xE0\xF7\xE5 \xE7\xE0\xF0\xEF\xEB\xE0\xF2\xFB."))

					if imgui.Checkbox(u8("\xCF\xF0\xEE\xE2\xE5\xF0\xFF\xF2\xFC \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xFF \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xE2 \xE8\xE3\xF0\xF3"), imgui.ImBool(auto_check_update)) then
						if auto_check_update then
							auto_check_update = false

							local var_102_84 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_84.update.auto_check_update = false

							var_0_0.save(var_102_84, "AdminTools\\config.ini")
						else
							auto_check_update = true

							local var_102_85 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_85.update.auto_check_update = true

							var_0_0.save(var_102_85, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF1\xEE\xE1\xF1\xF2\xE2\xE5\xED\xED\xFB\xE9 ID"), imgui.ImBool(id_indication)) then
						if id_indication then
							id_indication = false

							local var_102_86 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_86.player_info_panel.id_indication = false

							var_0_0.save(var_102_86, "AdminTools\\config.ini")
						else
							id_indication = true

							local var_102_87 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_87.player_info_panel.id_indication = true

							var_0_0.save(var_102_87, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xEF\xE0\xED\xE5\xEB\xFC \xF1 \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xE5\xE9 \xEE\xE1 \xE8\xE3\xF0\xEE\xEA\xE5"), imgui.ImBool(player_info_panel_status)) then
						if player_info_panel_status then
							player_info_panel_status = false

							local var_102_88 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_88.player_info_panel.panel_status = false

							var_0_0.save(var_102_88, "AdminTools\\config.ini")
						else
							player_info_panel_status = true

							local var_102_89 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_89.player_info_panel.panel_status = true

							var_0_0.save(var_102_89, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xE3\xF0\xE0\xF4\xE8\xEA \xEF\xE8\xED\xE3\xE0 \xE8\xE3\xF0\xEE\xEA\xE0"), imgui.ImBool(show_ping_chart)) then
						if show_ping_chart then
							show_ping_chart = false

							local var_102_90 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_90.player_info_panel.show_ping_chart = false

							var_0_0.save(var_102_90, "AdminTools\\config.ini")
						else
							show_ping_chart = true

							local var_102_91 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_91.player_info_panel.show_ping_chart = true

							var_0_0.save(var_102_91, "AdminTools\\config.ini")
						end
					end

					if show_ping_chart then
						imgui.Text(u8("\xC8\xE7\xEC\xE5\xED\xE8\xF2\xFC \xEF\xEE\xEB\xEE\xE6\xE5\xED\xE8\xE5 \xE3\xF0\xE0\xF4\xE8\xEA\xE0 \xEF\xE8\xED\xE3\xE0:"))

						if imgui.Button(u8("\xC8\xE7\xEC\xE5\xED\xE8\xF2\xFC")) then
							text = "\xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xCB\xCA\xCC \xE4\xEB\xFF \xEF\xF0\xE8\xEC\xE5\xED\xE5\xED\xE8\xFF \xEF\xEE\xE7\xE8\xF6\xE8\xE8."

							message(text)

							change_ping_chart = true
						end

						imgui.SameLine()

						if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
							local var_102_92 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_92.player_info_panel.ping_chart_xpos = 640
							var_102_92.player_info_panel.ping_chart_ypos = 435

							var_0_0.save(var_102_92, "AdminTools\\config.ini")

							ping_chart_x_pos = 640
							ping_chart_y_pos = 435
						end

						imgui.NewLine()
					end

					if imgui.Checkbox(u8("\xC0\xE2\xF2\xEE\xE2\xE2\xEE\xE4 \xEF\xE0\xF0\xEE\xEB\xFF \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5"), imgui.ImBool(autoLoginStatus)) then
						if autoLoginStatus then
							autoLoginStatus = false

							local var_102_93 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_93.auto_login.status = false

							var_0_0.save(var_102_93, "AdminTools\\config.ini")
						else
							autoLoginStatus = true

							local var_102_94 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_94.auto_login.status = true

							var_0_0.save(var_102_94, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xCF\xE0\xF0\xEE\xEB\xFC \xEE\xF2 \xC2\xE0\xF8\xE5\xE3\xEE \xE8\xE3\xF0\xEE\xE2\xEE\xE3\xEE \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0 \xE1\xF3\xE4\xE5\xF2 \xE2\xE2\xEE\xE4\xE8\xF2\xFC\xF1\xFF \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0.\n\n\xCF\xE0\xF0\xEE\xEB\xFC \xE1\xF3\xE4\xE5\xF2 \xF5\xF0\xE0\xED\xE8\xF2\xFC\xF1\xFF \xE2 \xF4\xE0\xE9\xEB\xE5 \xED\xE0\xF1\xF2\xF0\xEE\xE5\xEA, \xE2 \xE7\xE0\xF8\xE8\xF4\xF0\xEE\xE2\xE0\xED\xED\xEE\xEC \xE2\xE8\xE4\xE5."))

					if autoLoginStatus then
						imgui.InputText(u8("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC"), password_text_buffer, imgui.InputTextFlags.Password)

						if imgui.Button(u8("\xD1\xEE\xF5\xF0\xE0\xED\xE8\xF2\xFC")) then
							local var_102_95 = string.match(password_text_buffer.v, ".+")

							if var_102_95 ~= nil then
								local var_102_96 = aesEncrypt(pass, var_102_95)

								password_hash = getHmac(var_102_96) .. var_102_96

								local var_102_97 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

								var_102_97.auto_login.password = password_hash

								var_0_0.save(var_102_97, "AdminTools\\config.ini")
								message("\xCF\xE0\xF0\xEE\xEB\xFC \xF3\xF1\xEF\xE5\xF8\xED\xEE \xE7\xE0\xF8\xE8\xF4\xF0\xEE\xE2\xE0\xED \xE8 \xF1\xEE\xF5\xF0\xE0\xED\xE5\xED.")
							else
								message("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC \xEE\xF2 \xE8\xE3\xF0\xEE\xE2\xEE\xE3\xEE \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0.")
							end
						end

						imgui.SameLine()

						if imgui.Button(u8("\xD3\xE4\xE0\xEB\xE8\xF2\xFC")) then
							local var_102_98 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_98.auto_login.password = "0"

							var_0_0.save(var_102_98, "AdminTools\\config.ini")
							message("\xCF\xE0\xF0\xEE\xEB\xFC \xF3\xE4\xE0\xEB\xE5\xED.")

							password_text_buffer.v = ""
						end
					end

					imgui.EndChild()
					imgui.EndGroup()
				elseif selected == 2 then
					if imgui.Checkbox(u8("\xC2\xFB\xE4\xE0\xE2\xE0\xF2\xFC \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0"), imgui.ImBool(punishment_list_auto_mode)) then
						if punishment_list_auto_mode then
							punishment_list_auto_mode = false

							local var_102_99 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_99.punishment_list.auto_mode = false

							var_0_0.save(var_102_99, "AdminTools\\config.ini")
						else
							punishment_list_auto_mode = true

							local var_102_100 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_100.punishment_list.auto_mode = true

							var_0_0.save(var_102_100, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xCD\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xE8\xE7 \xF2\xE0\xE1\xEB\xE8\xF6\xFB \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9 \xE1\xF3\xE4\xF3\xF2 \xE0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xE2\xFB\xE4\xE0\xE2\xE0\xF2\xFC\xF1\xFF \xE8\xE3\xF0\xEE\xEA\xE0\xEC, \xEA\xEE\xE3\xE4\xE0 \xEE\xED\xE8 \xE7\xE0\xE9\xE4\xF3\xF2 \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0."))
				elseif selected == 3 then
					imgui.SetWindowSize(imgui.ImVec2(590, 440))
					imgui.BeginGroup()
					imgui.BeginChild("item view", imgui.ImVec2(0, -imgui.GetItemsLineHeightWithSpacing()))
					imgui.BeginChild("setting_c", imgui.ImVec2(180, -imgui.GetItemsLineHeightWithSpacing()), true)
					imgui.Text(u8("\xC4\xEE\xF1\xF2\xF3\xEF\xED\xFB\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xE8:"))
					imgui.Separator()

					if key_selected == nil then
						key_selected = 1
					end

					for iter_102_14 = 1, 10 do
						if imgui.Selectable(key_name[iter_102_14], key_selected == iter_102_14) then
							key_selected = iter_102_14
						end
					end

					imgui.EndChild()
					imgui.SameLine()
					imgui.BeginChild("setting_d", imgui.ImVec2(230, -imgui.GetItemsLineHeightWithSpacing()), true)

					if key_selected == 1 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[main_menu_key]))
					elseif key_selected == 2 then
						if reconnect_on_key2 ~= 0 then
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEE\xEC\xE1\xE8\xED\xE0\xF6\xE8\xFF: ") .. var_0_5.id_to_name(var_0_5[reconnect_on_key1]) .. "+" .. var_0_5.id_to_name(var_0_5[reconnect_on_key2]))
						else
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[reconnect_on_key1]))
						end
					elseif key_selected == 3 then
						if wh_on_key2 ~= 0 then
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEE\xEC\xE1\xE8\xED\xE0\xF6\xE8\xFF: ") .. var_0_5.id_to_name(var_0_5[wh_on_key1]) .. "+" .. var_0_5.id_to_name(var_0_5[wh_on_key2]))
						else
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[wh_on_key1]))
						end
					elseif key_selected == 4 then
						if gm_on_key2 ~= 0 then
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEE\xEC\xE1\xE8\xED\xE0\xF6\xE8\xFF: ") .. var_0_5.id_to_name(var_0_5[gm_on_key1]) .. "+" .. var_0_5.id_to_name(var_0_5[gm_on_key2]))
						else
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[gm_on_key1]))
						end
					elseif key_selected == 5 then
						if ab_on_key2 ~= 0 then
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEE\xEC\xE1\xE8\xED\xE0\xF6\xE8\xFF: ") .. var_0_5.id_to_name(var_0_5[ab_on_key1]) .. "+" .. var_0_5.id_to_name(var_0_5[ab_on_key2]))
						else
							imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[ab_on_key1]))
						end
					elseif key_selected == 6 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[admin_chat_confirm_key]))
					elseif key_selected == 7 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[admin_chat_cancel_key]))
					elseif key_selected == 8 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[fast_command_menu_key]))
					elseif key_selected == 9 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[sp_prev_id_key]))
					elseif key_selected == 10 then
						imgui.Text(u8("\xD2\xE5\xEA\xF3\xF9\xE0\xFF \xEA\xEB\xE0\xE2\xE8\xF8\xE0: ") .. var_0_5.id_to_name(var_0_5[sp_next_id_key]))
					end

					imgui.Text(u8("\n\xCD\xE0\xE7\xED\xE0\xF7\xE8\xF2\xFC \xED\xEE\xE2\xF3\xFE \xEA\xEB\xE0\xE2\xE8\xF8\xF3:"))

					if key_selected == 1 or key_selected == 6 or key_selected == 7 or key_selected == 8 or key_selected == 9 or key_selected == 10 then
						if imgui.Button(u8("\xCD\xE0\xE7\xED\xE0\xF7\xE8\xF2\xFC")) and setKeyButtonLock == false then
							lua_thread.create(setKeyThread, 1, key_selected)
						end
					elseif imgui.Button(u8("\xCE\xE4\xED\xE0 \xEA\xEB\xE0\xE2\xE8\xF8\xE0")) then
						if setKeyButtonLock == false then
							lua_thread.create(setKeyThread, 1, key_selected)
						end
					elseif imgui.Button(u8("\xC4\xE2\xE5 \xEA\xEB\xE0\xE2\xE8\xF8\xE8")) and setKeyButtonLock == false then
						lua_thread.create(setKeyThread, 2, key_selected)
					end

					imgui.EndChild()

					if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xF1\xE5")) then
						local var_102_101 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_101.cheats.ab_on_key1 = "VK_OEM_COMMA"
						var_102_101.cheats.ab_on_key2 = 0
						var_102_101.cheats.tp_on_marker_key = "VK_LBUTTON"
						var_102_101.cheats.marker_enable_key = "VK_MBUTTON"
						var_102_101.cheats.wh_on_key1 = "VK_MENU"
						var_102_101.cheats.wh_on_key2 = "VK_F3"
						var_102_101.cheats.gm_on_key1 = "VK_INSERT"
						var_102_101.cheats.gm_on_key2 = 0
						var_102_101.reconnect.reconnect_on_key1 = "VK_SHIFT"
						var_102_101.reconnect.reconnect_on_key2 = "VK_0"
						var_102_101.player_info_panel.prev_id_key = "VK_LEFT"
						var_102_101.player_info_panel.next_id_key = "VK_RIGHT"
						var_102_101.admin_chat_commands.confirm_key = "VK_DELETE"
						var_102_101.admin_chat_commands.cancel_key = "VK_END"
						var_102_101.menus.main_menu_key = "VK_M"
						var_102_101.menus.fast_command_menu_key = "VK_RBUTTON"

						var_0_0.save(var_102_101, "AdminTools\\config.ini")

						ab_on_key1 = "VK_OEM_COMMA"
						ab_on_key2 = 0
						tp_on_marker_key = "VK_LBUTTON"
						marker_enable_key = "VK_MBUTTON"
						wh_on_key1 = "VK_MENU"
						wh_on_key2 = "VK_F3"
						gm_on_key1 = "VK_INSERT"
						gm_on_key2 = 0
						reconnect_on_key1 = "VK_SHIFT"
						reconnect_on_key2 = "VK_0"
						sp_prev_id_key = "VK_LEFT"
						sp_next_id_key = "VK_RIGHT"
						admin_chat_confirm_key = "VK_DELETE"
						admin_chat_cancel_key = "VK_END"
						main_menu_key = "VK_M"
						fast_command_menu_key = "VK_RBUTTON"

						message("\xC7\xED\xE0\xF7\xE5\xED\xE8\xFF \xE3\xEE\xF0\xFF\xF7\xE8\xF5 \xEA\xEB\xE0\xE2\xE8\xF8 \xF3\xF1\xF2\xE0\xED\xEE\xE2\xEB\xE5\xED\xFB \xED\xE0 \xE7\xED\xE0\xF7\xE5\xED\xE8\xFF \xEF\xEE-\xF3\xEC\xEE\xEB\xF7\xE0\xED\xE8\xFE.")
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC \xE2\xF1\xE5 \xED\xE0\xF1\xF2\xF0\xEE\xE9\xEA\xE8 \xEA\xEB\xE0\xE2\xE8\xF8 \xED\xE0 \xE7\xED\xE0\xF7\xE5\xED\xE8\xFF \xEF\xEE-\xF3\xEC\xEE\xEB\xF7\xE0\xED\xE8\xFE."))
					imgui.EndChild()
					imgui.EndGroup()
				elseif selected == 4 then
					imgui.BeginGroup()

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF1\xEF\xE8\xF1\xEE\xEA \xEB\xE8\xE4\xE5\xF0\xEE\xE2 \xEE\xED\xEB\xE0\xE9\xED"), imgui.ImBool(leaders_checker_status)) then
						if leaders_checker_status then
							leaders_checker_status = false

							local var_102_102 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_102.checker.leaders_checker_status = false

							var_0_0.save(var_102_102, "AdminTools\\config.ini")
						else
							leaders_checker_status = true

							local var_102_103 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_103.checker.leaders_checker_status = true

							var_0_0.save(var_102_103, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF1\xEF\xE8\xF1\xEE\xEA \xE4\xF0\xF3\xE7\xE5\xE9 \xEE\xED\xEB\xE0\xE9\xED"), imgui.ImBool(friends_checker_status)) then
						if friends_checker_status then
							friends_checker_status = false

							local var_102_104 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_104.checker.friends_checker_status = false

							var_0_0.save(var_102_104, "AdminTools\\config.ini")
						else
							friends_checker_status = true

							local var_102_105 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_105.checker.friends_checker_status = true

							var_0_0.save(var_102_105, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF1\xEF\xE8\xF1\xEE\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2 \xEE\xED\xEB\xE0\xE9\xED"), imgui.ImBool(admins_checker_status)) then
						if admins_checker_status then
							admins_checker_status = false

							local var_102_106 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_106.checker.admins_checker_status = false

							var_0_0.save(var_102_106, "AdminTools\\config.ini")
						else
							admins_checker_status = true

							local var_102_107 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_107.checker.admins_checker_status = true

							var_0_0.save(var_102_107, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xC0\xE2\xF2\xEE\xEC\xE0\xF2\xE8\xF7\xE5\xF1\xEA\xE8 \xEE\xE1\xED\xEE\xE2\xEB\xFF\xF2\xFC \xF1\xEF\xE8\xF1\xEE\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xEE\xE2"), imgui.ImBool(admin_checker_auto_update)) then
						if admin_checker_auto_update then
							admin_checker_auto_update = false

							local var_102_108 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_108.checker.admin_checker_auto_update = false

							var_0_0.save(var_102_108, "AdminTools\\config.ini")
						else
							admin_checker_auto_update = true

							local var_102_109 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_109.checker.admin_checker_auto_update = true

							var_0_0.save(var_102_109, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xC0\xEA\xF2\xE8\xE2\xE8\xF0\xEE\xE2\xE0\xF2\xFC \xF1\xF7\xB8\xF2\xF7\xE8\xEA \xEF\xF0\xE5\xE4\xF3\xEF\xF0\xE5\xE6\xE4\xE5\xED\xE8\xE9 \xED\xE0 \xE7\xE0\xF5\xE2\xE0\xF2\xE5"), imgui.ImBool(capture_warns_counter_status)) then
						if capture_warns_counter_status then
							capture_warns_counter_status = false

							local var_102_110 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_110.checker.capture_warns_counter_status = false

							var_0_0.save(var_102_110, "AdminTools\\config.ini")
						else
							capture_warns_counter_status = true

							local var_102_111 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_111.checker.capture_warns_counter_status = true

							var_0_0.save(var_102_111, "AdminTools\\config.ini")
						end
					end

					imgui.Text(u8("\xC8\xE7\xEC\xE5\xED\xE8\xF2\xFC \xEF\xEE\xEB\xEE\xE6\xE5\xED\xE8\xE5 \xEF\xE0\xED\xE5\xEB\xE8 \xE8 \xF7\xE5\xEA\xE5\xF0\xE0:"))

					if imgui.Button(u8("\xC8\xE7\xEC\xE5\xED\xE8\xF2\xFC")) then
						text = "\xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xCB\xCA\xCC \xE4\xEB\xFF \xEF\xF0\xE8\xEC\xE5\xED\xE5\xED\xE8\xFF \xEF\xEE\xE7\xE8\xF6\xE8\xE8."

						message(text)

						change_pip = true
					end

					imgui.SameLine()

					if imgui.Button(u8("\xD1\xE1\xF0\xEE\xF1\xE8\xF2\xFC")) then
						local var_102_112 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_112.player_info_panel.xpos = 5
						var_102_112.player_info_panel.ypos = 183

						var_0_0.save(var_102_112, "AdminTools\\config.ini")

						pip_x_pos = 5
						pip_y_pos = 183
					end

					imgui.EndGroup()
				elseif selected == 5 then
					imgui.BeginGroup()

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xF1\xEE\xF1\xF2\xEE\xFF\xED\xE8\xE5 \xF7\xE8\xF2\xEE\xE2"), imgui.ImBool(cheats_panel_status)) then
						if cheats_panel_status then
							cheats_panel_status = false

							local var_102_113 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_113.cheats.panel_status = false

							var_0_0.save(var_102_113, "AdminTools\\config.ini")
						else
							cheats_panel_status = true

							local var_102_114 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_114.cheats.panel_status = true

							var_0_0.save(var_102_114, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xC0\xEA\xF2\xE8\xE2\xE8\xF0\xEE\xE2\xE0\xF2\xFC GodMode \xEF\xF0\xE8 \xE7\xE0\xEF\xF3\xF1\xEA\xE5 \xE8\xE3\xF0\xFB"), imgui.ImBool(gm_on_start)) then
						if gm_on_start then
							gm_on_start = false

							local var_102_115 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_115.cheats.gm_on_start = false

							var_0_0.save(var_102_115, "AdminTools\\config.ini")
						else
							gm_on_start = true

							local var_102_116 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_116.cheats.gm_on_start = true

							var_0_0.save(var_102_116, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xC0\xEA\xF2\xE8\xE2\xE8\xF0\xEE\xE2\xE0\xF2\xFC WallHack \xEF\xF0\xE8 \xE7\xE0\xEF\xF3\xF1\xEA\xE5 \xE8\xE3\xF0\xFB"), imgui.ImBool(wh_on_start)) then
						if wh_on_start then
							wh_on_start = false

							local var_102_117 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_117.cheats.wh_on_start = false

							var_0_0.save(var_102_117, "AdminTools\\config.ini")
						else
							local var_102_118 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_118.cheats.wh_on_start = true

							var_0_0.save(var_102_118, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFF \xEE \xF2\xF0\xE0\xED\xF1\xEF\xEE\xF0\xF2\xE5"), imgui.ImBool(ts_info)) then
						if ts_info then
							ts_info = false

							local var_102_119 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_119.cheats.ts_info = false

							var_0_0.save(var_102_119, "AdminTools\\config.ini")
						else
							ts_info = true

							local var_102_120 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_120.cheats.ts_info = true

							var_0_0.save(var_102_120, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC ID \xE8\xE3\xF0\xEE\xEA\xEE\xE2 \xE2 \xEC\xE0\xF1\xEA\xE5 \xE8 \xE8\xE7 \xCC\xC2\xC4"), imgui.ImBool(player_id_in_mask_and_mvd)) then
						if player_id_in_mask_and_mvd then
							player_id_in_mask_and_mvd = false

							local var_102_121 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_121.cheats.player_id_in_mask_and_mvd = false

							var_0_0.save(var_102_121, "AdminTools\\config.ini")
						else
							player_id_in_mask_and_mvd = true

							local var_102_122 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_122.cheats.player_id_in_mask_and_mvd = true

							var_0_0.save(var_102_122, "AdminTools\\config.ini")
						end
					end

					imgui.EndGroup()
				elseif selected == 6 then
					imgui.BeginGroup()

					if imgui.Checkbox(u8("\xCF\xE5\xF0\xE5\xED\xEE\xF1\xE8\xF2\xFC \xF1\xF2\xF0\xEE\xEA\xF3 \xEF\xF0\xE8 \xEE\xF2\xEF\xF0\xE0\xE2\xEA\xE5 \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xFF"), imgui.ImBool(auto_perenos)) then
						if auto_perenos then
							auto_perenos = false

							local var_102_123 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_123.chat.auto_perenos = false

							var_0_0.save(var_102_123, "AdminTools\\config.ini")
						else
							auto_perenos = true

							local var_102_124 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_124.chat.auto_perenos = true

							var_0_0.save(var_102_124, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEF\xF0\xE0\xE2\xEB\xFF\xF2\xFC \xF3\xE2\xE5\xE4\xEE\xEC\xEB\xE5\xED\xE8\xFF \xE2 \xE0\xE4\xEC\xE8\xED. \xF7\xE0\xF2"), imgui.ImBool(admin_chat_notifications)) then
						if admin_chat_notifications then
							admin_chat_notifications = false

							local var_102_125 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_125.chat.admin_chat_notifications = false

							var_0_0.save(var_102_125, "AdminTools\\config.ini")
						else
							admin_chat_notifications = true

							local var_102_126 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_126.chat.admin_chat_notifications = true

							var_0_0.save(var_102_126, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEA\xEB\xFE\xF7\xE0\xF2\xFC \xF2\xE5\xEB\xE5\xF4\xEE\xED \xEF\xF0\xE8 \xE2\xF5\xEE\xE4\xE5 \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0"), imgui.ImBool(togphone)) then
						if togphone then
							togphone = false

							local var_102_127 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_127.chat.togphone = false

							var_0_0.save(var_102_127, "AdminTools\\config.ini")
						else
							togphone = true

							local var_102_128 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_128.chat.togphone = true

							var_0_0.save(var_102_128, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xF2\xEE\xE1\xF0\xE0\xE6\xE0\xF2\xFC ID \xE8\xE3\xF0\xEE\xEA\xE0 \xF0\xFF\xE4\xEE\xEC \xF1 \xED\xE8\xEA\xEE\xEC"), imgui.ImBool(chatid)) then
						if chatid then
							chatid = false

							local var_102_129 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_129.chat.chatid = false

							var_0_0.save(var_102_129, "AdminTools\\config.ini")
						else
							chatid = true

							local var_102_130 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_130.chat.chatid = true

							var_0_0.save(var_102_130, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xD3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC \xED\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0 \xE2 \xEE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE8"), imgui.ImBool(adm_nick_in_msg)) then
						if adm_nick_in_msg then
							adm_nick_in_msg = false

							local var_102_131 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_131.chat.adm_nick_in_msg = false

							var_0_0.save(var_102_131, "AdminTools\\config.ini")
						else
							adm_nick_in_msg = true

							local var_102_132 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_132.chat.adm_nick_in_msg = true

							var_0_0.save(var_102_132, "AdminTools\\config.ini")
						end
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xD3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC \xED\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0 \xE2 \xEE\xE1\xFA\xFF\xE2\xEB\xE5\xED\xE8\xE8, \xEF\xEE \xF7\xFC\xE5\xE9 \xEF\xF0\xEE\xF1\xFC\xE1\xE5 \xEE\xED\xEE \xE1\xFB\xEB\xEE \xEF\xEE\xE4\xE0\xED\xEE.\n\n\xCF\xF0\xE8\xEC\xE5\xF0:\n\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 James_Turner: \xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF \xE6\xE5\xEB\xE0\xE5\xF2 \xC2\xE0\xEC \xEF\xF0\xE8\xFF\xF2\xED\xEE\xE9 \xE8\xE3\xF0\xFB! \x95 S. Jackson."))
					imgui.Text(u8("\n\xD3\xE2\xE5\xE4\xEE\xEC\xEB\xFF\xF2\xFC \xEF\xF0\xE8:"))

					if imgui.Checkbox(u8("\xCE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE8 \xF1\xF2\xF0\xEE\xEA\xE8 \xE0\xED\xF2\xE8\xF7\xE8\xF2\xE0 \xED\xE0 \xEE\xF0\xF3\xE6\xE8\xE5"), imgui.ImBool(gun_anticheat_upd_notice)) then
						if gun_anticheat_upd_notice then
							gun_anticheat_upd_notice = false

							local var_102_133 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_133.cheats.gun_anticheat_upd_notice = false

							var_0_0.save(var_102_133, "AdminTools\\config.ini")
						else
							gun_anticheat_upd_notice = true

							local var_102_134 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_134.cheats.gun_anticheat_upd_notice = true

							var_0_0.save(var_102_134, "AdminTools\\config.ini")
						end
					end

					if imgui.Checkbox(u8("\xCE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE8 \xF1\xF2\xF0\xEE\xEA\xE8 \xE0\xED\xF2\xE8\xF7\xE8\xF2\xE0 \xED\xE0 \xE1\xFB\xF1\xF2\xF0. \xEF\xE5\xF0\xE5\xEC\xE5\xF9\xE5\xED\xE8\xE5"), imgui.ImBool(teleport_anticheat_upd_notice)) then
						if teleport_anticheat_upd_notice then
							teleport_anticheat_upd_notice = false

							local var_102_135 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_135.cheats.teleport_anticheat_upd_notice = false

							var_0_0.save(var_102_135, "AdminTools\\config.ini")
						else
							teleport_anticheat_upd_notice = true

							local var_102_136 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

							var_102_136.cheats.teleport_anticheat_upd_notice = true

							var_0_0.save(var_102_136, "AdminTools\\config.ini")
						end
					end

					imgui.TextWrapped(u8("\n\xD0\xE5\xE6\xE8\xEC \xF3\xEA\xE0\xE7\xE0\xED\xE8\xFF \xED\xE8\xEA\xE0 \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0 \xEF\xF0\xE8 \xE2\xFB\xE4\xE0\xF7\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xFF \xEF\xEE \xE5\xE3\xEE \xEF\xF0\xEE\xF1\xFC\xE1\xE5:"))
					imgui.BeginChild("buttons")

					if imgui.RadioButton(u8("\xC2 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE8"), comm_from_adm_chat_notice_mode == 1) then
						local var_102_137 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_137.admin_chat_commands.notice_mode = 1

						var_0_0.save(var_102_137, "AdminTools\\config.ini")

						comm_from_adm_chat_notice_mode = 1
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xCD\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0, \xEF\xEE \xF7\xFC\xE5\xE9 \xEF\xF0\xEE\xF1\xFC\xE1\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE1\xFB\xEB\xEE \xE2\xFB\xE4\xE0\xED\xEE, \xE1\xF3\xE4\xE5\xF2 \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC\xF1\xFF \xE2 \xF1\xE0\xEC\xEE\xEC \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE8, \xF7\xE5\xF0\xE5\xE7 \xF0\xE0\xE7\xE4\xE5\xEB\xE8\xF2\xE5\xEB\xFC '\x95'.\n\n\xCF\xF0\xE8\xEC\xE5\xF0:\n\xC0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0 James_Turner \xEF\xEE\xF1\xF2\xE0\xE2\xE8\xEB \xE7\xE0\xF2\xFB\xF7\xEA\xF3 \xE8\xE3\xF0\xEE\xEA\xF3 Andrey_Ringo \xED\xE0 30 \xEC\xE8\xED\xF3\xF2. \xCF\xF0\xE8\xF7\xE8\xED\xE0: \xCC\xE0\xF2 \x95 S. Jackson"))

					if imgui.RadioButton(u8("\xC2 \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xE8 (/ans)"), comm_from_adm_chat_notice_mode == 2) then
						local var_102_138 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_138.admin_chat_commands.notice_mode = 2

						var_0_0.save(var_102_138, "AdminTools\\config.ini")

						comm_from_adm_chat_notice_mode = 2
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xCD\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0, \xEF\xEE \xF7\xFC\xE5\xE9 \xEF\xF0\xEE\xF1\xFC\xE1\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE1\xFB\xEB\xEE \xE2\xFB\xE4\xE0\xED\xEE, \xE1\xF3\xE4\xE5\xF2 \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC\xF1\xFF \xE2 \xF1\xEE\xEE\xE1\xF9\xE5\xED\xE8\xE8 \xE8\xE3\xF0\xEE\xEA\xF3 (/ans), \xEF\xEE\xF1\xEB\xE5 \xF7\xE5\xE3\xEE, \xE1\xF3\xE4\xE5\xF2 \xE2\xFB\xE4\xE0\xED\xEE \xF1\xE0\xEC\xEE \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5."))

					if imgui.RadioButton(u8("\xCD\xE5 \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC"), comm_from_adm_chat_notice_mode == 0) then
						local var_102_139 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

						var_102_139.admin_chat_commands.notice_mode = 0

						var_0_0.save(var_102_139, "AdminTools\\config.ini")

						comm_from_adm_chat_notice_mode = 0
					end

					imgui.SameLine()
					ShowHelpMarker(u8("\xCD\xE8\xEA \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0, \xEF\xEE \xF7\xFC\xE5\xE9 \xEF\xF0\xEE\xF1\xFC\xE1\xE5 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE5 \xE1\xFB\xEB\xEE \xE2\xFB\xE4\xE0\xED\xEE, \xE2\xEE\xE2\xF1\xE5 \xED\xE5 \xE1\xF3\xE4\xE5\xF2 \xF3\xEA\xE0\xE7\xFB\xE2\xE0\xF2\xFC\xF1\xFF."))
					imgui.EndChild()
					imgui.EndGroup()
				end

				imgui.End()
			end
		end

		if update_window.v then
			local var_102_140, var_102_141 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_140 / 2, var_102_141 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(550, 200), imgui.Cond.FirstUseEver)
			imgui.Begin(u8("\xD1\xEB\xF3\xE6\xE1\xE0 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xFF AdminTools"), update_window, imgui.WindowFlags.AlwaysAutoResize)

			if newVersionAT and changelog then
				imgui.Text(u8("\xC4\xEE\xF1\xF2\xF3\xEF\xED\xEE \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE5 \xE4\xEE \xE2\xE5\xF0\xF1\xE8\xE8 ") .. newVersionAT .. ".")
				imgui.Separator()
				imgui.Text(changelog)
				imgui.Separator()

				if imgui.Button(u8("\xCE\xE1\xED\xEE\xE2\xE8\xF2\xFC"), imgui.ImVec2(100, 22)) then
					download("GET", "https://raw.githubusercontent.com/Garrus93/admintools/master/AdminTools.luac")

					update_window.v = not update_window.v
				end
			elseif not noupdatefound then
				imgui.Text(u8("\xCF\xF0\xEE\xE2\xE5\xF0\xEA\xE0 \xED\xE0 \xED\xE0\xEB\xE8\xF7\xE8\xE5 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE9...  "))
			else
				imgui.Text(u8("\xC4\xEE\xF1\xF2\xF3\xEF\xED\xFB\xF5 \xEE\xE1\xED\xEE\xE2\xEB\xE5\xED\xE8\xE9 \xED\xE5\xF2.                "))
			end

			imgui.End()
		end

		if forum_window.v then
			local var_102_142, var_102_143 = getScreenResolution()

			imgui.ShowCursor = true

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_142 / 2, var_102_143 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(525, 295), imgui.Cond.FirstUseEver)
			imgui.Begin(u8("\xD0\xE0\xE7\xE4\xE5\xEB \xE6\xE0\xEB\xEE\xE1 \xF4\xEE\xF0\xF3\xEC\xE0"), forum_window, imgui.WindowFlags.NoResize)
			imgui.Columns(4, "plcolumns")
			imgui.Separator()
			imgui.Text(" #")
			imgui.SetColumnWidth(-1, 25)
			imgui.NextColumn()
			imgui.Text(u8("                      \xCD\xE0\xE7\xE2\xE0\xED\xE8\xE5 \xF2\xE5\xEC\xFB"))
			imgui.SetColumnWidth(-1, 280)
			imgui.NextColumn()
			imgui.Text(u8("        \xCD\xE8\xEA \xE0\xE2\xF2\xEE\xF0\xE0"))
			imgui.SetColumnWidth(-1, 140)
			imgui.NextColumn()
			imgui.Text(u8("\xCE\xF2\xE2\xE5\xF2\xFB"))
			imgui.SetColumnWidth(-1, 55)
			imgui.NextColumn()
			imgui.Separator()

			for iter_102_15, iter_102_16 in ipairs(forumTitle) do
				imgui.Text(iter_102_15)
				imgui.NextColumn()
				imgui.Text(iter_102_16)
				imgui.NextColumn()
				imgui.Text(forumCreator[iter_102_15])
				imgui.NextColumn()
				imgui.Text(forumComments[iter_102_15])
				imgui.NextColumn()

				if iter_102_15 < 20 then
					imgui.Separator()
				end
			end

			imgui.Columns(1)
			imgui.Separator()
			imgui.End()
		end

		if register_window.v then
			local var_102_144, var_102_145 = getScreenResolution()

			lockPlayerControl(true)
			imgui.SetNextWindowPos(imgui.ImVec2(var_102_144 / 2, var_102_145 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(330, 150), imgui.Cond.FirstUseEver)
			imgui.Begin(u8("\xD0\xE5\xE3\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF"), register_window, imgui.WindowFlags.AlwaysAutoResize)

			if not redisterDone then
				imgui.Text(u8("AdminTools Web Service \xEF\xEE\xE7\xE2\xEE\xEB\xFF\xE5\xF2 \xF1\xEE\xE1\xE8\xF0\xE0\xF2\xFC \xF2\xE0\xEA\xF3\xFE \xE8\xED\xF4\xEE\xF0\xEC\xE0\xF6\xE8\xFE, \xEA\xE0\xEA \xEB\xEE\xE3\xE8 \xE8 \xF1\xF2\xE0\xF2\xE8\xF1\xF2\xE8\xEA\xF3,\n\xF7\xF2\xEE \xEF\xEE\xE7\xE2\xEE\xEB\xFF\xE5\xF2 \xF6\xE5\xED\xF2\xF0\xE0\xEB\xE8\xE7\xEE\xE2\xE0\xED\xED\xEE \xEF\xEE\xEB\xF3\xF7\xE0\xF2\xFC \xE4\xEE\xF1\xF2\xF3\xEF \xEA \xFD\xF2\xE8\xEC \xE4\xE0\xED\xED\xFB\xEC \xE2\xF1\xE5\xEC \xE0\xE4\xEC\xE8\xED\xE8\xF1\xF2\xF0\xE0\xF2\xEE\xF0\xE0\xEC."))
				imgui.NewLine()
				imgui.Text(u8("\xCF\xF0\xE8\xE4\xF3\xEC\xE0\xE9\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC, \xF1 \xEF\xEE\xEC\xEE\xF9\xFC\xFE \xEA\xEE\xF2\xEE\xF0\xEE\xE3\xEE \xE2\xFB \xF1\xEC\xEE\xE6\xE5\xF2\xE5 \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xE8\xF0\xEE\xE2\xE0\xF2\xFC\xF1\xFF \xE2 \xF1\xE8\xF1\xF2\xE5\xEC\xE5."))
				imgui.TextColored(imgui.ImVec4(1, 0.51, 0, 1), u8("\xC4\xEB\xFF \xE1\xEE\xEB\xFC\xF8\xE5\xE9 \xED\xE0\xE4\xE5\xE6\xED\xEE\xF1\xF2\xE8 \xE8 \xE1\xE5\xE7\xEE\xEF\xE0\xF1\xED\xEE\xF1\xF2\xE8, \xEF\xF0\xE8\xE4\xF3\xEC\xE0\xE9\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC, \xEE\xF2\xEB\xE8\xF7\xE8\xEC\xFB\xE9\n\xEE\xF2 \xEF\xE0\xF0\xEE\xEB\xFF \xE2\xE0\xF8\xE5\xE3\xEE \xE8\xE3\xF0\xEE\xE2\xEE\xE3\xEE \xE8 \xF4\xEE\xF0\xF3\xEC\xED\xEE\xE3\xEE \xE0\xEA\xEA\xE0\xF3\xED\xF2\xEE\xE2."))
				imgui.InputText(u8("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xE0\xF0\xEE\xEB\xFC"), passBuffer)
				imgui.NewLine()
				imgui.Text(u8("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xC2\xE0\xF8 \xEF\xEE\xF7\xF2\xEE\xE2\xFB\xE9 \xFF\xF9\xE8\xEA. \xCE\xED \xE1\xF3\xE4\xE5\xF2 \xED\xE5\xEE\xE1\xF5\xEE\xE4\xE8\xEC \xE2 \xF1\xEB\xF3\xF7\xE0\xE5, \xE5\xF1\xEB\xE8 \xEF\xEE\xF2\xF0\xE5\xE1\xF3\xE5\xF2\xF1\xFF \xE2\xEE\xF1\xF1\xF2\xE0\xED\xEE\xE2\xE8\xF2\xFC\n\xEF\xE0\xF0\xEE\xEB\xFC \xEE\xF2 \xE2\xE0\xF8\xE5\xE3\xEE \xE0\xEA\xEA\xE0\xF3\xED\xF2\xE0 \xE2 \xF1\xE8\xF1\xF2\xE5\xEC\xE5."))
				imgui.InputText(u8("\xC2\xE2\xE5\xE4\xE8\xF2\xE5 \xEF\xEE\xF7\xF2\xEE\xE2\xFB\xE9 \xFF\xF9\xE8\xEA"), emailBuffer)
				imgui.Separator()
				imgui.NewLine()

				if imgui.Button(u8("\xD0\xE5\xE3\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xFF"), imgui.ImVec2(100, 22)) then
					if passBuffer.v ~= "" and emailBuffer.v ~= "" then
						local var_102_146, var_102_147 = sampGetPlayerIdByCharHandle(PLAYER_PED)
						local var_102_148 = sampGetPlayerNickname(var_102_147)
						local var_102_149 = tostring(var_102_148)
						local var_102_150 = aesEncrypt(webpass, var_102_149)

						username = getHmac(var_102_150) .. var_102_150

						local var_102_151 = aesEncrypt(webpass, passBuffer.v)
						local var_102_152 = getHmac(var_102_151) .. var_102_151
						local var_102_153 = aesEncrypt(webpass, emailBuffer.v)
						local var_102_154 = getHmac(var_102_153) .. var_102_153
						local var_102_155 = sampGetCurrentServerName()
						local var_102_156 = aesEncrypt(webpass, var_102_155)
						local var_102_157 = getHmac(var_102_156) .. var_102_156
						local var_102_158 = {
							data = "action=reg&username=" .. username .. "&pass=" .. var_102_152 .. "&email=" .. var_102_154 .. "&server=" .. var_102_157,
							headers = {
								["content-type"] = "application/x-www-form-urlencoded"
							}
						}

						download("POST", thisScript().url .. "/auth.php", var_102_158)

						register_window.v = not register_window.v
					else
						message("\xC2\xE2\xE5\xE4\xE5\xED\xFB \xED\xE5 \xE2\xF1\xE5 \xE4\xE0\xED\xED\xFB\xE5!")
					end
				end
			else
				imgui.Text(u8("\xC2\xFB \xF3\xF1\xEF\xE5\xF8\xED\xEE \xE7\xE0\xF0\xE5\xE3\xE8\xF1\xF2\xF0\xE8\xF0\xEE\xE2\xE0\xEB\xE8\xF1\xFC \xE2 \xF1\xE8\xF1\xF2\xE5\xEC\xE5!"))
				imgui.Text(u8("\xCF\xEE\xE4\xF0\xEE\xE1\xED\xE5\xE5: ") .. thisScript().url)
				sampUnregisterChatCommand("register")
			end

			imgui.End()
		end

		if reg_window.v then
			imgui.ShowCursor = true

			lockPlayerControl(true)

			local var_102_159, var_102_160 = getScreenResolution()

			imgui.SetNextWindowPos(imgui.ImVec2(var_102_159 / 2, var_102_160 / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(330, 290), imgui.Cond.FirstUseEver)
			imgui.Begin(u8("\xD0\xE5\xE3\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xEE\xED\xED\xFB\xE5 \xE4\xE0\xED\xED\xFB\xE5 \xE8\xE3\xF0\xEE\xEA\xE0"), reg_window, imgui.WindowFlags.AlwaysAutoResize)
			imgui.Columns(2, "regcolumns1")
			imgui.Separator()
			imgui.Text(u8("\xCD\xE8\xEA \xE8\xE3\xF0\xEE\xEA\xE0:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(reg_nickname .. "[" .. reg_player_id .. "]")
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xC4\xE0\xF2\xE0 \xF0\xE5\xE3\xE8\xF1\xF2\xF0\xE0\xF6\xE8\xE8:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(reg_date)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xD3\xF0\xEE\xE2\xE5\xED\xFC:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(reg_lvl)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xC4\xEE\xED\xE0\xF2:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(reg_donat)
			imgui.NextColumn()
			imgui.Columns(1)
			imgui.Separator()
			imgui.NewLine()
			imgui.Columns(2, "regcolumns2")
			imgui.Separator()
			imgui.Text(u8("\xD0\xE5\xE3\xE8\xF1. IP:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(obj_regIP.query)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xD1\xF2\xF0\xE0\xED\xE0:"))
			imgui.NextColumn()
			imgui.Text(obj_regIP.country)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xCE\xE1\xEB\xE0\xF1\xF2\xFC:"))
			imgui.NextColumn()
			imgui.Text(obj_regIP.regionName)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xC3\xEE\xF0\xEE\xE4:"))
			imgui.NextColumn()
			imgui.Text(obj_regIP.city)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xCF\xF0\xEE\xE2\xE0\xE9\xE4\xE5\xF0:"))
			imgui.NextColumn()
			imgui.Text(obj_regIP.org)
			imgui.NextColumn()
			imgui.Columns(1)
			imgui.Separator()
			imgui.Text(u8("                                                                                       "))
			imgui.Columns(2, "regcolumns3")
			imgui.Separator()
			imgui.Text(u8("\xCF\xEE\xF1\xEB\xE5\xE4\xED\xE8\xE9 IP:"))
			imgui.SetColumnWidth(-1, 125)
			imgui.NextColumn()
			imgui.Text(obj_lastIP.query)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xD1\xF2\xF0\xE0\xED\xE0:"))
			imgui.NextColumn()
			imgui.Text(obj_lastIP.country)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xCE\xE1\xEB\xE0\xF1\xF2\xFC:"))
			imgui.NextColumn()
			imgui.Text(obj_lastIP.regionName)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xC3\xEE\xF0\xEE\xE4:"))
			imgui.NextColumn()
			imgui.Text(obj_lastIP.city)
			imgui.NextColumn()
			imgui.Separator()
			imgui.Text(u8("\xCF\xF0\xEE\xE2\xE0\xE9\xE4\xE5\xF0:"))
			imgui.NextColumn()
			imgui.Text(obj_lastIP.org)
			imgui.NextColumn()
			imgui.Columns(1)
			imgui.Separator()

			if obj_regIP.city ~= obj_lastIP.city and dist_obj then
				imgui.NewLine()
				imgui.Columns(2, "regcolumns4")
				imgui.Separator()
				imgui.Text(u8("\xD0\xE0\xF1\xF1\xF2\xEE\xFF\xED\xE8\xE5:"))
				imgui.SetColumnWidth(-1, 125)
				imgui.NextColumn()

				if dist_obj.rows[1].elements[1].status ~= "ZERO_RESULTS" and dist_obj.rows[1].elements[1].status ~= "NOT_FOUND" then
					imgui.Text(dist_obj.rows[1].elements[1].distance.text)
				else
					imgui.Text(dist_obj.rows[1].elements[1].status)
				end

				imgui.NextColumn()
				imgui.Separator()
				imgui.Text(u8("\xC4\xEB. \xEF\xEE\xE5\xE7\xE4\xEA\xE8:"))
				imgui.SetColumnWidth(-1, 125)
				imgui.NextColumn()

				if dist_obj.rows[1].elements[1].status ~= "ZERO_RESULTS" and dist_obj.rows[1].elements[1].status ~= "NOT_FOUND" then
					imgui.Text(dist_obj.rows[1].elements[1].duration.text)
				else
					imgui.Text(dist_obj.rows[1].elements[1].status)
				end

				imgui.NextColumn()
				imgui.Columns(1)
				imgui.Separator()
			end

			imgui.End()
		end
	end

	if sp_player_id and fast_commands_dialog_status and sampIsPlayerConnected(sp_player_id) and show_ping_chart then
		local var_102_161, var_102_162 = convertGameScreenCoordsToWindowScreenCoords(ping_chart_x_pos, ping_chart_y_pos)

		imgui.SetNextWindowPos(imgui.ImVec2(var_102_161, var_102_162), imgui.Cond.Always, imgui.ImVec2(1, 1))
		draw_ping_chart(sp_player_id)
	end
end

function apply_custom_style()
	imgui.SwitchContext()

	local var_103_0 = imgui.GetStyle()
	local var_103_1 = var_103_0.Colors
	local var_103_2 = imgui.Col
	local var_103_3 = imgui.ImVec4

	var_103_0.WindowRounding = 2
	var_103_0.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	var_103_0.ChildWindowRounding = 2
	var_103_0.FrameRounding = 2
	var_103_0.ItemSpacing = imgui.ImVec2(5, 4)
	var_103_0.ScrollbarSize = 13
	var_103_0.ScrollbarRounding = 0
	var_103_0.GrabMinSize = 8
	var_103_0.GrabRounding = 1
	var_103_1[var_103_2.Text] = var_103_3(1, 1, 1, 1)
	var_103_1[var_103_2.TextDisabled] = var_103_3(0.5, 0.5, 0.5, 1)
	var_103_1[var_103_2.WindowBg] = var_103_3(0.06, 0.06, 0.06, 0.98)
	var_103_1[var_103_2.ChildWindowBg] = var_103_3(1, 1, 1, 0)
	var_103_1[var_103_2.PopupBg] = var_103_3(0.08, 0.08, 0.08, 0.94)
	var_103_1[var_103_2.ComboBg] = var_103_1[var_103_2.PopupBg]
	var_103_1[var_103_2.Border] = var_103_3(0.43, 0.43, 0.5, 0.5)
	var_103_1[var_103_2.BorderShadow] = var_103_3(0, 0, 0, 0)
	var_103_1[var_103_2.FrameBg] = var_103_3(0.16, 0.29, 0.48, 0.54)
	var_103_1[var_103_2.FrameBgHovered] = var_103_3(0.26, 0.59, 0.98, 0.4)
	var_103_1[var_103_2.FrameBgActive] = var_103_3(0.26, 0.59, 0.98, 0.67)
	var_103_1[var_103_2.TitleBg] = var_103_3(0.04, 0.04, 0.04, 1)
	var_103_1[var_103_2.TitleBgActive] = var_103_3(0.16, 0.29, 0.48, 1)
	var_103_1[var_103_2.TitleBgCollapsed] = var_103_3(0, 0, 0, 0.51)
	var_103_1[var_103_2.MenuBarBg] = var_103_3(0.14, 0.14, 0.14, 1)
	var_103_1[var_103_2.ScrollbarBg] = var_103_3(0.02, 0.02, 0.02, 0.53)
	var_103_1[var_103_2.ScrollbarGrab] = var_103_3(0.31, 0.31, 0.31, 1)
	var_103_1[var_103_2.ScrollbarGrabHovered] = var_103_3(0.41, 0.41, 0.41, 1)
	var_103_1[var_103_2.ScrollbarGrabActive] = var_103_3(0.51, 0.51, 0.51, 1)
	var_103_1[var_103_2.CheckMark] = var_103_3(0.26, 0.59, 0.98, 1)
	var_103_1[var_103_2.SliderGrab] = var_103_3(0.24, 0.52, 0.88, 1)
	var_103_1[var_103_2.SliderGrabActive] = var_103_3(0.26, 0.59, 0.98, 1)
	var_103_1[var_103_2.Button] = var_103_3(0.26, 0.59, 0.98, 0.4)
	var_103_1[var_103_2.ButtonHovered] = var_103_3(0.26, 0.59, 0.98, 1)
	var_103_1[var_103_2.ButtonActive] = var_103_3(0.06, 0.53, 0.98, 1)
	var_103_1[var_103_2.Header] = var_103_3(0.26, 0.59, 0.98, 0.31)
	var_103_1[var_103_2.HeaderHovered] = var_103_3(0.26, 0.59, 0.98, 0.8)
	var_103_1[var_103_2.HeaderActive] = var_103_3(0.26, 0.59, 0.98, 1)
	var_103_1[var_103_2.Separator] = var_103_1[var_103_2.Border]
	var_103_1[var_103_2.SeparatorHovered] = var_103_3(0.26, 0.59, 0.98, 0.78)
	var_103_1[var_103_2.SeparatorActive] = var_103_3(0.26, 0.59, 0.98, 1)
	var_103_1[var_103_2.ResizeGrip] = var_103_3(0.26, 0.59, 0.98, 0.25)
	var_103_1[var_103_2.ResizeGripHovered] = var_103_3(0.26, 0.59, 0.98, 0.67)
	var_103_1[var_103_2.ResizeGripActive] = var_103_3(0.26, 0.59, 0.98, 0.95)
	var_103_1[var_103_2.CloseButton] = var_103_3(0.41, 0.41, 0.41, 0.5)
	var_103_1[var_103_2.CloseButtonHovered] = var_103_3(0.98, 0.39, 0.36, 1)
	var_103_1[var_103_2.CloseButtonActive] = var_103_3(0.98, 0.39, 0.36, 1)
	var_103_1[var_103_2.PlotLines] = var_103_3(0.61, 0.61, 0.61, 1)
	var_103_1[var_103_2.PlotLinesHovered] = var_103_3(1, 0.43, 0.35, 1)
	var_103_1[var_103_2.PlotHistogram] = var_103_3(0.9, 0.7, 0, 1)
	var_103_1[var_103_2.PlotHistogramHovered] = var_103_3(1, 0.6, 0, 1)
	var_103_1[var_103_2.TextSelectedBg] = var_103_3(0.26, 0.59, 0.98, 0.35)
	var_103_1[var_103_2.ModalWindowDarkening] = var_103_3(0.8, 0.8, 0.8, 0.35)
end

function show_help(arg_104_0, arg_104_1)
	imgui.TextColored(imgui.ImVec4(1, 1, 0, 1), u8(arg_104_0))
	imgui.NextColumn()
	imgui.Text(u8(arg_104_1))
	imgui.NextColumn()
end

function event_msg_thread(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4)
	mp_processing = true

	for iter_105_0, iter_105_1 in ipairs(eventsMass2) do
		sampSendChat("/msg 0 " .. iter_105_1)
		wait(2000)
	end

	mp_processing = false
end

function ShowHelpMarker(arg_106_0)
	imgui.TextDisabled("(?)")

	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(arg_106_0)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function setKeyThread(arg_107_0)
	wait(0)

	setKeyButtonLock = true

	message("\xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xED\xE0 \xEA\xEB\xE0\xE2\xE8\xF8\xF3 \xE4\xEB\xFF \xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE8\xFF.")

	repeat
		wait(0)

		for iter_107_0 = 0, 222 do
			if isKeyJustPressed(iter_107_0) then
				key1 = iter_107_0

				break
			end
		end
	until isKeyJustPressed(key1)

	key1 = var_0_47[string.format("k0x%X", key1)]

	if arg_107_0 == 2 then
		message("\xCD\xE0\xE6\xEC\xE8\xF2\xE5 \xED\xE0 \xE2\xF2\xEE\xF0\xF3\xFE \xEA\xEB\xE0\xE2\xE8\xF8\xF3 \xE4\xEB\xFF \xED\xE0\xE7\xED\xE0\xF7\xE5\xED\xE8\xFF.")
		wait(200)

		repeat
			wait(0)

			for iter_107_1 = 0, 222 do
				if isKeyJustPressed(iter_107_1) then
					key2 = iter_107_1

					break
				end
			end
		until isKeyJustPressed(key2)

		key2 = var_0_47[string.format("k0x%X", key2)]
	else
		key2 = 0
	end

	local var_107_0 = var_0_0.load(data, "moonloader\\config\\AdminTools\\config.ini")

	if key_selected == 1 then
		var_107_0.menus.main_menu_key = key1
		main_menu_key = key1
	elseif key_selected == 2 then
		var_107_0.reconnect.reconnect_on_key1 = key1
		var_107_0.reconnect.reconnect_on_key2 = key2
		reconnect_on_key1 = key1
		reconnect_on_key2 = key2
	elseif key_selected == 3 then
		var_107_0.cheats.wh_on_key1 = key1
		var_107_0.cheats.wh_on_key2 = key2
		wh_on_key1 = key1
		wh_on_key2 = key2
	elseif key_selected == 4 then
		var_107_0.cheats.gm_on_key1 = key1
		var_107_0.cheats.gm_on_key2 = key2
		gm_on_key1 = key1
		gm_on_key2 = key2
	elseif key_selected == 5 then
		var_107_0.cheats.ab_on_key1 = key1
		var_107_0.cheats.ab_on_key2 = key2
		ab_on_key1 = key1
		ab_on_key2 = key2
	elseif key_selected == 6 then
		var_107_0.admin_chat_commands.confirm_key = key1
		admin_chat_confirm_key = key1
	elseif key_selected == 7 then
		var_107_0.admin_chat_commands.cancel_key = key1
		admin_chat_cancel_key = key1
	elseif key_selected == 8 then
		var_107_0.menus.fast_command_menu_key = key1
		fast_command_menu_key = key1
	elseif key_selected == 9 then
		var_107_0.player_info_panel.prev_id_key = key1
		sp_prev_id_key = key1
	elseif key_selected == 10 then
		var_107_0.player_info_panel.next_id_key = key1
		sp_next_id_key = key1
	end

	var_0_0.save(var_107_0, "AdminTools\\config.ini")

	setKeyButtonLock = false
end

function getpunishments()
	if pl_processing == false and pl_processing_auto_mode == false then
		local var_108_0 = io.open("moonloader\\AdminTools\\punishment_list.txt", "r")

		pl_command = {}
		pl_nickname = {}
		pl_term = {}
		pl_reason = {}
		pl_full_command = {}
		pl_ids = {}

		repeat
			local var_108_1 = var_108_0:read()

			if var_108_1 ~= nil and string.len(var_108_1) > 1 then
				table.insert(pl_full_command, var_108_1)

				plCommand, plNickname, plTerm, plReason = string.match(var_108_1, "(%D+)%s+(%S+)%s+(%d+)%s+(.+)")

				if plCommand == "/jail" or plCommand == "/mute" or plCommand == "/ban" and plNickname ~= nil and plTerm ~= nil and plReason ~= nil then
					table.insert(pl_command, plCommand)
					table.insert(pl_nickname, plNickname)
					table.insert(pl_term, plTerm)
					table.insert(pl_reason, plReason)
				else
					plCommand, plNickname, plReason = string.match(var_108_1, "(%S+)%s+(%S+)%s+(.+)")

					if plCommand == "/warn" and plNickname ~= nil and plReason ~= nil then
						table.insert(pl_command, plCommand)
						table.insert(pl_nickname, plNickname)
						table.insert(pl_term, 1)
						table.insert(pl_reason, plReason)
					else
						plCommand, plNickname = string.match(var_108_1, "(%D+)%s+(%S+)")

						if plCommand == "/unwarn" or plCommand == "/unjail" or plCommand == "/unmute" and plNickname ~= nil then
							table.insert(pl_command, plCommand)
							table.insert(pl_nickname, plNickname)
							table.insert(pl_term, "---")
							table.insert(pl_reason, "\t---")
						else
							table.insert(pl_command, -1)
							table.insert(pl_nickname, "\xCE\xF8\xE8\xE1\xEA\xE0: \xED\xE5\xEF\xEE\xE4\xE4\xE5\xF0\xE6\xE8\xE2\xE0\xE5\xEC\xFB\xE9 \xF4\xEE\xF0\xEC\xE0\xF2 \xEA\xEE\xEC\xE0\xED\xE4\xFB.")
							table.insert(pl_term, "---")
							table.insert(pl_reason, "-1")
						end
					end
				end

				if plNickname then
					pl_player_online = false
					max_id = sampGetMaxPlayerId(false)

					for iter_108_0 = 0, max_id do
						if sampIsPlayerConnected(iter_108_0) then
							local var_108_2 = sampGetPlayerNickname(iter_108_0)

							if string.lower(var_108_2) == string.lower(plNickname) then
								pl_player_online = true

								table.insert(pl_ids, iter_108_0)

								break
							end
						end
					end

					if pl_player_online ~= true then
						table.insert(pl_ids, "  ---")
					end
				end
			end
		until var_108_1 == nil

		io.close(var_108_0)
	end
end

function pl_thread()
	pl_processing = true
	pl_del = {}

	for iter_109_0, iter_109_1 in ipairs(pl_ids) do
		plCommand = pl_command[iter_109_0]
		plTerm = pl_term[iter_109_0]
		plReason = pl_reason[iter_109_0]
		plNickname = pl_nickname[iter_109_0]
		pl_mass_number = iter_109_0

		if iter_109_1 ~= "  ---" then
			if sampIsPlayerConnected(iter_109_1) then
				local var_109_0 = sampGetPlayerNickname(iter_109_1)
				local var_109_1 = string.lower(var_109_0)
				local var_109_2 = string.lower(plNickname)
				local var_109_3 = sampGetPlayerScore(iter_109_1)

				if var_109_1 == var_109_2 then
					if var_109_3 > 0 then
						if plCommand == "/warn" then
							plCheckServerAnswer = true

							sampSendChat(string.format("%s %s %s", plCommand, iter_109_1, plReason))
						end

						if plCommand == "/jail" or plCommand == "/mute" or plCommand == "/ban" then
							plCheckServerAnswer = true

							sampSendChat(string.format("%s %s %s %s", plCommand, iter_109_1, plTerm, plReason))
						end

						if plCommand == "/unwarn" and admin_lvl >= 4 then
							plCheckServerAnswer = true

							sampSendChat(string.format("%s %s", plCommand, iter_109_1))
						end

						if plCommand == "/unjail" or plCommand == "/unmute" then
							plCheckServerAnswer = true

							sampSendChat(string.format("%s %s", plCommand, iter_109_1))
						end
					else
						text = string.format("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9: %s[%d] \xE5\xF9\xE5 \xED\xE5 \xE0\xE2\xF2\xEE\xF0\xE8\xE7\xEE\xE2\xE0\xEB\xF1\xFF.", plNickname, iter_109_1)

						message(text)
					end
				else
					text = string.format("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9: %s[%d] \xE2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB.", plNickname, iter_109_1)

					message(text)
				end
			else
				text = string.format("\xD2\xE0\xE1\xEB\xE8\xF6\xE0 \xED\xE0\xEA\xE0\xE7\xE0\xED\xE8\xE9: %s[%d] \xE2\xFB\xF8\xE5\xEB \xE8\xE7 \xE8\xE3\xF0\xFB.", plNickname, iter_109_1)

				message(text)
			end
		elseif plCommand == "/warn" and admin_lvl >= 4 then
			plCheckServerAnswer = true

			sampSendChat(string.format("/offwarn %s %s", plNickname, plReason))
		elseif plCommand == "/ban" and admin_lvl >= 4 then
			plCheckServerAnswer = true

			sampSendChat(string.format("/offban %s %s %s", plNickname, plTerm, plReason))
		elseif plCommand == "/jail" and admin_lvl >= 2 then
			plCheckServerAnswer = true

			sampSendChat(string.format("/offjail %s %s %s", plNickname, plTerm, plReason))
		elseif plCommand == "/mute" and admin_lvl >= 2 then
			plCheckServerAnswer = true

			sampSendChat(string.format("/offmute %s %s %s", plNickname, plTerm, plReason))
		end

		if plCheckServerAnswer == true then
			local var_109_4 = 20
			local var_109_5 = os.time()

			repeat
				wait(0)

				if plCheckServerAnswer == false then
					break
				end
			until os.time() > var_109_5 + var_109_4

			if plCheckServerAnswer == true then
				message("\xC2\xF0\xE5\xEC\xFF \xEE\xE6\xE8\xE4\xE0\xED\xE8\xFF \xEE\xF2\xE2\xE5\xF2\xE0 \xE8\xF1\xF2\xE5\xEA\xEB\xEE.")
			end

			plCheckServerAnswer = false

			wait(10000)
		end
	end

	local var_109_6 = io.open("moonloader\\AdminTools\\punishment_list.txt", "w")

	for iter_109_2, iter_109_3 in ipairs(pl_full_command) do
		if iter_109_3 ~= "" then
			var_109_6:write(iter_109_3 .. "\n")
		end
	end

	io.close(var_109_6)
	message("\xCE\xEF\xE5\xF0\xE0\xF6\xE8\xFF \xE7\xE0\xE2\xE5\xF0\xF8\xE5\xED\xE0.")

	pl_processing = false

	getpunishments()
end

function update_player_ping(arg_110_0)
	if ping_list[1] then
		local var_110_0 = ping_list[1]

		if os.clock() > var_110_0.update_tick + 0.3 then
			if arg_110_0 > var_110_0.max then
				var_110_0.max = arg_110_0
			end

			table.insert(var_110_0.chart, arg_110_0)

			if #var_110_0.chart > 150 then
				table.remove(var_110_0.chart, 1)
			end

			var_110_0.update_tick = os.clock()
		end

		return var_110_0
	else
		local var_110_1 = {
			chart = {
				arg_110_0
			},
			max = arg_110_0,
			update_tick = os.clock()
		}

		ping_list[1] = var_110_1

		return var_110_1
	end
end

function im_colored_text_with_shadow(arg_111_0, arg_111_1)
	local var_111_0 = imgui.GetCursorPos()

	imgui.SetCursorPos(imgui.ImVec2(var_111_0.x + 1, var_111_0.y + 1))
	imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), arg_111_1)
	imgui.SetCursorPos(var_111_0)
	imgui.TextColored(arg_111_0, arg_111_1)
end

function draw_ping_chart(arg_112_0)
	imgui.GetStyle().WindowRounding = 5

	local var_112_0 = imgui.GetStyle().Colors
	local var_112_1 = imgui.Col
	local var_112_2 = imgui.ImVec4

	var_112_0[var_112_1.FrameBg] = var_112_2(0.12, 0.12, 0.12, 0.94)
	var_112_0[var_112_1.PlotLines] = var_112_2(0.61, 0.61, 0.61, 1)

	local var_112_3 = sampGetPlayerPing(arg_112_0)
	local var_112_4 = imgui.WindowFlags

	imgui.SetMouseCursor(imgui.MouseCursor.None)
	imgui.Begin("Ping Chart", nil, var_112_4.NoTitleBar + var_112_4.NoResize + var_112_4.AlwaysAutoResize + var_112_4.NoMove + var_112_4.NoSavedSettings + var_112_4.NoInputs)

	local var_112_5 = update_player_ping(var_112_3)

	imgui.PlotLines("##Ping", var_112_5.chart, 0, "ping: " .. var_112_3 .. " max: " .. var_112_5.max, 0, var_112_5.max * 2, imgui.ImVec2(200, 40))
	imgui.End()
end

function sampevonInitMenu()
	fast_commands_dialog_status = false
end

function sampevonShowMenu()
	fast_commands_dialog_status = true
end

function sampevonHideMenu()
	fast_commands_dialog_status = false
	fast_commands_dialog.v = false
end

function getevents()
	local var_116_0 = io.open("moonloader\\AdminTools\\events.json", "r")

	if var_116_0 then
		local var_116_1 = var_116_0:read("*a")

		io.close(var_116_0)

		eventsMass = decodeJson(var_116_1)
		eventsNameMass = {}

		for iter_116_0, iter_116_1 in pairs(eventsMass.events) do
			table.insert(eventsNameMass, u8(eventsMass.events[iter_116_0].name))
		end
	end
end

function async_http_request(arg_117_0, arg_117_1, arg_117_2, arg_117_3, arg_117_4)
	local var_117_0 = lanes.gen("*", {
		package = {
			path = package.path,
			cpath = package.cpath
		}
	}, function()
		local var_118_0 = require("requests")
		local var_118_1, var_118_2 = pcall(var_118_0.request, arg_117_0, arg_117_1, arg_117_2)

		if var_118_1 then
			var_118_2.json, var_118_2.xml = nil

			return true, var_118_2
		else
			return false, var_118_2
		end
	end)

	arg_117_4 = arg_117_4 or function()
		return
	end

	lua_thread.create(function()
		local var_120_0 = var_117_0()

		while true do
			local var_120_1 = var_120_0.status

			if var_120_1 == "done" then
				local var_120_2 = var_120_0[1]
				local var_120_3 = var_120_0[2]

				if var_120_2 then
					arg_117_3(var_120_3)
				else
					arg_117_4(var_120_3)
				end

				return
			elseif var_120_1 == "error" then
				return arg_117_4(var_120_0[1])
			elseif var_120_1 == "killed" or var_120_1 == "cancelled" then
				return arg_117_4(var_120_1)
			end

			wait(0)
		end
	end)
end

function rk(arg_121_0)
	if arg_121_0 ~= "" then
		if sampIsPlayerConnected(arg_121_0) then
			local var_121_0 = sampGetPlayerNickname(arg_121_0)
			local var_121_1 = false

			for iter_121_0, iter_121_1 in ipairs(killedOnCapture) do
				if string.lower(var_121_0) == string.lower(iter_121_1) then
					var_121_1 = true

					message(var_121_0 .. " \xE1\xFB\xEB \xF3\xE1\xE8\xF2 \xF0\xE0\xED\xE5\xE5.")

					break
				end
			end

			if var_121_1 == false then
				message("\xC8\xE3\xF0\xEE\xEA \xED\xE5 \xED\xE0\xE9\xE4\xE5\xED \xE2 kill-\xEB\xE8\xF1\xF2\xE5.")
			end
		else
			message("\xC8\xE3\xF0\xEE\xEA\xE0 \xF1 \xF2\xE0\xEA\xE8\xEC ID \xED\xE0 \xF1\xE5\xF0\xE2\xE5\xF0\xE5 \xED\xE5\xF2.")
		end
	else
		message("\xC8\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF2\xE5 /rk [ID \xE8\xE3\xF0\xEE\xEA\xE0].")
	end
end

function aesEncrypt(arg_122_0, arg_122_1)
	local var_122_0 = ECBMode.Cipher()

	var_122_0.setKey(Stream.toArray(Stream.fromString(arg_122_0)))
	var_122_0.setBlockCipher(AES128Cipher)
	var_122_0.setPadding(ZeroPadding)
	var_122_0.init()
	var_122_0.update(Stream.fromString("passed" .. arg_122_1))
	var_122_0.finish()

	return string.lower(var_122_0.asHex())
end

function aesDecrypt(arg_123_0, arg_123_1)
	local var_123_0 = ECBMode.Decipher()

	var_123_0.setKey(Stream.toArray(Stream.fromString(arg_123_0)))
	var_123_0.setBlockCipher(AES128Cipher)
	var_123_0.setPadding(ZeroPadding)
	var_123_0.init()
	var_123_0.update(Stream.fromHex(arg_123_1))
	var_123_0.finish()

	arg_123_1 = string.char(table.unpack(var_123_0.asBytes()))

	if string.sub(arg_123_1, 1, 6) == "passed" then
		return string.sub(arg_123_1, 7)
	else
		return arg_123_1
	end
end

function getHmac(arg_124_0)
	local var_124_0 = require("lockbox.mac.hmac")()
	local var_124_1 = require("lockbox.digest.sha2_256")

	var_124_0.setBlockSize(64)
	var_124_0.setDigest(var_124_1)
	var_124_0.setKey(Stream.toArray(Stream.fromString(webpass)))
	var_124_0.init()
	var_124_0.update(Stream.fromString(arg_124_0))
	var_124_0.finish()

	return string.lower(var_124_0.asHex())
end

function getMD5(arg_125_0)
	local var_125_0 = require("lockbox.digest.md5")()

	var_125_0.update(Stream.fromString(arg_125_0))
	var_125_0.finish()

	return string.lower(var_125_0.asHex())
end

function strpad(arg_126_0, arg_126_1, arg_126_2, arg_126_3)
	local var_126_0 = arg_126_0

	arg_126_2 = arg_126_2 or "0"
	arg_126_3 = arg_126_3 or "STR_PAD_RIGHT"

	if arg_126_3 == "STR_PAD_BOTH" then
		local var_126_1 = 0

		while arg_126_1 > string.len(var_126_0) do
			var_126_0 = var_126_1 % 2 == 0 and var_126_0 .. arg_126_2 or arg_126_2 .. var_126_0
			var_126_1 = var_126_1 + 1
		end
	else
		while arg_126_1 > string.len(var_126_0) do
			var_126_0 = arg_126_3 == "STR_PAD_LEFT" and arg_126_2 .. var_126_0 or var_126_0 .. arg_126_2
		end
	end

	return var_126_0
end

function checkLen(arg_127_0)
	if string.len(arg_127_0) < 16 then
		return strpad(arg_127_0, 16)
	elseif string.len(arg_127_0) > 16 then
		return string.sub(arg_127_0, 1, 16)
	else
		return arg_127_0
	end
end
