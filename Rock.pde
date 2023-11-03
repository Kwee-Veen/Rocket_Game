public class Rock {
  private float posX = 0;
  private float posY = 0;
  private boolean broken = false;

  //Rock constructor: establishes the rock's location
  public Rock(float x, float y) {
    setPosX(x);
    setPosY(y);
    setBroken(false);
  }

  //Private helper method: when run, breaks the rock & increments the number of rocks broken.
  private void rockBreak() {
    setBroken(true);
    game.setBrokenRocks(game.brokenRocks + 1);
  }

  //Private helper method: checks the distance between the rock and the arguments.
  //Returns true if the separation is small enough to cause contact.
  private boolean checkContact(float x, float y) {
    if ((((posX - x) < 23) && ((posX - x) > -55)) && (((posY - y) < 30) && ((posY - y) > -20))) {
      return true;
    } else return false;
  }

  //Displays the rock around posX & posY as a pair of squares if not broken.
  public void run() {
    if (!broken) {
      fill(#595959);
      square(posX-20, posY-20, 40);
      fill(#8C8C8C);
      square(posX-14, posY-14, 10);

      //Checks if the missile has directly collided with the rock; if so, breaks the rock and sets player.collided to true
      if (checkContact(player.posX, player.posY)) {
        player.setCollided(true);
        rockBreak();
      }

      //Checks if a projectile has directly collided with the rock; if so, breaks the rock and sets projectile.collided to true
      if ((player.projectileFired) && (checkContact(projectile.posX, projectile.posY))) {
        projectile.setCollided(true);
        rockBreak();
      }

      //Checks if a laser has directly collided with the rock; if so, breaks the rock (lasers punch through rocks but not gold)
      if ((laser.active) && (checkContact(laser.posX, laser.posY))) {
        rockBreak();
      }
    }
  }


  //Getters
  public float getPosX() {
    return posX;
  }

  public float getPosY() {
    return posY;
  }

  public boolean getBroken() {
    return broken;
  }

  //Setters
  public void setPosX(float input) {
    this.posX = input;
  }

  public void setPosY(float input) {
    this.posY = input;
  }

  public void setBroken(boolean input) {
    this.broken = input;
  }
}
