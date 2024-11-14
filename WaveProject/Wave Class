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
        for(Bead b : this.beadWave){
            //Draws each bead
            b.drawBead();
        }
    }

    void updateWave(){
       //For-loop that goes through every bead in the wave
       for(Bead b : this.beadWave){
            //Updates each bead based on amplitude and frequency
            b.updateBead(this.amplitude, this.frequency);
       }
    }   
}