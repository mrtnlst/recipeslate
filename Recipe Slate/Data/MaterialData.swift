//
//  SampleData.swift
//  Recipe Slate
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

let materialData = [
    
    // Misc.
    Material(materialName: "Hylian Rice", category: [.misc], hearts: 1.0, effect: Effect(type: .duration, duration: 60), saleValue: 3, location: "Store in Kakariko Village\nStore in Hateno Village"),
    Material(materialName: "Goat Butter", category: [.misc], effect: Effect(type: .duration, duration: 80), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Rock Salt", category: [.misc], effect: Effect(type: .duration, duration: 60), saleValue: 3, location: "Ore Deposits"),
    Material(materialName: "Tabantha Wheat", category: [.misc], hearts: 1.0, effect: Effect(type: .duration, duration: 60), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Cane Sugar", category: [.misc], effect: Effect(type: .duration, duration: 80), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Fresh Milk", category: [.misc], hearts: 0.5, effect: Effect(type: .duration, duration: 80), saleValue: 3, location: "Store in Hateno Village"),
    Material(materialName: "Bird Egg", category: [.misc], hearts: 1.0, effect: Effect(type: .duration, duration: 90), saleValue: 4, location: "Nests atop trees"),
    Material(materialName: "Goron Spice", category: [.misc], effect: Effect(type: .duration, duration: 90), saleValue: 4, location: "Store in Goron City"),
    Material(materialName: "Courser Bee Honey", category: [.misc], hearts: 2.0, effect: Effect(type: .restoresStamina, amount: 0.4), saleValue: 10, location: "Hit a bee hive"),
    Material(materialName: "Wood", category: [.misc], hearts: 0.125, saleValue: 2, location: "Felling trees"),
    Material(materialName: "Monster Extract", category: [.misc], hearts: 1.5, effect: Effect(type: .duration, duration: 1800), saleValue: 3, location: "Kilton's Monster Shop"),
    Material(materialName: "Fairy", category: [.misc], hearts: 5.0, effect: Effect(type: .duration, duration: 30), saleValue: 2, location: "Great Fairy Fountains"),
    Material(materialName: "Star Fragment", category: [.misc], effect: Effect(type: .duration, duration: 30), saleValue: 300, location: "Loot from Silver Lynels\nFalling from sky"),
    
    // Mushroom.
    Material(materialName: "Big Hearty Truffle", category: [.mushroom], hearts: 3.0, effect: Effect(type: .temporaryHearts, amount: 4.0), saleValue: 15, location: "Deep Akkala\nHebra Mountains"),
    Material(materialName: "Chillshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 4, location: "Naydra Snowfield below Mount-Lanayru", potency: 2),
    Material(materialName: "Endura Shroom", category: [.mushroom], hearts: 1.0, effect: Effect(type: .extendsStamina, amount: 0.2), saleValue: 6, location: "Hyrule Ridge\nHyrule Field"),
    Material(materialName: "Hearty Truffle", category: [.mushroom], hearts: 2.0, effect: Effect(type: .temporaryHearts, amount: 1.0), saleValue: 6, location: "Ginner Woods by Hateno Village\nGreat Hyrule Forest"),
    Material(materialName: "Hylian Shroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .duration, duration: 30), saleValue: 3, location: "Near trees across Hyrule"),
    Material(materialName: "Ironshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nEast Necluda", potency: 2),
    Material(materialName: "Razorshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nEast Necluda", potency: 2),
    Material(materialName: "Rushshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 3, location: "Great Hyrule Forest\nTabantha Frontier", potency: 1),
    Material(materialName: "Silent Shroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 3, location: "Around Kakariko Village\nWest Necluda", potency: 2),
    Material(materialName: "Stamella Shroom", category: [.mushroom], hearts: 1.0, effect: Effect(type: .restoresStamina, amount: 0.2), saleValue: 5, location: "Near trees across Hyrule\nUnderneath Impa's house"),
    Material(materialName: "Sunshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 4, location: "Retsam Forest above Hateno Village\nDeep Akkala", potency: 2),
    Material(materialName: "Zapshroom", category: [.mushroom], hearts: 0.5, effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 4, location: "Deep Akkala\nGerudo Highlands", potency: 2),
    
    // Fish.
    Material(materialName: "Armored Carp", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Lanayru Great Spring\nEast Necluda", potency: 2),
    Material(materialName: "Armored Porgy", category: [.seafood, .fish, .porgy, .seafoodCurry], hearts: 1.0, effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Necluda Sea\nLanayru Sea", potency: 3),
    Material(materialName: "Chillfin Trout", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 6, location: "Store at Zora's Domain", potency: 3),
    Material(materialName: "Hearty Bass", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 2.0, effect: Effect(type: .temporaryHearts, amount: 2.0), saleValue: 18, location: "Akkala Highlands\nWest Necluda"),
    Material(materialName: "Hyrule Bass", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .duration, duration: 30), saleValue: 6, location: "Rivers and lakes across Hyrule"),
    Material(materialName: "Hearty Salmon", category: [.seafood, .fish], hearts: 4.0, effect: Effect(type: .temporaryHearts, amount: 4.0), saleValue: 10, location: "Lake at the entrance of Rito Village\nHebra Mountains"),
    Material(materialName: "Mighty Carp", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Akkala Highlands\nLanayru Great Spring", potency: 2),
    Material(materialName: "Mighty Porgy", category: [.seafood, .fish, .porgy, .seafoodCurry], hearts: 1.0, effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Necluda Sea\nLanayru Sea", potency: 3),
    Material(materialName: "Sizzlefin Trout", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 6, location: "Store at Zora's Domain\nHot Springs of Eldin Mountains", potency: 3),
    Material(materialName: "Sanke Carp", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .duration, duration: 30), saleValue: 10, location: "West Necluda"),
    Material(materialName: "Staminoka Bass", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .restoresStamina, amount: 1.0), saleValue: 18, location: "Hyrule Field\nWest Necluda"),
    Material(materialName: "Stealthfin Trout", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 6, location: "Lake Saria\nGreat Hyrule Forest", potency: 2),
    Material(materialName: "Voltfin Trout", category: [.seafood, .fish, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 7), saleValue: 6, location: "Inogo Bridge, above Lanayru Tower\nTabantha Frontier", potency: 3),
    
    // Crab.
    Material(materialName: "Bright-Eyed Crab", category: [.seafood, .crab, .crabOrSnail, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .restoresStamina, amount: 0.2), saleValue: 10, location: "Lanayru Great Spring\nEldin Canyon"),
    Material(materialName: "Ironshell Crab", category: [.seafood, .crab, .crabOrSnail, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 8, location: "Necluda Sea\nEast Necluda", potency: 2),
    Material(materialName: "Razorclaw Crab", category: [.seafood, .crab, .crabOrSnail, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 8, location: "Necluda Sea\nEast Necluda", potency: 2),
    
    // Snail.
    Material(materialName: "Hearty Blueshell Snail", category: [.seafood, .snail, .crabOrSnail, .exceptPoryOrSalmon, .seafoodCurry], hearts: 3.0, effect: Effect(type: .temporaryHearts, amount: 3.0), saleValue: 15, location: "Lanayru Sea\nNecluda Sea"),
    Material(materialName: "Sneaky River Snail", category: [.seafood, .snail, .crabOrSnail, .exceptPoryOrSalmon], hearts: 1.0, effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 6, location: "River in Kakariko at night\nPool at Zora's Domain at night", potency: 1),
    
    // Herbs and Flowers.
    Material(materialName: "Armoranth", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Akkala Highlands\nHyrule Ridge", potency: 1),
    Material(materialName: "Blue Nightshade", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 4, location: "Great Fairy Fountain by Kakariko", potency: 1),
    Material(materialName: "Cool Safflina", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 3, location: "Hyrule Ridge\nGerudo Highlands", potency: 1),
    Material(materialName: "Electric Safflina", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 3, location: "Gerudo Desert\nHyrule Ridge", potency: 1),
    Material(materialName: "Hyrule Herb", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], hearts: 1.0, effect: Effect(type: .duration, duration: 30), saleValue: 3, location: "Grows all around Hyrule"),
    Material(materialName: "Mighty Thistle", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nFaron Grasslands", potency: 1),
    Material(materialName: "Silent Princess", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], hearts: 1.0, effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 10, location: "Great Fairy Fountains", potency: 3),
    Material(materialName: "Swift Violet", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Gerudo Highlands\nHebra Mountains", potency: 2),
    Material(materialName: "Warm Safflina", category: [.vegetables, .flowersAndHerbs, .exceptCarrotOrPumpkin, .exceptPumpkin], effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 3, location: "Gerudo Desert\nHyrule Ridge", potency: 1),
    
    // Vegetable.
    Material(materialName: "Swift Carrot", category: [.vegetables, .carrot, .carrotOrPumpkin, .exceptPumpkin], hearts: 0.5, effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "Kakariko Store", potency: 1),
    Material(materialName: "Endura Carrot", category: [.vegetables, .carrot, .carrotOrPumpkin, .exceptPumpkin], hearts: 2.0, effect: Effect(type: .extendsStamina, amount: 0.4), saleValue: 30, location: "Hyrule Ridge\nFaron Grasslands"),
    Material(materialName: "Big Hearty Radish", category: [.vegetables, .radish, .exceptCarrotOrPumpkin, .exceptPumpkin], hearts: 4.0, effect: Effect(type: .temporaryHearts, amount: 5.0), saleValue: 15, location: "Akkala Highlands\nLanayru Great Spring"),
    Material(materialName: "Hearty Radish", category: [.vegetables, .radish, .exceptCarrotOrPumpkin, .exceptPumpkin], hearts: 2.5, effect: Effect(type: .temporaryHearts, amount: 3.0), saleValue: 8, location: "Hyrule Ridge\nEast Necluda"),
    Material(materialName: "Fortified Pumpkin", category: [.vegetables, .carrotOrPumpkin], hearts: 0.5, effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Kakariko Village", potency: 2),
    
    // Meat.
    Material(materialName: "Raw Meat", category: [.meat, .mammal], hearts: 1.0, effect: Effect(type: .duration, duration: 30), saleValue: 8, location: "Dropped by small animals"),
    Material(materialName: "Raw Prime Meat", category: [.meat, .mammal], hearts: 1.5, effect: Effect(type: .duration, duration: 30), saleValue: 15, location: "Dropped by big animals"),
    Material(materialName: "Raw Gourmet Meat", category: [.meat, .mammal], hearts: 3.0, effect: Effect(type: .duration, duration: 30), saleValue: 35, location: "Dropped by big animals"),
    Material(materialName: "Raw Bird Drumstick", category: [.meat, .poultry], hearts: 1.0, effect: Effect(type: .duration, duration: 30), saleValue: 8, location: "Dropped by small birds"),
    Material(materialName: "Raw Bird Thigh", category: [.meat, .poultry], hearts: 1.5, effect: Effect(type: .duration, duration: 30), saleValue: 15, location: "Dropped by Eldin Ostriches"),
    Material(materialName: "Raw Whole Bird", category: [.meat, .poultry], hearts: 3.0, effect: Effect(type: .duration, duration: 30), saleValue: 35, location: "Dropped by Eldin Ostriches"),
    
    // Fruit.
    Material(materialName: "Apple", category: [.fruit, .appleAndWildberry], hearts: 0.5, effect: Effect(type: .duration, duration: 30), saleValue: 3, location: "Trees all over Hyrule"),
    Material(materialName: "Fleet Lotus Seeds", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 0.5, effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Shrine inside Zora's Domain", potency: 2),
    Material(materialName: "Hearty Durian", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 3.0, effect: Effect(type: .temporaryHearts, amount: 4.0), saleValue: 15, location: "Trees in Faron\nTrees near Lake Floria"),
    Material(materialName: "Hydromelon", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 0.5, effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 5, location: "Store in Gerudo Town\nKara Kara Bazaar ", potency: 1),
    Material(materialName: "Mighty Bananas", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 0.5, effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Faron Grasslands\nYiga Clan Hideout", potency: 2),
    Material(materialName: "Palm Fruit", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 2.0, effect: Effect(type: .duration, duration: 30), saleValue: 4, location: "East Necluda\nGerudo Desert"),
    Material(materialName: "Spicy Pepper", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 1.5, effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 3, location: "Entrance of snow areas\nTabantha Frontier", potency: 1),
    Material(materialName: "Voltfruit", category: [.fruit, .besidesApple, .besidesAppleAndWildberry], hearts: 0.5, effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 4, location: "Gerudo Desert\nGerudo Highlands", potency: 1),
    Material(materialName: "Wildberry", category: [.fruit, .besidesApple, .appleAndWildberry], hearts: 0.5, effect: Effect(type: .duration, duration: 30), saleValue: 3, location: "Hebra Mountains\nGerudo Highlands"),
    
    // Nuts.
    Material(materialName: "Acorn", category: [.nut], hearts: 0.5, effect: Effect(type: .duration, duration: 50), saleValue: 2, location: "Dropped by Squirrels\nFelling trees"),
    Material(materialName: "Chickaloo Tree Nut", category: [.nut], hearts: 0.5, effect: Effect(type: .duration, duration: 50), saleValue: 3, location: "Dropped by small birds\nZora's Domain"),

    // Critters.
    
    Material(materialName: "Hightail Lizard", category: [.critter], effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 2, location: "Commonly found in Hyrule", potency: 1),
    Material(materialName: "Hot-Footed Frog", category: [.critter], effect: Effect(type: .speed, duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 2, location: "Commonly found near water", potency: 2),
    Material(materialName: "Warm Darner", category: [.critter], effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 2, location: "Commonly found in Hyrule\nHyrule Field", potency: 2),
    Material(materialName: "Summerwing Butterfly", category: [.critter], effect: Effect(type: .cold, duration: 150, potencyLevel1: 6), saleValue: 2, location: "Great Plateau", potency: 1),
    Material(materialName: "Tireless Frog", category: [.critter], effect: Effect(type: .extendsStamina, amount: 0.2), saleValue: 20, location: "Lanayru Great Spring\nHyrule Ridge"),
    Material(materialName: "Thunderwing Butterfly", category: [.critter], effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 6),  saleValue: 2, location: "Hyrule Ridge\nBeedle Tabantha Bridge Stable", potency: 1),
    Material(materialName: "Electric Darner", category: [.critter], effect: Effect(type: .electricity, duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 2, location: "Hyrule Ridge during rain", potency: 2),
    Material(materialName: "Sunset Firefly", category: [.critter], effect: Effect(type: .stealth, duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 2, location: "Appears during sunset/sunrise", potency: 1),
    Material(materialName: "Smootherwing Butterfly", category: [.critter], effect: Effect(type: .fire, duration: 150, potencyLevel1: 7), saleValue: 2, location: "Beedle East Akkala Stable", potency: 2),
    Material(materialName: "Fireproof Lizard", category: [.critter], effect: Effect(type: .fire, duration: 150, potencyLevel1: 7), saleValue: 5, location: "Commonly in Eldin Mountains\nSouthern Mines", potency: 1),
    Material(materialName: "Rugged Rhino Beetle", category: [.critter], effect: Effect(type: .defense, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "Hyrule Field\nFaron Grasslands",potency: 1),
    Material(materialName: "Cold Darner", category: [.critter], effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 2, location: "Gerudo Highlands, Tabantha Frontier", potency: 2),
    Material(materialName: "Winterwing Butterfly", category: [.critter], effect: Effect(type: .heat, duration: 150, potencyLevel1: 6), saleValue: 2, location: "Gerudo Highlands, Tabantha Frontier", potency: 1),
    Material(materialName: "Hearty Lizard", category: [.critter], effect: Effect(type: .temporaryHearts, amount: 0.2), saleValue: 20, location: "Gerudo Desert\nNecluda Sea"),
    Material(materialName: "Restless Cricket", category: [.critter], effect: Effect(type: .restoresStamina, amount: 0.2), saleValue: 2, location: "Commonly found in grass"),
    Material(materialName: "Energetic Rhino Beetle", category: [.critter], effect: Effect(type: .restoresStamina, amount: 1.6), saleValue: 2, location: "Akkala Highlands\nWest Necluda"),
    Material(materialName: "Bladed Rhino Beetle", category: [.critter], effect: Effect(type: .attack, duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "West Necluda\nEast Necluda", potency: 1),
    
    Material(materialName: "Ancient Screw", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 12, location: "Guardian"),
    Material(materialName: "Ancient Spring", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 15, location: "Guardian"),
    Material(materialName: "Ancient Gear", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 30, location: "Guardian"),
    Material(materialName: "Ancient Shaft", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 40, location: "Guardian"),
    Material(materialName: "Ancient Core", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 80, location: "Guardian"),
    Material(materialName: "Bokoblin Fang", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 12, location: "Bokoblin"),
    Material(materialName: "Bokoblin Horn", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 5, location: "Bokoblin"),
    Material(materialName: "Bokoblin Guts", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 25, location: "Bokoblin"),
    Material(materialName: "Chuchu Jelly", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 5, location: "Chuchu"),
    Material(materialName: "Dragon Horn Shard", category: [.monsterPart], effect: Effect(type: .duration, duration: 1800), saleValue: 300, location: "Shoot arrow at dragon's horn"),
    Material(materialName: "Dragon Fang Shard", category: [.monsterPart], effect: Effect(type: .duration, duration: 630), saleValue: 250, location: "Shoot arrow at dragon's fang"),
    Material(materialName: "Dragon Claw", category: [.monsterPart], effect: Effect(type: .duration, duration: 210), saleValue: 180, location: "Shoot arrow at dragon's claw"),
    Material(materialName: "Dragon Scale", category: [.monsterPart], effect: Effect(type: .duration, duration: 90), saleValue: 150, location: "Shoot arrow at dragon's body"),
    Material(materialName: "Electric Keese Wing", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 6, location: "Electric Keese"),
    Material(materialName: "Fire Keese Wing", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 6, location: "Fire Keese"),
    Material(materialName: "Giant Ancient Core", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 200, location: "Guardian"),
    Material(materialName: "Hinox Toe Nail", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 20, location: "Hinox"),
    Material(materialName: "Hinox Tooth", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 35, location: "Hinox"),
    Material(materialName: "Hinox Guts", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 80, location: "Hinox"),
    Material(materialName: "Ice Keese Wing", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 6, location: "Ice Keese"),
    Material(materialName: "Icy Lizalfos Tail", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 35, location: "Ice-Breath Lizalfos"),
    Material(materialName: "Keese Eyeball", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 20, location: "Keese"),
    Material(materialName: "Keese Wing", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 2, location: "Keese"),
    Material(materialName: "Lizalfos Horn", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 10, location: "Lizalfos"),
    Material(materialName: "Lizalfos Tail", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 28, location: "Lizalfos"),
    Material(materialName: "Lizalfos Talon", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 15, location: "Lizalfos"),
    Material(materialName: "Lynel Horn", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 40, location: "Lynel"),
    Material(materialName: "Lynel Hoof", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 50, location: "Lynel"),
    Material(materialName: "Lynel Guts", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 200, location: "Lynel"),
    Material(materialName: "Moblin Fang", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 12, location: "Moblin"),
    Material(materialName: "Moblin Horn", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 5, location: "Moblin"),
    Material(materialName: "Moblin Guts", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 25, location: "Moblin"),
    Material(materialName: "Molduga Fin", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 30, location: "Molduga"),
    Material(materialName: "Molduga Guts", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 110, location: "Molduga"),
    Material(materialName: "Octorok Balloon", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 5, location: "Octorok"),
    Material(materialName: "Octorok Eyeball", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 25, location: "Octorok"),
    Material(materialName: "Octorok Tentacle", category: [.monsterPart], effect: Effect(type: .duration, duration: 70), saleValue: 10, location: "Octorok"),
    Material(materialName: "Red Chuchu Jelly", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 10, location: "Fire Chuchu"),
    Material(materialName: "Red Lizalfos Tail", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 35, location: "Fire-Breath Lizalfos"),
    Material(materialName: "Yellow Lizalfos Tail", category: [.monsterPart], effect: Effect(type: .duration, duration: 190), saleValue: 35, location: "Electic Lizalfos"),
    Material(materialName: "Yellow Chuchu Jelly", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 10, location: "Electric Chuchu"),
    Material(materialName: "White Chuchu Jelly", category: [.monsterPart], effect: Effect(type: .duration, duration: 110), saleValue: 10, location: "Ice Chuchu"),
]
