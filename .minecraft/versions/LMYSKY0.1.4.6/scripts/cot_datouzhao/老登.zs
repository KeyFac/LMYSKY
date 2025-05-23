#loader contenttweaker
#priority 114

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ItemFood;
import crafttweaker.world.IExplosion;
import mods.contenttweaker.Commands;

var ohxihh as ItemFood = VanillaFactory.createItemFood("ohxihh", 20);
ohxihh.maxStackSize = 64;
ohxihh.creativeTab = <creativetab:misc>;
ohxihh.saturation = 20;
ohxihh.alwaysEdible = true;
ohxihh.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(6000, 4));
        player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(6000, 4));
        player.addPotionEffect(<potion:minecraft:water_breathing>.makePotionEffect(6000, 0));
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(6000,4));
        player.addPotionEffect(<potion:minecraft:health_boost>.makePotionEffect(6000, 99));
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(6000, 4));
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(6000, 4));
        player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(6000, 0));
        player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(6000, 0));
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(6000, 4));
    }
};
ohxihh.register();

var LiuMing324 as ItemFood = VanillaFactory.createItemFood("LiuMing324", 20);
LiuMing324.maxStackSize = 64;
LiuMing324.creativeTab = <creativetab:misc>;
LiuMing324.saturation = 0.8;
LiuMing324.alwaysEdible = true;
LiuMing324.onItemFoodEaten = function(stack, world, player) {
    if (!world.remote) {
        player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(1200,5));
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(1200, 5));
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(1200, 5));
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(1200,5));
        player.addPotionEffect(<potion:minecraft:absorption>.makePotionEffect(1200,5));
        player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(1200,5));
        player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(1200,1));
        player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(1200,2));
    }
};
LiuMing324.register();


function food(name as string)as void
{
    var Foods as ItemFood = VanillaFactory.createItemFood(name, 20);
    Foods.maxStackSize = 64;
    Foods.creativeTab = <creativetab:misc>;
    Foods.saturation = 0.8;
    Foods.alwaysEdible = true;
    Foods.onItemFoodEaten = function(stack, world, player) {
        if (!world.remote) {
            player.addPotionEffect(<potion:minecraft:instant_health>.makePotionEffect(1200,2));
            player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(1200,2));
            player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(1200,1));
        }
    };
    Foods.register();
}
food("nanami_chiaaki");
food("wu_ming");
food("xiu");
food("z6z");
food("MoSong");
food("qi_shui");
food("ma_lou");
food("ao_tuo_pu_lei");
food("xiao_yi");
food("sweet_qiu_ming");
food("A90ni");
food("RuiXuqi");
food("Xishuai_");
food("xian_bei");
food("keLeTu");
food("Hikari_Nova");
food("wu_liao_wasd");
food("Rikka");
food("douyun");
food("ximen114");
food("hazza");
food("afei");
food("kqueen");
food("mayogo");
food("zhushen");
food("huiyidetiankong");
food("qianyibai");
food("mcflsh");
food("ZhiXiaoMa");
food("leijun");
food("Rastrshine");
food("youyihj");