//
//  SampleDate.swift
//  Link's Recipes
//
//  Created by Martin List on 14/03/2017.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

let categories = ["Fruit", "Fish", "Snail", "Crab"]

let foodData = [
    Food(name:"Baked Apple", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Apple")),
    Food(name:"Baked Palm Fruit", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Palm Fruit")),
    Food(name:"Baked Fortified Pumpkin", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Fortified Pumpkin")),
    Food(name:"Blueshell Escargot", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Hearty Blueshell Snail")),
    Food(name:"Campfire Egg", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Bird Egg")),
    Food(name:"Charred Pepper", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Spicy Pepper")),
    Food(name:"Roasted Armoranth", hearts: 0.5,
         ingredientNames: Ingredients(firstIngredient: "Armoranth")),
    Food(name:"Roasted Hearty Bass", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Hearty Bass")),
    Food(name:"Roasted Big Radish", hearts: 6.0,
         ingredientNames: Ingredients(firstIngredient: "Big Radish")),
    Food(name:"Roasted Bird Thigh", hearts: 2.25,
         ingredientNames: Ingredients(firstIngredient: "Raw Bird Thigh")),
    Food(name:"Roasted Carp", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Any Carp")),
    Food(name:"Roasted Hearty Durian", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Hearty Durian")),
    Food(name:"Roasted Endura Carrot", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Endura Carrot")),
    Food(name:"Roasted Hydromelon", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Hydromelon")),
    Food(name:"Roasted Lotus Seeds", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Fleet-Lotus Seeds")),
    Food(name:"Roasted Mighty Bananas", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Mighty Bananas")),
    Food(name:"Roasted Mighty Thistle", hearts: 0.5,
         ingredientNames: Ingredients(firstIngredient: "Mighty Thistle")),
    Food(name:"Roasted Porgy", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Any Porgy")),
    Food(name:"Roasted Radish", hearts: 3.75,
         ingredientNames: Ingredients(firstIngredient: "Hearty Radish")),
    Food(name:"Roasted Swift Carrot", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Swift Carrot")),
    Food(name:"Roasted Voltfruit", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Voltfruit")),
    Food(name:"Roasted Wildberry", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Wildberry")),
    Food(name:"Sneaky River Escargot", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Sneaky River Snail")),
    Food(name:"Toasty Chillshroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Chillshroom")),
    Food(name:"Toasty Endura Shroom", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Endura Shroom")),
    Food(name:"Toasted Hearty Truffle", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Hearty Truffle")),
    Food(name:"Toasted Big Hearty Truffle", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Big Hearty Truffle")),
    Food(name:"Toasty Ironshroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Ironshroom")),
    Food(name:"Toasty Hylian Shroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Hylian Shroom")),
    Food(name:"Toasty Razorshroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Razorshroom")),
    Food(name:"Toasty Rushroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Rushroom")),
    Food(name:"Toasty Silent Shroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Silent Shroom")),
    Food(name:"Toasty Stamella Shroom", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Stamella Shroom")),
    Food(name:"Toasty Sunshroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Sunshroom")),
    Food(name:"Toasty Zapfshroom", hearts: 0.75,
         ingredientNames: Ingredients(firstIngredient: "Zapfshroom")),
    Food(name:"Seared Steak", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Raw Meat")),
    Food(name:"Seared Gourmet Steak", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Raw Gourmet Meat")),
    Food(name:"Seared Prime Steak", hearts: 2.25,
         ingredientNames: Ingredients(firstIngredient: "Raw Prime Meat")),
    Food(name:"Roasted Bird Drumstick", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Raw Bird Drumstick")),
    Food(name:"Roasted Whole Bird", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Raw Whole Bird")),
    Food(name:"Roasted Bass", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Hyrule Bass OR", secondIngredient: "Staminoka Bass")),
    Food(name:"Roasted Hearty Salmon", hearts: 4.5,
         ingredientNames: Ingredients(firstIngredient: "Hearty Salmon")),
    Food(name:"Roasted Trout", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Any Trout")),
    Food(name:"Blackened Crab", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Any Crab")),
    Food(name:"Roasted Tree Nut", hearts: 0.5,
         ingredientNames: Ingredients(firstIngredient: "Tree Nut")),
    Food(name:"Roasted Acorn", hearts: 0.5,
         ingredientNames: Ingredients(firstIngredient: "Acorn")),
    
    Food(name: "Frozen Bass", hearts: 2.0,
         ingredientNames: Ingredients(firstIngredient: "Any Bass"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Hearty Salmon", hearts: 4.0,
         ingredientNames: Ingredients(firstIngredient: "Hearty Salmon"),firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Bird Drumstick", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Raw Bird Drumstick"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Bird Thigh", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Raw Bird Thigh"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Whole Bird", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Whole Bird"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Carp", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Any Carp"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Hearty Bass", hearts: 2.0,
         ingredientNames: Ingredients(firstIngredient: "Hearty Bass"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Crab", hearts: 2.0,
         ingredientNames: Ingredients(firstIngredient: "Any Crab"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen River Snail", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Sneaky River Snail"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Trout", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Any Trout"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Frozen Sneaky River Snail", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Sneaky River Snail"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Icy Hearty Blueshell Snail", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Hearty Blueshell Snail"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Icy Meat", hearts: 1.0,
         ingredientNames: Ingredients(firstIngredient: "Raw Meat"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Icy Prime Meat", hearts: 1.5,
         ingredientNames: Ingredients(firstIngredient: "Raw Prime Meat"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
    Food(name: "Icy Gourmet Meat", hearts: 3.0,
         ingredientNames: Ingredients(firstIngredient: "Raw Gourmet Meat"), firstEffect: Effect(effectName: "Heat Resistance", duration: 60)),
   
    
]

let materialData = [
    
    Material(materialName: "Hylian Rice", category: Category(mainCategory: "Misc"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 60)),
    Material(materialName: "Goat Butter", category: Category(mainCategory: "Misc"), effect: Effect(effectName: "Duration", duration: 80)),
    Material(materialName: "Rock Salt", category: Category(mainCategory: "Misc"), effect: Effect(effectName: "Duration", duration: 60)),
    Material(materialName: "Bright-Eyed Crab", category: Category(mainCategory: "Seafood", subCategory: "Crab"), hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 0.2)),
    Material(materialName: "Ironshell Crab", category: Category(mainCategory: "Seafood", subCategory: "Crab"),hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Razorclaw Crab", category: Category(mainCategory: "Seafood", subCategory: "Crab"),hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Tabantha Wheat", category: Category(mainCategory: "Misc"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 60)),
    Material(materialName: "Cane Sugar", category: Category(mainCategory: "Misc"), effect: Effect(effectName: "Duration", duration: 80)),
   
    
    Material(materialName: "Swift Carrot", category: Category(mainCategory: "Vegetables", subCategory: "Carrot"), hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60)),
    Material(materialName: "Endura Carrot", category: Category(mainCategory: "Vegetables", subCategory: "Carrot"), hearts: 2.0, effect: Effect(effectName: "Overfills Stamina", amount: 0.4)),
    Material(materialName: "Fresh Milk", category: Category(mainCategory: "Misc"), hearts: 0.5, effect: Effect(effectName: "Duration", duration: 80)),
    Material(materialName: "Bird Egg", category: Category(mainCategory: "Misc"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 90)),
    Material(materialName: "Goron Spice", category: Category(mainCategory: "Misc"), effect: Effect(effectName: "Duration", duration: 90)),


    Material(materialName: "Big Hearty Radish", category: Category(mainCategory: "Vegetables", subCategory: "Radish"), hearts: 4.0, effect: Effect(effectName: "Temporary Hearts", amount: 5.0)),
    Material(materialName: "Hearty Radish", category: Category(mainCategory: "Vegetables", subCategory: "Radish"), hearts: 2.5, effect: Effect(effectName: "Temporary Hearts", amount: 3.0)),
    Material(materialName: "Fortified Pumpkin", category: Category(mainCategory: "Vegetables"), hearts: 0.5, effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Courser Bee Honey", category: Category(mainCategory: "Misc"), hearts: 2.0, effect: Effect(effectName: "Restores Stamina", amount: 0.4)),
   
    // Meat.
    Material(materialName: "Raw Meat", category: Category(mainCategory: "Meat", subCategory: "Mammal"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Raw Prime Meat", category: Category(mainCategory: "Meat", subCategory: "Mammal"), hearts: 1.5, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Raw Gourmet Meat", category: Category(mainCategory: "Meat", subCategory: "Mammal"), hearts: 3.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Raw Bird Drumstick", category: Category(mainCategory: "Meat", subCategory: "Poultry"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Raw Bird Thigh", category: Category(mainCategory: "Meat", subCategory: "Poultry"), hearts: 1.5, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Raw Whole Bird", category: Category(mainCategory: "Meat", subCategory: "Poultry"), hearts: 3.0, effect: Effect(effectName: "Duration", duration: 30)),

    
    
    Material(materialName: "Armored Carp", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Armored Porgy", category: Category(mainCategory: "Seafood", subCategory: "Fish", subSubCategory: "Porgy"), hearts: 1.0, effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Chillfin Trout", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Heat Resistance", duration: 150)),
    Material(materialName: "Hearty Bass", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 2.0, effect: Effect(effectName: "Temporary Hearts", amount: 2.0)),
    Material(materialName: "Hyrule Bass", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Hearty Salmon", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 4.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0)),
    Material(materialName: "Mighty Carp", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Mighty Porgy", category: Category(mainCategory: "Seafood", subCategory: "Fish", subSubCategory: "Porgy"), hearts: 1.0, effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Sizzlefin Trout", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Cold Resistance", duration: 150)),
    Material(materialName: "Sanke Carp", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Staminoka Bass", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 1.0)),
    Material(materialName: "Stealthfin Trout", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120)),
    Material(materialName: "Voltfin Trout", category: Category(mainCategory: "Seafood", subCategory: "Fish"), hearts: 1.0, effect: Effect(effectName: "Electricity Resistance", duration: 150)),
    
    Material(materialName: "Big Hearty Truffle", category: Category(mainCategory: "Mushroom"), hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0)),
    Material(materialName: "Chillshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Heat Resistance", duration: 150)),
    Material(materialName: "Endura Shroom", category: Category(mainCategory: "Mushroom"), hearts: 1.0, effect: Effect(effectName: "Overfills Stamina", amount: 0.4)),
    Material(materialName: "Hearty Truffle", category: Category(mainCategory: "Mushroom"), hearts: 2.0, effect: Effect(effectName: "Temporary Hearts", amount: 1.0)),
    Material(materialName: "Hylian Shroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Ironshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Razorshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Rushshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60)),
    Material(materialName: "Silent Shroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Increased Stealth", duration: 120)),
    Material(materialName: "Stamella Shroom", category: Category(mainCategory: "Mushroom"), hearts: 1.0, effect: Effect(effectName: "Restores Stamina", amount: 0.2)),
    Material(materialName: "Sunshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Cold Resistance", duration: 150)),
    Material(materialName: "Zapshroom", category: Category(mainCategory: "Mushroom"), hearts: 0.5, effect: Effect(effectName: "Electricity Resistance", duration: 150)),
    
    // Herbs and Flowers.
    Material(materialName: "Armoranth", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Defense Up", duration: 50)),
    Material(materialName: "Blue Nightshade", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Increased Stealth", duration: 120)),
    Material(materialName: "Cool Safflina", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Heat Resistance", duration: 150)),
    Material(materialName: "Electric Safflina", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Electricity Resistance", duration: 150)),
    Material(materialName: "Hyrule Herb", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Mighty Thistle", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Silent Princess", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120)),
    Material(materialName: "Swift Violet", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Speed Up", duration: 60)),
    Material(materialName: "Warm Safflina", category: Category(mainCategory: "Vegetables", subCategory: "Flower and Herbs"), effect: Effect(effectName: "Cold Resistance", duration: 150)),
    
    // Snails.
    Material(materialName: "Hearty Blueshell Snail", category: Category(mainCategory: "Seafood", subCategory: "Snail"), hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 3.0)),
    Material(materialName: "Sneaky River Snail", category: Category(mainCategory: "Seafood", subCategory: "Snail"), hearts: 1.0, effect: Effect(effectName: "Increased Stealth", duration: 120)),
    
    // Fruit.
    Material(materialName: "Apple", category: Category(mainCategory: "Fruit"), hearts: 0.5, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Fleet Lotus Seeds", category: Category(mainCategory: "Fruit"), hearts: 0.5, effect: Effect(effectName: "Speed Up", duration: 60)),
    Material(materialName: "Hearty Durian", category: Category(mainCategory: "Fruit"), hearts: 3.0, effect: Effect(effectName: "Temporary Hearts", amount: 4.0)),
    Material(materialName: "Hydromelon", category: Category(mainCategory: "Fruit"), hearts: 0.5, effect: Effect(effectName: "Heat Resistance", duration: 150)),
    Material(materialName: "Mighty Bananas", category: Category(mainCategory: "Fruit"), hearts: 0.5, effect: Effect(effectName: "Attack Up", duration: 50)),
    Material(materialName: "Palm Fruit", category: Category(mainCategory: "Fruit"), hearts: 2.0, effect: Effect(effectName: "Duration", duration: 30)),
    Material(materialName: "Spicy Pepper", category: Category(mainCategory: "Fruit"), hearts: 1.5, effect: Effect(effectName: "Cold Resistance", duration: 150)),
    Material(materialName: "Voltfruit", category: Category(mainCategory: "Fruit"), hearts: 0.5, effect: Effect(effectName: "Electricity Resistance", duration: 150)),
    Material(materialName: "Wildberry", category: Category(mainCategory: "Fruit"), hearts: 1.0, effect: Effect(effectName: "Duration", duration: 30)),
    
    Material(materialName: "Monster Extract", category: Category(mainCategory: "Misc"), hearts: 1.5, effect: Effect(effectName: "Duration", duration: 1800)),
]

let mealData = [
    
    Meal(name:"Sautéed Peppers", firstIngredient: "Spicy Pepper"),
    Meal(name:"Crab Risotto", firstIngredient: "Hylian Rice", secondIngredient: "Goat Butter", thirdIngredient: "Rock Salt", firstCategory: "Crab"),
    Meal(name:"Apple Pie", firstIngredient: "Apple", secondIngredient: "Tabantha Wheat", thirdIngredient: "Cane Sugar", fourthIngredient: "Goat Butter"),
    Meal(name:"Carrot Cake", firstIngredient: "Goat Butter", secondIngredient: "Tabantha Wheat", thirdIngredient: "Cane Sugar", firstCategory: "Carrot"),
    Meal(name:"Carrot Stew", firstIngredient: "Goat Butter", secondIngredient: "Tabantha Wheat", thirdIngredient: "Fresh Milk", firstCategory: "Carrot"),
    Meal(name:"Crab Omelet with Rice", firstIngredient: "Hylian Rice", secondIngredient: "Bird Egg", thirdIngredient: "Rock Salt", firstCategory: "Crab"),
    Meal(name:"Crab Stir-Fry", firstIngredient: "Goron Spice", firstCategory: "Crab"),
    Meal(name:"Cream of Mushroom Soup", firstIngredient: "Fresh Milk", secondIngredient: "Rock Salt", firstCategory: "Mushroom", secondCategory: "Vegetables"),
//    Meal(name: "Cream of Vegetable Soup", firstIngredient: "Fresh Milk", secondIngredient: "Rock Salt", firstCategory: <#T##String?#>, secondCategory: <#T##String?#>)
    Meal(name:"Creamy Heart Soup", firstIngredient: "Hydromelon", secondIngredient: "Voltfruit", thirdIngredient: "Fresh Milk", firstCategory: "Radish"),
    Meal(name: "Creamy Meat Soup", firstIngredient: "Fresh Milk", secondIngredient: "Rock Salt", firstCategory: "Vegetables", secondCategory: "Meat"),
    Meal(name: "Cream Seafood Soup", firstIngredient: "Fresh Milk", secondIngredient: "Rock Salt", firstCategory: "Seafood", secondCategory: "Vegetables"),
    Meal(name:"Curry Pilaf", firstIngredient: "Hylian Rice", secondIngredient: "Bird Egg", thirdIngredient: "Goat Butter", fourthIngredient: "Goron Spice"),
    Meal(name:"Curry Rice", firstIngredient: "Hylian Rice", secondIngredient: "Goron Spice"),
    Meal(name:"Egg Pudding", firstIngredient: "Fresh Milk", secondIngredient: "Bird Egg", thirdIngredient: "Cane Sugar"),
    Meal(name:"Egg Tart", firstIngredient: "Tabantha Wheat", secondIngredient: "Bird Egg", thirdIngredient: "Cane Sugar", fourthIngredient: "Goat Butter"),
    Meal(name:"Glazed Meat", firstIngredient: "Courser Bee Honey", firstCategory: "Meat"),
    Meal(name:"Honey Candy", firstIngredient: "Courser Bee Honey"),
    Meal(name:"Honeyed Apple", firstIngredient: "Courser Bee Honey", secondIngredient: "Apple"),
    Meal(name:"Fish Pie", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Rock Salt", firstCategory: "Seafood"),
    Meal(name:"Fragrant Mushroom Sauté", firstIngredient: "Goron Spice", firstCategory: "Mushroom"),
//    Meal(name:"Fish Skewer", firstCategory: "Fish"),
//    Meal(name:"Copious Fish Skewer", firstCategory: "Fish"),
    Meal(name:"Fish and Mushroom Skewer", firstCategory: "Fish", secondCategory: "Mushroom"),
//    Meal(name:"Copious Meat Skewers", firstCategory: "Meat", secondCategory: "Meat", thirdCategory: "Meat", fourthCategory: "Meat"),
//    Meal(name:"Copious Mushroom Skewers", firstCategory: "Mushroom", secondCategory: "Mushroom", thirdCategory: "Mushroom", fourthCategory: "Mushroom"),
    Meal(name:"Fried Bananas", firstIngredient: "Mighty Bananas", secondIngredient: "Tabantha Wheat", thirdIngredient: "Cane Sugar"),
    Meal(name:"Fried Egg and Rice", firstIngredient: "Hylian Rice", secondIngredient: "Bird Egg"),
    Meal(name:"Fried Wild Greens", firstCategory: "Vegetables"),
//    Meal(name:"Fried Wild Greens", firstCategory: "Vegetables", secondCategory: "Vegetables", thirdCategory: "Vegetables", fourthCategory: "Vegetables"),
    Meal(name:"Fruit and Mushroom Mix", firstCategory: "Fruit", secondCategory: "Mushroom"),
//    Meal(name:"Fruit Pie", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Cane Sugar", firstCategory: "Fruit"),
//    Meal(name:"Fruit Cake", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Cane Sugar", firstCategory: "Fruit"),
    Meal(name:"Glazed Mushrooms", firstIngredient: "Courser Bee Honey", firstCategory: "Mushroom"),
    Meal(name:"Glazed Seafood", firstIngredient: "Courser Bee Honey", firstCategory: "Seafood"),
    Meal(name:"Glazed Veggies", firstIngredient: "Courser Bee Honey", firstCategory: "Vegetables"),
    
    Meal(name:"Meat and Rice Bowl", firstIngredient: "Hylian Rice", secondIngredient: "Rock Salt", firstCategory: "Mammal"),
    Meal(name:"Meat and Seafood Fry", firstCategory: "Seafood", secondCategory: "Meat"),
    
    Meal(name:"Meat Curry", firstIngredient: "Hylian Rice", secondIngredient: "Goron Spice", firstCategory: "Mammal"),
    Meal(name:"Meat Stew", firstIngredient: "Tabantha Wheat", secondIngredient: "Fresh Milk", thirdIngredient: "Goat Butter", firstCategory: "Meat"),

    Meal(name:"Poultry Curry", firstIngredient: "Hylian Rice", secondIngredient: "Goron Spice", firstCategory: "Poultry"),
    Meal(name:"Poultry Pilaf", firstIngredient: "Hylian Rice", secondIngredient: "Goat Butter", thirdIngredient: "Bird Egg", firstCategory: "Poultry"),
    Meal(name:"Spiced Meat Skewer", firstIngredient: "Goron Spice", firstCategory: "Mammal"),

    Meal(name:"Clam Chowder", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Fresh Milk", fourthIngredient: "Hearty Blueshell Snail"),
    Meal(name:"Salmon Meunière", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Hearty Salmon"),
    Meal(name:"Herb Sauté", firstIngredient: "Goron Spice", firstCategory: "Vegetables"),
    Meal(name:"Honey Crepe", firstIngredient: "Tabantha Wheat", secondIngredient: "Bird Egg", thirdIngredient: "Fresh Milk", fourthIngredient: "Cane Sugar", fifthIngredient: "Courser Bee Honey"),
//    Meal(name:"Honeyed Fruits", firstIngredient: "Courser Bee Honey", secondIngredient: "Fruit"),
    Meal(name:"Hot Buttered Apple", firstIngredient: "Apple", secondIngredient: "Goat Butter"),
    Meal(name:"Meat Pie", firstIngredient: "Tabantha Wheat", secondIngredient: "Goat Butter", thirdIngredient: "Rock Salt", firstCategory: "Meat"),
//    Meal(name:"Meat Skewer", firstCategory: "Meat"),
    Meal(name:"Meaty Rice Balls", firstIngredient: "Hylian Rice", firstCategory: "Meat"),

    Meal(name:"Monster Cake", firstIngredient: "Goat Butter", secondIngredient: "Tabantha Wheat", thirdIngredient: "Cane Sugar", fourthIngredient: "Monster Extract"),
    Meal(name:"Monster Stew", firstIngredient: "Monster Extract", firstCategory: "Meat", secondCategory: "Seafood"),
     

]

let elixirData = [
    Elixir(name:"Spicy Elixir", category: "Spicy", effect: "Cold Resistance"),
    Elixir(name:"Hasty Elixir", category: "Hasty", effect: "Speed Up"),
    Elixir(name:"Chilly Elixir", category: "Chilly", effect: "Heat Resistance"),
    Elixir(name:"Electro Elixir", category: "Electro", effect: "Electricity Resistance"),
    Elixir(name:"Enduring Elixir", category: "Enduring", effect: "Overfills Stamina"),
    Elixir(name:"Energizing Elixir", category: "Energizing", effect: "Restores Stamina"),
    Elixir(name:"Fireproof Elixir", category: "Fireproof", effect: "Fire Resistance"),
    Elixir(name:"Hearty Elixir", category: "Hearty", effect: "Temporary Hearts"),
    Elixir(name:"Sneaky Elixir", category: "Sneaky", effect: "Increased Stealth"),
    Elixir(name:"Tough Elixir", category: "Tough", effect: "Defense Up"),
    Elixir(name:"Mighty Elixir", category: "Mighty", effect: "Attack Up"),
]

let critterData = [
    Critter(name: "Hightail Lizard", category: "Hasty", effect: "Speed Up", duration: 60),
    Critter(name: "Hot-Footed Frog", category: "Hasty", effect: "Speed Up", duration: 60),
    
    Critter(name: "Warm Darner", category: "Spicy", effect: "Cold Resistance", duration: 150),
    Critter(name: "Summerwing Butterfly", category: "Spicy", effect: "Cold Resistance", duration: 150),
    
    
    Critter(name: "Tireless Frog", category: "Enduring", effect: "Overfills Stamina", amount: 0.2),

    Critter(name: "Thunderwing Butterfly", category: "Electro", effect: "Electricity Resistance", duration: 150),
    Critter(name: "Electric Darner", category: "Electro", effect: "Electricity Resistance", duration: 150),

    Critter(name: "Sunset Firefly", category: "Sneaky", effect: "Increased Stealth", duration: 120),
    
    Critter(name: "Smootherwing Butterfly", category: "Fireproof", effect: "Fire Resistance", duration: 150),
    Critter(name: "Fireproof Lizard", category: "Fireproof", effect: "Fire Resistance", duration: 150),
    
    Critter(name: "Rugged Rhino Beetle", category: "Tough", effect: "Defense Up", duration: 50),
    
    Critter(name: "Cold Darner", category: "Chilly", effect: "Heat Resistance", duration: 150),
    Critter(name: "Winterwing Butterfly", category: "Chilly", effect: "Heat Resistance", duration: 150),
    
    Critter(name: "Hearty Lizard", category: "Hearty", effect: "Temporary Hearts", amount: 0.2),
    
    Critter(name: "Restless Cricket", category: "Energizing", effect: "Restores Stamina", amount: 0.2),
    Critter(name: "Energetic Rhino Beetle", category: "Energizing", effect: "Restores Stamina", amount: 1.6),
    
    Critter(name: "Bladed Rhino Beetle", category: "Mighty", effect: "Attack Up", duration: 50),

]

let monsterPartData = [
    MonsterPart(name: "Bokoblin Fang", duration: 110),
    MonsterPart(name: "Bokoblin Horn", duration: 70),
    MonsterPart(name: "Chuchu Jelly", duration: 70),
    MonsterPart(name: "Electric Keese Wing", duration: 110),
    MonsterPart(name: "Keese Eyeball", duration: 190),
    MonsterPart(name: "Keese Wing", duration: 70),
    MonsterPart(name: "Lizalfos Horn", duration: 70),
    MonsterPart(name: "Lizalfos Tail", duration: 190),
    MonsterPart(name: "Lizalfos Talon", duration: 110),
    MonsterPart(name: "Moblin Fang", duration: 110),
    MonsterPart(name: "Moblin Horn", duration: 70),
    MonsterPart(name: "Octorok Balloon", duration: 70),
    MonsterPart(name: "Octorok Eyeball", duration: 110),
    MonsterPart(name: "Octorok Tentacle", duration: 70),
    MonsterPart(name: "Red Chuchu Jelly", duration: 110),
    MonsterPart(name: "White Chuchu Jelly", duration: 110),
]

let effectData = [
    Effect(effectName: "Attack Up"),
    Effect(effectName: "Defense Up"),
    Effect(effectName: "Speed Up"),
    Effect(effectName: "Increased Stealth"),
    Effect(effectName: "Heat Resistance"),
    Effect(effectName: "Cold Resistance"),
    Effect(effectName: "Electricity Resistance"),
    Effect(effectName: "Fire Resistance"),
    Effect(effectName: "Restores Stamina"),
    Effect(effectName: "Overfills Stamina"),
    Effect(effectName: "Temporary Hearts"),
    
    
    
]
