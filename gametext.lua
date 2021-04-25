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
    "Spiders! Let's get out of here! Or, y'know, we could stay. You're the pilot, here.",
    "The only music that the creatures on this planet seem to listen to is the Eagles Greatest Hits.",
    "Massive rolling hills, as far as the eye can see. Your spaceship can see further, though.",
    "This entire planet smells exactly like lemon meringue pie. Warning! it is poison. Do not eat the planet.",
    "Two words: CORN. MAZE.",
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
    --button name, stat, impact, flavor, purchase price, confirmation text
    {"Drill for 2 fuel", "fuel", 2, 
      "The beings on this planet haven't learned how to drill for fuel. Joke's on them, more for you! Drill?", 0, 
      "It worked! Look at all this fuel! You gained 2 fuel (times your multiplier, of course)."},
    
    {"Attempt to retrieve 1 fuel", "fuel", 1, 
      "Apparently the beings who live here actually eat fuel for breakfast, lunch, and dinner. They're all too happy to feed you some. Do you 'accept'?", 0, 
      "Mmm, yummy. Fuel. You gained 1 fuel (times your multiplier)."},
    
    {"Drill for 1 fuel", "fuel", 1, 
      "The land here appears to be made from something that has a consistency similar to jello. It'll probably be pretty easy to drill here. You could probably even 'drill' with your hands. Want to?", 0, 
      "Your hands hurt, but you are 1 fuel richer (times your multiplier, naturally)."},
    
    {"Attempt to retrieve 1 fuel", "fuel", 1, 
      "There's no fuel left on this planet, it's been drained dry. But you do see large vats of the stuff, unguarded. Do you?", 0,
      "Wow. If this game had a karma system, you would definitely lose some karma. But you got some fuel, so, good for you I guess? (You gained 1 fuel times your multiplier.)"},
    
    {"Drill for 1 fuel", "fuel", 0, 
      "Fuel seems to be pretty scarce here, but you're pretty sure you can find some in the less populated regions. Give it a try?", 0, 
      "Unfortunately, you couldn't find any. Oh well, can't hurt to try, right?"},
    
    
    
    
    {"Sell 1 fuel", "fuelTransaction", -1, 
      "A local merchant approaches and seems desperate for 1 fuel unit. Looks like you can turn a tidy profit. Sell for 20 credits?", 20, 
      "Success! Look at all those credits! Pfft. Capitalist."},
    
    {"Buy 1 fuel", "fuelTransaction", 1, 
      "'Fuel units! Fuel units! Getcha fuel units here!' the hawker seems to be flush with, well, fuel units. Buy 1 fuel unit for 10 credits?", -10, 
      "That was a pretty good price. Too bad you couldn't buy more than one, but that adds layers of game complexity that you're just not ready for. At least you got your trade discount."},
    
    {"Sell 2 fuel", "fuelTransaction", -2, 
      "A businessbeing in the city approaches you and briskly offers you 30 credits for 2 fuel units. He looks like he could afford more, but counteroffers are beyond the scope of this game, err, transaction. Sell two fuel units for 30 credits (times your earn rate, of course)?", 30, 
      "Coulda gotten more in a different world where counteroffers existed. Oh well. You're all those credits richer, at least."},
    
    {"Buy 2 fuel", "fuelTransaction", 2, 
      "Wow, this high roller wants to sell you two fuel for a whopping 50 credits. 'Do I look like I have that kinda money!?' you think. ...Do you? Have that kinda money? (Don't forget your trade discount! which you have to calculate yourself, since you do not carry a calculator with you.)", -50, 
      "confirm"},
    
    {"Buy 1 fuel", "fuelTransaction", 1, 
      "This place has fuel vending machines! Cool! Buy 1 fuel unit for 10 credits?", -10, 
      "Chrrr-clunk! The fuel unit plops out of the bottom of the machine. That can't be safe, can it?"},
    
    
    
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.15, 
      "It seems that the folks on this planet have learned how to warp a bit more efficiently. They're willing to teach you for 10 credits (minus your trade discount, of course). Interested?", -10, 
      "Excellent. You now burn .15 less fuel units when you warp. That's a pretty good deal, honestly. Maybe too good? What's the catch?!"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.01, 
      "flavor", -20, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "flavor", 0, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "flavor", 0, 
      "confirm"},

    {"Attempt to improve fuel burn", "fuelBurnRate", .25, 
      "flavor", -20, 
      "confirm"},
    
    
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"}
  }
  
  
  
  moneyActions = {
    --button name, stat, impact, flavor, purchase price
    {"credits", "credits", 1, 
      "flavor", -10, 
      "confirm"},
    
    {"credits", "credits", 1, 
      "flavor", -10, 
      "confirm"},
    
    {"credits", "credits", 1, 
      "flavor", -10, 
      "confirm"},
    
    {"credits", "credits", 1, 
      "flavor", -10, 
      "confirm"},
    
    {"credits", "credits", 1, 
      "flavor", -10, 
      "confirm"},
    
    
    
    {"Sell 1 fuel", "fuelTransaction", -1, 
      "A local merchant approaches and seems desperate for 1 fuel unit. Looks like you can turn a tidy profit. Sell for 20 credits?", 20, 
      "Success! Look at all those credits! Pfft. Capitalist."},
    
    {"Buy 1 fuel", "fuelTransaction", 1, 
      "'Fuel units! Fuel units! Getcha fuel units here!' the hawker seems to be flush with, well, fuel units. Buy 1 fuel unit for 10 credits?", -10, 
      "That was a pretty good price. Too bad you couldn't buy more than one, but that adds layers of game complexity that you're just not ready for."},
    
    {"Sell 2 fuel", "fuelTransaction", -2, 
      "A businessbeing in the city approaches you and briskly offers you 30 credits for 2 fuel units. He looks like he could afford more, but counteroffers are beyond the scope of this game, err, transaction. Sell two fuel units for 30 credits (times your earn rate, of course)?", 30, 
      "Coulda gotten more in a different world where counteroffers existed. Oh well. You're all those credits richer, at least."},
    
    {"Buy 2 fuel", "fuelTransaction", 2, 
      "Wow, this high roller wants to sell you two fuel for a whopping 50 credits. 'Do I look like I have that kinda money!?' you think. ...Do you? Have that kinda money? (Don't forget your trade discount! which you have to calculate yourself, since you do not carry a calculator with you.)", -50, 
      "confirm"},
    
    {"Buy 1 fuel", "fuelTransaction", 1, 
      "This place has fuel vending machines! Cool! Buy 1 fuel unit for 10 credits?", -10, 
      "Chrrr-clunk! The fuel unit plops out of the bottom of the machine. That can't be safe, can it?"},
    
    
    
    {"Improve fuel sales skills", "moneyEarnRate", .04, 
      "If you wanted, you could take some time to learn more about how the master merchants on this planet hawk their wares. Want to?", 0,
      "Well then, you just did. You're 4% better at selling your fuel now. Good for you!"},
    
    {"Improve fuel sales skills", "moneyEarnRate", .1, 
      "Want to spend 20 credits (minus your trade discount) to take a course entitled 'Fuel Sales And You: The Insiders Perspective Into Making More Money By Selling Fuel Units'? What a mouthful.", -20,
      "Gotta spend money to make money, bay-bee! That's one of the course instructor's catchphrases. You're 10% better at selling your fuel."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .05, 
      "Interested in observing a local market for a day? Might learn a thing or two about selling fuel yourself.", 0,
      "Awesome. The folks here are great at selling things. Now you are slightly more great at selling things, too. 5%, to be precise."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .01, 
      "Someone approaches your ship as you land, and promises to teach you All Of The Secrets to fuel sales. How about it?! Only a measly 10 credits (minus your trade discount).", -10,
      "This guy didn't know all that much. You're 1% better at selling your fuel."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .07, 
      "You find a pamphlet on the ground on this planet. You can't read the language but it looks like there are some pretty useful pictures. Want to spend some time reading it?", 0,
      "You think you're 7% better at selling your fuel now? But that depends. Is that a picture of a fuel cell or a small can of soda? You might be 7% better at selling cans of soda."},
    
    
    
    {"Improve bargaining skills", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Learn how to bargain better", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Get better at buying things", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Learn to bargain", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Improve your bargaining", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"}

  }
  
  
  researchActions = {
    --button name, stat, impact, flavor, purchase price
     {"Attempt to improve fuel burn", "fuelBurnRate", -.15, 
      "flavor", -10, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.25, 
      "flavor", 0, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "flavor", 0, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "flavor", 0, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", .25, 
      "flavor", -20, 
      "confirm"},
    
    
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .25, 
      "flavor", -10,
      "confirm"},
    
    
    
{"Improve fuel sales skills", "moneyEarnRate", .04, 
      "If you wanted, you could take some time to learn more about how the master merchants on this planet hawk their wares. Want to?", 0,
      "Well then, you just did. You're 4% better at selling your fuel now. Good for you!"},
    
    {"Improve fuel sales skills", "moneyEarnRate", .1, 
      "Want to spend 20 credits (minus your trade discount) to take a course entitled 'Fuel Sales And You: The Insiders Perspective Into Making More Money By Selling Fuel Units'? What a mouthful.", -20,
      "Gotta spend money to make money, bay-bee! That's one of the course instructor's catchphrases. You're 10% better at selling your fuel."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .05, 
      "Interested in observing a local market for a day? Might learn a thing or two about selling fuel yourself.", 0,
      "Awesome. The folks here are great at selling things. Now you are slightly more great at selling things, too. 5%, to be precise."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .01, 
      "Someone approaches your ship as you land, and promises to teach you All Of The Secrets to fuel sales. How about it?! Only a measly 10 credits (minus your trade discount).", -10,
      "This guy didn't know all that much. You're 1% better at selling your fuel."},
    
    {"Improve fuel sales skills", "moneyEarnRate", .07, 
      "You find a pamphlet on the ground on this planet. You can't read the language but it looks like there are some pretty useful pictures. Want to spend some time reading it?", 0,
      "You think you're 7% better at selling your fuel now? But that depends. Is that a picture of a fuel cell or a small can of soda? You might be 7% better at selling cans of soda."},
    
    
    
   {"Improve bargaining skills", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Learn how to bargain better", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Get better at buying things", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Learn to bargain", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"},
    
    {"Improve your bargaining", "tradeDiscount", .25, 
      "flavor", -10, 
      "confirm"}
  }
  
  galaxyNames = {
    "Sector X",
    "Harpades",
    "Juniper 7",
    "Mulky Woy",
    "Wikigalaxy",
    "Sector 27A",
    "Untitled",
    "Danger Zone",
    "Planets R Us",
    "Flegijalwei",
    "5d546g4rB",
    "Einstein System",
    "No Boys Allowed",
    "Zillionia",
    "Bananarama",
    "The Bermuda Sector",
    "1234567890",
    "L038 D21 - X",
    "31 Alpha",
    "27 Beta Gamma",
    "Epsilonia",
    "Omega Horse",
    "Q Cluster",
    "ARP Nebula",
    "Carolfigli",
    "AsciiBo"
  }
  
  warpNarrative = { 
    "Ah, yes. The great outdoors. Just you and your trusty scannerbot, Gert. Pronounced 'Jert.' It's quite particular about that.",
    "Gert is the only person who ever calls you a spaceventurer, so you don't mind at all that it's an AI. and the I part is a stretch.",
    "You've been traveling for years, but Gert's witty planet descriptions on its scanner printouts are keeping you company. You are reading them, right?",
    "You've been gone for so long now that you're not even sure you could find your way back. Not that a spaceventurer like you would. Go back, that is.",
    "During that last warp, Gert got a bit jumbled. You didn't realize how much you valued its company until you almost lost it.",
    "You got a virtuAd last night for the SpaceScanner2000. Tempting, but nothing could replace Gert. Also, it's too expensive.",
    "Gert woke you up this morning. 'SEV. THERE ARE BUTTERFLIES IN THE CONTAINMENT CHAMBER.' You're not sure what kind of fly a 'butter' one is, but it sounds concerning.",
    "Do spaceventurers date? You can't help but wonder, but every time you check Tander, the closest matches with compatible bits are always at least 3 light years away.",
    "On your way to this galaxy, space pirates tried to board. Gert scared them off with a very convincing Mr. T impression. When you tried to ask it what Mr. T was, all it said was 'I pity the fool.' Whatever that means.",
    "Gert's starting to get annoying with its impressions of people you've never heard of. Who is Care Bear? Why do they like hugging so much? Why does Gert think it can hug you? It has no arms.",
    "Good thing Gert has access to the entirety of medical knowledge on its hard drive. Turns out, you cannot play tennis with beings made of pure energy. Who knew?",
    "You've started humming a song. There's some kind of repetitive song loop playing somewhere. It's been playing for so long that there's no way it won't be stuck in your head.",
    "Gert found us something called a 'turkey' for something called 'Thanksgiving' which you've never heard of. It's such a connoisseur of pre-21st century Earth esoterica. I guess we're meant to put a hat on it and sit down for a while?",
    "Things are starting to feel pretty barren out here. You've definitely never been this far from your home system before. You're feeling like quite the spaceventurer.",
    "Wow, things just keep getting weirder and weirder the further we get out from your system. Or they don't. Depends on perspective, you suppose.",
    "This is it, you've reached the end of the universe. Yeah, the instructions lied. There's an end. Sorry."

  }
  

end

return M