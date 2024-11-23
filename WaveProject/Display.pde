void displayScreen(){
  if(window.equals("title")){
    frameRate(2.5);
    if (AniCycle == 3){
      background(BG3); //frame 3
      AniCycle = 1;
    }
    else if (AniCycle == 2){
      background(BG2); //frame 2
      AniCycle += 1;
    }
    else {
      background(BG1); //frame 1
      AniCycle += 1;
    }
    titleFont = loadFont("Candara-LightItalic-60.vlw"); //Finds the text font
    textFont(titleFont); //Sets the text font
    fill(50,70,100); //Sets the text colour
    textAlign(CENTER); //Sets the text alignment
    text("The Wave Simulator!", width/2, height-(height-200)); //Draws the title
    window2.setVisible(false); //Hides the second window that contains all the sliders and buttons
  }
  
  //Only runs when the program is set into "play"
  if(window.equals("play")){
    window2.setVisible(true); //Shows the side window with all the slider bars 
    startButton.setVisible(false); //Hids the start button
    //If statement that allows us to pause the program
    if(!pause){ //If pause is not true(false).
      background(135, 206, 235);  //clear the background each frame by setting the colour to sky blue.
      
      newWave.updateWave(); //Updates all the beads in the wave
      newWave.drawWave(); // Draw all the beads in the wave.
    }
  }
}
