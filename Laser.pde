public class Laser {
  private float posX = 0;
  private float posY = 0;
  private boolean fireTrigger = false;
  private boolean active = false;

  //Projectile constructor setting the fields to their default values
  public Laser() {
    setPosX(0);
    setPosY(0);
    setFireTrigger(false);
    setActive(false);
  }

  //Displays & moves the projectile position, checks if it's collided with the walls, & explodes if it has
  public void run() {
    if ((fireTrigger) && (!active) && (!player.getCollided())) {
      setPosX(player.getPosX()+18);
      setPosY(player.getPosY()+5);
      setActive(true);
    }
    if (active) {
      fill(255);
      strokeWeight(4);
      stroke(255);
      line(posX, posY, posX+20, posY);
      setPosX(posX + 20);
      noStroke();
      if ((posX - player.getPosX()) >= 225) {
        setActive(false);
        setFireTrigger(false);
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

  public boolean getFireTrigger() {
    return fireTrigger;
  }

  public boolean getActive() {
    return active;
  }

  //Setters
  public void setPosX(float input) {
    this.posX = input;
  }
  
  public void setPosY(float input) {
    this.posY = input;
  }

  public void setFireTrigger (boolean input) {
    this.fireTrigger = input;
  }

  public void setActive(boolean input) {
    this.active = input;
  }
}
