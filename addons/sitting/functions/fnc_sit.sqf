/*
 * Author: Jonpas
 * Sits down the player.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat, player] call ace_sitting_fnc_sit;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_seat,_player);

// Set global variable for standing up
GVAR(seat) = _seat;

// Overwrite weird position, because Arma decides to set it differently based on current animation/stance...
_player switchMove "amovpknlmstpsraswrfldnon";

// Read config
private ["_sitDirection", "_sitPosition"];
_sitDirection = getNumber (configFile >> "CfgVehicles" >> typeOf _seat >> QGVAR(sitDirection));
_sitPosition = getArray (configFile >> "CfgVehicles" >> typeOf _seat >> QGVAR(sitPosition));

// Get random animation and perform it (before moving player to ensure correct placement)
[_player, call FUNC(getRandomAnimation), 2] call EFUNC(common,doAnimation);

// Set direction and position
_player setDir ((getDir _seat) + _sitDirection);
_player setPosASL (_seat modelToWorld _sitPosition) call EFUNC(common,positionToASL);

// Set variables
_player setVariable [QGVAR(isSitting), true];
_seat setVariable [QGVAR(seatOccupied), true, true]; // To prevent multiple people sitting on one seat
