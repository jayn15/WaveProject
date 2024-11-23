class Wave{
  //Fields
  ArrayList<Bead> beadWave; //Arraylist that keeps track of the individual beads in the wave
  float amplitude;
  float frequency;
  int stringTension; //Tension of the string that holds all the balls together
  float stringDamping; //Damping of the string
  int numBeads; //Number of beads on the string
  String startType; //Starting bead movement type
  String endType; //Ending bead movement type

  //Constructor
  Wave(float a, float f, int t, float d, int b, String s, String e){
      this.amplitude = a; 
      this.frequency = f; 
      this.stringTension = t;
      this.stringDamping = d;
      this.numBeads = b;
      this.startType = s;
      this.endType = e;
      //Create a new arraylist that keeps track of the beads within the wave. 
      this.beadWave = new ArrayList<Bead>();
  }

  //Methods
  void drawWave(){
    //Variable that tracks which bead number the for loop is at
    int i = 0;
    //For-loop that goes through every bead in the wave
    for(Bead b : this.beadWave){
      if(i < this.beadWave.size()){
        b.drawBead();
      }
      
      //Draws lines between beads 
      if(i < this.beadWave.size()-1){ //If statement that applies for every ball except the last one, because there is no next ball to draw a line to.
        stroke(255); //Sets the line colour to white.
        line(b.beadPos.x, b.beadPos.y, this.beadWave.get(i+1).beadPos.x, this.beadWave.get(i+1).beadPos.y); //Draws the lines between the balls
      }
      
      i++;
    }
  }

  void updateWave(){
    //Variable that tracks which bead number the for loop is at
    int i = 0;
    //For-loop that goes through every bead in the wave
    for(Bead b : this.beadWave){ 
      //Updates the past bead array for each bead
      updatePastBeadArray(b);
    
      //Updates each bead based on amplitude, frequency and start/end types
      //First bead
      if(i == 0){
        b.updateBeadPos(this.amplitude, this.frequency, this.startType);  
      }
      
      //Last bead
      else if(i == this.beadWave.size()-1){     
        if(this.endType.equals("No End")){
          followBead(b, this.beadWave.get(i-1));
        }
        else if(this.endType.equals("Loose")){
          followBead(b, this.beadWave.get(i-1));          
        }
        else if(this.endType.equals("Fixed")){
          //Nothing happens because there is no need to update the bead as it stays in one fixed position
          //Puts the last bead on the center line
          b.beadPos.y = centerLine;
          //Increases damping because the stationary bead prevents the wave from reaching its maximum
          if(this.stringDamping == 0){
            this.stringDamping = 0.5;
          }
        }
      }
      //All the beads in between
      else if(i < this.beadWave.size()-1){ //Beads in the middle of the string
        followBead(b, this.beadWave.get(i-1));
        b.updateBeadPos(this.amplitude, this.frequency, "Middle Bead");  
      }
      xCounter += 0.01; //Increments the xCounter that is used in the oscillation of the first bead
      i++; //Increments the counter that keeps track of which ball the for loop is on.  
    }
  }   
  
  void initializeBeads(){
    //For loop that repeats once for every bead there is. 
    for(int i = 0; i < this.numBeads; i++){
      //Creates the beads and adds them into the beadWave arraylist
      this.beadWave.add( new Bead( (width/this.numBeads) * i + (width/(2*this.numBeads)), centerLine, color(0,0,255)) ); 
    }
      
  }

  void followBead(Bead selected, Bead other){
    //Calculates the selected bead position using the previous y values of the bead before it
    if(other.pastYValues[10-this.stringTension] < centerLine-5){ //If both the previous bead and the current bead are above the center line
      selected.beadPos.y = other.pastYValues[10-this.stringTension] + this.stringDamping; //Add the damping
    }
    else if(other.pastYValues[10-this.stringTension] > centerLine+5){ //If previous bead and the current bead are below the center line
      selected.beadPos.y = other.pastYValues[10-this.stringTension] - this.stringDamping; //Takes a bit off the selected bead 
    }
    else{
      selected.beadPos.y = other.pastYValues[10-this.stringTension]; //No damping added
    }
    
    //If statement that prevents shaking around the centerLine when there is damping. 
    if(selected.beadPos.y < centerLine + 5 && selected.beadPos.y > centerLine - 5 && this.stringDamping != 0){
      selected.beadPos.y = centerLine; 
    }
    //println(selected.beadPos.y);
  }
  
  void updatePastBeadArray(Bead selected){
    //Assigning current y value to the first spot in newYValues. 
    selected.newYValues[0] = selected.beadPos.y;
    
    //Filling in the rest of the array with the values from the new "past values" array. 
    for(int j = 1; j < selected.maxRemVals; j++){
      selected.newYValues[j] = selected.pastYValues[j-1];
    }
    
    //Moves all the "new" past y values back into the original array
    for(int i = 0; i < selected.maxRemVals; i++){
      selected.pastYValues[i] = selected.newYValues[i];
    }
  }
} 
