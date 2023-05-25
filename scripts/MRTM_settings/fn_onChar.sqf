/*
	Author: MrThomasM

	Description: Updates the slider pos rel to input.
*/

params ["_control","_code","_slider"];

if(isNull _control) exitWith {};
disableSerialization;

_value = parseNumber (ctrlText _control);
_maxRange = 4000;
if(_value > _maxRange || _value < 100) exitwith {[] call MRTM_fnc_openMenu;};
_varName = switch (_slider) do {
	case "inf": {"MRTM_inf"};
	case "ground": {"MRTM_ground"};
	case "air": {"MRTM_air"};
	case "objects": {"MRTM_objects"};
	case "drones": {"MRTM_drones"};
	case "RWR1": {"MRTM_rwr1"};
	case "RWR2": {"MRTM_rwr2"};
	case "RWR3": {"MRTM_rwr3"};
	case "RWR4": {"MRTM_rwr4"};
	default {"MRTM_inf"};
};

missionNamespace setVariable [_varName, _value];
[] call MRTM_fnc_updateViewDistance;
[] call MRTM_fnc_openMenu;