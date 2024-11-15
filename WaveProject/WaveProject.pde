import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
PFont titleFont;
String window = "title";
Wave newWave; 

void setup(){
  //Size of the screen
  size(800,500);
  createGUI();
  //titleScreen();
  //reset();
  
  //initialize beads
  //newWave.initializeBeads();
}


//void titleScreen(){
//  background(200,240,255);
//  titleFont = loadFont("Candara-LightItalic-60.vlw");
//  textFont(titleFont);
//  fill(50,70,100);
//  textAlign(CENTER);
//  text("Wave Simulator!", width/2, height-(height-200));
//  startButton.setVisible(true);
//}

void reset(){
  newWave = new Wave(100, 10, 1, 15);
  newWave.initializeBeads();
  window = "play";
}

void draw() {
  displayScreen();
  }
