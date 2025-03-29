

function checkTalentCost(_talent){
    if (obj_player.talent_points >= _talent.cost_amount) {
        return true;
    }
    return false;
}