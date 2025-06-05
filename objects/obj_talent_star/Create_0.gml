// Inherit the parent event
event_inherited();

/**
 *  Function Description
 * @param {any*} othr  Instance that picked up
 * @returns {bool} Whether the pickup succeeded or not.
 */
function onPickup(othr) {
    othr.gain_talent(1);
     
    return true;
}