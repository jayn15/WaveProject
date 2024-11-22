class Wave{
  //Fields
  ArrayList<Bead> beadWave;
  float amplitude;
  float frequency;
  int stringTension;
  float stringDamping;
  int numBeads;
  String startType;
  String endType;

  //Constructor
  Wave(float a, float f, int t, float d, int b, String s, String e){
      this.amplitude = changeAmp.getValueI();
      this.frequency = changeFeq.getValueI();
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
      //For-loop that goes through every bead in the wave
      int i = 0;
      for(Bead b : this.beadWave){
          //Draws each bead except the last ghost bead which is discussed in further depth in initializeBeads()
          if(i < this.beadWave.size()-1){
            b.drawBead();
          }
          
          //Draws lines between beads
          //The reason it is this.beadWave.size() - 2 is because there is a subtraction for the out of bounds index error, but there is also a subtraction so that there isn't a tail of line poking out from the last ball. 
          if(i < this.beadWave.size()-2){
            stroke(255, 0, 0);
            line(b.beadPos.x, b.beadPos.y, this.beadWave.get(i+1).beadPos.x, this.beadWave.get(i+1).beadPos.y);
          }
          
          i++;
      }
  }

  void updateWave(){
    int i = 0;
    //For-loop that goes through every bead in the wave
    for(Bead b : this.beadWave){       
      updatePastBeadArray(b);
      
      //Updates each bead based on amplitude, frequency and start/end types
      //First bead
      if(i == 0){
        b.updateBeadPos(this.amplitude, this.frequency, this.startType);  
      }
      //Last bead
      else if(i == this.beadWave.size()){  
        
        if(this.endType.equals("No End")){
          followBead(b, this.beadWave.get(i-1));    
        }
        
        b.updateBeadPos(this.amplitude, this.frequency, this.endType); 
        
      }
      //All the beads in between
      else if(i < this.beadWave.size()){ //Beads in the middle of the string
        
        followBead(b, this.beadWave.get(i-1));

        b.updateBeadPos(this.amplitude, this.frequency, "Middle Bead");  
      }
      xCounter += 0.01;
      i++;          
    }
  }   
  
  void initializeBeads(){
    //For loop that repeats once for every bead there is. 
    for(int i = 0; i < this.numBeads; i++){
      this.beadWave.add( new Bead( (width/this.numBeads) * i + (width/(2*this.numBeads)), centerLine, 0) ); 
    }
      
  }

  void followBead(Bead selected, Bead other){
    if(other.pastYValues[this.stringTension] < centerLine){ //If previous bead was above the center line
      selected.beadPos.y = other.pastYValues[this.stringTension] + this.stringDamping;
    }
    else if(other.pastYValues[this.stringTension] > centerLine){
      selected.beadPos.y = other.pastYValues[this.stringTension] - this.stringDamping;   
    }
    else{
      selected.beadPos.y = other.pastYValues[this.stringTension];
    }
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
  
  
  
