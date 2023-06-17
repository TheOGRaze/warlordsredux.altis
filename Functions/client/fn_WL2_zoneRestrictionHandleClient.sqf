#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	waitUntil {(player getVariable ["BIS_WL_zoneRestrictionKillTime", -1]) != -1};
	_killTime = player getVariable "BIS_WL_zoneRestrictionKillTime";
	["trespassing", [serverTime, _killTime]] spawn BIS_fnc_WL2_setOSDEvent;
	[toUpper localize "STR_A3_WL_zone_warn"] spawn BIS_fnc_WL2_smoothText;
	playSound "air_raid";

	waitUntil {(player getVariable "BIS_WL_zoneRestrictionKillTime") == -1 || !alive player};

	player setVariable ["BIS_WL_zoneRestrictionKillTime", -1];
	["trespassing", []] spawn BIS_fnc_WL2_setOSDEvent;
};