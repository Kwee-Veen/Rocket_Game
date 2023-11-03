//Importing JOptionPane in order to take player input
import javax.swing.JOptionPane;

//Initialises several classes that need to be accessible at all times.
Game game = new Game();
Missile player = new Missile();
Projectile projectile = new Projectile();
Laser laser = new Laser();

//Initialises some basic default settings, including importing a font.
void setup() {
  size(1280, 780);
  surface.setLocation(0, 0);
  noCursor();
  fill(255);
  background(0);
  noStroke();
  PFont font = createFont("QuinqueFive.otf", 30);
  textFont(font);
}

//Clears the background each frame & calls game.run(), which determines all other methods calls depending on the stage.
void draw() {
  background(0);
  game.run();
}

//While the game is at the preStart() stage, if Spacebar is pressed the draw() method resumes looping and the game begins.
void keyPressed() {
  if ((key == ' ') && (game.sequence == 1)) {
    game.setSequence(2);
    loop();
  }
}
