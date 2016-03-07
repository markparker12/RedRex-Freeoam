//-------------------------------------------

// INCLUDES...

#include <a_samp> //SA-MP Team

#include <fixes> //Fixes Team

#include <foreach> //Y_Less
#include <sscanf2> //Y_Less


#include <streamer> //Incognito

#include <colors> //Gammix
#include <playerstates> //Gammix
#include <playerstats> //Gammix
#include <playercalls> //Gammix
#include <playerfuncs> //Gammix
#include <dialogs> //Gammix
#include <utils> //Gammix
#include <textdraws> //Gammix
#include <gangzones> //Gammix
#include <timeupdater> //Gammix
#include <vehicleplus> //Gammix
#include <attachments> //Gammix

#include <izcmd> //Zeex & Yashas

//-------------------------------------------

// MAIN PRINTING...

main()
{
	print("--------------------------------------");
	print("Running REDREX Freeroam | Developed by Gammix; | Loaded...");
	print("--------------------------------------");
}

//-------------------------------------------

// MACROS / DEFINATIONS...

#if !defined FLOAT_INFINITY
    #define FLOAT_INFINITY (Float:0x7F800000)
#endif

//RP Defines
#if defined MAX_PLAYERS
#undef MAX_PLAYERS
#define MAX_PLAYERS  30
#endif

new totalstring[1024];

//RP Color Defines
#define COLOR_WHITE 		0xFFFFFFAA
#define COLOR_PURPLE 		0xC2A2DAAA


//dms
#define MODE_FREEROAM       		0
#define MODE_DUEL             		1
#define MODE_MINIGUN              	2
#define MODE_MONEYBAG              	3
#define MODE_GLASS              	4
#define MODE_RPG                	5
#define MODE_BATTLEFIELD            6
#define MODE_JETFIGHT               7
#define MODE_ONESHOTKILL            8
//tdms
#define MODE_GANGWAR             	9
#define MODE_SNIPER     			10
#define MODE_JUNGLE         		11
//races
#define MODE_BEACH_FRONT       		12
#define MODE_MOUNT_CHILLAD     		13
#define MODE_FREE_WHEEL       		14
#define MODE_LS_RACE       			15
#define MODE_LV_RACE       			16
#define MODE_SF_RACE       			17
#define MODE_OIL_REFINARY      		18
//derbys
#define MODE_AIR_DERBY       		19
#define MODE_AIR_DERBY_2     		20
#define MODE_PARK_DERBY     		21

#define SPAWN_CUSTOM                -1
#define SPAWN_LOS_SANTOS    		0
#define SPAWN_LAS_VENTURAS  		1
#define SPAWN_SAN_FIERRO    		2
#define SPAWN_ARMY_BASES   			3
#define SPAWN_MEDICAL_DEPARTMENTS   4
#define SPAWN_POLICE_DEPARTMENTS    5

#define DIALOG_COMMON         		0
#define DIALOG_CITY         		1
#define DIALOG_WEAPONS         		2
#define DIALOG_VEHICLES             10
#define DIALOG_SKINS                11
#define DIALOG_DUEL_WEAPON  		12
#define DIALOG_DUEL   				13
#define DIALOG_OTHERS               15
#define DIALOG_HOTSPOTS             16
#define DIALOG_ROLLERCOASTERS       17
#define DIALOG_DRIFTS       		18
#define DIALOG_STUNTS               19
#define DIALOG_JUMPS                20
#define DIALOG_GARAGES              21
#define DIALOG_BASEJUMPS            22
#define DIALOG_DEATHMATCH          	23
#define DIALOG_TEAMS                24
#define DIALOG_TEAM_DEATHMATCH      25
#define DIALOG_TIME         		26
#define DIALOG_WEATHER      		27
#define DIALOG_PLAYER_COLORS        28
#define DIALOG_NEONS                29
#define DIALOG_RACES                30
#define DIALOG_DERBYS               31
#define DIALOG_DERBY_VEHICLES       32
#define DIALOG_TELEPORTS            33

#define DIALOG_ATTACH_INDEX_SELECTION   100
#define DIALOG_ATTACH_MODIFY   			101
#define DIALOG_ATTACH_OBJECT_SELECTION	102
#define DIALOG_ATTACH_OBJECTS_LIST		103
#define DIALOG_ATTACH_CUSTOM_OBJECT		104
#define DIALOG_ATTACH_BONE_SELECTION	105

#define WORLD_DRIFT                 15
#define WORLD_ROLLERCOASTER        	50

//-------------------------------------------

// VARIABLES & ARRAYS...

enum UserEnum
{
	U_MODE,
	
	U_COLOR,
	U_SKIN,
	
	U_SPAWN,
	Float:U_POS[4],
	U_WEAPONS[5],
	
	bool:U_GOD,
	
	U_DUEL_OPPONENT,
	U_DUEL_WEAPON,
	U_DUEL_BET,
	
	U_VEHICLE,
	
	U_LISTITEM,
	
	PlayerText:U_LABEL_TD[7],
	PlayerText:U_MODEL_TD[7],
	
	U_MODE_MENU,
	U_LAST_TICK,

	U_TEAM,
	
	PlayerText:U_MODE_TD,
	
	U_ROCKET_OBJECT,
	U_ROCKET_TIMER,
	
	bool:U_GOTO,
	
	U_NEON[22],

	U_RACE_CP,
	U_RACE_POSITION,
	
	bool:U_MEGA_JUMP,
	
	PlayerText:U_VEHICLE_BONUS_TD,
	U_VEHICLE_BONUS_INTERVAL
};
new gUser[MAX_PLAYERS][UserEnum];

enum ServerEnum
{
	S_MONEYBAG_PLAYER,
	S_MONEYBAG_PICKUP,
	
	Text:S_NOTIFY_TD[3],
	S_NOTIFY_TIMER[3],
	
	Text:S_BALL_TD[7],
	Text:S_BACKGROUND_TD,
	
	S_TURF_ATTACKER,
	S_TURF_OWNER,
	S_TURF,
	S_TURF_TIME,

	Text:S_HELP_TD
};
new gServer[ServerEnum];

new gAttachmentObjectsList[] =
{
	18632,
	18633,
	18634,
	18635,
	18636,
	18637,
	18638,
	18639,
	18640,
	18975,
	19136,
	19274,
	18641,
	18642,
	18643,
	18644,
	18645,
	18865,
	18866,
	18867,
	18868,
	18869,
	18870,
	18871,
	18872,
	18873,
	18874,
	18875,
	18890,
	18891,
	18892,
	18893,
	18894,
	18895,
	18896,
	18897,
	18898,
	18899,
	18900,
	18901,
	18902,
	18903,
	18904,
	18905,
	18906,
	18907,
	18908,
	18909,
	18910,
	18911,
	18912,
	18913,
	18914,
	18915,
	18916,
	18917,
	18918,
	18919,
	18920,
	18921,
	18922,
	18923,
	18924,
	18925,
	18926,
	18927,
	18928,
	18929,
	18930,
	18931,
	18932,
	18933,
	18934,
	18935,
	18936,
	18937,
	18938,
	18939,
	18940,
	18941,
	18942,
	18943,
	18944,
	18945,
	18946,
	18947,
	18948,
	18949,
	18950,
	18951,
	18952,
	18953,
	18954,
	18955,
	18956,
	18957,
	18958,
	18959,
	18960,
	18961,
	18962,
	18963,
	18964,
	18965,
	18966,
	18967,
	18968,
	18969,
	18970,
	18971,
	18972,
	18973,
	18974,
	18976,
	18977,
	18978,
	18979,
	19006,
	19007,
	19008,
	19009,
	19010,
	19011,
	19012,
	19013,
	19014,
	19015,
	19016,
	19017,
	19018,
	19019,
	19020,
	19021,
	19022,
	19023,
	19024,
	19025,
	19026,
	19027,
	19028,
	19029,
	19030,
	19031,
	19032,
	19033,
	19034,
	19035,
	19036,
	19037,
	19038,
	19039,
	19040,
	19041,
	19042,
	19043,
	19044,
	19045,
	19046,
	19047,
	19048,
	19049,
	19050,
	19051,
	19052,
	19053,
	19085,
	19086,
	19090,
	19091,
	19092,
	19093,
	19094,
	19095,
	19096,
	19097,
	19098,
	19099,
	19100,
	19101,
	19102,
	19103,
	19104,
	19105,
	19106,
	19107,
	19108,
	19109,
	19110,
	19111,
	19112,
	19113,
	19114,
	19115,
	19116,
	19117,
	19118,
	19119,
	19120,
	19137,
	19138,
	19139,
	19140,
	19141,
	19142,
	19160,
	19161,
	19162,
	19163,
	19317,
	19318,
	19319,
	19330,
	19331,
	19346,
	19347,
	19348,
	19349,
	19350,
	19351,
	19352,
	19487,
	19488,
	19513,
	19515,
	331,
	333,
	334,
	335,
	336,
	337,
	338,
	339,
	341,
	321,
	322,
	323,
	324,
	325,
	326,
	343,
	346,
	347,
	348,
	349,
	350,
	351,
	352,
	353,
	355,
	356,
	372,
	357,
	358,
	361,
	363,
	364,
	365,
	366,
	367,
	368,
	369,
	371
};

new gAttachmentBones[][24] =
{
	{"Spine"},
	{"Head"},
	{"Left upper arm"},
	{"Right upper arm"},
	{"Left hand"},
	{"Right hand"},
	{"Left thigh"},
	{"Right thigh"},
	{"Left foot"},
	{"Right foot"},
	{"Right calf"},
	{"Left calf"},
	{"Left forearm"},
	{"Right forearm"},
	{"Left clavicle"},
	{"Right clavicle"},
	{"Neck"},
	{"Jaw"}
};

new gIndex[MAX_PLAYERS];
new gObject[MAX_PLAYERS];

//RACE: beach front
new Float:gRace_BeachFront_Checkpoints[][3] =
{
	{370.3983, -1758.0093, 13.5985},
	{297.9694, -1639.1511, 32.9250},
	{403.8886, -1402.3876, 33.2149},
	{679.2260, -1319.5569, 13.2999},
	{797.3391, -1335.9146, 13.1551},
	{751.6486, -1608.3232, 12.7072},
	{715.5649, -1756.8311, 14.2363},
	{255.0722, -1685.9547, 8.9021},
	{175.0049, -1524.9076, 12.2229},
	{627.7590, -1227.5138, 17.8432},
	{612.2310, -1586.9414, 15.7806},
	{502.7237, -1559.6768, 16.4948},
	{483.8761, -1431.2250, 17.2911},
	{354.4469, -1524.6852, 32.8941},
	{369.7531, -1680.2906, 31.7380},
	{369.9450, -2014.2040, 7.4441}
};
new Float:gRace_BeachFront_Spawns[][4] =
{
    {367.635742, -1895.733032, 7.296423, 358.086853},
	{372.146301, -1902.968383, 7.296277, 358.086853}
};

//RACE: Mount Chillad
new Float:gRace_MountChillad_Checkpoints[][3] =
{
	{-2258.9558, -2138.3254, 59.1289},
	{-2106.1719, -1889.7426, 110.7564},
	{-2309.3599, -2092.0952, 116.3241},
	{-2490.8677, -2076.3223, 125.3655},
	{-2752.5200, -1867.4569, 141.8304},
	{-2752.5125, -1403.5259, 141.8438},
	{-2537.0415, -1134.9249, 178.6407},
	{-2615.8569, -1363.0410, 263.7339},
	{-2387.7915, -1337.8291, 329.1073},
	{-2543.6096, -1439.4381, 353.5214},
	{-2241.8389, -1467.0886, 355.9529},
	{-2228.9150, -1563.9242, 379.6657},
	{-2522.5291, -1599.6217, 398.3897},
	{-2484.6135, -1785.4862, 404.5562},
	{-2392.1157, -1793.9954, 431.9135},
	{-2313.1321, -1646.7006, 484.0601}
};
new Float:gRace_MountChillad_Spawns[][4] =
{
    {-2312.081054, -2166.188476, 40.272804, 292.483245},
	{-2314.081054, -2166.188476, 40.272804, 292.483245}
};

//RACE: Free Wheel
new Float:gRace_FreeWheel_Checkpoints[][3] =
{
	{-413.0344, -889.7043, 25.8435},
	{-337.3363, -785.6618, 31.7379},
	{-311.1908, -866.9036, 46.6402},
	{-538.2558, -912.4324, 56.4735},
	{-767.6442, -1004.3062, 77.9672},
	{-895.8164, -1111.3229, 98.6168},
	{-1224.3892, -765.2197, 63.6690},
	{-973.8251, -441.0424, 34.8714},
	{-486.8981, -402.6943, 14.4156},
	{-384.0918, -694.1434, 19.9672},
	{-361.5254, -796.3683, 29.1719},
	{-526.8291, -1027.2772, 24.2020}
};
new Float:gRace_FreeWheel_Spawns[][4] =
{
    {-518.304931, -1043.633911, 23.718908, 327.185241},
	{-516.905944, -1052.295776, 23.622091, 327.935882}
};

//RACE: LS Race
new Float:gRace_LSRace_Checkpoints[][3] =
{
	{2905.7305, -1335.2546, 10.5547},
	{2821.5581, -1141.8853, 15.8710},
	{2391.7834, -1154.3229, 28.2620},
	{2128.0623, -1083.0441, 23.8318},
	{1831.9017, -1030.3024, 36.1764},
	{1708.6503, -1094.7461, 56.0305},
	{1606.3248, -1715.6747, 27.8894},
	{1469.1903, -2124.5723, 13.2589},
	{1339.2551, -2457.6050, 13.2338},
	{1677.8434, -2675.8174, 5.7187},
	{2154.1982, -2621.6726, 13.2282},
	{2219.4734, -2346.1616, 13.2265},
	{2486.6650, -2162.4805, 13.3195},
	{2829.9673, -2007.4019, 10.7871},
	{2875.0083, -1591.7281, 10.5547}
};
new Float:gRace_LSRace_Spawns[][4] =
{
    {2875.934570, -1591.060424, 10.500221, 342.909027},
	{2879.042480, -1597.285644, 10.498308, 342.909027}
};

//RACE: LV Race
new Float:gRace_LVRace_Checkpoints[][3] =
{
	{1753.6545, 850.6560, 9.5190},
	{1568.6921, 833.5577, 6.3990},
	{1287.6051, 905.6605, 6.4374},
	{1226.4041, 1334.8127, 6.3621},
	{1209.0433, 1502.7931, 6.3621},
	{1263.7335, 1732.5851, 8.0399},
	{1401.9918, 1872.6542, 10.3007},
	{1707.2323, 1886.4031, 10.2967},
	{1728.4037, 2053.3477, 10.2970},
	{1956.9373, 2022.1593, 10.2968},
	{2176.9705, 2137.1475, 10.2968},
	{2349.7729, 2179.5166, 10.3058},
	{2287.6816, 2291.3613, 10.3413},
	{2271.7271, 2413.7090, 10.3006},
	{2189.2878, 2325.5537, 10.2968},
	{2074.8704, 1758.3037, 10.2968},
	{2047.5907, 1587.5190, 10.2968},
	{2061.5239, 1531.0094, 10.2968},
	{2047.8118, 1361.2373, 10.2968},
	{2046.0575, 861.8326, 6.3588}
};
new Float:gRace_LVRace_Spawns[][4] =
{
    {2139.273437, 849.366577, 6.365715, 90.414733},
	{2143.656250, 854.734680, 6.357902, 90.414733}
};

//RACE: SF Race
new Float:gRace_SFRace_Checkpoints[][3] =
{
	{-2908.6084, -1166.1984, 9.1680},
	{-2859.2830, -818.8527, 6.7187},
	{-2502.1252, -334.0524, 29.7034},
	{-2129.4766, -351.1667, 34.6964},
	{-2021.9302, -312.3736, 34.9638},
	{-2003.0897, -271.9948, 34.9981},
	{-1991.8639, -69.5321, 33.8623},
	{-1799.0338, -103.0793, 5.6857},
	{-1809.7943, 201.0103, 14.6408},
	{-1586.8282, 465.3767, 6.7110},
	{-1593.0995, 1054.3867, 6.8281},
	{-1858.0253, 1352.2291, 6.7905},
	{-2068.9509, 1277.8479, 8.9683},
	{-2261.1189, 1122.5388, 71.9575},
	{-2261.0310, 722.7672, 48.9766},
	{-2229.9541, 503.7214, 34.7030},
	{-2252.2991, 262.0502, 34.8437},
	{-2253.5896, 34.5404, 34.8516},
	{-2256.0115, -238.5709, 37.3031},
	{-2140.2639, -509.3277, 38.2051},
	{-1975.8826, -580.7640, 25.5114},
	{-1735.3674, -579.6141, 16.0156},
	{-1540.5515, -426.4935, 5.5341}
};
new Float:gRace_SFRace_Spawns[][4] =
{
    {-2935.178710, -1444.456054, 10.334497, 4.269320},
	{-2929.206787, -1449.649658, 10.334907, 1.128396}
};

//RACE: Oil Refinary
new Float:gRace_OilRefinary_Checkpoints[][3] =
{
	{584.4291, 855.8440, -43.2536},
	{496.7525, 913.1824, -31.3340},
	{547.6824, 957.7469, -20.2355},
	{706.6964, 967.6871, -9.6315},
	{802.9772, 841.9870, 8.6133},
	{905.2349, 908.0718, 13.0287},
	{866.1415, 1068.3171, 23.8571},
	{738.5264, 1148.6731, 21.8394},
	{521.9126, 1100.1238, 18.0406},
	{458.5009, 1042.9341, 28.2076},
	{345.6015, 1025.4336, 27.6782},
	{334.4910, 1178.7504, 8.0722},
	{324.3958, 1277.4586, 12.6929},
	{329.4374, 1342.3698, 8.6449},
	{372.7992, 1364.4037, 8.6780},
	{509.4473, 1367.6295, 4.9663},
	{618.8433, 1388.9633, 11.3670},
	{667.8107, 1454.9663, 8.8943},
	{746.0272, 1494.3818, 10.2132},
	{848.3810, 1560.4503, 17.6769},
	{903.3660, 1601.4480, 15.5604},
	{924.6001, 1652.9540, 8.3166},
	{921.0760, 1779.7043, 8.3180},
	{945.9962, 1902.7443, 10.4898},
	{934.9140, 1975.0913, 10.4898},
	{854.7449, 2008.0125, 10.4899},
	{774.5179, 1989.5057, 5.0082},
	{726.3444, 1881.3467, 5.2654},
	{604.2944, 1729.7988, 6.2958},
	{454.5284, 1621.1144, 16.4481},
	{443.0451, 1511.8204, 9.2578},
	{430.7408, 1367.3728, 7.9581},
	{455.3703, 1234.0518, 9.7796},
	{391.3040, 1118.8749, 11.9908},
	{368.2047, 1002.2945, 29.4785},
	{400.9102, 929.2210, 24.4523},
	{521.1584, 887.5301, -37.7608},
	{659.8228, 882.3239, -41.1391}
};
new Float:gRace_OilRefinary_Spawns[][4] =
{
    {624.760253, 865.711791, -43.291885, 121.836662},
	{630.981933, 865.051818, -43.290763, 117.499839}
};

// Air derby spawns
new Float:gDerby_Air_Spawns[][3] =
{
    {2580.9543,-2922.2375,1003.8871},
	{2580.9353,-3040.3372,1003.8871},
	{2620.9497,-2980.4980,1003.8871},
    {2662.5625,-2922.4089,1003.8871},
	{2682.1228,-2959.8835,1003.8871},
	{2663.1399,-2999.8201,1003.8871},
    {2581.3845,-2962.0913,1003.8871},
	{2606.0146,-2995.0747,1003.8871},
	{2601.6973,-2941.1292,1003.8871},
    {2581.7783,-2959.8501,1003.8871}
};

// Air derby 2 spawns
new Float:gDerby_Air2_Spawns[][3] =
{
    {3811.2156,-2453.5735,1002.5284},
	{3828.2717,-2437.7588,1002.5284},
	{3797.6394,-2471.6860,1002.5284},
 	{3778.0747,-2452.8750,1002.5284},
 	{3848.7319,-2453.9375,1002.5284},
 	{3828.6216,-2453.9402,1015.5284},
  	{3797.5637,-2453.8789,1015.5284},
  	{3855.7751,-2472.6580,1015.5284},
  	{3770.3140,-2436.6235,1015.5284},
  	{3811.2190,-2436.3999,1015.5284}
};

// Park derby spawns
new Float:gDerby_Park_Spawns[][4] =
{
    {370.5317, 5334.2036, 21.5007, 90.0000},
    {329.1581, 5268.3613, 10.0410, -45.0000},
    {471.6571, 5268.3271, 10.0410, 0.0000},
    {331.5957, 5257.8633, 10.0410, -90.0000},
    {459.8723, 5257.9766, 10.0410, 90.0000},
    {328.9519, 5400.3428, 10.0410, 225.0000},
    {471.6585, 5399.7070, 10.0410, 180.0000},
    {395.5331, 5361.3579, 21.5007, 359.3239},
    {413.6491, 5315.7949, 10.1472, -135.0000},
    {376.9891, 5315.6880, 10.1472, 135.0000}
};

new gRaceTimer[7];
new bool:gRaceStarted[7];

// Random colors
new gRandomColors[] = //511 colors
{
	/*OKStyle*/ 0x000022FF, 0x000044FF, 0x000066FF, 0x000088FF, 0x0000AAFF, 0x0000CCFF, 0x0000EEFF,
	0x002200FF, 0x002222FF, 0x002244FF, 0x002266FF, 0x002288FF, 0x0022AAFF, 0x0022CCFF, 0x0022EEFF,
	0x004400FF, 0x004422FF, 0x004444FF, 0x004466FF, 0x004488FF, 0x0044AAFF, 0x0044CCFF, 0x0044EEFF,
	0x006600FF, 0x006622FF, 0x006644FF, 0x006666FF, 0x006688FF, 0x0066AAFF, 0x0066CCFF, 0x0066EEFF,
	0x008800FF, 0x008822FF, 0x008844FF, 0x008866FF, 0x008888FF, 0x0088AAFF, 0x0088CCFF, 0x0088EEFF,
	0x00AA00FF, 0x00AA22FF, 0x00AA44FF, 0x00AA66FF, 0x00AA88FF, 0x00AAAAFF, 0x00AACCFF, 0x00AAEEFF,
	0x00CC00FF, 0x00CC22FF, 0x00CC44FF, 0x00CC66FF, 0x00CC88FF, 0x00CCAAFF, 0x00CCCCFF, 0x00CCEEFF,
	0x00EE00FF, 0x00EE22FF, 0x00EE44FF, 0x00EE66FF, 0x00EE88FF, 0x00EEAAFF, 0x00EECCFF, 0x00EEEEFF,

	0x220000FF, 0x220022FF, 0x220044FF, 0x220066FF, 0x220088FF, 0x2200AAFF, 0x2200CCFF, 0x2200FFFF,
	0x222200FF, 0x222222FF, 0x222244FF, 0x222266FF, 0x222288FF, 0x2222AAFF, 0x2222CCFF, 0x2222EEFF,
	0x224400FF, 0x224422FF, 0x224444FF, 0x224466FF, 0x224488FF, 0x2244AAFF, 0x2244CCFF, 0x2244EEFF,
	0x226600FF, 0x226622FF, 0x226644FF, 0x226666FF, 0x226688FF, 0x2266AAFF, 0x2266CCFF, 0x2266EEFF,
	0x228800FF, 0x228822FF, 0x228844FF, 0x228866FF, 0x228888FF, 0x2288AAFF, 0x2288CCFF, 0x2288EEFF,
	0x22AA00FF, 0x22AA22FF, 0x22AA44FF, 0x22AA66FF, 0x22AA88FF, 0x22AAAAFF, 0x22AACCFF, 0x22AAEEFF,
	0x22CC00FF, 0x22CC22FF, 0x22CC44FF, 0x22CC66FF, 0x22CC88FF, 0x22CCAAFF, 0x22CCCCFF, 0x22CCEEFF,
	0x22EE00FF, 0x22EE22FF, 0x22EE44FF, 0x22EE66FF, 0x22EE88FF, 0x22EEAAFF, 0x22EECCFF, 0x22EEEEFF,

	0x440000FF, 0x440022FF, 0x440044FF, 0x440066FF, 0x440088FF, 0x4400AAFF, 0x4400CCFF, 0x4400FFFF,
	0x442200FF, 0x442222FF, 0x442244FF, 0x442266FF, 0x442288FF, 0x4422AAFF, 0x4422CCFF, 0x4422EEFF,
	0x444400FF, 0x444422FF, 0x444444FF, 0x444466FF, 0x444488FF, 0x4444AAFF, 0x4444CCFF, 0x4444EEFF,
	0x446600FF, 0x446622FF, 0x446644FF, 0x446666FF, 0x446688FF, 0x4466AAFF, 0x4466CCFF, 0x4466EEFF,
	0x448800FF, 0x448822FF, 0x448844FF, 0x448866FF, 0x448888FF, 0x4488AAFF, 0x4488CCFF, 0x4488EEFF,
	0x44AA00FF, 0x44AA22FF, 0x44AA44FF, 0x44AA66FF, 0x44AA88FF, 0x44AAAAFF, 0x44AACCFF, 0x44AAEEFF,
	0x44CC00FF, 0x44CC22FF, 0x44CC44FF, 0x44CC66FF, 0x44CC88FF, 0x44CCAAFF, 0x44CCCCFF, 0x44CCEEFF,
	0x44EE00FF, 0x44EE22FF, 0x44EE44FF, 0x44EE66FF, 0x44EE88FF, 0x44EEAAFF, 0x44EECCFF, 0x44EEEEFF,

	0x660000FF, 0x660022FF, 0x660044FF, 0x660066FF, 0x660088FF, 0x6600AAFF, 0x6600CCFF, 0x6600FFFF,
	0x662200FF, 0x662222FF, 0x662244FF, 0x662266FF, 0x662288FF, 0x6622AAFF, 0x6622CCFF, 0x6622EEFF,
	0x664400FF, 0x664422FF, 0x664444FF, 0x664466FF, 0x664488FF, 0x6644AAFF, 0x6644CCFF, 0x6644EEFF,
	0x666600FF, 0x666622FF, 0x666644FF, 0x666666FF, 0x666688FF, 0x6666AAFF, 0x6666CCFF, 0x6666EEFF,
	0x668800FF, 0x668822FF, 0x668844FF, 0x668866FF, 0x668888FF, 0x6688AAFF, 0x6688CCFF, 0x6688EEFF,
	0x66AA00FF, 0x66AA22FF, 0x66AA44FF, 0x66AA66FF, 0x66AA88FF, 0x66AAAAFF, 0x66AACCFF, 0x66AAEEFF,
	0x66CC00FF, 0x66CC22FF, 0x66CC44FF, 0x66CC66FF, 0x66CC88FF, 0x66CCAAFF, 0x66CCCCFF, 0x66CCEEFF,
	0x66EE00FF, 0x66EE22FF, 0x66EE44FF, 0x66EE66FF, 0x66EE88FF, 0x66EEAAFF, 0x66EECCFF, 0x66EEEEFF,

	0x880000FF, 0x880022FF, 0x880044FF, 0x880066FF, 0x880088FF, 0x8800AAFF, 0x8800CCFF, 0x8800FFFF,
	0x882200FF, 0x882222FF, 0x882244FF, 0x882266FF, 0x882288FF, 0x8822AAFF, 0x8822CCFF, 0x8822EEFF,
	0x884400FF, 0x884422FF, 0x884444FF, 0x884466FF, 0x884488FF, 0x8844AAFF, 0x8844CCFF, 0x8844EEFF,
	0x886600FF, 0x886622FF, 0x886644FF, 0x886666FF, 0x886688FF, 0x8866AAFF, 0x8866CCFF, 0x8866EEFF,
	0x888800FF, 0x888822FF, 0x888844FF, 0x888866FF, 0x888888FF, 0x8888AAFF, 0x8888CCFF, 0x8888EEFF,
	0x88AA00FF, 0x88AA22FF, 0x88AA44FF, 0x88AA66FF, 0x88AA88FF, 0x88AAAAFF, 0x88AACCFF, 0x88AAEEFF,
	0x88CC00FF, 0x88CC22FF, 0x88CC44FF, 0x88CC66FF, 0x88CC88FF, 0x88CCAAFF, 0x88CCCCFF, 0x88CCEEFF,
	0x88EE00FF, 0x88EE22FF, 0x88EE44FF, 0x88EE66FF, 0x88EE88FF, 0x88EEAAFF, 0x88EECCFF, 0x88EEEEFF,

	0xAA0000FF, 0xAA0022FF, 0xAA0044FF, 0xAA0066FF, 0xAA0088FF, 0xAA00AAFF, 0xAA00CCFF, 0xAA00FFFF,
	0xAA2200FF, 0xAA2222FF, 0xAA2244FF, 0xAA2266FF, 0xAA2288FF, 0xAA22AAFF, 0xAA22CCFF, 0xAA22EEFF,
	0xAA4400FF, 0xAA4422FF, 0xAA4444FF, 0xAA4466FF, 0xAA4488FF, 0xAA44AAFF, 0xAA44CCFF, 0xAA44EEFF,
	0xAA6600FF, 0xAA6622FF, 0xAA6644FF, 0xAA6666FF, 0xAA6688FF, 0xAA66AAFF, 0xAA66CCFF, 0xAA66EEFF,
	0xAA8800FF, 0xAA8822FF, 0xAA8844FF, 0xAA8866FF, 0xAA8888FF, 0xAA88AAFF, 0xAA88CCFF, 0xAA88EEFF,
	0xAAAA00FF, 0xAAAA22FF, 0xAAAA44FF, 0xAAAA66FF, 0xAAAA88FF, 0xAAAAAAFF, 0xAAAACCFF, 0xAAAAEEFF,
	0xAACC00FF, 0xAACC22FF, 0xAACC44FF, 0xAACC66FF, 0xAACC88FF, 0xAACCAAFF, 0xAACCCCFF, 0xAACCEEFF,
	0xAAEE00FF, 0xAAEE22FF, 0xAAEE44FF, 0xAAEE66FF, 0xAAEE88FF, 0xAAEEAAFF, 0xAAEECCFF, 0xAAEEEEFF,

	0xCC0000FF, 0xCC0022FF, 0xCC0044FF, 0xCC0066FF, 0xCC0088FF, 0xCC00AAFF, 0xCC00CCFF, 0xCC00FFFF,
	0xCC2200FF, 0xCC2222FF, 0xCC2244FF, 0xCC2266FF, 0xCC2288FF, 0xCC22AAFF, 0xCC22CCFF, 0xCC22EEFF,
	0xCC4400FF, 0xCC4422FF, 0xCC4444FF, 0xCC4466FF, 0xCC4488FF, 0xCC44AAFF, 0xCC44CCFF, 0xCC44EEFF,
	0xCC6600FF, 0xCC6622FF, 0xCC6644FF, 0xCC6666FF, 0xCC6688FF, 0xCC66AAFF, 0xCC66CCFF, 0xCC66EEFF,
	0xCC8800FF, 0xCC8822FF, 0xCC8844FF, 0xCC8866FF, 0xCC8888FF, 0xCC88AAFF, 0xCC88CCFF, 0xCC88EEFF,
	0xCCAA00FF, 0xCCAA22FF, 0xCCAA44FF, 0xCCAA66FF, 0xCCAA88FF, 0xCCAAAAFF, 0xCCAACCFF, 0xCCAAEEFF,
	0xCCCC00FF, 0xCCCC22FF, 0xCCCC44FF, 0xCCCC66FF, 0xCCCC88FF, 0xCCCCAAFF, 0xCCCCCCFF, 0xCCCCEEFF,
	0xCCEE00FF, 0xCCEE22FF, 0xCCEE44FF, 0xCCEE66FF, 0xCCEE88FF, 0xCCEEAAFF, 0xCCEECCFF, 0xCCEEEEFF,

	0xEE0000FF, 0xEE0022FF, 0xEE0044FF, 0xEE0066FF, 0xEE0088FF, 0xEE00AAFF, 0xEE00CCFF, 0xEE00FFFF,
	0xEE2200FF, 0xEE2222FF, 0xEE2244FF, 0xEE2266FF, 0xEE2288FF, 0xEE22AAFF, 0xEE22CCFF, 0xEE22EEFF,
	0xEE4400FF, 0xEE4422FF, 0xEE4444FF, 0xEE4466FF, 0xEE4488FF, 0xEE44AAFF, 0xEE44CCFF, 0xEE44EEFF,
	0xEE6600FF, 0xEE6622FF, 0xEE6644FF, 0xEE6666FF, 0xEE6688FF, 0xEE66AAFF, 0xEE66CCFF, 0xEE66EEFF,
	0xEE8800FF, 0xEE8822FF, 0xEE8844FF, 0xEE8866FF, 0xEE8888FF, 0xEE88AAFF, 0xEE88CCFF, 0xEE88EEFF,
	0xEEAA00FF, 0xEEAA22FF, 0xEEAA44FF, 0xEEAA66FF, 0xEEAA88FF, 0xEEAAAAFF, 0xEEAACCFF, 0xEEAAEEFF,
	0xEECC00FF, 0xEECC22FF, 0xEECC44FF, 0xEECC66FF, 0xEECC88FF, 0xEECCAAFF, 0xEECCCCFF, 0xEECCEEFF,
	0xEEEE00FF, 0xEEEE22FF, 0xEEEE44FF, 0xEEEE66FF, 0xEEEE88FF, 0xEEEEAAFF, 0xEEEECCFF, 0xEEEEEEFF
};

// Minigun dm spawns
new Float:gMinigunSpawns[][4] =
{
    {2173.5723,1577.8872,999.9675,358.7795},
	{2205.8892,1580.4723,999.9788,37.6098},
	{2206.0720,1549.6593,1008.0951,296.3788},
	{2232.4290,1589.0771,999.9567,140.0240},
	{2199.4785,1613.1299,999.9723,305.1288}
};

// Moneybag dm spawns
new Float:gMoneybagSpawns[][4] =
{
    {1301.7788,-785.7610,1084.0078,349.9862},
    {1233.7123,-762.2798,1084.0088,198.0181},
    {1277.9406,-792.4418,1084.0078,357.4828},
    {1247.2562,-803.8536,1084.0151,267.8687},
    {1279.7694,-781.3691,1089.9375,219.3016}
};

// Glass dm spawns
new Float:gGlassSpawns[][4] =
{
    {67.3965,1553.5461,63.2100,135.7074},
	{41.8477,1517.2374,63.2500,320.5758},
	{68.7605,1553.4050,74.3600,146.1037},
	{42.5923,1514.3993,74.3600,322.1987},
	{47.5731,1526.2106,85.4100,324.7054}
};

// RPG dm spawns
new Float:gRPGSpawns[][4] =
{
    {246.9303,1385.9288,23.3703,0.0000},
    {165.2390,1357.2312,26.2036,0.0000},
    {165.9894,1426.7672,26.2623,0.0000},
    {132.4376,1355.1686,26.1223,134.3979},
    {203.1333,1398.6799,43.0946,0.0000}
};

// RC-Battlefield dm spawns
new Float:gBattlefieldSpawns[][4] =
{
    {-1129.3746,1049.4064,1345.7311,331.4630},
    {-975.3635,1089.3511,1344.9720,0.0000},
    {-1009.8124,1082.7295,1341.0256,0.0000},
    {-1063.7712,1093.0005,1343.2915,0.0000}
};

// Jetpack fight dm spawns
new Float:gJetfightSpawns[][4] =
{
    {104.6625,1899.2253,33.8984,360.0000},
    {268.6033,1883.1154,-30.0938,360.0000},
    {146.0192,1902.7410,26.3855,360.0000},
    {166.8052,1851.8534,33.8984,294.8027},
    {356.8475,2026.2700,22.6335,111.8378}
};

// Oneshotkill dm spawns
new Float:gOneshotkillSpawns[][4] =
{
    {2220.6904,-1146.5289,1025.7969,345.9047},
    {2246.3486,-1163.2803,1029.7969,48.5485},
    {2240.0085,-1186.9590,1033.7969,333.6846},
    {2209.5359,-1198.6893,1029.7969,14.7083},
    {2194.3652,-1142.1311,1029.7969,176.0531}
};

// gangwar: grove tdm spawns
new Float:gGangwar_GroveSpawns[][4] =
{
    {2511.2883,-1678.9266,13.5469,54.0012},
	{2497.8262,-1650.8203,13.5264,147.4878},
	{2464.8596,-1670.9858,13.4812,18.1362}
};

// gangwar: ballas tdm spawns
new Float:gGangwar_BallasSpawns[][4] =
{
    {2319.5703,-1526.4681,25.3438,213.6346},
    {2373.5649,-1545.3914,23.9961,173.2703},
    {2414.5940,-1571.9285,23.8827,265.7046}
};

// gangwar: azetecas tdm spawns
new Float:gGangwar_AzetecasSpawns[][4] =
{
    {2244.6072,-1869.2466,14.2409,30.0991},
    {2293.0210,-1886.7549,13.5895,279.4914},
    {2346.0449,-1887.3367,13.5500,336.8319}
};

// gangwar: azetecas tdm spawns
new Float:gSniper_RedSpawns[][4] =
{
    {1179.1808,-1451.5072,29.9184,113.8494},
    {1174.9438,-1484.2045,29.9273,57.7622},
    {1173.7618,-1525.7009,29.9071,36.4554}
};

// gangwar: azetecas tdm spawns
new Float:gSniper_BlueSpawns[][4] =
{
    {1087.0704,-1538.5571,29.9089,291.5111},
    {1075.2878,-1485.2345,29.9280,273.0243},
    {1078.7877,-1439.3181,29.9131,230.4106}
};

// jungle mode tdm cop spawns
new Float:gJungle_CopsSpawns[][4] =
{
    {1091.1593,-254.4242,74.8262,0.0},
	{1077.3807,-243.8902,75.2507,0.0},
	{1107.5283,-304.2302,73.9922,0.0},
	{1051.3750,-286.8708,73.9931,0.0}
};

// jungle mode tdm criminals spawns
new Float:gJungle_CriminalsSpawns[][4] =
{
    {967.8736,-47.7021,80.0229,0.0},
	{989.6363,-29.8497,78.9606,0.0},
	{1023.5994,-58.9749,86.9486,0.0},
	{1010.4918,-0.1751,91.8551,0.0}
};

// Random LS spawns
new Float:gRandomSpawns_LosSantos[][4] =
{
	{2652.6418,-1989.9175,13.9988,182.7107}, // Random house in willowfield - near playa de seville and stadium
	{2689.5203,-1695.9354,10.0517,39.5312}, // Outside stadium - lots of cars
	{2770.5393,-1628.3069,12.1775,4.9637}, // South in east beach - north of stadium - carparks nearby
	{2807.9282,-1176.8883,25.3805,173.6018}, // North in east beach - near apartments
	{2495.0720,-1687.5278,13.5150,359.6696}, // Outside CJ's house - lots of cars nearby
	{2306.8252,-1675.4340,13.9221,2.6271}, // House in ganton - lots of cars nearby
	{2191.8403,-1455.8251,25.5391,267.9925}, // House in south jefferson - lots of cars nearby
	{1830.1359,-1092.1849,23.8656,94.0113}, // Mulholland intersection carpark
	{1654.7091,-1656.8516,22.5156,177.9729}, // Right next to PD
	{1219.0851,-1812.8058,16.5938,190.0045}, // Conference Center
	{1508.6849,-1059.0846,25.0625,1.8058}, // Across the street of BANK - lots of cars in intersection carpark
	{1421.0819,-885.3383,50.6531,3.6516}, // Outside house in vinewood
	{1235.2196,-1608.6111,13.5469,181.2655}, // Backalley west of mainstreet
	{590.4648,-1252.2269,18.2116,25.0473}, // Outside "BAnk of San Andreas"
	{842.5260,-1007.7679,28.4185,213.9953}, // North of Graveyard
	{911.9332,-1232.6490,16.9766,5.2999}, // LS Film Studio
	{790.1918,-839.8533,60.6328,191.9514}, // Mulholland house
	{1299.1859,-801.4249,84.1406,269.5274}, // Maddoggs
	{1240.3170,-2036.6886,59.9575,276.4659}, // Verdant Bluffs
	{2215.5181,-2627.8174,13.5469,273.7786} // Ocean docks 1
};

// Random LV spawns
new Float:gRandomSpawns_LasVenturas[][4] =
{
	{1435.8024,2662.3647,11.3926,1.1650}, //  Northern train station
	{1457.4762,2773.4868,10.8203,272.2754}, //  Northern golf club
	{2101.4192,2678.7874,10.8130,92.0607}, //  Northern near railway line
	{2808.3367,2421.5107,11.0625,136.2060}, //  Northern shopping centre
	{2633.3203,2349.7061,10.6719,178.7175}, //  V-Rock
	{2616.5286,2100.6226,10.8158,177.7834}, //  North Ammunation 1
	{2340.6677,2530.4324,10.8203,177.8630}, //  North Pizza Stack
	{2097.6855,2491.3313,14.8390,181.8117}, //  Emerald Isle
	{1893.1000,2423.2412,11.1782,269.4385}, //  Souvenir shop
	{1698.9330,2241.8320,10.8203,357.8584}, //  Northern casino
	{1298.1548,2083.4016,10.8127,256.7034}, //  Baseball stadium 2
	{1117.8785,2304.1514,10.8203,81.5490}, //  North carparks
	{1108.9878,1705.8639,10.8203,0.6785}, //  Dirtring racing 1
	{1423.9780,1034.4188,10.8203,90.9590}, //  Sumo
	{2489.8286,928.3251,10.8280,67.2245}, //  Wedding chapel
	{2845.6104,1288.1444,11.3906,3.6506}, //  Southern train station
	{2214.3008,2041.9165,10.8203,268.7626}, //  Central parking lot
	{2005.9174,2152.0835,10.8203,270.1372}, //  Central motel
	{2087.9902,1516.5336,10.8203,48.9300}, //  Royal Casino
	{2172.1624,1398.7496,11.0625,91.3783}, //  Auto Bahn
	{1673.2345,1316.1067,10.8203,177.7294} //  Airport carpark
};

// Random SF spawns
new Float:gRandomSpawns_SanFierro[][4] =
{
	{-2723.4639,-314.8138,7.1839,43.5562},  // golf course spawn
	{-2458.2000,134.5419,35.1719,303.9446},  // hotel
	{-2706.5261,397.7129,4.3672,179.8611},  // park
	{-2660.9402,883.2115,79.7738,357.4440},  // house
	{-2861.0796,1047.7109,33.6068,188.2750}, //  parking lot
	{-2629.2009,1383.1367,7.1833,179.7006},  // parking lot at the bridge
	{-1660.2294,1382.6698,9.8047,136.2952}, //  pier 69
	{-1674.1964,430.3246,7.1797,226.1357},  // gas station]
	{-1954.9982,141.8080,27.1747,277.7342},  // train station
	{-1956.1447,287.1091,35.4688,90.4465},  // car shop
	{-1983.3458,1117.0645,53.1243,271.2390},  // church
	{-2417.6458,970.1491,45.2969,269.3676},  // gas station
	{-2108.0171,902.8030,76.5792,5.7139},  // house
	{-2287.5027,149.1875,35.3125,266.3989},  // baseball parking lot
	{-2039.3571,-97.7205,35.1641,7.4744},  // driving school
	{-1867.5022,-141.9203,11.8984,22.4499},  // factory
	{-1537.8992,116.0441,17.3226,120.8537},  // docks ship
	{-1427.0858,-288.9430,14.1484,137.0812},  // airport
	{-2173.0654,-392.7444,35.3359,237.0159},  // stadium
	{-2930.0049,487.2518,4.9141,3.8258}  // harbor
};

// Army spawns LS/SF/LV.
new Float:gArmySpawns[3][4] =
{
	{2786.2183,-2436.7859,13.6340,82.3043},
	{-1308.4493,504.9661,11.1953,132.5},
	{272.6040,1989.7307,17.6406,268.3605}
};

// Medical dept spawns LS/SF/LV.
new Float:gMedicalSpawns[3][4] =
{
	{1568.2250,-1693.5483,5.8906,177.0983},
	{-1604.8442,732.9442,-5.2344,37.6041},
	{1609.5922,1820.9641,10.8280,348.1614}
};

// Police dept spawns LS/SF/LV.
new Float:gPoliceSpawns[3][4] =
{
	{1568.2250,-1693.5483,5.8906,177.0983},
	{-1604.8442,732.9442,-5.2344,37.6041},
	{2343.4553,2455.5994,14.9688,96.5022}
};

new gDialog_Weapons[] =
{
    331,//knuckle
    333,//golf club
    334,//nightstick
	335,//knife
    336,//baseball bat
    337,//shovel
    338,//pool cue
	339,//katana
	341,//chainsaw
	321,//purple dildo
	322,//dildo
	323,//vibrator
	324,//silver vibrator
	325,//flowers
	326,//cane
	346,//9mm
	347,//silenced 9mm
	348,//deagle
	349,//shotgun
	350,//sawnoff shotgun
	351,//combat shotgun
	352,//UZI
	353,//MP5
	355,//ak-47
	356,//m4
	372,//tec-9
	357,//rifle
    358,//sniper rifle
    361,//flamethrower
    365,//spray can
    366,//fire estinguisher
    367,//camera
    368,//night vision
    369,//thermal vision
    371//parachute
};

new gDialog_Vehicles[] =
{
	400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,
	431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,450,451,452,453,454,455,456,457,458,459,460,461,
	462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,
	493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,
	524,525,526,527,528,529,530,531,532,533,534,535,536,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,
	555,556,557,558,559,560,561,562,563,564,565,566,567,568,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611
};

new gDialog_Skins[] =
{
	0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,
	50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,
	97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,
	132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,
	167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,
	202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,
	237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,
	272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,
	307,308,309,310,311
};

new gDialog_Duel[] =
{
    341,//chainsaw
	342,//grenade
	343,//teargas
	344,//moltove
	346,//9mm
	347,//silenced 9mm
	348,//deagle
	349,//shotgun
	350,//sawnoff shotgun
	351,//combat shotgun
	352,//UZI
	353,//MP5
	355,//ak-47
	356,//m4
	372,//tec-9
	357,//rifle
    358,//sniper rifle
    361//flamethrower
};

new gDialog_DerbyCars[] =
{
    400,401,402,406,411,412,413,434,438,448,451,457,471
};

//vehicle names
new gVehicleNames[212][] =
{
	{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
	{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
	{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
	{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
	{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
	{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
	{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
	{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
	{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
	{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
	{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
	{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
	{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
	{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
	{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
	{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
	{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
	{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
	{"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
	{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
	{"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
	{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
	{"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
	{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
	{"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
	{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
	{"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
	{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
	{"Utility Trailer"}
};

//-------------------------------------------

public OnGameModeInit()
{
	UsePlayerPedAnims();
	
	SetGameModeText("DM/TDM/RACE/FR/PARTY - Build 4");

	for(new i; i < 311; i++) AddPlayerClass(i, -1,-1,-1,-1,-1,-1,-1,-1,-1,-1);

	//add help TD
	gServer[S_HELP_TD] = TextDrawCreateEx(4.000000, 434.000000, "/c: commands - /h: help - /v: vehicles - /s: skins - /o: objects - /t: teleports - /stats: statics - /w: weapons - Type /m to change mode", 255, 3, 0.230000, 1.000000, -1, 1, 1, true);

	//add notification TD
	gServer[S_NOTIFY_TD][0] = TextDrawCreateEx(347.000000, 378.000000, "-", 255, 1, 0.210000, 0.899998, -1, 1, 1, true);
	gServer[S_NOTIFY_TD][1] = TextDrawCreateEx(347.000000, 386.000000, "-", 255, 1, 0.210000, 0.899998, -1, 1, 1, true);
	gServer[S_NOTIFY_TD][2] = TextDrawCreateEx(347.000000, 394.000000, "-", 255, 1, 0.210000, 0.899998, -1, 1, 1, true);
	for(new i; i < 3; i++)
	{
		gServer[S_NOTIFY_TIMER][i] = -1;
	}
	
	//moneybag dm
    gServer[S_MONEYBAG_PICKUP] = CreateDynamicPickup(1550, 1, 1226.6163, -809.7188, 1084.0078, MODE_MONEYBAG, 5);
    gServer[S_MONEYBAG_PLAYER] = INVALID_PLAYER_ID;
    
    //add ball sprite TD
    gServer[S_BACKGROUND_TD] = TextDrawCreateEx(1.000000, 336.000000, "-", 255, 1, 0.000000, 12.500000, -1, 1, 0, true, 1, true, 200, 642.000000, 0.000000);
    for(new i; i < 7; i++)
	{
	    new Float:BASE_X = 31.000000;
	    new Float:BASE_Y = 355.000000;
		gServer[S_BALL_TD][i] = TextDrawCreateEx(BASE_X + (80 * i), BASE_Y, "LD_POOL:ball", 255, 4, 0.500000, 1.000000, -3996, 1, 0, true, 1, true, 255, 66.000000, 70.000000, _, _, _, _, _, true);
	}
	
	//little turf system for gangwar tdm
	gServer[S_TURF_ATTACKER] = NO_TEAM;
	gServer[S_TURF_OWNER] = 0;
	gServer[S_TURF] = GangZoneCreate(2193.39, -1926.622, 2590.068, -1448.945, ConvertColorTransparency(COLOR_GREEN, 150));
	gServer[S_TURF_TIME] = 0;

	//loading races
	for(new i; i < 7; i++)
	{
	    gRaceTimer[i] = -1;
	    gRaceStarted[i] = false;
	}
	return 1;
}
//-------------------------------------------

public OnGameModeExit()
{
	for(new i; i < 3; i++)
	{
		KillTimer(gServer[S_NOTIFY_TIMER][i]);
	}
	return 1;
}

//-------------------------------------------

public OnPlayerConnect(playerid)
{
    GameTextForPlayer(playerid, "~w~~h~Welcome to~n~~r~~h~~h~~h~RedRex Freeroam~n~ ~n~~y~~h~Build 4", 5000, 1);
    
	TextDrawShowForPlayer(playerid, gServer[S_NOTIFY_TD]);
	
	gUser[playerid][U_MODE] = MODE_FREEROAM;

    gUser[playerid][U_COLOR] = gRandomColors[random(sizeof(gRandomColors))];
    SetPlayerColor(playerid, gUser[playerid][U_COLOR]);
	gUser[playerid][U_SKIN] = random(311);
    
	gUser[playerid][U_SPAWN] = SPAWN_LOS_SANTOS;

	for(new i; i < 4; i++) gUser[playerid][U_POS][i] = 0.0;

	gUser[playerid][U_WEAPONS][0] = 4;
	gUser[playerid][U_WEAPONS][1] = 24;
	gUser[playerid][U_WEAPONS][2] = 25;
	gUser[playerid][U_WEAPONS][3] = 29;
	gUser[playerid][U_WEAPONS][4] = 31;
	
	gUser[playerid][U_GOD] = false;
	
 	gUser[playerid][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	gUser[playerid][U_DUEL_WEAPON] = 0;
	gUser[playerid][U_DUEL_BET] = 0;

	gUser[playerid][U_VEHICLE] = INVALID_VEHICLE_ID;

	gUser[playerid][U_LISTITEM] = 0;

	gUser[playerid][U_MODE_MENU] = -1;
	gUser[playerid][U_LAST_TICK] = GetTickCount();
	
	gUser[playerid][U_TEAM] = NO_TEAM;

	gUser[playerid][U_ROCKET_OBJECT] = -1;
	gUser[playerid][U_ROCKET_TIMER] = -1;

	gUser[playerid][U_GOTO] = true;
	
	for(new i; i < 7; i++)
	{
	    new Float:BASE_X; 
	    new Float:BASE_Y;
	    
		BASE_X = 65.000000;
		BASE_Y = 424.000000;
		gUser[playerid][U_LABEL_TD][i] = CreatePlayerTextDrawEx(playerid, BASE_X + (i * 80), BASE_Y, "Deathmatch~n~~b~~h~~h~~h~88/100", 255, 1, 0.209999, 0.799998, -1, 2, 0, true, 1);

		BASE_X = 31.000000;
  		BASE_Y = 355.000000;
		gUser[playerid][U_MODEL_TD][i] = CreatePlayerTextDrawEx(playerid, BASE_X + (i * 80), BASE_Y, "model", 0, 5, 0.500000, 1.000000, -1, 1, 0, true, 1, true, 0, 66.000000, 70.000000, 351, 0.0, 0.0, 0.0, 1.0);
	}
	
	gUser[playerid][U_MODE_TD] = CreatePlayerTextDrawEx(playerid, 5.000000, 260.000000, "Welcome user!", 255, 1, 0.180000, 0.799998, -1, 1, 1, true, 1, true, 252645320, 128.000000, 0.000000);

	gUser[playerid][U_RACE_CP] = 0;
	gUser[playerid][U_RACE_POSITION] = 0;

	gUser[playerid][U_MEGA_JUMP] = false;
	
	gUser[playerid][U_VEHICLE_BONUS_TD] = CreatePlayerTextDrawEx(playerid, 626.000000, 384.000000, "Press ~b~~h~~h~~h~Y ~w~~h~to jump vehicle", 255, 3, 0.300000, 1.300000, -1, 3, 1, true, 1);
	gUser[playerid][U_VEHICLE_BONUS_INTERVAL] = 0;

	//notifications
	new string[145];
	format(string, sizeof(string), "~g~~h~~h~~h~%s(%i) has joined the server", ReturnPlayerName(playerid), playerid);
	NotifyAll(string);

	TextDrawShowForPlayer(playerid, gServer[S_HELP_TD]);

	SendClientMessage(playerid, COLOR_ORANGE, "> Checkout our new tube (SAMP 0.3.7 feature) map with /tubes");
	return 1;
}

//-------------------------------------------

public OnPlayerDisconnect(playerid, reason)
{
	if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);

    for(new i; i < 22; i++)
	{
		DestroyDynamicObject(gUser[playerid][U_NEON][i]);
	}
		
	if(gUser[playerid][U_MODE] == MODE_DUEL)
	{
		new target = gUser[playerid][U_DUEL_OPPONENT];

	    GivePlayerMoney(target, gUser[playerid][U_DUEL_BET]);
	    GivePlayerMoney(playerid, - gUser[playerid][U_DUEL_BET]);
	    SpawnPlayer(target);

		GameTextForPlayer(target, "~g~Winner !", 5000, 3);
		GameTextForPlayer(playerid, "~r~Loser !", 5000, 3);

	    new string[144];
	    format(string, sizeof(string), "%s has won the duel against opponent %s [weapon: %s, bet: $%i]", ReturnPlayerName(target), ReturnPlayerName(playerid), ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]), gUser[playerid][U_DUEL_BET]);
	    SendClientMessageToAll(COLOR_AQUA, string);

        gUser[target][U_MODE] = MODE_FREEROAM;
	    gUser[target][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	    gUser[target][U_DUEL_WEAPON] = 0;
	    gUser[target][U_DUEL_BET] = 0;

        gUser[playerid][U_MODE] = MODE_FREEROAM;
        gUser[playerid][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
        gUser[playerid][U_DUEL_WEAPON] = 0;
        gUser[playerid][U_DUEL_BET] = 0;
	}

	//money bag droping
	if(playerid == gServer[S_MONEYBAG_PLAYER])
	{
		RemovePlayerAttachedObject(playerid, 1);

	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    gServer[S_MONEYBAG_PICKUP] = CreateDynamicPickup(1550, 1, x, y, z, MODE_MONEYBAG);
		gServer[S_MONEYBAG_PLAYER] = INVALID_PLAYER_ID;

		new string[145];
		foreach(new i : Player)
  		{
	  		if(gUser[i][U_MODE] == MODE_MONEYBAG)
	  		{
				format(string, sizeof(string), "~r~%s(%d) have lost the~n~~r~money bag", ReturnPlayerName(playerid), playerid);
	  			GameTextForPlayer(i, string, 5000, 3);
			}
		}
	}

	//notifications
	new string[145];
	switch(reason)
	{
		case 0: format(string, sizeof(string), "~r~~h~~h~~h~%s(%i) has left the server [Timeout/Crashed]", ReturnPlayerName(playerid), playerid);
		case 1: format(string, sizeof(string), "~r~~h~~h~~h~%s(%i) has left the server [Quit]", ReturnPlayerName(playerid), playerid);
		case 2: format(string, sizeof(string), "~r~~h~~h~~h~%s(%i) has left the server [Kicked/Banned]", ReturnPlayerName(playerid), playerid);
	}
	NotifyAll(string);

	TextDrawHideForPlayer(playerid, gServer[S_HELP_TD]);
	return 1;
}

//-------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
	gUser[playerid][U_MODE] = MODE_FREEROAM;
	gUser[playerid][U_TEAM] = NO_TEAM;
	gUser[playerid][U_SPAWN] = SPAWN_LOS_SANTOS;

	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0 + 1);

	SetPlayerPos(playerid,1629.8392,-2288.5488,94.1328);
    SetPlayerFacingAngle(playerid, 45.9620);
    SetPlayerCameraPos(playerid,1628.1469,-2287.2246,95.2250);
    SetPlayerCameraLookAt(playerid,1629.8392,-2288.5488,94.1328);

	HidePlayerModeMenu(playerid);
	
	gUser[playerid][U_SKIN] = classid;
	
	PlayerTextDrawHide(playerid, gUser[playerid][U_MODE_TD]);
	return 1;
}

//-------------------------------------------

public OnPlayerRequestSpawn(playerid)
{
	ShowPlayerModeMenu(playerid, 0);
	return 1;
}

//-------------------------------------------

public OnPlayerSpawn(playerid)
{
    for(new i; i < 22; i++)
	{
		DestroyDynamicObject(gUser[playerid][U_NEON][i]);
	}
	
    PlayerTextDrawHide(playerid, gUser[playerid][U_MODE_TD]);
    
    SetPlayerWantedLevel(playerid, 0);
    SetCameraBehindPlayer(playerid);

	SetPlayerTeam(playerid, gUser[playerid][U_TEAM]);
    SetPlayerColor(playerid, gUser[playerid][U_COLOR]);
    //SetPlayerSkin(playerid, gUser[playerid][U_SKIN]);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, gUser[playerid][U_MODE]);

	HideAllGangZonesForPlayer(playerid);

	DisablePlayerRaceCheckpoint(playerid);
	
    GameTextForPlayer(playerid, "~w~~h~Type ~b~/m ~w~~h~to change game mode", 5000, 1);

	new string[144];
		    
	//money bag droping
	if(playerid == gServer[S_MONEYBAG_PLAYER])
	{
		RemovePlayerAttachedObject(playerid, 1);

	    gServer[S_MONEYBAG_PICKUP] = CreateDynamicPickup(1550, 1, 1226.6163, -809.7188, 1084.0078, MODE_MONEYBAG);
		gServer[S_MONEYBAG_PLAYER] = INVALID_PLAYER_ID;

		foreach(new i : Player)
  		{
	  		if(gUser[i][U_MODE] == MODE_MONEYBAG)
	  		{
				format(string, sizeof(string), "~r~%s(%d) have lost the~n~~r~money bag", ReturnPlayerName(playerid), playerid);
	  			GameTextForPlayer(i, string, 5000, 3);
			}
		}
	}

	switch(gUser[playerid][U_MODE])
	{
		case MODE_DUEL:
		{
			HidePlayerModeMenu(playerid);
			
			new target = gUser[playerid][U_DUEL_OPPONENT];

		    GivePlayerMoney(target, gUser[playerid][U_DUEL_BET]);
		    GivePlayerMoney(playerid, - gUser[playerid][U_DUEL_BET]);
		    SpawnPlayer(target);
		    SpawnPlayer(playerid);

			GameTextForPlayer(target, "~g~Winner !", 5000, 3);
			GameTextForPlayer(playerid, "~r~Loser !", 5000, 3);
			
		    format(string, sizeof(string), "%s has won the duel against opponent %s [weapon: %s, bet: $%i]", ReturnPlayerName(target), ReturnPlayerName(playerid), ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]), gUser[playerid][U_DUEL_BET]);
		    SendClientMessageToAll(COLOR_AQUA, string);

	        gUser[target][U_MODE] = MODE_FREEROAM;
		    gUser[target][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
		    gUser[target][U_DUEL_WEAPON] = 0;
		    gUser[target][U_DUEL_BET] = 0;

	        gUser[playerid][U_MODE] = MODE_FREEROAM;
	        gUser[playerid][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	        gUser[playerid][U_DUEL_WEAPON] = 0;
	        gUser[playerid][U_DUEL_BET] = 0;
		}
		case MODE_MINIGUN:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);
            
			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Minigun deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to kill others with the minigun !");

			SetPlayerInterior(playerid, 1);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 38, 100000);

			new randomspawn = random(sizeof(gMinigunSpawns));
			SetPlayerPos(playerid, gMinigunSpawns[randomspawn][0], gMinigunSpawns[randomspawn][1], gMinigunSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gMinigunSpawns[randomspawn][3]);

            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_MONEYBAG:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);
            
			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Moneybag hunt deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to get the moneybag and steel as much money you can !");
			
			SetPlayerInterior(playerid, 5);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 24, 100000);
			GivePlayerWeapon(playerid, 27, 100000);
			GivePlayerWeapon(playerid, 29, 100000);

			new randomspawn = random(sizeof(gMoneybagSpawns));
			SetPlayerPos(playerid, gMoneybagSpawns[randomspawn][0], gMoneybagSpawns[randomspawn][1], gMoneybagSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gMoneybagSpawns[randomspawn][3]);

            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 100.0);
	    }
		case MODE_GLASS:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Glass deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to break the glass so that players on it falls !");
			
			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 25, 100000);

			new randomspawn = random(sizeof(gGlassSpawns));
			SetPlayerPos(playerid, gGlassSpawns[randomspawn][0], gGlassSpawns[randomspawn][1], gGlassSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gGlassSpawns[randomspawn][3]);

            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_RPG:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> RPG deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to kill others, blow them up !");
			
			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 35, 100000);

			new randomspawn = random(sizeof(gRPGSpawns));
			SetPlayerPos(playerid, gRPGSpawns[randomspawn][0], gRPGSpawns[randomspawn][1], gRPGSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gRPGSpawns[randomspawn][3]);

            SetPlayerHealth(playerid, 20.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_BATTLEFIELD:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> RC-Battlefield deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to destroy other RC tigers/tanks !");
			SendClientMessage(playerid, COLOR_LIME, "> Press CTRL or KEY_FIRE to fire bombs from your tiger !");
			
			SetPlayerInterior(playerid, 10);

			ResetPlayerWeapons(playerid);

			new randomspawn = random(sizeof(gBattlefieldSpawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(564, gBattlefieldSpawns[randomspawn][0], gBattlefieldSpawns[randomspawn][1], gBattlefieldSpawns[randomspawn][2], gBattlefieldSpawns[randomspawn][3], random(255), random(255), 10);
			LinkVehicleToInterior(gUser[playerid][U_VEHICLE], 10);
			SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], gUser[playerid][U_MODE]);
            PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);
            
            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_JETFIGHT:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Jetpack fight deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is kill other jetrunners !");
			
			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 28, 100000);

			new randomspawn = random(sizeof(gJetfightSpawns));
			SetPlayerPos(playerid, gJetfightSpawns[randomspawn][0], gJetfightSpawns[randomspawn][1], gJetfightSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gJetfightSpawns[randomspawn][3]);

			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);

            SetPlayerHealth(playerid, 20.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_ONESHOTKILL:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> One shot kill deathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to eliminate other players, one shot and kill !");

			SetPlayerInterior(playerid, 15);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 23, 100000);

			new randomspawn = random(sizeof(gOneshotkillSpawns));
			SetPlayerPos(playerid, gOneshotkillSpawns[randomspawn][0], gOneshotkillSpawns[randomspawn][1], gOneshotkillSpawns[randomspawn][2]);
			SetPlayerFacingAngle(playerid, gOneshotkillSpawns[randomspawn][3]);

            SetPlayerHealth(playerid, 5.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_GANGWAR:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			ShowAllGangZonesForPlayer(playerid);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Gangwar teamdeathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to eliminate other gang players, protect your team and capture the turf !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			switch(gUser[playerid][U_TEAM])
			{
			    case 0://grove
			    {
			        SetPlayerColor(playerid, COLOR_GREEN);

					GivePlayerWeapon(playerid, 30, 100000);
					GivePlayerWeapon(playerid, 24, 100000);
					GivePlayerWeapon(playerid, 16, 5);

					new randomspawn = random(sizeof(gGangwar_GroveSpawns));
					SetPlayerPos(playerid, gGangwar_GroveSpawns[randomspawn][0], gGangwar_GroveSpawns[randomspawn][1], gGangwar_GroveSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gGangwar_GroveSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 269);
				}
			    case 1://ballas
			    {
			        SetPlayerColor(playerid, COLOR_PURPLE);

					GivePlayerWeapon(playerid, 34, 100000);
					GivePlayerWeapon(playerid, 29, 100000);
					GivePlayerWeapon(playerid, 18, 5);

					new randomspawn = random(sizeof(gGangwar_BallasSpawns));
					SetPlayerPos(playerid, gGangwar_BallasSpawns[randomspawn][0], gGangwar_BallasSpawns[randomspawn][1], gGangwar_BallasSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gGangwar_BallasSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 102);
				}
			    case 2://azetecas
			    {
			        SetPlayerColor(playerid, COLOR_CYAN);

					GivePlayerWeapon(playerid, 31, 100000);
					GivePlayerWeapon(playerid, 32, 100000);
					GivePlayerWeapon(playerid, 16, 5);

					new randomspawn = random(sizeof(gGangwar_AzetecasSpawns));
					SetPlayerPos(playerid, gGangwar_AzetecasSpawns[randomspawn][0], gGangwar_AzetecasSpawns[randomspawn][1], gGangwar_AzetecasSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gGangwar_AzetecasSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 292);
				}
			}

            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 50.0);
	    }
		case MODE_SNIPER:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Sniper teamdeathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to eliminate other enemy players !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			switch(gUser[playerid][U_TEAM])
			{
			    case 0://Red
			    {
			        SetPlayerColor(playerid, COLOR_RED);

					GivePlayerWeapon(playerid, 34, 100000);
					GivePlayerWeapon(playerid, 31, 100000);
					GivePlayerWeapon(playerid, 18, 5);

					new randomspawn = random(sizeof(gSniper_RedSpawns));
					SetPlayerPos(playerid, gSniper_RedSpawns[randomspawn][0], gSniper_RedSpawns[randomspawn][1], gSniper_RedSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gSniper_RedSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 80);
				}
			    case 1://Blue
			    {
			        SetPlayerColor(playerid, COLOR_BLUE);

					GivePlayerWeapon(playerid, 34, 100000);
					GivePlayerWeapon(playerid, 30, 100000);
					GivePlayerWeapon(playerid, 16, 5);

					new randomspawn = random(sizeof(gSniper_BlueSpawns));
					SetPlayerPos(playerid, gSniper_BlueSpawns[randomspawn][0], gSniper_BlueSpawns[randomspawn][1], gSniper_BlueSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gSniper_BlueSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 81);
				}
			}

            SetPlayerHealth(playerid, 50.0);
            SetPlayerArmour(playerid, 0.0);
	    }
		case MODE_JUNGLE:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Jungle Mode teamdeathmatch");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to eliminate other enemy players !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			switch(gUser[playerid][U_TEAM])
			{
			    case 0://Criminals
			    {
			        SetPlayerColor(playerid, COLOR_SKY_BLUE);

					GivePlayerWeapon(playerid, 33, 100000);
					GivePlayerWeapon(playerid, 30, 100000);
					GivePlayerWeapon(playerid, 36, 2);

					new randomspawn = random(sizeof(gJungle_CriminalsSpawns));
					SetPlayerPos(playerid, gJungle_CriminalsSpawns[randomspawn][0], gJungle_CriminalsSpawns[randomspawn][1], gJungle_CriminalsSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gJungle_CriminalsSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 293);
				}
				case 1://Cops
			    {
			        SetPlayerColor(playerid, COLOR_OLIVE_GREEN);

					GivePlayerWeapon(playerid, 33, 100000);
					GivePlayerWeapon(playerid, 31, 100000);
					GivePlayerWeapon(playerid, 35, 2);

					new randomspawn = random(sizeof(gJungle_CopsSpawns));
					SetPlayerPos(playerid, gJungle_CopsSpawns[randomspawn][0], gJungle_CopsSpawns[randomspawn][1], gJungle_CopsSpawns[randomspawn][2]);
					SetPlayerFacingAngle(playerid, gJungle_CopsSpawns[randomspawn][3]);

					SetPlayerSkin(playerid, 285);
				}
			}

            SetPlayerHealth(playerid, 100.0);
            SetPlayerArmour(playerid, 50.0);
	    }
		case MODE_BEACH_FRONT:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Beach front race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_BeachFront_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(415, gRace_BeachFront_Spawns[randomspawn][0], gRace_BeachFront_Spawns[randomspawn][1], gRace_BeachFront_Spawns[randomspawn][2], gRace_BeachFront_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
            PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);
			
            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_BeachFront_Checkpoints[0][0], gRace_BeachFront_Checkpoints[0][1], gRace_BeachFront_Checkpoints[0][2], gRace_BeachFront_Checkpoints[1][0], gRace_BeachFront_Checkpoints[1][1], gRace_BeachFront_Checkpoints[1][2], 10.0);

            if(gRaceStarted[0])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[0] = true;

                if(gRaceTimer[0] != -1)
                {
                    KillTimer(gRaceTimer[0]);
                }
                gRaceTimer[0] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 0);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_BeachFront_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_MOUNT_CHILLAD:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Mount chillad race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_MountChillad_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(495, gRace_MountChillad_Spawns[randomspawn][0], gRace_MountChillad_Spawns[randomspawn][1], gRace_MountChillad_Spawns[randomspawn][2], gRace_MountChillad_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_MountChillad_Checkpoints[0][0], gRace_MountChillad_Checkpoints[0][1], gRace_MountChillad_Checkpoints[0][2], gRace_MountChillad_Checkpoints[1][0], gRace_MountChillad_Checkpoints[1][1], gRace_MountChillad_Checkpoints[1][2], 10.0);

            if(gRaceStarted[1])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[1] = true;

                if(gRaceTimer[1] != -1)
                {
                    KillTimer(gRaceTimer[1]);
                }
                gRaceTimer[1] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 1);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Mount Chillad Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_MountChillad_Spawns), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_FREE_WHEEL:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Free wheel race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_FreeWheel_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(480, gRace_FreeWheel_Spawns[randomspawn][0], gRace_FreeWheel_Spawns[randomspawn][1], gRace_FreeWheel_Spawns[randomspawn][2], gRace_FreeWheel_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_FreeWheel_Checkpoints[0][0], gRace_FreeWheel_Checkpoints[0][1], gRace_FreeWheel_Checkpoints[0][2], gRace_FreeWheel_Checkpoints[1][0], gRace_FreeWheel_Checkpoints[1][1], gRace_FreeWheel_Checkpoints[1][2], 10.0);

            if(gRaceStarted[2])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[2] = true;

                if(gRaceTimer[2] != -1)
                {
                    KillTimer(gRaceTimer[2]);
                }
                gRaceTimer[2] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 2);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Free Wheel Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_FreeWheel_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_LS_RACE:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> L.S. race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_LSRace_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(541, gRace_LSRace_Spawns[randomspawn][0], gRace_LSRace_Spawns[randomspawn][1], gRace_LSRace_Spawns[randomspawn][2], gRace_LSRace_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_LSRace_Checkpoints[0][0], gRace_LSRace_Checkpoints[0][1], gRace_LSRace_Checkpoints[0][2], gRace_LSRace_Checkpoints[1][0], gRace_LSRace_Checkpoints[1][1], gRace_LSRace_Checkpoints[1][2], 10.0);

            if(gRaceStarted[3])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[3] = true;

                if(gRaceTimer[3] != -1)
                {
                    KillTimer(gRaceTimer[3]);
                }
                gRaceTimer[3] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 3);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "L.S. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LSRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_LV_RACE:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> L.V. race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_LVRace_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(429, gRace_LVRace_Spawns[randomspawn][0], gRace_LVRace_Spawns[randomspawn][1], gRace_LVRace_Spawns[randomspawn][2], gRace_LVRace_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_LVRace_Checkpoints[0][0], gRace_LVRace_Checkpoints[0][1], gRace_LVRace_Checkpoints[0][2], gRace_LVRace_Checkpoints[1][0], gRace_LVRace_Checkpoints[1][1], gRace_LVRace_Checkpoints[1][2], 10.0);

            if(gRaceStarted[4])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[4] = true;

                if(gRaceTimer[4] != -1)
                {
                    KillTimer(gRaceTimer[4]);
                }
                gRaceTimer[4] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 4);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "L.V. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LVRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_SF_RACE:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> S.F. race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_SFRace_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(506, gRace_SFRace_Spawns[randomspawn][0], gRace_SFRace_Spawns[randomspawn][1], gRace_SFRace_Spawns[randomspawn][2], gRace_SFRace_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_SFRace_Checkpoints[0][0], gRace_SFRace_Checkpoints[0][1], gRace_SFRace_Checkpoints[0][2], gRace_SFRace_Checkpoints[1][0], gRace_SFRace_Checkpoints[1][1], gRace_SFRace_Checkpoints[1][2], 10.0);

            if(gRaceStarted[5])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[5] = true;

                if(gRaceTimer[5] != -1)
                {
                    KillTimer(gRaceTimer[5]);
                }
                gRaceTimer[5] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 5);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "S.F. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_SFRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_OIL_REFINARY:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Oil refinary race");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to win the race, get in the car and reach the last CP first !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, 8, 100000);

			new randomspawn = random(sizeof(gRace_OilRefinary_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(468, gRace_OilRefinary_Spawns[randomspawn][0], gRace_OilRefinary_Spawns[randomspawn][1], gRace_OilRefinary_Spawns[randomspawn][2], gRace_OilRefinary_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

			SetPlayerRaceCheckpoint(playerid, 0, gRace_OilRefinary_Checkpoints[0][0], gRace_OilRefinary_Checkpoints[0][1], gRace_OilRefinary_Checkpoints[0][2], gRace_OilRefinary_Checkpoints[1][0], gRace_OilRefinary_Checkpoints[1][1], gRace_OilRefinary_Checkpoints[1][2], 10.0);

            if(gRaceStarted[6])
            {
                GameTextForPlayer(playerid, "~b~~h~~h~~h~Race has already started~n~~b~~h~~h~~h~You are late !", 5000, 3);
            }
            else
            {
                gRaceStarted[6] = true;

                if(gRaceTimer[6] != -1)
                {
                    KillTimer(gRaceTimer[6]);
                }
                gRaceTimer[6] = SetTimerEx("OnRaceStart", (5 * 1000), false, "i", 6);

                GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay near your spawn to~n~~b~~h~~h~~h~participate in race", 7000, 3);
            }

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Oil Refinary Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_OilRefinary_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_AIR_DERBY:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Air Derby");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to survive and push other cars to let them fall !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

            new randomspawn = random(sizeof(gDerby_Air_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(gDialog_DerbyCars[random(sizeof(gDialog_DerbyCars))], gDerby_Air_Spawns[randomspawn][0], gDerby_Air_Spawns[randomspawn][1], gDerby_Air_Spawns[randomspawn][2], 0.0, .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Air Derby~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_AIR_DERBY_2:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Air Derby 2");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to survive and push other cars to let them fall !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

            new randomspawn = random(sizeof(gDerby_Air2_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(gDialog_DerbyCars[random(sizeof(gDialog_DerbyCars))], gDerby_Air2_Spawns[randomspawn][0], gDerby_Air2_Spawns[randomspawn][1], gDerby_Air2_Spawns[randomspawn][2], 0.0, .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Air Derby 2~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
		case MODE_PARK_DERBY:
        {
            PlayerTextDrawShow(playerid, gUser[playerid][U_MODE_TD]);

			HidePlayerModeMenu(playerid);

			SendClientMessage(playerid, COLOR_LIME, "> Park Derby");
			SendClientMessage(playerid, COLOR_LIME, "> Your mission is to survive and push other cars to let them fall !");

			SetPlayerInterior(playerid, 0);

			ResetPlayerWeapons(playerid);

            SetPlayerHealth(playerid, 100000000.0);
            SetPlayerArmour(playerid, 0.0);

            new randomspawn = random(sizeof(gDerby_Park_Spawns));
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
			gUser[playerid][U_VEHICLE] = CreateVehicle(gDialog_DerbyCars[random(sizeof(gDialog_DerbyCars))], gDerby_Park_Spawns[randomspawn][0], gDerby_Park_Spawns[randomspawn][1], gDerby_Park_Spawns[randomspawn][2], gDerby_Park_Spawns[randomspawn][3], .worldid = gUser[playerid][U_MODE], .interiorid = GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    format(string, sizeof(string), "Park Derby~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
	    }
	    case MODE_FREEROAM:
	    {
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid, 100.0);
	        if(gUser[playerid][U_GOD])
			{
				SetPlayerHealth(playerid, FLOAT_INFINITY);
				SendClientMessage(playerid, COLOR_LIME, "> GODMODE: Enabled "WHITE"[/god]");
	        }
			else
			{
				SetPlayerHealth(playerid, 100.0);
				SendClientMessage(playerid, COLOR_LIME, "> GODMODE: Disabled "WHITE"[/god]");

				for(new i; i < 5; i++)
				{
					if(gUser[playerid][U_WEAPONS][i] > 0 || gUser[playerid][U_WEAPONS][i] < 47)
					{
						GivePlayerWeapon(playerid, gUser[playerid][U_WEAPONS][i], 100000);
					}
	        	}
	        }
	        if(gUser[playerid][U_MEGA_JUMP])
			{
				SendClientMessage(playerid, COLOR_LIME, "> MEGAJUMP: Enabled "WHITE"[/jump]");
	        }
			else
			{
				SendClientMessage(playerid, COLOR_LIME, "> MEGAJUMP: Disabled "WHITE"[/jump]");
			}

			new random_spawn_index;
	        switch(gUser[playerid][U_SPAWN])
	        {
	            case SPAWN_LOS_SANTOS:
	            {
	                random_spawn_index = random(sizeof(gRandomSpawns_LosSantos));
					SetPlayerPos(playerid, gRandomSpawns_LosSantos[random_spawn_index][0], gRandomSpawns_LosSantos[random_spawn_index][1], gRandomSpawns_LosSantos[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gRandomSpawns_LosSantos[random_spawn_index][3]);
	            }
	            case SPAWN_LAS_VENTURAS:
	            {
	                random_spawn_index = random(sizeof(gRandomSpawns_LasVenturas));
					SetPlayerPos(playerid, gRandomSpawns_LasVenturas[random_spawn_index][0], gRandomSpawns_LasVenturas[random_spawn_index][1], gRandomSpawns_LasVenturas[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gRandomSpawns_LasVenturas[random_spawn_index][3]);
	            }
	            case SPAWN_SAN_FIERRO:
	            {
	                random_spawn_index = random(sizeof(gRandomSpawns_SanFierro));
					SetPlayerPos(playerid, gRandomSpawns_SanFierro[random_spawn_index][0], gRandomSpawns_SanFierro[random_spawn_index][1], gRandomSpawns_SanFierro[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gRandomSpawns_SanFierro[random_spawn_index][3]);
	            }
	            case SPAWN_ARMY_BASES:
	            {
	                random_spawn_index = random(sizeof(gArmySpawns));
					SetPlayerPos(playerid, gArmySpawns[random_spawn_index][0], gArmySpawns[random_spawn_index][1], gArmySpawns[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gArmySpawns[random_spawn_index][3]);
	            }
	            case SPAWN_MEDICAL_DEPARTMENTS:
	            {
	                random_spawn_index = random(sizeof(gMedicalSpawns));
					SetPlayerPos(playerid, gMedicalSpawns[random_spawn_index][0], gMedicalSpawns[random_spawn_index][1], gMedicalSpawns[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gMedicalSpawns[random_spawn_index][3]);
	            }
	            case SPAWN_POLICE_DEPARTMENTS:
	            {
	                random_spawn_index = random(sizeof(gPoliceSpawns));
					SetPlayerPos(playerid, gPoliceSpawns[random_spawn_index][0], gPoliceSpawns[random_spawn_index][1], gPoliceSpawns[random_spawn_index][2]);
					SetPlayerFacingAngle(playerid, gPoliceSpawns[random_spawn_index][3]);
	            }
	            default: // Custom spawn
	            {
					SetPlayerPos(playerid, gUser[playerid][U_POS][0], gUser[playerid][U_POS][1], gUser[playerid][U_POS][2]);
					SetPlayerFacingAngle(playerid, gUser[playerid][U_POS][3]);
					
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Custom Spawn ~r~!~n~~b~~h~~h~~h~Type /Respawn to change spawn", 5000, 3);
	            }
	        }
	    }
	}
	return 1;
}
// RP Commands
CMD:do(playerid, params[])
{
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /do [Text]");
	format(totalstring, 90, "%s (( %s ))",params[0], NAMEGET(playerid));
	ProxDetectorNew(playerid,30.0,COLOR_PURPLE,totalstring);
	return true;
}

CMD:try(playerid, params[])
{
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /try [Text]");
	new temptryrand = random(2);
	if(temptryrand == 1) format(totalstring, 90, "%s tried %s {1CEF00}| successful", NAMEGET(playerid),params[0]);
	else format(totalstring, 90, "%s tried %s {FF0000}| unsuccessful", NAMEGET(playerid),params[0]);
	ProxDetectorNew(playerid,30.0,COLOR_PURPLE,totalstring);
	return true;
}

CMD:me(playerid, params[])
{
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Usage: /me [Text]");
	format(totalstring, 90, "%s %s", NAMEGET(playerid),params[0]);
	ProxDetectorNew(playerid,30.0,COLOR_PURPLE,totalstring);
	SetPlayerChatBubble(playerid, params[0], COLOR_PURPLE, 30.0, 7000);
	return true;
}

stock ProxDetectorNew(playerid,Float:Radi=10.0,color,text[])
{
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	for(new i;i<MAX_PLAYERS;i++)
	{
		if(!IsPlayerConnected(i)) continue; //
		if(IsPlayerInRangeOfPoint(i,Radi,pos[0],pos[1],pos[2]))
		{
			if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid) && GetPlayerInterior(playerid) == GetPlayerInterior(i))SendClientMessage(i,color,text);
		}
	}
}

stock NAMEGET(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid,name,sizeof(name));
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if(name[i] == '_') name[i] = ' ';
    }
    return name;
}

CMD:piss(playerid, params[])
{
	new string[64];
	SetPlayerSpecialAction(playerid, 68);
	format(string, 64, "%s is pissing", NAMEGET(playerid));
	ProxDetectorNew(playerid,25.0,COLOR_PURPLE,string);
	return true;
}
CMD:masturbate(playerid, params[])
{
	new string[64];
	format(string, 64, "%s masturbates", NAMEGET(playerid));
	ProxDetectorNew(playerid,25.0,COLOR_PURPLE,string);
	ApplyAnimation(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);
	PlayerPlaySound(playerid,20803,0.0,0.0,0.0);
	return true;
}

CMD:rphelp(playerid,params[])return cmd_rcommands(playerid,params);
CMD:rcmds(playerid,params[])return cmd_rcommands(playerid,params);
CMD:rcommands(playerid, params[])
{
	SendClientMessage(playerid, COLOR_PURPLE, "         .::Server RP Commands::.");
	SendClientMessage(playerid, COLOR_WHITE, ".::/me, /do, /try, /masturbate, /piss::.");
	return true;
}
//-------------------------------------------

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_CITY)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_LOS_SANTOS;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~Los Santos", 5000, 3);
	            }
	            case 1:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_LAS_VENTURAS;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~Las Venturas", 5000, 3);
	            }
	            case 2:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_SAN_FIERRO;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~San Fierro", 5000, 3);
	            }
	            case 3:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_ARMY_BASES;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~Army Bases", 5000, 3);
	            }
	            case 4:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_MEDICAL_DEPARTMENTS;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~Medical Departments", 5000, 3);
	            }
	            case 5:
	            {
					gUser[playerid][U_SPAWN] = SPAWN_POLICE_DEPARTMENTS;
					GameTextForPlayer(playerid, "~b~~h~~h~~h~Spawned changed to~n~~b~~h~~h~~h~Police Departments", 5000, 3);
	            }
	        }
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	    }
	}
	
	if(dialogid == DIALOG_WEAPONS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
				{
				    SetupPrevModelDialog(playerid, 0.0, 0.0, 0.0, 3.0);
					ShowPlayerDialog(playerid, DIALOG_WEAPONS + 1, DIALOG_STYLE_PREVMODEL, "Weapons List", gDialog_Weapons, "Select", "Back");
	            }
				case 1:
				{
				    new dialogstr[536];
				    strcat(dialogstr, "Weapon slot\tWeapon\n");
				    
				    new string[156];
				    for(new i; i < 5; i++)
				    {
				    	format(string, sizeof(string), "Slot %i\t%s\n", i, ReturnWeaponName(gUser[playerid][U_WEAPONS][i]));
				    	strcat(dialogstr, string);
					}
					ShowPlayerDialog(playerid, DIALOG_WEAPONS + 2, DIALOG_STYLE_TABLIST_HEADERS, "Weapons List", dialogstr, "Select", "Back");
	        	}
	        	case 2: ShowPlayerDialog(playerid, DIALOG_WEAPONS + 4, DIALOG_STYLE_LIST, "Tools List", "Nutter Tools\nThug Tools\nProfessional Tools", "Select", "Back");
	        }
		}
	}

	if(dialogid == DIALOG_WEAPONS + 1)
	{
	    if(! response)
	    {
	        return cmd_w(playerid);
		}
		else
	    {
			GivePlayerWeapon(playerid, GetModelWeaponID(gDialog_Weapons[listitem]), 100000);

			new string[98];
			format(string, sizeof(string), "~b~~h~~h~~h~%s", ReturnWeaponName(GetModelWeaponID(gDialog_Weapons[listitem])));
			GameTextForPlayer(playerid, string, 5000, 3);
			
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		}
	}
	
	if(dialogid == DIALOG_WEAPONS + 2)
	{
	    if(! response)
	    {
	        return cmd_w(playerid);
	    }
	    else
	    {
			gUser[playerid][U_LISTITEM] = listitem;
	
			SetupPrevModelDialog(playerid, 0.0, 0.0, 0.0, 3.0);
			ShowPlayerDialog(playerid, DIALOG_WEAPONS + 3, DIALOG_STYLE_PREVMODEL, "Spawn Weapons List", gDialog_Weapons, "Select", "Back");
		}
	}
	
	if(dialogid == DIALOG_WEAPONS + 3)
	{
	    if(! response)
	    {
	        return OnDialogResponse(playerid, DIALOG_WEAPONS, 1, 1, "N/A");
	    }
	    else
	    {
			gUser[playerid][U_WEAPONS][gUser[playerid][U_LISTITEM]] = GetModelWeaponID(gDialog_Weapons[listitem]);
			
			new string[156];
			format(string, sizeof(string), "~b~~h~~h~~h~%s~n~~b~~h~~h~~h~Set for slot ~w~~h~%i", ReturnWeaponName(GetModelWeaponID(gDialog_Weapons[listitem])), gUser[playerid][U_LISTITEM]);
			GameTextForPlayer(playerid, string, 5000, 3);
			
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		}
	}
	
	if(dialogid == DIALOG_WEAPONS + 4)
	{
	    if(! response)
	    {
	        return cmd_w(playerid);
	    }
	    else
	    {
			switch(listitem)
			{
				case 0:
				{
				    ResetPlayerWeapons(playerid);
					GivePlayerWeapon(playerid, 9, 100000);
					GivePlayerWeapon(playerid, 23, 100000);
					GivePlayerWeapon(playerid, 27, 100000);
					GivePlayerWeapon(playerid, 32, 100000);
					GivePlayerWeapon(playerid, 31, 100000);
					GivePlayerWeapon(playerid, 34, 100000);

				    GameTextForPlayer(playerid, "~b~~h~~h~~h~Nutter Tools", 5000, 3);
				}
				case 1:
				{
				    ResetPlayerWeapons(playerid);
					GivePlayerWeapon(playerid, 1, 100000);
					GivePlayerWeapon(playerid, 5, 100000);
					GivePlayerWeapon(playerid, 25, 100000);
					GivePlayerWeapon(playerid, 28, 100000);
					GivePlayerWeapon(playerid, 30, 100000);
					GivePlayerWeapon(playerid, 33, 100000);
					GivePlayerWeapon(playerid, 41, 100000);

				    GameTextForPlayer(playerid, "~b~~h~~h~~h~Thug Tools", 5000, 3);
				}
				case 2:
				{
				    ResetPlayerWeapons(playerid);
					GivePlayerWeapon(playerid, 4, 100000);
					GivePlayerWeapon(playerid, 24, 100000);
					GivePlayerWeapon(playerid, 26, 100000);
					GivePlayerWeapon(playerid, 32, 100000);
					GivePlayerWeapon(playerid, 31, 100000);
					GivePlayerWeapon(playerid, 37, 100000);
					GivePlayerWeapon(playerid, 42, 100000);

				    GameTextForPlayer(playerid, "~b~~h~~h~~h~Professional Tools", 5000, 3);
				}
			}
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		}
	}

	if(dialogid == DIALOG_VEHICLES)
	{
	    if(response)
	    {
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);

			new Float:pos[4];
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		    GetPlayerFacingAngle(playerid, pos[3]);

			if(IsPlayerInAnyVehicle(playerid)) SetPlayerPos(playerid, pos[0] + 3.0, pos[1], pos[2]);//ejected!

			new color[2];
			color[0] = random(255);
			color[1] = random(255);

			gUser[playerid][U_VEHICLE] = CreateVehicle(gDialog_Vehicles[listitem], pos[0] + 1.0, pos[1], pos[2], pos[3], color[0], color[1], -1);
		    SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
		    LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
		    PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

			GameTextForPlayer(playerid, "~b~~h~~h~~h~Vehicle Spawned", 5000, 3);
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	    }
	}
	
	if(dialogid == DIALOG_SKINS)
	{
	    if(response)
	    {
			SetPlayerSkin(playerid, gDialog_Skins[listitem]);
			gUser[playerid][U_SKIN] = gDialog_Skins[listitem];
			
			new string[145];
			format(string, sizeof(string), "~b~~h~~h~~h~Skin Changed to ~w~~h~%i", gDialog_Skins[listitem]);
			GameTextForPlayer(playerid, string, 5000, 3);

			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	    }
	}
	
	if(dialogid == DIALOG_DUEL_WEAPON)
	{
	    if(response)
	    {
	        new target = gUser[playerid][U_DUEL_OPPONENT];
	        
	        new weaponid;
	        switch(listitem)
			{
				case 0: weaponid = 9;
				case 1: weaponid = 16;
				case 2: weaponid = 17;
				case 3: weaponid = 18;
				case 4: weaponid = 22;
				case 5: weaponid = 23;
				case 6: weaponid = 24;
				case 7: weaponid = 25;
				case 8: weaponid = 26;
				case 9: weaponid = 27;
				case 10: weaponid = 28;
				case 11: weaponid = 29;
				case 12: weaponid = 30;
				case 13: weaponid = 31;
				case 14: weaponid = 32;
				case 15: weaponid = 33;
				case 16: weaponid = 34;
				case 17: weaponid = 37;
				default: weaponid = 24;
			}
			gUser[playerid][U_DUEL_WEAPON] = weaponid;
			gUser[target][U_DUEL_WEAPON] = weaponid;

	        
            if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

            if(gUser[target][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~Player not in freeroam", 5000, 3);

			if(! IsPlayerSpawned(target)) return GameTextForPlayer(playerid, "~r~Player not spawned", 5000, 3);

			if(gUser[playerid][U_DUEL_BET] != 0 && GetPlayerMoney(playerid) < gUser[playerid][U_DUEL_BET]) return GameTextForPlayer(playerid, "~r~You don't have enough money", 5000, 3);

			new string[256];
			format(string, sizeof(string), "> You have send a duel request to %s[%i] with weapon %s, bet $%i.", ReturnPlayerName(gUser[playerid][U_DUEL_OPPONENT]), gUser[playerid][U_DUEL_OPPONENT], ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]), gUser[playerid][U_DUEL_BET]);
		    SendClientMessage(playerid, COLOR_LIME, string);
		    
		    GameTextForPlayer(playerid, "~b~~h~~h~~h~Waiting player to respond...", 5000, 3);

	        format(string, sizeof(string), "You have recieved a duel request from "LIME"%s[%i]\n\n"WHITE"Bet money: "CORAL"$%i\n"WHITE"Weapon: "CORAL"%s", ReturnPlayerName(playerid), playerid, gUser[playerid][U_DUEL_BET], ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]));
	        ShowPlayerDialog(gUser[playerid][U_DUEL_OPPONENT], DIALOG_DUEL, DIALOG_STYLE_MSGBOX, "Duel request!", string, "Accept", "Ignore");
	    }
	}

	if(dialogid == DIALOG_DUEL)
	{
	    if(! response)
	    {
	        new target = gUser[playerid][U_DUEL_OPPONENT];

		    GameTextForPlayer(playerid, "~r~Duel request ignored !", 5000, 3);
	        SendClientMessage(target, COLOR_RED, "> Your duel request was ignored !! Try some next time !!");

	        gUser[target][U_MODE] = MODE_FREEROAM;
	        gUser[target][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	        gUser[target][U_DUEL_WEAPON] = 0;
	        gUser[target][U_DUEL_BET] = 0;

	        gUser[playerid][U_MODE] = MODE_FREEROAM;
	        gUser[playerid][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	        gUser[playerid][U_DUEL_WEAPON] = 0;
	        gUser[playerid][U_DUEL_BET] = 0;
	    }
	    if(response)
	    {
            new target = gUser[playerid][U_DUEL_OPPONENT];

			if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

            if(gUser[target][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~Player not in freeroam", 5000, 3);

			if(! IsPlayerSpawned(target)) return GameTextForPlayer(playerid, "~r~Player not spawned", 5000, 3);

			if(gUser[playerid][U_DUEL_BET] != 0 && GetPlayerMoney(playerid) < gUser[playerid][U_DUEL_BET]) return GameTextForPlayer(playerid, "~r~You don't have enough money", 5000, 3);

			ResetPlayerWeapons(playerid);
			GivePlayerWeapon(playerid, gUser[target][U_DUEL_WEAPON], 100000);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 100.0);
			GameTextForPlayer(playerid, "~r~~h~~h~~h~Go !!", 3000, 6);
			SetPlayerTeam(playerid, NO_TEAM);

			ResetPlayerWeapons(target);
			GivePlayerWeapon(target, gUser[target][U_DUEL_WEAPON], 100000);
			SetPlayerHealth(target, 100.0);
			SetPlayerArmour(target, 100.0);
			GameTextForPlayer(target, "~r~~h~~h~~h~Go !!", 3000, 6);
			SetPlayerTeam(target, NO_TEAM);

			switch(random(3))
			{
			    case 0:
			    {
					SetPlayerPos(playerid, -1404.067, 1270.3706, 1042.8672);
					SetPlayerInterior(playerid, 16);
					SetPlayerVirtualWorld(playerid, playerid);

					SetPlayerPos(target, -1395.067, 1261.3706, 1042.8672);
					SetPlayerInterior(target, 16);
					SetPlayerVirtualWorld(target, playerid);
				}
			    case 1:
			    {
					SetPlayerPos(playerid, 1353.407,2188.155,11.02344);
					SetPlayerInterior(playerid, 0);
					SetPlayerVirtualWorld(playerid, playerid);

					SetPlayerPos(target, 1346.255,2142.843,11.01563);
					SetPlayerInterior(target, 0);
					SetPlayerVirtualWorld(target, playerid);
				}
			    case 2:
			    {
					SetPlayerPos(playerid, -1041.037,1078.729,1347.678);
					SetPlayerInterior(playerid, 10);
					SetPlayerVirtualWorld(playerid, playerid);
					SetPlayerFacingAngle(playerid, 135);

					SetPlayerPos(target, -1018.061,1052.502,1346.327);
					SetPlayerInterior(target, 10);
					SetPlayerVirtualWorld(target, playerid);
					SetPlayerFacingAngle(target, 45);
				}
			}

			new string[144];
			format(string, sizeof(string), "A duel has begun b/w %s and %s [weapon: %s, bet: $%i]", ReturnPlayerName(playerid), ReturnPlayerName(target), ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]), gUser[playerid][U_DUEL_BET]);
			SendClientMessageToAll(COLOR_AQUA, string);

	        gUser[target][U_MODE] = MODE_DUEL;
	        gUser[playerid][U_MODE] = MODE_DUEL;
			return 1;
	    }
	}

	if(dialogid == DIALOG_OTHERS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_party(playerid);
	            case 1: cmd_chillard(playerid);
	            case 2: cmd_pd(playerid);
	            case 3: cmd_bank(playerid);
	            case 4: cmd_room(playerid);
	            case 5: cmd_area51(playerid);
	            case 6: cmd_ee(playerid);
	            case 7: cmd_beach(playerid);
	            case 8: cmd_pirate(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_HOTSPOTS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_bowl(playerid);
	            case 1: cmd_tube(playerid);
	            case 2: cmd_trampoline(playerid);
	            case 3: cmd_dune(playerid);
	            case 4: cmd_megajump(playerid);
	            case 5: cmd_joker(playerid);
	            case 6: cmd_scale(playerid);
	            case 7: cmd_wtg(playerid);
	            case 8: cmd_wtg2(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_ROLLERCOASTERS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_rc(playerid);
	            case 1: cmd_rc2(playerid);
	            case 2: cmd_rc3(playerid);
	            case 3: cmd_rc4(playerid);
	            case 4: cmd_rc5(playerid);
	            case 5: cmd_rc6(playerid);
	            case 6: cmd_rc7(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_DRIFTS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_driftisland(playerid);
	            case 1: cmd_drift(playerid);
	            case 2: cmd_drift2(playerid);
	            case 3: cmd_drift3(playerid);
	            case 4: cmd_drift4(playerid);
	            case 5: cmd_drift5(playerid);
	            case 6: cmd_driftship(playerid);
	            case 7: cmd_driftpool(playerid);
	            case 8: cmd_driftbox(playerid);
	            case 9: cmd_driftway(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_STUNTS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_aa(playerid);
	            case 1: cmd_ls(playerid);
	            case 2: cmd_lv(playerid);
	            case 3: cmd_sf(playerid);
	            case 4: cmd_mc(playerid);
	            case 5: cmd_park(playerid);
	            case 6: cmd_park2(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_JUMPS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_bigjump(playerid);
	            case 1: cmd_heavyjump(playerid);
	            case 2: cmd_highjump(playerid);
	            case 3: cmd_skyfall(playerid);
	            case 4: cmd_jumbo(playerid);
	            case 5: cmd_away(playerid);
	            case 6: cmd_over(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_GARAGES)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_locolow(playerid);
	            case 1: cmd_paynspray(playerid);
	            case 2: cmd_wheelarc(playerid);
	            case 3: cmd_transfender(playerid);
	        }
	    }
	}
	
	if(dialogid == DIALOG_BASEJUMPS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_base1(playerid);
	            case 1: cmd_base2(playerid);
	            case 2: cmd_base3(playerid);
	            case 3: cmd_base4(playerid);
	            case 4: cmd_base5(playerid);
	            case 5: cmd_base6(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_DEATHMATCH)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_minigun(playerid);
	            case 1: cmd_moneybag(playerid);
	            case 2: cmd_glass(playerid);
	            case 3: cmd_rpg(playerid);
	            case 4: cmd_battlefield(playerid);
	            case 5: cmd_jetfight(playerid);
	            case 6: cmd_oneshotkill(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_TEAM_DEATHMATCH)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_gangwar(playerid);
	            case 1: cmd_sniper(playerid);
	            case 2: cmd_jungle(playerid);
	        }
	    }
	}

	if(dialogid == DIALOG_RACES)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_beachfront(playerid);
	            case 1: cmd_chillad(playerid);
	            case 2: cmd_freewheel(playerid);
	            case 3: cmd_lsrace(playerid);
	            case 4: cmd_lvrace(playerid);
	            case 5: cmd_sfrace(playerid);
	            case 6: cmd_oilrace(playerid);
	        }
	    }
	}
	
	if(dialogid == DIALOG_DERBYS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_airderby(playerid);
	            case 1: cmd_airderby2(playerid);
	            case 2: cmd_parkderby(playerid);
	        }
	    }
	}
	
	if(dialogid == DIALOG_TEAMS)
	{
	    if(! response)
	    {
	        if(gUser[playerid][U_TEAM] == NO_TEAM)
	        {
		    	switch(gUser[playerid][U_MODE])
		        {
		            case MODE_GANGWAR:
		            {
		            	switch(random(3))
				        {
				            case 0:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 0;
								GameTextForPlayer(playerid, "~g~Grove Family~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
				            case 1:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 1;
								GameTextForPlayer(playerid, "~p~Ballas Family~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
				            case 2:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 2;
								GameTextForPlayer(playerid, "~b~~h~~h~~h~Azetecas Family~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
						}
		            }
		            case MODE_SNIPER:
		            {
		            	switch(random(2))
				        {
				            case 0:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 0;
								GameTextForPlayer(playerid, "~r~Red Team~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
				            case 1:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 1;
								GameTextForPlayer(playerid, "~b~Blue Team~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
						}
		            }
		            case MODE_JUNGLE:
		            {
		            	switch(random(2))
				        {
				            case 0:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 0;
								GameTextForPlayer(playerid, "~g~~h~~h~Criminals Team~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
				            case 1:
				            {
				                SetCameraBehindPlayer(playerid);
				                gUser[playerid][U_TEAM] = 1;
								GameTextForPlayer(playerid, "~b~~h~~h~Cops Team~n~~w~~h~Auto Assigned !", 5000, 3);
								CallLocalFunction("OnPlayerSpawn", "i", playerid);
				            }
						}
		            }
	            }
			}
			else
			{
			    SetCameraBehindPlayer(playerid);
			}
	    }
	    if(response)
	    {
	        switch(gUser[playerid][U_MODE])
	        {
	            case MODE_GANGWAR:
	            {
			    	switch(listitem)
			        {
			            case 0:
			            {
			                SetCameraBehindPlayer(playerid);
			                gUser[playerid][U_TEAM] = 0;
							GameTextForPlayer(playerid, "~g~Grove Family", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
			            }
			            case 1:
			            {
			                SetCameraBehindPlayer(playerid);
			                gUser[playerid][U_TEAM] = 1;
							GameTextForPlayer(playerid, "~p~Ballas Family", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
			            }
			            case 2:
			            {
			                SetCameraBehindPlayer(playerid);
			                gUser[playerid][U_TEAM] = 2;
							GameTextForPlayer(playerid, "~b~~h~~h~~h~Azetecas Family", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
			            }
					}
				}
		        case MODE_SNIPER:
		        {
         			switch(listitem)
				    {
				    	case 0:
				       	{
				         	SetCameraBehindPlayer(playerid);
				            gUser[playerid][U_TEAM] = 0;
							GameTextForPlayer(playerid, "~r~Red Team", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
       					}
				        case 1:
				        {
				            SetCameraBehindPlayer(playerid);
				            gUser[playerid][U_TEAM] = 1;
							GameTextForPlayer(playerid, "~b~Blue Team", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
			            }
					}
	            }
		        case MODE_JUNGLE:
		        {
         			switch(listitem)
				    {
				    	case 0:
				       	{
				         	SetCameraBehindPlayer(playerid);
				            gUser[playerid][U_TEAM] = 0;
							GameTextForPlayer(playerid, "~g~~h~~h~Criminals Team", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
       					}
				        case 1:
				        {
				            SetCameraBehindPlayer(playerid);
				            gUser[playerid][U_TEAM] = 1;
							GameTextForPlayer(playerid, "~b~~h~~h~Cops Team", 5000, 3);
							CallLocalFunction("OnPlayerSpawn", "i", playerid);
			            }
					}
	            }
			}
	    }
	}
	
	if(dialogid == DIALOG_TIME)
	{
	    if(response)
		{
		    switch(listitem)
		    {
		    	case 0:
				{
				 	SetPlayerTime(playerid, 7, 0);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Morning",5000,3);
            	}
            	case 1:
            	{
 	        	 	SetPlayerTime(playerid, 12, 0);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Mid day",5000,3);
            	}
            	case 2:
            	{
				 	SetPlayerTime(playerid, 16, 0);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Afternoon",5000,3);
            	}
            	case 3:
            	{
 	             	SetPlayerTime(playerid, 20, 0);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Evening",5000,3);
		   	 	}
            	case 4:
            	{
 	             	SetPlayerTime(playerid, 0, 0);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Midnight",5000,3);
            	}
            }
		}
	}
	
	if(dialogid == DIALOG_WEATHER)
	{
	    if(response)
		{
		    switch(listitem)
		    {
		    	case 0:
				{
					SetPlayerWeather(playerid, 5);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
					GameTextForPlayer(playerid,"~y~Blue Sky",5000,3);
				}
				case 1:
				{
 	        	 	SetPlayerWeather(playerid, 19);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Sand Strom",5000,3);
            	}
				case 2:
				{
				 	SetPlayerWeather(playerid, 8);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Thunderstrom",5000,3);
    			}
				case 3:
				{
 	             	SetPlayerWeather(playerid, 20);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Foggy",5000,3);
            	}
				case 4:
				{
 	             	SetPlayerWeather(playerid, 9);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Cloudy",5000,3);
    			}
				case 5:
				{
 	             	SetPlayerWeather(playerid, 16);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~High Tide",5000,3);
            	}
				case 6:
				{
 	             	SetPlayerWeather(playerid, 45);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Purple Sky",5000,3);
            	}
				case 7:
				{
 	             	SetPlayerWeather(playerid, 44);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Black/White Sky",5000,3);
            	}
				case 8:
				{
 	             	SetPlayerWeather(playerid, 22);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Green Sky",5000,3);
            	}
				case 9:
				{
 	             	SetPlayerWeather(playerid, 11);
			 		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
				 	GameTextForPlayer(playerid,"~y~Heat Wave",5000,3);
            	}
            }
		}
	}

	if(dialogid == DIALOG_PLAYER_COLORS)
	{
   		if(response)
   		{
   		    new color, colorname[18];
    		switch(listitem)
	       	{
	        	case 0: color = COLOR_BLACK, colorname = "Black";
	        	case 1: color = COLOR_WHITE, colorname = "White";
		       	case 2: color = COLOR_RED, colorname = "Red";
		       	case 3: color = COLOR_ORANGE, colorname = "Orange";
		       	case 4: color = COLOR_YELLOW, colorname = "Yellow";
		       	case 5: color = COLOR_GREEN, colorname = "Green";
		       	case 6: color = COLOR_BLUE, colorname = "Blue";
		       	case 7: color = COLOR_PURPLE, colorname = "Purple";
		       	case 8: color = COLOR_BROWN, colorname = "Brown";
		       	case 9: color = COLOR_PINK, colorname = "Pink";
			}
			SetPlayerColor(playerid, color);

			new string[144];
			format(string, sizeof(string), "~b~~h~~h~~h~Color changed to~n~~w~~h~%s", colorname);
			GameTextForPlayer(playerid, string, 5000, 3);
		}
	}
	
	if(dialogid == DIALOG_NEONS)
    {
    	if(response)
        {
        	switch(listitem)
            {
                case 0: //blue
				{
		            gUser[playerid][U_NEON][0] = CreateDynamicObject(18648,0,0,0,0,0,0);
		            gUser[playerid][U_NEON][1] = CreateDynamicObject(18648,0,0,0,0,0,0);
		            AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		            AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Blue neon attached", 5000, 3);
              	}
              	case 1: //red
              	{
					gUser[playerid][U_NEON][2] = CreateDynamicObject(18647,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][3] = CreateDynamicObject(18647,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][2], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][3], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Red neon attached", 5000, 3);
				}
				case 2: //green
                {
                   	gUser[playerid][U_NEON][4] = CreateDynamicObject(18649,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][5] = CreateDynamicObject(18649,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][4], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][5], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Green neon attached", 5000, 3);
              	}
                case 3: //white
               	{
				   	gUser[playerid][U_NEON][6] = CreateDynamicObject(18652,0,0,0,0,0,0);
       				gUser[playerid][U_NEON][7] = CreateDynamicObject(18652,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][6], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][7], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~White neon attached", 5000, 3);
				}
                case 4: //pink
                {
					gUser[playerid][U_NEON][8] = CreateDynamicObject(18651,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][9] = CreateDynamicObject(18651,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][8], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][9], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Pink neon attached", 5000, 3);
              	}
                case 5: //yellow
                {
					gUser[playerid][U_NEON][10] = CreateDynamicObject(18650,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][11] = CreateDynamicObject(18650,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][10], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][11], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Yellow neon attached", 5000, 3);
 				}
                case 6: //police
                {
					gUser[playerid][U_NEON][12] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][13] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][12], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][13], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Police neon attached", 5000, 3);
     			}
				case 7:
    			{
                    gUser[playerid][U_NEON][14] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][15] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][14], GetPlayerVehicleID(playerid), 0, -0.0, 0, 2.0, 2.0, 3.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][15], GetPlayerVehicleID(playerid), 0, -0.0, 0, 2.0, 2.0, 3.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Advance neon attached", 5000, 3);
       			}
                case 8: //back
               	{
				   	gUser[playerid][U_NEON][16] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][17] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][16], GetPlayerVehicleID(playerid), -0.0, -1.5, -1, 2.0, 2.0, 3.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][17], GetPlayerVehicleID(playerid), -0.0, -1.5, -1, 2.0, 2.0, 3.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Back neon attached", 5000, 3);
                }
               	case 9: //front
                {
					gUser[playerid][U_NEON][18] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][19] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][18], GetPlayerVehicleID(playerid), -0.0, 1.5, -0.6, 2.0, 2.0, 3.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][19], GetPlayerVehicleID(playerid), -0.0, 1.5, -0.6, 2.0, 2.0, 3.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Front neon attached", 5000, 3);
               	}
                case 10: //undercover
                {
                    gUser[playerid][U_NEON][20] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    gUser[playerid][U_NEON][21] = CreateDynamicObject(18646,0,0,0,0,0,0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][20], GetPlayerVehicleID(playerid), -0.5, -0.2, 0.8, 2.0, 2.0, 3.0);
                    AttachDynamicObjectToVehicle(gUser[playerid][U_NEON][21], GetPlayerVehicleID(playerid), -0.5, -0.2, 0.8, 2.0, 2.0, 3.0);

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Undercover neon attached", 5000, 3);
               	}
				case 11: //remove neon
    			{
    			    for(new i; i < 22; i++)
					{
						DestroyDynamicObject(gUser[playerid][U_NEON][i]);
            		}

		            GameTextForPlayer(playerid, "~b~~h~~h~~h~Neons removed", 5000, 3);
              	}
       		}
		}
	}
	
	if(dialogid == DIALOG_DERBY_VEHICLES)
	{
	    if(response)
	    {
			if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);

			new Float:pos[4];
			GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		    GetPlayerFacingAngle(playerid, pos[3]);

			if(IsPlayerInAnyVehicle(playerid)) SetPlayerPos(playerid, pos[0] + 3.0, pos[1], pos[2]);//ejected!

			new color[2];
			color[0] = random(255);
			color[1] = random(255);

			gUser[playerid][U_VEHICLE] = CreateVehicle(gDialog_Vehicles[listitem], pos[0] + 1.0, pos[1], pos[2], pos[3], color[0], color[1], -1);
		    SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
		    LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
		    PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

			GameTextForPlayer(playerid, "~b~~h~~h~~h~Vehicle Spawned", 5000, 3);
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	    }
	}
	
	if(dialogid == DIALOG_TELEPORTS)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0: cmd_stunts(playerid);
	            case 1: cmd_hotspots(playerid);
	            case 2: cmd_rollercoasters(playerid);
	            case 3: cmd_drifts(playerid);
	            case 4: cmd_jumps(playerid);
	            case 5: cmd_garages(playerid);
	            case 6: cmd_basejumps(playerid);
	            case 7: cmd_dm(playerid);
	            case 8: cmd_tdm(playerid);
	            case 9: cmd_races(playerid);
	            case 10: cmd_derbys(playerid);
	        }
	    }
	}

	switch(dialogid)
    {
        case DIALOG_ATTACH_INDEX_SELECTION:
        {
            if(response)
            {
        		gIndex[playerid] = listitem;

                if(IsPlayerAttachedObjectSlotUsed(playerid, listitem))
                {
        			ShowPlayerDialog(playerid, DIALOG_ATTACH_MODIFY, DIALOG_STYLE_LIST, "Attachments | Edit your slot:", "Edit object\nDelete object", "Select", "Back");
                }
                else
                {
                	ShowPlayerDialog(playerid, DIALOG_ATTACH_OBJECT_SELECTION, DIALOG_STYLE_LIST, "Attachments | Select your search method:", "Objects list (PREVIEW MODEL DIALOG)\nCustom object id", "Select", "Back");
				}
            }
		}
		case DIALOG_ATTACH_MODIFY:
		{
		    if(response)
		    {
		        if(! listitem)
				{
					EditAttachedObject(playerid, gIndex[playerid]);
        		}
				else
				{
					RemovePlayerAttachedObject(playerid, gIndex[playerid]);
		    	}
            	gIndex[playerid] = -1;
		    }
		    else
		    {
		        return cmd_attachments(playerid, "");
		    }
		}
		case DIALOG_ATTACH_OBJECT_SELECTION:
		{
            if(! response)
            {
		        return cmd_attachments(playerid, "");
            }
            else
            {
                if(! listitem) ShowPlayerDialog(playerid, DIALOG_ATTACH_OBJECTS_LIST, DIALOG_STYLE_PREVMODEL, "Attachments | Explore your object:", gAttachmentObjectsList, "Select", "Back");
                else ShowPlayerDialog(playerid, DIALOG_ATTACH_CUSTOM_OBJECT, DIALOG_STYLE_INPUT, "Attachments | Input your object id:", "Put your custom objectid below, You can also take help from ''http://wiki.sa-mp.com''.", "Select", "Back");
            }
		}
		case DIALOG_ATTACH_OBJECTS_LIST:
		{
            if(! response)
            {
		        return OnDialogResponse(playerid, DIALOG_ATTACH_INDEX_SELECTION, 1, gIndex[playerid], "");
            }
			else
			{
			    gObject[playerid] = gAttachmentObjectsList[listitem];

			    new dialogstr[356];
				new str[56];
                for(new i; i < sizeof(gAttachmentBones); i++)
                {
                	format(str, sizeof(str), "%s\n", gAttachmentBones[i]);
                    strcat(dialogstr, str);
                }
                ShowPlayerDialog(playerid, DIALOG_ATTACH_BONE_SELECTION, DIALOG_STYLE_LIST, "Attachments | Select attachment bone:", dialogstr, "Select", "Back");
			}
		}
		case DIALOG_ATTACH_CUSTOM_OBJECT:
		{
            if(! response)
            {
		        return OnDialogResponse(playerid, DIALOG_ATTACH_INDEX_SELECTION, 1, gIndex[playerid], "");
            }
            else
            {
                new object;
               	if(sscanf(inputtext, "i", object))
  				{
  				    GameTextForPlayer(playerid, "~r~Invalid object id", 5000, 3);
				  	return OnDialogResponse(playerid, DIALOG_ATTACH_OBJECT_SELECTION, 1, 1, "");
               	}

                gObject[playerid] = object;

                new dialogstr[356];
				new str[56];
                for(new i; i < sizeof(gAttachmentBones); i++)
                {
                	format(str, sizeof(str), "%s\n", gAttachmentBones[i]);
                    strcat(dialogstr, str);
                }
                ShowPlayerDialog(playerid, DIALOG_ATTACH_BONE_SELECTION, DIALOG_STYLE_LIST, "Attachments | Select attachment bone:", dialogstr, "Select", "Back");
            }
		}
		case DIALOG_ATTACH_BONE_SELECTION:
		{
            if(! response)
            {
		        return OnDialogResponse(playerid, DIALOG_ATTACH_INDEX_SELECTION, 1, gIndex[playerid], "");
            }
            else
            {
                SetPlayerAttachedObject(playerid, gIndex[playerid], gObject[playerid], (listitem + 1));
                EditAttachedObject(playerid, gIndex[playerid]);

                GameTextForPlayer(playerid, "~w~~h~Hold ~y~~h~SPACE ~w~~h~ and move ~y~~h~MOUSE~n~~w~~h~to view from either sides", 5000, 3);

                gIndex[playerid] = -1;
				gObject[playerid] = INVALID_OBJECT_ID;
            }
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
    SetPlayerAttachedObject(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
    return 1;
}

//-------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
    for(new i; i < 22; i++)
	{
		DestroyObject(gUser[playerid][U_NEON][i]);
	}
            		
	new string[145];
	if(gUser[playerid][U_MODE] == MODE_DUEL)
	{
		new target = gUser[playerid][U_DUEL_OPPONENT];

	    GivePlayerMoney(target, gUser[playerid][U_DUEL_BET]);
	    GivePlayerMoney(playerid, - gUser[playerid][U_DUEL_BET]);
	    SpawnPlayer(target);

		GameTextForPlayer(target, "~g~Winner !", 5000, 3);
		GameTextForPlayer(playerid, "~r~Loser !", 5000, 3);
		
	    format(string, sizeof(string), "%s has won the duel against opponent %s [weapon: %s, bet: $%i]", ReturnPlayerName(target), ReturnPlayerName(playerid), ReturnWeaponName(gUser[playerid][U_DUEL_WEAPON]), gUser[playerid][U_DUEL_BET]);
	    SendClientMessageToAll(COLOR_AQUA, string);

        gUser[target][U_MODE] = MODE_FREEROAM;
	    gUser[target][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
	    gUser[target][U_DUEL_WEAPON] = 0;
	    gUser[target][U_DUEL_BET] = 0;

        gUser[playerid][U_MODE] = MODE_FREEROAM;
        gUser[playerid][U_DUEL_OPPONENT] = INVALID_PLAYER_ID;
        gUser[playerid][U_DUEL_WEAPON] = 0;
        gUser[playerid][U_DUEL_BET] = 0;
	}
	
	//money bag droping
	if(playerid == gServer[S_MONEYBAG_PLAYER])
	{
		RemovePlayerAttachedObject(playerid, 1);

	    new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    gServer[S_MONEYBAG_PICKUP] = CreateDynamicPickup(1550, 1, x, y, z, MODE_MONEYBAG);
		gServer[S_MONEYBAG_PLAYER] = INVALID_PLAYER_ID;

		foreach(new i : Player)
  		{
	  		if(gUser[i][U_MODE] == MODE_MONEYBAG)
	  		{
				format(string, sizeof(string), "~r~%s(%d) have lost the~n~~r~money bag", ReturnPlayerName(playerid), playerid);
	  			GameTextForPlayer(i, string, 5000, 3);
			}
		}
	}
	
	if(killerid != INVALID_PLAYER_ID)
	{
		format(string, sizeof(string), "~r~%s(%i)~n~~w~~h~Killed you !", ReturnPlayerName(killerid), killerid);
		GameTextForPlayer(playerid, string, 5000, 3);
		
		format(string, sizeof(string), "~g~You killed~n~~w~~h~%s(%i)", ReturnPlayerName(playerid), playerid);
		GameTextForPlayer(killerid, string, 5000, 3);

		SetPlayerWantedLevel(killerid, GetPlayerWantedLevel(killerid) + 1);
		
		if(GetPlayerWantedLevel(killerid) == 6)
		{
		    GameTextForPlayer(killerid, "~b~~h~~h~~h~Most Wanted 6]", 5000, 3);
		    SetPlayerHealth(killerid, 100.0);
		    SetPlayerArmour(killerid, 100.0);

			format(string, sizeof(string), "%s(%i) is most wanted now", ReturnPlayerName(killerid), killerid);
			NotifyAll(string);
		}

		if(GetPlayerSpree(killerid) > 2)
		{
			format(string, sizeof(string), "%s(%i) is on a killing spree of %i kills", ReturnPlayerName(killerid), killerid, GetPlayerSpree(killerid));
			NotifyAll(string);
		}
		if(GetPlayerSpree(playerid) > 2)
		{
			format(string, sizeof(string), "%s(%i) has ended %s(%i)'s killing spree of %i kills", ReturnPlayerName(killerid), killerid, ReturnPlayerName(playerid), playerid, GetPlayerSpree(playerid));
			NotifyAll(string);
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if((GetTickCount() - gUser[playerid][U_LAST_TICK]) > (200 + GetPlayerPing(playerid)))
	{
	    gUser[playerid][U_LAST_TICK] = GetTickCount();
		switch(gUser[playerid][U_MODE_MENU])
		{
			case 0:
			{
				if(clickedid == gServer[S_BALL_TD][1])
				{
					HidePlayerModeMenu(playerid);
					return cmd_freeroam(playerid);
				}
				if(clickedid == gServer[S_BALL_TD][2])
				{
					HidePlayerModeMenu(playerid);
					return ShowPlayerModeMenu(playerid, 1);
				}
				else if(clickedid == gServer[S_BALL_TD][3])
				{
					HidePlayerModeMenu(playerid);
					return ShowPlayerModeMenu(playerid, 2);
				}
				else if(clickedid == gServer[S_BALL_TD][4])
				{
					HidePlayerModeMenu(playerid);
					return ShowPlayerModeMenu(playerid, 3);
				}
				else if(clickedid == gServer[S_BALL_TD][5])
				{
					HidePlayerModeMenu(playerid);
					return ShowPlayerModeMenu(playerid, 4);
				}
				else if(clickedid == gServer[S_BALL_TD][6])
				{
					HidePlayerModeMenu(playerid);
					return ShowPlayerModeMenu(playerid, 5);
				}
			    else if(clickedid == Text:INVALID_TEXT_DRAW)
				{
					return HidePlayerModeMenu(playerid);
				}
			}
			case 1:
			{
				if(clickedid == gServer[S_BALL_TD][0])
				{
					HidePlayerModeMenu(playerid);
					return cmd_minigun(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][1])
				{
					HidePlayerModeMenu(playerid);
					return cmd_moneybag(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][2])
				{
					HidePlayerModeMenu(playerid);
					return cmd_glass(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][3])
				{
					HidePlayerModeMenu(playerid);
					return cmd_rpg(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][4])
				{
					HidePlayerModeMenu(playerid);
					return cmd_battlefield(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][5])
				{
					HidePlayerModeMenu(playerid);
					return cmd_jetfight(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][6])
				{
					HidePlayerModeMenu(playerid);
					return cmd_oneshotkill(playerid);
				}
			    else if(clickedid == Text:INVALID_TEXT_DRAW)
				{
	    			return ShowPlayerModeMenu(playerid, 0);
				}
			}
			case 2:
			{
				if(clickedid == gServer[S_BALL_TD][2])
				{
					HidePlayerModeMenu(playerid);
					return cmd_gangwar(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][3])
				{
					HidePlayerModeMenu(playerid);
					return cmd_sniper(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][4])
				{
					HidePlayerModeMenu(playerid);
					return cmd_jungle(playerid);
				}
			    else if(clickedid == Text:INVALID_TEXT_DRAW)
				{
	    			return ShowPlayerModeMenu(playerid, 0);
				}
			}
			case 3:
			{
				if(clickedid == gServer[S_BALL_TD][0])
				{
					HidePlayerModeMenu(playerid);
					return cmd_beachfront(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][1])
				{
					HidePlayerModeMenu(playerid);
					return cmd_chillad(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][2])
				{
					HidePlayerModeMenu(playerid);
					return cmd_freewheel(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][3])
				{
					HidePlayerModeMenu(playerid);
					return cmd_lsrace(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][4])
				{
					HidePlayerModeMenu(playerid);
					return cmd_lvrace(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][5])
				{
					HidePlayerModeMenu(playerid);
					return cmd_sfrace(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][6])
				{
					HidePlayerModeMenu(playerid);
					return cmd_oilrace(playerid);
				}
			    else if(clickedid == Text:INVALID_TEXT_DRAW)
				{
	    			return ShowPlayerModeMenu(playerid, 0);
				}
			}
			case 4:
			{
				if(clickedid == gServer[S_BALL_TD][2])
				{
					HidePlayerModeMenu(playerid);
					return cmd_airderby(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][3])
				{
					HidePlayerModeMenu(playerid);
					return cmd_airderby2(playerid);
				}
				else if(clickedid == gServer[S_BALL_TD][4])
				{
					HidePlayerModeMenu(playerid);
					return cmd_parkderby(playerid);
				}
			    else if(clickedid == Text:INVALID_TEXT_DRAW)
				{
	    			return ShowPlayerModeMenu(playerid, 0);
				}
			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
    if(pickupid == gServer[S_MONEYBAG_PICKUP])
	{
	    if(gUser[playerid][U_MODE] == MODE_MONEYBAG)
	    {
	  		gServer[S_MONEYBAG_PLAYER] = playerid;
			RemovePlayerAttachedObject(playerid, 1);
			SetPlayerAttachedObject(playerid, 1, 1550, 1, 0.1, -0.3, 0, 0, 40, 0, 1, 1, 1);
	  		DestroyDynamicPickup(gServer[S_MONEYBAG_PICKUP]);

			new string[145];
  			foreach(new i : Player)
	  		{
		  		if(gUser[playerid][U_MODE] == MODE_MONEYBAG)
		  		{
					format(string, sizeof(string), "~g~%s(%d) have the~n~~g~money bag", ReturnPlayerName(playerid), playerid);
		  			GameTextForPlayer(i, string, 5000, 3);
				}
			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerUpdate(playerid)
{
	//moneybag DM
    if(gServer[S_MONEYBAG_PLAYER] == playerid)
	{
		GivePlayerMoney(playerid, 1);
	}
	
	if(gUser[playerid][U_GOD])
	{
	    if(gUser[playerid][U_MODE] == MODE_FREEROAM)
	   	{
		    if(GetPlayerWeapon(playerid) != 0)
		    {
		        ResetPlayerWeapons(playerid);
		        GameTextForPlayer(playerid, "~b~~h~~h~~h~You need to disabled /God mode~n~~b~~h~~h~~h~to spawn weapons", 5000, 3);
		    }
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	//entering and exiting RC vehicles
	if(gUser[playerid][U_MODE] == MODE_FREEROAM)
	{
		if(newkeys == KEY_SECONDARY_ATTACK)//If pressed ENTER
		{
		    new Float:x,
				Float:y,
				Float:z;
			for(new rc; rc < MAX_VEHICLES; rc++)//Looping all vehicles
			{
			    //Exiting a RC vehicle
			    if( GetPlayerState(playerid) == PLAYER_STATE_DRIVER//Checks weather player in vehicle
	          		&& GetPlayerVehicleID(playerid) == rc)//checks if the player is in the rc vehicle
			    {
			        new model;
				    model = GetVehicleModel(rc);
				    if(model == 441 ||
						model == 435 ||
						model == 450 ||
						model == 464 ||
						model == 465 ||
						model == 501 ||
						model == 564 ||
						model == 584 ||
						model == 590 ||
						model == 591 ||
						model == 594 ||
						model == 606 ||
						model == 607 ||
						model == 608 ||
						model == 610 ||
						model == 611)//Here you may enter all the vehile models which aren't exitable
				    {
				        if(CallLocalFunction("OnPlayerExitVehicle", "ii", playerid, rc))
					    {
							//Player will be ejected on request
							GetPlayerPos(playerid, x, y, z);
							SetPlayerPos(playerid, x, y, z + 1.0);
						}
					}
			    }

			    //Entering a RC vehicle
			    else if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)//Checks weather player is not in a vehicle
			    {
				    new Float:rX,
						Float:rY,
						Float:rZ,
						model;
				    GetVehiclePos(rc, rX, rY, rZ);
				    model = GetVehicleModel(rc);
				    if(model == 441 ||
						model == 435 ||
						model == 450 ||
						model == 464 ||
						model == 465 ||
						model == 501 ||
						model == 564 ||
						model == 584 ||
						model == 590 ||
						model == 591 ||
						model == 594 ||
						model == 606 ||
						model == 607 ||
						model == 608 ||
						model == 610 ||
						model == 611)//Here you may enter all the vehile models which aren't enterable
				    {
					    if(IsPlayerInRangeOfPoint(playerid, 2.5, rX, rY, rZ))//If the player is the range of the RC vehicle
						{
							new Float:float_speed,
								int_speed,
								driver_ = INVALID_PLAYER_ID;

							//speed calculations
							GetVehicleVelocity(rc, rX, rY, rZ);
							float_speed = floatsqroot( (rX * rX) + (rY * rY) + (rZ * rZ) ) * 136.666667;
							int_speed = floatround(float_speed, floatround_round);//This is the Integer type speed of vehicle

							for(new driver; driver < MAX_PLAYERS; driver++)
							{
							    if(GetPlayerVehicleID(driver) == rc && GetPlayerState(driver) == PLAYER_STATE_DRIVER)
								{
	                                driver_ = driver;//If there is a driver of the specified rc vehicle, his/her id will get stored
									continue;
								}
							}

							if(CallLocalFunction("OnPlayerEnterVehicle", "ii", playerid, rc))
					    	{
								if(driver_ == INVALID_PLAYER_ID)//There is no driver in the vehicle
								{
									if(int_speed < 6)//If the vehicle is having a negligable speed
									{
										PutPlayerInVehicle(playerid, rc, 0);
									}
									else if(int_speed > 5)//If the vehicle is not having negligable speed
									{
										ApplyAnimation(playerid, "PED", "getup", 4.0, 0,0, 0, 0,0);
									}
								}

								if(driver_ != INVALID_PLAYER_ID || driver_ < MAX_PLAYERS)//There is driver in the vehicle
								{
									if(int_speed < 5)//If the vehicle is having a negligable speed
									{
									    GetPlayerPos(driver_, x, y, z);
									    SetPlayerPos(driver_, x, y, z + 1.0);
									    GameTextForPlayer(driver_, "~r~Car Jacked !", 5000, 3);
										PutPlayerInVehicle(playerid, rc, 0);

									}
									else if(int_speed > 5)//If the vehicle is not having negligable speed
									{
										ApplyAnimation(playerid, "PED", "getup", 4.0, 0,0, 0, 0,0);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	//rc tiger rockets
	if(gUser[playerid][U_MODE] == MODE_BATTLEFIELD)
	{
		if(newkeys & KEY_FIRE)//If pressed LCTRL
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
		    if(GetVehicleModel(vehicleid) == 564)
		    {
		        if(IsValidObject(gUser[playerid][U_ROCKET_OBJECT])) return GameTextForPlayer(playerid, "~y~Reloading...", 2000, 3);
		        
		        if(gUser[playerid][U_ROCKET_TIMER] != -1) KillTimer(gUser[playerid][U_ROCKET_TIMER]);
		        gUser[playerid][U_ROCKET_TIMER] = SetTimerEx("OnPlayerShootRocket", 250, true, "i", playerid);
		        
		        new Float:pos[4];
		        GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
		        GetVehicleZAngle(vehicleid, pos[3]);

          		gUser[playerid][U_ROCKET_OBJECT] = CreateObject(345, pos[0], pos[1], pos[2], 0.0, 0.0, pos[3]);

				new Float:distance = 25.0;
				MoveObject(gUser[playerid][U_ROCKET_OBJECT], pos[0] + (distance * floatsin(-pos[3], degrees)), pos[1] + (distance * floatcos(-pos[3], degrees)), pos[2], 50.0);
				return 1;
		    }
		}
	}
	
	//mega jump
	if(gUser[playerid][U_MODE] == MODE_FREEROAM)
	{
	    if(! IsPlayerInAnyVehicle(playerid))
	    {
			if(newkeys & KEY_JUMP)
			{
				if(gUser[playerid][U_MEGA_JUMP])
				{
					new Float:Jump[3];
			        GetPlayerVelocity(playerid, Jump[0], Jump[1], Jump[2]);
			        SetPlayerVelocity(playerid, Jump[0], Jump[1], Jump[2] + 8.5);
				}
			}
		}
		else
		{
		    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    {
			    if(newkeys & KEY_YES)//high jump
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new Float:vel[3];
					GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
				  	SetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2] + 0.5);
				}
			    if(newkeys & KEY_NO)//repair
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					RepairVehicle(vehicleid);
					SetVehicleHealth(vehicleid, 1000.0);

					GameTextForPlayer(playerid, "~b~~h~~h~~h~Vehicle Repaired", 5000, 3);
				}
			    if(newkeys & KEY_CROUCH)//flip
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new Float:angle;
					GetVehicleZAngle(vehicleid, angle);
					SetVehicleZAngle(vehicleid, angle);

					SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);
				}
			    if(newkeys & KEY_SUBMISSION)//boost
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new Float:vel[3];
					GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
				  	SetVehicleVelocity(vehicleid, vel[0] * 1.5, vel[1] * 1.5, vel[2] * 1.5);
				}
			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_DRIVER)
	{
    	for(new i; i < 22; i++)
		{
			DestroyObject(gUser[playerid][U_NEON][i]);
		}
	
		switch(gUser[playerid][U_MODE])
		{
		    case MODE_AIR_DERBY:
		    {
				GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay in your car!", 5000, 3);
				return SpawnPlayer(playerid);
			}
		    case MODE_AIR_DERBY_2:
		    {
				GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay in your car!", 5000, 3);
				return SpawnPlayer(playerid);
			}
		    case MODE_PARK_DERBY:
		    {
				GameTextForPlayer(playerid, "~b~~h~~h~~h~Stay in your car!", 5000, 3);
				return SpawnPlayer(playerid);
			}
		}
		
    	gUser[playerid][U_VEHICLE_BONUS_INTERVAL] = 0;
		PlayerTextDrawHide(playerid, gUser[playerid][U_VEHICLE_BONUS_TD]);
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
    	gUser[playerid][U_VEHICLE_BONUS_INTERVAL] = 0;
		PlayerTextDrawShow(playerid, gUser[playerid][U_VEHICLE_BONUS_TD]);
	}
	return 1;
}

//-------------------------------------------

forward OnRaceStart(raceid);
public OnRaceStart(raceid)
{
	switch(raceid)
	{
		case 0:
		{
			//
			UpdateRacePositions(MODE_BEACH_FRONT);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_BEACH_FRONT)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_BeachFront_Spawns[0][0], gRace_BeachFront_Spawns[0][1], gRace_BeachFront_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn !", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Beach Front race has started, type /beachfront to join race.");
		}
		case 1:
		{
			//
			UpdateRacePositions(MODE_MOUNT_CHILLAD);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_MOUNT_CHILLAD)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_MountChillad_Spawns[0][0], gRace_MountChillad_Spawns[0][1], gRace_MountChillad_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Mount Chillad race has started, type /chillad to join race.");
		}
		case 2:
		{
			//
			UpdateRacePositions(MODE_FREE_WHEEL);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_FREE_WHEEL)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_FreeWheel_Spawns[0][0], gRace_FreeWheel_Spawns[0][1], gRace_FreeWheel_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Free Wheel race has started, type /freewheel to join race.");
		}
		case 3:
		{
			//
			UpdateRacePositions(MODE_LS_RACE);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_LS_RACE)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_LSRace_Spawns[0][0], gRace_LSRace_Spawns[0][1], gRace_LSRace_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> L.S. Race race has started, type /lsrace to join race.");
		}
		case 4:
		{
			//
			UpdateRacePositions(MODE_LV_RACE);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_LV_RACE)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_LVRace_Spawns[0][0], gRace_LVRace_Spawns[0][1], gRace_LVRace_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> L.V. Race race has started, type /lvrace to join race.");
		}
		case 5:
		{
			//
			UpdateRacePositions(MODE_SF_RACE);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_SF_RACE)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_SFRace_Spawns[0][0], gRace_SFRace_Spawns[0][1], gRace_SFRace_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> S.F. Race race has started, type /sfrace to join race.");
		}
		case 6:
		{
			//
			UpdateRacePositions(MODE_OIL_REFINARY);
			//
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_OIL_REFINARY)
			    {
			        if(IsPlayerInRangeOfPoint(i, 10.0, gRace_OilRefinary_Spawns[0][0], gRace_OilRefinary_Spawns[0][1], gRace_OilRefinary_Spawns[0][2]))
			        {
			        	GameTextForPlayer(i, "~g~~h~~h~~h~Go !", 5000, 6);
			        }
			        else
			        {
			            SpawnPlayer(i);

			        	GameTextForPlayer(i, "~r~You wern't near the spawn", 5000, 6);
			        }
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Oil Refinary race has started, type /oilrefinary to join race.");
		}
	}
	gRaceTimer[raceid] = SetTimerEx("OnRaceEnd", (5 * 60000), false, "i", raceid);
	return 1;
}

//-------------------------------------------

forward OnRaceEnd(raceid);
public OnRaceEnd(raceid)
{
	switch(raceid)
	{
		case 0:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_BEACH_FRONT)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Beach Front race has ended, type /beachfront to join race.");
		}
		case 1:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_MOUNT_CHILLAD)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Mount Chillad race has ended, type /chillad to join race.");
		}
		case 2:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_FREE_WHEEL)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Free Wheel race has ended, type /freewheel to join race.");
		}
		case 3:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_LS_RACE)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> L.S. Race race has ended, type /lsrace to join race.");
		}
		case 4:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_LV_RACE)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> L.V. Race race has ended, type /lvrace to join race.");
		}
		case 5:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_SF_RACE)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> S.F. Race race has ended, type /sfrace to join race.");
		}
		case 6:
		{
			foreach(new i : Player)
			{
			    if(gUser[i][U_MODE] == MODE_OIL_REFINARY)
			    {
			        SpawnPlayer(i);

			        GameTextForPlayer(i, "~b~~h~~h~~h~Race Ended ~g~!", 5000, 6);

			        gUser[i][U_RACE_CP] = 0;
			        gUser[i][U_RACE_POSITION] = 0;
			    }
			}

			SendClientMessageToAll(COLOR_YELLOW, "> Oil Refinary race has ended, type /oilrefinary to join race.");
		}
	}

	gRaceStarted[raceid] = false;
	return 1;
}

//-------------------------------------------

forward OnPlayerShootRocket(playerid);
public OnPlayerShootRocket(playerid)
{
	new Float:pos[3];
 	GetObjectPos(gUser[playerid][U_ROCKET_OBJECT], pos[0], pos[1], pos[2]);
 	
    foreach(new i : Player)
	{
 		if(i != playerid)
		{
			if(IsPlayerInRangeOfPoint(i, 5.0, pos[0], pos[1], pos[2]))
   			{
                CreateExplosion(pos[0], pos[1], pos[2], 11, 3.0);
                DestroyObject(gUser[playerid][U_ROCKET_OBJECT]);

                KillTimer(gUser[playerid][U_ROCKET_TIMER]);
                gUser[playerid][U_ROCKET_TIMER] = -1;
     			break;
    		}
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerEnterRaceCheckpoint(playerid)
{
	new string[144];
	
	switch(gUser[playerid][U_MODE])
	{
		case MODE_BEACH_FRONT:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_BeachFront_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [Beach Front]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "Beach Front Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
				
				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[0]);
					return gRaceTimer[0] = SetTimerEx("OnRaceEnd", 5000, false, "i", 0);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_BeachFront_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_BeachFront_Checkpoints[index][0], gRace_BeachFront_Checkpoints[index][1], gRace_BeachFront_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_BeachFront_Checkpoints[index][0], gRace_BeachFront_Checkpoints[index][1], gRace_BeachFront_Checkpoints[index][2], gRace_BeachFront_Checkpoints[(index + 1)][0], gRace_BeachFront_Checkpoints[(index + 1)][1], gRace_BeachFront_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_BeachFront_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_MOUNT_CHILLAD:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_MountChillad_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [Mount Chillad]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "Mount Chillad Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[1]);
					return gRaceTimer[1] = SetTimerEx("OnRaceEnd", 5000, false, "i", 1);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_MountChillad_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_MountChillad_Checkpoints[index][0], gRace_MountChillad_Checkpoints[index][1], gRace_MountChillad_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_MountChillad_Checkpoints[index][0], gRace_MountChillad_Checkpoints[index][1], gRace_MountChillad_Checkpoints[index][2], gRace_MountChillad_Checkpoints[(index + 1)][0], gRace_MountChillad_Checkpoints[(index + 1)][1], gRace_MountChillad_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_MountChillad_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_FREE_WHEEL:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_FreeWheel_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [Free Wheel]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "Free Wheel Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[2]);
					return gRaceTimer[2] = SetTimerEx("OnRaceEnd", 5000, false, "i", 2);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_FreeWheel_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_FreeWheel_Checkpoints[index][0], gRace_FreeWheel_Checkpoints[index][1], gRace_FreeWheel_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_FreeWheel_Checkpoints[index][0], gRace_FreeWheel_Checkpoints[index][1], gRace_FreeWheel_Checkpoints[index][2], gRace_FreeWheel_Checkpoints[(index + 1)][0], gRace_FreeWheel_Checkpoints[(index + 1)][1], gRace_FreeWheel_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_FreeWheel_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_LS_RACE:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_LSRace_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [L.S. Race]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "L.S. Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[3]);
					return gRaceTimer[3] = SetTimerEx("OnRaceEnd", 5000, false, "i", 3);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_LSRace_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_LSRace_Checkpoints[index][0], gRace_LSRace_Checkpoints[index][1], gRace_LSRace_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_LSRace_Checkpoints[index][0], gRace_LSRace_Checkpoints[index][1], gRace_LSRace_Checkpoints[index][2], gRace_LSRace_Checkpoints[(index + 1)][0], gRace_LSRace_Checkpoints[(index + 1)][1], gRace_LSRace_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LSRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_LV_RACE:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_LVRace_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [L.V. Race]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "L.V. Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[4]);
					return gRaceTimer[4] = SetTimerEx("OnRaceEnd", 5000, false, "i", 4);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_LVRace_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_LVRace_Checkpoints[index][0], gRace_LVRace_Checkpoints[index][1], gRace_LVRace_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_LVRace_Checkpoints[index][0], gRace_LVRace_Checkpoints[index][1], gRace_LVRace_Checkpoints[index][2], gRace_LVRace_Checkpoints[(index + 1)][0], gRace_LVRace_Checkpoints[(index + 1)][1], gRace_LVRace_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LVRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_SF_RACE:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_SFRace_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [S.F. Race]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "S.F. Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[5]);
					return gRaceTimer[5] = SetTimerEx("OnRaceEnd", 5000, false, "i", 5);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_SFRace_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_SFRace_Checkpoints[index][0], gRace_SFRace_Checkpoints[index][1], gRace_SFRace_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_SFRace_Checkpoints[index][0], gRace_SFRace_Checkpoints[index][1], gRace_SFRace_Checkpoints[index][2], gRace_SFRace_Checkpoints[(index + 1)][0], gRace_SFRace_Checkpoints[(index + 1)][1], gRace_SFRace_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_SFRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
		case MODE_OIL_REFINARY:
		{
			new players = CountEventPlayers(gUser[playerid][U_MODE]);
		    new index = (gUser[playerid][U_RACE_CP] + 1);

		    if(index >= (sizeof(gRace_OilRefinary_Checkpoints) - 1))
		    {
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

		        gUser[playerid][U_RACE_CP] = -1;

				format(string, sizeof(string), "> %s[%i] have finished the race [Oil Refinary Race]! [Position: %i/%i]", ReturnPlayerName(playerid), playerid, gUser[playerid][U_RACE_POSITION], players);

				new bool:left = true;
				foreach(new i : Player)
		        {
					SendClientMessageToAll(COLOR_YELLOW, string);

		            if(gUser[i][U_RACE_CP] != -1)
		            {
		                left = false;
						break;
		            }
		        }

				format(string, sizeof(string), "~g~~h~~h~~h~Finished Race !~n~~y~~h~~h~Position: %i/%i", gUser[playerid][U_RACE_POSITION], players);
				GameTextForPlayer(playerid, string, 5000, 6);

			    format(string, sizeof(string), "Oil Refinary Race ~y~[Finished]~n~~n~~w~~h~Players: %i/%i~n~~n~Position: ~g~%i/%i", players, 10, gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

				DisablePlayerRaceCheckpoint(playerid);

				if(left)
				{
					KillTimer(gRaceTimer[6]);
					return gRaceTimer[6] = SetTimerEx("OnRaceEnd", 5000, false, "i", 6);
				}
		    }
			else
			{
			    gUser[playerid][U_RACE_CP] = index;
				//
				UpdateRacePositions(gUser[playerid][U_MODE]);
				//

				if((index + 1) >= (sizeof(gRace_OilRefinary_Checkpoints) - 1))
				{
			    	SetPlayerRaceCheckpoint(playerid, 1, gRace_OilRefinary_Checkpoints[index][0], gRace_OilRefinary_Checkpoints[index][1], gRace_OilRefinary_Checkpoints[index][2], 0.0, 0.0, 0.0, 10.0);
				}
				else
				{
					SetPlayerRaceCheckpoint(playerid, 0, gRace_OilRefinary_Checkpoints[index][0], gRace_OilRefinary_Checkpoints[index][1], gRace_OilRefinary_Checkpoints[index][2], gRace_OilRefinary_Checkpoints[(index + 1)][0], gRace_OilRefinary_Checkpoints[(index + 1)][1], gRace_OilRefinary_Checkpoints[(index + 1)][2], 10.0);
				}

			    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_OilRefinary_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
				PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);
			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnObjectMoved(objectid)
{
	foreach(new i : Player)
	{
	    if(objectid == gUser[i][U_ROCKET_OBJECT])
        {
           	new Float:pos[3];

            GetObjectPos(objectid, pos[0], pos[1], pos[2]);
            CreateExplosion(pos[0], pos[1], pos[2], 11, 3.0);
            DestroyObject(objectid);

            KillTimer(gUser[i][U_ROCKET_TIMER]);
            gUser[i][U_ROCKET_TIMER] = -1;
        }
	}
	return 1;
}

//-------------------------------------------

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

//-------------------------------------------

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

//-------------------------------------------

public OnPlayerTimeUpdate(playerid)
{
	switch(gUser[playerid][U_MODE])
	{
	    case MODE_AIR_DERBY:
	    {
			if(IsPlayerInAnyVehicle(playerid))
		    {
      			new vehicleid = GetPlayerVehicleID(playerid);
	        	new Float:pos[3];
			    GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);

			    if(	pos[2] > 1001.0 + 30.0 ||
			        pos[2] < 1001.0 - 30.0)
				{
				    GameTextForPlayer(playerid, "~b~~h~~h~~h~You fell off!", 5000, 3);
					return SpawnPlayer(playerid);
				}
			}
	    }
	    case MODE_AIR_DERBY_2:
	    {
	        if(IsPlayerInAnyVehicle(playerid))
		    {
		    	new vehicleid = GetPlayerVehicleID(playerid);
   				new Float:pos[3];
			    GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);

		        if(	pos[2] > 952.0 + 51.0 + 30.0 ||
		            pos[2] < 952.0 + 51.0 - 30.0)
				{
				    GameTextForPlayer(playerid, "~b~~h~~h~~h~You fell off!", 5000, 3);
					return SpawnPlayer(playerid);
				}
			}
	    }
	    case MODE_PARK_DERBY:
	    {
	        if(IsPlayerInAnyVehicle(playerid))
	        {
	            new vehicleid = GetPlayerVehicleID(playerid);
		        new Float:pos[3];
		        GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);

		        if(	pos[2] > 7.0 + 50.0 ||
		            pos[2] < 7.0 - 5.0)
				{
				    GameTextForPlayer(playerid, "~b~~h~~h~~h~You fell off!", 5000, 3);
					return SpawnPlayer(playerid);
				}
			}
	    }
	}

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		gUser[playerid][U_VEHICLE_BONUS_INTERVAL] += 1;
		if(gUser[playerid][U_VEHICLE_BONUS_INTERVAL] > 10)
		{
			gUser[playerid][U_VEHICLE_BONUS_INTERVAL] = 0;

			switch(random(3))
			{
				case 0: PlayerTextDrawSetString(playerid, gUser[playerid][U_VEHICLE_BONUS_TD], "Press ~b~~k~~CONVERSATION_YES~ ~w~~h~for jump vehicle.");
				case 1: PlayerTextDrawSetString(playerid, gUser[playerid][U_VEHICLE_BONUS_TD], "Press ~b~~k~~TOGGLE_SUBMISSIONS~ ~w~~h~to boost vehicle.");
				case 2: PlayerTextDrawSetString(playerid, gUser[playerid][U_VEHICLE_BONUS_TD], "Press ~b~~k~~CONVERSATION_NO~ ~w~~h~to repair vehicle.");
				case 3: PlayerTextDrawSetString(playerid, gUser[playerid][U_VEHICLE_BONUS_TD], "Press ~b~~k~~VEHICLE_HORN~ ~w~~h~to flip vehicle.");
			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnTimeUpdate()
{
    if(gServer[S_TURF_ATTACKER] == NO_TEAM)//if war haven't started
	{
 		new attackers[3];
 		foreach(new i : Player)
 		{
 		    if(gUser[i][U_MODE] == MODE_GANGWAR)
 		    {
	 		    if(gUser[i][U_TEAM] != gServer[S_TURF_OWNER])
	 		    {
	 		        attackers[gUser[i][U_TEAM]] += 1;
	 		    }
 		    }
 		}
 		
 		for(new i; i < 3; i++)
		{
			if(attackers[i] > 1)
	 		{
	 		    gServer[S_TURF_ATTACKER] = i; //grove
	 		    gServer[S_TURF_TIME] = 2 * 60;

	 		    //start war
	 		    new color, attacker[25];
	 		    switch(i)
	 		    {
					case 0: color = ConvertColorTransparency(COLOR_GREEN, 150), attacker = "Grove Family";
					case 1: color = ConvertColorTransparency(COLOR_PURPLE, 150), attacker = "Ballas Family";
					case 2: color = ConvertColorTransparency(COLOR_CYAN, 150), attacker = "Azetecas Family";
	 		    }
	 		    
	 		    new owner[25];
	 		    switch(gServer[S_TURF_OWNER])
	 		    {
					case 0: owner = "Grove Family";
					case 1: owner = "Ballas Family";
					case 2: owner = "Azetecas Family";
	 		    }
	 		    
				GangZoneFlashForAll(gServer[S_TURF], color);
				
				new string[144];
				format(string, sizeof(string), "> %s have attacked %s's turf!", attacker, owner);
				foreach(new p : Player)
				{
				    if(gUser[p][U_MODE] == MODE_GANGWAR)
				    {
				    	SendClientMessage(p, COLOR_LIME, string);
				    }
				}
			}
		}
	}
	else//if war has started
	{
 		new attackers;
 		foreach(new i : Player)
 		{
 		    if(gUser[i][U_MODE] == MODE_GANGWAR)
 		    {
		 		if(gUser[i][U_TEAM] == gServer[S_TURF_ATTACKER])
	 		    {
	 		        attackers += 1;
	 		    }
 		    }
   		}

	 	//end war
	 	if(attackers < 2)
	 	{
	  		new attacker[25];
	 		switch(gServer[S_TURF_ATTACKER])
	 		{
				case 0: attacker = "Grove Family";
				case 1: attacker = "Ballas Family";
				case 2: attacker = "Azetecas Family";
		  	}

	 		new owner[25];
	 		switch(gServer[S_TURF_OWNER])
	 		{
				case 0: owner = "Grove Family";
				case 1: owner = "Ballas Family";
				case 2: owner = "Azetecas Family";
		  	}

			GangZoneStopFlashForAll(gServer[S_TURF]);

			new string[144];
			format(string, sizeof(string), "> %s failed to capture %s's turf!", attacker, owner);
			foreach(new p : Player)
			{
		 		if(gUser[p][U_MODE] == MODE_GANGWAR)
	    		{
		    		SendClientMessage(p, COLOR_LIME, string);
			    }
			}
		}
		else
		{
  			gServer[S_TURF_TIME] -= 1;
  			
  			if(gServer[S_TURF_TIME] < 1)
  			{
	 		    //end war (win)
	 		    new color, attacker[25];
	 		    switch(gServer[S_TURF_ATTACKER])
	 		    {
					case 0: color = ConvertColorTransparency(COLOR_GREEN, 150), attacker = "Grove Family";
					case 1: color = ConvertColorTransparency(COLOR_PURPLE, 150), attacker = "Ballas Family";
					case 2: color = ConvertColorTransparency(COLOR_CYAN, 150), attacker = "Azetecas Family";
	 		    }

	 		    new owner[25];
	 		    switch(gServer[S_TURF_OWNER])
	 		    {
					case 0: owner = "Grove Family";
					case 1: owner = "Ballas Family";
					case 2: owner = "Azetecas Family";
	 		    }

				GangZoneStopFlashForAll(gServer[S_TURF]);
				GangZoneShowForAll(gServer[S_TURF], color);

				new string[144];
				format(string, sizeof(string), "> %s successfully captured %s's turf!", attacker, owner);
				foreach(new p : Player)
				{
				    if(gUser[p][U_MODE] == MODE_GANGWAR)
				    {
				    	SendClientMessage(p, COLOR_LIME, string);
				    }
				}
				
				gServer[S_TURF_OWNER] = gServer[S_TURF_ATTACKER];
	 		    gServer[S_TURF_ATTACKER] = NO_TEAM;
	 		    gServer[S_TURF_TIME] = 0;
  			}
		}
	}
	return 1;
}

//-------------------------------------------

public OnPlayerText(playerid, text[])
{
   	SetPlayerChatBubble(playerid, text, 0xEEEEEEFF, 35.0, 10000);

	new string[145];
	format(string, sizeof(string), "%i> %s: "WHITE"%s", playerid, ReturnPlayerName(playerid), text);
	SendClientMessageToAll(GetPlayerColor(playerid), string);
	return 0;
}
//-------------------------------------------

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if(gUser[playerid][U_GOD])
	{
	    GameTextForPlayer(issuerid, "~b~~h~~h~~h~Player has god mode", 5000, 3);
	}
	if(IsPlayerPaused(playerid))
	{
	    GameTextForPlayer(issuerid, "~b~~h~~h~~h~Player is inactive", 5000, 3);
	}

	PlayerPlaySound(playerid, 6401, 0.0, 0.0, 10.0);
	return 1;
}

//-------------------------------------------

// INTERNAL FUNCTIONS...

GetModelWeaponID(weaponid)//this gives you the weapon id of the model specified; if its incorrect, then simply returns 0;
{
	switch(weaponid)
	{
	    case 331: return 1;
	    case 333: return 2;
	    case 334: return 3;
	    case 335: return 4;
	    case 336: return 5;
	    case 337: return 6;
	    case 338: return 7;
	    case 339: return 8;
	    case 341: return 9;
	    case 321: return 10;
	    case 322: return 11;
	    case 323: return 12;
	    case 324: return 13;
	    case 325: return 14;
	    case 326: return 15;
	    case 342: return 16;
	    case 343: return 17;
	    case 344: return 18;
	    case 346: return 22;
	    case 347: return 23;
	    case 348: return 24;
	    case 349: return 25;
	    case 350: return 26;
	    case 351: return 27;
	    case 352: return 28;
	    case 353: return 29;
	    case 355: return 30;
	    case 356: return 31;
	    case 372: return 32;
	    case 357: return 33;
	    case 358: return 34;
	    case 359: return 35;
	    case 360: return 36;
	    case 361: return 37;
	    case 362: return 38;
	    case 363: return 39;
	    case 364: return 40;
	    case 365: return 41;
	    case 366: return 42;
	    case 367: return 43;
	    case 368: return 44;
	    case 369: return 45;
	    case 371: return 46;
	}
	return 0;
}

ReturnWeaponName(weaponid)
{
	new weaponstr[45];
	switch(weaponid)
	{
	    case 0: weaponstr = "Fist";
	    case 18: weaponstr = "Molotov Cocktail";
        case 44: weaponstr = "Night Vision Goggles";
        case 45: weaponstr = "Thermal Goggles";
        default: GetWeaponName(weaponid, weaponstr, sizeof(weaponstr));
	}
	return weaponstr;
}

CountEventPlayers(event)
{
	new count = 0;
	foreach(new i : Player)
	{
 		if(gUser[i][U_MODE] == event)//if event id matches
   		{
     		count++;//add one to the count
	    }
	}
	return count;
}

CountDerbyAlivePlayers(derbyid)
{
	new count = 0;
	foreach(new i : Player)
	{
 		if(gUser[i][U_MODE] == derbyid)//if event id matches
   		{
   		    if(IsPlayerInAnyVehicle(i))
   		    {
     			count += 1;//add one to the count
     		}
	    }
	}
	return count;
}

TeleportPlayer(playerid, Float:x, Float:y, Float:z, Float:a, interiorid = 0, worldid = 0, text[] = "")
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	SetPlayerInterior(playerid, interiorid);
	SetPlayerVirtualWorld(playerid, worldid);

	if(	IsPlayerInAnyVehicle(playerid) &&
		GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    foreach(new i : Player)
	    {
	        if(	GetPlayerVehicleID(i) == vehicleid &&
				i != playerid)
			{
			    SetPlayerInterior(i, interiorid);
			    SetPlayerVirtualWorld(i, worldid);
			}
			
			LinkVehicleToInterior(vehicleid, interiorid);
			SetVehicleVirtualWorld(vehicleid, worldid);
			
			SetVehiclePos(vehicleid, x, y, z);
			SetVehicleZAngle(vehicleid, a);
	    }
	}
	else
	{
	    SetPlayerPos(playerid, x, y, z);
	    SetPlayerFacingAngle(playerid, a);
	}
	
	return GameTextForPlayer(playerid, text, 5000, 3);
}

ShowPlayerModeMenu(playerid, type = 0)
{
	gUser[playerid][U_MODE_MENU] = type;
	switch(type)
	{
	    case 0:
	    {
	        TextDrawShowForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][0]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][1]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][2]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][3]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][4]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][5]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][6]);

			new string[108];
			new players[7] = 0;
			foreach(new i : Player)
			{
			    switch(gUser[i][U_MODE])
			    {
			        case MODE_FREEROAM: players[0] += 1;
			        case MODE_MINIGUN,MODE_MONEYBAG,MODE_GLASS,MODE_RPG,MODE_BATTLEFIELD,MODE_JETFIGHT: players[1] += 1;
			        case MODE_GANGWAR,MODE_SNIPER,MODE_JUNGLE: players[2] += 1;
			        case MODE_BEACH_FRONT,MODE_MOUNT_CHILLAD,MODE_FREE_WHEEL,MODE_LS_RACE,MODE_LV_RACE,MODE_SF_RACE,MODE_OIL_REFINARY: players[3] += 1;
			        case MODE_AIR_DERBY,MODE_AIR_DERBY_2,MODE_PARK_DERBY: players[4] += 1;
			    }
			}

			//labels
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][0]);

			format(string, sizeof(string), "Freeroam~n~~g~~h~~h~~h~%i/%i", players[0], GetMaxPlayers());
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][1], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][1]);

			format(string, sizeof(string), "Deathmatch~n~~b~~h~~h~~h~%i/%i", players[1], 15 * 7);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][2], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][2]);

			format(string, sizeof(string), "Team Deathmatch~n~~b~~h~~h~~h~%i/%i", players[2], 20 * 3);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][3], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][3]);

			format(string, sizeof(string), "Race~n~~b~~h~~h~~h~%i/%i", players[3], 10 * 3);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][4], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][4]);

			format(string, sizeof(string), "Derby~n~~b~~h~~h~~h~%i/%i", players[4], 10 * 3);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][5], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][5]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][6]);

			//models
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][0]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][1], 18750);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][1], 90.0, 180.0, 0.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][1]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][2], 355);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][2], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][2]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][3], 1314);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][3], 0.0, 0.0, 0.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][3]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][4], 411);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][4], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][4]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][5], 1225);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][5], 0.0, 0.0, 100.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][5]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][6]);
	    }
	    case 1:
	    {
	        TextDrawShowForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][0]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][1]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][2]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][3]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][4]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][5]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][6]);

			new string[108];
			new players[7] = 0;
			foreach(new i : Player)
			{
			    switch(gUser[i][U_MODE])
			    {
			        case MODE_MINIGUN: players[0] += 1;
					case MODE_MONEYBAG: players[1] += 1;
					case MODE_GLASS: players[2] += 1;
					case MODE_RPG: players[3] += 1;
					case MODE_BATTLEFIELD: players[4] += 1;
					case MODE_JETFIGHT: players[5] += 1;
			        case MODE_ONESHOTKILL: players[6] += 1;
			    }
			}

			//labels
			format(string, sizeof(string), "Minigun Madness~n~~b~~h~~h~~h~%i/%i", players[0], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][0], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][0]);

			format(string, sizeof(string), "Moneybag Hunt~n~~b~~h~~h~~h~%i/%i", players[1], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][1], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][1]);

			format(string, sizeof(string), "Glass Deathmatch~n~~b~~h~~h~~h~%i/%i", players[2], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][2], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][2]);

			format(string, sizeof(string), "RPG Deathmatch~n~~b~~h~~h~~h~%i/%i", players[3], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][3], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][3]);

			format(string, sizeof(string), "RC-Battlefield~n~~b~~h~~h~~h~%i/%i", players[4], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][4], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][4]);

			format(string, sizeof(string), "Jetpack Fight~n~~b~~h~~h~~h~%i/%i", players[5], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][5], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][5]);
			
			format(string, sizeof(string), "One Shot Kill~n~~b~~h~~h~~h~%i/%i", players[6], 15);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][6], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][6]);

			//models
			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][0], 362);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][0], -16.0, 0.0, -55.0, 2.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][0]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][1], 1550);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][1], 0.0, 0.0, 0.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][1]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][2], 349);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][2], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][2]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][3], 359);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][3], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][3]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][4], 564);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][4], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][4]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][5], 371);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][5], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][5]);
			
			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][6], 348);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][6], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][6]);
	    }
	    case 2:
	    {
	        TextDrawShowForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][0]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][1]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][2]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][3]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][4]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][5]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][6]);

			new string[108];
			new players[3] = 0;
			foreach(new i : Player)
			{
			    switch(gUser[i][U_MODE])
			    {
			        case MODE_GANGWAR: players[0] += 1;
			        case MODE_SNIPER: players[1] += 1;
			        case MODE_JUNGLE: players[2] += 1;
			    }
			}

			//labels
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][0]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][1]);

			format(string, sizeof(string), "Gangwar~n~~b~~h~~h~~h~%i/%i", players[0], 20);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][2], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][2]);

			format(string, sizeof(string), "Sniper~n~~b~~h~~h~~h~%i/%i", players[1], 20);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][3], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][3]);

			format(string, sizeof(string), "Jungle Mode~n~~b~~h~~h~~h~%i/%i", players[2], 20);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][4], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][4]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][5]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][6]);

			//models
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][0]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][1]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][2], 14467);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][2], 0.0, 0.0, 0.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][2]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][3], 358);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][3], -16.0, 0.0, -55.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][3]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][4], 19306);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][4], 0.0, 0.0, 0.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][4]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][5]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][6]);
	    }
	    case 3:
	    {
	        TextDrawShowForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][0]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][1]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][2]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][3]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][4]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][5]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][6]);

			new string[108];
			new players[7] = 0;
			foreach(new i : Player)
			{
			    switch(gUser[i][U_MODE])
			    {
			        case MODE_BEACH_FRONT: players[0] += 1;
			        case MODE_MOUNT_CHILLAD: players[1] += 1;
			        case MODE_FREE_WHEEL: players[2] += 1;
			        case MODE_LS_RACE: players[3] += 1;
			        case MODE_LV_RACE: players[4] += 1;
			        case MODE_SF_RACE: players[5] += 1;
			        case MODE_OIL_REFINARY: players[6] += 1;
			    }
			}

			//labels
			format(string, sizeof(string), "Beach Front~n~~b~~h~~h~~h~%i/%i", players[0], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][0], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][0]);

			format(string, sizeof(string), "Mount Chillad~n~~b~~h~~h~~h~%i/%i", players[1], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][1], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][1]);

			format(string, sizeof(string), "Freewheel~n~~b~~h~~h~~h~%i/%i", players[2], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][2], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][2]);

			format(string, sizeof(string), "L.S. Race~n~~b~~h~~h~~h~%i/%i", players[3], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][3], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][3]);

			format(string, sizeof(string), "L.V. Race~n~~b~~h~~h~~h~%i/%i", players[4], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][4], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][4]);

			format(string, sizeof(string), "S.F. Race~n~~b~~h~~h~~h~%i/%i", players[5], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][5], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][5]);

			format(string, sizeof(string), "Oil Refinary~n~~b~~h~~h~~h~%i/%i", players[6], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][6], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][6]);

			//models
			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][0], 415);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][0], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][0]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][1], 495);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][1], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][1]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][2], 480);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][2], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][2]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][3], 541);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][3], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][3]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][4], 429);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][4], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][4]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][5], 506);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][5], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][5]);
			
			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][6], 468);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][6], 0.0, 0.0, 30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][6]);
	    }
	    case 4:
	    {
	        TextDrawShowForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][0]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][1]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][2]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][3]);
	        TextDrawShowForPlayer(playerid, gServer[S_BALL_TD][4]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][5]);
	        TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][6]);

			new string[108];
			new players[3] = 0;
			foreach(new i : Player)
			{
			    switch(gUser[i][U_MODE])
			    {
			        case MODE_AIR_DERBY: players[0] += 1;
			        case MODE_AIR_DERBY_2: players[1] += 1;
			        case MODE_PARK_DERBY: players[2] += 1;
			    }
			}

			//labels
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][0]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][1]);

			format(string, sizeof(string), "Air Derby~n~~b~~h~~h~~h~%i/%i", players[0], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][2], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][2]);

			format(string, sizeof(string), "Air Derby 2~n~~b~~h~~h~~h~%i/%i", players[1], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][3], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][3]);

			format(string, sizeof(string), "Demolision Derby~n~~b~~h~~h~~h~%i/%i", players[2], 10);
			PlayerTextDrawSetString(playerid, gUser[playerid][U_LABEL_TD][4], string);
			PlayerTextDrawShow(playerid, gUser[playerid][U_LABEL_TD][4]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][5]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][6]);

			//models
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][0]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][1]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][2], 400);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][2], 0.0, 0.0, -30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][2]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][3], 434);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][3], 0.0, 0.0, -30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][3]);

			PlayerTextDrawSetPreviewModel(playerid, gUser[playerid][U_MODEL_TD][4], 448);
			PlayerTextDrawSetPreviewRot(playerid, gUser[playerid][U_MODEL_TD][4], 0.0, 0.0, -30.0, 1.0);
			PlayerTextDrawShow(playerid, gUser[playerid][U_MODEL_TD][4]);

			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][5]);
			PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][6]);
	    }
	}
	return SelectTextDraw(playerid, COLOR_RED);
}

HidePlayerModeMenu(playerid)
{
	gUser[playerid][U_MODE_MENU] = -1;
	
	TextDrawHideForPlayer(playerid, gServer[S_BACKGROUND_TD]);

	for(new i; i < 7; i++)
	{
		TextDrawHideForPlayer(playerid, gServer[S_BALL_TD][i]);
		PlayerTextDrawHide(playerid, gUser[playerid][U_LABEL_TD][i]);
		PlayerTextDrawHide(playerid, gUser[playerid][U_MODEL_TD][i]);
	}
	return CancelSelectTextDraw(playerid);
}

//synchronize system, not 100% !!
SyncPlayer(playerid)
{
	new world = GetPlayerVirtualWorld(playerid);//store player virtual world in var
	new interior = GetPlayerInterior(playerid);//store player interior in var

	SetPlayerVirtualWorld(playerid, world + 1);//changing the world id
	SetPlayerInterior(playerid, interior + 1);//changeing the interior (+1)

	SetPlayerVirtualWorld(playerid, world);//reset to default world
	SetPlayerInterior(playerid, interior);//reset to default interior
	ClearAnimations(playerid);//clear anims
	return true;//sucess
}

GetVehicleModelIDFromName(vname[])
{
	for(new i = 0; i < 211; i++)
	{
		if(strfind(gVehicleNames[i], vname, true) != -1)
		return i + 400;
	}
	return -1;
}

NotifyAll(text[], expiretime = 10000)
{
	new slot = -1;
	for(new i = 0; i < 3; i++)
	{
	    if(gServer[S_NOTIFY_TIMER][i] == -1)
	    {
	        slot = i;
	        break;
	    }
	}
	if(slot == -1) slot = 0;

	if(gServer[S_NOTIFY_TIMER][slot] != -1) KillTimer(gServer[S_NOTIFY_TIMER][slot]);
	gServer[S_NOTIFY_TIMER][slot] = SetTimerEx("OnNotificationExpire", expiretime, false, "i", slot);
 	TextDrawSetString(gServer[S_NOTIFY_TD][slot], text);

	TextDrawShowForAll(gServer[S_NOTIFY_TD][slot]);
	return true;
}

forward OnNotificationExpire(slot);
public OnNotificationExpire(slot)
{
	gServer[S_NOTIFY_TIMER][slot] = -1;
 	TextDrawSetString(gServer[S_NOTIFY_TD][slot], "");
 	
	TextDrawHideForAll(gServer[S_NOTIFY_TD][slot]);
	return 1;
}

UpdateRacePositions(mode)
{
	new Float:closest = -1.0;
	new bool:added[10] = false;
 	new Float:distance = -1.0;
	new Float:pos[3];
 	new players = 0;
 	for(new p = 1; p < 11; p++)
	{
		foreach(new i : Player)
		{
		    if(gUser[i][U_MODE] == mode)
	        {
	            if(gUser[i][U_RACE_CP] == -1)
	            {
	                players += 1;
	                added[(p - 1)] = false;
	                continue;
	            }
			    if(closest == -1.0)
			    {
			        if(! added[(p - 1)])
			        {
				        GetPlayerPos(i, pos[0], pos[1], pos[2]);
				    	closest = GetPlayerDistanceFromPoint(i, pos[0], pos[1], pos[2]);

		                gUser[i][U_RACE_POSITION] = (p - players);
		                added[(p - 1)] = true;
	                }
		        }

			    distance = GetPlayerDistanceFromPoint(i, pos[0], pos[1], pos[2]);
	            if(distance < closest)
	            {
	                if(! added[(p - 1)])
	                {
	                	gUser[i][U_RACE_POSITION] = (p - players);
		                added[(p - 1)] = true;
	            	}
	            }
	        }
		}
	}
	return true;
}

//-------------------------------------------

// COMMANDS...

CMD:god(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(gUser[playerid][U_GOD])
	{
	    SetPlayerHealth(playerid, 100.0);
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Godmode ~w~~h~OFF", 5000, 3);
	}
	else
	{
	    SetPlayerHealth(playerid, FLOAT_INFINITY);
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Godmode ~w~~h~ON", 5000, 3);
	}
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	gUser[playerid][U_GOD] = (! gUser[playerid][U_GOD]);
	return 1;
}
CMD:godmode(playerid) return cmd_god(playerid);

CMD:mj(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(gUser[playerid][U_MEGA_JUMP])
	{
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Megajump ~w~~h~OFF", 5000, 3);
	}
	else
	{
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Megajump ~w~~h~ON", 5000, 3);
	}
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	gUser[playerid][U_MEGA_JUMP] = (! gUser[playerid][U_MEGA_JUMP]);
	return 1;
}
CMD:jump(playerid) return cmd_mj(playerid);

CMD:jetpack(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Jetpack spawned", 5000, 3);
	return 1;
}
CMD:jp(playerid) return cmd_jetpack(playerid);

CMD:spawn(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	GetPlayerPos(playerid, gUser[playerid][U_POS][0], gUser[playerid][U_POS][1], gUser[playerid][U_POS][2]);
	GetPlayerFacingAngle(playerid, gUser[playerid][U_POS][3]);
	
	gUser[playerid][U_SPAWN] = SPAWN_CUSTOM;

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~This is your new Spawn~n~~b~~h~~h~~h~Type /Respawn to change spawn", 5000, 3);
	return 1;
}

CMD:eject(playerid, params[])
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new target;
    if(sscanf(params, "u", target)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE~n~~w~~h~/eject (player)", 5000, 3);

	if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~player not conected", 5000, 3);

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You must be driver of a car", 5000, 3);

	if(GetPlayerVehicleID(target) != GetPlayerVehicleID(playerid)) return GameTextForPlayer(playerid, "~r~Player not in your vehicle", 5000, 3);

	new Float:pos[3];
	GetPlayerPos(target, pos[0], pos[1], pos[2]);
	SetPlayerPos(target, pos[0], pos[1], pos[2] + 3.0);
	PlayerPlaySound(target, 1057, 0.0, 0.0, 0.0);
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

	new string[144];
	format(string, sizeof(string), "> You have ejected %s[%i]'s from the vehicle.", ReturnPlayerName(target), target);
	SendClientMessage(playerid, COLOR_LIME, string);
	format(string, sizeof(string), "~b~~h~~h~~h~You have ejected %s[%i]", ReturnPlayerName(target), target);
	GameTextForPlayer(playerid, string, 5000, 3);
	format(string, sizeof(string), "> %s[%i] have ejected your from the vehicle.", ReturnPlayerName(playerid), playerid);
	SendClientMessage(target, COLOR_LIME, string);
	format(string, sizeof(string), "~b~~h~~h~~h~%s[%i] ejected you", ReturnPlayerName(playerid), playerid);
	GameTextForPlayer(target, string, 5000, 3);
	return 1;
}

CMD:repair(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You must be driver of a car", 5000, 3);

	RepairVehicle(GetPlayerVehicleID(playerid));
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Vehicle Repaired", 5000, 3);
  	SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
  	return 1;
}
CMD:fix(playerid) return cmd_repair(playerid);

CMD:nrg(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new Float:pos[4];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(playerid, pos[3]);

	if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
	gUser[playerid][U_VEHICLE] = CreateVehicle(522, pos[0], pos[1], pos[2] + 2.0, pos[3], random(255), random(255), -1);
	LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);
	
	GameTextForPlayer(playerid, "~b~~h~~h~~h~NRG-500 spawned", 5000, 3);
	return 1;
}

CMD:bullet(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new Float:pos[4];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(playerid, pos[3]);

	if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
	gUser[playerid][U_VEHICLE] = CreateVehicle(541, pos[0], pos[1], pos[2] + 2.0, pos[3], random(255), random(255), -1);
	LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Bullet spawned", 5000, 3);
	return 1;
}

CMD:infernus(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new Float:pos[4];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(playerid, pos[3]);

	if(IsValidVehicle(gUser[playerid][U_VEHICLE])) DestroyVehicle(gUser[playerid][U_VEHICLE]);
	gUser[playerid][U_VEHICLE] = CreateVehicle(411, pos[0], pos[1], pos[2] + 2.0, pos[3], random(255), random(255), -1);
	LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Infernus spawned", 5000, 3);
	return 1;
}

CMD:respawn(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);
	
	ShowPlayerDialog(playerid, DIALOG_CITY, DIALOG_STYLE_LIST, "Select your spawn city!", "Los Santos\nLas Venturas\nSan Fierro\nArmy Bases\nMedical Departments\nPolice Departments", "Select", "Close");
	return 1;
}

CMD:home(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	SpawnPlayer(playerid);
	return 1;
}

CMD:kill(playerid)
{
	SetPlayerArmour(playerid, 0.0);
	SetPlayerHealth(playerid, 0.0);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~You commited Suicide ~r~!", 5000, 3);
	return 1;
}

CMD:go(playerid, params[])
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new target;
	if(sscanf(params, "u", target)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE~n~~w~~h~/goto (player)", 5000, 3);

	if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

	if(target == playerid) return GameTextForPlayer(playerid, "~r~Can't teleport to yourself", 5000, 3);
	
	if(! gUser[target][U_GOTO]) return GameTextForPlayer(playerid, "~r~Player have disabled gotos", 5000, 3);

	new Float:pos[3];
	GetPlayerPos(target, pos[0], pos[1], pos[2]);
	
	SetPlayerInterior(playerid, GetPlayerInterior(target));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(target));
	
	if(GetPlayerState(playerid) == 2)
	{
		SetVehiclePos(GetPlayerVehicleID(playerid), pos[0] + 2.5, pos[1], pos[2]);
		LinkVehicleToInterior(GetPlayerVehicleID(playerid), GetPlayerInterior(target));
		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), GetPlayerVirtualWorld(target));
	}
	else SetPlayerPos(playerid, pos[0] + 2.0, pos[1], pos[2]);
	PlayerPlaySound(target, 1057, 0.0, 0.0, 0.0);
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

	new string[144];
	format(string, sizeof(string), "~b~~h~~h~~h~You have teleported to ~w~~h~%s[%i]", ReturnPlayerName(target), target);
	GameTextForPlayer(playerid, string, 5000, 3);
	format(string, sizeof(string), "> You have teleported to %s[%i]'s position.", ReturnPlayerName(target), target);
	SendClientMessage(playerid, COLOR_LIME, string);
	format(string, sizeof(string), "~w~~h~%s[%i] ~b~~h~~h~~h~teleported to you", ReturnPlayerName(playerid), playerid);
	GameTextForPlayer(target, string, 5000, 3);
	format(string, sizeof(string), "> %s[%i] have teleported to your position.", ReturnPlayerName(playerid), playerid);
	SendClientMessage(target, COLOR_LIME, string);
	return 1;
}
CMD:goto(playerid, params[]) return cmd_go(playerid, params);

CMD:gotos(playerid)
{
	if(gUser[playerid][U_GOTO])
	{
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Goto Mode ~w~~h~OFF", 5000, 3);
	}
	else
	{
	    GameTextForPlayer(playerid, "~b~~h~~h~~h~Goto Mode ~w~~h~ON", 5000, 3);
	}
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	gUser[playerid][U_GOTO] = (! gUser[playerid][U_GOTO]);
	return 1;
}
CMD:gos(playerid) return cmd_gotos(playerid);

CMD:w(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST, "Weapons configurations/spawner", "Weapons list\nSpawn Weapons\nTools", "Select", "Close");
	return 1;
}
CMD:weapons(playerid) return cmd_w(playerid);
CMD:weaps(playerid) return cmd_w(playerid);

CMD:v(playerid, params[])
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new vehicle[32], model, color[2];
	if(! sscanf(params, "s[32]I(-1)I(-1)", vehicle, color[0], color[1]))
	{
		if(isnumeric(vehicle)) 	model = strval(vehicle);
	    else 					model = GetVehicleModelIDFromName(vehicle);

		if(model < 400 || model > 611) return GameTextForPlayer(playerid, "~r~Invalid modelid~n~~r~Must be b/w 400-611", 5000, 3);

		new Float:pos[4];
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	    GetPlayerFacingAngle(playerid, pos[3]);

		if(IsPlayerInAnyVehicle(playerid)) SetPlayerPos(playerid, pos[0] + 3.0, pos[1], pos[2]);//ejected!

		if(color[0] == -1) color[0] = random(256);
		if(color[1] == -1) color[1] = random(256);

		if(gUser[playerid][U_VEHICLE] != -1) DestroyVehicle(gUser[playerid][U_VEHICLE]);//delete previous vehicle

		gUser[playerid][U_VEHICLE] = CreateVehicle(model, pos[0] + 3.0, pos[1], pos[2], pos[3], color[0], color[1], -1);
	    SetVehicleVirtualWorld(gUser[playerid][U_VEHICLE], GetPlayerVirtualWorld(playerid));
	    LinkVehicleToInterior(gUser[playerid][U_VEHICLE], GetPlayerInterior(playerid));
	    PutPlayerInVehicle(playerid, gUser[playerid][U_VEHICLE], 0);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

		GameTextForPlayer(playerid, "~b~~h~~h~~h~Vehicle Spawned", 5000, 3);
	}
	else
	{
		SetupPrevModelDialog(playerid, 0.0, 0.0, 0.0, 1.0);
		ShowPlayerDialog(playerid, DIALOG_VEHICLES, DIALOG_STYLE_PREVMODEL, "Vehicles spawner", gDialog_Vehicles, "Select", "Close");
	}
	return 1;
}
CMD:cars(playerid, params[]) return cmd_v(playerid, params);
CMD:vehicles(playerid, params[]) return cmd_v(playerid, params);
CMD:car(playerid, params[]) return cmd_v(playerid, params);

CMD:s(playerid, params[])
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);
	
	new skinid;
	if(! sscanf(params, "i", skinid))
	{
		if(skinid < 0 || skinid > 311) return GameTextForPlayer(playerid, "~r~Invalid skinid~n~~r~Must be b/w 0-311", 5000, 3);
		
		SetPlayerSkin(playerid, skinid);
		gUser[playerid][U_SKIN] = skinid;
		
		GameTextForPlayer(playerid, "~b~~h~~h~~h~Skin Changed", 5000, 3);
	}
	else
	{
		SetupPrevModelDialog(playerid, 0.0, 0.0, 0.0, 1.0);
		ShowPlayerDialog(playerid, DIALOG_SKINS, DIALOG_STYLE_PREVMODEL, "Skins spawner", gDialog_Skins, "Select", "Close");
	}
	return 1;
}
CMD:skins(playerid, params[]) return cmd_s(playerid, params);

CMD:minigun(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_MINIGUN) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);
	
	if(CountEventPlayers(MODE_MINIGUN) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);
	
	gUser[playerid][U_MODE] = MODE_MINIGUN;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Minigun Madness deathmatch [Total players: %i] (/minigun)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Minigun Madness deathmatch with %i other players! (/minigun)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Minigun Madness~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "Minigun Madness Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill other players with your minigun", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:moneybag(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_MONEYBAG) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_MONEYBAG) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_MONEYBAG;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Moneybag Hunt deathmatch [Total players: %i] (/moneybag)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Moneybag Hunt deathmatch with %i other players! (/moneybag)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Moneybag Hunt~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "Moneybag Hunt Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to steel moneybag and get as much money you can", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:glass(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_GLASS) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_GLASS) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_GLASS;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Glass deathmatch [Total players: %i] (/glass)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Glass deathmatch with %i other players! (/glass)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Glass Break~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "Glass Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to eliminate other players by destroying the glass and making them fall !", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:rpg(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_RPG) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_RPG) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_RPG;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined RPG deathmatch [Total players: %i] (/rpg)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined RPG deathmatch with %i other players! (/rpg)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~RPG madness~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "RPG Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill other players with your Rocket Launcher", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:battlefield(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_BATTLEFIELD) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_BATTLEFIELD) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_BATTLEFIELD;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined RC-Battlefield deathmatch [Total players: %i] (/battlefield)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined RC-Battlefield with %i other players! (/battlefield)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~RC Battlefield~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "RC-Battlefield Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to destroy other RC tigers. Shoot bombs with CTRL (key fire)!", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:jetfight(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_JETFIGHT) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_JETFIGHT) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_JETFIGHT;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Jetpack Fight deathmatch [Total players: %i] (/jetfight)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Jetpack Fight with %i other players! (/jetfight)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Jetpack Fight~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "Jetpack Fight Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill other players while on a jetpack", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:oneshotkill(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_ONESHOTKILL) return GameTextForPlayer(playerid, "~r~You are already in deathmatch", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_ONESHOTKILL) > 15) return GameTextForPlayer(playerid, "~r~Deathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_ONESHOTKILL;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Jetpack Fight deathmatch [Total players: %i] (/oneshotkill)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Jetpack Fight with %i other players! (/oneshotkill)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~One Shot Kill~n~~w~~h~Deathmatch", 5000, 3);

    format(string, sizeof(string), "One Shot Kill Deathmatch~n~~n~Players: %i/%i~n~~n~You mission is to assesinate other players silently with silenced 9mm", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:gangwar(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(gUser[playerid][U_MODE] == MODE_GANGWAR)
	{
 		HidePlayerModeMenu(playerid);

	 	SetPlayerCameraPos(playerid, 2348.9214, -1688.9951, 37.9441);
		SetPlayerCameraLookAt(playerid, 2348.3657, -1688.1655, 37.2641);
	 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
	 	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""GREEN"GROVE Family\n"PURPLE"BALLAS Family\n"CYAN"AZETECAS Family", "Select", "Close");
		return 1;
	}

	if(CountEventPlayers(MODE_GANGWAR) > 20) return GameTextForPlayer(playerid, "~r~Teamdeathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_GANGWAR;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Gangwar teamdeathmatch [Total players: %i] (/gangwar)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Gangwar teamdeathmatch with %i other players! (/gangwar)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Gangwar~n~~w~~h~Team Deathmatch", 5000, 3);

    format(string, sizeof(string), "Gangwar Teamdeathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill other gang members and capture the turf while staying in it with gang friends~n~~n~More of your gang members, more easy to capture!", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

 	HidePlayerModeMenu(playerid);

 	SetPlayerCameraPos(playerid, 2348.9214, -1688.9951, 37.9441);
	SetPlayerCameraLookAt(playerid, 2348.3657, -1688.1655, 37.2641);
 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
 	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""GREEN"GROVE Family\n"PURPLE"BALLAS Family\n"CYAN"AZETECAS Family", "Select", "Auto Assign");
	return 1;
}

CMD:sniper(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(gUser[playerid][U_MODE] == MODE_SNIPER)
	{
 		HidePlayerModeMenu(playerid);
 		
		SetPlayerCameraPos(playerid, 1130.5499, -1408.8926, 114.0169);
		SetPlayerCameraLookAt(playerid, 1130.4767, -1409.8884, 113.1869);
	 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
	 	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""RED"RED Team\n"BLUE"BLUE Team", "Select", "Close");
		return 1;
	}

	if(CountEventPlayers(MODE_SNIPER) > 20) return GameTextForPlayer(playerid, "~r~Teamdeathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_SNIPER;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Sniper teamdeathmatch [Total players: %i] (/sniper)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Sniper teamdeathmatch with %i other players! (/sniper)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Sniper~n~~w~~h~Team Deathmatch", 5000, 3);

    format(string, sizeof(string), "Sniper Teamdeathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill team members with Sniper or other weapons given!", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

 	HidePlayerModeMenu(playerid);

	SetPlayerCameraPos(playerid, 1130.5499, -1408.8926, 114.0169);
	SetPlayerCameraLookAt(playerid, 1130.4767, -1409.8884, 113.1869);
 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""RED"RED Team\n"BLUE"BLUE Team", "Select", "Auto Assign");
	return 1;
}

CMD:jungle(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(gUser[playerid][U_MODE] == MODE_JUNGLE)
	{
 		HidePlayerModeMenu(playerid);

	 	SetPlayerCameraPos(playerid, 953.9208, -194.0821, 175.3314);
		SetPlayerCameraLookAt(playerid, 952.9310, -194.2156, 174.7163);
	 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
	 	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""OLIVE_GREEN"CRIMINALS Team\n"SKY_BLUE"COPS Team", "Select", "Close");
		return 1;
	}

	if(CountEventPlayers(MODE_JUNGLE) > 20) return GameTextForPlayer(playerid, "~r~Teamdeathmatch is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_JUNGLE;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Jungle Mode teamdeathmatch [Total players: %i] (/jungle)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Jungle Mode teamdeathmatch with %i other players! (/jungle)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Jungle Mode~n~~w~~h~Team Deathmatch", 5000, 3);

    format(string, sizeof(string), "Jungle Teamdeathmatch~n~~n~Players: %i/%i~n~~n~You mission is to kill other team players by camofledging or hiding in jungle!", CountEventPlayers(gUser[playerid][U_MODE]), 15);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);

 	HidePlayerModeMenu(playerid);

	SetPlayerCameraPos(playerid, 953.9208, -194.0821, 175.3314);
	SetPlayerCameraLookAt(playerid, 952.9310, -194.2156, 174.7163);
 	SendClientMessage(playerid, COLOR_LIME, "> Select your team and spawn in warzone!");
	ShowPlayerDialog(playerid, DIALOG_TEAMS, DIALOG_STYLE_LIST, "Select your team:", ""OLIVE_GREEN"CRIMINALS Team\n"SKY_BLUE"COPS Team", "Select", "Auto Assign");
	return 1;
}

CMD:beachfront(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_BEACH_FRONT) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_BEACH_FRONT) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_BEACH_FRONT;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Beach Front race [Total players: %i] (/beachfront)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Beach Front race with %i other players! (/beachfront)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Beach Front~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

	new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Beach Front Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_BeachFront_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:chillad(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_MOUNT_CHILLAD) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_MOUNT_CHILLAD) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_MOUNT_CHILLAD;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Mount Chillad race [Total players: %i] (/chillad)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Mount Chillad race with %i other players! (/chillad)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Mount Chillad~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Mount Chillad Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_MountChillad_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:freewheel(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_FREE_WHEEL) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_FREE_WHEEL) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_FREE_WHEEL;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Free Wheel race [Total players: %i] (/freewheel)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Free Wheel race with %i other players! (/freewheel)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Free Wheel~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Free Wheel Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_FreeWheel_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:lsrace(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_LS_RACE) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_LS_RACE) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_LS_RACE;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined L.S. race [Total players: %i] (/lsrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined L.S. race with %i other players! (/lsrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~L.S.~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "L.S. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LSRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:lvrace(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_LV_RACE) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_LV_RACE) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_LV_RACE;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined L.V. race [Total players: %i] (/lvrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined L.V. race with %i other players! (/lvrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~L.S.~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "L.V. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_LVRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:sfrace(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_SF_RACE) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_SF_RACE) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_SF_RACE;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined S.F. race [Total players: %i] (/sfrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined S.F. race with %i other players! (/sfrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~S.F.~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "S.F. Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_SFRace_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:oilrace(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_OIL_REFINARY) return GameTextForPlayer(playerid, "~r~You are already in race", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_OIL_REFINARY) > 10) return GameTextForPlayer(playerid, "~r~Race is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_OIL_REFINARY;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Oil Refinary race [Total players: %i] (/sfrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Oil Refinary with %i other players! (/sfrace)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Oil Refinary~n~~w~~h~Race", 5000, 3);

	gUser[playerid][U_RACE_CP] = 0;
	//
	UpdateRacePositions(gUser[playerid][U_MODE]);
	//

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Oil Refinary Race~n~~n~Players: %i/%i~n~~n~Checkpoints: ~r~%i/%i~n~~w~~h~Position: %i/%i", players, 10, (gUser[playerid][U_RACE_CP] + 1), sizeof(gRace_OilRefinary_Checkpoints), gUser[playerid][U_RACE_POSITION], players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:airderby(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_AIR_DERBY) return GameTextForPlayer(playerid, "~r~You are already in derby", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_AIR_DERBY) > 10) return GameTextForPlayer(playerid, "~r~Derby is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_AIR_DERBY;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Air Derby [Total players: %i] (/airderby)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Air Derby with %i other players! (/airderby)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Air~n~~w~~h~Derby", 5000, 3);

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Air Derby~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:airderby2(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_AIR_DERBY_2) return GameTextForPlayer(playerid, "~r~You are already in derby", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_AIR_DERBY_2) > 10) return GameTextForPlayer(playerid, "~r~Derby is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_AIR_DERBY_2;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Air Derby 2 [Total players: %i] (/airderby2)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Air Derby 2 with %i other players! (/airderby2)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Air~n~~w~~h~Derby 2", 5000, 3);

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Air Derby 2~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:parkderby(playerid)
{
 	if(gUser[playerid][U_MODE] == MODE_PARK_DERBY) return GameTextForPlayer(playerid, "~r~You are already in derby", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	if(CountEventPlayers(MODE_PARK_DERBY) > 10) return GameTextForPlayer(playerid, "~r~Derby is full", 5000, 3);

	gUser[playerid][U_MODE] = MODE_PARK_DERBY;
 	gUser[playerid][U_TEAM] = NO_TEAM;

    new string[148];
    format(string, sizeof(string), "> %s(%i) have joined Park Derby [Total players: %i] (/parkderby)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	format(string, sizeof(string), "~y~~h~~h~%s(%i) has joined Park Derby with %i other players! (/parkderby)", ReturnPlayerName(playerid), playerid, CountEventPlayers(gUser[playerid][U_MODE]));
	NotifyAll(string);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Park~n~~w~~h~Derby", 5000, 3);

    new players = CountEventPlayers(gUser[playerid][U_MODE]);
    format(string, sizeof(string), "Park Derby~n~~n~Players: %i/%i~n~~n~~w~~h~Alive: %i/%i", players, 10, CountDerbyAlivePlayers(gUser[playerid][U_MODE]), players);
	PlayerTextDrawSetString(playerid, gUser[playerid][U_MODE_TD], string);

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	return 1;
}

CMD:freeroam(playerid)
{
	if(gUser[playerid][U_MODE] == MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You are already in freeroam", 5000, 3);

    new string[148], string2[178];
    switch(gUser[playerid][U_MODE])
	{
		case MODE_MINIGUN:
		{
			format(string, sizeof(string), "> %s(%i) have left Minigun Madness deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Minigun Madness deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_MONEYBAG:
		{
			format(string, sizeof(string), "> %s(%i) have left Moneybag Hunt deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Moneybag Hunt deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_GLASS:
		{
			format(string, sizeof(string), "> %s(%i) have left Glass deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Glass deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_RPG:
		{
			format(string, sizeof(string), "> %s(%i) have left RPG deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left RPG deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_BATTLEFIELD:
		{
			format(string, sizeof(string), "> %s(%i) have left RC-Battlefield deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left RC-Battlefield deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_JETFIGHT:
		{
			format(string, sizeof(string), "> %s(%i) have left Jetpack Fight deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Jetpack Fight deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_ONESHOTKILL:
		{
			format(string, sizeof(string), "> %s(%i) have left One Shot Kill deathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left One Shot Kill deathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_GANGWAR:
		{
			format(string, sizeof(string), "> %s(%i) have left Gangwar teamdeathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Gangwar teamdeathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_SNIPER:
		{
			format(string, sizeof(string), "> %s(%i) have left Sniper teamdeathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Sniper teamdeathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_JUNGLE:
		{
			format(string, sizeof(string), "> %s(%i) have left Jungle Mode teamdeathmatch [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Jungle Mode teamdeathmatch with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_BEACH_FRONT:
		{
			format(string, sizeof(string), "> %s(%i) have left Beach Front race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Beach Front race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_MOUNT_CHILLAD:
		{
			format(string, sizeof(string), "> %s(%i) have left Mount Chillad race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Mount Chillad race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_FREE_WHEEL:
		{
			format(string, sizeof(string), "> %s(%i) have left Beach Front race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Beach Front race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_LS_RACE:
		{
			format(string, sizeof(string), "> %s(%i) have left L.S. race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left L.S. race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_LV_RACE:
		{
			format(string, sizeof(string), "> %s(%i) have left L.V. race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left L.V. race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_SF_RACE:
		{
			format(string, sizeof(string), "> %s(%i) have left S.F. race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left S.F. race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_OIL_REFINARY:
		{
			format(string, sizeof(string), "> %s(%i) have left Oil Refinary race [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Oil Refinary race with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_AIR_DERBY:
		{
			format(string, sizeof(string), "> %s(%i) have left Air Derby [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Air Derby with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_AIR_DERBY_2:
		{
			format(string, sizeof(string), "> %s(%i) have left Air Derby 2 [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Air Derby 2 with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
		case MODE_PARK_DERBY:
		{
			format(string, sizeof(string), "> %s(%i) have left Park Derby [Total players: %i]", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
			format(string2, sizeof(string2), "~y~~h~~h~%s(%i) has left Park Derby with %i other players!", ReturnPlayerName(playerid), playerid, (CountEventPlayers(gUser[playerid][U_MODE]) - 1));
		}
	}
	SendClientMessageToAll(COLOR_GRAPHITE, string);
	NotifyAll(string2);

 	gUser[playerid][U_MODE] = MODE_FREEROAM;
 	gUser[playerid][U_TEAM] = NO_TEAM;

	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    CallLocalFunction("OnPlayerSpawn", "i", playerid);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Freeroam", 5000, 3);
	return 1;
}
CMD:exit(playerid) return cmd_freeroam(playerid);

CMD:m(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	ShowPlayerModeMenu(playerid, 0);
	return 1;
}

CMD:dm(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Deathmatch Name\tCommand\tPlayers\n");
	new string[108];
	format(string, sizeof(string), "Minigun Maddness\t/minigun\t%i\n", CountEventPlayers(MODE_MINIGUN));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Moneybag Hunt\t/moneybag\t%i\n", CountEventPlayers(MODE_MONEYBAG));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Glass Deathmatch\t/glass\t%i\n", CountEventPlayers(MODE_GLASS));
	strcat(dialogstr, string);
	format(string, sizeof(string), "RPG Deathmatch\t/rpg\t%i\n", CountEventPlayers(MODE_RPG));
	strcat(dialogstr, string);
	format(string, sizeof(string), "RC-Battlefield\t/battlefield\t%i\n", CountEventPlayers(MODE_BATTLEFIELD));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Jetpack Fight\t/jetfight\t%i\n", CountEventPlayers(MODE_JETFIGHT));
	strcat(dialogstr, string);
	format(string, sizeof(string), "One Shot Killt\t/oneshotkill\t%i", CountEventPlayers(MODE_ONESHOTKILL));
	strcat(dialogstr, string);
	ShowPlayerDialog(playerid, DIALOG_DEATHMATCH, DIALOG_STYLE_TABLIST_HEADERS, "Deathmatches list", dialogstr, "Select", "Close");
	return 1;
}

CMD:tdm(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teamdeathmatch Name\tCommand\tPlayers\n");
	new string[108];
	format(string, sizeof(string), "Gangwar\t/gangwar\t%i\n", CountEventPlayers(MODE_GANGWAR));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Sniper TDM.\t/sniper\t%i\n", CountEventPlayers(MODE_SNIPER));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Jungle Mode\t/jungle\t%i", CountEventPlayers(MODE_JUNGLE));
	strcat(dialogstr, string);
	ShowPlayerDialog(playerid, DIALOG_TEAM_DEATHMATCH, DIALOG_STYLE_TABLIST_HEADERS, "Team deathmatches list", dialogstr, "Select", "Close");
	return 1;
}

CMD:races(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[654];
	strcat(dialogstr, "Race Name\tCommand\tPlayers\n");
	new string[108];
	format(string, sizeof(string), "Beach Front\t/beachfrot\t%i\n", CountEventPlayers(MODE_BEACH_FRONT));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Mount Chillad\t/chillad\t%i\n", CountEventPlayers(MODE_MOUNT_CHILLAD));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Free Wheel\t/freewheel\t%i\n", CountEventPlayers(MODE_FREE_WHEEL));
	strcat(dialogstr, string);
	format(string, sizeof(string), "L.S. Race\t/freewheel\t%i\n", CountEventPlayers(MODE_LS_RACE));
	strcat(dialogstr, string);
	format(string, sizeof(string), "L.V. Race\t/freewheel\t%i\n", CountEventPlayers(MODE_LV_RACE));
	strcat(dialogstr, string);
	format(string, sizeof(string), "S.F. Race\t/freewheel\t%i\n", CountEventPlayers(MODE_SF_RACE));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Oil Refinary\t/oilrace\t%i", CountEventPlayers(MODE_OIL_REFINARY));
	strcat(dialogstr, string);
	ShowPlayerDialog(playerid, DIALOG_RACES, DIALOG_STYLE_TABLIST_HEADERS, "Races list", dialogstr, "Select", "Close");
	return 1;
}

CMD:derbys(playerid)
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Derby Name\tCommand\tPlayers\n");
	new string[108];
	format(string, sizeof(string), "Air Derby\t/airderby\t%i\n", CountEventPlayers(MODE_AIR_DERBY));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Air Derby 2\t/airderby2\t%i\n", CountEventPlayers(MODE_AIR_DERBY_2));
	strcat(dialogstr, string);
	format(string, sizeof(string), "Park Derby\t/parkderby\t%i", CountEventPlayers(MODE_PARK_DERBY));
	strcat(dialogstr, string);
	ShowPlayerDialog(playerid, DIALOG_DERBYS, DIALOG_STYLE_TABLIST_HEADERS, "Derbys list", dialogstr, "Select", "Close");
	return 1;
}

//duel system
CMD:duel(playerid, params[])
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

 	new target, bet;
	if(sscanf(params, "ii", target, bet)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/duel (player) (bet)", 5000, 3);

	if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

	if(gUser[target][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~Player not in freeroam", 5000, 3);

	if(! IsPlayerSpawned(target)) return GameTextForPlayer(playerid, "~r~Player not spawned", 5000, 3);

	if(bet != 0 && GetPlayerMoney(playerid) < bet) return GameTextForPlayer(playerid, "~r~You don't have enough money", 5000, 3);

	if(bet < 0) return GameTextForPlayer(playerid, "~r~Invalid amount, no negatives!", 5000, 3);

	if(target == playerid) return GameTextForPlayer(playerid, "~r~You can't duel yourself", 5000, 3);

	gUser[playerid][U_DUEL_OPPONENT] = target;
	gUser[target][U_DUEL_OPPONENT] = playerid;

	SendClientMessage(playerid, COLOR_LIME, "> Please select your duel weapon.");

    SetupPrevModelDialog(playerid, 0.0, 0.0, 0.0, 3.0);
	ShowPlayerDialog(playerid, DIALOG_DUEL_WEAPON, DIALOG_STYLE_PREVMODEL, "Select your duel weapon", gDialog_Duel, "Select", "Close");
	return 1;
}

//teleports
CMD:party(playerid) 	return TeleportPlayer(playerid, -768.3176, -1873.5896, 	11.2667, 	4.0401, 	0, 0, "~b~~h~~h~~h~Shit Lake Party");
CMD:chillard(playerid) 	return TeleportPlayer(playerid, -2789.4741, -1525.9939, 139.2908, 	4.0401, 	0, 0, "~b~~h~~h~~h~Mount Chillard Party");
CMD:pd(playerid) 		return TeleportPlayer(playerid, 1474.0437, -1751.1372, 	3285.2859, 	4.0401, 	0, 0, "~b~~h~~h~~h~Police Department");
CMD:bank(playerid) 		return TeleportPlayer(playerid, 1423.90, 	-1710.75, 	-24.71, 	4.0401, 	0, 0, "~b~~h~~h~~h~RedRex Bank");
CMD:room(playerid) 		return TeleportPlayer(playerid, -2666.9397, 632.9147, 	66.1670, 	4.0401, 	1, 0, "~b~~h~~h~~h~Hidden Room");
CMD:area51(playerid) 	return TeleportPlayer(playerid, 314.0387, 	2037.1544, 	17.6406, 	4.0401, 	0, 0, "~b~~h~~h~~h~Area 51");
CMD:ee(playerid) 		return TeleportPlayer(playerid, -2685.7449, 1932.9778, 	217.2739, 	173.9034, 	0, 0, "~b~~h~~h~~h~Easter Egg");
CMD:tomb(playerid) 		return TeleportPlayer(playerid, 4015.1677, 	-9133.4932, 28.2588, 	188.1936, 	0, 0, "~b~~h~~h~~h~Secret Tomb");
CMD:beach(playerid) 	return TeleportPlayer(playerid, 248.4677, 	-1813.4363, 5.5172, 	358.7649, 	0, 0, "~b~~h~~h~~h~Beach Party");
CMD:pirate(playerid) 	return TeleportPlayer(playerid, -2080.8301, -7563.8896, 6.4609, 	358.7649, 	0, 0, "~b~~h~~h~~h~Pirate Island");
CMD:others(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Shit lake party\t/party\n");
	strcat(dialogstr, "Mount chillard party\t/chillard\n");
	strcat(dialogstr, "Police department\t/pd\n");
	strcat(dialogstr, "RedRex bank\t/bank\n");
	strcat(dialogstr, "Hidden room\t/room\n");
	strcat(dialogstr, "Area 51\t/area51\n");
	strcat(dialogstr, "Easter egg\t/ee\n");
	strcat(dialogstr, "Secret Tomb\t/tomb\n");
	strcat(dialogstr, "Beach party\t/beach\n");
	strcat(dialogstr, "Pirate island\t/pirate");
	ShowPlayerDialog(playerid, DIALOG_OTHERS, DIALOG_STYLE_TABLIST_HEADERS, "Other maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:bowl(playerid) 		return TeleportPlayer(playerid, -224.40339661, -591.83801270, 	2.54778552, 	5.0401, 	0, 0, "~b~~h~~h~~h~Fun Bowl");
CMD:tube(playerid) 		return TeleportPlayer(playerid, 1582.72338867, -1235.75048828,	277.29550171, 	5.0401, 	0, 0, "~b~~h~~h~~h~Stretched Tube");
CMD:trampoline(playerid)return TeleportPlayer(playerid, 210.5616,		-388.2305,		194.5008, 		5.0401, 	0, 0, "~b~~h~~h~~h~Vehicle Trampoline");
CMD:dune(playerid)		return TeleportPlayer(playerid, 474.395691, 	-1884.271484, 	3.103678, 		94.5751, 	0, 0, "~b~~h~~h~~h~Dune Fun");
CMD:megajump(playerid)	return TeleportPlayer(playerid, 1165.08386230,	-1152.97338867,	161.48233032, 	94.5751, 	0, 0, "~b~~h~~h~~h~Mega Jump");
CMD:joker(playerid)
{
	switch(random(4))
	{
		case 0: return TeleportPlayer(playerid, 5580.6787,		-2967.4832,		2.0788, 	94.5751, 	0, 0, "~b~~h~~h~~h~Red Joker Party");
		case 1: return TeleportPlayer(playerid, 5591.9570,		-2953.9417,		2.0788, 	94.5751, 	0, 0, "~b~~h~~h~~h~Red Joker Party");
		case 2: return TeleportPlayer(playerid, 5596.4019,		-2934.5464,		2.0788, 	94.5751, 	0, 0, "~b~~h~~h~~h~Red Joker Party");
		case 3: return TeleportPlayer(playerid, 5573.8652,		-2947.7861,		2.0788, 	94.5751, 	0, 0, "~b~~h~~h~~h~Red Joker Party");
	}
	return 1;
}
CMD:scale(playerid)		return TeleportPlayer(playerid, -54.840816497803,-558.5478515625, 3.3922004699707,	94.5751, 	0, 0, "~b~~h~~h~~h~Scale Map");
CMD:wtg(playerid)		return TeleportPlayer(playerid, 1976.0239257813, 1890.1687011719, 122.015625, 		94.5751, 	0, 0, "~b~~h~~h~~h~Way To God");
CMD:wtg2(playerid)		return TeleportPlayer(playerid, -2938.755859375, -1347.7873535156,11.417881011963,	94.5751, 	0, 0, "~b~~h~~h~~h~Way To God 2");
CMD:hotspots(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Fun bowl\t/bowl\n");
	strcat(dialogstr, "Stretched tube\t/tube\n");
	strcat(dialogstr, "Vehicle trampoline\t/trampoline\n");
	strcat(dialogstr, "Dune fun\t/dune\n");
	strcat(dialogstr, "Mega jump\t/megajump\n");
	strcat(dialogstr, "Red joker party\t/joker\n");
	strcat(dialogstr, "Scale map\t/scale\n");
	strcat(dialogstr, "Way to god\t/wtg\n");
	strcat(dialogstr, "Way to god 2\t/wtg2");
	ShowPlayerDialog(playerid, DIALOG_HOTSPOTS, DIALOG_STYLE_TABLIST_HEADERS, "Hotspots maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:rc(playerid)		return TeleportPlayer(playerid, 1530.458374,	-1363.656006, 	329.960938,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster");
CMD:rc2(playerid)		return TeleportPlayer(playerid, -2693.646973, 	1938.587769, 	218.025787,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 2");
CMD:rc3(playerid)		return TeleportPlayer(playerid, -1836.437622, 	582.060120,		235.387421,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 3");
CMD:rc4(playerid)		return TeleportPlayer(playerid, -2865.625732, 	2628.928955, 	275.893066,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 4");
CMD:rc5(playerid)		return TeleportPlayer(playerid, 35.7414,		-904.6901,		1761.7263,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 5");
CMD:rc6(playerid)		return TeleportPlayer(playerid, 2496.4985,		-1687.2906,		687.6669,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 6");
CMD:rc7(playerid)		return TeleportPlayer(playerid, -2432.8020,		-1627.9198,		526.8647,	94.5751, 	0, WORLD_ROLLERCOASTER, "~b~~h~~h~~h~Rollercoaster 7");
CMD:rollercoasters(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Rollercoaster\t/rc\n");
	strcat(dialogstr, "Rollercoaster 2\t/rc2\n");
	strcat(dialogstr, "Rollercoaster 3\t/rc3\n");
	strcat(dialogstr, "Rollercoaster 4\t/rc4\n");
	strcat(dialogstr, "Rollercoaster 5\t/rc5\n");
	strcat(dialogstr, "Rollercoaster 6\t/rc6\n");
	strcat(dialogstr, "Rollercoaster 7\t/rc7");
	ShowPlayerDialog(playerid, DIALOG_ROLLERCOASTERS, DIALOG_STYLE_TABLIST_HEADERS, "Rollercoaster maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:driftisland(playerid)	return TeleportPlayer(playerid, 3087.8645,	-3178.5508,	47.6537,	94.5751, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift Island");
CMD:drift(playerid)			return TeleportPlayer(playerid, 2112.6956,	2374.0696,	49.5234,	90.7947, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift 1");
CMD:drift2(playerid)		return TeleportPlayer(playerid, -2398.7883,	-595.0936,	132.6484,	116.0417, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift 2");
CMD:drift3(playerid)		return TeleportPlayer(playerid, -367.3326,	1534.5021,	75.3594,	239.5807, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift 3");
CMD:drift4(playerid)		return TeleportPlayer(playerid, 2261.7659,	1397.5100,	43.9054,	282.5421, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift 4");
CMD:drift5(playerid)		return TeleportPlayer(playerid, 2225.6233,	1974.1561,	31.7797,	272.5522, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift 5");
CMD:driftship(playerid)		return TeleportPlayer(playerid, -1364.0852, 469.1697,	7.1875,		252.8375, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift Ship");
CMD:driftpool(playerid)		return TeleportPlayer(playerid, 1748.1360,	731.6422,	10.8203,	8.3663, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift Pool");
CMD:driftbox(playerid)		return TeleportPlayer(playerid, 2311.0005,	-1218.7238,	24.0136,	153.5456, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift Boxtroll!");
CMD:driftway(playerid)		return TeleportPlayer(playerid, 992.3975,	-2177.2783,	13.0938,	174.8932, 	0, WORLD_DRIFT, "~b~~h~~h~~h~Drift Runway");
CMD:drifts(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Drift island\t/driftisland\n");
	strcat(dialogstr, "Drift\t/drift\n");
	strcat(dialogstr, "Drift 2\t/drift2\n");
	strcat(dialogstr, "Drift 3\t/drift3\n");
	strcat(dialogstr, "Drift 4\t/drift4\n");
	strcat(dialogstr, "Drift 5\t/drift5\n");
	strcat(dialogstr, "Drift Ship\t/driftship\n");
	strcat(dialogstr, "Drift Pool\t/driftpool\n");
	strcat(dialogstr, "Drift Boxtroll!\t/driftbox\n");
	strcat(dialogstr, "Drift Runway\t/driftway");
	ShowPlayerDialog(playerid, DIALOG_DRIFTS, DIALOG_STYLE_TABLIST_HEADERS, "Drift maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:aa(playerid)
{
	switch(random(3))
	{
		case 0: return TeleportPlayer(playerid, 304.2308,	2331.9861,	28.6605,	89.1627, 	0, 0, "~b~~h~~h~~h~Abandoned Airport");
		case 1: return TeleportPlayer(playerid, 304.2308,	2331.9861,	28.6605,	169.0428, 	0, 0, "~b~~h~~h~~h~Abandoned Airport");
		case 2: return TeleportPlayer(playerid, 414.0508,	2533.2000,	19.1484,	169.3761, 	0, 0, "~b~~h~~h~~h~Abandoned Airport");
	}
 	return 1;
}
CMD:ls(playerid)
{
	switch(random(2))
	{
		case 0: return TeleportPlayer(playerid, 2133.4155,	-2537.1926,	13.5469,	89.0802, 	0, 0, "~b~~h~~h~~h~Los Santos Airport");
		case 1: return TeleportPlayer(playerid, 1816.7726,	-2570.0608,	41.5021,	87.1217, 	0, 0, "~b~~h~~h~~h~Los Santos Airport");
	}
 	return 1;
}
CMD:sf(playerid)
{
	switch(random(2))
	{
		case 0: return TeleportPlayer(playerid, -2634.3896,	1360.3790,	7.1199,		269.9044, 	0, 0, "~b~~h~~h~~h~San Fierro Airport");
		case 1: return TeleportPlayer(playerid, -2511.1353,	2024.5861,	26.5198,	236.9676, 	0, 0, "~b~~h~~h~~h~San Fierro Airport");
	}
 	return 1;
}
CMD:lv(playerid)
{
	switch(random(2))
	{
		case 0: return TeleportPlayer(playerid, 1611.9084,	1170.5830,	14.2188,	62.2728, 	0, 0, "~b~~h~~h~~h~Las Venturas Airport");
		case 1: return TeleportPlayer(playerid, 1314.3077,	1268.8531,	11.8100,	347.1465, 	0, 0, "~b~~h~~h~~h~Las Venturas Airport");
	}
 	return 1;
}
CMD:mc(playerid)
{
	switch(random(2))
	{
		case 0: return TeleportPlayer(playerid, -2355.1145,	-1632.9171,	483.6932,	279.4492, 	0, 0, "~b~~h~~h~~h~Mount Chillard");
		case 1: return TeleportPlayer(playerid, -2308.6892,	-1646.2041,	483.7031,	331.4629, 	0, 0, "~b~~h~~h~~h~Mount Chillard");
	}
 	return 1;
}
CMD:park(playerid) 	return TeleportPlayer(playerid, 	165.4887,	343.5088,	1.3974,	327.4135, 	0, 0, "~b~~h~~h~~h~Stunt Park");
CMD:park2(playerid) return TeleportPlayer(playerid, 	-509.1411,	2203.0071,	42.4960,122.5145, 	0, 0, "~b~~h~~h~~h~Stunt Park 2");
CMD:stunts(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Abandoned airport\t/aa\n");
	strcat(dialogstr, "Los santos airport\t/ls\n");
	strcat(dialogstr, "Las venturas airport\t/lv\n");
	strcat(dialogstr, "San fierro airport\t/sf\n");
	strcat(dialogstr, "Mount chillard\t/mc\n");
	strcat(dialogstr, "Stunt park\t/park\n");
	strcat(dialogstr, "Stunt park 2\t/park2");
	ShowPlayerDialog(playerid, DIALOG_STUNTS, DIALOG_STYLE_TABLIST_HEADERS, "Stunt maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:bigjump(playerid) 	return TeleportPlayer(playerid, 	2532.4507,		82.2986,		1469.8140,		122.5145, 	0, 0, "~b~~h~~h~~h~Big Jump");
CMD:heavyjump(playerid) return TeleportPlayer(playerid, 	-2226.7160,		-3097.0153,		27.1743,		0.000000, 	0, 0, "~b~~h~~h~~h~Heavy Jump");
CMD:highjump(playerid) 	return TeleportPlayer(playerid, 	2621.844482,	-1608.850952,	1041.503296,	0.000000, 	0, 0, "~b~~h~~h~~h~High Jump");
CMD:skyfall(playerid) 	return TeleportPlayer(playerid, 	2066.4404,		-341.5382,		898.1591,		0.6266, 	0, 0, "~b~~h~~h~~h~Sky Fall Jump");
CMD:jumbo(playerid) 	return TeleportPlayer(playerid, 	1194.8135,		2213.4321,		511.9854,		75.6447, 	0, 0, "~b~~h~~h~~h~Jumbo Jump");
CMD:away(playerid) 		return TeleportPlayer(playerid, 	-2292.6077,		388.5263,		916.5107,		305.2639, 	0, 0, "~b~~h~~h~~h~Fly Away Jump");
CMD:over(playerid) 		return TeleportPlayer(playerid, 	-1883.58227539,	264.17495728,	295.93225098, 	305.2639, 	0, 0, "~b~~h~~h~~h~Over'n'Out Jump");
CMD:jumps(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Big jump\t/bigjump\n");
	strcat(dialogstr, "Heavy jump\t/heavyjump\n");
	strcat(dialogstr, "High jump\t/highjump\n");
	strcat(dialogstr, "Sky fall jump\t/skyfall\n");
	strcat(dialogstr, "Jumbo jump\t/jumbo\n");
	strcat(dialogstr, "Fly away jump\t/away\n");
	strcat(dialogstr, "Over'n'Out jump\t/ocer");
	ShowPlayerDialog(playerid, DIALOG_JUMPS, DIALOG_STYLE_TABLIST_HEADERS, "Jumps maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:g1(playerid) 			return TeleportPlayer(playerid, 	2644.5220,	-2004.0026,	13.3828,	122.5145, 	0, 0, "~b~~h~~h~~h~Locolow Modding Garage");
CMD:locolow(playerid)		return cmd_g1(playerid);
CMD:g2(playerid) 			return TeleportPlayer(playerid, 	-1917.2754,	287.0215,	41.0469,	122.5145, 	0, 0, "~b~~h~~h~~h~Pay'n'Spray Garage");
CMD:paynspray(playerid) 	return cmd_g2(playerid);
CMD:g3(playerid) 			return TeleportPlayer(playerid, 	-2705.5503, 206.1621, 	4.1797,		122.5145, 	0, 0, "~b~~h~~h~~h~Wheel Arc Modding Garage");
CMD:wheelarc(playerid) 		return cmd_g3(playerid);
CMD:g4(playerid) 			return TeleportPlayer(playerid, 	2387.4126,	1022.6620,	10.8203,	122.5145, 	0, 0, "~b~~h~~h~~h~Transfender Modding Garage");
CMD:transfender(playerid)	return cmd_g4(playerid);
CMD:garages(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Locolow modding garage\t/g1, /locolow\n");
	strcat(dialogstr, "Pay'n'Spray garage\t/g2, /paynspray\n");
	strcat(dialogstr, "Wheel Arc modding garage\t/g3, /wheelarc\n");
	strcat(dialogstr, "Transfender modding garage\t/g4, /transfender");
	ShowPlayerDialog(playerid, DIALOG_GARAGES, DIALOG_STYLE_TABLIST_HEADERS, "Garages maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:base1(playerid) 	return TeleportPlayer(playerid, 	1421.74,		2924.64,		1090.0,			122.5145, 	0, 0, "~b~~h~~h~~h~Rock Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:base2(playerid) 	return TeleportPlayer(playerid, 	1867.1786,		-146.1077,		2465.8916,		270.0000, 	0, 0, "~b~~h~~h~~h~Glass Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:base3(playerid) 	return TeleportPlayer(playerid, 	-4.1568,		7535.3335,		3041.9146,		335.5310, 	0, 0, "~b~~h~~h~~h~Mountain Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:base4(playerid) 	return TeleportPlayer(playerid, 	3443.69995117,	545.90002441,	2014.00000000,	335.5310, 	0, 0, "~b~~h~~h~~h~Lux Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:base5(playerid) 	return TeleportPlayer(playerid, 	1129.099609375, -1601.3994140625,14291.700195313 + 5,335.5310, 	0, 0, "~b~~h~~h~~h~Endless Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:base6(playerid) 	return TeleportPlayer(playerid, 	-3788.4465,		1579.0140,		1665.6820,		270.0000, 	0, 0, "~b~~h~~h~~h~Cave Base Jump"), GivePlayerWeapon(playerid, 46, 1);
CMD:basejumps(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[456];
	strcat(dialogstr, "Teleport Name\tCommand\n");
	strcat(dialogstr, "Rock base jump\t/base\n");
	strcat(dialogstr, "Glass base jump\t/base2\n");
	strcat(dialogstr, "Mountain base jump\t/base3\n");
	strcat(dialogstr, "Lux base jump\t/base4\n");
	strcat(dialogstr, "Endless base jump\t/base5\n");
	strcat(dialogstr, "Cave base jump\t/base6");
	ShowPlayerDialog(playerid, DIALOG_BASEJUMPS, DIALOG_STYLE_TABLIST_HEADERS, "Basejumps maps list", dialogstr, "Select", "Close");
	return 1;
}

CMD:teles(playerid)
{
	if(gUser[playerid][U_MODE] != MODE_FREEROAM) return GameTextForPlayer(playerid, "~r~You must be in freeroam", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

    new dialogstr[567];
	strcat(dialogstr, "Teleport Type\tCommand\n");
	strcat(dialogstr, "Stunts\t/stunts\n");
	strcat(dialogstr, "Hotspots\t/hotspots\n");
	strcat(dialogstr, "Rollercoasters\t/rollercoasters\n");
	strcat(dialogstr, "Drift Places\t/drifts\n");
	strcat(dialogstr, "Air Jumps\t/jumps\n");
	strcat(dialogstr, "Modding Garages\t/garages\n");
	strcat(dialogstr, "Base Jumos\t/basejumps\n");
	strcat(dialogstr, "DEATHMATCHES\t/dm\n");
	strcat(dialogstr, "TEAM DEATHMATCHES\t/tdm\n");
	strcat(dialogstr, "RACES\t/races\n");
	strcat(dialogstr, "DERBYS\t/derbys");
	ShowPlayerDialog(playerid, DIALOG_TELEPORTS, DIALOG_STYLE_TABLIST_HEADERS, "Teleports list", dialogstr, "Select", "Close");
	return 1;
}
CMD:t(playerid) return cmd_teles(playerid);

CMD:time(playerid,params[])
{
	ShowPlayerDialog(playerid, DIALOG_TIME, DIALOG_STYLE_LIST, "Select a time to set!", "Morning\nMid day\nAfternoon\nEvening\nMidnight", "Select", "Cancel");
 	return 1;
}

CMD:weather(playerid,params[])
{
	ShowPlayerDialog(playerid, DIALOG_WEATHER, DIALOG_STYLE_LIST, "Select a time to set!", "Blue Sky\nSand Storm\nThunderstorm\nFoggy\nCloudy\nHigh Tide\nPurple Sky\nBlack/White Sky\nDark, Green Sky\nHeatwave", "Select", "Cancel");
 	return 1;
}

CMD:tc1(playerid, params[])
{
    new vehicleid;
    vehicleid = GetPlayerVehicleID( playerid);

    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
    {
        AddVehicleComponent(vehicleid, 1046);
        AddVehicleComponent(vehicleid, 1171);
        AddVehicleComponent(vehicleid, 1149);
        AddVehicleComponent(vehicleid, 1035);
        AddVehicleComponent(vehicleid, 1147);
        AddVehicleComponent(vehicleid, 1036);
        AddVehicleComponent(vehicleid, 1040);

        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);

        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
    {
        AddVehicleComponent(vehicleid, 1028);
        AddVehicleComponent(vehicleid, 1169);
        AddVehicleComponent(vehicleid, 1141);
        AddVehicleComponent(vehicleid, 1032);
        AddVehicleComponent(vehicleid, 1138);
        AddVehicleComponent(vehicleid, 1026);
        AddVehicleComponent(vehicleid, 1027);

        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);

        AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
    {
        AddVehicleComponent(vehicleid, 1046);
        AddVehicleComponent(vehicleid, 1153);
        AddVehicleComponent(vehicleid, 1150);
        AddVehicleComponent(vehicleid, 1054);
        AddVehicleComponent(vehicleid, 1049);
        AddVehicleComponent(vehicleid, 1047);
        AddVehicleComponent(vehicleid, 1051);
        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
    {
        AddVehicleComponent(vehicleid, 1065);
        AddVehicleComponent(vehicleid, 1160);
        AddVehicleComponent(vehicleid, 1159);
        AddVehicleComponent(vehicleid, 1067);
        AddVehicleComponent(vehicleid, 1162);
        AddVehicleComponent(vehicleid, 1069);
        AddVehicleComponent(vehicleid, 1071);
        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
    {
        AddVehicleComponent(vehicleid, 1064);
        AddVehicleComponent(vehicleid, 1155);
        AddVehicleComponent(vehicleid, 1154);
        AddVehicleComponent(vehicleid, 1055);
        AddVehicleComponent(vehicleid, 1158);
        AddVehicleComponent(vehicleid, 1056);
        AddVehicleComponent(vehicleid, 1062);
        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
    {
        AddVehicleComponent(vehicleid, 1089);
        AddVehicleComponent(vehicleid, 1166);
        AddVehicleComponent(vehicleid, 1168);
        AddVehicleComponent(vehicleid, 1088);
        AddVehicleComponent(vehicleid, 1164);
        AddVehicleComponent(vehicleid, 1090);
        AddVehicleComponent(vehicleid, 1094);
        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 575)
    {
        AddVehicleComponent(vehicleid, 1044);
        AddVehicleComponent(vehicleid, 1174);
        AddVehicleComponent(vehicleid, 1176);
        AddVehicleComponent(vehicleid, 1042);
        AddVehicleComponent(vehicleid, 1099);
        AddVehicleComponent(vehicleid, 1010);
        AddVehicleComponent(vehicleid, 1081);
        AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
    {
        AddVehicleComponent(vehicleid, 1126);
        AddVehicleComponent(vehicleid, 1179);
        AddVehicleComponent(vehicleid, 1180);
        AddVehicleComponent(vehicleid, 1122);
		AddVehicleComponent(vehicleid, 1101);
		AddVehicleComponent(vehicleid, 1125);
		AddVehicleComponent(vehicleid, 1123);
		AddVehicleComponent(vehicleid, 1100);
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
    {
        AddVehicleComponent(vehicleid, 1104);
        AddVehicleComponent(vehicleid, 1182);
        AddVehicleComponent(vehicleid, 1184);
        AddVehicleComponent(vehicleid, 1108);
		AddVehicleComponent(vehicleid, 1107);
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
    {
        AddVehicleComponent(vehicleid, 1129);
        AddVehicleComponent(vehicleid, 1189);
        AddVehicleComponent(vehicleid, 1187);
        AddVehicleComponent(vehicleid, 1102);
		AddVehicleComponent(vehicleid, 1133);
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 420)
    {
        AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1087);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1139);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 400)
    {
        AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1087);
		AddVehicleComponent(vehicleid, 1018);
		AddVehicleComponent(vehicleid, 1013);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1086);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 401)
    {
        AddVehicleComponent(vehicleid, 1086);
		AddVehicleComponent(vehicleid, 1139);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1087);
		AddVehicleComponent(vehicleid, 1012);
		AddVehicleComponent(vehicleid, 1013);
		AddVehicleComponent(vehicleid, 1042);
		AddVehicleComponent(vehicleid, 1043);
		AddVehicleComponent(vehicleid, 1018);
		AddVehicleComponent(vehicleid, 1006);
		AddVehicleComponent(vehicleid, 1007);
		AddVehicleComponent(vehicleid, 1017);
    }
    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
    {
        ChangeVehiclePaintjob(vehicleid, 0);
        ChangeVehicleColor(vehicleid, 1, 1);
		AddVehicleComponent(vehicleid, 1191);
		AddVehicleComponent(vehicleid, 1193);
		AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1018);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
		AddVehicleComponent(vehicleid, 1134);
		AddVehicleComponent(vehicleid, 1137);
    }
    else
    {
        AddVehicleComponent(vehicleid, 1010);
		AddVehicleComponent(vehicleid, 1081);
		AddVehicleComponent(vehicleid, 1087);
    }
    return 1;
}
CMD:tc2(playerid, params[])
{
	new vehicleid;
	vehicleid = GetPlayerVehicleID( playerid);

	if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 562)
	{
		AddVehicleComponent(vehicleid,1046);
		AddVehicleComponent(vehicleid,1171);
		AddVehicleComponent(vehicleid,1149);
		AddVehicleComponent(vehicleid,1035);
		AddVehicleComponent(vehicleid,1147);
		AddVehicleComponent(vehicleid,1036);
		AddVehicleComponent(vehicleid,1040);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
 	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 560)
	{
		AddVehicleComponent(vehicleid,1028);
		AddVehicleComponent(vehicleid,1169);
		AddVehicleComponent(vehicleid,1141);
		AddVehicleComponent(vehicleid,1032);
		AddVehicleComponent(vehicleid,1138);
		AddVehicleComponent(vehicleid,1026);
	 	AddVehicleComponent(vehicleid,1027);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
	 }
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 565)
	{
		AddVehicleComponent(vehicleid,1046);
		AddVehicleComponent(vehicleid,1153);
		AddVehicleComponent(vehicleid,1150);
		AddVehicleComponent(vehicleid,1054);
		AddVehicleComponent(vehicleid,1049);
		AddVehicleComponent(vehicleid,1047);
	 	AddVehicleComponent(vehicleid,1051);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 559)
	{
		AddVehicleComponent(vehicleid,1065);
		AddVehicleComponent(vehicleid,1160);
		AddVehicleComponent(vehicleid,1159);
		AddVehicleComponent(vehicleid,1067);
		AddVehicleComponent(vehicleid,1162);
		AddVehicleComponent(vehicleid,1069);
	 	AddVehicleComponent(vehicleid,1071);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 561)
	{
		AddVehicleComponent(vehicleid,1064);
		AddVehicleComponent(vehicleid,1155);
		AddVehicleComponent(vehicleid,1154);
		AddVehicleComponent(vehicleid,1055);
		AddVehicleComponent(vehicleid,1158);
		AddVehicleComponent(vehicleid,1056);
	 	AddVehicleComponent(vehicleid,1062);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 558)
	{
		AddVehicleComponent(vehicleid,1089);
		AddVehicleComponent(vehicleid,1166);
		AddVehicleComponent(vehicleid,1168);
		AddVehicleComponent(vehicleid,1088);
		AddVehicleComponent(vehicleid,1164);
		AddVehicleComponent(vehicleid,1090);
	 	AddVehicleComponent(vehicleid,1094);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 575)
	{
		AddVehicleComponent(vehicleid,1044);
		AddVehicleComponent(vehicleid,1174);
		AddVehicleComponent(vehicleid,1176);
		AddVehicleComponent(vehicleid,1042);
	 	AddVehicleComponent(vehicleid,1099);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 534)
	{
		AddVehicleComponent(vehicleid,1126);
	    AddVehicleComponent(vehicleid,1179);
		AddVehicleComponent(vehicleid,1180);
		AddVehicleComponent(vehicleid,1122);
	 	AddVehicleComponent(vehicleid,1101);
	 	AddVehicleComponent(vehicleid,1125);
	 	AddVehicleComponent(vehicleid,1123);
	 	AddVehicleComponent(vehicleid,1100);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 536)
	{
		AddVehicleComponent(vehicleid,1104);
		AddVehicleComponent(vehicleid,1182);
		AddVehicleComponent(vehicleid,1184);
		AddVehicleComponent(vehicleid,1108);
	 	AddVehicleComponent(vehicleid,1107);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 567)
	{
		AddVehicleComponent(vehicleid,1129);
		AddVehicleComponent(vehicleid,1189);
		AddVehicleComponent(vehicleid,1187);
		AddVehicleComponent(vehicleid,1102);
	 	AddVehicleComponent(vehicleid,1133);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 420)
	{
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1087);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1139);
	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 400)
	{
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1087);
	 	AddVehicleComponent(vehicleid,1018);
	 	AddVehicleComponent(vehicleid,1013);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1086);
 	}
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 401)
	{
		AddVehicleComponent(vehicleid,1086);
	 	AddVehicleComponent(vehicleid,1139);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1087);
	 	AddVehicleComponent(vehicleid,1012);
	 	AddVehicleComponent(vehicleid,1013);
	 	AddVehicleComponent(vehicleid,1042);
	 	AddVehicleComponent(vehicleid,1043);
	 	AddVehicleComponent(vehicleid,1018);
	 	AddVehicleComponent(vehicleid,1006);
	 	AddVehicleComponent(vehicleid,1007);
	 	AddVehicleComponent(vehicleid,1017);
	 }
	else if(GetVehicleModel( GetPlayerVehicleID( playerid)) == 576)
	{
		ChangeVehiclePaintjob(vehicleid, 1);
		ChangeVehicleColor(vehicleid, 1, 1);
	 	AddVehicleComponent(vehicleid,1191);
	 	AddVehicleComponent(vehicleid,1193);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1018);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
	 	AddVehicleComponent(vehicleid,1134);
	 	AddVehicleComponent(vehicleid,1137);
	}
	else
	{
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
	}
 	return 1;
}
CMD:tc3(playerid, params[])
{
	new vehicleid;
	vehicleid = GetPlayerVehicleID( playerid);

	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
	{
		AddVehicleComponent(vehicleid, 1046);
		AddVehicleComponent(vehicleid, 1171);
		AddVehicleComponent(vehicleid, 1149);
		AddVehicleComponent(vehicleid, 1035);
		AddVehicleComponent(vehicleid, 1147);
		AddVehicleComponent(vehicleid, 1036);
		AddVehicleComponent(vehicleid, 1040);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
		AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
 	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
	{
		AddVehicleComponent(vehicleid,1028);
		AddVehicleComponent(vehicleid,1169);
		AddVehicleComponent(vehicleid,1141);
		AddVehicleComponent(vehicleid,1032);
		AddVehicleComponent(vehicleid,1138);
		AddVehicleComponent(vehicleid,1026);
	 	AddVehicleComponent(vehicleid,1027);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
		AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
 	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
	{
		AddVehicleComponent(vehicleid,1046);
		AddVehicleComponent(vehicleid,1153);
		AddVehicleComponent(vehicleid,1150);
		AddVehicleComponent(vehicleid,1054);
		AddVehicleComponent(vehicleid,1049);
		AddVehicleComponent(vehicleid,1047);
	 	AddVehicleComponent(vehicleid,1051);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
	{
		AddVehicleComponent(vehicleid,1065);
		AddVehicleComponent(vehicleid,1160);
		AddVehicleComponent(vehicleid,1159);
		AddVehicleComponent(vehicleid,1067);
		AddVehicleComponent(vehicleid,1162);
		AddVehicleComponent(vehicleid,1069);
	 	AddVehicleComponent(vehicleid,1071);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
	{
		AddVehicleComponent(vehicleid,1064);
		AddVehicleComponent(vehicleid,1155);
		AddVehicleComponent(vehicleid,1154);
		AddVehicleComponent(vehicleid,1055);
		AddVehicleComponent(vehicleid,1158);
		AddVehicleComponent(vehicleid,1056);
	 	AddVehicleComponent(vehicleid,1062);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
	{
		AddVehicleComponent(vehicleid,1089);
		AddVehicleComponent(vehicleid,1166);
		AddVehicleComponent(vehicleid,1168);
		AddVehicleComponent(vehicleid,1088);
		AddVehicleComponent(vehicleid,1164);
		AddVehicleComponent(vehicleid,1090);
	 	AddVehicleComponent(vehicleid,1094);
	 	AddVehicleComponent(vehicleid,1010);
	 	AddVehicleComponent(vehicleid,1081);
	 	AddVehicleComponent(vehicleid,1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 575)
	{
		AddVehicleComponent(vehicleid, 1044);
		AddVehicleComponent(vehicleid, 1174);
		AddVehicleComponent(vehicleid, 1176);
		AddVehicleComponent(vehicleid, 1042);
	 	AddVehicleComponent(vehicleid, 1099);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
	{
		AddVehicleComponent(vehicleid, 1126);
	    AddVehicleComponent(vehicleid, 1179);
		AddVehicleComponent(vehicleid, 1180);
		AddVehicleComponent(vehicleid, 1122);
	 	AddVehicleComponent(vehicleid, 1101);
	 	AddVehicleComponent(vehicleid, 1125);
	 	AddVehicleComponent(vehicleid, 1123);
	 	AddVehicleComponent(vehicleid, 1100);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
	{
		AddVehicleComponent(vehicleid, 1104);
		AddVehicleComponent(vehicleid, 1182);
		AddVehicleComponent(vehicleid, 1184);
		AddVehicleComponent(vehicleid, 1108);
	 	AddVehicleComponent(vehicleid, 1107);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
	{
		AddVehicleComponent(vehicleid, 1129);
		AddVehicleComponent(vehicleid, 1189);
		AddVehicleComponent(vehicleid, 1187);
		AddVehicleComponent(vehicleid, 1102);
	 	AddVehicleComponent(vehicleid, 1133);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 420)
	{
		AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1087);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1139);
 	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 400)
	{
		AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1087);
	 	AddVehicleComponent(vehicleid, 1018);
	 	AddVehicleComponent(vehicleid, 1013);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1086);
 	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 401)
	{
		AddVehicleComponent(vehicleid, 1086);
	 	AddVehicleComponent(vehicleid, 1139);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1087);
	 	AddVehicleComponent(vehicleid, 1012);
	 	AddVehicleComponent(vehicleid, 1013);
	 	AddVehicleComponent(vehicleid, 1042);
	 	AddVehicleComponent(vehicleid, 1043);
	 	AddVehicleComponent(vehicleid, 1018);
	 	AddVehicleComponent(vehicleid, 1006);
	 	AddVehicleComponent(vehicleid, 1007);
	 	AddVehicleComponent(vehicleid, 1017);
 	}
	else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
	{
		ChangeVehiclePaintjob(vehicleid, 2);
		ChangeVehicleColor(vehicleid, 1, 1);
	 	AddVehicleComponent(vehicleid, 1191);
	 	AddVehicleComponent(vehicleid, 1193);
	 	AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1018);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
	 	AddVehicleComponent(vehicleid, 1134);
	 	AddVehicleComponent(vehicleid, 1137);
	}
	else
	{
		AddVehicleComponent(vehicleid, 1010);
	 	AddVehicleComponent(vehicleid, 1081);
	 	AddVehicleComponent(vehicleid, 1087);
	}
 	return 1;
}

CMD:ad(playerid, params[])
{
	if(GetPlayerMoney(playerid) < 5000) return GameTextForPlayer(playerid, "~r~You need atleast $5000", 5000, 3);

	new text[98];
    if(sscanf(params, "s[98]", text)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/Ad (text)", 5000, 3);

	new string[144];
	format(string, sizeof(string), "[Addvertisement] %s | Posted by %s[%i]", text, ReturnPlayerName(playerid), playerid);
    SendClientMessageToAll(COLOR_LIME, string);

    GivePlayerMoney(playerid, -5000);
    return 1;
}

CMD:plate(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You need to be driver of any vehicle", 5000, 3);

	new text[25];
    if(sscanf(params, "s[25]", text)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/Plate (text)", 5000, 3);

	GameTextForPlayer(playerid, "~b~~h~~h~~h~Number plate text change", 5000, 3);

	SetVehicleNumberPlate(GetPlayerVehicleID(playerid), text);
    return 1;
}

CMD:mycolor(playerid)
{
    ShowPlayerDialog(playerid, DIALOG_PLAYER_COLORS, DIALOG_STYLE_LIST, "Select a color", ""BLACK"Black\n"WHITE"White\n"RED"Red\n"ORANGE"Orange\n"YELLOW"Yellow\n"GREEN"Green\n"RED"Blue\n"PURPLE"Purple\n"BROWN"Brown\n"PINK"Pink", "Select", "Cancel");
	return 1;
}

CMD:carpaint(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You need to be driver of any vehicle", 5000, 3);

	new paint;
	if(sscanf(params, "i", paint)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/carpaint (paintjob)", 5000, 3);
	
	if(paint < 0 || paint > 3) return GameTextForPlayer(playerid, "~r~Invalid paintjob~n~~r~Must be b/w 0-3", 5000, 3);

	ChangeVehiclePaintjob(GetPlayerVehicleID(playerid), paint);
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);

	new string[98];
	format(string, sizeof(string), "~b~~h~~h~~h~Vehicle paintjobe changed~n~~w~~h~to %i", paint);
	GameTextForPlayer(playerid, string, 5000, 3);
	return 1;
}

CMD:carcolor(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You need to be driver of any vehicle", 5000, 3);

	new color[2];
	if(sscanf(params, "iI(-1)", color[0], color[1])) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/carcolor (color1) (*color2)", 5000, 3);

	if(color[1] == -1) color[1] = random(256);//random color
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);

	ChangeVehicleColor(GetPlayerVehicleID(playerid), color[0], color[1]);

	new string[98];
	format(string, sizeof(string), "~b~~h~~h~~h~Vehicle color changed~n~~w~~h~to %i, %i", color[0], color[1]);
	GameTextForPlayer(playerid, string, 5000, 3);
	return 1;
}

CMD:neon(playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return GameTextForPlayer(playerid, "~r~You need to be driver of any vehicle", 5000, 3);

    ShowPlayerDialog(playerid, DIALOG_NEONS, DIALOG_STYLE_LIST, "Pick Neon Color", ""BLUE"Blue\n"RED"Red\n"GREEN"Green\n"WHITE"White\n"PINK"Pink\n"YELLOW"Yellow\n"WHITE"Police Strobe\n"WHITE"Interior Lights\n"WHITE"Back Neon\n"WHITE"Front neon\n"WHITE"Undercover Roof Light\n"DARK_RED">> Remove All Neon", "Select", "Close");
	return 1;
}

CMD:attachments(playerid, params[])
{
	new index;
	if(sscanf(params, "i", index))
	{
		new dialogstr[356];
		new str[56];
		for(new i; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
		{
		    if(IsPlayerAttachedObjectSlotUsed(playerid, i))
			{
				format(str, sizeof(str), "%i "GREEN"Used Slot\n", i);
      		}
		  	else
	 		{
				format(str, sizeof(str), "%i\n", i);
      		}
		  	strcat(dialogstr, str);
        }
        ShowPlayerDialog(playerid, DIALOG_ATTACH_INDEX_SELECTION, DIALOG_STYLE_LIST, "Attachments | Select a slot:", dialogstr, "Select", "Close");

        gIndex[playerid] = -1;
	}
	else
    {
        if(index >= MAX_PLAYER_ATTACHED_OBJECTS || index < 0) return GameTextForPlayer(playerid, "~r~Invalid slot id~n~~r~Must be b/w 0-"#MAX_PLAYER_ATTACHED_OBJECTS"", 5000, 3);

        gIndex[playerid] = index;
        return OnDialogResponse(playerid, DIALOG_ATTACH_INDEX_SELECTION, 1, gIndex[playerid], "");
	}
	return 1;
}
CMD:o(playerid, params[]) return cmd_attachments(playerid, params);
CMD:a(playerid, params[]) return cmd_attachments(playerid, params);

CMD:rules(playerid)
{
    new dialogstr[1024];
	strcat(dialogstr, ""WHITE"These are general server rules, if you think we missed some, just keep that in mind\n");
	strcat(dialogstr, "as a rule and don't break it! We will add it soon!\n\n");
	strcat(dialogstr, ""RED"1. "WHITE"Never make use of cheats, hacks or methods of unfair gameplay.\n");
	strcat(dialogstr, ""RED"2. "WHITE"Always respect every player and admin, dont provoke others.\n");
	strcat(dialogstr, ""RED"3. "WHITE"Any sort of level boosting is strictly restricted. This may include:\n");
	strcat(dialogstr, ""RED"   - "WHITE"Score boosting\n");
	strcat(dialogstr, ""RED"   - "WHITE"Money boosting\n");
	strcat(dialogstr, ""RED"   - "WHITE"Kills/Deaths boosting\n");
	strcat(dialogstr, ""RED"4. "WHITE"Dont unnecessarly PM. or send messages to players.\n");
	strcat(dialogstr, ""RED"5. "WHITE"Advertisements are not allowed, not in chat and PMs.\n");
	strcat(dialogstr, ""RED"6. "WHITE"If you have applied for admin on forums, then dont ask users to support.\n");
	strcat(dialogstr, ""RED"7. "WHITE"Don't misuse your admin or donor commands if provided.\n");
	strcat(dialogstr, ""RED"8. "WHITE"Play as a faithfull, trustworthy, and friendly user.\n\n");
	strcat(dialogstr, ""RED"NOTE: "WHITE"Violation of any of these rule can get you BAN, KICK, WARN, TEMPBAN...");

	ShowPlayerDialog(playerid, DIALOG_COMMON, DIALOG_STYLE_MSGBOX, "Server rules", dialogstr, "Close", "");
	return 1;
}
CMD:r(playerid) return cmd_rules(playerid);

CMD:help(playerid)
{
	new dialogstr[1024];
	strcat(dialogstr, ""GREEN"Welcome to RedRex Freeroam\n\n");
	strcat(dialogstr, ""WHITE"The server is quiet nice, simple, easy and creative in all sense!\n");
	strcat(dialogstr, "You can try all types of modes in this server.\n\n");
	strcat(dialogstr, ""LIME"Deathmatch:\n");
	strcat(dialogstr, ""WHITE"There are 7 types of deathmach which you would love to join,\n");
	strcat(dialogstr, "Type /dm to start exploring deathmatch list.\n\n");
	strcat(dialogstr, ""LIME"Team Deathmatch:\n");
	strcat(dialogstr, ""WHITE"We let our users enjoy team deathmatch fully!\n");
	strcat(dialogstr, "Type /tdm to start fighting with or against your friends.\n\n");
	strcat(dialogstr, ""LIME"Races:\n");
	strcat(dialogstr, ""WHITE"This includes all enjoyable places where one would love to race!\n");
	strcat(dialogstr, "Type /race to join one.\n\n");
	strcat(dialogstr, ""LIME"Derby:\n");
	strcat(dialogstr, ""WHITE"Type /derby to join any one derby map.\n\n");
	strcat(dialogstr, ""LIME"Getting started:\n");
	strcat(dialogstr, ""WHITE"Commands list /c, Online admins /admins, Attachments /a, Spawn vehicles /v, Skins /s\n\n");
	ShowPlayerDialog(playerid, DIALOG_COMMON, DIALOG_STYLE_MSGBOX, "Server helpline", dialogstr, "Open", "Close");
	return 1;
}
CMD:h(playerid) return cmd_help(playerid);

CMD:cmds(playerid)
{
    new dialogstr[1250];
	strcat(dialogstr, ""YELLOW"GENERAL COMMANDS:\n");
	strcat(dialogstr, ""WHITE"/help, /rules, /cmds, /kill, /time, /admins, /t, /v, /c ...\n\n");
	strcat(dialogstr, ""YELLOW"DEATHMATCH COMMANDS\n");
	strcat(dialogstr, ""WHITE"/dm, /minigun, /moneybag, /glass, /rpg, /battlefield, /jetfight, /oneshotkill ...\n\n");
	strcat(dialogstr, ""YELLOW"TEAM DEATHMATCH COMMANDS\n");
	strcat(dialogstr, ""WHITE"/tdm, /gangwar, /sniper, /jungle ...\n\n");
	strcat(dialogstr, ""YELLOW"RACE COMMANDS\n");
	strcat(dialogstr, ""WHITE"/races, /beachfront, /chillad, /freewheel, /lsrace, /lvrace, /sfrace, /oilrace ...\n\n");
	strcat(dialogstr, ""YELLOW"DERBY COMMANDS\n");
	strcat(dialogstr, ""WHITE"/derbys, /airderby, /airderby2, /parkderby ...\n\n");
	strcat(dialogstr, ""YELLOW"USEFUL COMMANDS\n");
	strcat(dialogstr, ""WHITE"/login, /register, /changename, /admins, /donors, /report, /autologin, /stats,\n");
	strcat(dialogstr, ""WHITE"/pm, /nopm, /dnd, /reply, /acmds, /givegun, /givemoney, /shout, /god, /jp, /spawn,\n");
	strcat(dialogstr, ""WHITE"/respawn, /eject, /repair, /kill, /sync, /home, /go, /gos, /time, /weather ...\n\n");
	strcat(dialogstr, ""YELLOW"SPAWN COMMANDS\n");
	strcat(dialogstr, ""WHITE"/nrg, /infernus, /bullet, /w, /v, /s, /tc[1-3] ...\n\n");
	strcat(dialogstr, ""YELLOW"TELEPORT COMMANDS\n");
	strcat(dialogstr, ""WHITE"/t, /go, /stunts, /hotspots, /jumps, /others, /rollercoasters, /drifts, /basejumps,\n");
	strcat(dialogstr, ""WHITE"/dm, /tdm, /races, /derbys, /freeroam, /exit ...\n\n");
	strcat(dialogstr, ""YELLOW"OTHER COMMANDS\n");
	strcat(dialogstr, ""WHITE"/tc<1-3>, /ad, /mycolor, /carpaint, /carcolor, /neon, /attachments, /tubes ...");

	ShowPlayerDialog(playerid, DIALOG_COMMON, DIALOG_STYLE_MSGBOX, "Server commands list", dialogstr, "Close", "");
	return 1;
}
CMD:c(playerid) return cmd_cmds(playerid);
CMD:commands(playerid) return cmd_cmds(playerid);

CMD:sync(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) return GameTextForPlayer(playerid, "~r~You must be on foot", 5000, 3);

	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	SyncPlayer(playerid);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Syncrnoized", 5000, 3);
	return 1;
}

CMD:pos(playerid)
{
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	new string[144];
	format(string, sizeof(string), "Your position | X: %0.4f | Y: %0.4f | Z: %0.4f | A: %0.4f | Interior: %d | VirtualWorld: %d", x, y, z, a, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	SendClientMessage(playerid, COLOR_LIME, string);
	return 1;
}

CMD:givegun(playerid, params[])
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new target, ammo;
	if(sscanf(params, "ui", target, ammo)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/givegun (player) (ammo)", 5000, 3);

	if(ammo < 1) return GameTextForPlayer(playerid, "~r~Amount must be greater than 0", 5000, 3);

	if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

	new Float:pos[3];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	if(! IsPlayerInRangeOfPoint(target, 10.0, pos[0], pos[1], pos[2])) return GameTextForPlayer(playerid, "~r~Player not near you", 5000, 3);

	if(GetPlayerMoney(playerid) < ammo) return GameTextForPlayer(playerid, "~r~You don't have enough ammo", 5000, 3);

	if(target == playerid) return GameTextForPlayer(playerid, "~r~You can't give it to yourself", 5000, 3);

	new weaponname[30];
	GetWeaponName(GetPlayerWeapon(playerid), weaponname, sizeof(weaponname));
	switch(GetPlayerWeapon(playerid))
	{
	    case 0..15: ammo = 1;
	}
 	GivePlayerWeapon(playerid, GetPlayerWeapon(playerid), - ammo);
  	GivePlayerWeapon(target, GetPlayerWeapon(playerid), ammo);

	new string[144];
	format(string, sizeof(string), "> %s(%i) have given you a %s with %i ammo.", ReturnPlayerName(playerid), playerid, weaponname, ammo);
	SendClientMessage(target, COLOR_YELLOW, string);
	format(string, sizeof(string), "> You have given %s(%i) a %s with %i ammo.", ReturnPlayerName(target), target, weaponname, ammo);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Weapon Recieved", 5000, 3);
	return 1;
}

CMD:givemoney(playerid, params[])
{
	if(! IsPlayerSpawned(playerid)) return GameTextForPlayer(playerid, "~r~You must be spawned", 5000, 3);

	new target, amount;
	if(sscanf(params, "ui", target, amount)) return GameTextForPlayer(playerid, "~b~~h~~h~~h~USAGE:~n~~w~~h~/givemoney (player) (amount)", 5000, 3);

	if(amount < 1) return GameTextForPlayer(playerid, "~r~Amount must be greater than 0", 5000, 3);

	if(! IsPlayerConnected(target)) return GameTextForPlayer(playerid, "~r~Player not connected", 5000, 3);

	new Float:pos[3];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	if(! IsPlayerInRangeOfPoint(target, 10.0, pos[0], pos[1], pos[2])) return GameTextForPlayer(playerid, "~r~Player not near you", 5000, 3);

	if(GetPlayerMoney(playerid) < amount) return GameTextForPlayer(playerid, "~r~You don't have enough money", 5000, 3);

	if(target == playerid) return GameTextForPlayer(playerid, "~r~You can't give it to yourself", 5000, 3);

	GivePlayerMoney(playerid, - amount);
	GivePlayerMoney(target, amount);

	new string[144];
	format(string, sizeof(string), "> %s(%i) have given you %i$.", ReturnPlayerName(playerid), playerid, amount);
	SendClientMessage(target, COLOR_YELLOW, string);
	format(string, sizeof(string), "> You have given %s(%i), %i$.", ReturnPlayerName(target), target, amount);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	GameTextForPlayer(playerid, "~b~~h~~h~~h~Money Recieved", 5000, 3);
	return 1;
}

CMD:tubes(playerid)		return TeleportPlayer(playerid, 1514.179199, -1567.319458, 68.377532, 	5.0401, 	0, 0, "~b~~h~~h~~h~Colourful Tubes");

//-------------------------------------------

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(! success) return GameTextForPlayer(playerid, "~r~Unknown command~n~~r~Try /c for commands list", 5000, 3);
	return 1;
}

//-------------------------------------------
