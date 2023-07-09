/**
* ControlP5 ColorWheel
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
  size(800, 400);
  cp5 = new ControlP5( this );
  cp5.addColorWheel("c" , 250 , 10 , 200 ).setRGB(color(128,0,255));
  noStroke();
}
  
int c = color(100);

void draw() {  
  background(50);
  fill( c );
  rect(0,240,width,200);
 println(cp5.get(ColorWheel.class,"c").getRGB()); 
}

/*
a list of all methods available for the ColorWheel Controller
use ControlP5.printPublicMethodsFor(ColorWheel.class);
to print the following list into the console.

You can find further details about class ColorWheel in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ColorWheel : ColorWheel scrolled(int)
main.java.controlp5.ColorWheel : ColorWheel setAlpha(int)
main.java.controlp5.ColorWheel : ColorWheel setHSL(double, double, double)
main.java.controlp5.ColorWheel : ColorWheel setRGB(int)
main.java.controlp5.ColorWheel : double[] RGBtoHSL(int)
main.java.controlp5.ColorWheel : double[] RGBtoHSL(int, int, int)
main.java.controlp5.ColorWheel : int HSLtoRGB(double, double, double)
main.java.controlp5.ColorWheel : int HSLtoRGB(double[])
main.java.controlp5.ColorWheel : int HSVtoRGB(double, double, double)
main.java.controlp5.ColorWheel : int HSVtoRGB(double[])
main.java.controlp5.ColorWheel : int a()
main.java.controlp5.ColorWheel : int b()
main.java.controlp5.ColorWheel : int g()
main.java.controlp5.ColorWheel : int getRGB()
main.java.controlp5.ColorWheel : int r()
main.java.controlp5.ColorWheel : void onDrag()
main.java.controlp5.ColorWheel : void onEndDrag()
main.java.controlp5.ColorWheel : void onPress()
main.java.controlp5.ColorWheel : void onRelease()
main.java.controlp5.ColorWheel : void onStartDrag()
main.java.controlp5.ColorWheel : void setHue(double)
main.java.controlp5.ColorWheel : void setLightness(double)
main.java.controlp5.ColorWheel : void setSaturation(double)
main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ColorWheel addCallback(CallbackListener)
main.java.controlp5.Controller : ColorWheel addListener(ControlListener)
main.java.controlp5.Controller : ColorWheel addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ColorWheel align(int, int, int, int)
main.java.controlp5.Controller : ColorWheel bringToFront()
main.java.controlp5.Controller : ColorWheel bringToFront(ControllerInterface)
main.java.controlp5.Controller : ColorWheel hide()
main.java.controlp5.Controller : ColorWheel linebreak()
main.java.controlp5.Controller : ColorWheel listen(boolean)
main.java.controlp5.Controller : ColorWheel lock()
main.java.controlp5.Controller : ColorWheel onChange(CallbackListener)
main.java.controlp5.Controller : ColorWheel onClick(CallbackListener)
main.java.controlp5.Controller : ColorWheel onDoublePress(CallbackListener)
main.java.controlp5.Controller : ColorWheel onDrag(CallbackListener)
main.java.controlp5.Controller : ColorWheel onDraw(ControllerView)
main.java.controlp5.Controller : ColorWheel onEndDrag(CallbackListener)
main.java.controlp5.Controller : ColorWheel onEnter(CallbackListener)
main.java.controlp5.Controller : ColorWheel onLeave(CallbackListener)
main.java.controlp5.Controller : ColorWheel onMove(CallbackListener)
main.java.controlp5.Controller : ColorWheel onPress(CallbackListener)
main.java.controlp5.Controller : ColorWheel onRelease(CallbackListener)
main.java.controlp5.Controller : ColorWheel onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : ColorWheel onStartDrag(CallbackListener)
main.java.controlp5.Controller : ColorWheel onWheel(CallbackListener)
main.java.controlp5.Controller : ColorWheel plugTo(Object)
main.java.controlp5.Controller : ColorWheel plugTo(Object, String)
main.java.controlp5.Controller : ColorWheel plugTo(Object[])
main.java.controlp5.Controller : ColorWheel plugTo(Object[], String)
main.java.controlp5.Controller : ColorWheel registerProperty(String)
main.java.controlp5.Controller : ColorWheel registerProperty(String, String)
main.java.controlp5.Controller : ColorWheel registerTooltip(String)
main.java.controlp5.Controller : ColorWheel removeBehavior()
main.java.controlp5.Controller : ColorWheel removeCallback()
main.java.controlp5.Controller : ColorWheel removeCallback(CallbackListener)
main.java.controlp5.Controller : ColorWheel removeListener(ControlListener)
main.java.controlp5.Controller : ColorWheel removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ColorWheel removeListenersFor(int)
main.java.controlp5.Controller : ColorWheel removeProperty(String)
main.java.controlp5.Controller : ColorWheel removeProperty(String, String)
main.java.controlp5.Controller : ColorWheel setArrayValue(float[])
main.java.controlp5.Controller : ColorWheel setArrayValue(int, float)
main.java.controlp5.Controller : ColorWheel setBehavior(ControlBehavior)
main.java.controlp5.Controller : ColorWheel setBroadcast(boolean)
main.java.controlp5.Controller : ColorWheel setCaptionLabel(String)
main.java.controlp5.Controller : ColorWheel setColor(CColor)
main.java.controlp5.Controller : ColorWheel setColorActive(int)
main.java.controlp5.Controller : ColorWheel setColorBackground(int)
main.java.controlp5.Controller : ColorWheel setColorCaptionLabel(int)
main.java.controlp5.Controller : ColorWheel setColorForeground(int)
main.java.controlp5.Controller : ColorWheel setColorLabel(int)
main.java.controlp5.Controller : ColorWheel setColorValue(int)
main.java.controlp5.Controller : ColorWheel setColorValueLabel(int)
main.java.controlp5.Controller : ColorWheel setDecimalPrecision(int)
main.java.controlp5.Controller : ColorWheel setDefaultValue(float)
main.java.controlp5.Controller : ColorWheel setHeight(int)
main.java.controlp5.Controller : ColorWheel setId(int)
main.java.controlp5.Controller : ColorWheel setImage(PImage)
main.java.controlp5.Controller : ColorWheel setImage(PImage, int)
main.java.controlp5.Controller : ColorWheel setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : ColorWheel setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : ColorWheel setLabel(String)
main.java.controlp5.Controller : ColorWheel setLabelVisible(boolean)
main.java.controlp5.Controller : ColorWheel setLock(boolean)
main.java.controlp5.Controller : ColorWheel setMax(float)
main.java.controlp5.Controller : ColorWheel setMin(float)
main.java.controlp5.Controller : ColorWheel setMouseOver(boolean)
main.java.controlp5.Controller : ColorWheel setMoveable(boolean)
main.java.controlp5.Controller : ColorWheel setPosition(float, float)
main.java.controlp5.Controller : ColorWheel setPosition(float[])
main.java.controlp5.Controller : ColorWheel setSize(PImage)
main.java.controlp5.Controller : ColorWheel setSize(int, int)
main.java.controlp5.Controller : ColorWheel setStringValue(String)
main.java.controlp5.Controller : ColorWheel setUpdate(boolean)
main.java.controlp5.Controller : ColorWheel setValue(float)
main.java.controlp5.Controller : ColorWheel setValueLabel(String)
main.java.controlp5.Controller : ColorWheel setValueSelf(float)
main.java.controlp5.Controller : ColorWheel setView(ControllerView)
main.java.controlp5.Controller : ColorWheel setVisible(boolean)
main.java.controlp5.Controller : ColorWheel setWidth(int)
main.java.controlp5.Controller : ColorWheel show()
main.java.controlp5.Controller : ColorWheel unlock()
main.java.controlp5.Controller : ColorWheel unplugFrom(Object)
main.java.controlp5.Controller : ColorWheel unplugFrom(Object[])
main.java.controlp5.Controller : ColorWheel unregisterTooltip()
main.java.controlp5.Controller : ColorWheel update()
main.java.controlp5.Controller : ColorWheel updateSize()
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
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:00

*/


