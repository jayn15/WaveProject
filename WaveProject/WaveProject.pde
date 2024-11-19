import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
PFont titleFont;
Wave newWave; 

void setup(){
  reset();
  //Size of the screen
  size(800,500);
  //titleScreen();
  reset();
  
  //initialize beads
  newWave.initializeBeads();
  createGUI();
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
  newWave = new Wave(100, 10, 1, 15); //Amp, frequency, tension, beads
}

void draw() {
  //If statement that allows us to pause the program
  if(!pause){ //If pause is not true(false).
    background(255);  // clear the background each frame

    // Draw all the beads in the wave.
    newWave.updateWave();
    newWave.drawWave();
  }
}
