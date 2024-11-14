//Main Code
int numBeads;
float x;
float y;
ArrayList<Float> xBead = new ArrayList<>();  // ArrayList to hold x positions of beads
ArrayList<Float> yBead = new ArrayList<>();  // ArrayList to hold y positions of beads

void setup(){
  size(800,500);
  background(0);
  float spacing = 20;
  x = 100;
  y = 250;
    numBeads = int((width - x)/spacing - 1);

  // Initialize positions of the beads
  for (int i = 0; i < numBeads; i++) {
    xBead.add(x + i * spacing);  // space each bead 15 units apart
    yBead.add(y);            // same y-coordinate for all
  }
}

void draw() {
  background(0);  // clear the background each frame

  // Draw all the beads
  for (int i = 0; i < numBeads; i++) {
    fill(255);    // white color for beads
    ellipse(xBead.get(i), yBead.get(i), 15, 15);  // radius 10 for each bead
  }
}
