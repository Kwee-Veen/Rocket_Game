public class Missile {
  private float posX = width*0.05;
  private float posY = height*0.49;
  private float speedX = 0;
  private float speedY = 0;
  private boolean collided = false;
  private boolean projectileFired = false;
  private int ammo = 0;
  private int projectileCounter = 0;


  //Constructor for the Missile class.
  public Missile() {
    reset();
  }

  //Resets the Missile class' fields to their defaults, except speedY, which defaults automatically.
  public void reset() {
    setPosX();
    setPosY();
    setSpeedX();
    setCollided(false);
    setProjectileFired(false);
    setAmmo(0);
  }

  //Displays the missile. This includes flames that only display if the game is actively running.
  public void displayPlayer (float x, float y) {
    fill(#BD2D30);
    triangle(x, y, x, y+10, x+12, y+5);
    fill(210);
    rect(x, y, -35, 10);
    fill(#2E57BF);
    triangle(x-22, y, x-35, y, x-42, y-10);
    triangle(x-22, y+10, x-35, y+10, x-42, y+20);
    if (game.sequence == 2) {
      fill(#F20505);
      triangle(x-36, y+2, x-48, y-2, x-36, y+8);
      triangle(x-36, y+8, x-48, y+12, x-36, y+2);
      triangle(x-36, y+10, x-52, y+5, x-36, y);
      fill(#F2E205);
      triangle(x-36, y+8, x-44, y+5, x-36, y+2);
    }
  }

  //Dynamically moves the rocket position using W and S while it hasn't collided, cursor up and down.
  //Once collided, calls the explode() method.
  //If the player has at least one ammo, fires a projectile when the A key is pressed (and decrements ammo).
  //Also checks position of the missile to check if it reached the outer walls, and if so, sets collide to true.
  public void updatePlayer() {
    if (projectileFired) {
      projectile.run();
      if (projectile.collided) {
        explode(projectile.posX, projectile.posY);
      }
    }
    if (!collided) {
      if ((keyPressed == true) && (((key == 'w') || (key == 'W')) || ((key == CODED) && (keyCode == UP)))) {
        setSpeedY(-5);
      } else if ((keyPressed == true) && (((key == 's') || (key == 'S')) || ((key == CODED) && (keyCode == DOWN)))) {
        setSpeedY(5);
      } else setSpeedY(0);

      displayPlayer(posX, posY);
      setPosX(posX + (speedX * 2));
      setSpeedX(speedX + 0.037);

      if ((keyPressed == true) && (ammo > 0) && (!projectileFired) && ((key == 'a') || (key == 'A'))) {
        projectile.initiate(posX, posY);
        setProjectileFired(true);
        setAmmo(ammo - 1);
        game.setProjectilesFired(1, projectileCounter);
        setProjectileCounter(projectileCounter + 1);
      }

      setPosY(posY + (speedY * 2));

      if ((posX >= (width*0.98)) || (posY >= (height*0.94)) || (posY <= (height*0.015))) {
        setCollided(true);
      }
    } else explode();
  }

  //Overloaded private helper method displaying a fireball: when passed no arguments, explosion is at the missile's posX & posY
  private void explode() {
    fill(#F20505);
    circle(posX, posY+5, 140);
    fill(#F27405);
    circle(posX, posY+5, 110);
    fill(#F29F05);
    circle(posX, posY+5, 80);
    fill(#F2E205);
    circle(posX, posY+5, 50);
  }

  //Overloaded private helper method displaying a fireball: when passed two arguments, explosion is at the arguments' X & Y coordinates.
  private void explode(float x, float y) {
    fill(#F20505);
    circle(x, y+5, 140);
    fill(#F27405);
    circle(x, y+5, 110);
    fill(#F29F05);
    circle(x, y+5, 80);
    fill(#F2E205);
    circle(x, y+5, 50);
  }


  //Getters 
  public float getPosX() {
    return posX;
  }
  
  public float getPosY() {
    return posY;
  }
  
  public float getSpeedX() {
    return speedX;
  }
  
  public float getSpeedY() {
    return speedY;
  }
  
  public boolean getCollided() {
    return collided;
  }
  
  public int getAmmo() {
    return ammo;
  }
  
  public boolean getProjectileFired() {
    return projectileFired;
  }
  
  public int getProjectileCounter() {
    return projectileCounter;
  }

  //Setters
  public void setPosX(float input) {
    this.posX = input;
  }

  //Overloaded posX setter: if not passed an argument, sets to default value
  public void setPosX() {
    this.posX = width*0.05;
  }

  public void setPosY(float input) {
    this.posY = input;
  }

  //Overloaded posY setter: if not passed an argument, sets to default value
  public void setPosY() {
    this.posY = height*0.49;
  }

  public void setSpeedX(float input) {
    this.speedX = input;
  }

  //Overloaded speedX setter: when passed no arguments, sets speedX to default
  public void setSpeedX() {
    this.speedX = 1.8;
  }

  public void setSpeedY(float input) {
    this.speedY = input;
  }

  public void setCollided(boolean input) {
    collided = input;
  }

  public void setAmmo(int input) {
    this.ammo = input;
  }

  public void setProjectileFired(boolean input) {
    this.projectileFired = input;
  }

  public void setProjectileCounter(int input) {
    this.projectileCounter = input;
  }
}
