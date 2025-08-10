
playerPos = new Vec2(obj_player.x, obj_player.y);

cutscene = new Camera_Cutscene(playerPos, playerPos.add(new Vec2(100, 100)));




obj_shroud.FOG_ON = false;
cutscene.startc();