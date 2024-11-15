/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to eynter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void start_button(GButton source, GEvent event) { //_CODE_:startButton:312855:
  //reset();
} //_CODE_:startButton:312855:

public void amplitude(GCustomSlider source, GEvent event) { //_CODE_:changeAmp:534109:
  println("Amplitude - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeAmp:534109:

public void feequency(GCustomSlider source, GEvent event) { //_CODE_:changeFreq:814062:
  println("custom_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeFreq:814062:

public void Tension(GCustomSlider source, GEvent event) { //_CODE_:changeTen:322672:
  println("Tension - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeTen:322672:

public void Number_of_Beads(GCustomSlider source, GEvent event) { //_CODE_:numberBeads:798573:
  println("Number_of_Beads - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:numberBeads:798573:

public void changeNormal(GOption source, GEvent event) { //_CODE_:Normal:683628:
  println("Normal - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:Normal:683628:

public void changeSlow(GOption source, GEvent event) { //_CODE_:Slow_Motion:204384:
  println("Slow_Motion - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:Slow_Motion:204384:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  startButton = new GButton(this, 182, 399, 80, 30);
  startButton.setText("Start");
  startButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  startButton.addEventHandler(this, "start_button");
  changeAmp = new GCustomSlider(this, 29, 40, 100, 40, "grey_blue");
  changeAmp.setLimits(100.0, 0.0, 200.0);
  changeAmp.setNumberFormat(G4P.DECIMAL, 2);
  changeAmp.setOpaque(false);
  changeAmp.addEventHandler(this, "amplitude");
  changeFreq = new GCustomSlider(this, 28, 107, 100, 40, "grey_blue");
  changeFreq.setLimits(10.0, 0.5, 20.0);
  changeFreq.setNumberFormat(G4P.DECIMAL, 2);
  changeFreq.setOpaque(false);
  changeFreq.addEventHandler(this, "feequency");
  changeTen = new GCustomSlider(this, 26, 174, 100, 40, "grey_blue");
  changeTen.setLimits(0.5, 0.0, 1.0);
  changeTen.setNumberFormat(G4P.DECIMAL, 2);
  changeTen.setOpaque(false);
  changeTen.addEventHandler(this, "Tension");
  numberBeads = new GCustomSlider(this, 26, 249, 100, 40, "grey_blue");
  numberBeads.setLimits(3.0, 3.0, 100.0);
  numberBeads.setNumberFormat(G4P.DECIMAL, 2);
  numberBeads.setOpaque(false);
  numberBeads.addEventHandler(this, "Number_of_Beads");
  togGroup3 = new GToggleGroup();
  Normal = new GOption(this, 228, 47, 120, 20);
  Normal.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  Normal.setText("Normal");
  Normal.setOpaque(false);
  Normal.addEventHandler(this, "changeNormal");
  Slow_Motion = new GOption(this, 228, 67, 120, 21);
  Slow_Motion.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  Slow_Motion.setText("Slow Motion");
  Slow_Motion.setOpaque(false);
  Slow_Motion.addEventHandler(this, "changeSlow");
  togGroup3.addControl(Normal);
  Normal.setSelected(true);
  togGroup3.addControl(Slow_Motion);
  label1 = new GLabel(this, 17, 18, 79, 22);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Amplitude");
  label1.setOpaque(false);
  label2 = new GLabel(this, 19, 87, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Frequency");
  label2.setOpaque(false);
  label3 = new GLabel(this, 24, 228, 100, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Number of Beads");
  label3.setOpaque(false);
  label6 = new GLabel(this, 10, 153, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Tension");
  label6.setOpaque(false);
  label5 = new GLabel(this, 206, 27, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Speed");
  label5.setOpaque(false);
  label4 = new GLabel(this, 202, 123, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Mode");
  label4.setOpaque(false);
  togGroup1 = new GToggleGroup();
  togGroup2 = new GToggleGroup();
  togGroup4 = new GToggleGroup();
}

// Variable declarations 
// autogenerated do not edit
GButton startButton; 
GCustomSlider changeAmp; 
GCustomSlider changeFreq; 
GCustomSlider changeTen; 
GCustomSlider numberBeads; 
GToggleGroup togGroup3; 
GOption Normal; 
GOption Slow_Motion; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GLabel label6; 
GLabel label5; 
GLabel label4; 
GToggleGroup togGroup1; 
GToggleGroup togGroup2; 
GToggleGroup togGroup4; 
