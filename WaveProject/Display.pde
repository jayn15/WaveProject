void displayScreen(){
  
  if(window.equals("title")){
  background(200,240,255);
  titleFont = loadFont("Candara-LightItalic-60.vlw");
  textFont(titleFont);
  fill(50,70,100);
  textAlign(CENTER);
  text("Wave Simulator!", width/2, height-(height-200));
  //startButton.setVisible(true);
  }
  
  
  if(window.equals("play")){
    startButton.setVisible(false);
    //If statement that allows us to pause the program
  if(!pause){ //If pause is not true(false).
    background(255);  // clear the background each fram
    
    // Draw all the beads in the wave.
    newWave.updateWave();
    newWave.drawWave();
  }
  }
}
