/**
* ControlP5 Numberbox
*
*
* find a list of public methods available for the Numberbox Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0,0,0);

public float numberboxValue = 100;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addNumberbox("numberbox")
     .setPosition(100,160)
     .setSize(100,20)
     .setScrollSensitivity(1.1)
     .setValue(50)
     ;
  

  cp5.addNumberbox("numberboxValue")
     .setPosition(100,220)
     .setSize(100,20)
     .setRange(0,200)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(100)
     ;
  
}

void draw() {
  background(myColorBackground);
  fill(numberboxValue);
  rect(0,0,width,100);
}

void numberbox(int theColor) {
  myColorBackground = color(theColor);
  println("a numberbox event. setting background to "+theColor);
}



/*
a list of all methods available for the Numberbox Controller
use ControlP5.printPublicMethodsFor(Numberbox.class);
to print the following list into the console.

You can find further details about class Numberbox in the javadoc.

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
main.java.controlp5.Controller : Numberbox addCallback(CallbackListener)
main.java.controlp5.Controller : Numberbox addListener(ControlListener)
main.java.controlp5.Controller : Numberbox addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Numberbox align(int, int, int, int)
main.java.controlp5.Controller : Numberbox bringToFront()
main.java.controlp5.Controller : Numberbox bringToFront(ControllerInterface)
main.java.controlp5.Controller : Numberbox hide()
main.java.controlp5.Controller : Numberbox linebreak()
main.java.controlp5.Controller : Numberbox listen(boolean)
main.java.controlp5.Controller : Numberbox lock()
main.java.controlp5.Controller : Numberbox onChange(CallbackListener)
main.java.controlp5.Controller : Numberbox onClick(CallbackListener)
main.java.controlp5.Controller : Numberbox onDoublePress(CallbackListener)
main.java.controlp5.Controller : Numberbox onDrag(CallbackListener)
main.java.controlp5.Controller : Numberbox onDraw(ControllerView)
main.java.controlp5.Controller : Numberbox onEndDrag(CallbackListener)
main.java.controlp5.Controller : Numberbox onEnter(CallbackListener)
main.java.controlp5.Controller : Numberbox onLeave(CallbackListener)
main.java.controlp5.Controller : Numberbox onMove(CallbackListener)
main.java.controlp5.Controller : Numberbox onPress(CallbackListener)
main.java.controlp5.Controller : Numberbox onRelease(CallbackListener)
main.java.controlp5.Controller : Numberbox onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Numberbox onStartDrag(CallbackListener)
main.java.controlp5.Controller : Numberbox onWheel(CallbackListener)
main.java.controlp5.Controller : Numberbox plugTo(Object)
main.java.controlp5.Controller : Numberbox plugTo(Object, String)
main.java.controlp5.Controller : Numberbox plugTo(Object[])
main.java.controlp5.Controller : Numberbox plugTo(Object[], String)
main.java.controlp5.Controller : Numberbox registerProperty(String)
main.java.controlp5.Controller : Numberbox registerProperty(String, String)
main.java.controlp5.Controller : Numberbox registerTooltip(String)
main.java.controlp5.Controller : Numberbox removeBehavior()
main.java.controlp5.Controller : Numberbox removeCallback()
main.java.controlp5.Controller : Numberbox removeCallback(CallbackListener)
main.java.controlp5.Controller : Numberbox removeListener(ControlListener)
main.java.controlp5.Controller : Numberbox removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Numberbox removeListenersFor(int)
main.java.controlp5.Controller : Numberbox removeProperty(String)
main.java.controlp5.Controller : Numberbox removeProperty(String, String)
main.java.controlp5.Controller : Numberbox setArrayValue(float[])
main.java.controlp5.Controller : Numberbox setArrayValue(int, float)
main.java.controlp5.Controller : Numberbox setBehavior(ControlBehavior)
main.java.controlp5.Controller : Numberbox setBroadcast(boolean)
main.java.controlp5.Controller : Numberbox setCaptionLabel(String)
main.java.controlp5.Controller : Numberbox setColor(CColor)
main.java.controlp5.Controller : Numberbox setColorActive(int)
main.java.controlp5.Controller : Numberbox setColorBackground(int)
main.java.controlp5.Controller : Numberbox setColorCaptionLabel(int)
main.java.controlp5.Controller : Numberbox setColorForeground(int)
main.java.controlp5.Controller : Numberbox setColorLabel(int)
main.java.controlp5.Controller : Numberbox setColorValue(int)
main.java.controlp5.Controller : Numberbox setColorValueLabel(int)
main.java.controlp5.Controller : Numberbox setDecimalPrecision(int)
main.java.controlp5.Controller : Numberbox setDefaultValue(float)
main.java.controlp5.Controller : Numberbox setHeight(int)
main.java.controlp5.Controller : Numberbox setId(int)
main.java.controlp5.Controller : Numberbox setImage(PImage)
main.java.controlp5.Controller : Numberbox setImage(PImage, int)
main.java.controlp5.Controller : Numberbox setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Numberbox setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Numberbox setLabel(String)
main.java.controlp5.Controller : Numberbox setLabelVisible(boolean)
main.java.controlp5.Controller : Numberbox setLock(boolean)
main.java.controlp5.Controller : Numberbox setMax(float)
main.java.controlp5.Controller : Numberbox setMin(float)
main.java.controlp5.Controller : Numberbox setMouseOver(boolean)
main.java.controlp5.Controller : Numberbox setMoveable(boolean)
main.java.controlp5.Controller : Numberbox setPosition(float, float)
main.java.controlp5.Controller : Numberbox setPosition(float[])
main.java.controlp5.Controller : Numberbox setSize(PImage)
main.java.controlp5.Controller : Numberbox setSize(int, int)
main.java.controlp5.Controller : Numberbox setStringValue(String)
main.java.controlp5.Controller : Numberbox setUpdate(boolean)
main.java.controlp5.Controller : Numberbox setValue(float)
main.java.controlp5.Controller : Numberbox setValueLabel(String)
main.java.controlp5.Controller : Numberbox setValueSelf(float)
main.java.controlp5.Controller : Numberbox setView(ControllerView)
main.java.controlp5.Controller : Numberbox setVisible(boolean)
main.java.controlp5.Controller : Numberbox setWidth(int)
main.java.controlp5.Controller : Numberbox show()
main.java.controlp5.Controller : Numberbox unlock()
main.java.controlp5.Controller : Numberbox unplugFrom(Object)
main.java.controlp5.Controller : Numberbox unplugFrom(Object[])
main.java.controlp5.Controller : Numberbox unregisterTooltip()
main.java.controlp5.Controller : Numberbox update()
main.java.controlp5.Controller : Numberbox updateSize()
main.java.controlp5.Controller : Pointer getPointer()
main.java.controlp5.Controller : String getAddress()
main.java.controlp5.Controller : String getInfo()
main.java.controlp5.Controller : String getName()
main.java.controlp5.Controller : String getStringValue()
main.java.controlp5.Controller : String toString()
main.java.controlp5.Controller : Tab getTab()
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
main.java.controlp5.Numberbox : Numberbox linebreak()
main.java.controlp5.Numberbox : Numberbox setDirection(int)
main.java.controlp5.Numberbox : Numberbox setMultiplier(float)
main.java.controlp5.Numberbox : Numberbox setRange(float, float)
main.java.controlp5.Numberbox : Numberbox setScrollSensitivity(float)
main.java.controlp5.Numberbox : Numberbox setValue(float)
main.java.controlp5.Numberbox : Numberbox shuffle()
main.java.controlp5.Numberbox : Numberbox update()
main.java.controlp5.Numberbox : float getMultiplier()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:44

*/


