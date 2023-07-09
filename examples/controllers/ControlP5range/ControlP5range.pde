/**
* ControlP5 Range
*
* find a list of public methods available for the Range Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0,0,0);

int colorMin = 100;

int colorMax = 100;

Range range;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  range = cp5.addRange("rangeController")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,50)
             .setSize(400,40)
             .setHandleSize(20)
             .setRange(0,255)
             .setRangeValues(50,100)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))  
             ;
             
  noStroke();             
}

void draw() {
  background(colorMax);
  fill(colorMin);
  rect(0,0,width,height/2);
}

void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.isFrom("rangeController")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    colorMin = int(theControlEvent.getController().getArrayValue(0));
    colorMax = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
  
}


void keyPressed() {
  switch(key) {
    case('1'):range.setLowValue(0);break;
    case('2'):range.setLowValue(100);break;
    case('3'):range.setHighValue(120);break;
    case('4'):range.setHighValue(200);break;
    case('5'):range.setRangeValues(40,60);break;
  }
}


/*
a list of all methods available for the Range Controller
use ControlP5.printPublicMethodsFor(Range.class);
to print the following list into the console.

You can find further details about class Range in the javadoc.

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
main.java.controlp5.Controller : Range addCallback(CallbackListener)
main.java.controlp5.Controller : Range addListener(ControlListener)
main.java.controlp5.Controller : Range addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Range align(int, int, int, int)
main.java.controlp5.Controller : Range bringToFront()
main.java.controlp5.Controller : Range bringToFront(ControllerInterface)
main.java.controlp5.Controller : Range hide()
main.java.controlp5.Controller : Range linebreak()
main.java.controlp5.Controller : Range listen(boolean)
main.java.controlp5.Controller : Range lock()
main.java.controlp5.Controller : Range onChange(CallbackListener)
main.java.controlp5.Controller : Range onClick(CallbackListener)
main.java.controlp5.Controller : Range onDoublePress(CallbackListener)
main.java.controlp5.Controller : Range onDrag(CallbackListener)
main.java.controlp5.Controller : Range onDraw(ControllerView)
main.java.controlp5.Controller : Range onEndDrag(CallbackListener)
main.java.controlp5.Controller : Range onEnter(CallbackListener)
main.java.controlp5.Controller : Range onLeave(CallbackListener)
main.java.controlp5.Controller : Range onMove(CallbackListener)
main.java.controlp5.Controller : Range onPress(CallbackListener)
main.java.controlp5.Controller : Range onRelease(CallbackListener)
main.java.controlp5.Controller : Range onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Range onStartDrag(CallbackListener)
main.java.controlp5.Controller : Range onWheel(CallbackListener)
main.java.controlp5.Controller : Range plugTo(Object)
main.java.controlp5.Controller : Range plugTo(Object, String)
main.java.controlp5.Controller : Range plugTo(Object[])
main.java.controlp5.Controller : Range plugTo(Object[], String)
main.java.controlp5.Controller : Range registerProperty(String)
main.java.controlp5.Controller : Range registerProperty(String, String)
main.java.controlp5.Controller : Range registerTooltip(String)
main.java.controlp5.Controller : Range removeBehavior()
main.java.controlp5.Controller : Range removeCallback()
main.java.controlp5.Controller : Range removeCallback(CallbackListener)
main.java.controlp5.Controller : Range removeListener(ControlListener)
main.java.controlp5.Controller : Range removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Range removeListenersFor(int)
main.java.controlp5.Controller : Range removeProperty(String)
main.java.controlp5.Controller : Range removeProperty(String, String)
main.java.controlp5.Controller : Range setArrayValue(float[])
main.java.controlp5.Controller : Range setArrayValue(int, float)
main.java.controlp5.Controller : Range setBehavior(ControlBehavior)
main.java.controlp5.Controller : Range setBroadcast(boolean)
main.java.controlp5.Controller : Range setCaptionLabel(String)
main.java.controlp5.Controller : Range setColor(CColor)
main.java.controlp5.Controller : Range setColorActive(int)
main.java.controlp5.Controller : Range setColorBackground(int)
main.java.controlp5.Controller : Range setColorCaptionLabel(int)
main.java.controlp5.Controller : Range setColorForeground(int)
main.java.controlp5.Controller : Range setColorLabel(int)
main.java.controlp5.Controller : Range setColorValue(int)
main.java.controlp5.Controller : Range setColorValueLabel(int)
main.java.controlp5.Controller : Range setDecimalPrecision(int)
main.java.controlp5.Controller : Range setDefaultValue(float)
main.java.controlp5.Controller : Range setHeight(int)
main.java.controlp5.Controller : Range setId(int)
main.java.controlp5.Controller : Range setImage(PImage)
main.java.controlp5.Controller : Range setImage(PImage, int)
main.java.controlp5.Controller : Range setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Range setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Range setLabel(String)
main.java.controlp5.Controller : Range setLabelVisible(boolean)
main.java.controlp5.Controller : Range setLock(boolean)
main.java.controlp5.Controller : Range setMax(float)
main.java.controlp5.Controller : Range setMin(float)
main.java.controlp5.Controller : Range setMouseOver(boolean)
main.java.controlp5.Controller : Range setMoveable(boolean)
main.java.controlp5.Controller : Range setPosition(float, float)
main.java.controlp5.Controller : Range setPosition(float[])
main.java.controlp5.Controller : Range setSize(PImage)
main.java.controlp5.Controller : Range setSize(int, int)
main.java.controlp5.Controller : Range setStringValue(String)
main.java.controlp5.Controller : Range setUpdate(boolean)
main.java.controlp5.Controller : Range setValue(float)
main.java.controlp5.Controller : Range setValueLabel(String)
main.java.controlp5.Controller : Range setValueSelf(float)
main.java.controlp5.Controller : Range setView(ControllerView)
main.java.controlp5.Controller : Range setVisible(boolean)
main.java.controlp5.Controller : Range setWidth(int)
main.java.controlp5.Controller : Range show()
main.java.controlp5.Controller : Range unlock()
main.java.controlp5.Controller : Range unplugFrom(Object)
main.java.controlp5.Controller : Range unplugFrom(Object[])
main.java.controlp5.Controller : Range unregisterTooltip()
main.java.controlp5.Controller : Range update()
main.java.controlp5.Controller : Range updateSize()
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
main.java.controlp5.Range : ArrayList getTickMarks()
main.java.controlp5.Range : Range setArrayValue(float[])
main.java.controlp5.Range : Range setColorCaptionLabel(int)
main.java.controlp5.Range : Range setColorTickMark(int)
main.java.controlp5.Range : Range setColorValueLabel(int)
main.java.controlp5.Range : Range setHandleSize(int)
main.java.controlp5.Range : Range setHeight(int)
main.java.controlp5.Range : Range setHighValue(float)
main.java.controlp5.Range : Range setHighValueLabel(String)
main.java.controlp5.Range : Range setLowValue(float)
main.java.controlp5.Range : Range setLowValueLabel(String)
main.java.controlp5.Range : Range setMax(float)
main.java.controlp5.Range : Range setMin(float)
main.java.controlp5.Range : Range setNumberOfTickMarks(int)
main.java.controlp5.Range : Range setRange(float, float)
main.java.controlp5.Range : Range setRangeValues(float, float)
main.java.controlp5.Range : Range setWidth(int)
main.java.controlp5.Range : Range showTickMarks(boolean)
main.java.controlp5.Range : Range snapToTickMarks(boolean)
main.java.controlp5.Range : float getHighValue()
main.java.controlp5.Range : float getLowValue()
main.java.controlp5.Range : float[] getArrayValue()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:20

*/


