import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
float centerLine;
PFont titleFont;
Wave newWave;

float amplitude;
float frequency;
float tension;
float damping;
int numBeads;
String startType;
String endType;


void setup(){
  reset();
  //Size of the screen
  size(800,500);
  //titleScreen();
  
  //initialize beads
  newWave.initializeBeads();
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
  amplitude = 200; //Amplitude of the wave
  frequency = 5; //Frequency
  tension = 10; //String tension factor
  damping = 0; //String damping factor: 0-10
  numBeads = 50; //Number of beads on the string
  startType = "Oscillation"; //Users can choose between: Oscillation, Pulse, Manuel
  endType = "No End"; //Users can choose between: Fixed, Loose, No End
  //Creates new wave with parameters (amplitude, frequency, tension, damping, number of beads, start type, end type)
  newWave = new Wave(amplitude, frequency, tension, damping, numBeads, startType, endType);
  frameRate(60);
  centerLine = height/2;

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
