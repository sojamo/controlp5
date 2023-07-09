/**
 * ControlP5 Slider. Horizontal and vertical sliders, 
 * with and without tick marks and snap-to-tick behavior.
 * by andreas schlegel, 2010
 */

/**
* ControlP5 Slider
*
* Horizontal and vertical sliders, 
* With and without tick marks and snap-to-tick behavior.
*
* find a list of public methods available for the Slider Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(0,255)
     ;
  
  // create another slider with tick marks, now without
  // default value, the initial value will be set according to
  // the value of variable sliderTicks2 then.
  cp5.addSlider("sliderTicks1")
     .setPosition(100,140)
     .setSize(20,100)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
     
  // add a vertical slider
  cp5.addSlider("slider")
     .setPosition(100,305)
     .setSize(200,20)
     .setRange(0,200)
     .setValue(128)
     ;
  
  // reposition the Label for controller 'slider'
  cp5.getController("slider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("slider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  

  cp5.addSlider("sliderTicks2")
     .setPosition(100,370)
     .setWidth(400)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE)
     ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX
  

}

void draw() {
  background(sliderTicks1);

  fill(sliderValue);
  rect(0,0,width,100);
  
  fill(myColor);
  rect(0,280,width,70);
  
  fill(sliderTicks2);
  rect(0,350,width,50);
}

void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}












/**
* ControlP5 Slider
*
*
* find a list of public methods available for the Slider Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

/*
a list of all methods available for the Slider Controller
use ControlP5.printPublicMethodsFor(Slider.class);
to print the following list into the console.

You can find further details about class Slider in the javadoc.

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
main.java.controlp5.Controller : Slider addCallback(CallbackListener)
main.java.controlp5.Controller : Slider addListener(ControlListener)
main.java.controlp5.Controller : Slider addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Slider align(int, int, int, int)
main.java.controlp5.Controller : Slider bringToFront()
main.java.controlp5.Controller : Slider bringToFront(ControllerInterface)
main.java.controlp5.Controller : Slider hide()
main.java.controlp5.Controller : Slider linebreak()
main.java.controlp5.Controller : Slider listen(boolean)
main.java.controlp5.Controller : Slider lock()
main.java.controlp5.Controller : Slider onChange(CallbackListener)
main.java.controlp5.Controller : Slider onClick(CallbackListener)
main.java.controlp5.Controller : Slider onDoublePress(CallbackListener)
main.java.controlp5.Controller : Slider onDrag(CallbackListener)
main.java.controlp5.Controller : Slider onDraw(ControllerView)
main.java.controlp5.Controller : Slider onEndDrag(CallbackListener)
main.java.controlp5.Controller : Slider onEnter(CallbackListener)
main.java.controlp5.Controller : Slider onLeave(CallbackListener)
main.java.controlp5.Controller : Slider onMove(CallbackListener)
main.java.controlp5.Controller : Slider onPress(CallbackListener)
main.java.controlp5.Controller : Slider onRelease(CallbackListener)
main.java.controlp5.Controller : Slider onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Slider onStartDrag(CallbackListener)
main.java.controlp5.Controller : Slider onWheel(CallbackListener)
main.java.controlp5.Controller : Slider plugTo(Object)
main.java.controlp5.Controller : Slider plugTo(Object, String)
main.java.controlp5.Controller : Slider plugTo(Object[])
main.java.controlp5.Controller : Slider plugTo(Object[], String)
main.java.controlp5.Controller : Slider registerProperty(String)
main.java.controlp5.Controller : Slider registerProperty(String, String)
main.java.controlp5.Controller : Slider registerTooltip(String)
main.java.controlp5.Controller : Slider removeBehavior()
main.java.controlp5.Controller : Slider removeCallback()
main.java.controlp5.Controller : Slider removeCallback(CallbackListener)
main.java.controlp5.Controller : Slider removeListener(ControlListener)
main.java.controlp5.Controller : Slider removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Slider removeListenersFor(int)
main.java.controlp5.Controller : Slider removeProperty(String)
main.java.controlp5.Controller : Slider removeProperty(String, String)
main.java.controlp5.Controller : Slider setArrayValue(float[])
main.java.controlp5.Controller : Slider setArrayValue(int, float)
main.java.controlp5.Controller : Slider setBehavior(ControlBehavior)
main.java.controlp5.Controller : Slider setBroadcast(boolean)
main.java.controlp5.Controller : Slider setCaptionLabel(String)
main.java.controlp5.Controller : Slider setColor(CColor)
main.java.controlp5.Controller : Slider setColorActive(int)
main.java.controlp5.Controller : Slider setColorBackground(int)
main.java.controlp5.Controller : Slider setColorCaptionLabel(int)
main.java.controlp5.Controller : Slider setColorForeground(int)
main.java.controlp5.Controller : Slider setColorLabel(int)
main.java.controlp5.Controller : Slider setColorValue(int)
main.java.controlp5.Controller : Slider setColorValueLabel(int)
main.java.controlp5.Controller : Slider setDecimalPrecision(int)
main.java.controlp5.Controller : Slider setDefaultValue(float)
main.java.controlp5.Controller : Slider setHeight(int)
main.java.controlp5.Controller : Slider setId(int)
main.java.controlp5.Controller : Slider setImage(PImage)
main.java.controlp5.Controller : Slider setImage(PImage, int)
main.java.controlp5.Controller : Slider setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Slider setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Slider setLabel(String)
main.java.controlp5.Controller : Slider setLabelVisible(boolean)
main.java.controlp5.Controller : Slider setLock(boolean)
main.java.controlp5.Controller : Slider setMax(float)
main.java.controlp5.Controller : Slider setMin(float)
main.java.controlp5.Controller : Slider setMouseOver(boolean)
main.java.controlp5.Controller : Slider setMoveable(boolean)
main.java.controlp5.Controller : Slider setPosition(float, float)
main.java.controlp5.Controller : Slider setPosition(float[])
main.java.controlp5.Controller : Slider setSize(PImage)
main.java.controlp5.Controller : Slider setSize(int, int)
main.java.controlp5.Controller : Slider setStringValue(String)
main.java.controlp5.Controller : Slider setUpdate(boolean)
main.java.controlp5.Controller : Slider setValue(float)
main.java.controlp5.Controller : Slider setValueLabel(String)
main.java.controlp5.Controller : Slider setValueSelf(float)
main.java.controlp5.Controller : Slider setView(ControllerView)
main.java.controlp5.Controller : Slider setVisible(boolean)
main.java.controlp5.Controller : Slider setWidth(int)
main.java.controlp5.Controller : Slider show()
main.java.controlp5.Controller : Slider unlock()
main.java.controlp5.Controller : Slider unplugFrom(Object)
main.java.controlp5.Controller : Slider unplugFrom(Object[])
main.java.controlp5.Controller : Slider unregisterTooltip()
main.java.controlp5.Controller : Slider update()
main.java.controlp5.Controller : Slider updateSize()
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
main.java.controlp5.Slider : ArrayList getTickMarks()
main.java.controlp5.Slider : Slider setColorTickMark(int)
main.java.controlp5.Slider : Slider setHandleSize(int)
main.java.controlp5.Slider : Slider setHeight(int)
main.java.controlp5.Slider : Slider setMax(float)
main.java.controlp5.Slider : Slider setMin(float)
main.java.controlp5.Slider : Slider setNumberOfTickMarks(int)
main.java.controlp5.Slider : Slider setRange(float, float)
main.java.controlp5.Slider : Slider setScrollSensitivity(float)
main.java.controlp5.Slider : Slider setSize(int, int)
main.java.controlp5.Slider : Slider setSliderMode(int)
main.java.controlp5.Slider : Slider setTriggerEvent(int)
main.java.controlp5.Slider : Slider setValue(float)
main.java.controlp5.Slider : Slider setWidth(int)
main.java.controlp5.Slider : Slider showTickMarks(boolean)
main.java.controlp5.Slider : Slider shuffle()
main.java.controlp5.Slider : Slider snapToTickMarks(boolean)
main.java.controlp5.Slider : Slider update()
main.java.controlp5.Slider : TickMark getTickMark(int)
main.java.controlp5.Slider : float getMax()
main.java.controlp5.Slider : float getMin()
main.java.controlp5.Slider : float getValue()
main.java.controlp5.Slider : float getValuePosition()
main.java.controlp5.Slider : int getDirection()
main.java.controlp5.Slider : int getHandleSize()
main.java.controlp5.Slider : int getNumberOfTickMarks()
main.java.controlp5.Slider : int getSliderMode()
main.java.controlp5.Slider : int getTriggerEvent()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:46

*/


