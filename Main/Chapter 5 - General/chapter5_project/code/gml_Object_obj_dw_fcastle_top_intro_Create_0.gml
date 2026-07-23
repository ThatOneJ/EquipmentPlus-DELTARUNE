timer = 0;
init = false;

if (global.plot < 440)
{
    var dw22_event = instance_create(0, 0, obj_ch5_DW22);
    
    with (obj_border_controller)
        hide_border(1/30);
}
else
{
    with (obj_border_controller)
        hide_border(1/30);
}
// Chest
if global.flag[2497] == 2
{
    var treasure = instance_create(1880,400,obj_treasure_room)
    treasure.image_xscale = 2
    treasure.image_yscale = 2
    darkmarker = noone
}
PROGRESS_FLAG = 1818;
_SHORTCUT_BIT = 0;
_SHORTCUT_ANIMATION_BIT = 1;
