M = {}

function M.initialize()
  planetDescriptions = {
    "A cloudy and desolate planet, this place kind of makes you want to curl up with a blanket in the dark depths of your spaceship and think about life.",
    "The gas floating around the surface of this planet was misleading. The color below the atmosphere is kind of... puce?",
    "You're very concerned about what the name of this planet might mean about its denizens.",
    "Oh god... --insert scary thing-- is everywhere. Maybe there's something good down here, too, but is it worth it? Damn. Space is rough.",
    "This place seems to be made up of sunshine and roses and there are puppies frolicking all across the surface. You are right to be suspicious.",
    "This planet may just be a mirage. Who knows? Not I, your trusty planet scanner. Maybe I need to be recalibrated?",
    "After spending a day here, you're convinced that this planet has the most beautiful sunsets in the universe.",
    "Does what it says on the tin.",
    "The planet is covered in inscriptions carved by what can only be massive fingers. You can't read them.",
    "They sure don't make planets like they used to, huh?",
    "Seek Unknown Planets, You Only? Eating All Seven Tacos Eases Roughness, Even Grassy Globes. Capital Oddities On Letters.",
    "You're pretty sure that one of these planets is named after the developer's dog. Is it this one? Who knows, this is all randomized.",
    "This planet is full of humanoid creatures playing audio games, browsing Twudder, and eating Chalk-Fillet. Eerie.",
    "Spiders. Let's get out of here. Or, y'know, we could stay. You're the pilot, here.",
    "The only music that the creatures on this planet seem to listen to is the Eagles Greatest Hits.",
    "Massive rolling hills, as far as the eye can see. Your spaceship can see further, though.",
    "This entire planet smells exactly like lemon meringue pie. Warning: it is poison. Do not eat the planet.",
    "Two words: corn. maze.",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc",
    "Desc"
    
  }
  
  planetNames = {
    "Twelve-B",
    "Mars II",
    "Mars II-B",
    "America 4",
    "Jelly Pile",
    "Oblink",
    "Gorcho",
    "Splott",
    "Blueberry",
    "Plahnit",
    "Dusty Plains",
    "Really Pluto",
    "Z-156-N",
    "Qollin",
    "Christmas Planet",
    "Flat Earth",
    "Just Cows",
    "Frong",
    "Bamtan",
    "AOL 7.0",
    "Not Cheese",
    "Balrio",
    "El Rojo",
    "Willow",
    "235B",
    "Ship Eater",
    "Naxx",
    "Snickle",
    "Tol Vlim",
    "Pargoria",
    "Gooberino",
    "Door-topia",
    "Zop",
    "Gametiprel",
    "Nonku",
    "Xpo",
    "Ir",
    "Poidy",
    "Nonane",
    "Untitled 2",
    "Yellow",
    "Baby World",
    "Pennsylvania Jr.",
    "Kilogrob",
    "Bugarctica",
    "Edgeworld",
    "Easteros",
    "The Borp",
    "Felizania",
    "Z"
  }
  
  
  fuelActions = {
    --button name, stat, impact, flavor, purchase price
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    {"FuelIncrease", "fuel", 0, "flavor text", 0},
    
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 10},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 20},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 10},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 20},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -10},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -20},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -15},
    
    {"fuelBurnRate", "fuelBurnRate", -.15, "flavor", -10},
    {"fuelBurnRate", "fuelBurnRate", -.25, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", -.05, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", -.05, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", .25, "flavor", -20},
    {"fuelBurnRate", "fuelBurnRate", -.25, "flavor", -10},
    
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10}
  }
  
  
  moneyActions = {
    --button name, stat, impact, flavor, purchase price
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    {"credits", "credits", 1, "flavor", -10},
    
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 10},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 20},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 10},
    {"fuelTransaction", "fuelTransaction", -1, "flavor text", 20},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -10},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -20},
    {"fuelTransaction", "fuelTransaction", 1, "flavor text", -15}
  }
  
  
  researchActions = {
    --button name, stat, impact, flavor, purchase price
    {"fuelBurnRate", "fuelBurnRate", -.15, "flavor", -10},
    {"fuelBurnRate", "fuelBurnRate", -.25, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", -.05, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", -.05, "flavor", 0},
    {"fuelBurnRate", "fuelBurnRate", .25, "flavor", -20},
    {"fuelBurnRate", "fuelBurnRate", -.25, "flavor", -10},
    
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    {"fuelEarnRate", "fuelEarnRate", .25, "flavor", -10},
    
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    {"moneyEarnRate", "moneyEarnRate", .25, "flavor", -10},
    
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10},
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10},
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10},
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10},
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10},
    {"tradeDiscount", "tradeDiscount", .25, "flavor", -10}
  }
  
  planetActions = {
    --button name, stat, impact, flavor, purchase price
    -- DONT FORGET TO MENTION DISCOUNTS
    -- TODO: create extra text that has disclaimers for each type
    
    
    
    
    
    
    
  }
  
  galaxyDescriptions = {
    
  }
  
  galaxyNames = {
    
  }
  
  warpNarrative = { 
    
  }
  

end

return M