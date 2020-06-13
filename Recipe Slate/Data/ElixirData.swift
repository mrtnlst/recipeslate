//
//  ElixirData.swift
//  Recipe Slate
//
//  Created by martin on 01.07.17.
//  Copyright © 2017 Martin List. All rights reserved.
//

import Foundation

let elixirData = [
    Elixir(name:"Spicy Elixir", category: .spicy, effect: .cold),
    Elixir(name:"Hasty Elixir", category: .hasty, effect: .speed),
    Elixir(name:"Chilly Elixir", category: .chilly, effect: .heat),
    Elixir(name:"Electro Elixir", category: .electro, effect: .electricity),
    Elixir(name:"Enduring Elixir", category: .enduring, effect: .extendsStamina),
    Elixir(name:"Energizing Elixir", category: .energizing, effect: .restoresStamina),
    Elixir(name:"Fireproof Elixir", category: .fireproof, effect: .fire),
    Elixir(name:"Hearty Elixir", category: .hearty, effect: .temporaryHearts),
    Elixir(name:"Sneaky Elixir", category: .sneaky, effect: .stealth),
    Elixir(name:"Tough Elixir", category: .tough, effect: .defense),
    Elixir(name:"Mighty Elixir", category: .mighty, effect: .attack),
]

let critterData = [
    Critter(name: "Hightail Lizard", category: .hasty, effect: .speed, duration: 60, potency: 1),
    Critter(name: "Hot-Footed Frog", category: .hasty, effect: .speed, duration: 60, potency: 2),
    Critter(name: "Warm Darner", category: .spicy, effect: .cold, duration: 150, potency: 2),
    Critter(name: "Summerwing Butterfly", category: .spicy, effect: .cold, duration: 150, potency: 1),
    Critter(name: "Tireless Frog", category: .enduring, effect: .extendsStamina, amount: 0.2),
    Critter(name: "Thunderwing Butterfly", category: .electro, effect: .electricity, duration: 150, potency: 1),
    Critter(name: "Electric Darner", category: .electro, effect: .electricity, duration: 150, potency: 2),
    Critter(name: "Sunset Firefly", category: .sneaky, effect: .stealth, duration: 120, potency: 1),
    Critter(name: "Smootherwing Butterfly", category: .fireproof, effect: .fire, duration: 150, potency: 2),
    Critter(name: "Fireproof Lizard", category: .fireproof, effect: .fire, duration: 150, potency: 1),
    Critter(name: "Rugged Rhino Beetle", category: .tough, effect: .defense, duration: 50, potency: 1),
    Critter(name: "Cold Darner", category: .chilly, effect: .heat, duration: 150, potency: 2),
    Critter(name: "Winterwing Butterfly", category: .chilly, effect: .heat, duration: 150, potency: 1),
    Critter(name: "Hearty Lizard", category: .hearty, effect: .temporaryHearts, amount: 0.2),
    Critter(name: "Restless Cricket", category: .energizing, effect: .restoresStamina, amount: 0.2),
    Critter(name: "Energetic Rhino Beetle", category: .energizing, effect: .restoresStamina, amount: 1.6),
    Critter(name: "Bladed Rhino Beetle", category: .mighty, effect: .attack, duration: 50, potency: 1),
]

let monsterPartData = [
    MonsterPart(name: "Ancient Screw", duration: 70),
    MonsterPart(name: "Ancient Spring", duration: 70),
    MonsterPart(name: "Ancient Gear", duration: 110),
    MonsterPart(name: "Ancient Shaft", duration: 110),
    MonsterPart(name: "Ancient Core", duration: 190),
    MonsterPart(name: "Bokoblin Fang", duration: 110),
    MonsterPart(name: "Bokoblin Horn", duration: 70),
    MonsterPart(name: "Bokoblin Guts", duration: 190),
    MonsterPart(name: "Chuchu Jelly", duration: 70),
    MonsterPart(name: "Dragon Horn Shard", duration: 1800),
    MonsterPart(name: "Dragon Fang Shard", duration: 630),
    MonsterPart(name: "Dragon Claw", duration: 210),
    MonsterPart(name: "Dragon Scale", duration: 90),
    MonsterPart(name: "Electric Keese Wing", duration: 110),
    MonsterPart(name: "Fire Keese Wing", duration: 110),
    MonsterPart(name: "Giant Ancient Core", duration: 190),
    MonsterPart(name: "Hinox Toe Nail", duration: 70),
    MonsterPart(name: "Hinox Tooth", duration: 110),
    MonsterPart(name: "Hinox Guts", duration: 190),
    MonsterPart(name: "Ice Keese Wing", duration: 110),
    MonsterPart(name: "Icy Lizalfos Tail", duration: 190),
    MonsterPart(name: "Keese Eyeball", duration: 190),
    MonsterPart(name: "Keese Wing", duration: 70),
    MonsterPart(name: "Lizalfos Horn", duration: 70),
    MonsterPart(name: "Lizalfos Tail", duration: 190),
    MonsterPart(name: "Lizalfos Talon", duration: 110),
    MonsterPart(name: "Lynel Horn", duration: 70),
    MonsterPart(name: "Lynel Hoof", duration: 110),
    MonsterPart(name: "Lynel Guts", duration: 190),
    MonsterPart(name: "Moblin Fang", duration: 110),
    MonsterPart(name: "Moblin Horn", duration: 70),
    MonsterPart(name: "Moblin Guts", duration: 190),
    MonsterPart(name: "Molduga Fin", duration: 110),
    MonsterPart(name: "Molduga Guts", duration: 190),
    MonsterPart(name: "Octorok Balloon", duration: 70),
    MonsterPart(name: "Octorok Eyeball", duration: 110),
    MonsterPart(name: "Octorok Tentacle", duration: 70),
    MonsterPart(name: "Red Chuchu Jelly", duration: 110),
    MonsterPart(name: "Red Lizalfos Tail", duration: 190),
    MonsterPart(name: "Yellow Lizalfos Tail", duration: 190),
    MonsterPart(name: "Yellow Chuchu Jelly", duration: 110),
    MonsterPart(name: "White Chuchu Jelly", duration: 110),
]
