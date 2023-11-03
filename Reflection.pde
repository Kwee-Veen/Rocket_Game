/* Reflection

Name:             Caoimhín Arnott 
Student Number:   20104296

Link to your development Blog on Blogger:                
    https://ca-devdev.blogspot.com/2023/03/post1.html
    https://ca-devdev.blogspot.com/2023/03/post-2.html
    https://ca-devdev.blogspot.com/2023/03/post-3.html
    https://ca-devdev.blogspot.com/2023/03/post-4.html
    https://ca-devdev.blogspot.com/2023/03/post-5.html

Link to Video on YouTube:
  https://www.youtube.com/watch?v=pHWk8PaHwHA

Jargon note: when stating line numbers, the class where that line can be found is denoted using 
  e.g., game.line for a line in the game class.  

Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme              (1)
- Reflection          (4)
- Video               (4)
- Blog                (2)

These are all created to spec, so I am awarding myself 11 marks


Part B - Mark (4 /4)
-----------------------------

- Comments, 
- Indentation, 
- Naming, 
- Structure of code.

4/4


Part C - Mark (4 /5)
-----------------------------

* if statements

projectile.line 25: Checks if the projectile's posX & posY fields have passed outside the permitted bounds, and if so, setting projectile.collided to true.
game.line 170: if the 'player' missile has collided, increments the game.timer variable by 1 per frame.
game.line 72: Runs a specific method depending on the value of game.gameSequence. 
  Has three alternate else if branches.
  
* Nested if statements

rock.line 29: Ensures that the contents of the rock.run() method only execute if the rock's broken field is false.
  Has three nested if statements on rock.lines 36, 41 and 48, which check for missile, projectile and laser collisions
powerup.line 30: Ensures that the contents of the powerup.run() method only execute if the powerup hasn't been used.
  Has a nested if statement that sets the powerup to used if the 'player' missile has made contact with it.
  
* Loops

FOR loops used on:
game.line 40 to reset every index of 4 different arrays based on their length.
  Uses a nested if statement.
game.line 95 to establish the location of each powerup object in the powerup array.
  Uses a nested if statement.

DO While loops use on:
game.line 58 to run all the powerup object run() methods
game.line 61 to do the same for all the gold object run() methods 

WHILE loops used on:
game.line 124 to establish the posX and posY fields for every index of the gold object array.
game.line 107 to establish the posX and posY fields for every index of the rock object array.
  Uses a nested if statement & object.length as the loop control variable


I have numerous examples of complex if statements, nested if statements, do while, while and for loops. 
No nested loop examples though, so 4/5 in total

Part D1 - Mark (10 /10)
-----------------------------

My game demonstrates: 
  both collision detection & blast radius detection (for gold objects). 
  scoring (working & overlaid). 
  lives & game resets correctly to play a new game.
  1280*720 display without bars.
  fires two different types of object
  PImage & a complementary adobe-generated colour scheme for improved graphics
  a highly detailed full score breakdown on gameover.
  ability to change the difficulty by modifying the number of obstacle rocks onscreen
  
Therefore I score 10/10

Part D2 - Mark (8 /10)
-----------------------------

missile.line 58 & 60: handle key input only while the updatePlayer() method is running:
- up[w]
- down[x]
- It also handles the cursor keys to navigate up or down

main program line 29: key handler set up that responds to [space] to initiate the game during the game.preGame() stage of the game.
  Note: key handling is set here intentionally, as it is the only location that can register input while the draw() method loop has been stopped by noLoop() - see game.line 154  

Additional keys include
- game.line 166: [space] to fire a laser to break rocks while the game is running
- game.line 255: [space] to restart the game after gameover
- missile.line 68: [A] to launch a missile (close to W and S for ease of use)

I have working key handler, cursor keys, strategic use of both a key method and key variables, and an additional 3 key features.

The game does not employ keys for x axis movement, it accelerates automatically, which is integral to the game's difficulty. 
Otherwise you would have as much time as you wanted to navigate, making the entire game trivial.
As such I am deducting two marks  - and only two marks - for the lack of these two keys, awarding 8/10


Part D3 - Mark (7 /10)
-----------------------------
Bespoke collision detection methods are located in individual classes rather than the main program tab.
The main program tab was designed to handle only what couldn't be handled elsewhere, for better compartmentalisation & clarity.

  powerup.line 35: Uses the checkContact method to detect contact between every object in the powerup array and the 'player' missile.
  
  missile.line 78 & projectile.line 25: checks edge conditions for the 'player' missile and projectile respectively.

  rock.line 21: the checkContact method detects a collision between every object in the rock array and the passed argument coordinates:
    rock.line 43: collisions between 'player' missile and rock array objects
    rock.line 49: collisions between projectile and rock array objects
    rock.line 55: collisions between laser and rock array objects
  
  gold.line 22: the checkContact method detects a collision between every object in the gold array and the passed argument coordinates:
    gold.line 43: collisions between 'player' missile and gold array objects
    gold.line 49: collisions between projectile and gold array objects
    gold.line 55: 'collision', or at least treated as one if a gold array object is within the 'player' missile's explosion blast radius
    gold.line 60: 'collision', or at least treated as one if a gold array object is within the projectile's explosion blast radius

I have the basic collision detection between 2 objects & edge checking conditions.
Collisions are detected between three objects ('player' missile, projectile, laser) and three different arrays of object which each count as two objects (powerup[], rock[], gold[]) 

I would give full marks for the sheer number of collision detections, but I am deducting 3 marks for these methods not being in the main program, and some method redundancy. 
7/10


-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (7 /10)
-----------------------------
Excluding the 'player' missile class, the main program and game class (out of fairness), I have 5 other classes defined in their own tabs:

1- Gold
2- Laser
3- Powerup
4- Projectile
5- Rock

Each of these user-defined classes has appropriate fields, constructors, getters, setters. These are highlighted as follows:

1.gold CLASS
  Fields begin line:          2
  Constructor line:           8
  Bespoke methods begin line: 14
  Getters begin line:         67
  Setters begin line:         80
  
2.laser CLASS
  Fields begin line:          2
  Constructors begin line:    8
  Bespoke methods begin line: 16
  Getters begin line:         37
  Setters begin line:         54
  
3.powerup CLASS
  Fields begin line:          2
  Constructors begin line:    7
  OVERLOADED Constructor:     13
  Bespoke methods begin line: 20
  Getters begin line:         43
  Setters begin line:         56  
  
4.projectile CLASS
  Fields begin line:          2
  Constructors begin line:    8
  Bespoke methods begin line: 15
  Getters begin line:         32
  Setters begin line:         45
  
5.rock CLASS
  Fields begin line:          2
  Constructors begin line:    7
  Bespoke methods begin line: 14
  Getters begin line:         55
  Setters begin line:         68  
  
...

I have documented 5 classes with 1 example of an overloaded constructor. I am scoring 7/10.


Part E2 - Mark (10 /10)
-----------------------------

Class bespoke methods i.e. private helper methods:

I have private helper methods in 4 classes

1. Rock Class

line 21 takes in 2 parameters and returns a value
line 14 takes in 0 parameters and returns NO value

2. Powerup Class

line 20 takes in 2 parameters and returns a value

3. Gold Class

line 20 takes in 2 parameters and returns a value
line 28 takes in 2 parameters and returns a value
line 14 takes in 0 parameters and returns NO value

4. Missile Class

line 85 takes in 0 parameters and returns NO value
line 97 OVERLOADS line 85: takes in 2 parameters and returns NO value


Private helper methods for 4 classes are highlighted showing multiple examples of methods with no return values, return values, parameters, and an example of overloading. 
I am awarding myself 10/10


Part E3 - Mark (10 /10)
-----------------------------

game.line 15: declares & initialises the gold object ARRAY
game.line 16: declares & initialises the powerup object ARRAY
game.line 14: DECLARES the rock object ARRAY

Getters used:
game.line 153: player.getPosX() AND player.getPosY()
laser.line 18: player.getPosX()
laser.line 19: player.getPosY()
laser.line 29: player.getPosX()
gold.line 17: game.getBrokenGold()
game.line 196: getStatsGold() and getStatsRocks() ARRAY getters both used

Setters used:
game.line 177: setScore()
game.line 196: setStatsLevel()
missile.line 20: setPosY()
missile.line 21: setSpeedX()
missile.line 22: setCollided()
game.line 41: setStatsGold() ARRAY setter
game.line 42: setStatRocks() ARRAY setter
game.line 43: setStatsLevel() ARRAY setter

Default constructors used:
main program line 5: game class default constructor
main program line 6: 'player' missile class default constructor
game.line 97: powerup default constructor  

Overloaded constructors used:
game.line 99: powerup overloaded constructor 


Every criterion met or exceeded, including array getters & setters. 10/10 

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (10 /10)
-----------------------------

game.line 94: INITIALISES THE SIZE of the rock object ARRAY based on USER INPUT provided in a JOptionPane
game.line 15: Array of gold objects
game.line 16: Array of powerup objects

//NOTE: All of the below information arrays are USED in the game.line 220 lifelost() method to display gameover play statistics 
game.line 19: statsGold array, which is populated with the score per level derived from gold through the computeStats() method on game.line 185
game.line 20: statsRocks array, which is populated with the score per level derived from rocks through the computeStats() method on game.line 185
game.line 21: statsLevel array, which is populated with the total score earned per level derived via the computeStats() method on game.line 185
game.line 22: projectilesFired array, which is populated with the number of projectiles fired through missile.line 72.

Every criterion met or exceeded, with numerous arrays and examples of array size and array values being specified by player input. 10/10 

Part F2 - Mark (10 /10)
-----------------------------

game.line 195: A loop, with statsLevel.length USED as a loop control variable, is used to CHECK each index of two other information storing arrays,
  statsGold[] & statsRocks[]. The values of both are combined and used to UPDATE the statsLevel[] array indices.
game.line 207: The private helper method minMaxCheckerSetter() is called on game.line 198 & 200.
  minMaxCheckerSetter() checks (via the for loop on line 195) each index of the statsLevel[] array.
  minLevelScore is then set to the smallest statsLevel[] index value, while maxLevelScore is set to the highest statsLevel[] index value.
  Both variables are displayed at gameover.
game.line 243: the average score per level is displayed onscreen, derived from the final game.score value divided by 3 (one for each level played).
  
Every criterion met or exceeded:
  "element in the array is checked as part of a loop using .length
  each value is compared to some criteria
  value of an array element is updated"
  
Therefore scoring 10/10

--------------------

TOTAL MARK = 91/100

--------------------

FINAL CHECK:
I have checked the constraints and I am not breaking any constraints.
*/
