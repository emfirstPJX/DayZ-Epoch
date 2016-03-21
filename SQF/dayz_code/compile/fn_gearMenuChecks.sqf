private ["_cTarget","_dis","_display","_friendlies","_rcharID"];

// players inside vehicle can always access its gear
if ((vehicle player) == player) then {
	disableSerialization;
	_display = _this select 0;	
	_cTarget = cursorTarget;
	_dis = if (_cTarget isKindOf "USEC_ch53_E" || _cTarget isKindOf "MV22") then {25} else {12};

	if ((locked _cTarget) && {(_cTarget isKindOf "LandVehicle") or {_cTarget isKindOf "Air"} or {_cTarget isKindOf "Ship"}} && {(player distance _cTarget) < _dis}) then {
		cutText [localize "str_epoch_player_7","PLAIN DOWN"];
		_display closeDisplay 1;
	};

	if (DZE_BackpackAntiTheft) then {
		_friendlies	= player getVariable ["friendlies",[]];
		_rcharID = _cTarget getVariable ["CharacterID","0"];
		if (!canbuild && {_cTarget isKindOf "Man"} && {alive _cTarget} && {!((typeOf _cTarget) in serverTraders)} && {!(_rcharID in _friendlies)} && {(player distance _cTarget) < 12}) then {
			cutText [localize "STR_EPOCH_PLAYER_316","PLAIN DOWN"];
			_display closeDisplay 1;
		};
	};
};