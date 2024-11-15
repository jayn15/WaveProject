class Bead{
    //Fields
    PVector beadPos;
    PVector beadVel;
    color beadCol;
    int radius;

    //Constructor
    Bead(int x, int y, color c){
        this.beadPos = new PVector(x, y);
        this.radius = 10; //Sets the radius for every bead to 25. 
        this.beadCol = c;
    }

    //Methods
    void drawBead(){
        //Colours the beads with previously determined colour
        fill(this.beadCol);
        //Draws the bead at preset x and y values with specified radius. 
        circle(this.beadPos.x, this.beadPos.y, this.radius);
    }
    
    //Bead method that updates the bead position based on amplitude and frequency. 
    void updateBead(float a, float f){
      //X value stays the same
      //Change the y value
      float x = this.beadPos.x + xCounter;
      
      //Will need to change this to make it based of string tension forces rather than a sine wave equation. 
      //What I will need to do is calculate the force of tension in the rope between two beads, then use stringTension as the max ceiling. 
      this.beadPos.y = -a * sin(1/f * x) + height/2; 
    }

}
