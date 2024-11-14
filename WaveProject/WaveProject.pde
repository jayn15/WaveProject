//Main Code
int numBeads;

void setup(){
  size(800,500);
  background(0);
  
  //Creates a new array of type Bead that keeps track of each bead
  Bead[] beads = new Bead[numBeads]

  // Initialize positions and colour of the beads
  for (int i = 0; i < numBeads; i++) {
    beads[i] = new Bead( (width/numBeads)*i + (width/(2*numBeads)), height/2, 255)
  }
}

void draw() {
  background(0);  // clear the background each frame

  // Draw all the beads
  for (int i = 0; i < numBeads; i++) {
    ellipse(xBead.get(i), yBead.get(i), 15, 15);  // radius 10 for each bead
  }
}
