public class Projectile {
  private float posX = 0;
  private float posY = 0;
  private boolean collided = false;


  //Projectile constructor setting the fields to their default values
  public Projectile() {
    setPosX(0);
    setPosY(0);
    setCollided(false);
  }

  //Method to set the projectile's position to the passed x & y arguments
  public void initiate(float x, float y) {
    setPosX(x);
    setPosY(y);
  }

  //Displays & moves the projectile position, checks if it's collided with the walls, & explodes if it has
  public void run() {
    if ((!collided) && (player.projectileFired)) {
      player.displayPlayer(posX, posY);
      setPosX(posX + 18);
      if ((posX >= (width*0.98)) || (posY >= (height*0.94)) || (posY <= (height*0.015))) {
        setCollided(true);
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

  public boolean getCollided() {
    return collided;
  }

  //Setters
  public void setPosX(float input) {
    this.posX = input;
  }

  public void setPosY(float input) {
    this.posY = input;
  }

  public void setCollided(boolean input) {
    this.collided = input;
  }
}
