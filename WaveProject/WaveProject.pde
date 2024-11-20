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
  numBeads =  50;
  startType = "Oscillation";
  endType = "Fixed";
  
  //Size of the screen & GUI
  size(800,500);
  frameRate(60);
  createGUI();
  centerLine = height/2;
}

void valueChanging(){
  newWave = new Wave(amplitude, frequency, tension, damping, numBeads, startType, endType);
  newWave.initializeBeads();
  window = "play";
}

void reset(){
  //this works, but find out how to make bar also equal its original values
  //also what the hell happened to the beads when freq is all left??
  //is freq min = 0? prob change that lol
  
  newWave.amplitude = 100;
  newWave.frequency = 5;
  newWave.stringTension = 10;
  newWave.stringDamping = 0;
  
}

void draw() {
  displayScreen();
}
