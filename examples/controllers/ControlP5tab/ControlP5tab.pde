/**
* ControlP5 Tab
*
*
* find a list of public methods available for the Tab Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(128);

int sliderValue = 100;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  // By default all controllers are stored inside Tab 'default' 
  // add a second tab with name 'extra'
  
  cp5.addTab("extra")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     ;
     
  // if you want to receive a controlEvent when
  // a  tab is clicked, use activeEvent(true)
  
  cp5.getTab("default")
     .activateEvent(true)
     .setLabel("my default tab")
     .setId(1)
     ;

  cp5.getTab("extra")
     .activateEvent(true)
     .setId(2)
     ;

  
  // create a few controllers
  
  cp5.addButton("button")
     .setBroadcast(false)
     .setPosition(100,100)
     .setSize(80,40)
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
  cp5.addButton("buttonValue")
     .setBroadcast(false)
     .setPosition(220,100)
     .setSize(80,40)
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
  
  cp5.addSlider("slider")
     .setBroadcast(false)
     .setRange(100,200)
     .setValue(128)
     .setPosition(100,160)
     .setSize(200,20)
     .setBroadcast(true)
     ;
     
  cp5.addSlider("sliderValue")
     .setBroadcast(false)
     .setRange(0,255)
     .setValue(128)
     .setPosition(100,200)
     .setSize(200,20)
     .setBroadcast(true)
     ;
     
  // arrange controller in separate tabs
  
  cp5.getController("sliderValue").moveTo("extra");
  cp5.getController("slider").moveTo("global");
  
  // Tab 'global' is a tab that lies on top of any 
  // other tab and is always visible
  
}

void draw() {
  background(myColorBackground);
  fill(sliderValue);
  rect(0,0,width,100);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
  }
}

void slider(int theColor) {
  myColorBackground = color(theColor);
  println("a slider event. setting background to "+theColor);
}


void keyPressed() {
  if(keyCode==TAB) {
    cp5.getTab("extra").bringToFront();
  }
}

/*
a list of all methods available for the Tab Controller
use ControlP5.printPublicMethodsFor(Tab.class);
to print the following list into the console.

You can find further details about class Tab in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


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
main.java.controlp5.ControllerGroup : Tab add(ControllerInterface)
main.java.controlp5.ControllerGroup : Tab addListener(ControlListener)
main.java.controlp5.ControllerGroup : Tab bringToFront()
main.java.controlp5.ControllerGroup : Tab bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : Tab close()
main.java.controlp5.ControllerGroup : Tab disableCollapse()
main.java.controlp5.ControllerGroup : Tab enableCollapse()
main.java.controlp5.ControllerGroup : Tab getTab()
main.java.controlp5.ControllerGroup : Tab hide()
main.java.controlp5.ControllerGroup : Tab hideArrow()
main.java.controlp5.ControllerGroup : Tab hideBar()
main.java.controlp5.ControllerGroup : Tab moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : Tab moveTo(PApplet)
main.java.controlp5.ControllerGroup : Tab open()
main.java.controlp5.ControllerGroup : Tab registerProperty(String)
main.java.controlp5.ControllerGroup : Tab registerProperty(String, String)
main.java.controlp5.ControllerGroup : Tab remove(CDrawable)
main.java.controlp5.ControllerGroup : Tab remove(ControllerInterface)
main.java.controlp5.ControllerGroup : Tab removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : Tab removeListener(ControlListener)
main.java.controlp5.ControllerGroup : Tab removeProperty(String)
main.java.controlp5.ControllerGroup : Tab removeProperty(String, String)
main.java.controlp5.ControllerGroup : Tab setAddress(String)
main.java.controlp5.ControllerGroup : Tab setArrayValue(float[])
main.java.controlp5.ControllerGroup : Tab setArrayValue(int, float)
main.java.controlp5.ControllerGroup : Tab setCaptionLabel(String)
main.java.controlp5.ControllerGroup : Tab setColor(CColor)
main.java.controlp5.ControllerGroup : Tab setColorActive(int)
main.java.controlp5.ControllerGroup : Tab setColorBackground(int)
main.java.controlp5.ControllerGroup : Tab setColorForeground(int)
main.java.controlp5.ControllerGroup : Tab setColorLabel(int)
main.java.controlp5.ControllerGroup : Tab setColorValue(int)
main.java.controlp5.ControllerGroup : Tab setHeight(int)
main.java.controlp5.ControllerGroup : Tab setId(int)
main.java.controlp5.ControllerGroup : Tab setLabel(String)
main.java.controlp5.ControllerGroup : Tab setMouseOver(boolean)
main.java.controlp5.ControllerGroup : Tab setMoveable(boolean)
main.java.controlp5.ControllerGroup : Tab setOpen(boolean)
main.java.controlp5.ControllerGroup : Tab setPosition(float, float)
main.java.controlp5.ControllerGroup : Tab setPosition(float[])
main.java.controlp5.ControllerGroup : Tab setSize(int, int)
main.java.controlp5.ControllerGroup : Tab setStringValue(String)
main.java.controlp5.ControllerGroup : Tab setTitle(String)
main.java.controlp5.ControllerGroup : Tab setUpdate(boolean)
main.java.controlp5.ControllerGroup : Tab setValue(float)
main.java.controlp5.ControllerGroup : Tab setVisible(boolean)
main.java.controlp5.ControllerGroup : Tab setWidth(int)
main.java.controlp5.ControllerGroup : Tab show()
main.java.controlp5.ControllerGroup : Tab showArrow()
main.java.controlp5.ControllerGroup : Tab showBar()
main.java.controlp5.ControllerGroup : Tab update()
main.java.controlp5.ControllerGroup : Tab updateAbsolutePosition()
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
main.java.controlp5.Tab : String getStringValue()
main.java.controlp5.Tab : Tab activateEvent(boolean)
main.java.controlp5.Tab : Tab bringToFront()
main.java.controlp5.Tab : Tab moveTo(ControlWindow)
main.java.controlp5.Tab : Tab setActive(boolean)
main.java.controlp5.Tab : Tab setAlwaysActive(boolean)
main.java.controlp5.Tab : Tab setHeight(int)
main.java.controlp5.Tab : Tab setLabel(String)
main.java.controlp5.Tab : Tab setValue(float)
main.java.controlp5.Tab : Tab setWidth(int)
main.java.controlp5.Tab : boolean isActive()
main.java.controlp5.Tab : boolean isAlwaysActive()
main.java.controlp5.Tab : float getValue()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:49

*/


