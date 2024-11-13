//Main Code
int numBalls;
float x;
float y;
ArrayList<Float> xBall = new ArrayList<>();  // ArrayList to hold x positions of balls
ArrayList<Float> yBall = new ArrayList<>();  // ArrayList to hold y positions of balls

void setup(){
  size(800,500);
  background(0);
  float spacing = 20;
  x = 100;
  y = 250;
    numBalls = int((width - x)/spacing - 1);

  // Initialize positions of the balls
  for (int i = 0; i < numBalls; i++) {
    xBall.add(x + i * spacing);  // space each ball 15 units apart
    yBall.add(y);            // same y-coordinate for all
  }
}

void draw() {
  background(0);  // clear the background each frame

  // Draw all the balls
  for (int i = 0; i < numBalls; i++) {
    fill(255);    // white color for balls
    ellipse(xBall.get(i), yBall.get(i), 15, 15);  // radius 10 for each ball
  }
}
