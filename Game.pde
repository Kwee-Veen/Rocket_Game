public class Game {
  private int score = 0;
  private int lives = 0;
  private int rockCount = 0;
  private int sequence = 0;
  private int timer = 0;
  private int brokenRocks = 0;
  private int brokenGold = 0;
  private int maxLevelScore = 0;
  private int minLevelScore = 0;

  /*Initialises the rock, gold & powerup object arrays.
   The size of the Rock[] array will be determined by the player during initiate()*/
  private Rock[] rock;
  private Gold[] gold = new Gold[6];
  private Powerup[] powerup = new Powerup[2];

  //Initialises three arrays to store statistics for gold, rocks and level score.
  private int statsGold[] = new int[3];
  private int statsRocks[] = new int[3];
  private int statsLevel[] = new int[3];
  private int projectilesFired[] = new int[2];

  //Game constructor, setting game fields to default values
  public Game() {
    reset();
  }

  //Resets all game fields to their defaults
  public void reset() {
    setScore(0);
    setLives(3);
    setRockCount(0);
    setSequence(0);
    setTimer(0);
    setBrokenRocks(0);
    setBrokenGold(0);
    setMaxLevelScore(0);
    setMinLevelScore(0);
    for (int i = 0; i < statsGold.length; i++) {
      setStatsGold(0, i);
      setStatsRocks(0, i);
      setStatsLevel(0, i);
      if (i < 2) {
        setProjectilesFired(0, i);
      }
    }
  }

  //Private helper method: runs the rock, powerup & gold run() methods for each instance of these objects
  private void runObjects() {
    int j = 0;
    while (j < rock.length) {
      rock[j].run();
      j++;
    }
    int k = 0;
    do {
      powerup[k].run();
      k++;
    } while (k < powerup.length);
    int l = 0;
    do {
      gold[l].run();
      l++;
    } while (l < gold.length);
  }

  /* Master method that determines which stage of the game (i.e., which game method) is active based on gameSequence.
   If gameSequence exceeds 1-3, it is reset to 0.*/
  public void run() {
    if (this.sequence == 0) {
      initiate();
    } else if (this.sequence == 1) {
      preStart();
    } else if (this.sequence == 2) {
      play();
    } else if (this.sequence == 3) {
      lifeLost();
    }
    if ((this.sequence > 3) || (this.sequence < 0)) {
      setSequence(0);
    }
  }

  /*Runs the reset() method & resets the 'player' missile's projectileCounter field.
   Then sets the game's rockCount field according to the player's choice, using a JOptionPane.
   Sets the posX and posY fields for each index of the powerup, gold & rock object arrays.
   For the rock objects, after every 4 rocks, a new row is started.*/
  public void initiate() {
    reset();
    player.setProjectileCounter(0);
    setRockCount(Integer.parseInt(JOptionPane.showInputDialog("Please select a number of rocks between 20 - 30", "25" )));
    rock = new Rock[rockCount];
    for (int k = 0; k < powerup.length; k++) {
      if (k == 0) {
        powerup[k] = new Powerup();
      } else
        powerup[k] = new Powerup((width/4.3), ((height/4.5) + (height/2)));
    }

    float x = 320;
    float y = 40;
    int i = 0;
    int column = 0;

    while (i < rock.length) {
      rock[i] = new Rock(x, y);
      x += 30;
      y += (height/6);
      i++;
      if ((i % 5) == 0) {
        column++;
        x = 320 + (column * 140);
        y = 40 + (column * 35);
      }
    }


    x = width*0.95;
    y = height*0.15;
    i = 0;

    while (i < gold.length) {
      gold[i] = new Gold(x, y);
      y += (height*0.15);
      i++;
    }
    this.setSequence(1);
  }

  /*Resets the game timer, missile class fields & projectile.collided fields to default values.
   Prints text on screen prompting the player to start using the spacebar key
   Pauses the draw loop at this point. The loop resumes when spacebar is pressed; see the keyPressed() method in launcher*/
  public void preStart() {
    setTimer(0);
    player.reset();
    projectile.setCollided(false);
    fill(0);
    stroke(#10509E);
    strokeWeight(3);
    rect(width*0.29, height*0.1, width*0.415, height*0.08);
    noStroke();
    textSize(18);
    fill(#EB7830);
    text("Press Spacebar to Start!", (width*0.30), (height*0.15));
    fill(#3BEB8C);
    textSize(13);
    text("Move up with W, down with S", (width*0.3), (height*0.40));
    text("Fire lasers to break rocks using Spacebar", (width*0.3), (height*0.52));
    text("Collect ammo powerups for projectiles", (width*0.3), (height*0.64));
    text("Fire projectiles with A to break gold", (width*0.3), (height*0.76));
    player.displayPlayer(player.getPosX(), player.getPosY());
    noLoop();
  }

  /*Runs the 'player' missile's updatePlayer method and the laser run() method.
   If the 'player' missile has collided, a timer is started.
   90 timer increments (i.e. 1.5 seconds) after the initial collision, gameSequence is set to 3, ending this method.
   Also continually sets the score based on the number of broken rocks & gold.*/
  public void play() {
    player.updatePlayer();
    laser.run();
    runObjects();

    if ((keyPressed == true) && (key == ' ')) {
      laser.setFireTrigger(true);
    }

    if (player.collided) {
      setTimer();
    }
    if (timer >= 90) {
      this.setSequence(3);
    }

    setScore(((brokenRocks * 10) + (brokenGold * 100)));
    fill(#D9AE5F);
    textSize(12);
    text("Score: " + score, width*0.8, height*0.05);
  }

  /*Private helper method  that stores the score earned during that level from rocks and gold in their respective arrays.
   Once all lives are lost, uses the statGold[] + statRocks[] arrays to populate the statsLevel[] array*/
  private void computeStats() {
    if (lives == 2) {
      statsGold[0] = (brokenGold * 100);
      statsRocks[0] = (brokenRocks * 10);
    } else if (lives == 1) {
      statsGold[1] = ((brokenGold * 100) - statsGold[0]);
      statsRocks[1] = ((brokenRocks * 10) - statsRocks[0]);
    } else if (lives == 0) {
      statsGold[2] = ((brokenGold * 100) - (statsGold[1] + statsGold[0]));
      statsRocks[2] = ((brokenRocks * 10) - (statsRocks[1] + statsRocks[0]));
      for (int i = 0; i < statsLevel.length; i++) {
        setStatsLevel((getStatsGold(i) + getStatsRocks(i)), i);
        if (i ==0) {
          setMinLevelScore(statsLevel[i]);
        }
        minMaxCheckerSetter(statsLevel[i]);
      }
    }
  }

  /*Private helper method: Checks the input.
   Sets minLevelScore to input if input is lower, and sets maxLevelScore to input if input is greater*/
  private void minMaxCheckerSetter(int input) {
    if (minLevelScore > input) {
      setMinLevelScore(input);
    }
    if (maxLevelScore < input) {
      setMaxLevelScore(input);
    }
  }

  /*When the 'player' missile explodes, decrements the lives field.
   Sets the game back to the preStart() method stage if lives are remaining.
   If not, the game is over; the total score & score per object per level is displayed.
   The game will be reset to the initiate() stage if spacebar is pressed.*/
  public void lifeLost() {
    setLives();
    computeStats();
    if (lives > 0) {
      setSequence(1);
    } else {
      textSize(18);
      fill(#EB7830);
      text("Game Over", (width*0.41), (height*0.1));
      fill(#237DEB);
      text("Final Score: " + score, (width*0.37), (height*0.195));
      fill(#3BEB8C);
      textSize(12);
      text("Level 1 Gold Score: " + statsGold[0], (width*0.07), (height*0.3));
      text("Level 1 Rocks Score: " + statsRocks[0], (width*0.37), (height*0.3));
      text("Level 1 Total Score: " + statsLevel[0], (width*0.67), (height*0.3));
      text("Level 2 Gold Score: " + statsGold[1], (width*0.07), (height*0.42));
      text("Level 2 Rocks Score: " + statsRocks[1], (width*0.37), (height*0.42));
      text("Level 2 Total Score: " + statsLevel[1], (width*0.67), (height*0.42));
      text("Level 3 Gold Score: " + statsGold[2], (width*0.07), (height*0.54));
      text("Level 3 Rocks Score: " + statsRocks[2], (width*0.37), (height*0.54));
      text("Level 3 Total Score: " + statsLevel[2], (width*0.67), (height*0.54));
      text("Lowest Level Score: " + minLevelScore, (width*0.07), (height*0.66));
      text("Average Level Score: " + (score / 3), (width*0.37), (height*0.66));
      text("Highest Level Score: " + maxLevelScore, (width*0.67), (height*0.66));
      fill(#237DEB);
      text("Projectiles fired: " + (projectilesFired[0] + projectilesFired[1]), (width*0.39), (height*0.77));
      fill(0);
      stroke(#10509E);
      strokeWeight(3);
      rect(width*0.29, height*0.865, width*0.45, height*0.07);
      noStroke();
      textSize(18);
      fill(#EB7830);
      text("Press Spacebar to Restart!", (width*0.30), (height*0.91));
      if ((keyPressed == true) && (key == ' ')) {
        setSequence(0);
      }
    }
  }


  //Getters
  public int getScore() {
    return score;
  }

  public int getLives() {
    return lives;
  }

  public int getRockCount() {
    return rockCount;
  }

  public int getSequence() {
    return sequence;
  }

  public int getTimer() {
    return timer;
  }

  public int getBrokenRocks() {
    return brokenRocks;
  }

  public int getBrokenGold() {
    return brokenGold;
  }

  public int getMaxLevelScore() {
    return maxLevelScore;
  }

  public int getMinLevelScore() {
    return minLevelScore;
  }

  //Setters
  private void setScore(int scoreArgument) {
    this.score = scoreArgument;
  }

  private void setLives(int livesArgument) {
    this.lives = livesArgument;
  }

  //overloaded lives setter: if passed no arguments, decrements the current lives value by 1
  private void setLives() {
    this.lives -= 1;
  }

  //Validates that the typed input is within the 20-30 range; if not, defaults to 25
  public void setRockCount(int input) {
    if ((input > 30) || (input < 20)) {
      this.rockCount = 25;
    } else rockCount = input;
  }

  //Validates that input is between 0 - 3, else defaults to 0
  public void setSequence(int input) {
    if ((input > 3) || (input < 0)) {
      this.sequence = 0;
    } else sequence = input;
  }

  public void setTimer(int input) {
    this.timer = input;
  }

  //overloaded: if setTimer is passed no arguments, increments current timer value by 1
  public void setTimer() {
    this.timer += 1;
  }

  public void setBrokenRocks(int input) {
    this.brokenRocks = input;
  }

  public void setBrokenGold(int input) {
    this.brokenGold = input;
  }

  public void setMaxLevelScore(int input) {
    this.maxLevelScore = input;
  }

  public void setMinLevelScore(int input) {
    this.minLevelScore = input;
  }


  //Array getters
  public int getStatsGold(int index) {
    return statsGold[index];
  }

  public int getStatsRocks(int index) {
    return statsRocks[index];
  }

  public int getStatsLevels(int index) {
    return statsLevel[index];
  }

  public int getProjectilesFired(int index) {
    return projectilesFired[index];
  }

  //Array setters
  public void setStatsGold(int input, int index) {
    this.statsGold[index] = input;
  }

  public void setStatsRocks(int input, int index) {
    this.statsRocks[index] = input;
  }

  public void setStatsLevel(int input, int index) {
    this.statsLevel[index] = input;
  }

  public void setProjectilesFired(int input, int index) {
    this.projectilesFired[index] = input;
  }
}
