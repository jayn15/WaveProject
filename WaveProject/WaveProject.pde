import g4p_controls.*;

//Main Code
boolean pause = false;
Wave newWave; 

void setup(){
  //Size  and background colour
  size(800,500);
  background(255);
  newWave = new Wave(1, 1, 15);
}

void draw() {
  //If statement that allows us to pause the program
  if(!pause){ //If pause is not true(false).
    background(255);  // clear the background each frame

    // Draw all the beads in the wave.
    newWave.initializeBeads();
    newWave.drawWave();
  }
}
