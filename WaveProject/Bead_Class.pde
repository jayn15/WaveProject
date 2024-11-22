class Bead{
  //Fields
  PVector beadPos;
  color beadCol;
  int radius;
  float[] pastYValues;
  float[] newYValues;
  int maxRemVals;

  //Constructor
  Bead(float x, float y, color c){
      this.beadPos = new PVector(x, y);
      this.radius = 10; //Sets the radius for every bead to 25. 
      this.beadCol = c;
      this.maxRemVals = 11;
      this.pastYValues = new float[maxRemVals];
      this.newYValues = new float[maxRemVals];
      
      //Fills the two y value arrays with 0 values. 
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
      this.beadPos.y = a * sin(0.05*f * xCounter) + centerLine;
    }
    else if(ends == "Manual"){
      this.beadPos.y = mouseY; 
    }
  }
}
