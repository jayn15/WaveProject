class Bead{
    //Fields
    PVector beadPos;
    PVector beadVel;
    Color beadCol;
    int radius;

    //Constructor
    Bead(int x, int y, color c){
        this.beadPos = new PVetor(x, y);
        this.radius = 25; //Sets the radius for every bead to 25. 
        this.beadCol = c;
    }

    //Methods
    void drawBead(){
        //Colours the beads with previously determined colour
        fill(this.beadCol);
        //Draws the bead at preset x and y values with specified radius. 
        circle(this.beadPos.x, this.beadPos.y, this.radius);
    }
    
    void updateBead(float a, float f){
        //Updates the bead's position by adding the bead's velocity. 
        //We want it to update the bead's position based on amplitude and frequency. 
        this.beadPos.add(this.beadVel);
    }

}
