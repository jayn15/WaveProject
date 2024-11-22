void displayScreen(){
  
  if(window.equals("title")){
  frameRate(2);
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
  titleFont = loadFont("Candara-LightItalic-60.vlw");
  textFont(titleFont);
  fill(50,70,100);
  textAlign(CENTER);
  text("Wave Simulator!", width/2, height-(height-200));
  window2.setVisible(false);
  }
  
  
  if(window.equals("play")){
    window2.setVisible(true);
    startButton.setVisible(false);
    //If statement that allows us to pause the program
  if(!pause){ //If pause is not true(false).
    background(255);  // clear the background each frame
    
    // Draw all the beads in the wave.
    newWave.updateWave();
    newWave.drawWave();
  }
  }
}
