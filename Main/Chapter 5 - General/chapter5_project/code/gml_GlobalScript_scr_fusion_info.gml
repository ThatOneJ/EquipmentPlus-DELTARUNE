function scr_fusion_info(arg0)
{
    ingredient[0] = 8;
    ingredienttype[0] = "item";
    ingredient[1] = 8;
    ingredienttype[1] = "item";
    result = 22;
    resulttype = "item";
    resultdesc = stringsetloc("Heal 60 HPx2", "scr_fusion_info_slash_scr_fusion_info_gml_11_0");
    
    switch (arg0)
    {
        case 1:
            ingredient[0] = 8;
            ingredienttype[0] = "item";
            ingredient[1] = 8;
            ingredienttype[1] = "item";
            result = 22;
            resulttype = "item";
            resultdesc = stringsetloc("Heal 60 HPx2", "scr_fusion_info_slash_scr_fusion_info_gml_23_0");
            break;
        
        case 2:
            ingredient[0] = 1;
            ingredienttype[0] = "armor";
            ingredient[1] = 1;
            ingredienttype[1] = "armor";
            result = 8;
            resulttype = "armor";
            resultdesc = stringsetloc("$ Gained +5%", "scr_fusion_info_slash_scr_fusion_info_gml_34_0");
            break;
        
        case 3:
            ingredient[0] = 3;
            ingredienttype[0] = "armor";
            ingredient[1] = 4;
            ingredienttype[1] = "armor";
            result = 9;
            resulttype = "armor";
            resultdesc = stringsetloc("Graze Area+", "scr_fusion_info_slash_scr_fusion_info_gml_56_0");
            break;
        
        case 4:
            ingredient[0] = 10;
            ingredienttype[0] = "armor";
            ingredient[1] = 5;
            ingredienttype[1] = "armor";
            result = 13;
            resulttype = "armor";
            resultdesc = stringsetloc("Attack+", "scr_fusion_info_slash_scr_fusion_info_gml_56_0_b");
            break;
        
        case 5:
            ingredient[0] = 12;
            ingredienttype[0] = "armor";
            ingredient[1] = 27;
            ingredienttype[1] = "item";
            result = 15;
            resulttype = "armor";
            resultdesc = stringsetloc("Graze TP+", "scr_fusion_info_slash_scr_fusion_info_gml_67_0");
            break;
        
        case 6:
            ingredient[0] = 13;
            ingredienttype[0] = "weapon";
            ingredient[1] = 15;
            ingredienttype[1] = "key";
            result = 11;
            resulttype = "weapon";
            resultdesc = stringsetloc("Trance", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
        
        case 7:
            ingredient[0] = 51;
            ingredienttype[0] = "weapon";
            ingredient[1] = 53;
            ingredienttype[1] = "armor";
            result = 30;
            resulttype = "armor";
            resultdesc = stringsetloc("Heal+", "scr_fusion_info_slash_scr_fusion_info_gml_90_0");
            break;
        
        case 8:
            ingredient[0] = 27;
            ingredienttype[0] = "armor";
            ingredient[1] = 20;
            ingredienttype[1] = "armor";
            result = 31;
            resulttype = "armor";
            resultdesc = stringsetloc("Defend vs Cat", "scr_fusion_info_slash_scr_fusion_info_gml_101_0");
            break;
        
        case 9:
            ingredient[0] = 37;
            ingredienttype[0] = "item";
            ingredient[1] = 37;
            ingredienttype[1] = "item";
            result = 34;
            resulttype = "item";
            resultdesc = stringsetloc("Heal 100 HP", "scr_fusion_info_slash_scr_fusion_info_gml_112_0");
            break;
        
        case 10:
            ingredient[0] = 34;
            ingredienttype[0] = "item";
            ingredient[1] = 34;
            ingredienttype[1] = "item";
            result = 39;
            resulttype = "item";
            resultdesc = stringsetloc("Heal 140 HP", "scr_fusion_info_slash_scr_fusion_info_gml_123_0");
            break;
        
        case 11:
            ingredient[0] = 62;
            ingredienttype[0] = "item";
            ingredient[1] = 52;
            ingredienttype[1] = "armor";
            result = 40;
            resulttype = "item";
            resultdesc = stringsetloc("Heals all 200HP", "scr_fusion_info_slash_scr_fusion_info_gml_134_0");
            break;
        
        case 12:
            ingredient[0] = 28;
            ingredienttype[0] = "item";
            ingredient[1] = 28;
            ingredienttype[1] = "item";
            result = 29;
            resulttype = "item";
            resultdesc = stringsetloc("Raises TP to 100%", "scr_fusion_info_slash_scr_fusion_info_gml_145_0");
            break;
        
        case 13:
            ingredient[0] = 54;
            ingredienttype[0] = "armor";
            ingredient[1] = 33;
            ingredienttype[1] = "item";
            result = 32;
            resulttype = "armor";
            resultdesc = stringsetloc("Lose Money", "scr_fusion_info_slash_scr_fusion_info_gml_156_0");
            break;
        
        case 200:
            ingredient[0] = 11;
            ingredienttype[0] = "item";
            ingredient[1] = 20;
            ingredienttype[1] = "weapon";
            result = 8;
            resulttype = "weapon";
            resultdesc = stringsetloc("Lucky", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
        
        case 201:
            ingredient[0] = 2;
            ingredienttype[0] = "item";
            ingredient[1] = 22;
            ingredienttype[1] = "armor";
            result = 200;
            resulttype = "armor";
            resultdesc = stringsetloc("ReviveTurn", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
            
        case 202:
            ingredient[0] = 7;
            ingredienttype[0] = "armor"; // Jevilstail
            ingredient[1] = 21;
            ingredienttype[1] = "armor"; // Dealmaker
            result = 201; // ChaosSpecs
            resulttype = "armor";
            resultdesc = stringsetloc("Chaos Deal", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
        
        case 203:
            ingredient[0] = 51;
            ingredienttype[0] = "armor"; // MysticBand
            ingredient[1] = 52;
            ingredienttype[1] = "armor"; // PowerBand
            result = 202;
            resulttype = "armor"; // ManaBand
            resultdesc = stringsetloc("Shifting flavors", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
            
        case 204:
            ingredient[0] = 26;
            ingredienttype[0] = "armor"; // BlueRibbon
            ingredient[1] = 33;
            ingredienttype[1] = "armor"; // RedRibbon
            result = 204;
            resulttype = "armor"; // RelueRibbon
            resultdesc = stringsetloc("Heal++", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
            
        case 205:
            ingredient[0] = 12;
            ingredienttype[0] = "armor"; // B.ShotBowtie
            ingredient[1] = 34;
            ingredienttype[1] = "armor"; // NetskieHat
            result = 205;
            resulttype = "armor"; // B.ShotHat
            resultdesc = stringsetloc("Painted ears", "scr_fusion_info_slash_scr_fusion_info_gml_45_0");
            break;
    }
}
