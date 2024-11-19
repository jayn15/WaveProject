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
  //Size of the screen
  size(800,500);
  createGUI();
  newWave = new Wave(amplitude, frequency, tension, damping, numBeads, startType, endType);

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
  frameRate(60);
  centerLine = height/2;
  newWave.initializeBeads();
  window = "play";
}

void draw() {
  displayScreen();
}
