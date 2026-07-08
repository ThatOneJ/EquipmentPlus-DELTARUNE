if (global.hp[global.char[myself]] > 0)
{
    if (global.myfight == 3 && global.faceaction[myself] == 6 && state != 8)
        state = 6;
    
    if (state == 0 && hurt == 0)
    {
        acttimer = 0;
        thissprite = idlesprite;
        
        if (global.faceaction[myself] == 1)
            thissprite = attackreadysprite;
        
        if (global.faceaction[myself] == 3)
            thissprite = itemreadysprite;
        
        if (global.faceaction[myself] == 2)
        {
            thissprite = spellreadysprite;
            
            if (object_index == obj_heroralsei && global.charspecial[2] == 12)
                thissprite = spr_ralsei_sing_ready;
            
            if (object_index == obj_heroralsei && global.charspecial[2] == 12 && global.flag[1311] == 1)
                thissprite = spr_ralseib_sing_ready;
        }
        
        if (global.faceaction[myself] == 6)
            thissprite = actreadysprite;
        
        if (global.charcond[myself] == 5)
        {
            thissprite = defeatsprite;
            global.faceaction[myself] = 9;
        }
        
        if (global.faceaction[myself] == 4)
        {
            thissprite = defendsprite;
            index = defendtimer;
            
            if (defendtimer < defendframes)
                defendtimer += 0.5;
        }
        else
        {
            defendtimer = 0;
            index = siner / 5;
        }
        
        siner += 1;
    }
    
    if (state == 1 && hurt == 0)
    {
        siner += 1;
        
        if (attacked == 0)
        {
            snd_stop(snd_laz_c);
            
            if (object_index == obj_herokris)
                snd_play(snd_laz_c);
            
            if (object_index == obj_heroralsei)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 1.15);
            }
            
            if (object_index == obj_herosusie)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 0.9);
            }
            
            if (object_index == obj_heronoelle)
            {
                ls = snd_play(snd_laz_c);
                snd_pitch(ls, 1.5);
            }
            
            if (points == 150)
            {
                snd_stop(snd_criticalswing);
                snd_play(snd_criticalswing);
                
                repeat (3)
                {
                    anim = instance_create(x + mywidth + random(50), y + 30 + random(30), obj_afterimage);
                    anim.sprite_index = spr_lightfairy;
                    anim.image_speed = 0.25;
                    anim.depth = -20;
                    anim.image_xscale = 2;
                    anim.image_yscale = 2;
                    anim.hspeed = 2 + random(4);
                    anim.friction = -0.25;
                }
            }
            
            attacked = 1;
            finishattacktimer = 11;
        }
        
        if (attacktimer < attackframes)
            image_index = attacktimer;
        else
            image_index = attackframes;
        
        thissprite = attacksprite;
        index = image_index;
        attacktimer += attackspeed;
        
        if (force == 1 && image_index == attackframes)
        {
            force = 0;
            state = 0;
            attacktimer = 0;
            attacked = 0;
        }
    }
    
    if (state == 2 && hurt == 0)
    {
        siner += 1;
        
        if (itemed == 0)
        {
            itemed = 1;
            spelltimer = 16;
        }
        
        if (attacktimer < spellframes && spellframes != 0)
            image_index = attacktimer;
        else
            image_index = spellframes;
        
        if (scr_monsterpop() == 0)
            attacktimer = 0;
        
        thissprite = spellsprite;
        index = image_index;
        
        if (object_index == obj_heroralsei && global.charspecial[2] == 12)
            thissprite = spr_ralsei_sing_ready;
        
        if (object_index == obj_heroralsei && global.charspecial[2] == 12 && global.flag[1311] == 1)
            thissprite = spr_ralseib_sing_ready;
        
        attacktimer += 0.5;
        
        if (force == 1 && image_index == attackframes)
        {
            force = 0;
            state = 0;
            attacktimer = 0;
            itemed = 0;
        }
    }
    
    if (state == 4 && hurt == 0)
    {
        siner += 1;
        
        if (itemed == 0)
        {
            itemed = 1;
            spelltimer = 16;
        }
        
        if (attacktimer < itemframes)
            image_index = attacktimer;
        else
            image_index = itemframes;
        
        if (scr_monsterpop() == 0)
            attacktimer = 0;
        
        index = image_index;
        thissprite = itemsprite;
        attacktimer += 0.5;
    }
    
    if (state == 6)
    {
        if (act_init == 0)
        {
            act_init = 1;
        }
        else
        {
            if (global.myfight == 3)
            {
                if (acttimer < actframes)
                    acttimer += 0.5;
            }
            else
            {
                acttimer += 0.5;
            }
            
            thissprite = actsprite;
            index = acttimer;
            
            if (acttimer >= actreturnframes)
            {
                acttimer = 0;
                state = 0;
                global.faceaction[myself] = 0;
            }
        }
    }
    else
    {
        act_init = 0;
    }
    
    if (state == 7)
    {
        hurt = 0;
        hurttimer = 0;
        
        if (_sideb == 1 && _victoried == 0)
        {
            _victorysequence = instance_create(x, y, obj_noellevictory_example);
            _victorysequence.depth = depth - 1;
            _victoried = 1;
            image_alpha = 0;
        }
        
        if (victoryanim < victoryframes)
        {
            thissprite = victorysprite;
            index = victoryanim;
            victoryanim += 0.334;
        }
        else
        {
            thissprite = normalsprite;
            index = 0;
        }
    }
    
    if (state == 8)
    {
        if (maxframes == -1 && image_index >= (image_number - 0.1))
        {
            image_speed = 0;
            image_index = 0;
        }
        else if (maxframes == -1)
        {
        }
        else if ((image_index + image_speed) >= maxframes && maxframes != 0)
        {
            state = 0;
            hurt = 0;
            attacktimer = 0;
            maxframes = 0;
        }
    }
    
    if (hurt == 1 && global.hp[global.char[myself]] > 0)
    {
        hurtindex = hurttimer / 2;
        
        if (hurtindex > 2)
            hurtindex = 2;
        
        if (global.charcond[myself] == 5)
        {
            global.faceaction[myself] = 5;
            global.charmove[myself] = 1;
            global.charcond[myself] = 0;
        }
        
        if (global.faceaction[myself] == 0)
            global.faceaction[myself] = 5;
        
        if (hurttimer > 15)
        {
            hurttimer = 0;
            hurt = 0;
            
            if (global.faceaction[myself] == 5)
                global.faceaction[myself] = 0;
        }
        
        hurttimer += 1;
    }
}
else
{
    global.charcond[myself] = 0;
    hurttimer = 0;
    hurt = 0;
    thissprite = defeatsprite;
    index = 0;
    siner += 1;
}

if (global.targeted[myself] != 1)
{
    if (combatdarken == 1 && instance_exists(obj_darkener))
    {
        if (darkify == 1)
        {
            if (darkentimer < 15)
                darkentimer += 1;
            
            image_blend = merge_color(c_white, c_black, darkentimer / 30);
        }
    }
}

if (darkify == 0)
{
    if (darkentimer > 0)
        darkentimer -= 3;
    
    image_blend = merge_color(c_white, c_black, darkentimer / 30);
}

if (poisonamount > 0)
{
    poisontimer++;
    
    if (poisontimer >= 10)
    {
        if (global.hp[global.char[myself]] > 1)
        {
            global.hp[global.char[myself]]--;
            poisonamount--;
        }
        else
        {
            poisonamount = 0;
        }
        
        poisontimer = 0;
    }
}

if (finishattacktimer > 0)
{
    finishattacktimer--;
    
    if (finishattacktimer == 0)
    {
        global.faceaction[myself] = 0;
        scr_retarget(myself);
        
        if (cancelattack == 0)
        {
            if (i_ex(obj_blue_enemy) && i_ex(obj_yellow_enemy))
            {
                if (global.chartarget[myself] == obj_blue_enemy.myself)
                {
                    obj_yellow_enemy.x = obj_blue_enemy.x - 60;
                    obj_yellow_enemy.y = obj_blue_enemy.y;
                    global.chartarget[myself] = obj_yellow_enemy.myself;
                    global.monsterx[global.chartarget[myself]] = obj_yellow_enemy.x + 20;
                    global.monstery[global.chartarget[myself]] = obj_yellow_enemy.y + 70;
                    
                    with (obj_yellow_enemy)
                    {
                        blockcon = 1;
                        blocktimer = 0;
                        hurtsprite = spr_yellow_block;
                    }
                }
            }
            
            if (i_ex(obj_trashy_trio))
            {
                if (global.chartarget[myself] == obj_trashy_trio.myself)
                {
                    if (points)
                    {
                        with (obj_trashy_trio)
                        {
                            blocked_last_turn = true;
                            
                            if (back == 0)
                                back = 30;
                            else
                                back = 30;
                        }
                    }
                }
            }

            
            dm = instance_create(global.monsterx[global.chartarget[myself]], (global.monstery[global.chartarget[myself]] - (global.hittarget[global.chartarget[myself]] * 20)) + 20, obj_dmgwriter);
            dm.type = char - 1;
            
            if (char == 4)
                dm.type = 6;
            
            dm.delay = 8;
            
            if (object_index == obj_herosusie && scr_weaponcheck_equipped_any(54))
            {
                star = 1;
                var healamt = ceil(global.maxhp[2] * 0.1);
                scr_healitemspell(healamt);
            }
            
            damage = round(((global.battleat[myself] * points) / 20) - (global.monsterdf[global.chartarget[myself]] * 3));
            
            if (global.monstertype[global.chartarget[myself]] == 19)
                damage = ceil(damage * 0.3);
            
            if (i_ex(obj_trashy_trio))
                damage = ceil(damage * 0.1);
                
            // HeadSmasher 1
            if (object_index == obj_herosusie && global.charweapon[2] == 203)
            {
                if (scr_monsterpop() == 3)
                    damage = round(damage * 0.5);
                
                if (scr_monsterpop() == 2)
                    damage = round(damage * 0.75);
            }
            
            // HeadSmasher 2
            if (object_index == obj_herosusie && global.charweapon[2] == 203)
            {
                for (i = 0; i < 3; i += 1)
                {
                    if (global.monster[i] == true && global.chartarget[myself] != i)
                    {
                        global.hittarget[i] += 1;
                        dm = instance_create(global.monsterx[i], (global.monstery[i] - (global.hittarget[i] * 20)) + 20, obj_dmgwriter);
                        dm.type = char - 1;
                        
                        if (char == 4)
                            dm.type = 6;
                        
                        dm.delay = 8;
                        
                        if (damage == 0)
                            dm.delay = 2;
                        
                        global.monsterhp[i] -= damage;
                        dm.damage = damage;
                    }
                }
            }
            
            // SwallowSword
            if (object_index == obj_herokris && global.charweapon[1] == 200)
            {
                jokerbonus = floor(random(20));
                
                if (jokerbonus <= 12)
                {
                    jokerbonusdmg = floor(random_range(global.battlemag[0] * 8, global.battlemag[0] * 13));
                    global.monsterhp[global.chartarget[myself]] -= jokerbonusdmg;
                    dm.damage += jokerbonusdmg;
                    snd_play(snd_joker_ha1); // DON'T FORGET TO ADD THE SOUND, J!!!
                }
            }
            
            if (damage < 0)
                damage = 0;
            
            if (damage == 0)
            {
                dm.delay = 2;
                
                with (global.monsterinstance[global.chartarget[myself]])
                {
                    if (hurttimer <= 15 && candodge == 1)
                    {
                        dodgetimer = 0;
                        state = 4;
                    }
                }
            }
            
            dm.damage = damage;
            
            if (global.chapter == 5 && i_ex(obj_pink_enemy))
                dm.damage = 0;
            
            global.hittarget[global.chartarget[myself]] += 1;
            
            if (!i_ex(obj_trashy_trio))
                global.monsterhp[global.chartarget[myself]] -= damage;
            
            if (global.chapter == 5 && i_ex(obj_seth_shinobeetle_controller))
            {
                if (global.monsterhp[global.chartarget[myself]] < 1)
                    global.monsterhp[global.chartarget[myself]] = 1;
            }
            
            if (variable_instance_exists(global.monsterinstance[global.chartarget[myself]], "callback_on_damage"))
                global.monsterinstance[global.chartarget[myself]].callback_on_damage(id);
            
            if (global.monsterhp[global.chartarget[myself]] <= 0)
            {
                with (global.monsterinstance[global.chartarget[myself]])
                    scr_monsterdefeat();
            }
            
            if (global.monsterhp[global.chartarget[myself]] <= 0)
                global.monster[global.chartarget[myself]] = 0;
            
            if (is_auto_susie == 1 && global.monsterhp[global.chartarget[myself]] <= 0)
            {
                with (global.chartarget[myself])
                    global.flag[51 + myself] = 5;
            }
            
            if (damage > 0)
            {
                // ClownCollar
                var mult = 1 + scr_armorcheck_equipped_party(17) * 0.5 // 1;
                if (object_index == obj_heroralsei && global.charweapon[3] == 201 && points >= 150)
                    mult *= 2.5;
                
                scr_tensionheal( (round(points / 10)) * mult);
                
                // NoseBlade
                if (object_index == obj_herokris && global.charweapon[1] == 204)
                {
                    if (points >= 150)
                    {
                        snd_play(snd_coin);
                        global.gold += 350;
                        // Add Flowery Dollars here later. Maybe make so that you gain both?
                    }
                }
                
                attack = instance_create(global.monsterx[global.chartarget[myself]] + random(6), global.monstery[global.chartarget[myself]] + random(6), obj_basicattack);
                
                if (i_ex(obj_trashy_trio))
                {
                    if (global.chartarget[myself] == obj_trashy_trio.myself)
                    {
                        with (obj_battlecontroller)
                        {
                            damagenoise = 0;
                            bumpnoise = 1;
                        }
                    }
                }
                
                if (global.monstertype[global.chartarget[myself]] == 116)
                    attack.y += 20;
                    
                // HeadSmasher 3
                if (object_index == obj_herosusie && global.charweapon[2] == 203)
                {
                    attack.sprite_index = spr_attack_mash2;
                    attack.image_speed = 0.5;
                    attack.maxindex = 4;
                    snd_play(snd_impact);
                    instance_create(0, 0, obj_shake);
                    
                    for (i = 0; i < 3; i += 1)
                    {
                        if (global.monster[i] == true && global.chartarget[myself] != i)
                        {
                            global.hittarget[i] += 1;
                            attack = instance_create(global.monsterx[i] + random(6), global.monstery[i] + random(6), obj_basicattack);
                        }
                        
                        attack.sprite_index = spr_attack_mash2;
                        attack.image_speed = 0.5;
                        attack.maxindex = 4;
                        instance_create(0, 0, obj_shake);
                    }
                }
                
                if (object_index == obj_herosusie)
                {
                    attack.sprite_index = spr_attack_mash2;
                    attack.image_speed = 0.5;
                    attack.maxindex = 4;
                    
                    if (!i_ex(obj_trashy_trio))
                        snd_play(snd_impact);
                    
                    instance_create(0, 0, obj_shake);
                }
                
                if (object_index == obj_heroralsei)
                {
                    attack.sprite_index = spr_attack_slap1;
                    attack.maxindex = 4;
                    attack.image_speed = 0.5;
                }
                
                if (object_index == obj_heronoelle)
                {
                    attack.sprite_index = spr_attack_slap2;
                    attack.maxindex = 4;
                    attack.image_speed = 0.5;
                }
                
                if (points == 150)
                {
                    attack.image_xscale = 2.5;
                    attack.image_yscale = 2.5;
                }
                
                if (global.charweapon[global.char[myself]] == 26)
                {
                    attack.sprite_index = spr_attack_shard;
                    attack.image_speed = 0.334;
                }
                
                // HeadSmasher 4
                if (object_index == obj_herosusie && global.charweapon[2] == 203)
                {
                    if (global.monster[2] == true)
                    {
                        with (global.monsterinstance[2])
                        {
                            shakex = 9;
                            state = 3;
                            hurttimer = 30;
                        }
                    }
                    
                    if (global.monster[1] == true)
                    {
                        with (global.monsterinstance[1])
                        {
                            shakex = 9;
                            state = 3;
                            hurttimer = 30;
                        }
                    }
                    
                    if (global.monster[0] == true)
                    {
                        with (global.monsterinstance[0])
                        {
                            shakex = 9;
                            state = 3;
                            hurttimer = 30;
                        }
                    }
                }
                
                with (global.monsterinstance[global.chartarget[myself]])
                {
                    shakex = 9;
                    state = 3;
                    hurttimer = 30;
                    
                    if (global.chapter == 5 && i_ex(obj_flowery_enemy))
                    {
                        with (obj_flowery_enemy)
                            force_hurt_sprite = true;
                    }
                }
                
                if (instance_exists(global.monsterinstance[global.chartarget[myself]]))
                    global.monsterinstance[global.chartarget[myself]].hurtamt = damage;
            }
        }
    }
}

// HeadSmasher 5
if (object_index == obj_herosusie && global.charweapon[2] == 203)
{
    if (global.monster[2] == true && global.monsterhp[2] <= 0)
    {
        with (global.monsterinstance[2])
            scr_monsterdefeat();
    }
    
    if (global.monster[1] == true && global.monsterhp[1] <= 0)
    {
        with (global.monsterinstance[1])
            scr_monsterdefeat();
    }
    
    if (global.monster[0] == true && global.monsterhp[0] <= 0)
    {
        with (global.monsterinstance[0])
            scr_monsterdefeat();
    }
}

if (spelltimer > 0)
{
    spelltimer--;
    
    if (spelltimer == 0)
    {
        if (spellframes > 0)
            global.faceaction[myself] = 0;
        
        if (scr_monsterpop() > 0)
            scr_spell(global.charspecial[myself], myself);
        
        state = 0;
        attacktimer = 0;
    }
}
