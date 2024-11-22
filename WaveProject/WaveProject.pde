import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
float centerLine;
PFont titleFont;
Wave newWave;
String window = "title";

PImage BG1, BG2, BG3;
int AniCycle = 1; //for each frame, and resets to one after frame 3

float amplitude;
float frequency;
int tension;
float damping;
int numBeads;
String startType;
String endType;

void setup(){
  numBeads =  50;
  startType = "Oscillation";
  endType = "No End";
  
  //Size of the screen & GUI
  size(800,500);
  frameRate(60);
  createGUI();
  centerLine = height/2;
  
  BG1 = loadImage("Images/Wave1.jpg");
  BG1.resize(width, height);
  
  BG2 = loadImage("Images/Wave2.jpg");
  BG2.resize(width, height);
  
  BG3 = loadImage("Images/Wave3.jpg");
  BG3.resize(width, height);
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
  newWave.stringTension = 0;
  newWave.stringDamping = 0;
  changeAmp.setValue(100);
  changeFeq.setValue(5);
  changeTen.setValue(2);
  changeDam.setValue(0);
  //Normal_clicked(true);
  Fixed.setSelected(true);
  
  
}

void draw() {
  displayScreen();
}
