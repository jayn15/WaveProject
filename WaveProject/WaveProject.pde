import g4p_controls.*;

//Main Code
boolean pause = false;
PFont titleFont;
Wave newWave; 

void setup(){
  //Size of the screen
  size(800,500);
  //titleScreen();
  reset();
}


void titleScreen(){
  background(200,240,255);
  titleFont = loadFont("Candara-LightItalic-60.vlw");
  textFont(titleFont);
  fill(50,70,100);
  textAlign(CENTER);
  text("Wave Simulator!", width/2, height-(height-200));
  //startButton.setVisible(true);
  //reset();
}

void reset(){
  newWave = new Wave(1, 1, 10);
}

void draw() {
  //If statement that allows us to pause the program
  if(!pause){ //If pause is not true(false).
    background(0);  // clear the background each frame

    // Draw all the beads in the wave.
    newWave.initializeBeads();
    newWave.drawWave();
  }
}
