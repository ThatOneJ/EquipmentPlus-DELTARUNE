myinteract = 0;
talked = 0;
image_speed = 0;
itemflag = 104;
itemtype = "armor";
itemidchest = 4;
close = 0;
extratext = 0;
extraevent = 0;
scr_platswap_init();
needsitem = false;
noflag = false;

if (global.darkzone == 1)
{
    image_xscale = 2;
    image_yscale = 2;
}

if (room == room_dw_castle_west_cliff)
{
    itemidchest = 21;
    itemflag = 142;
    var qualify = 0;
    
    if (global.flag[468] > 0)
        qualify = 1;
    
    if (global.flag[142] == 1)
        qualify = 0;
    
    if (global.flag[571] == 1 || global.flag[468] == 2)
        itemtype = "weapon";
    else
        itemtype = "armor";
    
    if (qualify == 0)
    {
        instance_destroy();
        visible = 0;
    }
}

if (room == room_dw_garden_riverchest || instance_exists(obj_dw_garden_riverchest))
{
    itemflag = 1827;
    itemidchest = 1;
    itemtype = "pinkcoin";
}

if (room == room_dw_garden_shearydodge || instance_exists(obj_dw_garden_shearydodge))
{
    itemflag = 1828;
    itemtype = "item";
    itemidchest = 42;
}

if (room == room_dw_garden_newdash || instance_exists(obj_dw_garden_newdash))
{
    itemflag = 1829;
    itemtype = "item";
    itemidchest = 2;
}

if (room == room_dw_garden_wateringcan_aqua || instance_exists(obj_dw_garden_wateringcan_aqua))
{
    itemflag = 1830;
    itemtype = "item";
    itemidchest = 42;
}

if (room == room_dw_cliff_yellowcave || instance_exists(obj_dw_cliff_yellowcave))
{
    itemflag = 1732;
    itemtype = "flowerydollar";
    itemidchest = 50;
}

if (room == room_dw_fcastle_shinobeetle_encounter || instance_exists(obj_dw_fcastle_shinobeetle_encounter))
{
    itemflag = 1853;
    itemtype = "flowerydollar";
    itemidchest = 50;
}

if (room == room_dw_cliff_netskieclimb || instance_exists(obj_dw_cliff_netskieclimb))
{
    itemflag = 1834;
    itemtype = "weapon";
    itemidchest = 37;
}

if (room == room_dw_fcastle_terracotta_bonus || instance_exists(obj_dw_fcastle_terracotta_bonus))
{
    itemflag = 1835;
    itemtype = "pink";
    itemidchest = 1;
}

if (room == room_dw_fcastle_terracotta_puzzle || instance_exists(obj_dw_fcastle_terracotta_puzzle))
{
    itemflag = 1875;
    itemtype = "pink";
    itemidchest = 1;
}

if (room == room_dw_garden_starwalkerdash || instance_exists(obj_dw_garden_starwalkerdash))
{
    itemflag = 1304;
    itemtype = "pink";
    itemidchest = 1;
}

if (room == room_dw_fcastle_heldmushrooms || instance_exists(obj_dw_fcastle_heldmushrooms))
{
    itemflag = 1836;
    itemtype = "pink";
    itemidchest = 1;
}

if (room == room_dw_fcastle_foxhunt || instance_exists(obj_dw_fcastle_foxhunt))
{
    if (x < 1500)
    {
        itemflag = 1840;
        itemtype = "pink";
        itemidchest = 1;
    }
    else
    {
        itemflag = 1841;
        itemtype = "flowerydollar";
        itemidchest = 10;
    }
}

if (room == room_dw_fcastle_zenlooker || instance_exists(obj_dw_fcastle_zenlooker))
{
    itemflag = 1837;
    itemtype = "item";
    itemidchest = 29;
}

if (room == room_dogplatforming || instance_exists(obj_dw_dogplatforming))
{
    itemflag = 1866;
    itemtype = "item";
    itemidchest = 33;
}
if (room == room_dw_fcastle_top_intro || instance_exists(obj_dw_fcastle_top_intro))
{
    itemflag = 2496;
    itemtype = "weapon";
    itemidchest = 36
}
if (global.flag[itemflag] == 1)
    image_index = 1;

scr_depth();
