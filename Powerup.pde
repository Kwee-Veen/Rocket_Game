public class Powerup {
  private float posX = 0;
  private float posY = 0;
  private boolean used = false;

  //Overloaded powerup constructor: establishes the powerup's location based on default values
  public Powerup() {
    setPosX(width/4.3);
    setPosY(height/4.5);
  }
  
  //Overloaded powerup constructor: establishes the powerup's location based on two passed arguments
  public Powerup(float x, float y) {
    setPosX(x);
    setPosY(y);
  }

  //Private helper method: checks the distance between the powerup and the arguments.
  //Returns true if the separation is small enough to cause contact.
  private boolean checkContact(float x, float y) {
    if ((((posX - x) < 23) && ((posX - x) > -55)) && (((posY - y) < 30) && ((posY - y) > -20))) {
      return true;
    } else return false;
  }

  //Displays the powerup onscreen as an image provided the powerup hasn't been used
  //The image display is offset such that the posX & posY (for contact purposes) are in the centre of the image
  //If the 'player' missile contacts the powerup, player.ammo is incremented, and the powerup becomes used (i.e., gone).
  public void run() {
    if (!used) {
      PImage img;
      img = loadImage("powerup.png");
      image(img, posX-5.5, posY-25, 11.425, 50);

      if (checkContact(player.posX, player.posY)) {
        setUsed(true);
        player.setAmmo(player.ammo+1);
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

  public boolean getUsed() {
    return used;
  }

  //Setters
  public void setPosX(float input) {
    this.posX = input;
  }

  public void setPosY(float input) {
    this.posY = input;
  }

  public void setUsed(boolean input) {
    this.used = input;
  }
}
