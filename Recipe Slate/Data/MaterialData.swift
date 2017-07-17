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
    Material(materialName: "Hylian Rice", category: ["Misc"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 60), saleValue: 3, location: "Store in Kakariko Village\nStore in Hateno Village"),
    Material(materialName: "Goat Butter", category: ["Misc"], effect: Effect(effectName: "Duration", duration: 80), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Rock Salt", category: ["Misc"], effect: Effect(effectName: "Duration", duration: 60), saleValue: 3, location: "Ore Deposits"),
    Material(materialName: "Tabantha Wheat", category: ["Misc"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 60), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Cane Sugar", category: ["Misc"], effect: Effect(effectName: "Duration", duration: 80), saleValue: 3, location: "Store in Rito Village"),
    Material(materialName: "Fresh Milk", category: ["Misc"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 80), saleValue: 3, location: "Store in Hateno Village"),
    Material(materialName: "Bird Egg", category: ["Misc"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 90), saleValue: 4, location: "Nests atop trees"),
    Material(materialName: "Goron Spice", category: ["Misc"], effect: Effect(effectName: "Duration", duration: 90), saleValue: 4, location: "Store in Goron City"),
    Material(materialName: "Courser Bee Honey", category: ["Misc"], hearts: 2.0, effect: Effect(effectName: "Restores Stamina", amount: 0.4), saleValue: 10, location: "Hit a bee hive"),
    Material(materialName: "Wood", category: ["Misc"], hearts: 0.125, saleValue: 2, location: "Felling trees"),
    Material(materialName: "Monster Extract", category: ["Misc"], hearts: 1.5, effect: Effect(effectName: "Duration", duration: 1800), saleValue: 3, location: "Kilton's Monster Shop"),
    Material(materialName: "Fairy", category: ["Misc"], hearts: 5.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 2, location: "Great Fairy Fountains"),
    Material(materialName: "Star Fragment", category: ["Misc"], effect: Effect(effectName: "Duration", duration: 30), saleValue: 300, location: "Loot from Silver Lynels\nFalling from sky"),
    
    // Mushroom.
    Material(materialName: "Big Hearty Truffle", category: ["Mushroom"], hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0), saleValue: 15, location: "Deep Akkala\nHebra Mountains"),
    Material(materialName: "Chillshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 4, location: "Naydra Snowfield below Mount-Lanayru", potency: 2),
    Material(materialName: "Endura Shroom", category: ["Mushroom"], hearts: 1.0, effect: Effect(effectName: "Overfills Stamina", amount: 0.2), saleValue: 6, location: "Hyrule Ridge\nHyrule Field"),
    Material(materialName: "Hearty Truffle", category: ["Mushroom"], hearts: 2.0, effect: Effect(effectName: "Temporary Hearts", amount: 1.0), saleValue: 6, location: "Ginner Woods by Hateno Village\nGreat Hyrule Forest"),
    Material(materialName: "Hylian Shroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 30), saleValue: 3, location: "Near trees across Hyrule"),
    Material(materialName: "Ironshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nEast Necluda", potency: 2),
    Material(materialName: "Razorshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nEast Necluda", potency: 2),
    Material(materialName: "Rushshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 3, location: "Great Hyrule Forest\nTabantha Frontier", potency: 1),
    Material(materialName: "Silent Shroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 3, location: "Around Kakariko Village\nWest Necluda", potency: 2),
    Material(materialName: "Stamella Shroom", category: ["Mushroom"], hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 0.2), saleValue: 5, location: "Near trees across Hyrule\nUnderneath Impa's house"),
    Material(materialName: "Sunshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 4, location: "Retsam Forest above Hateno Village\nDeep Akkala", potency: 2),
    Material(materialName: "Zapshroom", category: ["Mushroom"], hearts: 0.5, effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 4, location: "Deep Akkala\nGerudo Highlands", potency: 2),
    
    // Fish.
    Material(materialName: "Armored Carp", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Lanayru Great Spring\nEast Necluda", potency: 2),
    Material(materialName: "Armored Porgy", category: ["Seafood", "Fish", "Porgy", "Seafood Curry"], hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Necluda Sea\nLanayru Sea", potency: 3),
    Material(materialName: "Chillfin Trout", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 6, location: "Store at Zora's Domain", potency: 3),
    Material(materialName: "Hearty Bass", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 2.0, effect: Effect(effectName: "Temporary Hearts", amount: 2.0), saleValue: 18, location: "Akkala Highlands\nWest Necluda"),
    Material(materialName: "Hyrule Bass", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 6, location: "Rivers and lakes across Hyrule"),
    Material(materialName: "Hearty Salmon", category: ["Seafood", "Fish"], hearts: 4.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0), saleValue: 10, location: "Lake at the entrance of Rito Village\nHebra Mountains"),
    Material(materialName: "Mighty Carp", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Akkala Highlands\nLanayru Great Spring", potency: 2),
    Material(materialName: "Mighty Porgy", category: ["Seafood", "Fish", "Porgy", "Seafood Curry"], hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Necluda Sea\nLanayru Sea", potency: 3),
    Material(materialName: "Sizzlefin Trout", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 6, location: "Store at Zora's Domain\nHot Springs of Eldin Mountains", potency: 3),
    Material(materialName: "Sanke Carp", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 10, location: "West Necluda"),
    Material(materialName: "Staminoka Bass", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 1.0), saleValue: 18, location: "Hyrule Field\nWest Necluda"),
    Material(materialName: "Stealthfin Trout", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 6, location: "Lake Saria\nGreat Hyrule Forest", potency: 2),
    Material(materialName: "Voltfin Trout", category: ["Seafood", "Fish", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 6, location: "Inogo Bridge, above Lanayru Tower\nTabantha Frontier", potency: 3),
    
    // Crab.
    Material(materialName: "Bright-Eyed Crab", category: ["Seafood", "Crab", "Crab or Snail", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 0.2), saleValue: 10, location: "Lanayru Great Spring\nEldin Canyon"),
    Material(materialName: "Ironshell Crab", category: ["Seafood", "Crab", "Crab or Snail", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 8, location: "Necluda Sea\nEast Necluda", potency: 2),
    Material(materialName: "Razorclaw Crab", category: ["Seafood", "Crab", "Crab or Snail", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 8, location: "Necluda Sea\nEast Necluda", potency: 2),
    
    // Snail.
    Material(materialName: "Hearty Blueshell Snail", category: ["Seafood", "Snail", "Crab or Snail", "Except Porgy or Salmon", "Seafood Curry"], hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 3.0), saleValue: 15, location: "Lanayru Sea\nNecluda Sea"),
    Material(materialName: "Sneaky River Snail", category: ["Seafood", "Snail", "Crab or Snail", "Except Porgy or Salmon"], hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 6, location: "River in Kakariko at night\nPool at Zora's Domain at night", potency: 1),
    
    // Herbs and Flowers.
    Material(materialName: "Armoranth", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Akkala Highlands\nHyrule Ridge", potency: 1),
    Material(materialName: "Blue Nightshade", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 4, location: "Great Fairy Fountain by Kakariko", potency: 1),
    Material(materialName: "Cool Safflina", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 3, location: "Hyrule Ridge\nGerudo Highlands", potency: 1),
    Material(materialName: "Electric Safflina", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 3, location: "Gerudo Desert\nHyrule Ridge", potency: 1),
    Material(materialName: "Hyrule Herb", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 3, location: "Grows all around Hyrule"),
    Material(materialName: "Mighty Thistle", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "West Necluda\nFaron Grasslands", potency: 1),
    Material(materialName: "Silent Princess", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 10, location: "Great Fairy Fountains", potency: 3),
    Material(materialName: "Swift Violet", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 10, location: "Gerudo Highlands\nHebra Mountains", potency: 2),
    Material(materialName: "Warm Safflina", category: ["Vegetables", "Flower and Herbs", "except Carrot or Pumpkin", "Except Pumpkin"], effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 3, location: "Gerudo Desert\nHyrule Ridge", potency: 1),
    
    // Vegetable.
    Material(materialName: "Swift Carrot", category: ["Vegetables", "Carrot", "Carrot or Pumpkin", "Except Pumpkin"], hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "Kakariko Store", potency: 1),
    Material(materialName: "Endura Carrot", category: ["Vegetables", "Carrot", "Carrot or Pumpkin", "Except Pumpkin"], hearts: 2.0, effect: Effect(effectName: "Overfills Stamina", amount: 0.4), saleValue: 30, location: "Hyrule Ridge\nFaron Grasslands"),
    Material(materialName: "Big Hearty Radish", category: ["Vegetables", "Radish", "except Carrot or Pumpkin", "Except Pumpkin"], hearts: 4.0, effect: Effect(effectName: "Temporary Hearts", amount: 5.0), saleValue: 15, location: "Akkala Highlands\nLanayru Great Spring"),
    Material(materialName: "Hearty Radish", category: ["Vegetables", "Radish", "except Carrot or Pumpkin", "Except Pumpkin"], hearts: 2.5, effect: Effect(effectName: "Temporary Hearts", amount: 3.0), saleValue: 8, location: "Hyrule Ridge\nEast Necluda"),
    Material(materialName: "Fortified Pumpkin", category: ["Vegetables", "Carrot or Pumpkin"], hearts: 0.5, effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Kakariko Village", potency: 2),
    
    // Meat.
    Material(materialName: "Raw Meat", category: ["Meat", "Mammal"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 8, location: "Dropped by small animals"),
    Material(materialName: "Raw Prime Meat", category: ["Meat", "Mammal"], hearts: 1.5, effect: Effect(effectName: "Duration", duration: 30), saleValue: 15, location: "Dropped by big animals"),
    Material(materialName: "Raw Gourmet Meat", category: ["Meat", "Mammal"], hearts: 3.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 35, location: "Dropped by big animals"),
    Material(materialName: "Raw Bird Drumstick", category: ["Meat", "Poultry"], hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 8, location: "Dropped by small birds"),
    Material(materialName: "Raw Bird Thigh", category: ["Meat", "Poultry"], hearts: 1.5, effect: Effect(effectName: "Duration", duration: 30), saleValue: 15, location: "Dropped by Eldin Ostriches"),
    Material(materialName: "Raw Whole Bird", category: ["Meat", "Poultry"], hearts: 3.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 35, location: "Dropped by Eldin Ostriches"),
    
    // Fruit.
    Material(materialName: "Apple", category: ["Fruit", "Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 30), saleValue: 3, location: "Trees all over Hyrule"),
    Material(materialName: "Fleet Lotus Seeds", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Shrine inside Zora's Domain", potency: 2),
    Material(materialName: "Hearty Durian", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0), saleValue: 15, location: "Trees in Faron\nTrees near Lake Floria"),
    Material(materialName: "Hydromelon", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 5, location: "Store in Gerudo Town\nKara Kara Bazaar ", potency: 1),
    Material(materialName: "Mighty Bananas", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 5, location: "Faron Grasslands\nYiga Clan Hideout", potency: 2),
    Material(materialName: "Palm Fruit", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 2.0, effect: Effect(effectName: "Duration", duration: 30), saleValue: 4, location: "East Necluda\nGerudo Desert"),
    Material(materialName: "Spicy Pepper", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 1.5, effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 3, location: "Entrance of snow areas\nTabantha Frontier", potency: 1),
    Material(materialName: "Voltfruit", category: ["Fruit", "Besides Apple", "Besides Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 4, location: "Gerudo Desert\nGerudo Highlands", potency: 1),
    Material(materialName: "Wildberry", category: ["Fruit", "Besides Apple", "Apple and Wildberry"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 30), saleValue: 3, location: "Hebra Mountains\nGerudo Highlands"),
    
    // Nuts.
    Material(materialName: "Acorn", category: ["Nut"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 50), saleValue: 2, location: "Dropped by Squirrels\nFelling trees"),
    Material(materialName: "Chickaloo Tree Nut", category: ["Nut"], hearts: 0.5, effect: Effect(effectName: "Duration", duration: 50), saleValue: 3, location: "Dropped by small birds\nZora's Domain"),

    // Critters.
    
    Material(materialName: "Hightail Lizard", category: ["Critter"], effect: Effect(effectName: "Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 2, location: "Commonly found in Hyrule", potency: 1),
    Material(materialName: "Hot-Footed Frog", category: ["Critter"], effect: Effect(effectName:"Speed Up", duration: 60, potencyLevel1: 5, potencyLevel2: 7), saleValue: 2, location: "Commonly found near water", potency: 2),
    Material(materialName: "Warm Darner", category: ["Critter"], effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 2, location: "Commonly found in Hyrule\nHyrule Field", potency: 2),
    Material(materialName: "Summerwing Butterfly", category: ["Critter"], effect: Effect(effectName: "Cold Resistance", duration: 150, potencyLevel1: 6), saleValue: 2, location: "Great Plateau", potency: 1),
    Material(materialName: "Tireless Frog", category: ["Critter"], effect: Effect(effectName: "Overfills Stamina", amount: 0.2), saleValue: 20, location: "Lanayru Great Spring\nHyrule Ridge"),
    Material(materialName: "Thunderwing Butterfly", category: ["Critter"], effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6),  saleValue: 2, location: "Hyrule Ridge\nBeedle Tabantha Bridge Stable", potency: 1),
    Material(materialName: "Electric Darner", category: ["Critter"], effect: Effect(effectName: "Electricity Resistance", duration: 150, potencyLevel1: 4, potencyLevel2: 6), saleValue: 2, location: "Hyrule Ridge during rain", potency: 2),
    Material(materialName: "Sunset Firefly", category: ["Critter"], effect: Effect(effectName: "Increased Stealth", duration: 120, potencyLevel1: 6, potencyLevel2: 9), saleValue: 2, location: "Appears during sunset/sunrise", potency: 1),
    Material(materialName: "Smootherwing Butterfly", category: ["Critter"], effect: Effect(effectName: "Fire Resistance", duration: 150, potencyLevel1: 7), saleValue: 2, location: "Beedle East Akkala Stable", potency: 2),
    Material(materialName: "Fireproof Lizard", category: ["Critter"], effect: Effect(effectName: "Fire Resistance", duration: 150, potencyLevel1: 7), saleValue: 5, location: "Commonly in Eldin Mountains\nSouthern Mines", potency: 1),
    Material(materialName: "Rugged Rhino Beetle", category: ["Critter"], effect: Effect(effectName: "Defense Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "Hyrule Field\nFaron Grasslands",potency: 1),
    Material(materialName: "Cold Darner", category: ["Critter"], effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 2, location: "Gerudo Highlands, Tabantha Frontier", potency: 2),
    Material(materialName: "Winterwing Butterfly", category: ["Critter"], effect: Effect(effectName: "Heat Resistance", duration: 150, potencyLevel1: 6), saleValue: 2, location: "Gerudo Highlands, Tabantha Frontier", potency: 1),
    Material(materialName: "Hearty Lizard", category: ["Critter"], effect: Effect(effectName: "Temporary Hearts", amount: 0.2), saleValue: 20, location: "Gerudo Desert\nNecluda Sea"),
    Material(materialName: "Restless Cricket", category: ["Critter"], effect: Effect(effectName: "Restores Stamina", amount: 0.2), saleValue: 2, location: "Commonly found in grass"),
    Material(materialName: "Energetic Rhino Beetle", category: ["Critter"], effect: Effect(effectName: "Restores Stamina", amount: 1.6), saleValue: 2, location: "Akkala Highlands\nWest Necluda"),
    Material(materialName: "Bladed Rhino Beetle", category: ["Critter"], effect: Effect(effectName: "Attack Up", duration: 50, potencyLevel1: 5, potencyLevel2: 7), saleValue: 4, location: "West Necluda\nEast Necluda", potency: 1),
    
    Material(materialName: "Ancient Screw", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 12, location: "Guardian"),
    Material(materialName: "Ancient Spring", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 15, location: "Guardian"),
    Material(materialName: "Ancient Gear", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 30, location: "Guardian"),
    Material(materialName: "Ancient Shaft", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 40, location: "Guardian"),
    Material(materialName: "Ancient Core", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 80, location: "Guardian"),
    Material(materialName: "Bokoblin Fang", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 12, location: "Bokoblin"),
    Material(materialName: "Bokoblin Horn", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 5, location: "Bokoblin"),
    Material(materialName: "Bokoblin Guts", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 25, location: "Bokoblin"),
    Material(materialName: "Chuchu Jelly", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 5, location: "Chuchu"),
    Material(materialName: "Dragon Horn Shard", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 1800), saleValue: 300, location: "Shoot arrow at dragon's horn"),
    Material(materialName: "Dragon Fang Shard", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 630), saleValue: 250, location: "Shoot arrow at dragon's fang"),
    Material(materialName: "Dragon Claw", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 210), saleValue: 180, location: "Shoot arrow at dragon's claw"),
    Material(materialName: "Dragon Scale", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 90), saleValue: 150, location: "Shoot arrow at dragon's body"),
    Material(materialName: "Electric Keese Wing", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 6, location: "Electric Keese"),
    Material(materialName: "Fire Keese Wing", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 6, location: "Fire Keese"),
    Material(materialName: "Giant Ancient Core", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 200, location: "Guardian"),
    Material(materialName: "Hinox Toe Nail", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 20, location: "Hinox"),
    Material(materialName: "Hinox Tooth", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 35, location: "Hinox"),
    Material(materialName: "Hinox Guts", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 80, location: "Hinox"),
    Material(materialName: "Ice Keese Wing", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 6, location: "Ice Keese"),
    Material(materialName: "Icy Lizalfos Tail", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 35, location: "Ice-Breath Lizalfos"),
    Material(materialName: "Keese Eyeball", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 20, location: "Keese"),
    Material(materialName: "Keese Wing", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 2, location: "Keese"),
    Material(materialName: "Lizalfos Horn", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 10, location: "Lizalfos"),
    Material(materialName: "Lizalfos Tail", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 28, location: "Lizalfos"),
    Material(materialName: "Lizalfos Talon", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 15, location: "Lizalfos"),
    Material(materialName: "Lynel Horn", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 40, location: "Lynel"),
    Material(materialName: "Lynel Hoof", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 50, location: "Lynel"),
    Material(materialName: "Lynel Guts", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 200, location: "Lynel"),
    Material(materialName: "Moblin Fang", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 12, location: "Moblin"),
    Material(materialName: "Moblin Horn", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 5, location: "Moblin"),
    Material(materialName: "Moblin Guts", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 25, location: "Moblin"),
    Material(materialName: "Molduga Fin", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 30, location: "Molduga"),
    Material(materialName: "Molduga Guts", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 110, location: "Molduga"),
    Material(materialName: "Octorok Balloon", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 5, location: "Octorok"),
    Material(materialName: "Octorok Eyeball", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 25, location: "Octorok"),
    Material(materialName: "Octorok Tentacle", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 70), saleValue: 10, location: "Octorok"),
    Material(materialName: "Red Chuchu Jelly", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 10, location: "Fire Chuchu"),
    Material(materialName: "Red Lizalfos Tail", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 35, location: "Fire-Breath Lizalfos"),
    Material(materialName: "Yellow Lizalfos Tail", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 190), saleValue: 35, location: "Electic Lizalfos"),
    Material(materialName: "Yellow Chuchu Jelly", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 10, location: "Electric Chuchu"),
    Material(materialName: "White Chuchu Jelly", category: ["Monster Part"], effect: Effect(effectName: "Duration", duration: 110), saleValue: 10, location: "Ice Chuchu"),
]
