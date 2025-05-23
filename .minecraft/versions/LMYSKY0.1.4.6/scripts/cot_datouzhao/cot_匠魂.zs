#loader contenttweaker
import mods.contenttweaker.tconstruct.TraitBuilder;
import mods.contenttweaker.Color;

import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.IEntityMob;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.util.IAxisAlignedBB;

import mods.tconstruct.traits.AfterHit;
import mods.tconstruct.traits.IsCriticalHit;
import mods.tconstruct.traits.KnockBack;
import mods.tconstruct.traits.OnHit;

import mods.ctutils.utils.Math;

var ctmd_zhong = TraitBuilder.create("ctmd_zhong");
ctmd_zhong.color = Color.fromHex("FF30EA").getIntColor();
ctmd_zhong.localizedName = "忠";
ctmd_zhong.localizedDescription = "手持武器时半径20格内的生物不会主动攻击";
ctmd_zhong.onUpdate=function(thisTrait, tool, world, entity, itemSlot, isSelected){
    if(!entity.world.remote&&(entity instanceof IPlayer)){
        var p as IPlayer=entity;
        if(!isNull(p.currentItem)&&!isNull(p.currentItem.tag)){
            var t=p.currentItem.tag;
            if(!isNull(t.Traits)&&
               t.memberGet("Traits").asString().contains("ctmd_zhong")&&
               !isNull(t.Stats)&&
               (isNull(t.Stats.memberGet("Broken"))||
               (!isNull(t.Stats.memberGet("Broken"))&&t.Stats.memberGet("Broken").asInt()==0))
            ){
                var pos=p.position;
                var pos1 as IBlockPos=pos.add(-20.0D,-20.0D,-20.0D);
                var pos2 as IBlockPos=pos.add(21.0D,21.0D,21.0D);
                for mob in world.getEntitiesWithinAABB(IAxisAlignedBB.create(pos1, pos2)){
                    if(!isNull(mob)&&(mob instanceof IEntityLiving)){
                        if(!isNull(mob.definition)&&mob.isBoss&&mob.dimension==1)return;
                        var m as IEntityLiving=mob;
                        m.attackTarget=null;
                    }
                }
            }
        }    
    }
};
ctmd_zhong.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit){
    if(!target.world.remote&&(attacker instanceof IPlayer)&&(target instanceof IEntityMob)){
        var p as IPlayer=attacker;
        if(!isNull(target.definition)&&target.isBoss&&target.dimension==1)return;
        p.addPotionEffect(<potion:ghostly:ghostly>.makePotionEffect(10, 0));
        if(isNull(target.nbt.ForgeData.Zhong)){
            target.setNBT({Zhong:1});
        }
    }
};
ctmd_zhong.addItem(<item:contenttweaker:blood_steel>);
ctmd_zhong.register();

var ctmd_xiao = TraitBuilder.create("ctmd_xiao");
ctmd_xiao.color = Color.fromHex("8EB0FF").getIntColor();
ctmd_xiao.localizedName = "孝";
ctmd_xiao.localizedDescription = "攻击怪物时将会把半径10格内的怪物传送至一起\n并施加缓慢buff";
ctmd_xiao.onHit = function(thisTrait, tool, attacker, target, damage, isCritical){
    if(!target.world.remote&&!(target instanceof IPlayer)&&target instanceof IEntityMob&&(attacker instanceof IPlayer&&!isNull(tool.tag)&&isNull(tool.tag.ctmd))){
        var pos=target.position;
        var pos1 as IBlockPos=pos.add(-10.0D,-10.0D,-10.0D);
        var pos2 as IBlockPos=pos.add(11.0D,11.0D,11.0D);
        for entity in target.world.getEntitiesWithinAABB(IAxisAlignedBB.create(pos1, pos2)){
            if(!isNull(entity)&&entity instanceof IEntityMob){
                if(!isNull(entity.definition)&&entity.isBoss&&entity.dimension==1)return;
                var m as IEntityMob=entity;
                m.attemptTeleport(target.getX(),target.getY() + 1,target.getZ());
                m.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 2));
            }
        }
    }
};
ctmd_xiao.addItem(<item:contenttweaker:ender_pearl_menrilresin>);
ctmd_xiao.register();

var ctmd_ren = TraitBuilder.create("ctmd_ren");
ctmd_ren.color = Color.fromHex("4B25F7").getIntColor();
ctmd_ren.localizedName = "仁";
ctmd_ren.localizedDescription = "攻击生物时将减少生物5%生命值上限";
ctmd_ren.onHit = function(thisTrait, tool, attacker, target, damage, isCritical){
    if(!target.world.remote&&!target instanceof IPlayer&&attacker instanceof IPlayer){
        if(!isNull(target.definition)&&target.isBoss&&target.dimension==1)return;
        if(!isNull(target.getAttribute("generic.maxHealth"))){
            var mH=target.getAttribute("generic.maxHealth").getBaseValue();
            target.getAttribute("generic.maxHealth").setBaseValue(mH*0.95);
        }
    }
};
ctmd_ren.addItem(<item:contenttweaker:blood_emerald>);
ctmd_ren.register();
 
var ctmd_yi = TraitBuilder.create("ctmd_yi");
ctmd_yi.color = Color.fromHex("F4B93A").getIntColor();
ctmd_yi.localizedName = "义";
ctmd_yi.localizedDescription = "怪物被攻击时半径5格内同种类怪物一起受到伤害";
ctmd_yi.onHit = function(thisTrait, tool, attacker, target, damage, isCritical){
    if(!target.world.remote&&attacker instanceof IPlayer){
        if(!isNull(target.definition) && target.isBoss)return;
        var pos=target.position;
        var pos1 as IBlockPos=pos.add(-5.0D,-5.0D,-5.0D);
        var pos2 as IBlockPos=pos.add(6.0D,6.0D,6.0D);
        if(target instanceof IEntityMob){
            var n1=target.definition.id;
            for entity in target.world.getEntitiesWithinAABB(IAxisAlignedBB.create(pos1, pos2)){
                if(!isNull(entity)&&entity instanceof IEntityMob){
                    var m as IEntityMob=entity;
                    if(m.definition.id == n1){
                        entity.attackEntityFrom(<damageSource:GENERIC>,damage);
                    }
                }
            }
        }
    }
};
ctmd_yi.addItem(<item:contenttweaker:blood_diamond>);
ctmd_yi.register();

var ctmd_li = TraitBuilder.create("ctmd_li");
ctmd_li.color = Color.fromHex("EA0007").getIntColor();
ctmd_li.localizedName = "礼";
ctmd_li.localizedDescription = "攻击将造成1.5倍伤害并击退";
ctmd_li.calcKnockBack = function(thisTrait, tool, attacker, target, damage, knockback, newKnockback, isCritical){
    if(!target.world.remote&&attacker instanceof IPlayer){
        var k=knockback + 1.0f;
        return k;
    }
    return knockback;
};
ctmd_li.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical){
    if(!target.world.remote&&attacker instanceof IPlayer){
        var d=newDamage * 1.5;
        return d;
    }
    return newDamage;
};
ctmd_li.addItem(<item:contenttweaker:blood_lapis>);
ctmd_li.register();

var ctmd_zhi = TraitBuilder.create("ctmd_zhi");
ctmd_zhi.color = Color.fromHex("47EFDE").getIntColor();
ctmd_zhi.localizedName = "智";
ctmd_zhi.localizedDescription = "攻击生物时给玩家提供增益buff\n并有几率恢复造成伤害数值的血量";
ctmd_zhi.onHit = function(thisTrait, tool, attacker, target, damage, isCritical){
    if(!target.world.remote&&attacker instanceof IPlayer&&!isNull(tool.tag)&&isNull(tool.tag.ctmd)){
        if(!isNull(target.definition)&&target.isBoss&&target.dimension==1)return;
        var p as IPlayer=attacker;
        p.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(100, 2));
        p.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(100, 1));
    }
};
ctmd_zhi.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit){
    if(!target.world.remote&&attacker instanceof IPlayer){
        if(!isNull(target.definition)&&target.isBoss&&target.dimension==1)return;
        var p as IPlayer=attacker;
        if(Math.random() > 0.6){
            p.heal(damageDealt);
        }
    }
};
ctmd_zhi.addItem(<item:contenttweaker:blood_pearl>);
ctmd_zhi.register();

var ctmd_xing = TraitBuilder.create("ctmd_xing");
ctmd_xing.color = Color.fromHex("4E7DED").getIntColor();
ctmd_xing.localizedName = "信";
ctmd_xing.localizedDescription = "被攻击的生物额外受到一段伤害";
ctmd_xing.onHit = function(thisTrait, tool, attacker, target, damage, isCritical){
    if(!target.world.remote&&attacker instanceof IPlayer){
        if(!isNull(target.definition)&&target.isBoss&&target.dimension==1)return;
        target.attackEntityFrom(<damageSource:GENERIC>,damage);
    }
};
ctmd_xing.addItem(<item:contenttweaker:blood_powder>);
ctmd_xing.register();

var leijun = TraitBuilder.create("leijun");
leijun.color = Color.fromHex("FF6A00").getIntColor();
leijun.localizedName = "雷军の护佑";
leijun.localizedDescription = "挖掘任意方块有1%概率掉落加速火把";
leijun.addItem(<item:torcherino:blockdoublecompressedtorcherino>);
leijun.register();