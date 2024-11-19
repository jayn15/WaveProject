/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void start_button(GButton source, GEvent event) { //_CODE_:startButton:707938:
  reset();
} //_CODE_:startButton:707938:

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window2:405128:
  appc.background(230);
} //_CODE_:window2:405128:

public void amplitude_change(GCustomSlider source, GEvent event) { //_CODE_:changeAmp:771614:
  println("changeAmp - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeAmp:771614:

public void fequency_change(GCustomSlider source, GEvent event) { //_CODE_:changeFeq:283032:
  println("changeFeq - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeFeq:283032:

public void tension_change(GCustomSlider source, GEvent event) { //_CODE_:changeTen:235273:
  println("changeTen - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeTen:235273:

public void damping_change(GCustomSlider source, GEvent event) { //_CODE_:changeDam:585003:
  println("changeDam - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:changeDam:585003:

public void Normal_clicked(GOption source, GEvent event) { //_CODE_:speedNorm:317794:
  println("speedNorm - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:speedNorm:317794:

public void Slow_clicked(GOption source, GEvent event) { //_CODE_:speedSlow:500740:
  println("speedSlow - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:speedSlow:500740:

public void Auto_clicked(GOption source, GEvent event) { //_CODE_:selectAuto:691945:
  println("selectAuto - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:selectAuto:691945:

public void Manual_clicked(GOption source, GEvent event) { //_CODE_:selectManual:273293:
  println("selectManual - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:selectManual:273293:

public void resetFunction_click(GButton source, GEvent event) { //_CODE_:resetFunction:296631:
  println("resetFunction - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:resetFunction:296631:

public void selectFixed(GOption source, GEvent event) { //_CODE_:Fixed:897153:
  println("option1 - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:Fixed:897153:

public void selectLoose(GOption source, GEvent event) { //_CODE_:Loose:524193:
  println("Loose - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:Loose:524193:

public void selectNoEnd(GOption source, GEvent event) { //_CODE_:noEnd:938131:
  println("noEnd - GOption >> GEvent." + event + " @ " + millis());
} //_CODE_:noEnd:938131:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  startButton = new GButton(this, 350, 350, 100, 50);
  startButton.setText("Start");
  startButton.addEventHandler(this, "start_button");
  window2 = GWindow.getWindow(this, "Window title", 0, 0, 400, 350, JAVA2D);
  window2.noLoop();
  window2.setActionOnClose(G4P.KEEP_OPEN);
  window2.addDrawHandler(this, "win_draw2");
  label5 = new GLabel(window2, 20, 20, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Amplitude");
  label5.setOpaque(false);
  label6 = new GLabel(window2, 20, 100, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Fequency");
  label6.setOpaque(false);
  label7 = new GLabel(window2, 20, 180, 80, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Tension");
  label7.setOpaque(false);
  label8 = new GLabel(window2, 20, 260, 80, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Damping");
  label8.setOpaque(false);
  changeAmp = new GCustomSlider(window2, 20, 40, 100, 40, "grey_blue");
  changeAmp.setLimits(100.0, 0.0, 200.0);
  changeAmp.setNumberFormat(G4P.DECIMAL, 2);
  changeAmp.setOpaque(false);
  changeAmp.addEventHandler(this, "amplitude_change");
  changeFeq = new GCustomSlider(window2, 20, 120, 100, 40, "grey_blue");
  changeFeq.setLimits(5.0, 0.0, 10.0);
  changeFeq.setNumberFormat(G4P.DECIMAL, 2);
  changeFeq.setOpaque(false);
  changeFeq.addEventHandler(this, "fequency_change");
  changeTen = new GCustomSlider(window2, 20, 200, 100, 40, "grey_blue");
  changeTen.setLimits(10.0, 0.0, 20.0);
  changeTen.setNumberFormat(G4P.DECIMAL, 2);
  changeTen.setOpaque(false);
  changeTen.addEventHandler(this, "tension_change");
  changeDam = new GCustomSlider(window2, 20, 280, 100, 40, "grey_blue");
  changeDam.setLimits(0.0, 0.0, 10.0);
  changeDam.setNumberFormat(G4P.DECIMAL, 2);
  changeDam.setOpaque(false);
  changeDam.addEventHandler(this, "damping_change");
  togGroup1 = new GToggleGroup();
  speedNorm = new GOption(window2, 200, 30, 120, 20);
  speedNorm.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  speedNorm.setText("Normal");
  speedNorm.setOpaque(false);
  speedNorm.addEventHandler(this, "Normal_clicked");
  speedSlow = new GOption(window2, 200, 50, 120, 20);
  speedSlow.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  speedSlow.setText("Slow Motion");
  speedSlow.setOpaque(false);
  speedSlow.addEventHandler(this, "Slow_clicked");
  togGroup1.addControl(speedNorm);
  speedNorm.setSelected(true);
  togGroup1.addControl(speedSlow);
  togGroup2 = new GToggleGroup();
  selectAuto = new GOption(window2, 200, 90, 120, 20);
  selectAuto.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  selectAuto.setText("Oscillation");
  selectAuto.setOpaque(false);
  selectAuto.addEventHandler(this, "Auto_clicked");
  selectManual = new GOption(window2, 200, 110, 120, 20);
  selectManual.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  selectManual.setText("Manual");
  selectManual.setOpaque(false);
  selectManual.addEventHandler(this, "Manual_clicked");
  togGroup2.addControl(selectAuto);
  selectAuto.setSelected(true);
  togGroup2.addControl(selectManual);
  resetFunction = new GButton(window2, 220, 260, 80, 30);
  resetFunction.setText("Reset");
  resetFunction.addEventHandler(this, "resetFunction_click");
  togGroup3 = new GToggleGroup();
  Fixed = new GOption(window2, 200, 150, 120, 20);
  Fixed.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  Fixed.setText("Fixed End");
  Fixed.setOpaque(false);
  Fixed.addEventHandler(this, "selectFixed");
  Loose = new GOption(window2, 200, 170, 120, 20);
  Loose.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  Loose.setText("Loose End");
  Loose.setOpaque(false);
  Loose.addEventHandler(this, "selectLoose");
  noEnd = new GOption(window2, 200, 190, 120, 20);
  noEnd.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  noEnd.setText("No End");
  noEnd.setOpaque(false);
  noEnd.addEventHandler(this, "selectNoEnd");
  togGroup3.addControl(Fixed);
  Fixed.setSelected(true);
  togGroup3.addControl(Loose);
  togGroup3.addControl(noEnd);
  window2.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton startButton; 
GWindow window2;
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GCustomSlider changeAmp; 
GCustomSlider changeFeq; 
GCustomSlider changeTen; 
GCustomSlider changeDam; 
GToggleGroup togGroup1; 
GOption speedNorm; 
GOption speedSlow; 
GToggleGroup togGroup2; 
GOption selectAuto; 
GOption selectManual; 
GButton resetFunction; 
GToggleGroup togGroup3; 
GOption Fixed; 
GOption Loose; 
GOption noEnd; 
