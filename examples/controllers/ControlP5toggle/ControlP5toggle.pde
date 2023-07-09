
/**
* ControlP5 Toggle
*
*
* find a list of public methods available for the Toggle Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2011
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

int col = color(255);

boolean toggleValue = false;

void setup() {
  size(400,400);
  smooth();
  cp5 = new ControlP5(this);
  
  // create a toggle
  cp5.addToggle("toggleValue")
     .setPosition(40,100)
     .setSize(50,20)
     ;
  
  // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("toggle")
     .setPosition(40,250)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
     
}
  

void draw() {
  background(0);
  
  pushMatrix();
  
  if(toggleValue==true) {
    fill(255,255,220);
  } else {
    fill(128,128,110);
  }
  translate(280,100);
  ellipse(0,0,100,100);
  
  
  translate(0,150);
  fill(col);
  ellipse(0,0,40,40);
  
  popMatrix();
}



void toggle(boolean theFlag) {
  if(theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  println("a toggle event.");
}






/*
a list of all methods available for the Toggle Controller
use ControlP5.printPublicMethodsFor(Toggle.class);
to print the following list into the console.

You can find further details about class Toggle in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ControlBehavior getBehavior()
main.java.controlp5.Controller : ControlWindow getControlWindow()
main.java.controlp5.Controller : ControlWindow getWindow()
main.java.controlp5.Controller : ControllerProperty getProperty(String)
main.java.controlp5.Controller : ControllerProperty getProperty(String, String)
main.java.controlp5.Controller : ControllerView getView()
main.java.controlp5.Controller : Label getCaptionLabel()
main.java.controlp5.Controller : Label getValueLabel()
main.java.controlp5.Controller : List getControllerPlugList()
main.java.controlp5.Controller : Pointer getPointer()
main.java.controlp5.Controller : String getAddress()
main.java.controlp5.Controller : String getInfo()
main.java.controlp5.Controller : String getName()
main.java.controlp5.Controller : String getStringValue()
main.java.controlp5.Controller : String toString()
main.java.controlp5.Controller : Tab getTab()
main.java.controlp5.Controller : Toggle addCallback(CallbackListener)
main.java.controlp5.Controller : Toggle addListener(ControlListener)
main.java.controlp5.Controller : Toggle addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Toggle align(int, int, int, int)
main.java.controlp5.Controller : Toggle bringToFront()
main.java.controlp5.Controller : Toggle bringToFront(ControllerInterface)
main.java.controlp5.Controller : Toggle hide()
main.java.controlp5.Controller : Toggle linebreak()
main.java.controlp5.Controller : Toggle listen(boolean)
main.java.controlp5.Controller : Toggle lock()
main.java.controlp5.Controller : Toggle onChange(CallbackListener)
main.java.controlp5.Controller : Toggle onClick(CallbackListener)
main.java.controlp5.Controller : Toggle onDoublePress(CallbackListener)
main.java.controlp5.Controller : Toggle onDrag(CallbackListener)
main.java.controlp5.Controller : Toggle onDraw(ControllerView)
main.java.controlp5.Controller : Toggle onEndDrag(CallbackListener)
main.java.controlp5.Controller : Toggle onEnter(CallbackListener)
main.java.controlp5.Controller : Toggle onLeave(CallbackListener)
main.java.controlp5.Controller : Toggle onMove(CallbackListener)
main.java.controlp5.Controller : Toggle onPress(CallbackListener)
main.java.controlp5.Controller : Toggle onRelease(CallbackListener)
main.java.controlp5.Controller : Toggle onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Toggle onStartDrag(CallbackListener)
main.java.controlp5.Controller : Toggle onWheel(CallbackListener)
main.java.controlp5.Controller : Toggle plugTo(Object)
main.java.controlp5.Controller : Toggle plugTo(Object, String)
main.java.controlp5.Controller : Toggle plugTo(Object[])
main.java.controlp5.Controller : Toggle plugTo(Object[], String)
main.java.controlp5.Controller : Toggle registerProperty(String)
main.java.controlp5.Controller : Toggle registerProperty(String, String)
main.java.controlp5.Controller : Toggle registerTooltip(String)
main.java.controlp5.Controller : Toggle removeBehavior()
main.java.controlp5.Controller : Toggle removeCallback()
main.java.controlp5.Controller : Toggle removeCallback(CallbackListener)
main.java.controlp5.Controller : Toggle removeListener(ControlListener)
main.java.controlp5.Controller : Toggle removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Toggle removeListenersFor(int)
main.java.controlp5.Controller : Toggle removeProperty(String)
main.java.controlp5.Controller : Toggle removeProperty(String, String)
main.java.controlp5.Controller : Toggle setArrayValue(float[])
main.java.controlp5.Controller : Toggle setArrayValue(int, float)
main.java.controlp5.Controller : Toggle setBehavior(ControlBehavior)
main.java.controlp5.Controller : Toggle setBroadcast(boolean)
main.java.controlp5.Controller : Toggle setCaptionLabel(String)
main.java.controlp5.Controller : Toggle setColor(CColor)
main.java.controlp5.Controller : Toggle setColorActive(int)
main.java.controlp5.Controller : Toggle setColorBackground(int)
main.java.controlp5.Controller : Toggle setColorCaptionLabel(int)
main.java.controlp5.Controller : Toggle setColorForeground(int)
main.java.controlp5.Controller : Toggle setColorLabel(int)
main.java.controlp5.Controller : Toggle setColorValue(int)
main.java.controlp5.Controller : Toggle setColorValueLabel(int)
main.java.controlp5.Controller : Toggle setDecimalPrecision(int)
main.java.controlp5.Controller : Toggle setDefaultValue(float)
main.java.controlp5.Controller : Toggle setHeight(int)
main.java.controlp5.Controller : Toggle setId(int)
main.java.controlp5.Controller : Toggle setImage(PImage)
main.java.controlp5.Controller : Toggle setImage(PImage, int)
main.java.controlp5.Controller : Toggle setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Toggle setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Toggle setLabel(String)
main.java.controlp5.Controller : Toggle setLabelVisible(boolean)
main.java.controlp5.Controller : Toggle setLock(boolean)
main.java.controlp5.Controller : Toggle setMax(float)
main.java.controlp5.Controller : Toggle setMin(float)
main.java.controlp5.Controller : Toggle setMouseOver(boolean)
main.java.controlp5.Controller : Toggle setMoveable(boolean)
main.java.controlp5.Controller : Toggle setPosition(float, float)
main.java.controlp5.Controller : Toggle setPosition(float[])
main.java.controlp5.Controller : Toggle setSize(PImage)
main.java.controlp5.Controller : Toggle setSize(int, int)
main.java.controlp5.Controller : Toggle setStringValue(String)
main.java.controlp5.Controller : Toggle setUpdate(boolean)
main.java.controlp5.Controller : Toggle setValue(float)
main.java.controlp5.Controller : Toggle setValueLabel(String)
main.java.controlp5.Controller : Toggle setValueSelf(float)
main.java.controlp5.Controller : Toggle setView(ControllerView)
main.java.controlp5.Controller : Toggle setVisible(boolean)
main.java.controlp5.Controller : Toggle setWidth(int)
main.java.controlp5.Controller : Toggle show()
main.java.controlp5.Controller : Toggle unlock()
main.java.controlp5.Controller : Toggle unplugFrom(Object)
main.java.controlp5.Controller : Toggle unplugFrom(Object[])
main.java.controlp5.Controller : Toggle unregisterTooltip()
main.java.controlp5.Controller : Toggle update()
main.java.controlp5.Controller : Toggle updateSize()
main.java.controlp5.Controller : boolean isActive()
main.java.controlp5.Controller : boolean isBroadcast()
main.java.controlp5.Controller : boolean isInside()
main.java.controlp5.Controller : boolean isLabelVisible()
main.java.controlp5.Controller : boolean isListening()
main.java.controlp5.Controller : boolean isLock()
main.java.controlp5.Controller : boolean isMouseOver()
main.java.controlp5.Controller : boolean isMousePressed()
main.java.controlp5.Controller : boolean isMoveable()
main.java.controlp5.Controller : boolean isUpdate()
main.java.controlp5.Controller : boolean isVisible()
main.java.controlp5.Controller : float getArrayValue(int)
main.java.controlp5.Controller : float getDefaultValue()
main.java.controlp5.Controller : float getMax()
main.java.controlp5.Controller : float getMin()
main.java.controlp5.Controller : float getValue()
main.java.controlp5.Controller : float[] getAbsolutePosition()
main.java.controlp5.Controller : float[] getArrayValue()
main.java.controlp5.Controller : float[] getPosition()
main.java.controlp5.Controller : int getDecimalPrecision()
main.java.controlp5.Controller : int getHeight()
main.java.controlp5.Controller : int getId()
main.java.controlp5.Controller : int getWidth()
main.java.controlp5.Controller : int listenerSize()
main.java.controlp5.Controller : void remove()
main.java.controlp5.Controller : void setView(ControllerView, int)
main.java.controlp5.Toggle : Toggle linebreak()
main.java.controlp5.Toggle : Toggle setMode(int)
main.java.controlp5.Toggle : Toggle setState(boolean)
main.java.controlp5.Toggle : Toggle setValue(boolean)
main.java.controlp5.Toggle : Toggle setValue(float)
main.java.controlp5.Toggle : Toggle toggle()
main.java.controlp5.Toggle : Toggle update()
main.java.controlp5.Toggle : boolean getBooleanValue()
main.java.controlp5.Toggle : boolean getState()
main.java.controlp5.Toggle : int getMode()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:35

*/


