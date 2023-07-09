/**
* ControlP5 Knob
*
*
* find a list of public methods available for the Knob Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;


ControlP5 cp5;

int myColorBackground = color(0,0,0);
int knobValue = 100;

Knob myKnobA;
Knob myKnobB;

void setup() {
  size(700,400);
  smooth();
  noStroke();
  
  cp5 = new ControlP5(this);
  
  myKnobA = cp5.addKnob("knob")
               .setRange(0,255)
               .setValue(50)
               .setPosition(100,70)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
                     
  myKnobB = cp5.addKnob("knobValue")
               .setRange(0,255)
               .setValue(220)
               .setPosition(100,210)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               ;
}

void draw() {
  background(myColorBackground);
  fill(knobValue);
  rect(0,height/2,width,height/2);
  fill(0,100);
  rect(80,40,140,320);
}


void knob(int theValue) {
  myColorBackground = color(theValue);
  println("a knob event. setting background to "+theValue);
}


void keyPressed() {
  switch(key) {
    case('1'):myKnobA.setValue(180);break;
    case('2'):myKnobB.setConstrained(false).hideTickMarks().snapToTickMarks(false);break;
    case('3'):myKnobA.shuffle();myKnobB.shuffle();break;
  }
  
}

/*
a list of all methods available for the Knob Controller
use ControlP5.printPublicMethodsFor(Knob.class);
to print the following list into the console.

You can find further details about class Knob in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ControlBehavior getBehavior()
main.java.controlp5.Controller : ControlWindow getControlWindow()
main.java.controlp5.Controller : ControlWindow getWindow()
main.java.controlp5.Controller : ControllerProperty getProperty(String)
main.java.controlp5.Controller : ControllerProperty getProperty(String, String)
main.java.controlp5.Controller : ControllerView getView()
main.java.controlp5.Controller : Knob addCallback(CallbackListener)
main.java.controlp5.Controller : Knob addListener(ControlListener)
main.java.controlp5.Controller : Knob addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Knob align(int, int, int, int)
main.java.controlp5.Controller : Knob bringToFront()
main.java.controlp5.Controller : Knob bringToFront(ControllerInterface)
main.java.controlp5.Controller : Knob hide()
main.java.controlp5.Controller : Knob linebreak()
main.java.controlp5.Controller : Knob listen(boolean)
main.java.controlp5.Controller : Knob lock()
main.java.controlp5.Controller : Knob onChange(CallbackListener)
main.java.controlp5.Controller : Knob onClick(CallbackListener)
main.java.controlp5.Controller : Knob onDoublePress(CallbackListener)
main.java.controlp5.Controller : Knob onDrag(CallbackListener)
main.java.controlp5.Controller : Knob onDraw(ControllerView)
main.java.controlp5.Controller : Knob onEndDrag(CallbackListener)
main.java.controlp5.Controller : Knob onEnter(CallbackListener)
main.java.controlp5.Controller : Knob onLeave(CallbackListener)
main.java.controlp5.Controller : Knob onMove(CallbackListener)
main.java.controlp5.Controller : Knob onPress(CallbackListener)
main.java.controlp5.Controller : Knob onRelease(CallbackListener)
main.java.controlp5.Controller : Knob onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Knob onStartDrag(CallbackListener)
main.java.controlp5.Controller : Knob onWheel(CallbackListener)
main.java.controlp5.Controller : Knob plugTo(Object)
main.java.controlp5.Controller : Knob plugTo(Object, String)
main.java.controlp5.Controller : Knob plugTo(Object[])
main.java.controlp5.Controller : Knob plugTo(Object[], String)
main.java.controlp5.Controller : Knob registerProperty(String)
main.java.controlp5.Controller : Knob registerProperty(String, String)
main.java.controlp5.Controller : Knob registerTooltip(String)
main.java.controlp5.Controller : Knob removeBehavior()
main.java.controlp5.Controller : Knob removeCallback()
main.java.controlp5.Controller : Knob removeCallback(CallbackListener)
main.java.controlp5.Controller : Knob removeListener(ControlListener)
main.java.controlp5.Controller : Knob removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Knob removeListenersFor(int)
main.java.controlp5.Controller : Knob removeProperty(String)
main.java.controlp5.Controller : Knob removeProperty(String, String)
main.java.controlp5.Controller : Knob setArrayValue(float[])
main.java.controlp5.Controller : Knob setArrayValue(int, float)
main.java.controlp5.Controller : Knob setBehavior(ControlBehavior)
main.java.controlp5.Controller : Knob setBroadcast(boolean)
main.java.controlp5.Controller : Knob setCaptionLabel(String)
main.java.controlp5.Controller : Knob setColor(CColor)
main.java.controlp5.Controller : Knob setColorActive(int)
main.java.controlp5.Controller : Knob setColorBackground(int)
main.java.controlp5.Controller : Knob setColorCaptionLabel(int)
main.java.controlp5.Controller : Knob setColorForeground(int)
main.java.controlp5.Controller : Knob setColorLabel(int)
main.java.controlp5.Controller : Knob setColorValue(int)
main.java.controlp5.Controller : Knob setColorValueLabel(int)
main.java.controlp5.Controller : Knob setDecimalPrecision(int)
main.java.controlp5.Controller : Knob setDefaultValue(float)
main.java.controlp5.Controller : Knob setHeight(int)
main.java.controlp5.Controller : Knob setId(int)
main.java.controlp5.Controller : Knob setImage(PImage)
main.java.controlp5.Controller : Knob setImage(PImage, int)
main.java.controlp5.Controller : Knob setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Knob setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Knob setLabel(String)
main.java.controlp5.Controller : Knob setLabelVisible(boolean)
main.java.controlp5.Controller : Knob setLock(boolean)
main.java.controlp5.Controller : Knob setMax(float)
main.java.controlp5.Controller : Knob setMin(float)
main.java.controlp5.Controller : Knob setMouseOver(boolean)
main.java.controlp5.Controller : Knob setMoveable(boolean)
main.java.controlp5.Controller : Knob setPosition(float, float)
main.java.controlp5.Controller : Knob setPosition(float[])
main.java.controlp5.Controller : Knob setSize(PImage)
main.java.controlp5.Controller : Knob setSize(int, int)
main.java.controlp5.Controller : Knob setStringValue(String)
main.java.controlp5.Controller : Knob setUpdate(boolean)
main.java.controlp5.Controller : Knob setValue(float)
main.java.controlp5.Controller : Knob setValueLabel(String)
main.java.controlp5.Controller : Knob setValueSelf(float)
main.java.controlp5.Controller : Knob setView(ControllerView)
main.java.controlp5.Controller : Knob setVisible(boolean)
main.java.controlp5.Controller : Knob setWidth(int)
main.java.controlp5.Controller : Knob show()
main.java.controlp5.Controller : Knob unlock()
main.java.controlp5.Controller : Knob unplugFrom(Object)
main.java.controlp5.Controller : Knob unplugFrom(Object[])
main.java.controlp5.Controller : Knob unregisterTooltip()
main.java.controlp5.Controller : Knob update()
main.java.controlp5.Controller : Knob updateSize()
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
main.java.controlp5.Knob : Knob hideTickMarks()
main.java.controlp5.Knob : Knob setAngleRange(float)
main.java.controlp5.Knob : Knob setConstrained(boolean)
main.java.controlp5.Knob : Knob setDragDirection(int)
main.java.controlp5.Knob : Knob setMax(float)
main.java.controlp5.Knob : Knob setMin(float)
main.java.controlp5.Knob : Knob setNumberOfTickMarks(int)
main.java.controlp5.Knob : Knob setRadius(float)
main.java.controlp5.Knob : Knob setRange(float, float)
main.java.controlp5.Knob : Knob setResolution(float)
main.java.controlp5.Knob : Knob setScrollSensitivity(float)
main.java.controlp5.Knob : Knob setShowAngleRange(boolean)
main.java.controlp5.Knob : Knob setSize(int, int)
main.java.controlp5.Knob : Knob setStartAngle(float)
main.java.controlp5.Knob : Knob setTickMarkLength(int)
main.java.controlp5.Knob : Knob setTickMarkWeight(float)
main.java.controlp5.Knob : Knob setValue(float)
main.java.controlp5.Knob : Knob setViewStyle(int)
main.java.controlp5.Knob : Knob showTickMarks()
main.java.controlp5.Knob : Knob shuffle()
main.java.controlp5.Knob : Knob snapToTickMarks(boolean)
main.java.controlp5.Knob : boolean isConstrained()
main.java.controlp5.Knob : boolean isShowAngleRange()
main.java.controlp5.Knob : boolean isShowTickMarks()
main.java.controlp5.Knob : float getAngle()
main.java.controlp5.Knob : float getAngleRange()
main.java.controlp5.Knob : float getRadius()
main.java.controlp5.Knob : float getResolution()
main.java.controlp5.Knob : float getStartAngle()
main.java.controlp5.Knob : float getTickMarkWeight()
main.java.controlp5.Knob : float getValue()
main.java.controlp5.Knob : int getDragDirection()
main.java.controlp5.Knob : int getNumberOfTickMarks()
main.java.controlp5.Knob : int getTickMarkLength()
main.java.controlp5.Knob : int getViewStyle()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:10

*/


