import mods.tconstruct.Casting;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;

for ore in oreDict.entries{
    var oN= ore.name;
    var oI= ore.firstItem;
    if(oN.startsWith("ingot")){
        var name=oN.substring("ingot".length);
        var gear=oreDict.get("gear"~name);
        if(!gear.empty){
            var gI=gear.firstItem;
            Casting.removeTableRecipe(gI);
        }
    }
}