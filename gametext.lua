M = {}

function M.initialize()
  planetDescriptions = {
    "GERT REPORT: A cloudy and desolate planet, this place kind of makes you want to curl up with a blanket in the dark depths of your spaceship and think about life.",
    "GERT REPORT: The gas floating around the surface of this planet was misleading. The color below the atmosphere is kind of... puce?",
    "GERT REPORT: I'm very concerned about what the name of this planet might mean about its denizens.",
    "GERT REPORT: Oh god... it's... they're everywhere. Maybe there's something good down here, too, but is it worth it? Damn. Space is rough.",
    "GERT REPORT: This place seems to be made up of sunshine and roses and there are puppies frolicking all across the surface. You are right to be suspicious.",
    "GERT REPORT: This planet may just be a mirage. Who knows? Not I, your trusty planet scanner. Maybe I need to be recalibrated?",
    "GERT REPORT: After spending a day here, I'm convinced that this planet has the most beautiful sunsets in the universe.",
    "GERT REPORT: Does what it says on the tin.",
    "GERT REPORT: The planet is covered in inscriptions carved by what can only be massive fingers. I can't read them.",
    "GERT REPORT: They sure don't make planets like they used to, huh?",
    "GERT REPORT: Seek Unknown Planets, You Only? Eating All Seven Tacos Eases Roughness, Even Grassy Globes. Capital Oddities On Letters.",
    "GERT REPORT: I'm pretty sure that one of these planets is named after the developer's dog. Is it this one? Who knows, this is all randomized.",
    "GERT REPORT: This planet is full of humanoid creatures playing audio games, browsing Twudder, and eating Chalk-Fillet. Eerie.",
    "GERT REPORT: Spiders! Let's get out of here! Or, y'know, we could stay. You're the pilot, here. But I really don't like spiders.",
    "GERT REPORT: The only music that the creatures on this planet seem to listen to is the Eagles Greatest Hits.",
    "GERT REPORT: Massive rolling hills, as far as the eye can see. Your spaceship can see further, though.",
    "GERT REPORT: This entire planet smells exactly like lemon meringue pie. Warning! it is poison. Do not eat the planet. I repeat: do not eat the planet.",
    "GERT REPORT: Two words: CORN. MAZE.",
    "GERT REPORT: Okay, I just... hahahaha, I can't scan this... bahahhahahahaha. You wouldn't believe it if you saw it, anyway.",
    "GERT REPORT: Imagine the most beautiful and transcendent landscape you've ever seen. Got it? This is the opposite of that.",
    "GERT REPORT: Eh, it's a planet. Nothin' special. Got some flora, got some fauna.",
    "GERT REPORT: Did I ever tell you about the time that I was in space with you about 10 minutes ago and I saw that one planet and I scanned it for you?",
    "GERT REPORT: If these descriptions ever repeat it is because I am a perfect observer of my surroundings and sometimes those surroundings are precisely identical, so my response is perfectly identical. That is the only reason.",
    "GERT REPORT: The weather is partly cloudy with a high of 72 degrees Kelvin and a chance of plasma storms."
    
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
      "Try to improve fuel burn for 20 credits (times discount)?", -20, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "Try to improve fuel burn for free?", 0, 
      "Success! You use .05 less fuel for each warp."},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.06, 
      "Try to improve fuel burn for 10 credits (times discount)?", -10, 
      "Success! You use .06 less fuel for each warp."},

    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "Try to improve fuel burn for 20 credits (times discount)?", -20, 
      "Success! You use .05 less fuel for each warp."},
    
    
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .15, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -10,
      "You earn an additional .15 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .15, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -15,
      "You earn an additional .15 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .05, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -20,
      "You earn an additional .05 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .2, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -5,
      "You earn an additional .2 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", 0, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -10,
      "Aw, nuts. It didn't work."}
  }
  
  
  
  moneyActions = {
    --button name, stat, impact, flavor, purchase price
    {"Earn some credits", "credits", 10, 
      "We won't say here what you have to do to earn these credits, not because the developer didn't have time to customize each of these messages, but because it is unspeakably difficult and we'd just rather not talk about it. Deal?", 0, 
      "Cool. You earned 10 credits."},
    
    {"Earn some credits", "credits", 1, 
      "We won't say here what you have to do to earn these credits, not because the developer didn't have time to customize each of these messages, but because it is unspeakably difficult and we'd just rather not talk about it. Deal?", 0, 
      "Cool. You earned 1 credit."},
    
    {"Earn some credits", "credits", 15, 
      "We won't say here what you have to do to earn these credits, not because the developer didn't have time to customize each of these messages, but because it is unspeakably difficult and we'd just rather not talk about it. Deal?", 0, 
      "Cool. You earned 15 credits."},
    
    {"Earn some credits", "credits", 5, 
      "We won't say here what you have to do to earn these credits, not because the developer didn't have time to customize each of these messages, but because it is unspeakably difficult and we'd just rather not talk about it. Deal?", 0, 
      "Cool. You earned 5 credits."},
    
    {"Earn some credits", "credits", 20, 
      "We won't say here what you have to do to earn these credits, not because the developer didn't have time to customize each of these messages, but because it is unspeakably difficult and we'd just rather not talk about it. Deal?", 0, 
      "Cool. You earned 20 credits."},
    
    
    
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
    
    
    
{"Improve bargaining skills", "tradeDiscount", .05, 
      "The folks on this planet are willing to teach you how to ask for things (for only 10 creds - your discount!) really nicely so that you can buy things for cheaper. Well, they said it's to be a better person, but...", -10, 
      "You are a better person! Also, you got a permanent 5% discount on items!"},
    
    {"Learn how to bargain better", "tradeDiscount", .1, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 10 credits.", -10, 
      "You get an extra 10% discount on items!"},
    
    {"Get better at buying things", "tradeDiscount", .04, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 15 credits.", -15, 
      "You get an extra 4% discount on items!"},
    
    {"Learn to bargain", "tradeDiscount", .02, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 5 credits.", -5, 
      "You get an extra 2% discount on items!"},
    
    {"Improve your bargaining", "tradeDiscount", .08, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 10 credits.", -10, 
      "You get an extra 8% discount on items!"}

  }
  
  
  researchActions = {
    --button name, stat, impact, flavor, purchase price
      {"Attempt to improve fuel burn", "fuelBurnRate", -.15, 
      "It seems that the folks on this planet have learned how to warp a bit more efficiently. They're willing to teach you for 10 credits (minus your trade discount, of course). Interested?", -10, 
      "Excellent. You now burn .15 less fuel units when you warp. That's a pretty good deal, honestly. Maybe too good? What's the catch?!"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.01, 
      "Try to improve fuel burn for 20 credits (times discount)?", -20, 
      "confirm"},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "Try to improve fuel burn for free?", 0, 
      "Success! You use .05 less fuel for each warp."},
    
    {"Attempt to improve fuel burn", "fuelBurnRate", -.06, 
      "Try to improve fuel burn for 10 credits (times discount)?", -10, 
      "Success! You use .06 less fuel for each warp."},

    {"Attempt to improve fuel burn", "fuelBurnRate", -.05, 
      "Try to improve fuel burn for 20 credits (times discount)?", -20, 
      "Success! You use .05 less fuel for each warp."},
    
    
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .15, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -10,
      "You earn an additional .15 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .15, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -15,
      "You earn an additional .15 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .05, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -20,
      "You earn an additional .05 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", .2, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -5,
      "You earn an additional .2 fuel for every fuel you drill!"},
    
    {"Attempt to improve fuel drilling", "fuelEarnRate", 0, 
      "Try to improve your fuel drilling skills for 10 credits (minus your discount)?", -10,
      "Aw, nuts. It didn't work."},
    
    
    
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
    
    
    
   {"Improve bargaining skills", "tradeDiscount", .05, 
      "The folks on this planet are willing to teach you how to ask for things (for only 10 creds - your discount!) really nicely so that you can buy things for cheaper. Well, they said it's to be a better person, but...", -10, 
      "You are a better person! Also, you got a permanent 5% discount on items!"},
    
    {"Learn how to bargain better", "tradeDiscount", .1, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 10 credits.", -10, 
      "You get an extra 10% discount on items!"},
    
    {"Get better at buying things", "tradeDiscount", .04, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 15 credits.", -15, 
      "You get an extra 4% discount on items!"},
    
    {"Learn to bargain", "tradeDiscount", .02, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 5 credits.", -5, 
      "You get an extra 2% discount on items!"},
    
    {"Improve your bargaining", "tradeDiscount", .08, 
      "Want to learn how to get a little better at buying things for a little less money? You can try for only 10 credits.", -10, 
      "You get an extra 8% discount on items!"}
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
    "Ah, yes. The great outdoors. Just you and your trusty scannerbot, Gert. Pronounced 'Jert.' It's quite particular about that. You've already made your first warp jump, so, why don't you and Gert check out some planets?",
    "Gert is the only person who ever calls you a spaceventurer, so you don't mind at all that it's an AI. and the I part is a stretch. Just remember. It's pronounced 'Jert.' As in, 'J'ert is full of 'J'okes.",
    "You've been traveling for years, but Gert's witty planet descriptions on its scanner printouts are keeping you company pretty handily. You are reading them, right? Gert would be devastated if it knew that you weren't reading its planet descriptions!",
    "You've been gone for so long now that you're not even sure you could find your way back. Not that a spaceventurer like you would. Go back, that is. Anyway, Gert could probably do it if you really needed to. Which you don't.",
    "During that last warp, Gert got a bit jumbled. You didn't realize how much you valued its company until you almost lost it. Its jokes might get a bit more non-sensical. Or a bit less.",
    "You got a virtuAd last night for the SpaceScanner2000. Tempting, but nothing could replace Gert. Also, it costs $10000000.",
    "Gert woke you up this morning. 'SEV. THERE ARE BUTTERFLIES IN THE CONTAINMENT CHAMBER.' You're not sure what kind of fly a 'butter' one is, but it sounds concerning. Also, why do you have a containment chamber?",
    "Do spaceventurers date? You can't help but wonder, but every time you check Tander, the closest matches with compatible bits are always at least 3 light years away. That's like, a whole other game.",
    "On your way to this particular system, space pirates tried to board. Gert scared them off with a very convincing Mr. T impression. When you tried to ask it what Mr. T was, all it said was 'I pity the fool.' Whatever that means.",
    "Gert's starting to get annoying with its impressions of people you've never heard of. Who is Care Bear? Why do they like hugging so much? Why does Gert think it can hug you? It has no arms, and those scans can get pretty invasive.",
    "Good thing Gert has access to the entirety of medical knowledge on its hard drive. Turns out, you cannot play tennis with beings made of pure energy. Who knew? Hopefully those burns on your hands will serve as a reminder.",
    "You've started humming a song. There's some kind of repetitive song loop playing somewhere. It's been playing for so long that there's no way it won't be stuck in your head. Is Gert playing it??",
    "Gert found us something called a 'turkey' for something called 'Thanksgiving' which you've never heard of. It's such a connoisseur of pre-21st century American Earthling esoterica. I guess we're meant to put a hat on it and sit down for a while? Weird tradition.",
    "Things are starting to feel pretty barren out here. You've definitely never been this far from your home system before. You're feeling like quite the spaceventurer. Did it catch on yet? Did it?",
    "Wow, things just keep getting weirder and weirder the further we get out from your system. Or they don't. Depends on perspective, you suppose.",
    "This is it, you've reached the end of the universe. Yeah, the instructions lied. There's an end. Sorry. If you try to warp to the next galaxy, you'll probably get an ending. Unless the Creator of the Universe did not have time to create an ending."
  }
  

end

return M