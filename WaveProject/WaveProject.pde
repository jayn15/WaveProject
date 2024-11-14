import g4p_controls.*;

//Main Code
boolean pause = false;

void setup(){
  //Size  and background colour
  size(800,500);
  background(0);
}

void draw() {
  //If statement that allows us to pause the program
  if(pause){ //If pause is true
    background(0);  // clear the background each frame

    // Draw all the beads
    for (int i = 0; i < numBeads; i++) {
      //Calls the drawing method from class Bead. 
      beads[i].drawBead();
    }
  }
}
