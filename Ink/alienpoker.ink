/*
Node reference:
For all of these types we probably want to create a “new inherited scene” from so we can change their specific each turn
CardChoice
	emits signal card_selected(card, char)
DialogueScene
	emits signal dialogue_done() when clicked
DialogueChoice (not done) 	emits signal dialogue_choice(choice)
	choice should return an int starting from 0 (0, 1, 2, etc)

Important values:
Card: “orbit”, “ship”, “worm”, "raye", "cool worm"
Event cards: "AI1", "AI2", "AI3"
Char: “xeno”, “annie”, “robot”, "player"
*/


//Functions: 

EXTERNAL setupHands()
//draw cards but not: annie worms, robot orbit, xeno rayes, player no joke cards
EXTERNAL drawCard(char) 
//draw a random card
EXTERNAL drawCardPlayer()  
//give player a random card, with a chance of giving a joke card
EXTERNAL moveCard(from,to,card)
//transfer card
EXTERNAL giveCardPlayer(card) 
//give player a specific card
EXTERNAL drawCardAll()
//all 3 opponents do drawCard() and player does drawCardPlayer()
EXTERNAL checkCard(char,card)
//return true or false
EXTERNAL randomCardType()
//pick random card type from “orbit”, “ship”, “worm”, "raye", "cool worm"
EXTERNAL musicPlay(song) 
//"song1" or "song2"
EXTERNAL musicStop()
EXTERNAL loadScene(scenename)

//Variables:
VAR ending = "neutral" //values: annie, robot, xeno, neutral. Determines which splash screen shows at the end.
VAR choiceMode = "card" //values are either “card” or “dialogue”. Set this before a choice comes up to display the correct UI.
VAR card = "none" //used per-turn to store the card used, e.g. if we generate a random card that turn

//character anger, ++ anytime player targets them
VAR RobotRage = 0 
VAR AnnieRage = 0 
VAR XenoRage = 0


-> start


==start==
/*
You are formally invited to Pbouxhkiir Night on the Primox Alpha
Sponsored by the CHAGTAD® Demolition Company.
(“We blow up planets because we hate them!”)

Pbouxhkiir (/ˈpō-kər/), invented by renowned hyper-wizard Gooeddoby the Evanesced*, is the Galaxy’s favorite game of wit, skill, and attrition.

The winner of tonight’s game will receive 83 quintillion CHAGbucks™, and be given the honor of demonstrating CHAGTAD®’s new detonation device on an insignificant planet named “Earth.”

*Gooeddoby himself finally lived up to his name, and disappeared shortly after inventing his magnum opus. His whereabouts have long become the topic of heated debates on GalactaNet conspiracy forums.
*/
*[next]->turn1robot

//--------------------turn 1-----------------------------
==turn1robot==
~setupHands()
~musicPlay("song1")
~loadScene("turn1robot")
ROBOT: Annie, do you have any worms?
ANNIE: No, I DON’T. Amateur mistake. Go fish.
ROBOT: …
~drawCard("robot")
*[next]->turn1annie

==turn1annie==
~loadScene("turn1annie")
ANNIE: Alright, now it’s my turn.
ANNIE: You have an orbit, I can feel it.
ROBOT: I don’t.
ANNIE: Well, you’ll have one later.
ROBOT: Sure.
ANNIE: You can’t not have one forever.
~drawCard("annie")
*[next]->turn1xeno

==turn1xeno==
~loadScene("turn1xeno")
XENOPHAGE: Ok, um, Annie, do you have any rayes?
ANNIE: Nope. No, I do not.
XENOPHAGE: Ah well.
*[next]->turn1player

//-----------turn 1 (player)-------------
==turn1player==
~choiceMode = "card"
~loadScene("turn1player")
*[ROBOT (correct)]->turn1playerrobottrue
*[ROBOT (incorrect)]->turn1playerrobotfalse
*[ANNIE (correct)]->turn1playerannietrue
*[ANNIE (incorrect)]->turn1playeranniefalse
*[XENOPHAGE (correct)]->turn1playerxenotrue
*[XENOPHAGE (incorrect)]->turn1playerxenofalse
==turn1playerrobottrue==
~loadScene("turn1playerrobottrue")
ROBOT: Do I look like I’m made of {card}s?
ROBOT: Because I’m not. That wouldn’t be logical.
ROBOT: …FINE. HERE YOU GO.
~moveCard("robot","player",card)
~RobotRage++
*[next]-> turn2robot
==turn1playerrobotfalse==
~loadScene("turn1playerrobotfalse")
ROBOT: Your logic circuits must be failing.
ROBOT: Because I do not have that card.
~drawCardPlayer()
~RobotRage++
*[next]-> turn2robot

==turn1playerannietrue==
~loadScene("turn1playerannietrue")
ANNIE: God freaking dang it.
ANNIE: Whatever, here’s your card.
~moveCard("annie","player",card)
~AnnieRage++
*[next]-> turn2robot
==turn1playeranniefalse==
~loadScene("turn1playeranniefalse")
ANNIE: I knew you’d ask for that.
ANNIE: No, go fish.
~drawCardPlayer()
~AnnieRage++
*[next]-> turn2robot

==turn1playerxenotrue==
~loadScene("turn1playerxenotrue")
XENOPHAGE: Awwwww dang.
XENOPHAGE: Yeah, here’s your card.
~moveCard("xeno","player",card)
~XenoRage++
*[next]-> turn2robot
==turn1playerxenofalse==
~loadScene("turn1playerxenofalse")
XENOPHAGE: Nope, sorry, I don’t have that.
XENOPHAGE: Go fish!
~drawCardPlayer()
~XenoRage++
*[next]-> turn2robot

//--------------------turn 2-----------------------------
==turn2robot==
~loadScene("turn2robot")
~drawCardAll()
~card = randomCardType()
ROBOT: I’ve put all of your dialogue into an AI text generator…
XENOPHAGE: Ah Christ, here we go again.
ROBOT: It told me in your voice that you have a {card}.
ROBOT: Anyways, like I’ve been telling you, AI is creating trillions of new jobs…
{
    - checkCard("xeno",card) == true:
        ->turn2robotxenotrue
    - else:
        ->turn2robotxenofalse
} 

==turn2robotxenotrue==
~loadScene("turn2robotxenotrue")
XENOPHAGE: Here’s the card. Just stop talking.
~moveCard("xeno","robot",card)
*[next]-> turn2annie
==turn2robotxenofalse==
~loadScene("turn2robotxenofalse")
XENOPHAGE: I don’t have it. Stop talking and go fish.
~drawCard("robot")
*[next]-> turn2annie

==turn2annie==
~loadScene("turn2annie")
ANNIE: Let’s talk about something else.
ANNIE: Like that lovely uterus card you have there, human.
XENOPHAGE: Woah woah woah woooooooah.
ROBOT: What the robot hell are you talking about.
*[next]-> turn2annie2
==turn2annie2==
~loadScene("turn2annie2")
ANNIE: This one! The uterus one!
XENOPHAGE: Buddy. That’s a spaceship.
ROBOT: Yes, it’s-
ROBOT: Wait no, that’s a raygun.
ANNIE: Humans love to incorporate their reproductive biology into iconography.
ROBOT: Human, is this true?
*[next]-> turn2anniechoice
==turn2anniechoice==
~choiceMode = "dialogue"
~loadScene("turn2anniechoice")
*[Yeah…]
-> turn2annietrue
*[Humans actually don’t have uteruses. Uterusi?]
->turn2anniefalse
==turn2annietrue==
~loadScene("turn2annietrue")
ANNIE: See? See?
XENOPHAGE: Well, I’ll be damned.
ANNIE: Whatever, do you have the card or not?
{
    - checkCard("xeno",card) == true:
        ->turn2annieplayertrue
    - else:
        ->turn2annieplayerfalse
} 
==turn2anniefalse==
~loadScene("turn2anniefalse")
ROBOT: We’re playing with a Xentrati-style deck.
ROBOT: Obviously, it’s a Xentrati uterus.
ANNIE: Whatever, do you have the card or not?
{
    - checkCard("player","ship") == true:
        ->turn2playerannietrue
    - else:
        ->turn2playeranniefalse
} 
==turn2annieplayertrue==
~loadScene("turn2annieplayertrue")
ANNIE: Cool, thanks.
~loadScene("turn2xeno")
*[next]->turn2xeno
==turn2annieplayerfalse==
~loadScene("turn2playeranniefalse")
ANNIE: God damn it.
~drawCard("annie")
*[next]->turn2xeno

==turn2xeno==
~loadScene("turn2xeno")
~card = randomCardType()
XENOPHAGE: Anyways, Annie, do you have any {card}s?
{
    - checkCard("annie",card) == true:
        ->turn2xenoannietrue
    - else:
        ->turn2xenoanniefalse
} 
==turn2xenoannietrue==
~loadScene("turn2xenoannietrue")
ANNIE: Ughhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
XENOPHAGE: Jeez, sorry.
~moveCard("annie","xeno",card)
*[next]->turn2player
==turn2xenoanniefalse==
~loadScene("turn2xenoanniefalse")
ANNIE: I knew you’d ask.
XENOPHAGE: So do you have it, or-
ANNIE: No, go fish.
~drawCard("xeno")
*[next]->turn2player

//-----------turn 2 (player)-------------
==turn2player==
~choiceMode = "card"
~loadScene("turn2player")
*[ROBOT (correct)]->turn2playerrobottrue
*[ROBOT (incorrect)]->turn2playerrobotfalse
*[ANNIE (correct)]->turn2playerannietrue
*[ANNIE (incorrect)]->turn2playeranniefalse
*[XENOPHAGE (correct)]->turn2playerxenotrue
*[XENOPHAGE (incorrect)]->turn2playerxenofalse
==turn2playerrobottrue==
~loadScene("turn2playerrobottrue")
ROBOT: You have a sharp mind, human. It is yours.
~moveCard("robot","player",card)
~RobotRage++
*[next]-> turn3robot
==turn2playerrobotfalse==
~loadScene("turn2playerrobotfalse")
ROBOT: A total misplay. Go fish.
~drawCardPlayer()
~RobotRage++
*[next]-> turn3robot

==turn2playerannietrue==
~loadScene("turn2playerannietrue")
ANNIE: Take it and leave.
~moveCard("annie","player",card)
~AnnieRage++
*[next]-> turn3robot
==turn2playeranniefalse==
~loadScene("turn2playeranniefalse")
ANNIE: All that gunk in your skull, and you aren’t using any of it.
ANNIE: I don’t have that card.
~drawCardPlayer()
~AnnieRage++
*[next]-> turn3robot

==turn2playerxenotrue==
~loadScene("turn2playerxenotrue")
XENOPHAGE: Yup, I have it. Here you go.
~moveCard("xeno","player",card)
~XenoRage++
*[next]-> turn3robot
==turn2playerxenofalse==
~loadScene("turn2playerxenofalse")
XENOPHAGE: Nope, no card. Get your net.
~drawCardPlayer()
~XenoRage++
*[next]-> turn3robot

//--------------------turn 3-----------------------------
==turn3robot==
~loadScene("turn3robot")
~drawCardAll()
~card = randomCardType()
ROBOT: Xenophage, do you have any {card}s?
{
    - checkCard("xeno",card) == true:
        ->turn3robotxenotrue
    - else:
        ->turn3robotxenofalse
} 
==turn3robotxenotrue==
~loadScene("turn3robotxenotrue")
XENOPHAGE: Ah, you got me.
ROBOT: All according to plan.
~moveCard("xeno","robot",card)
*[next]->turn3annie
==turn3robotxenofalse==
~loadScene("turn3robotxenofalse")
XENOPHAGE: Sorry, no dice. Go fish.
ROBOT: Whatever.
~drawCard("robot")
~loadScene("turn3annie")
*[next]->turn3annie

==turn3annie==
~loadScene("turn3annie")
ANNIE: Ok Computer, do you have any uterusi?
ROBOT: I’m a robot. Why would I?
*[next]->turn3annie2
==turn3annie2==
ANNIE: I swear to God-
ANNIE: Rayguns, do you have any rayguns?
{
    - checkCard("robot","ship") == true:
        ->turn3annierobottrue
    - else:
        ->turn3annierobotfalse
} 
==turn3annierobottrue==
~loadScene("turn3annierobottrue")
ROBOT: In that case, yes, and here you go.
~moveCard("robot","annie","ship")
~loadScene("turn3xeno")
*[next]->turn3xeno
==turn3annierobotfalse==
~loadScene("turn3annierobotfalse")
ROBOT: My answer remains “no.”
~drawCard("annie")
*[next]->turn3xeno

==turn3xeno==
~loadScene("turn3xeno")
~card = randomCardType()
XENOPHAGE: Annie, do you have any {card}s?
{
    - checkCard("annie",card) == true:
        ->turn3xenoannietrue
    - else:
        ->turn3xenoanniefalse
} 
==turn3xenoannietrue==
~loadScene("turn3xenoannietrue")
ANNIE: Wow that’s crazy! I do!!
XENOPHAGE: Ok, well, I’ll take them.
ANNIE: Sounds great!!!!!!!!!!
~moveCard("annie","xeno",card)
*[next]->turn3player
==turn3xenoanniefalse==
~loadScene("turn3xenoanniefalse")
ANNIE: Zilch.
XENOPHAGE: Okay, I’ll go fish.
~drawCard("xeno")
*[next]->turn3player

//-----------turn 3 (player)-------------
==turn3player==
/*TALKING CARD: Player! You are chosen, and thus I have revealed myself to you!
TALKING CARD: Heed my words: do not poke any one of your opponents too many times, lest you agitate them and enter NEMESIS MODE.*/
~choiceMode = "card"
~loadScene(turn3player)
*[ROBOT (correct)]->turn3playerrobottrue
*[ROBOT (incorrect)]->turn3playerrobotfalse
*[ANNIE (correct)]->turn3playerannietrue
*[ANNIE (incorrect)]->turn3playeranniefalse
*[XENOPHAGE (correct)]->turn3playerxenotrue
*[XENOPHAGE (incorrect)]->turn3playerxenofalse
==turn3playerrobottrue==
~loadScene("turn3playerrobottrue")
ROBOT: Here, take it. It makes no difference.
~moveCard("robot","player",card)
~RobotRage++
 *[next]-> turn4robot
==turn3playerrobotfalse==
~loadScene("turn3playerrobotfalse")
ROBOT: What an absurd question. Of course I don’t have that, go fish.
~drawCardPlayer()
~RobotRage++
 *[next]-> turn4robot

==turn3playerannietrue==
~loadScene("turn3playerannietrue")
ANNIE: Take it and get out of here.
~moveCard("annie","player",card)
~AnnieRage++
*[next] -> turn4robot
==turn3playeranniefalse==
~loadScene("turn3playeranniefalse")
ANNIE: I wouldn’t be caught dead with a {card}.
~drawCardPlayer()
~AnnieRage++
*[next] -> turn4robot

==turn3playerxenotrue==
~loadScene("turn3playerxenotrue")
XENOPHAGE: Sadly, I have it.
~moveCard("xeno","player",card)
~XenoRage++
*[next] -> turn4robot
==turn3playerxenofalse==
~loadScene("turn3playerxenofalse")
XENOPHAGE: Nada. Fish time.
~drawCardPlayer()
~XenoRage++
*[next] -> turn4robot


//--------------------turn 4-----------------------------
==turn4robot==
~loadScene("turn4robot")
~drawCardAll()
~card = randomCardType()
ROBOT: I used the AI again, and it told me your opinion on undocumented migrant farmworkers.
ROBOT: I’m surprised that you’re advocating we do that.
XENOPHAGE: Card. What card do you want.
ROBOT: Gimme a {card}.
{
    - checkCard("xeno",card) == true:
        ->turn4robotxenotrue
    - else:
        ->turn4robotxenofalse
} 
==turn4robotxenotrue==
XENOPHAGE: Here.
~moveCard("xeno","robot",card)
*[next]-> turn4annie
==turn4robotxenofalse==
XENOPHAGE: Go fish.
~drawCard("robot")
*[next]-> turn4annie

==turn4annie==
~loadScene("turn4annie")
ANNIE: Hey human, you got any orbits?
{
    - checkCard("player","orbit") == true:
        ->turn4annieplayertrue
    - else:
        ->turn4annieplayerfalse
} 
==turn4annieplayertrue==
~loadScene("turn4annieplayertrue")
ANNIE: Heh, better play harder if you want that prize money.
ANNIE: And the honor of blowing up that sweet, sweet planet.
~moveCard("player","annie","orbit")
*[next]-> turn4anniecont
==turn4annieplayerfalse==
~loadScene("turn4annieplayerfalse")
ANNIE: Crap. Guess you really want that prize money, huh?
ANNIE: Oh, or you want to blow up that planet? Me too buddy, me too.
~drawCard("annie")
*[next]-> turn4anniecont
==turn4anniecont==
~loadScene("turn4anniecont")
XENOPHAGE: Annie, that’s why you’re in this?
XENOPHAGE: To blow up the Earth?
ANNIE: I mean, money is cool also. Both of the prizes appeal to me.
ROBOT: Well, *I* hate the Earth.
ANNIE: Yeah, you tell ‘em.
*[next]-> turn4anniecont2
==turn4anniecont2==
~loadScene("turn4anniecont2")
XENOPHAGE: Wait, what’s wrong with Earth?
XENOPHAGE: I’ve never been.
ROBOT: According to my logic circuits, humans are the stupidest, dumbest, dustiest life forms.
ROBOT: And they get really judgemental when you post photos of your living space.
XENOPHAGE: I’m uh. I’m sorry for bringing it up.
*[next] -> turn4xeno

==turn4xeno==
~loadScene("turn4xeno")
~card = randomCardType()
XENOPHAGE: Annie, do you have any {card}s?
ANNIE: Yknow, I’m getting a real sense of deja vu.
XENOPHAGE: Really?
ANNIE: Yeahhh. Something about this feels familiar.
XENOPHAGE: Probably your imagination.
{
    - checkCard("annie",card) == true:
        ->turn4xenoannietrue
    - else:
        ->turn4xenoanniefalse
} 
==turn4xenoannietrue==
~loadScene("turn4xenoannietrue")
ANNIE: Yeah, probably. Here’s your card, I guess.
~moveCard("annie","xeno",card)
*[next]->turn4player
==turn4xenoanniefalse==
~loadScene("turn4xenoanniefalse")
ANNIE: Yeah, probably. Don’t have your card, by the way.
~drawCard("xeno")
*[next]->turn4player


//-----------turn 4 (player)-------------
==turn4player==
//TALKING CARD: Player!
//TALKING CARD: Keep your eyes open, and the best player can be read like a holo-book!
~choiceMode = "card"
~loadScene("turn4player")
*[ROBOT (correct)]->turn4playerrobottrue
*[ROBOT (incorrect)]->turn4playerrobotfalse
*[ANNIE (correct)]->turn4playerannietrue
*[ANNIE (incorrect)]->turn4playeranniefalse
*[XENOPHAGE (correct)]->turn4playerxenotrue
*[XENOPHAGE (incorrect)]->turn4playerxenofalse
==turn4playerrobottrue==
~loadScene("turn4playerrobottrue")
ROBOT: What an astute mind! Yes, yes I have it.
~moveCard("robot","player",card)
~RobotRage++
*[next]-> turn5robot
==turn4playerrobotfalse==
~loadScene("turn4playerrobotfalse")
ROBOT: No, I don't have it. See, this is why AI will replace most jobs within the next 10 years.
XENOPHAGE: You said it wasn’t gonna do that.
ROBOT: No, I said it’d make new jobs. You can’t have new jobs without eliminating old jobs.
ROBOT: The job market wouldn’t fit all of them.
XENOPHAGE: I hope your job goes first.
~drawCardPlayer()
~RobotRage++
*[next]-> turn5robot

==turn4playerannietrue==
~loadScene("turn4playerannietrue")
ANNIE: You want it? You can have it. As a treat. 
~moveCard("annie","player",card)
~AnnieRage++
*[next]-> turn5robot
==turn4playeranniefalse==
~loadScene("turn4playeranniefalse")
ANNIE: I don’t have that, but I do have go fish.
~drawCardPlayer()
~AnnieRage++
*[next]-> turn5robot

==turn4playerxenotrue==
~loadScene("turn4playerxenotrue")
XENOPHAGE: Dang, you’re good!
~moveCard("xeno","player",card)
~XenoRage++
*[next]-> turn5robot
==turn4playerxenofalse==
~loadScene("turn4playerxenofalse")
XENOPHAGE: ‘Fraid not, go fish.
~XenoRage++
~drawCardPlayer()
*[next]-> turn5robot

//--------------------turn 5-----------------------------
==turn5robot==
~loadScene("turn5robot")
~drawCardAll()
~card = randomCardType()
ROBOT: Aniline, do you have any-
ANNIE: Sorry I have to go pee like so bad.
*[next]->turn5robot2
==turn5robot2==
ROBOT: Alright, xenophage. Do you have any {card}s?
{
    - checkCard("xeno",card) == true:
        -> turn5robotxenotrue
    - else:
        -> turn5robotxenofalse
} 
==turn5robotxenotrue==
~loadScene("turn5robotxenotrue")
XENOPHAGE: *sigh* 
XENOPHAGE: You’re welcome, Annie. Here.
~moveCard("xeno","robot",card)
*[next]-> turn5annie
==turn5robotxenofalse==
~loadScene("turn5robotxenofalse")
XENOPHAGE: Nope, should’ve waited on Annie.
XENOPHAGE: Go fish. 
~drawCard("robot")
*[next]-> turn5annie

==turn5annie==
~loadScene("turn5annie")
~card = randomCardType()
ANNIE: Hi guys, I'm back.
ANNIE: Human, do you have Gooeddoby? 
ANNIE: You know. The talking card.
ANNIE: To be clear, that’s not my turn. I don’t want that shit.
ANNIE: I’m just wondering.
ANNIE: Robot, any {card}s?
{
    - checkCard("robot",card) == true:
        -> turn5annierobottrue
    - else:
        -> turn5annierobotfalse
} 
==turn5annierobottrue==
~loadScene("turn5annierobottrue")
ROBOT: Here.
~moveCard("robot","annie",card)
*[next]->turn5xeno
==turn5annierobotfalse==
~loadScene("turn5annierobotfalse")
ROBOT: As if! Go fish.
~drawCard("annie")
->turn5xeno

==turn5xeno==
~loadScene("turn5xeno")
XENOPHAGE: Annie, do you have that weird talking card? I like that one.
ROBOT: We literally just learned that the human possesses Gooeddoby.
XENOPHAGE: In that case-
ANNIE: That was your turn. Go fish.
XENOPHAGE: ...
ROBOT: damn.
*[next]->turn5player

//-----------turn 5 (player)-------------
==turn5player==
//TALKING CARD: Did you know that if you lined up every Pbouxhkiir card ever made…
//TALKING CARD: …they would be the length of a school bus?
~choiceMode = "card"
~loadScene("turn5player")
*[ROBOT (correct)]->turn5playerrobot
*[ROBOT (incorrect)]->turn5playerrobot
*[ANNIE (correct)]->turn5playerannie
*[ANNIE (incorrect)]->turn5playerannie
*[XENOPHAGE (correct)]->turn5playerxeno
*[XENOPHAGE (incorrect)]->turn5playerxeno
==turn5playerrobot==
~loadScene("turn5playerrobot")
ROBOT: You want *that* card? How about I give you something better.
ROBOT: Thank me later.
~giveCardPlayer("AI1")
~RobotRage++
*[next]->turn6robot
==turn5playerannie==
~loadScene("turn5playerannie")
ANNIE: UGH, fine. Here you go
ROBOT: And here, I throw myself in front of a metaphorical laser bullet for you.
ANNIE: What?
ROBOT: I’ll give the human a card instead. You’re welcome.
~giveCardPlayer("AI1")
~AnnieRage++
*[next]->turn6robot
==turn5playerxeno==
~loadScene("turn5playerxeno")
XENOPHAGE: A fascinating guess, although
ROBOT: Don’t worry. I have a card that I shall give in your stead.
XENOPHAGE: You really don’t have to do that
ROBOT: Don’t worry a single segment of your very long body, my friend.
~giveCardPlayer("AI1")
~XenoRage++
*[next]->turn6robot

//--------------------turn 6-----------------------------
==turn6robot==
~loadScene("turn6robot")
~drawCardAll()
~card = randomCardType()
ROBOT: Aniline, are you going to have to use the restroom again?
ANNIE: Weird thing to ask somebody, dude.
ROBOT: I- you- give me your {card}! Do you have any {card}s?!
{
    - checkCard("annie",card) == true:
        ->turn6robotannietrue
    - else:
        ->turn6robotanniefalse
} 
==turn6robotannietrue==
~loadScene("turn6robotannietrue")
ANNIE: Damn, should’ve stayed in the bathroom longer.
ANNIE: Here you goooo.
~moveCard("robot","annie",card)
*[next]->turn6annie
==turn6robotanniefalse==
~loadScene("turn6robotanniefalse")
ANNIE: Sure don’t!
ANNIE: Go fish, idiot!
~drawCard("robot")
*[next]->turn6annie

==turn6annie==
~loadScene("turn6annie")
ANNIE: Do you have any rayes?
ROBOT: Ah, you want me to give you a card? I will happily oblige.
ANNIE: ...
ANNIE: This isn’t the card I asked for.
ROBOT: Ah, yes. That’s one of the cards I designed using generative AI.
*[next]->turn6anniecont
==turn6anniecont==
~loadScene("turn6anniecont")
//annie holds up card
ANNIE: What the hell is this. Is everybody seeing this?
ANNIE: Everybody help me make fun of it NOW.
ROBOT: They will do no such thing! 
*[next]->turn6anniechoice
==turn6anniechoice==
~choiceMode = "dialogue"
~loadScene("")
*[It sucks.]->turn6annietrue 
*[It’s really good, actually.]->turn6anniefalse 
==turn6annietrue==
~loadScene("turn6annietrue")
ANNIE: Yeah it sucks ass dude
XENO: If you give me one of those I’m going to eat it.
ROBOT: Fiiiiine! Jeeeeez!
*[next]-> turn6xeno
==turn6anniefalse==
~loadScene("turn6anniefalse")
ANNIE: What? No, it sucks ass dude. 
XENOPHAGE: Human, don't encourage her.
ANNIE: Are you getting space madness already?
XENO: Robot, if you give me one of these I’m going to eat it.
ROBOT: Fiiiiine! Jeeeeez!
*[next]-> turn6xeno

==turn6xeno==
~loadScene("turn6xeno")
~card = randomCardType()
XENOPHAGE: Annie, do you have a
ROBOT: Do you want to ask me for a card?
ROBOT: You can do that, you know.
ROBOT: Wait a minute. Have you ever...
XENOPHAGE: Annie, do you have a {card}?
{
    - checkCard("annie",card) == true:
        ->turn6xenoannietrue
    - else:
        ->turn6xenoanniefalse
} 
==turn6xenoannietrue==
~loadScene("turn6xenoannietrue")
ANNIE: Here you go!
XENOPHAGE: Do NOT give me that AI-generated slop.
ANNIE: Alright, you got me.
~moveCard("annie","xeno",card)
*[next]->turn6player
==turn6xenoanniefalse==
~loadScene("turn6xenoanniefalse")
ANNIE: Nope! Fish your oversized heart out.
~drawCard("annie")
->turn6player

//-----------turn 6 (player)-------------
==turn6player==
//TALKING CARD: Player!
//TALKING CARD: Roll me up and use me as a drinking straw!
~choiceMode = "card"
~loadScene("turn6player")
*[ROBOT (correct)]->turn6playerrobot
*[ROBOT (incorrect)]->turn6playerrobot
*[ANNIE (correct)]->turn6playerannietrue
*[ANNIE (incorrect)]->turn6playeranniefalse
*[XENOPHAGE (correct)]->turn6playerxenotrue
*[XENOPHAGE (incorrect)]->turn6playerxenofalse
==turn6playerrobot==
~loadScene("turn6playerrobot")
ROBOT: Ah, I see you want another one of my special cards.
ROBOT: Here you go.
~giveCardPlayer("AI2")
~RobotRage++
*[next]->turn7robot
==turn6playerannietrue==
~loadScene("turn6playerannietrue")
ANNIE: You can have my {card}. But you’ll never have a girlfriend.
~moveCard("annie","player",card)
~AnnieRage++
*[next]->turn7robot
==turn6playeranniefalse==
~loadScene("turn6playeranniefalse")
ANNIE: Do I have any *wheeze* hahahaaaaa man. Do I have any {card}s.
ANNIE: Fuck yourself.
~drawCardPlayer()
~AnnieRage++
*[next]->turn7robot
==turn6playerxenotrue==
~loadScene("turn6playerxenotrue")
XENOPHAGE: What’s mine is yours.
~moveCard("xeno","player",card)
~XenoRage++
*[next]->turn7robot
==turn6playerxenofalse==
~loadScene("turn6playerxenofalse")
XENOPHAGE: Got none. Hook, line, and go fish.
~drawCardPlayer()
~XenoRage++
*[next]->turn7robot

//--------------------turn 7-----------------------------
==turn7robot==
~loadScene("turn7robot")
~drawCardAll()
ROBOT: Aniline.
ANNIE: 3b42dd00-903a-47b8-87b8-47e0-4447-fcf1-2bed-a6a4-dcf3-484c-9f5420547c893ba1.
ROBOT: Give me my AI card back, you don’t deserve it.
ANNIE: Thank God.
*[next]->turn7annie

==turn7annie==
~loadScene("turn7annie")
~card = randomCardType()
ANNIE: Robot...
ANNIE: Wait, no. Xenophage, give me your {card}.
{
    - checkCard("xeno",card) == true:
        ->turn7anniexenotrue
    - else:
        ->turn7anniexenofalse
} 
==turn7anniexenotrue==
~loadScene("turn7anniexenofalse")
XENOPHAGE: Only if you say please.
ANNIE: Please?
XENOPHAGE: See, that wasn’t so hard.
ANNIE: …
~moveCard("xeno","annie",card)
*[next]->turn7xeno
==turn7anniexenofalse==
~loadScene("turn7anniexenofalse")
XENOPHAGE: Can’t give what I don’t have.
ANNIE: You can just say “go fish.” Just say “go fish.”
~drawCard("annie")
*[next]->turn7xeno

==turn7xeno==
~loadScene("turn7xeno")
~card = randomCardType()
XENOPHAGE: Hey Annie, do you have any {card}s?
ANNIE: Hey xenophage, do you have a problem?
XENOPHAGE: Annie...
{
    - checkCard("annie",card) == true:
        ->turn7xenoannietrue
    - else:
        ->turn7xenoanniefalse
} 
==turn7xenoannietrue==
~loadScene("turn7xenoannietrue")
ANNIE: Yes, YES I have it.
~moveCard("annie","xeno",card)
*[next]-> turn7player
==turn7xenoanniefalse==
~loadScene("turn7xenoanniefalse")
ANNIE: As if! As IF I would have one.
XENOPHAGE: Alright, I’ll go fish. Yeesh.
~drawCard("annie")
*[next]-> turn7player


//-----------turn 7 (player)-------------
==turn7player==
//talking card is wet
//TALKING CARD: I’m wet now!
~choiceMode = "card"
~loadScene("turn7player")
*[ROBOT (correct)]->turn7playerrobot
*[ROBOT (incorrect)]->turn7playerrobot
*[ANNIE (correct)]->turn7playerannietrue
*[ANNIE (incorrect)]->turn7playeranniefalse
*[XENOPHAGE (correct)]->turn7playerxenotrue
*[XENOPHAGE (incorrect)]->turn7playerxenofalse
==turn7playerrobot==
~loadScene("turn7playerrobot")
ROBOT: You want another one of my special cards?
ROBOT: A fellow good taste haver, I see.
~giveCardPlayer("AI3")
~RobotRage++
*[next]->turn8robot
==turn7playerannietrue==
~loadScene("turn7playerannietrue")
ANNIE: Yeah, here.
ANNIE: Wow, really happy about that, huh?
ANNIE: It’s just a game. It’s just a game, dude.
ANNIE: It’s sad that you care this much.
~moveCard("annie","player",card)
~AnnieRage++
*[next]->turn8robot
==turn7playeranniefalse==
~loadScene("turn7playeranniefalse")
ANNIE: Do you have any uh, do you have any, like, brain cells? Go fish. Asshole.
~drawCardPlayer()
~AnnieRage++
*[next]->turn8robot
==turn7playerxenotrue==
~loadScene("turn7playerxenotrue")
XENOPHAGE: Dang, I was one away from matching 10.
~moveCard("xeno","player",card)
~XenoRage++
*[next]->turn8robot
==turn7playerxenofalse==
~loadScene("turn7playerxenofalse")
XENOPHAGE: Go forth and fish.
~drawCardPlayer()
~XenoRage++
*[next]->turn8robot


//--------------------turn 8-----------------------------
==turn8robot==
~loadScene("turn8robot")
~drawCardAll()
ROBOT: You know what, I don’t know why you people don’t like my cards.
ANNIE: They’re ass! It’s because they’re ass!
ROBOT: They are not ass!
*[next]->turn8robotcont
==turn8robotcont==
~loadScene("turn8robotcont")
XENOPHAGE: I don’t get what’s with you and UI in the first place.
ROBOT: It’s called AI, and you wouldn’t understand! It’s a BUTCH thing!
XENOPHAGE: Then I would understand!
ANNIE: Yeah we should all be on the same page.
ROBOT: As if! Do either of your species even have butchi?
*[next]->turn8robotchoice
==turn8robotchoice==
~choiceMode = "dialogue"
~loadScene("turn8robotchoice")
*[Mine does.]->turn8robotcont2
*[We don’t? I wish we did.]->turn8robotcont2
==turn8robotcont2==
~loadScene("turn8robotcont2")
ROBOT: No one asked you! 
ANNIE: We do have butches! We a hundred percent do!
ROBOT: Yeah, well then, what does BUTCH stand for?
ANNIE: The fuck? 
XENOPHAGE: It doesn’t stand for anything!
ROBOT: Wrong! Binary Unconformed Terabyte
ANNIE: We’re skipping your turn!
*[next]->turn8annie

==turn8annie==
~loadScene("turn8annie")
~card = randomCardType()
ANNIE: Okay, human, give me your goddamn {card}.
ANNIE: If you give me some shitty card you’re gonna die right here right now.
{
    - checkCard("annie",card) == true:
        ->turn8annieplayertrue
    - else:
        ->turn8annieplayerfalse
} 
==turn8annieplayertrue==
~loadScene("turn8annieplayertrue")
ANNIE: YES! A light! A light in the darkness!
~moveCard("player","annie",card)
*[next]->turn8xeno
==turn8annieplayerfalse==
~loadScene("turn8annieplayerfalse")
ANNIE: God freaking dammit.
~drawCard("annie")
*[next]->turn8xeno

==turn8xeno==
~loadScene("turn8xeno")
XENOPHAGE: Robot, you understand everybody else in this room is also butch, right?
ANNIE: Are you finally asking somebody else for a card?
XENOPHAGE: What are you talking about?
XENOPHAGE: Anyways, Annie, do you have any uteruses?
*[next]->turn8xenocont
==turn8xenocont==
ANNIE: YOU! YOU! YOU! YOU! YOU!
XENOPHAGE: Anyways, it’s the human’s turn!
{
    - RobotRage>3:
        * -> endingrobot
    - AnnieRage>3:
        * -> endingannie
    - XenoRage==7:
        * -> endingxeno
    - else:
        * -> endingneutral
} 
    

//--------------------neutral ending-----------------------------
==endingneutral==
~musicStop()
~ending = "neutral"
~loadScene("endingneutral")
ANNIE: Like hell it is. You’ve been targeting me all night, and pissing me off.
~musicPlay("song2")
ANNIE: So, I’m going to blow up this space station with everybody on it.
XENOPHAGE: That’s so like you.
ROBOT: Now, let’s hold on a parsec-
ANNIE: Sayonara, shitheads.
*[next]->endingneutral2

==endingneutral2==
~loadScene("endingneutral2")
YOU WON!!!!!!!!

Aniline destroyed the space station, killing you and everyone else aboard. The CHAGTAD® Demolition Company was sued by a certain xenophage’s large and litigious family, who received eighty-three quintillion CHAGbucks™ in compensation. Now bankrupt, CHAGTAD® was unable to demolish the Earth, and the larger galaxy soon forgot about the little blue planet.

*[next]-> END

//--------------------robot ending-----------------------------
==endingrobot==
~ending = "robot"
~loadScene("endingrobot")
ROBOT: Speaking of the human, I think I’ve been treated rather unfairly tonight.
ROBOT: It’s statistically unlikely for the human to ask me for as many cards as they have.
ROBOT: And I know it’s not because it loves my cards, because all of you have been making fun of them.
*[next]->endingrobot2
==endingrobot2==
~loadScene("endingrobot2")
XENOPHAGE: The human is probably targeting you because they’re from Earth. 
ANNIE: Yeah, and you said you hate Earth. And that you’re gonna blow it up.
ROBOT: Preposterous! Humans aren’t even FROM Earth. This is personal! And I intend to settle it personally!
*[next]->endingrobot3
==endingrobot3==
~loadScene("endingrobot3")
XENOPHAGE: It’s just Pbouxhkiir. You’re getting awfully heated about Pbouxhkiir, huh?
~musicStop()
ANNIE: Grown ass robot.
ROBOT: If you don’t shut up, I will- I’ll pbouxhke you in the eyes! With my fingers!
ANNIE: Eyes? Eyes!?
//green text
ANNIE: >Sees somebody’s faculae
ANNIE: >“Eyes”
*[next]->endingrobot4
==endingrobot4==
~loadScene("endingrobot4")
~musicPlay("song2")
ROBOT: SHUT UP. SHUT UP. SHUT UP. SHUT UP.
ROBOT: I’m blowing up the Earth NOW.
XENOPHAGE: You haven’t even won!
ROBOT: NOW.
*[next]->endingrobot5

==endingrobot5==
~loadScene("endingrobot5")
YOU LOST!!!!!!!!
After winning(?) the Pbouxhkiir match, 3b42dd00-903a-47b8-87b8-47e0-4447-fcf1-2bed-a6a4-dcf3-484c-9f5420547c893ba1 repeatedly hit the detonate button for thirty minutes, destroying the Earth thousands of times.
There is no planet for you to return to, but inexplicably, Annie let you crash at her place. The two of you probably went all kinds of zany adventures, which might sound cool, but don’t kid yourself here, you absolutely lost.

*[next]-> END


//--------------------annie ending-----------------------------
==endingannie==
~ending = "annie"
~loadScene("endingannie")
ANNIE: Wait a minute! The human’s doing it too!
XENOPHAGE: Yeah, yeah they have. That’s crazy.
~musicStop()
ANNIE: Shut the fuck up! Both of you! What are you, girlfriends? What are you, KISSING?
XENOPHAGE: We’re just friends. You’re making this really awkward for us.
ANNIE: Lies! You’re both kissing AND trying to take all my sweet sweet cards!
*[next]->endingannie2
==endingannie2==
~loadScene("endingannie")
~musicPlay("song2")
ANNIE: So you know what? If I don’t get to have cards, you don’t get to have uncooked flesh!
XENOPHAGE: Let’s uh, let's all settle down.
ROBOT: Yes, we're all here to blow up the Earth, so-
ANNIE: Give me that detonator. Click! There we go!
ANNIE: Earth gone! No more Earth! And now, no more casino!
*[next]->endingannie3
==endingannie3==
~loadScene("endingannie3")
YOU LOST!!!!!!!!
In an impressive display of bad sportsmanstarship, Aniline prematurely destroyed the Earth. 2.37 seconds later, she destroyed the Primox Alpha (the CHAGTAD® Company Casino ship), killing you and everyone else aboard. But for those 2.37 seconds, you were the last surviving Earthling. No Earthling had ever been as alone as you were for those 2.37 seconds. Every person you had ever known and every place you had ever seen, all gone, with your memory as the single testament to their existence. There is no word for the emotion such a person would feel. On the bright side, there was very little time for you to realize how very, very, VERY sad you should have felt about the whole thing.
*[next]-> END

//--------------------xeno ending-----------------------------
==endingxeno==
~ending = "xeno"
~loadScene("endingxeno")
XENOPHAGE: Actually, scratch that thought.
XENOPHAGE: Have either of you noticed that the human has targeted me every.
XENOPHAGE: Single.
XENOPHAGE: Turn?
XENOPHAGE: I came here to have a fun time, but if you’re going to play dirty, then none of you get to be happy either.
*[next]->endingxeno2
==endingxeno2==
~loadScene("endingxeno2")
XENOPHAGE: I hate the taste of human flesh, but my larvae are getting hungry.
XENOPHAGE: And let me tell you, I will feed them something much better at a later date.
XENOPHAGE: After I’m done here.
*[next]->endingxeno3
==endingxeno3==
~musicStop()
~loadScene("endingxeno3")
//screen goes black
ROBOT: Dear lord, those are the human’s fingers.
ANNIE: Damn, its coronal loops too.
ROBOT: Those are called “intestines”, you dolt.
ANNIE: EWWWWWWWW.
ANNIE: She’s regurgitating it into her larvae’s mouths.
*[next]->endingxeno4
==endingxeno4==
~musicPlay("song2")
~loadScene("endingxeno4")
ROBOT: What? All organic lifeforms do that.
ANNIE: Quick, blow up the Earth while they’re both distracted.
ROBOT: Agreed. Blowing it up on 1…
ANNIE: Two!
ROBOT: Now.
*[next]->endingxeno5

==endingxeno5==
~loadScene("endingxeno5")
YOU LOST!!!!!!!!
While you were busy being torn to pieces, chewed, then regurgitated into the awaiting mandibles of autoparoxymorphic paralarvae, Aniline and 3b42dd00-903a-47b8-87b8-47e0-4447-fcf1-2bed-a6a4-dcf3-484c-9f5420547c893ba1 both pressed the detonation button simultaneously. The Earth was destroyed, of course, but at least you weren’t around to see it.
*[next]-> END

