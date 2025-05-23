#reloadable
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.block.IBlock;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IExplosion;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityLiving;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.entity.Attribute;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.util.IAxisAlignedBB;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.entity.IEntityItem;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.block.IBlockState;
import crafttweaker.player.IFoodStats;
import crafttweaker.liquid.ILiquidDefinition;

import crafttweaker.event.PlayerAttackEntityEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.event.IEventCancelable;
import crafttweaker.event.ItemTossEvent;
import crafttweaker.event.BlockPlaceEvent;
import crafttweaker.event.EntityStruckByLightningEvent;
import crafttweaker.event.ItemExpireEvent;
import crafttweaker.event.IEntityEvent;
import crafttweaker.event.PlayerLoggedInEvent;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.event.PlayerDeathDropsEvent;
import crafttweaker.event.PlayerLeftClickBlockEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityLivingHurtEvent;
import crafttweaker.event.EnderTeleportEvent;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.BlockNeighborNotifyEvent;
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.event.PlayerInteractEvent;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.event.EntityLivingUseItemEvent.All;

import mods.contenttweaker.tconstruct.Trait;

import mods.zenutils.CatenationContext;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;

import mods.ctutils.utils.Math;

import mods.eventtweaker.event.ClientChatEvent;
import mods.eventtweaker.Minecraft as MC;

import crafttweaker.event.ITickEvent;
import crafttweaker.event.PlayerTickEvent;


function TiCToolNotBroken(item as IItemStack) as bool {
    if(!isNull(item)&&
       !isNull(item.definition)&&
       !isNull(item.definition.id)&&
       !isNull(item.tag)&&
       !isNull(item.tag.Stats)&&
       (isNull(item.tag.Stats.memberGet("Broken"))||
       (!isNull(item.tag.Stats.memberGet("Broken"))&&
       item.tag.Stats.memberGet("Broken").asInt()==0))){
        return true;
    }else return false;
}

function pInWorld(pName as string,item as IItemStack)as void
{
    events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
        var p as IPlayer=event.player;
        var w as IWorld=p.world;
        var data as IData=p.data;
        if(w.remote)return;
        if(p.name == pName){
            if(!isNull(data.PlayerPersisted.Sponsor)){
                var dI as int=data.PlayerPersisted.memberGet("Sponsor").asInt();
                if(dI == 0){
                    p.give(item);
                }
            }else{
                p.give(item);
                p.give(<contenttweaker:key1>);
                p.update({PlayerPersisted:{Sponsor:1}});
            }
        }
    });
    events.onPlayerDeathDrops(function(event as PlayerDeathDropsEvent) {
        if(event.player.name == pName) {
            event.addItem(<contenttweaker:shit>);
        }
    });
}

events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent) {
    var w as IWorld=event.world;
    var p as IPlayer=event.player;
    var data as IData=p.data;
    if(w.remote)return;
    if(isNull(p.currentItem))return;
    if(!isNull(data.PlayerPersisted.Sponsor)){
        var dI as int=data.PlayerPersisted.memberGet("Sponsor").asInt();
        if(p.currentItem.commandString == "<contenttweaker:key>"){
            p.update({PlayerPersisted:{Sponsor:1}});
            p.sendStatusMessage(format.red("现已禁止每次登录领取纪念品"));
        }
        if(p.currentItem.commandString == "<contenttweaker:key1>"){
            p.update({PlayerPersisted:{Sponsor:0}});
            p.sendStatusMessage(format.red("现已允许每次登录领取纪念品"));
        }
    }
});

pInWorld("Tyumen_",<contenttweaker:sweet_qiu_ming>);
pInWorld("ohxihh",<contenttweaker:ohxihh>);
pInWorld("xiaoyi",<contenttweaker:xiao_yi>);
pInWorld("Xiaoyi",<contenttweaker:xiao_yi>);
pInWorld("qiashui",<contenttweaker:qi_shui>);
pInWorld("z6z",<contenttweaker:z6z>);
pInWorld("A90ni",<contenttweaker:a90ni>);
pInWorld("xian_bei",<contenttweaker:shit>);
pInWorld("he_quan_sha_wu",<contenttweaker:ma_lou>);
pInWorld("RuiXuqi",<contenttweaker:ruixuqi>);
pInWorld("Xishuai_",<contenttweaker:xishuai_>);
pInWorld("lmy_not_hard",<contenttweaker:xian_bei>);
pInWorld("GT:New_Horizons",<appliedenergistics2:creative_storage_cell>);
pInWorld("www",<contenttweaker:mosong>);
pInWorld("xueluoqiujiang",<contenttweaker:mosong>);
pInWorld("LiuMing324",<contenttweaker:liuming324>);
pInWorld("lui_ming",<contenttweaker:liuming324>);
pInWorld("keletu",<contenttweaker:keletu>);
pInWorld("Hikari_Nova",<contenttweaker:hikari_nova>);
pInWorld("Nekomula",<contenttweaker:ao_tuo_pu_lei>);
pInWorld("wu_liao_wasd",<contenttweaker:wu_liao_wasd>);
pInWorld("Rikka",<contenttweaker:rikka>);
pInWorld("douyun",<contenttweaker:douyun>);
pInWorld("ximen114",<contenttweaker:ximen114>);
pInWorld("hazza",<contenttweaker:hazza>);
pInWorld("爱撅仙贝",<contenttweaker:afei>);
pInWorld("LingJiuQiSan",<contenttweaker:nanami_chiaaki>);
pInWorld("kqueen",<contenttweaker:kqueen>);
pInWorld("Mayogo",<contenttweaker:mayogo>);
pInWorld("MCflsh",<contenttweaker:mcflsh>);
pInWorld("ZhiXiaoMa",<contenttweaker:zhixiaoma>);
pInWorld("By_Sesame",<contenttweaker:zhixiaoma>);
pInWorld("LaoGouYYDS",<contenttweaker:leijun>);
pInWorld("Rastarshine",<contenttweaker:rastrshine>);
pInWorld("youyihj",<contenttweaker:youyihj>);

function pInWorldNew(pName as string,item as IItemStack)as void
{
    events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
        var p as IPlayer=event.player;
        var w as IWorld=p.world;
        var data as IData=p.data;
        if(w.remote)return;
        if(p.name == pName){
            if(!isNull(data.PlayerPersisted.SponsorItem))return;
            p.give(item);
            p.update({PlayerPersisted:{SponsorItem:1}});
        }
    });
}
pInWorldNew("Rastarshine",<botania:specialflower>.withTag({type: "ExtraBotany_serenitian"}));

events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent){
    var i as IItemStack=event.item;
    var b as IBlock=event.block;
    var w as IWorld=event.world;
    var p as IPlayer =event.player;

    if(w.remote)return;
    if(isNull(i))return;
    if(isNull(i.definition))return;
    if(isNull(b))return;
    if(isNull(b.definition))return;
    if(isNull(b.data))return;
    var bD as IData=b.data;
    var bN as string=b.definition.id;
    if(i.definition.id has "mekanism:tierinstaller"&&i.damage == 4){
        if(!isNull(bD.tier)){
            var tier as int=bD.memberGet("tier").asInt();
            if(tier == 3){
                if(bN has "mekanism:machineblock2"&&b.meta == 11){
                    event.cancel();
                    p.sendStatusMessage(format.red("干什么？？！！！"));
                }
                if(bN has "mekanism:energycube"){
                    event.cancel();
                    p.sendStatusMessage(format.red("干什么？？！！！"));
                }
                if(bN has "mekanism:basicblock"&&b.meta ==6){
                    event.cancel();
                    p.sendStatusMessage(format.red("干什么？？！！！"));
                }
                if(bN has "mekanism:gastank"){
                    event.cancel();
                    p.sendStatusMessage(format.red("干什么？？！！！"));
                }
            }
        }
    }
});

events.onClientChat(function(event as ClientChatEvent) {
    var m as string=event.getMessage();
    if(m == "1"){
        var p as IPlayer=MC.getPlayer();
        if(isNull(p))return;
        p.give(<contenttweaker:xiao_bu_ding>);
        p.clearActivePotions();
        p.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(480, 6));
        event.setMessage("我回来了！孩子们！");
    }
});

events.onEntityLivingHurt(function(event as EntityLivingHurtEvent){
    if(isNull(event.entity)||event.entity.isAlive())return;
    var entity=event.entity;
    var w=entity.world;
    var damage=event.amount;

    if(w.remote)return;
    if(entity instanceof IPlayer)return;
    if(event.damageSource.immediateSource instanceof IPlayer){
        var p as IPlayer=event.damageSource.immediateSource;
        if(TiCToolNotBroken(p.currentItem)){
            var item=p.currentItem;
            if(!isNull(item.tag.Traits)){
                var n =item.tag.memberGet("Traits").asString();
                if(!n.contains("ctmd_zhong"))return;//不忠
                if(!n.contains("ctmd_xiao"))return;//不孝
                if(!n.contains("ctmd_ren"))return;//不仁
                if(!n.contains("ctmd_yi"))return;//不义
                if(!n.contains("ctmd_li"))return;//不理
                if(!n.contains("ctmd_zhi"))return;//不智
                if(!n.contains("ctmd_xing"))return;//不信
                if(entity instanceof IEntityLivingBase){
                    var e as IEntityLivingBase=entity;
                    var eD=e.definition.id;
                    var stat=p.foodStats;
                    var pos=entity.position;
                    var pos1 as IBlockPos=pos.add(-10.0D,-10.0D,-10.0D);
                    var pos2 as IBlockPos=pos.add(11.0D,11.0D,11.0D);
                    e.revengeTarget=e;//忠
                    if(!isNull(e.getAttribute("generic.maxHealth"))){//仁
                        var mH=e.getAttribute("generic.maxHealth").getBaseValue();
                        e.getAttribute("generic.maxHealth").setBaseValue(mH*0.95);
                    }
                    for yiE in w.getEntitiesWithinAABB(IAxisAlignedBB.create(pos1, pos2)){//义
                        if(!isNull(yiE)&&yiE instanceof IEntityMob){
                            var mob as IEntityMob=yiE;
                            if(mob.definition.id == eD){
                                mob.attackEntityFrom(<damageSource:GENERIC>,damage);
                                mob.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(200, 2));
                            }
                        }
                    }
                    event.amount=damage * 1.2;//礼
                    p.heal(damage);
                    stat.addStats(1,damage);
                    e.attackEntityFrom(<damageSource:GENERIC>,damage);//信
                    e.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(200, 2));
                    if(isNull(item.tag.ctmd)) item.mutable().updateTag({ctmd:1 as int});
                }
            }
        }
        
    }
});

events.onPlayerAttackEntity(function(event as PlayerAttackEntityEvent){
    var entity=event.target;
    var p=event.player;
    var w=entity.world;

    if(w.remote)return;
    if(p.fake)return;
    if(!isNull(entity.definition)&&entity.isBoss&&entity.dimension==1)return;
    if(!isNull(p.currentItem)){
        var item=p.currentItem;
        if(!isNull(item.tag)&&!isNull(item.tag.Stats)&&
           !isNull(item.tag.ctmd)&&
           (isNull(item.tag.Stats.memberGet("Broken"))||
           (!isNull(item.tag.Stats.memberGet("Broken"))&&
           item.tag.Stats.memberGet("Broken").asInt()==0))){
            var pos=entity.position;
            var posa as IBlockPos=pos.add(-20.0D,-20.0D,-20.0D);
            var posb as IBlockPos=pos.add(21.0D,21.0D,21.0D);
            for xiaoE in w.getEntitiesWithinAABB(IAxisAlignedBB.create(posa, posb)){//孝
                if(!isNull(xiaoE)&&xiaoE instanceof IEntityMob){
                    var m as IEntityMob=xiaoE;
                    m.attemptTeleport(entity.getX(),entity.getY() + 1,entity.getZ());
                    m.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(2000, 5));
                }
            }
            p.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(200, 4));//智
            p.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(200, 2));
        }
    }
    if(!isNull(entity.nbt)&&!isNull(entity.nbt.ForgeData)&&!isNull(entity.nbt.ForgeData.Zhong)){
        p.addPotionEffect(<potion:ghostly:ghostly>.makePotionEffect(10, 0));
    }
});

events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){
    var entity=event.entity;
    var w=entity.world;
    if(w.remote)return;
    if(!isNull(entity.definition)&&entity.isBoss&&entity.dimension==1)return;
    if(entity instanceof IEntityLiving){
        var m as IEntityLiving=entity;
        if(!isNull(m.nbt)&&!isNull(m.nbt.ForgeData)&&!isNull(m.nbt.ForgeData.Zhong)){
            m.attackTarget=null;
        }
    }
});

events.onEnderTeleport(function(event as EnderTeleportEvent){
    var e=event.entityLivingBase;
    var w=e.world;
    if(w.remote)return;
    if(!isNull(e.definition) && e.isBoss)return;
    if(e instanceof IPlayer)return;
    var pos=e.position;
    var pos1 as IBlockPos=pos.add(-10.0D,-10.0D,-10.0D);
    var pos2 as IBlockPos=pos.add(11.0D,11.0D,11.0D);
    for entity in w.getEntitiesWithinAABB(IAxisAlignedBB.create(pos1, pos2)){
        if(!isNull(entity)&&entity instanceof IPlayer){
            var p as IPlayer=entity;
            if(!isNull(p.currentItem)&&!isNull(p.currentItem.tag)&&!isNull(p.currentItem.tag.ctmd)){
                event.cancel();
            }
        }
    }
});

events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent){
    var p=event.player;
    var i=event.item;
    var w=event.world;
    var b=event.block;
    if(w.remote)return;
    if(isNull(i))return;
    if(i.commandString has "<contenttweaker:siwang>"){
        server.commandManager.executeCommand(server,"mom love @a");
        p.sendChat(game.localize("死亡不掉落已开启"));
    }
    if(i.commandString has "<minecraft:stick>"&&b.definition.id has "modularmachinery:"&&b.definition.id has "controller"){
        i.mutable().shrink(1);
        p.give(<contenttweaker:nova>);
        p.sendChat(game.localize("请使用模块化机械一键搭建手杖搭建"));
        event.cancel();
    }
});
events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent){
    var p=event.player;
    var i=event.item;
    var w=event.world;
    if(w.remote)return;
    if(!isNull(i)&&(i.commandString has "<contenttweaker:siwang>")){
        server.commandManager.executeCommand(server,"mom unlove @a");
        p.sendChat(game.localize("死亡不掉落已关闭"));
    }
});

events.onBlockPlace(function(event as BlockPlaceEvent){
    var p=event.player;
    var b=event.block;
    var w=event.world;
    if(w.remote)return;
    if(isNull(b)||isNull(b.definition)||isNull(b.definition.id))return;
    var name=b.definition.id;
    var names as string[]=[
        "aeadditions:certustank",
        "aeadditions:fluidcrafter",
        "aeadditions:fluidfiller",
        "aeadditions:hardmedrive",
        "aeadditions:vibrantchamberfluid",
        "aeadditions:gas_interface"
    ];
    for i in names{
        if(name has i){
            event.cancel();
            p.sendChat(game.localize("请不要放置这个方块！！放置会导致游戏崩溃！！"));
        }
    }
});

events.onBlockBreak(function(event as BlockBreakEvent){
    var w=event.world;
    if(w.remote||!event.isPlayer||event.player.fake)return;
    var p=event.player;
    var newPos=event.position.add(0,0.5,0);
    var item=p.currentItem;
    if(!TiCToolNotBroken(item))return;
    if(!isNull(item.tag.Traits)){
        var n =item.tag.memberGet("Traits").asString();
        if(!n.contains("leijun"))return;
        if(Math.random()<=0.01){
            w.spawnEntity(<torcherino:blocktorcherino>.createEntityItem(w,newPos));
        }
    }
});

events.onPlayerLeftClickBlock(function(event as PlayerLeftClickBlockEvent) {
    if(event.world.remote)return;
    var p=event.player;
    var pos=p.position3f;
    var item=event.item;
    var newPos=Position3f.create(pos.x - (Math.random()*10),pos.y - (Math.random()*10) + 3,pos.z - (Math.random()*10));
    if(!isNull(item)&&item.commandString=="<contenttweaker:wu_liao_wasd>"){
        p.teleport(newPos);
        p.attackEntityFrom(<damageSource:MAGIC>,5);
        p.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(200,4));
        p.sendStatusMessage(format.red("bug大王"));
    }
});

events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent){
    if(event.world.remote)return;
    var p=event.player;
    var pos=p.position3f;
    var item=event.item;
    var newPos=Position3f.create(pos.x - (Math.random()*10),pos.y - (Math.random()*10) + 3,pos.z - (Math.random()*10));
    if(!isNull(item)&&item.commandString=="<contenttweaker:wu_liao_wasd>"){
        p.teleport(newPos);
        p.attackEntityFrom(<damageSource:MAGIC>,5);
        p.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(200,4));
        p.sendStatusMessage(format.red("bug大王"));
    }
});

events.onPlayerTick(function(event as PlayerTickEvent){
    var p=event.player;
    var w=p.world;
    if(w.remote||event.phase=="END"||!p.isAlive()||p.fake)return;
    var items as IItemStack[]=[
        p.currentItem,
        p.getInventoryStack(40)
    ];
    for i in 0 .. items.length{
        if(isNull(items[i])||isNull(items[i].definition))return;
        if(items[i].definition.id has "contenttweaker:mcflsh"&&!isNull(p.activePotionEffects)){
            var potion=p.activePotionEffects;
            if(potion.length != 0){
                for i in 0 to potion.length{
                    if(potion[i].potion.badEffect) p.removePotionEffect(potion[i].potion);
                }
            }
        }
        if(items[i].definition.id has "ic2:uranium_fuel_rod") p.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(2,1));
    }
});

events.onEntityLivingHurt(function(event as EntityLivingHurtEvent){
    var entity=event.entity;
    var w=entity.world;

    if(w.remote)return;
    if(entity instanceof IPlayer||(!isNull(entity.definition)&&entity.isBoss&&entity.dimension==1))return;
    if(event.damageSource.immediateSource instanceof IPlayer){
        var p as IPlayer=event.damageSource.immediateSource;
        if(isNull(p.currentItem)||isNull(p.currentItem.definition))return;
        var i=p.currentItem;
        if(i.definition.id has "contenttweaker:nova"){
            event.amount += 80.0f;
            p.sendStatusMessage(format.red("圣nova将会引导每位迷途的羔羊"));
        }
    }
});

function him(oldName as string,newName as string)as void{
    events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){
        var entity=event.entity;
        var w=entity.world;
        if(w.remote||entity instanceof IPlayer)return;
        if(isNull(entity.getCustomName()))return;
        if(entity.getCustomName() has oldName){
            entity.setCustomName(newName);
        }
    });

    events.onClientChat(function(event as ClientChatEvent) {
        var m as string=event.getMessage();
        if(m has oldName){
            event.setMessage("不用担心，孩子，him已被移除。");
        }
    });

    events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent){
        var p=event.player;
        var w=p.world;
        if(w.remote)return;
        if(!isNull(p.data.PlayerPersisted.Him))return;
        if(p.name == oldName){
            p.give(<contenttweaker:him>);
            p.update({PlayerPersisted:{Him:true}});
        }
    });

    events.onPlayerInteract(function(event as PlayerInteractEvent){
        var p=event.player;
        var w=event.world;
        var i=event.item;
        if(w.remote)return;
        if(isNull(i)||isNull(i.definition)||p.name!=oldName||p.fake)return;
        if(i.definition.id has "contenttweaker:him"){
            p.clearActivePotions();
            p.health=0;
            p.sendChat(game.localize("不用担心，孩子，him已被移除。"));
        }
    });
}
him("him","fakehim");
him("Him","fakeHim");
him("HIM","fakeHIM");
him("herobrine","fakeherobrine");
him("Herobrine","fakeHerobrine");

events.onItemToss(function(event as ItemTossEvent){
    var i=event.item;
    var ii=i.item;
    var p=event.player;
    var w=p.world;

    if(w.remote)return;
    if(isNull(i)||isNull(ii)||isNull(ii.definition)||p.fake)return;
    if(ii.definition.id=="contenttweaker:projecte_transmute_tablet"){
        if(p.isAlive()){
            if(p.creative) p.executeCommand("gamemode 0");
            p.clearActivePotions();
            w.performExplosion(null,p.x,p.y,p.z,120.0,false,false);
            p.health=0;
            p.attackEntityFrom(<damageSource:FALL>,88888888888888888.0f);
            p.attackEntityFrom(<damageSource:OUT_OF_WORLD>,88888888888888888.0f);
            p.attackEntityFrom(<damageSource:MAGIC>,88888888888888888.0f);
        }
    }
});

// #reloadable
// import crafttweaker.event.PlayerRightClickItemEvent;
// import crafttweaker.util.Math;
// import crafttweaker.world.IVector3d;
// import crafttweaker.entity.IEntityLivingBase;
// import crafttweaker.damage.IDamageSource;

// function getVectorForRotation(pitch as float, yaw as float) as IVector3d {
//     val f = Math.cos(-yaw * 0.017453292f - 3.1415926f);
//     val f1 = Math.sin(-yaw * 0.017453292f - 3.1415926f);
//     val f2 = -Math.cos(-pitch * 0.017453292f);
//     val f3 = Math.sin(-pitch * 0.017453292f);
//     return IVector3d.create(f1 * f2, f3, f * f2);
// }

// events.register(function(event as PlayerRightClickItemEvent) { 
//     val player = event.player;
//     val world = player.world;
//     val item = event.item;
//     if (<minecraft:stick>.matches(item) && !world.remote) {
//         val pitch = player.rotationPitch;
//         val yaw = player.rotationYaw;
//         val dx = -Math.sin(yaw * 0.017453292);
//         val dz = Math.cos(yaw * 0.017453292);
//         val look = getVectorForRotation(pitch, yaw);
//         val eye = IVector3d.create(player.x, player.y + 1.8 * 0.85, player.z);
//         val victims as IEntityLivingBase[string] = {};
//         for i in 0 .. 10 {
//             val centerPos = eye.add(look.scale(i));
//             for entity in world.nearbyEntities(centerPos, 2.0, player).livings() {
//                 victims[entity.uuid] = entity;
//             }
//         }
//         for victim in victims.values {
//             victim.attackEntityFrom(IDamageSource.createPlayerDamage(player), 4.0f);
//         }
//         server.commandManager.executeCommandSilent(server, 
//             `particle sweepAttack ${player.x+dx} ${player.y+0.9} ${player.z+dz} ${dx} 0 ${dz} 0`
//         );
//     }
// });