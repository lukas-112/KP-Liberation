#include "script_component.hpp"
/*
    KPLIB_fnc_cratefiller_getPlayers

    File: fn_cratefiller_getPlayers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-27
    Last Update: 2019-04-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Gets all players from the selected group and adds them to the listbox.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlGroups = _dialog displayCtrl 687411;
private _ctrlPlayers = _dialog displayCtrl 687412;

// Clear the lists
lbClear _ctrlPlayers;

// Read controls
private _index = lbCurSel _ctrlGroups;

// Get the selected group from the namespace
private _group = (CCGVAR("groups", [])) select _index;

// Get all units from the group
private _players = (units _group) select {isPlayer _x};

// Fill the list
{
    _index = _ctrlPlayers lbAdd name _x;
    _ctrlPlayers lbSetData [_index, netId _x];
} forEach _players;

true
