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
  size(800,500); //Sets the size of the main scree
  createGUI(); //Creates the GUI
  centerLine = height/2; //Sets the value of center line to halfway between the top and bottom of the screen.
  
  BG1 = loadImage("Images/Wave1.jpg"); //Loads the first of the three images that make up the intro screen gif.
  BG1.resize(width, height); //Resizes that image to fit the screen
  
  BG2 = loadImage("Images/Wave2.jpg"); //Second image
  BG2.resize(width, height);
  
  BG3 = loadImage("Images/Wave3.jpg"); //Third image
  BG3.resize(width, height);
}

void valueChanging(){
  newWave = new Wave(amplitude, frequency, tension, damping, numBeads, startType, endType); //Creates the wave
  newWave.initializeBeads(); //Initializes the beads
  window = "play"; 
}

void reset(){
  //Sets the slider values
  changeAmp.setValue(100); 
  changeFeq.setValue(5);
  changeTen.setValue(0);
  changeDam.setValue(0);
  //Initializes wave values
  newWave.amplitude = changeAmp.getValueF();
  newWave.frequency = changeFeq.getValueF();
  newWave.stringTension = changeTen.getValueI();
  newWave.stringDamping = changeDam.getValueF();
  
  //Resets the start type values
  selectAuto.setSelected(true);
  newWave.startType = "Oscillation";
  
  //Resets the end type values
  noEnd.setSelected(true);
  newWave.endType = "No End";
}

void draw() {
  //Calls the display screen function
  displayScreen();
}
