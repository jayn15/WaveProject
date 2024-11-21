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
  float yAcceleration;

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
      //Copies all past y values into a different array to hold the new "past values"
      b.pastYValues = b.newYValues;
      
      //Assigning current y value to the first spot in pastYValues. 
      b.pastYValues[0] = b.beadPos.y;
      
      //Filling in the rest of the array with the values from the new "past values" array. 
      for(int j = 1; j < b.pastYValues.length - 1; j++){
        b.pastYValues[j] = b.newYValues[j-1];
      }
      
      
      //Updates each bead based on amplitude, frequency, acceleration and start/end types
      //First bead
      if(i == 0){
        b.updateBeadPos(this.amplitude, this.frequency, this.startType);  
      }
      //Last bead
      else if(i == this.beadWave.size()-2){ //The reason it is -2 is because it refers to the second last ball in the string. It is really the last ball that the user can see, but there is an additional ball to facilitate the process for the no end endType. 
        
          if(this.endType.equals("No End")){
            followBead(b, this.beadWave.get(i-1));    
          }
        
        b.updateBeadPos(this.amplitude, this.frequency, this.endType); 
        

      }
      //All the beads in between
      else if(i>0 && i<this.beadWave.size()-2){ //Beads in the middle of the string
        
        followBead(b, this.beadWave.get(i-1));

        b.updateBeadPos(this.amplitude, this.frequency, "Middle Bead");  
      }
      xCounter += 0.01;
      i++;          
    }
  }   
  
  void initializeBeads(){
    //For loop that repeats once for every bead there is, plus one. 
    //The reason there is a plus one is for the "No End" endType. 
    //What this endType does is it pretends there is another ball in line and it calculates the 2nd force of tension that this imaginary ball has on the real end ball.
    for(int i = 0; i < this.numBeads + 1; i++){
      this.beadWave.add( new Bead( (width/this.numBeads) * i + (width/(2*this.numBeads)), centerLine, 0) );  
    }
  }
  
  
  void followBead(Bead selected, Bead other){
    if(other.pastYValues[this.stringTension * 2] < centerLine){ //If previous bead was above the center line
      selected.beadPos.y = other.pastYValues[this.stringTension] + this.stringDamping;
    }
    else if(other.pastYValues[this.stringTension * 2] > centerLine){
      selected.beadPos.y = other.pastYValues[this.stringTension] - this.stringDamping;      
    }
  }
  
  
}
