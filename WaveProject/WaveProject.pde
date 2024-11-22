import g4p_controls.*;

//Main Code
boolean pause = false; //Pause variable used by the pause/play button
boolean amplitudeCounter = false; //Boolean variable that is used to prevent the amplitude from stacking. 
float xCounter = 0; //Increment variable that allows the first bead to oscillate.
float centerLine; //Variable that represents the center line, halfway between the top and bottom of the screen. 
PFont titleFont; //Font for the title screen
String window = "title"; //Variable to represent what part of the program is running.
Wave newWave; //Variable to represent the wave.

PImage BG1, BG2, BG3; //Variable for the three different images that are the background for the introduction screen. 
int AniCycle = 1; //for each frame, and resets to one after frame 3

float amplitude; //Amplitude of the first ball's oscillation
float frequency; //Frequency of the first ball's oscillation
int tension; //Tension of the rope. 
float damping; //Damping of the rope. 
int numBeads; //Number of beads on the rope
String startType; //Start type of the wave
String endType; //End type of the wave. 

void setup(){
  numBeads =  50; //Sets the number of beads in the wave at 50. 
  startType = "Oscillation"; //Sets the start type at oscillation.
  endType = "Fixed"; //Sets the end type at fixed. 
  
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
  changeTen.setValue(0);
  changeDam.setValue(0);
  //Normal_clicked(true);
  Fixed.setSelected(true);
  
  
}

void draw() {
  displayScreen();
}
