void displayScreen(){
  
  if(window.equals("title")){
  background(200,240,255);
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
