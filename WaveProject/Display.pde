<<<<<<< Updated upstream
void displayScreen(){
  
  if(window.equals("title")){
    background(200,240,255);
    titleFont = loadFont("Candara-LightItalic-60.vlw");
    textFont(titleFont);
    fill(50,70,100);
    textAlign(CENTER);
    text("Wave Simulator!", width/2, height-(height-200));
    startButton.setVisible(true);
    //pauseButton.setVisible(false);
    //playButton.setVisible(false);
  }
  
  
  if(window.equals("play")){
    //If statement that allows us to pause the program
    if(!pause){ //If pause is not true(false).
      //pauseButton.setVisible(true);
      background(255);  // clear the background each fram
      
      // Draw all the beads in the wave.
      newWave.updateWave();
      newWave.drawWave();
    }
  }
  
  
}
=======
//void displayScreen(){
  
//  if(window.equals("title")){
//  background(200,240,255);
//  titleFont = loadFont("Candara-LightItalic-60.vlw");
//  textFont(titleFont);
//  fill(50,70,100);
//  textAlign(CENTER);
//  text("Wave Simulator!", width/2, height-(height-200));
//  startButton.setVisible(true);
//  pauseButton.setVisible(false);
//  playButton.setVisible(false);
//  }
  
  
//  if(window.equals("play")){
//    //If statement that allows us to pause the program
//  if(!pause){ //If pause is not true(false).
//    pauseButton.setVisible(true);
//    background(255);  // clear the background each fram
    
//    // Draw all the beads in the wave.
//    newWave.updateWave();
//    newWave.drawWave();
//  }
//  }
  
  
//}
>>>>>>> Stashed changes
