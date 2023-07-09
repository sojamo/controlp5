/**
* ControlP5 Slider2D
*
*
* find a list of public methods available for the Slider2D Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;

Slider2D s;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  s = cp5.addSlider2D("wave")
         .setPosition(30,40)
         .setSize(100,100)
         .setMinMax(20,10,100,100)
         .setValue(50,50)
         //.disableCrosshair()
         ;
         
  smooth();
}

float cnt;
void draw() {
  background(0);
  pushMatrix();
  translate(160,140);
  noStroke();
  fill(50);
  rect(0, -100, 400,200);
  strokeWeight(1);
  line(0,0,200, 0);
  stroke(255);
  
  for(int i=1;i<400;i++) {
    float y0 = cos(map(i-1,0,s.getArrayValue()[0],-PI,PI)) * s.getArrayValue()[1]; 
    float y1 = cos(map(i,0,s.getArrayValue()[0],-PI,PI)) * s.getArrayValue()[1];
    line((i-1),y0,i,y1);
  }
  
  popMatrix();
}















/*
a list of all methods available for the Slider2D Controller
use ControlP5.printPublicMethodsFor(Slider2D.class);
to print the following list into the console.

You can find further details about class Slider2D in the javadoc.

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
main.java.controlp5.Controller : Slider2D addCallback(CallbackListener)
main.java.controlp5.Controller : Slider2D addListener(ControlListener)
main.java.controlp5.Controller : Slider2D addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Slider2D align(int, int, int, int)
main.java.controlp5.Controller : Slider2D bringToFront()
main.java.controlp5.Controller : Slider2D bringToFront(ControllerInterface)
main.java.controlp5.Controller : Slider2D hide()
main.java.controlp5.Controller : Slider2D linebreak()
main.java.controlp5.Controller : Slider2D listen(boolean)
main.java.controlp5.Controller : Slider2D lock()
main.java.controlp5.Controller : Slider2D onChange(CallbackListener)
main.java.controlp5.Controller : Slider2D onClick(CallbackListener)
main.java.controlp5.Controller : Slider2D onDoublePress(CallbackListener)
main.java.controlp5.Controller : Slider2D onDrag(CallbackListener)
main.java.controlp5.Controller : Slider2D onDraw(ControllerView)
main.java.controlp5.Controller : Slider2D onEndDrag(CallbackListener)
main.java.controlp5.Controller : Slider2D onEnter(CallbackListener)
main.java.controlp5.Controller : Slider2D onLeave(CallbackListener)
main.java.controlp5.Controller : Slider2D onMove(CallbackListener)
main.java.controlp5.Controller : Slider2D onPress(CallbackListener)
main.java.controlp5.Controller : Slider2D onRelease(CallbackListener)
main.java.controlp5.Controller : Slider2D onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Slider2D onStartDrag(CallbackListener)
main.java.controlp5.Controller : Slider2D onWheel(CallbackListener)
main.java.controlp5.Controller : Slider2D plugTo(Object)
main.java.controlp5.Controller : Slider2D plugTo(Object, String)
main.java.controlp5.Controller : Slider2D plugTo(Object[])
main.java.controlp5.Controller : Slider2D plugTo(Object[], String)
main.java.controlp5.Controller : Slider2D registerProperty(String)
main.java.controlp5.Controller : Slider2D registerProperty(String, String)
main.java.controlp5.Controller : Slider2D registerTooltip(String)
main.java.controlp5.Controller : Slider2D removeBehavior()
main.java.controlp5.Controller : Slider2D removeCallback()
main.java.controlp5.Controller : Slider2D removeCallback(CallbackListener)
main.java.controlp5.Controller : Slider2D removeListener(ControlListener)
main.java.controlp5.Controller : Slider2D removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Slider2D removeListenersFor(int)
main.java.controlp5.Controller : Slider2D removeProperty(String)
main.java.controlp5.Controller : Slider2D removeProperty(String, String)
main.java.controlp5.Controller : Slider2D setArrayValue(float[])
main.java.controlp5.Controller : Slider2D setArrayValue(int, float)
main.java.controlp5.Controller : Slider2D setBehavior(ControlBehavior)
main.java.controlp5.Controller : Slider2D setBroadcast(boolean)
main.java.controlp5.Controller : Slider2D setCaptionLabel(String)
main.java.controlp5.Controller : Slider2D setColor(CColor)
main.java.controlp5.Controller : Slider2D setColorActive(int)
main.java.controlp5.Controller : Slider2D setColorBackground(int)
main.java.controlp5.Controller : Slider2D setColorCaptionLabel(int)
main.java.controlp5.Controller : Slider2D setColorForeground(int)
main.java.controlp5.Controller : Slider2D setColorLabel(int)
main.java.controlp5.Controller : Slider2D setColorValue(int)
main.java.controlp5.Controller : Slider2D setColorValueLabel(int)
main.java.controlp5.Controller : Slider2D setDecimalPrecision(int)
main.java.controlp5.Controller : Slider2D setDefaultValue(float)
main.java.controlp5.Controller : Slider2D setHeight(int)
main.java.controlp5.Controller : Slider2D setId(int)
main.java.controlp5.Controller : Slider2D setImage(PImage)
main.java.controlp5.Controller : Slider2D setImage(PImage, int)
main.java.controlp5.Controller : Slider2D setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Slider2D setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Slider2D setLabel(String)
main.java.controlp5.Controller : Slider2D setLabelVisible(boolean)
main.java.controlp5.Controller : Slider2D setLock(boolean)
main.java.controlp5.Controller : Slider2D setMax(float)
main.java.controlp5.Controller : Slider2D setMin(float)
main.java.controlp5.Controller : Slider2D setMouseOver(boolean)
main.java.controlp5.Controller : Slider2D setMoveable(boolean)
main.java.controlp5.Controller : Slider2D setPosition(float, float)
main.java.controlp5.Controller : Slider2D setPosition(float[])
main.java.controlp5.Controller : Slider2D setSize(PImage)
main.java.controlp5.Controller : Slider2D setSize(int, int)
main.java.controlp5.Controller : Slider2D setStringValue(String)
main.java.controlp5.Controller : Slider2D setUpdate(boolean)
main.java.controlp5.Controller : Slider2D setValue(float)
main.java.controlp5.Controller : Slider2D setValueLabel(String)
main.java.controlp5.Controller : Slider2D setValueSelf(float)
main.java.controlp5.Controller : Slider2D setView(ControllerView)
main.java.controlp5.Controller : Slider2D setVisible(boolean)
main.java.controlp5.Controller : Slider2D setWidth(int)
main.java.controlp5.Controller : Slider2D show()
main.java.controlp5.Controller : Slider2D unlock()
main.java.controlp5.Controller : Slider2D unplugFrom(Object)
main.java.controlp5.Controller : Slider2D unplugFrom(Object[])
main.java.controlp5.Controller : Slider2D unregisterTooltip()
main.java.controlp5.Controller : Slider2D update()
main.java.controlp5.Controller : Slider2D updateSize()
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
main.java.controlp5.Slider2D : Slider2D disableCrosshair()
main.java.controlp5.Slider2D : Slider2D enableCrosshair()
main.java.controlp5.Slider2D : Slider2D setArrayValue(float[])
main.java.controlp5.Slider2D : Slider2D setCursorX(float)
main.java.controlp5.Slider2D : Slider2D setCursorY(float)
main.java.controlp5.Slider2D : Slider2D setMaxX(float)
main.java.controlp5.Slider2D : Slider2D setMaxY(float)
main.java.controlp5.Slider2D : Slider2D setMinMax(float, float, float, float)
main.java.controlp5.Slider2D : Slider2D setMinX(float)
main.java.controlp5.Slider2D : Slider2D setMinY(float)
main.java.controlp5.Slider2D : Slider2D setValue(float)
main.java.controlp5.Slider2D : Slider2D setValue(float, float)
main.java.controlp5.Slider2D : Slider2D shuffle()
main.java.controlp5.Slider2D : float getCursorHeight()
main.java.controlp5.Slider2D : float getCursorWidth()
main.java.controlp5.Slider2D : float getCursorX()
main.java.controlp5.Slider2D : float getCursorY()
main.java.controlp5.Slider2D : float getMaxX()
main.java.controlp5.Slider2D : float getMaxY()
main.java.controlp5.Slider2D : float getMinX()
main.java.controlp5.Slider2D : float getMinY()
main.java.controlp5.Slider2D : float[] getArrayValue()
main.java.controlp5.Slider2D : void setValueLabelSeparator(String)
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:47

*/


