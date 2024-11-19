import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
float centerLine;
PFont titleFont;
Wave newWave;
String window = "title";

float amplitude;
float frequency;
float tension;
float damping;
int numBeads;
String startType;
String endType;

void setup(){
  amplitude = 100;
  frequency = 5;
  tension = 10;
  damping = 0;
  numBeads =  50;
  startType = "Oscillation";
  endType = "No End";
  //Size of the screen & GUI
  size(800,500);
  //titleScreen();
  reset();
  
  //initialize beads
  newWave.initializeBeads();
  createGUI();
  newWave = new Wave(amplitude, frequency, tension, damping, numBeads, startType, endType); //Amp, frequency, tension, beads
  centerLine = height/2;
}


void reset(){
  newWave.initializeBeads();
  frameRate(60);
  window = "play";
}

void draw() {
  displayScreen();
}
