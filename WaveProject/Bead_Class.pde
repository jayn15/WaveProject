class Bead{
  //Fields
  PVector beadPos; //Position of the bead
  color beadCol; //Colour of the bead
  int radius;
  float[] pastYValues; //Array that store the past y values of every bead
  float[] newYValues; //Array that is used to facilitate the transfer of past y values into a new array
  int maxRemVals; //This is the max amount of values that will be stored in the pastYValues and newYValues arrays. It is basically how much the program remembers. 

  //Constructor
  Bead(float x, float y, color c){
      this.beadPos = new PVector(x, y); //x and y positions of the bead
      this.radius = 10; //Sets the radius for every bead to 10. 
      this.beadCol = c; //Bead colour
      this.maxRemVals = 11; //Maximum remembered values is set to 11, 1 more than 10 so that tension, which pulls information from the arrays, can go up to 10, which is a much nicer number than 9 or 11.
      this.pastYValues = new float[maxRemVals]; //Sets the array as a float array with a size predetermined in the line above
      this.newYValues = new float[maxRemVals]; //Sets the array as a float array with a size predetermined two lines above
      
      //Fills the two y value arrays with centerLine as the y values so that all the beads start in the middle of the screen height-wise. 
      for(int j = 0; j < this.maxRemVals; j++){
        this.pastYValues[j] = centerLine;
        this.newYValues[j] = centerLine;
      }
      
  }    

  //Methods
  void drawBead(){
      //Colours the beads with previously determined colour
      fill(this.beadCol);
      //Draws the bead at preset x and y values with specified radius. 
      circle(this.beadPos.x, this.beadPos.y, this.radius);
  }
  
  //Bead method that updates the bead position based on amplitude and frequency. 
  void updateBeadPos(float a, float f, String ends){
    //If statements for if the selected bead is the first bead
    if(ends == "Oscillation"){
      //Calculates the position of the ball based on a sine function
      this.beadPos.y = a * sin(0.05*f * xCounter) + centerLine;
    }
    else if(ends == "Manual"){
      //Sets the y value of the ball at the mouse's y position. 
      this.beadPos.y = mouseY; 
    }
  }
}
