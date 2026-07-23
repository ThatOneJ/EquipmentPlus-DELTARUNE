if (!init)
{
    init = true;
    
    with (obj_plat_rosebush)
    {
        force_yplat = true;
        y_plat = ystart;
        y_ow = ystart;
        y = ystart;
    }
    
    if (scr_flag_get_ext(PROGRESS_FLAG, _WINDSTRUGGLER_BIT))
    {
        with (npc_struggler)
        {
            instance_destroy(marker);
            instance_destroy();
        }
        
        with (npc_cheese)
        {
            instance_destroy(marker);
            instance_destroy();
        }
    }
    else
    {
        with (npc_struggler.marker)
        {
            scr_plat_make_pauseable();
            
            on_act = function()
            {
                snd_stop(snd_plat_act_select);
                
                with (obj_dw_fcastle_top_descent)
                {
                    with (npc_struggler)
                    {
                        if (con == 1)
                            snd_play(snd_won);
                        else
                            snd_play(snd_error);
                    }
                }
            };
            
            struggler_helper = scr_configure_platmode_act(on_act, "none", stringsetloc("Windstruggler", "obj_dw_cliff_bonuscombat_slash_Create_0_gml_35_0"), other.default_description);
        }
    }
}

if (global.pause_plat)
    exit;

if (con == 0)
{
    if (scr_wind_direction() == 90)
    {
        with (obj_windflip_platform)
            flip();
        
        con = 1;
        scr_flag_set_ext(PROGRESS_FLAG, _WINDSTRUGGLER_BIT, 1);
        
        with (obj_plat_wind)
            controllable = true;
        
        with (obj_plat_player)
        {
            if (grounded)
                vspeed = -12;
            else
                vspeed -= 6;
        }
        
        scr_plat_barrier_enable();
        scr_plat_barrier_toggle_vertical(true);
        
        with (instance_create(0, 0, obj_plat_cam_clampzone))
        {
            image_xscale = room_width;
            image_yscale = room_height;
            xmax = 20;
            xmin = 20;
        }
    }
}
else if (con == 1)
{
    with (obj_plat_camera)
        x = lerp(x, 320, 0.2);
    
    with (npc_struggler)
    {
        marker.sprite_index = spr_npc_windstruggler_struggle;
        marker.image_angle += 2;
        var current_text = other.default_description;
        
        with (marker)
        {
            with (struggler_helper)
                description = current_text;
        }
        
        con = 2;
        y -= 2;
        x += 0.5;
    }
    
    with (npc_cheese)
    {
        marker.image_angle -= 2;
        y -= 2;
        x -= 0.5;
    }
    
    if (instance_exists(obj_plat_player) && !global.pause_plat)
    {
        if (obj_plat_player.y > (room_height - 460))
        {
            maxspeed = scr_approach(maxspeed, 12, 0.2);
            if !instance_exists(obj_plat_bulletblue_rose) && global.flag[2497] == 0
            {
                global.flag[2497] = 1
            }
        }
    }
}

if (con > 0)
    exit;

timer++;

if (instance_exists(npc_struggler))
{
    with (npc_cheese)
        marker.depth = other.npc_struggler.marker.depth + 1;
}

with (npc_struggler)
{
    var current_text = (con == 1) ? other.cheese_description : other.default_description;
    
    with (marker)
    {
        with (struggler_helper)
            description = current_text;
    }
    
    if (con == 0)
    {
        if (marker.image_angle != 0)
        {
            marker.image_angle = scr_approach(other.image_angle, 0, 2);
            y = y_plat;
        }
        
        marker.depth = depth;
        marker.sprite_index = spr_npc_windstruggler_walk;
        marker.image_speed = 0.25;
        y = scr_approach(y, y_plat, 2);
        marker.image_angle = scr_approach(marker.image_angle, 0, 2);
        
        if ((other.timer % 8) == 4)
            scr_lerpvar("x", x, x - 8, 3);
        
        if (x < (other.npc_cheese.x + 20))
            con = 1;
    }
    else
    {
        marker.image_speed = 0.5;
        marker.sprite_index = spr_npc_windstruggler_eat;
    }
}
