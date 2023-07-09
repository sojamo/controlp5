/**
* ControlP5 Background
*
*
* find a list of public methods available for the Group Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2014
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;
int v1;
boolean lines = true;

void setup() {
  size(800, 400);  
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.begin(cp5.addBackground("abc"));
  
  cp5.addSlider("v1")
     .setPosition(10, 20)
     .setSize(200, 20)
     .setRange(100, 300)
     .setValue(250)
     ;
  
  cp5.addToggle("lines")
     .setPosition(10,50)
     .setSize(80,20)
     .setMode(Toggle.SWITCH)
     ;
     
  cp5.end();

}

void draw() {
  background(200, 200, 200);

  pushMatrix();

  pushMatrix();
  fill(255, 255, 0);
  rect(v1, 100, 60, 200);
  fill(0, 255, 110);
  rect(40, v1, 320, 40);
  translate(200, 200);
  rotate(map(v1, 100, 300, -PI, PI));
  fill(255, 0, 128);
  rect(0, 0, 100, 100);
  popMatrix();

  if(lines) {
  translate(600, 100);
  for (int i=0; i<20; i++) {
    pushMatrix();
    fill(255);
    translate(0, i*10);
    rotate(map(v1+i, 0, 300, -PI, PI));
    rect(-150, 0, 300, 4);
    popMatrix();
  }
  }

  popMatrix();
}

/*
a list of all methods available for the Background Controller
use ControlP5.printPublicMethodsFor(Background.class);
to print the following list into the console.

You can find further details about class Background in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ControlGroup : Background activateEvent(boolean)
main.java.controlp5.ControlGroup : Background addListener(ControlListener)
main.java.controlp5.ControlGroup : Background removeListener(ControlListener)
main.java.controlp5.ControlGroup : Background setBackgroundColor(int)
main.java.controlp5.ControlGroup : Background setBackgroundHeight(int)
main.java.controlp5.ControlGroup : Background setBarHeight(int)
main.java.controlp5.ControlGroup : Background setSize(int, int)
main.java.controlp5.ControlGroup : Background updateInternalEvents(PApplet)
main.java.controlp5.ControlGroup : String getInfo()
main.java.controlp5.ControlGroup : String toString()
main.java.controlp5.ControlGroup : int getBackgroundHeight()
main.java.controlp5.ControlGroup : int getBarHeight()
main.java.controlp5.ControlGroup : int listenerSize()
main.java.controlp5.ControllerGroup : Background add(ControllerInterface)
main.java.controlp5.ControllerGroup : Background addListener(ControlListener)
main.java.controlp5.ControllerGroup : Background bringToFront()
main.java.controlp5.ControllerGroup : Background bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : Background close()
main.java.controlp5.ControllerGroup : Background disableCollapse()
main.java.controlp5.ControllerGroup : Background enableCollapse()
main.java.controlp5.ControllerGroup : Background hide()
main.java.controlp5.ControllerGroup : Background hideArrow()
main.java.controlp5.ControllerGroup : Background hideBar()
main.java.controlp5.ControllerGroup : Background moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : Background moveTo(PApplet)
main.java.controlp5.ControllerGroup : Background open()
main.java.controlp5.ControllerGroup : Background registerProperty(String)
main.java.controlp5.ControllerGroup : Background registerProperty(String, String)
main.java.controlp5.ControllerGroup : Background remove(CDrawable)
main.java.controlp5.ControllerGroup : Background remove(ControllerInterface)
main.java.controlp5.ControllerGroup : Background removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : Background removeListener(ControlListener)
main.java.controlp5.ControllerGroup : Background removeProperty(String)
main.java.controlp5.ControllerGroup : Background removeProperty(String, String)
main.java.controlp5.ControllerGroup : Background setAddress(String)
main.java.controlp5.ControllerGroup : Background setArrayValue(float[])
main.java.controlp5.ControllerGroup : Background setArrayValue(int, float)
main.java.controlp5.ControllerGroup : Background setCaptionLabel(String)
main.java.controlp5.ControllerGroup : Background setColor(CColor)
main.java.controlp5.ControllerGroup : Background setColorActive(int)
main.java.controlp5.ControllerGroup : Background setColorBackground(int)
main.java.controlp5.ControllerGroup : Background setColorForeground(int)
main.java.controlp5.ControllerGroup : Background setColorLabel(int)
main.java.controlp5.ControllerGroup : Background setColorValue(int)
main.java.controlp5.ControllerGroup : Background setHeight(int)
main.java.controlp5.ControllerGroup : Background setId(int)
main.java.controlp5.ControllerGroup : Background setLabel(String)
main.java.controlp5.ControllerGroup : Background setMouseOver(boolean)
main.java.controlp5.ControllerGroup : Background setMoveable(boolean)
main.java.controlp5.ControllerGroup : Background setOpen(boolean)
main.java.controlp5.ControllerGroup : Background setPosition(float, float)
main.java.controlp5.ControllerGroup : Background setPosition(float[])
main.java.controlp5.ControllerGroup : Background setSize(int, int)
main.java.controlp5.ControllerGroup : Background setStringValue(String)
main.java.controlp5.ControllerGroup : Background setTitle(String)
main.java.controlp5.ControllerGroup : Background setUpdate(boolean)
main.java.controlp5.ControllerGroup : Background setValue(float)
main.java.controlp5.ControllerGroup : Background setVisible(boolean)
main.java.controlp5.ControllerGroup : Background setWidth(int)
main.java.controlp5.ControllerGroup : Background show()
main.java.controlp5.ControllerGroup : Background showArrow()
main.java.controlp5.ControllerGroup : Background showBar()
main.java.controlp5.ControllerGroup : Background update()
main.java.controlp5.ControllerGroup : Background updateAbsolutePosition()
main.java.controlp5.ControllerGroup : CColor getColor()
main.java.controlp5.ControllerGroup : Canvas addCanvas(Canvas)
main.java.controlp5.ControllerGroup : ControlWindow getWindow()
main.java.controlp5.ControllerGroup : Controller getController(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String, String)
main.java.controlp5.ControllerGroup : Label getCaptionLabel()
main.java.controlp5.ControllerGroup : Label getValueLabel()
main.java.controlp5.ControllerGroup : String getAddress()
main.java.controlp5.ControllerGroup : String getInfo()
main.java.controlp5.ControllerGroup : String getName()
main.java.controlp5.ControllerGroup : String getStringValue()
main.java.controlp5.ControllerGroup : String toString()
main.java.controlp5.ControllerGroup : Tab getTab()
main.java.controlp5.ControllerGroup : boolean isBarVisible()
main.java.controlp5.ControllerGroup : boolean isCollapse()
main.java.controlp5.ControllerGroup : boolean isMouseOver()
main.java.controlp5.ControllerGroup : boolean isMoveable()
main.java.controlp5.ControllerGroup : boolean isOpen()
main.java.controlp5.ControllerGroup : boolean isUpdate()
main.java.controlp5.ControllerGroup : boolean isVisible()
main.java.controlp5.ControllerGroup : boolean setMousePressed(boolean)
main.java.controlp5.ControllerGroup : float getArrayValue(int)
main.java.controlp5.ControllerGroup : float getValue()
main.java.controlp5.ControllerGroup : float[] getArrayValue()
main.java.controlp5.ControllerGroup : float[] getPosition()
main.java.controlp5.ControllerGroup : int getHeight()
main.java.controlp5.ControllerGroup : int getId()
main.java.controlp5.ControllerGroup : int getWidth()
main.java.controlp5.ControllerGroup : int listenerSize()
main.java.controlp5.ControllerGroup : void controlEvent(ControlEvent)
main.java.controlp5.ControllerGroup : void remove()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:35

*/


