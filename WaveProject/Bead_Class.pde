class Bead{
  //Fields
  PVector beadPos;
  PVector beadVel;
  PVector beadAcc;
  color beadCol;
  int radius;
  int mass;
  float[] pastYValues;
  float[] newYValues;
  int maxRemVals;

  //Constructor
  Bead(float x, float y, color c){
      this.beadPos = new PVector(x, y);
      this.radius = 10; //Sets the radius for every bead to 25. 
      this.beadCol = c;
      this.mass = 100;
      this.maxRemVals = 10;
      this.beadVel = new PVector(0,0);
      this.beadAcc = new PVector(0,0);
      this.pastYValues = new float[maxRemVals];
      this.newYValues = new float[maxRemVals];
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
      
      if(realisticMode){
        this.beadVel.y = a * cos(0.05*f * xCounter) + centerLine;
      }
    }
    else if(ends == "Pulse"){
      
    }
    else if(ends == "Manuel"){
      
    }
    
    //If statements for if the selected bead is the last bead
    else if(ends == "Fixed"){
      //Nothing happens because the end bead is in a fixed position and does not require an update. 
    }
    else if(ends == "Loose"){ 
      if(realisticMode){
        //Very similar to the else statement, however, this yAcc is different: It doesn't include the second force of tension(the tension force induced by the next ball in the chain) in the acceleration calculations.    
        //Change ySpeed using acceleration
        this.beadVel.y += this.beadAcc.y; 
        //Change y position using y speed
        this.beadPos.y += this.beadVel.y;
        if((this.beadPos.y < centerLine - abs(a)) || (this.beadPos.y > centerLine + abs(a))){
          this.beadAcc.y = 0;
          this.beadVel.y = 0;
          if(this.beadPos.y < centerLine - abs(a))
            this.beadPos.y = centerLine - abs(a);
          else if (this.beadPos.y > centerLine + abs(a))
            this.beadPos.y = centerLine + abs(a);
        }
      }
    }
    
    else{ //Every other bead in the middle of the string, also applies to no end type because it acts like a bead in the middle of the string
      //X value stays the same
      //Change the y value
      
      if(realisticMode){
        //Change ySpeed using acceleration
        this.beadVel.y += this.beadAcc.y; 
        //Change y position using y speed
        this.beadPos.y += this.beadVel.y;
        
        if((this.beadPos.y < centerLine - abs(a)) || (this.beadPos.y > centerLine + abs(a))){
          this.beadAcc.y = 0;
          this.beadVel.y = 0;
          if(this.beadPos.y < centerLine - abs(a))
            this.beadPos.y = centerLine - abs(a);
          else if (this.beadPos.y > centerLine + abs(a))
            this.beadPos.y = centerLine + abs(a);
        }
        //Removes energy from the system and prevents build up of acceleration
        else if((this.beadPos.y > centerLine - 50) || (this.beadPos.y < centerLine + 50)){
          this.beadAcc.y = 0;
        }
        
      }
    }
  }
}
