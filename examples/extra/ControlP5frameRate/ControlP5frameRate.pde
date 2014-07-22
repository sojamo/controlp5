/**
 * ControlP5 FrameRate
 *
 *
 * uses a textlabel to display the current or average 
 * framerate of the sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */


import controlP5.*;

ControlP5 cp5;

void setup() {
  size(400,500);
  frameRate(60);
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10);
  
}

void draw() {
  background(129);
}
