#loader contenttweaker

import mods.contenttweaker.VanillaFactory;

import mods.randomtweaker.cote.ISubTileEntityFunctional;
import mods.randomtweaker.cote.Update;
import mods.randomtweaker.cote.ISubTileEntityGenerating;

import crafttweaker.world.IBlockPos;
import crafttweaker.data.IData;

import mods.zenutils.CatenationContext;
import mods.zenutils.DataUpdateOperation.MERGE;

var serenitian=VanillaFactory.createSubTileFunctional("ExtraBotany_serenitian",0xFFFFFF);
serenitian.maxMana=100;
serenitian.range=3;
serenitian.unlocalizedName="ExtraBotany_serenitian";
serenitian.overgrowthAffected=false;
serenitian.onUpdate=function(subtile, world, pos){
    if(!world.remote){
        var Time=world.worldInfo.getWorldTotalTime();
        var dTime=Time + 3456000;
        var down=pos.add(0, -1, 0);
        if(isNull(subtile.data.time)){
            subtile.updateCustomData({time : dTime});
        }else if(subtile.data.time.asLong() <= Time&&!isNull(world.getBlock(down))&&!isNull(world.getBlock(down).definition)&&world.getBlock(down).definition.id!="botania:enchantedsoil"){
            world.setBlockState(<blockstate:minecraft:deadbush>,pos);
            world.performExplosion(null,pos.x,pos.y,pos.z,10.0,false,false);
            for player in world.getPlayers(){
                if(!isNull(player)&&!player.fake) player.sendChat(game.localize(pos.x~","~pos.y~","~pos.z~"处有什么枯萎了。"));
            }
        }
        var pos1=pos.add(-3,0,-3);
        var pos2=pos.add(3,0,3);
        for bPos in IBlockPos.getAllInBox(pos1,pos2){
            if(!isNull(world.getBlock(bPos))){
                var bA=world.getBlock(bPos);
                if(!isNull(bA.data)&&!isNull(bA.data.subTileCmp)&&!isNull(bA.data.subTileCmp.passiveDecayTicks)){
                    var cmpData as IData=bA.data.subTileCmp;
                    var blocksata=world.getBlockState(bPos);
                    if(cmpData.memberGet("passiveDecayTicks") >= 1200){
                        if(isNull(bA.data.subTileCmp.burnTime)){
                            var newData=bA.data.deepUpdate({"subTileCmp":{"passiveDecayTicks":0}}, MERGE);
                            world.setBlockState(blocksata,newData,bPos);
                        }else{
                            var newData=bA.data.deepUpdate({"subTileCmp":{"passiveDecayTicks":0,"burnTime":0}}, MERGE);
                            world.setBlockState(blocksata,newData,bPos);
                        }
                    }
                }
            }
        }
    }
};
serenitian.register();