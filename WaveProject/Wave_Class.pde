class Wave{
  //Fields
  ArrayList<Bead> beadWave;
  float amplitude;
  float frequency;
  float stringTension;
  float stringDamping;
  int numBeads;
  String startType;
  String endType;
  float yAcceleration;

  //Constructor
  Wave(float a, float f, float t, float d, int b, String s, String e){
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
       //Updates each bead based on amplitude, frequency, acceleration and start/end types
       //First bead
       if(i == 0){
         b.updateBeadPos(this.amplitude, this.frequency, 0, this.startType);  
       }
       //Last bead
       else if(i == this.beadWave.size()-2){ //The reason it is -2 is because it refers to the second last ball in the string. It is really the last ball that the user can see, but there is an additional ball to facilitate the process for the no end endType. 
         float yAcc = calculateForces( b, this.beadWave.get(i-1), b );
         b.updateBeadPos(this.amplitude, this.frequency, yAcc, this.endType);            
       }
       //All the beads in between
       else if(i>0 && i<this.beadWave.size()-2){ //Beads in the middle of the string
         float yAcc = calculateForces(b, this.beadWave.get(i-1), this.beadWave.get(i+1) );
         b.updateBeadPos(this.amplitude, this.frequency, yAcc, "Middle Bead");    
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
  
  float calculateForces(Bead selected, Bead other, Bead next){
    //other bead is the bead that come before.
    //this bead is the current bead. 
    
    //Calculating the force of tension
    //The max/ceiling that this force will be is represented by the variable stringTension
          
    //Find the PVector of tension force based on the two points. 
    float forceTension = (PVector.dist(other.beadPos, selected.beadPos) - width/this.numBeads) * this.stringTension;
    float forceTension2 = (PVector.dist(selected.beadPos, next.beadPos) - width/this.numBeads) * this.stringTension;
    
    
    //Calculate damping forces
    //All the beads will gradually fall back to the center line
    float forceDamping = (selected.beadPos.y - centerLine) * this.stringDamping;
    
    //Calculate angle theta
    //float theta = asin( (other.beadPos.x - selected.beadPos.x)/PVector.dist(other.beadPos, selected.beadPos) );
    float theta = atan( (other.beadPos.y - selected.beadPos.y)/(other.beadPos.x - selected.beadPos.x) );
    
    //Calculates the y acceleration using Fnet = ma in terms of y
    //FY = FTY - FTY2 - FDamp
    //FY = m x ay
    //m x ay = FTcos(theta) - FT2cos(theta) - FDamp
    //ay = ( FTcos(theta) - FT2cos(theta) - FDamp ) / m    
    
    float FTy;
    float FTy2;
    float Fd;
    
    if(other.beadPos.y < selected.beadPos.y){
      if(selected.beadPos.y < next.beadPos.y){
        FTy = forceTension*cos(theta);
        FTy2 = - forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else if(selected.beadPos.y > next.beadPos.y){
        FTy = forceTension*cos(theta);
        FTy2 = forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else{ //selected.beadPos.y = next.beadPos.y
        FTy = forceTension*cos(theta);
        FTy2 = 0;
        Fd = forceDamping;   
      }
    }
    else if(other.beadPos.y > selected.beadPos.y){
      if(selected.beadPos.y > next.beadPos.y){
        FTy = -forceTension*cos(theta);
        FTy2 = forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else if(selected.beadPos.y < next.beadPos.y){
        FTy = - forceTension*cos(theta);
        FTy2 = - forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else{ //selected.beadPos.y = next.beadPos.y
        FTy = -forceTension*cos(theta);
        FTy2 = 0;
        Fd = forceDamping;
      }
    }
    else{ //other.beadPos.y == selected.beadPos.y
      if(selected.beadPos.y < next.beadPos.y){
        FTy = 0;
        FTy2 = - forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else if(selected.beadPos.y > next.beadPos.y){
        FTy = 0;
        FTy2 = forceTension2*cos(theta);
        Fd = forceDamping;
      }
      else{ //selected.beadPos.y = next.beadPos.y
        FTy = 0;
        FTy2 = 0;
        Fd = forceDamping;
      }
    }
    float yAcceleration = -(1.5*FTy + FTy2 + Fd) / selected.mass;
    return yAcceleration; 
    
  }
}
