if (!init)
{
    init = true;
    fusuma_marker = findsprite(spr_fusuma_full_back, undefined, c_red);
    layer_sprite_blend(fusuma_marker, 16777215);
    
    if (scr_flag_get_ext(PROGRESS_FLAG, _SHORTCUT_BIT))
    {
        layer_sprite_change(fusuma_marker, spr_fusuma_full_back_torn);
        
        with (obj_solidblocksized_alt)
            instance_destroy();
        
        if (scr_flag_get_ext(PROGRESS_FLAG, _SHORTCUT_ANIMATION_BIT) == 0)
        {
            snd_play(snd_wing);
            
            for (var i = 0; i < 16; i++)
            {
                var xx = obj_mainchara.x + 18;
                var yy = obj_mainchara.y + 20;
                var paperscraps = instance_create_depth(xx + random_range(-60, 60), yy + random_range(-60, 60), depth + 1, obj_marker_fancy);
                
                with (paperscraps)
                {
                    sprite_index = choose(spr_plat_paperscraps_1, spr_plat_paperscraps_2, spr_plat_paperscraps_3, spr_plat_paperscraps_4, spr_plat_paperscraps_5);
                    image_speed = random_range(0.2, 0.25);
                    direction = random_range(0, 360);
                    hspeed = 0.1 * (x - xx);
                    vspeed = 0.1 * (y - yy);
                    image_blend = c_gray;
                    depth = obj_mainchara.depth - 600;
                    scr_darksize();
                    
                    step_func = function()
                    {
                        if (!global.pause_plat)
                        {
                            hspeed *= 0.92;
                            
                            if (abs(hspeed) < 6)
                                vspeed = min(vspeed + 0.2, 1);
                        }
                    };
                    
                    var doomtime = random_range(36, 58);
                    scr_lerpvar("image_alpha", 4, 0, doomtime);
                    scr_doom(self, doomtime);
                }
            }
            
            scr_flag_set_ext(PROGRESS_FLAG, _SHORTCUT_ANIMATION_BIT, 1);
        }
    }
}
if obj_mainchara.x >= 155 && global.flag[2497] == 1
{
    global.flag[2497] = 2
    darkmarker = scr_dark_marker(1880, 20, spr_treasurebox)
    _solid = instance_create(1880,400,obj_solidblockDark)
    snd_play(snd_fall)
    
}
if global.flag[2497] == 2
{
    if instance_exists(darkmarker)
    {
        darkmarker.y += 20
        if darkmarker.y >= 400
        {
            scr_shakescreen()
            treasure = instance_create(1880,400,obj_treasure_room)
            treasure.image_xscale = 2
            treasure.image_yscale = 2
            snd_stop(snd_fall)
            snd_play(snd_impact)
            with (_solid)
                instance_destroy()
            with(darkmarker)
                instance_destroy()
        }
    }
}
timer++;
