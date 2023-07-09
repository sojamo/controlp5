/**
* ControlP5 Icon
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

void setup() {
  size(800,400);
  cp5 = new ControlP5(this);
  cp5.addIcon("icon",10)
     .setPosition(100,100)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground()
     ;  
}

void draw() {
  background(220);
}

void icon(boolean theValue) {
  println("got an event for icon", theValue);
} 

/*
a list of all methods available for the Icon Controller
use ControlP5.printPublicMethodsFor(Icon.class);
to print the following list into the console.

You can find further details about class Icon in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ControlBehavior getBehavior()
main.java.controlp5.Controller : ControlWindow getControlWindow()
main.java.controlp5.Controller : ControlWindow getWindow()
main.java.controlp5.Controller : ControllerProperty getProperty(String)
main.java.controlp5.Controller : ControllerProperty getProperty(String, String)
main.java.controlp5.Controller : ControllerView getView()
main.java.controlp5.Controller : Icon addCallback(CallbackListener)
main.java.controlp5.Controller : Icon addListener(ControlListener)
main.java.controlp5.Controller : Icon addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Icon align(int, int, int, int)
main.java.controlp5.Controller : Icon bringToFront()
main.java.controlp5.Controller : Icon bringToFront(ControllerInterface)
main.java.controlp5.Controller : Icon hide()
main.java.controlp5.Controller : Icon linebreak()
main.java.controlp5.Controller : Icon listen(boolean)
main.java.controlp5.Controller : Icon lock()
main.java.controlp5.Controller : Icon onChange(CallbackListener)
main.java.controlp5.Controller : Icon onClick(CallbackListener)
main.java.controlp5.Controller : Icon onDoublePress(CallbackListener)
main.java.controlp5.Controller : Icon onDrag(CallbackListener)
main.java.controlp5.Controller : Icon onDraw(ControllerView)
main.java.controlp5.Controller : Icon onEndDrag(CallbackListener)
main.java.controlp5.Controller : Icon onEnter(CallbackListener)
main.java.controlp5.Controller : Icon onLeave(CallbackListener)
main.java.controlp5.Controller : Icon onMove(CallbackListener)
main.java.controlp5.Controller : Icon onPress(CallbackListener)
main.java.controlp5.Controller : Icon onRelease(CallbackListener)
main.java.controlp5.Controller : Icon onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Icon onStartDrag(CallbackListener)
main.java.controlp5.Controller : Icon onWheel(CallbackListener)
main.java.controlp5.Controller : Icon plugTo(Object)
main.java.controlp5.Controller : Icon plugTo(Object, String)
main.java.controlp5.Controller : Icon plugTo(Object[])
main.java.controlp5.Controller : Icon plugTo(Object[], String)
main.java.controlp5.Controller : Icon registerProperty(String)
main.java.controlp5.Controller : Icon registerProperty(String, String)
main.java.controlp5.Controller : Icon registerTooltip(String)
main.java.controlp5.Controller : Icon removeBehavior()
main.java.controlp5.Controller : Icon removeCallback()
main.java.controlp5.Controller : Icon removeCallback(CallbackListener)
main.java.controlp5.Controller : Icon removeListener(ControlListener)
main.java.controlp5.Controller : Icon removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Icon removeListenersFor(int)
main.java.controlp5.Controller : Icon removeProperty(String)
main.java.controlp5.Controller : Icon removeProperty(String, String)
main.java.controlp5.Controller : Icon setArrayValue(float[])
main.java.controlp5.Controller : Icon setArrayValue(int, float)
main.java.controlp5.Controller : Icon setBehavior(ControlBehavior)
main.java.controlp5.Controller : Icon setBroadcast(boolean)
main.java.controlp5.Controller : Icon setCaptionLabel(String)
main.java.controlp5.Controller : Icon setColor(CColor)
main.java.controlp5.Controller : Icon setColorActive(int)
main.java.controlp5.Controller : Icon setColorBackground(int)
main.java.controlp5.Controller : Icon setColorCaptionLabel(int)
main.java.controlp5.Controller : Icon setColorForeground(int)
main.java.controlp5.Controller : Icon setColorLabel(int)
main.java.controlp5.Controller : Icon setColorValue(int)
main.java.controlp5.Controller : Icon setColorValueLabel(int)
main.java.controlp5.Controller : Icon setDecimalPrecision(int)
main.java.controlp5.Controller : Icon setDefaultValue(float)
main.java.controlp5.Controller : Icon setHeight(int)
main.java.controlp5.Controller : Icon setId(int)
main.java.controlp5.Controller : Icon setImage(PImage)
main.java.controlp5.Controller : Icon setImage(PImage, int)
main.java.controlp5.Controller : Icon setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Icon setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Icon setLabel(String)
main.java.controlp5.Controller : Icon setLabelVisible(boolean)
main.java.controlp5.Controller : Icon setLock(boolean)
main.java.controlp5.Controller : Icon setMax(float)
main.java.controlp5.Controller : Icon setMin(float)
main.java.controlp5.Controller : Icon setMouseOver(boolean)
main.java.controlp5.Controller : Icon setMoveable(boolean)
main.java.controlp5.Controller : Icon setPosition(float, float)
main.java.controlp5.Controller : Icon setPosition(float[])
main.java.controlp5.Controller : Icon setSize(PImage)
main.java.controlp5.Controller : Icon setSize(int, int)
main.java.controlp5.Controller : Icon setStringValue(String)
main.java.controlp5.Controller : Icon setUpdate(boolean)
main.java.controlp5.Controller : Icon setValue(float)
main.java.controlp5.Controller : Icon setValueLabel(String)
main.java.controlp5.Controller : Icon setValueSelf(float)
main.java.controlp5.Controller : Icon setView(ControllerView)
main.java.controlp5.Controller : Icon setVisible(boolean)
main.java.controlp5.Controller : Icon setWidth(int)
main.java.controlp5.Controller : Icon show()
main.java.controlp5.Controller : Icon unlock()
main.java.controlp5.Controller : Icon unplugFrom(Object)
main.java.controlp5.Controller : Icon unplugFrom(Object[])
main.java.controlp5.Controller : Icon unregisterTooltip()
main.java.controlp5.Controller : Icon update()
main.java.controlp5.Controller : Icon updateSize()
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
main.java.controlp5.Icon : Icon activateBy(int)
main.java.controlp5.Icon : Icon hideBackground()
main.java.controlp5.Icon : Icon setFill(boolean)
main.java.controlp5.Icon : Icon setFont(PFont)
main.java.controlp5.Icon : Icon setFont(PFont, int)
main.java.controlp5.Icon : Icon setFontIcon(int)
main.java.controlp5.Icon : Icon setFontIcon(int, int)
main.java.controlp5.Icon : Icon setFontIconOff(int)
main.java.controlp5.Icon : Icon setFontIconOn(int)
main.java.controlp5.Icon : Icon setFontIconSize(int)
main.java.controlp5.Icon : Icon setFontIcons(int, int)
main.java.controlp5.Icon : Icon setFontIndex(int)
main.java.controlp5.Icon : Icon setOff()
main.java.controlp5.Icon : Icon setOn()
main.java.controlp5.Icon : Icon setRoundedCorners(int)
main.java.controlp5.Icon : Icon setScale(float, float)
main.java.controlp5.Icon : Icon setStroke(boolean)
main.java.controlp5.Icon : Icon setStrokeWeight(float)
main.java.controlp5.Icon : Icon setSwitch(boolean)
main.java.controlp5.Icon : Icon setValue(float)
main.java.controlp5.Icon : Icon showBackground()
main.java.controlp5.Icon : Icon update()
main.java.controlp5.Icon : String getInfo()
main.java.controlp5.Icon : String toString()
main.java.controlp5.Icon : boolean getBooleanValue()
main.java.controlp5.Icon : boolean isOn()
main.java.controlp5.Icon : boolean isPressed()
main.java.controlp5.Icon : boolean isSwitch()
main.java.controlp5.Icon : int getFontIcon(int)
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:09

*/


