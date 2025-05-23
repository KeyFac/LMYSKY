#loader avaritiaitem

import mods.avaritiaitem.AvaritiaItemBuilder;
import mods.avaritiaitem.ItemPrimer;

function ranbowItem(name as string) as void{
    AvaritiaItemBuilder.registerItem(name,64,name)
    .shouldDrawHalo(true)
    .haloSize(8)
    .haloColour("000000")
    .shouldDrawPulse(true)
    .colorfulName(true)
    .addTooltip("一即全，全即一。", true)
    .create();
}
var nameRanbow as string[]=[
    "ingot_rainbow_pro",
    "ingot_rainbow_pro_max",
    "gear_rainbow_pro",
    "gear_rainbow_pro_max",
    "plate_rainbow_pro",
    "plate_rainbow_pro_max",
    "singularity_rainbow_pro",
    "singularity_rainbow_pro_max",
    "infinity_otto",
    "matter_rainbow_pro"
];
for i in nameRanbow{
    ranbowItem(i);
}