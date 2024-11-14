class Wave{
    //Fields
    ArrayList<Bead> beadWave;
    float amplitude;
    float frequency;
    int numBeads;

    //Constructor
    Wave(float a, float f, int b){
        this.amplitude = a;
        this.frequency = f;
        this.numBeads = b;
        //Create a new arraylist that keeps track of the beads within the wave. 
        this.beadWave = new ArrayList<Bead>();
    }

    //Methods
    void drawWave(){
        //For-loop that goes through every bead in the wave
        int i = 0;
        for(Bead b : this.beadWave){
            //Draws each bead
            b.drawBead();
            
            //Draws lines between beads
            if(i < this.beadWave.size() - 1){
              stroke(255, 0, 0);
              line(b.beadPos.x, b.beadPos.y, this.beadWave.get(i+1).beadPos.x, this.beadWave.get(i+1).beadPos.y);
            }
            
            i++;
        }
    }

    void updateWave(){
       //For-loop that goes through every bead in the wave
       for(Bead b : this.beadWave){
          //Updates each bead based on amplitude and frequency
          b.updateBead(this.amplitude, this.frequency);
       }
    }   
    
    void initializeBeads(){
      for(int i = 0; i < this.numBeads; i++){
        this.beadWave.add( new Bead( (width/this.numBeads) * i + (width/(2*this.numBeads)), height/2, 0) );  
    }
    
    //void simpleWave(){
      //X value stays the same
      //Change the y value
      
      
    //}
  }
}
