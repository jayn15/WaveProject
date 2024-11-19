import g4p_controls.*;

//Main Code
boolean pause = false;
float xCounter = 0;
PFont titleFont;
String window = "title";
Wave newWave; 

void setup(){
  //Size of the screen & GUI
  size(800,500);
  createGUI();
  newWave = new Wave(50, 10, 1, 15); //Amp, frequency, tension, beads
}

void reset(){
  newWave.initializeBeads();
  window = "play";
}

void draw() {
  displayScreen();
}
