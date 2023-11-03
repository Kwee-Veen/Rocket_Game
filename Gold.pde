public class Gold {
  private float posX = 0;
  private float posY = 0;
  private boolean broken = false;


  //Rock constructor: establishes the rock's location
  public Gold(float x, float y) {
    setPosX(x);
    setPosY(y);
    setBroken(false);
  }

  //Private helper method: when run, breaks the gold & increments the number of gold broken.
  private void breakGold() {
    setBroken(true);
    game.setBrokenGold(game.getBrokenGold() + 1);
  }

  //Private helper method: checks the distance between the gold and the arguments.
  //Returns true if the separation is small enough to cause contact.
  private boolean checkContact(float x, float y) {
    if ((((posX - x) < 23) && ((posX - x) > -55)) && (((posY - y) < 30) && ((posY - y) > -20))) {
      return true;
    } else return false;
  }

  //Private helper method: checks the distance between the gold and the arguments.
  //Returns true if the separation is small enough that the gold is within an explosive's blast radius.
  private boolean checkBlastRadius(float x, float y) {
    if ((((posX - x) < 91) && ((posX - x) > -123)) && (((posY - y) < 98) && ((posY - y) > -88))) {
      return true;
    } else return false;
  }

  //Displays the rock around posX & posY as a pair of squares if not broken.
  public void run() {
    if (!broken) {
      fill(#D9B341);
      square(posX-20, posY-20, 40);

      //Checks if the missile has directly collided with the gold; if so, breaks the gold and sets player.collided to true
      if ((!broken) && (checkContact(player.posX, player.posY))) {
        player.setCollided(true);
        breakGold();
      }

      //Checks if a projectile has directly collided with the gold; if so, breaks the gold and sets projectile.collided to true
      if ((!broken) && (player.projectileFired) && (checkContact(projectile.posX, projectile.posY))) {
        projectile.setCollided(true);
        breakGold();
      }

      //When a missile has exploded, checks if the gold is within the blast radius & breaks the gold if so.
      if ((!broken) && (player.collided) && (checkBlastRadius(player.posX, player.posY))) {
        breakGold();
      }

      //When a projectile has exploded, checks if the gold is within the blast radius & breaks the gold if so.
      if ((!broken) && (projectile.collided) && (checkBlastRadius(projectile.posX, projectile.posY))) {
        breakGold();
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
