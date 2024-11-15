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
}

void reset(){
  newWave = new Wave(100, 10, 1, 15);
  newWave.initializeBeads();
  window = "play";
}

void draw() {
  displayScreen();
  }
