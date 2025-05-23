import crafttweaker.item.IItemStack;



<contenttweaker:ohxihh>.addTooltip("§eohxihh纪念品");
<contenttweaker:ohxihh>.addTooltip("写魔改好累,好想摸鱼...");
<contenttweaker:ohxihh>.addTooltip("精神状态十分健康");
mods.extendedcrafting.TableCrafting.addShaped(4, <contenttweaker:ohxihh>, [
	[<ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotInfinity>], 
	[<ore:ingotInfinity>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:gearChaoticMetal>, <tconevo:metal_block:8>, <ore:gearChaoticMetal>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotInfinity>], 
	[<ore:ingotInfinity>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <tconevo:metal_block:8>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:ingotInfinity>], 
	[<ore:ingotCosmicNeutronium>, <ore:gearChaoticMetal>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <tconevo:metal_block:8>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:gearChaoticMetal>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <tconevo:metal_block:7>, <tconevo:metal_block:7>, <tconevo:metal_block:7>, <extrabotany:silenteternity>, <tconevo:metal_block:7>, <tconevo:metal_block:7>, <tconevo:metal_block:7>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotCosmicNeutronium>, <ore:gearChaoticMetal>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <tconevo:metal_block:8>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:gearChaoticMetal>, <ore:ingotCosmicNeutronium>], 
	[<ore:ingotInfinity>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <tconevo:metal_block:8>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:ingotInfinity>], 
	[<ore:ingotInfinity>, <ore:circuitUltimate>, <ore:ingotCrystalMatrix>, <ore:gearChaoticMetal>, <tconevo:metal_block:8>, <ore:gearChaoticMetal>, <ore:ingotCrystalMatrix>, <ore:circuitUltimate>, <ore:ingotInfinity>], 
	[<ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotCosmicNeutronium>, <ore:ingotInfinity>, <ore:ingotInfinity>, <ore:ingotInfinity>]
]);


recipes.addShaped(<contenttweaker:z6z>, [[<ore:runeWaterB>, <cookingforblockheads:sink>, <ore:runeWaterB>], [<ore:runeWaterB>, <mob_grinding_utils:tank>, <ore:runeWaterB>], [<ore:runeWaterB>, <enderio:block_reservoir>, <ore:runeWaterB>]]);
mods.extendedcrafting.TableCrafting.addShaped(3, <minecraft:diamond_boots>.withTag({ench: [{lvl: 255 as short, id: 0 as short}, {lvl: 255 as short, id: 5 as short}, {lvl: 255 as short, id: 33 as short}], Unbreakable: 1 as byte, HideFlags: 2, display: {Name: "§r§bZ6Z的玉足"}, AttributeModifiers: [{UUIDMost: 2343167672143689845 as long, UUIDLeast: -1469433773615227221 as long, Amount: 10, AttributeName: "generic.attackDamage", Operation: 0, Name: "generic.attackDamage"}, {UUIDMost: 2869436158953689361 as long, UUIDLeast: -1645115871651287331 as long, Amount: 100, AttributeName: "generic.maxHealth", Operation: 0, Name: "generic.maxHealth"}, {UUIDMost: 2273939919886768694 as long, UUIDLeast: -1178714165821527666 as long, Amount: 10, AttributeName: "generic.luck", Operation: 0, Name: "generic.luck"}, {UUIDMost: 2612337379678935621 as long, UUIDLeast: -1567396621942826544 as long, Amount: 2000, AttributeName: "generic.reachDistance", Operation: 0, Name: "generic.reachDistance"}]}), [
	[<ore:blockLapis>, <ore:blockLapis>, <minecraft:piston>, <minecraft:diamond_boots>, <minecraft:piston>, <ore:blockDiamond>, <ore:blockDiamond>], 
	[<ore:blockLapis>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:ingotIron>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:blockDiamond>], 
	[<minecraft:piston>, <minecraft:sticky_piston>, <ore:gemDiamond>, <ore:ingotIron>, <ore:gemDiamond>, <minecraft:sticky_piston>, <minecraft:piston>], 
	[<minecraft:diamond_boots>, <ore:ingotIron>, <ore:itemCoal>, <contenttweaker:z6z>, <ore:itemCoal>, <ore:ingotIron>, <minecraft:diamond_boots>], 
	[<minecraft:piston>, <minecraft:sticky_piston>, <ore:alloyBasic>, <ore:ingotGold>, <ore:alloyBasic>, <minecraft:sticky_piston>, <minecraft:piston>], 
	[<ore:blockRedstone>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:ingotIron>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:blockGold>], 
	[<ore:blockRedstone>, <ore:blockRedstone>, <minecraft:piston>, <minecraft:diamond_boots>, <minecraft:piston>, <ore:blockGold>, <ore:blockGold>]
]);

recipes.addShaped(<contenttweaker:qi_shui>, [[<ore:runeEarthB>, <environmentaltech:modifier_fire_resistance>, <ore:runeEarthB>], [<ore:runeEarthB>, <extrabotany:jingweifeather>, <ore:runeEarthB>], [<ore:runeEarthB>, <environmentaltech:modifier_fire_resistance>, <ore:runeEarthB>]]);
mods.extendedcrafting.TableCrafting.addShaped(3, <minecraft:diamond_leggings>.withTag({ench: [{lvl: 100 as short, id: 35 as short}], Unbreakable: 1 as byte, HideFlags: 2, display: {Name: "§r§b七水的内裤"}, AttributeModifiers: [{UUIDMost: 2921595893515571421 as long, UUIDLeast: -1154458935677445179 as long, Amount: 200, AttributeName: "generic.attackDamage", Operation: 0, Name: "generic.attackDamage"}, {UUIDMost: 2965492774433816895 as long, UUIDLeast: -1565996512942484849 as long, Amount: 200, AttributeName: "generic.maxHealth", Operation: 0, Name: "generic.maxHealth"}, {UUIDMost: 2543112661351339131 as long, UUIDLeast: -1179615887896383641 as long, Amount: 2000, AttributeName: "generic.armor", Operation: 0, Name: "generic.armor"}]}), [
	[<ore:blockLapis>, <ore:blockLapis>, <minecraft:piston>, <minecraft:diamond_leggings>, <minecraft:piston>, <ore:blockDiamond>, <ore:blockDiamond>], 
	[<ore:blockLapis>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:ingotIron>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:blockDiamond>], 
	[<minecraft:piston>, <minecraft:sticky_piston>, <ore:gemDiamond>, <ore:ingotIron>, <ore:gemDiamond>, <minecraft:sticky_piston>, <minecraft:piston>], 
	[<minecraft:diamond_leggings>, <ore:ingotIron>, <ore:gemEmerald>, <contenttweaker:qi_shui>, <ore:gemEmerald>, <ore:ingotIron>, <minecraft:diamond_leggings>], 
	[<minecraft:piston>, <minecraft:sticky_piston>, <ore:alloyBasic>, <ore:ingotGold>, <ore:alloyBasic>, <minecraft:sticky_piston>, <minecraft:piston>], 
	[<ore:blockEmerald>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:ingotIron>, <minecraft:sticky_piston>, <minecraft:sticky_piston>, <ore:blockGold>], 
	[<ore:blockEmerald>, <ore:blockEmerald>, <minecraft:piston>, <minecraft:diamond_leggings>, <minecraft:piston>, <ore:blockGold>, <ore:blockGold>]
]);

recipes.addShaped(<contenttweaker:sweet_qiu_ming>, [[<botania:specialflower>.withTag({type: "rannuncarpus"}),<botania:specialflower>.withTag({type: "rannuncarpusChibi"}),<botania:floatingspecialflower>.withTag({type: "rannuncarpus"})], [<botania:floatingspecialflower>.withTag({type: "rannuncarpusChibi"}),<minecraft:crafting_table>,<botania:floatingspecialflower>.withTag({type: "rannuncarpusChibi"})],[<botania:specialflower>.withTag({type: "rannuncarpus"}),<botania:specialflower>.withTag({type: "rannuncarpusChibi"}),<botania:floatingspecialflower>.withTag({type: "rannuncarpus"})]]);