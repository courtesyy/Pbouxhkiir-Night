/*Function reference
drawCard(char)
moveCard(from,to,card)
drawCardAll() #all 4 players do drawCard()
randomCardType() 
var card #used to store a given turn's card choice
*/

==start==

Cool Pbouxhkiir game

Get a large amount of the same type of cards to win.

THE GRAND PRIZE: 2 million and 130 thousand credits, and the honor of blowing up the Earth.
*[begin]->turn1robot

//--------------------turn 1-----------------------------
==turn1robot==
ROBOT: Annie, do you have any worms?
ANNIE: No, I DON’T. Amateur mistake. Go fish.
ROBOT: …
//drawCard(robot)
*[next]->turn1annie

==turn1annie==
ANNIE: Alright, now it’s my turn. 
ANNIE: You have (card), I can feel it.
ROBOT: I don’t. 
ANNIE: Well, you’ll have one later.
ROBOT: Sure.
ANNIE: You can’t not have one forever.
//drawCard(annie)
*[next]->turn1xeno

==turn1xeno==
XENOPHAGE: Ok, um, Annie, do you have any atoms?
ANNIE: Yeahhh. Yeah I sure do. [pissed]
XENOPHAGE: Thaaank you.
//moveCard(annie,xeno,atom)
*[next]->turn1player

//-----------turn 1 (player)-------------
==turn1player==
Choose one player to ask for a card.
*[ROBOT (correct)] ->turn1playerrobottrue
*[ROBOT (incorrect)] ->turn1playerrobotfalse
*[ANNIE (correct)] ->turn1playerannietrue
*[ANNIE (incorrect)] ->turn1playeranniefalse
*[XENOPHAGE (correct)] ->turn1playerxenotrue
*[XENOPHAGE (incorrect)] ->turn1playerxenofalse
//---turn 1 player responses---
==turn1playerrobottrue==
ROBOT: Do I look like I’m made of (cards)?
ROBOT: Because I’m not. That wouldn’t be logical.
ROBOT: …FINE. HERE YOU GO.
//moveCard(robot,player,card)
*[next] -> turn2robot
==turn1playerrobotfalse==
ROBOT: Your logic circuits must be failing, because I do not.
//drawCard(player)
*[next] -> turn2robot

==turn1playerannietrue==
ANNIE: God freaking dang it. Whatever, here you go
//moveCard(annie,player,card)
*[next] -> turn2robot
==turn1playeranniefalse
ANNIE: I knew you’d say that. No, go fish.
//drawCard(player)
*[next] -> turn2robot

==turn1playerxenotrue==
XENOPHAGE: Awwwww dang. Yeah, here you go.
//moveCard(xeno,player,card)
*[next] -> turn2robot
==turn1playerxenofalse==
XENOPHAGE: Nope, sorry. Go fish!
//drawCard(player)
*[next] -> turn2robot

//--------------------turn 2-----------------------------
//drawCardAll()
==turn2robot==
//card = randomcardtype()
ROBOT: I’ve put all of your dialogue into an AI text generator… 
XENOPHAGE: Ah Christ, here we go again.
ROBOT: It told me in your voice that you have a (card). Anyways, like I’ve been telling you, AI is creating trillions of new jobs…
*[Has it]->turn2robotxenotrue
*[Doesn't]->turn2robotxenofalse
==turn2robotxenotrue==
XENOPHAGE: Here’s the card. Just stop talking.
//moveCard(xeno,robot,card)
*[next] -> turn2annie
==turn2robotxenofalse==
XENOPHAGE: I don’t have it. Stop talking.
//drawCard(robot)
*[next] -> turn2annie

==turn2annie==
ANNIE: Let’s talk about something else. Like that lovely uterus card you have there.
XENOPHAGE: Woah woah woah woooooooah.
ROBOT: What the robot hell are you talking about.
ANNIE: This one! The uterus one!
XENOPHAGE: Buddy, that’s a spaceship
ROBOT: Yes, it’s- wait no, that’s a raygun.
ANNIE: Humans love to incorporate their reproductive biology into iconography.
ROBOT: Human, is this true?
*Yeah…
-> turn2annieuterustrue
*Humans actually don’t have uteruses. Uterusi?
->turn2annieuterusfalse
==turn2annieuterustrue==
ANNIE: See? See?
XENOPHAGE: Well, I’ll be damned.
*[next]->turn2anniecont
==turn2annieuterusfalse==
ROBOT: We’re playing with a Xentrati-style deck. Obviously, it’s a Xentrati uterus.
*[next]->turn2anniecont
==turn2anniecont==
ANNIE: Whatever, do you have the card or not?
*[Has it]->turn2annieplayertrue
*[Doesn't]->turn2annieplayerfalse
==turn2annieplayertrue==
ANNIE: Cool, thanks. 
//moveCard(player,annie,ship)
*[next]->turn2xeno
==turn2annieplayerfalse==
ANNIE: God damn it. 
//drawCard(annie)
*[next]->turn2xeno

==turn2xeno==
XENOPHAGE: Anyways, Annie, do you have any Worms?
*[has it]->turn2xenoannietrue
*[doesn't]->turn2xenoanniefalse
==turn2xenoannietrue==
ANNIE: Ughhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
XENOPHAGE: Jeez, sorry.
//moveCard(annie,xeno,worm)
*[next]->turn2player
==turn2xenoanniefalse==
ANNIE: I knew you’d ask. 
XENOPHAGE: So do you have it, or-
ANNIE: No, go fish.
//drawCard(xeno)
*[next]->turn2player

//-----------turn 2 (player)-------------
==turn2player==
Choose one player to ask for a card.
*[ROBOT (correct)] ->turn2playerrobottrue
*[ROBOT (incorrect)] ->turn2playerrobotfalse
*[ANNIE (correct)] ->turn2playerannietrue
*[ANNIE (incorrect)] ->turn2playeranniefalse
*[XENOPHAGE (correct)] ->turn2playerxenotrue
*[XENOPHAGE (incorrect)] ->turn2playerxenofalse
//---turn 2 player responses---
==turn2playerrobottrue==
ROBOT: You have a sharp mind, human. Take it and go.
//moveCard(robot,player,card)
*[next] -> turn3robot
==turn2playerrobotfalse==
ROBOT: A total misplay. Go fish.
//drawCard(player)
*[next] -> turn3robot

==turn2playerannietrue==
ANNIE: Take it and leave.
//moveCard(annie,player,card)
*[next] -> turn3robot
==turn2playeranniefalse==
ANNIE: All that gross shit in your skull, and you aren’t using any of it. I don’t.
//drawCard(player)
*[next] -> turn3robot

==turn2playerxenotrue==
XENOPHAGE: Yup, here you go.
//moveCard(xeno,player,card)
*[next] -> turn3robot
==turn2playerxenofalse==
XENOPHAGE: Nope. Get your net.
//drawCard(player)
*[next] -> turn3robot

//--------------------turn 2-----------------------------
//drawCardAll()
==turn3robot==
ROBOT: Xenophage, do you have any worms?
*[has it]->turn3robotxenotrue
*[doesn't]->turn3robotxenofalse
==turn3robotxenotrue==
XENOPHAGE: Ah, you got me.
ROBOT: All according to plan.
//moveCard(xeno,robot,worm)
*[next]->turn3annie
==turn3robotxenofalse==
XENOPHAGE: Sorry, no dice. Go fish.
ROBOT: Whatever.
//drawCard(robot)
*[next]->turn3annie

==turn3annie==
ANNIE: Ok Computer, do you have any uterusi?
ROBOT: I’m a robot.
ANNIE: I swear to God- rayguns, do you have any rayguns?
*[has it]->turn3annierobottrue
*[doesn't]->turn3annierobotfalse
==turn3annierobottrue==
ROBOT: In that case, yes, and here you go.
//moveCard(robot,annie,ship)
*[next]->turn3xeno
==turn3annierobotfalse==
ROBOT: My answer remains “no.”
//drawCard(annie)
*[next]->turn3xeno

==turn3xeno==
XENOPHAGE: Annie, do you have any worms?
*[has it]->turn3xenoannietrue
*[doesn't]->turn3xenoanniefalse
==turn3xenoannietrue==
ANNIE: Wow that’s crazy! I do!! [manic expression]
XENOPHAGE: Ok, well, I’ll take them.
ANNIE: Sounds great!!!!!!!!!!
//moveCard(annie,xeno,worm)
*[next]->turn3player
==turn3xenoanniefalse==
ANNIE: I still don’t have any worms.
XENOPHAGE: Okaaay, I’ll go fish.
//drawCard(xeno)
*[next]->turn3player

//-----------turn 3 (player)-------------
==turn3player==
Choose one player to ask for a card.
*[ROBOT (correct)] ->turn3playerrobottrue
*[ROBOT (incorrect)] ->turn3playerrobotfalse
*[ANNIE (correct)] ->turn3playerannietrue
*[ANNIE (incorrect)] ->turn3playeranniefalse
*[XENOPHAGE (correct)] ->turn3playerxenotrue
*[XENOPHAGE (incorrect)] ->turn3playerxenofalse
//---turn 3 player responses---
==turn3playerrobottrue==
ROBOT: Here, take it.
//moveCard(robot,player,card)
*[next] -> turn3playercont
==turn3playerrobotfalse==
ROBOT: What an absurd question. Of course I don’t, go fish.
//drawCard(player)
*[next] -> turn3playercont

==turn3playerannietrue==
ANNIE: Take it and get out of here.
//moveCard(annie,player,card)
*[next] -> turn3playercont
==turn3playeranniefalse==
ANNIE: Do I have any *wheeze* hahahaaaaa man. Do I have any (card)s. Fuck yourself.
//drawCard(player)
*[next] -> turn3playercont

==turn3playerxenotrue==
XENOPHAGE: Sadly, I do.
//moveCard(xeno,player,card)
*[next] -> turn3playercont
==turn3playerxenofalse==
XENOPHAGE: Nada. Fish time.
//drawCard(player)
*[next] -> turn3playercont

==turn3playercont==
//card in your hand turns into talking card	
TALKING CARD: Player! You are chosen, and thus I have revealed myself to you! Heed my words: keep your eyes open, and the best player can be read like a holo-book.
*[next] -> turn4robot

//--------------------turn 4-----------------------------
//drawCardAll()
==turn4robot==
ROBOT: I used the AI again, and it told me your opinion on undocumented migrant farmworkers.
ROBOT: I’m surprised that you’re advocating we do that.
XENOPHAGE: Card. What card do you want.
ROBOT: (card).
*[has it]->turn4robotxenotrue
*[doesn't]->turn4robotxenofalse
==turn4robotxenotrue==
XENOPHAGE: Here.
//moveCard(xeno,robot,card)
*[next] -> turn4annie
==turn4robotxenofalse==
XENOPHAGE: Go fish.
//drawCard(robot)
*[next] -> turn4annie

==turn4annie==
ANNIE: Hey human, you got any (card)s?
*[has it]->turn4annieplayertrue
*[doesn't]->turn4annieplayerfalse
==turn4annieplayertrue==
ANNIE: Heh, better play harder if you want that prize money. And the honor of blowing up that sweet, sweet planet.
//moveCard(player,annie,card)
*[next] -> turn4anniecont
==turn4annieplayerfalse==
ANNIE: Crap. Guess you really want that prize money, huh? Oh, or you want to blow up that planet? Me too buddy, me too.
//drawCard(annie)
*[next] -> turn4anniecont
==turn4anniecont==
XENOPHAGE: Annie, that’s why you’re in this? To blow up the Earth?
ANNIE: I mean, money is cool also. Both of the prizes appeal to me.
ROBOT: Well, *I* hate the Earth.
ANNIE: Yeah, you tell ‘em.
XENOPHAGE: Wait, what’s wrong with Earth? I’ve never been.
ROBOT: According to my logic circuits, humans are the stupidest, dumbest, dustiest life forms, and they (reddit forum argument that they clearly lost)
XENOPHAGE: I’m uh. I’m sorry for bringing it up.
*[next] -> turn4xeno 

==turn4xeno==
XENOPHAGE: Hey Annie, have any (card)s?
*[has it]->turn4xenoannietrue
*[doesn't]->turn4xenoanniefalse
==turn4xenoannietrue==
ANNIE: Hey Annie, do you have a problem?
XENOPHAGE: Annie…
ANNIE: Yes, YES I have (card). 
//moveCard(annie,xeno,card)
*[next] -> turn4player
==turn4xenoanniefalse==
ANNIE: As if! As IF I would have (card).
XENOPHAGE: Alright, I’ll go fish.
//drawCard(annie)
*[next] -> turn4player

//-----------turn 4 (player)-------------
==turn4player==
TALKING CARD: Your next decision will be quite the unwise one! Hee hoo!
*[ROBOT (correct)] ->turn4playerrobottrue
*[ROBOT (incorrect)] ->turn4playerrobotfalse
*[ANNIE (correct)] ->turn4playerannietrue
*[ANNIE (incorrect)] ->turn4playeranniefalse
*[XENOPHAGE (correct)] ->turn4playerxenotrue
*[XENOPHAGE (incorrect)] ->turn4playerxenofalse
//---turn 4 player responses---
==turn4playerrobottrue==
ROBOT: What an astute mind! Yes, yes I do.
//moveCard(robot,player,card)
*[next] -> turn5robot
==turn4playerrobotfalse==
ROBOT: No, I don’t. See, this is why AI will replace most jobs within the next 10 years.
XENOPHAGE: You said it wasn’t gonna do that.
ROBOT: No, I said it’d make new jobs. You can’t have new jobs without eliminating old jobs. The job market wouldn’t fit all of them.
XENOPHAGE: I hope your job goes first.
//drawCard(player)
*[next] -> turn5robot

==turn4playerannietrue==
ANNIE: Yeah, here.
ANNIE: Wow, really happy about that huh? It’s just a game. It’s just a game, dude. It’s sad that you care this much.
//moveCard(annie,player,card)
*[next] -> turn5robot
==turn4playeranniefalse==
ANNIE: No, but I do have go fish.
//drawCard(player)
*[next] -> turn5robot

==turn4playerxenotrue==
XENOPHAGE: Dang, you’re good!
//moveCard(xeno,player,card)
*[next] -> turn5robot
==turn4playerxenofalse==
XENOPHAGE: ‘Fraid not, go fish.
//drawCard(player)
*[next] -> turn5robot

//--------------------turn 5-----------------------------
//drawCardAll()
==turn5robot==


    -> END
