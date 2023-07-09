/**
 * ControlP5 Button
 * this example shows how to create buttons with controlP5.
 * 
 * find a list of public methods available for the Button Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 
import controlP5.*;

ControlP5 cp5;

int myColor = color(255);

int c1,c2;

float n,n1;


void setup() {
  size(400,600);
  noStroke();
  cp5 = new ControlP5(this);
  
  // create a new button with name 'buttonA'
  cp5.addButton("colorA")
     .setValue(0)
     .setPosition(100,100)
     .setSize(200,19)
     ;
  
  // and add another 2 buttons
  cp5.addButton("colorB")
     .setValue(100)
     .setPosition(100,120)
     .setSize(200,19)
     ;
     
  cp5.addButton("colorC")
     .setPosition(100,140)
     .setSize(200,19)
     .setValue(0)
     ;

  PImage[] imgs = {loadImage("button_a.png"),loadImage("button_b.png"),loadImage("button_c.png")};
  cp5.addButton("play")
     .setValue(128)
     .setPosition(140,300)
     .setImages(imgs)
     .updateSize()
     ;
     
  cp5.addButton("playAgain")
     .setValue(128)
     .setPosition(210,300)
     .setImages(imgs)
     .updateSize()
     ;

}

void draw() {
  background(myColor);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1; 
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}

// function colorA will receive changes from 
// controller with name colorA
public void colorA(int theValue) {
  println("a button event from colorA: "+theValue);
  c1 = c2;
  c2 = color(0,160,100);
}

// function colorB will receive changes from 
// controller with name colorB
public void colorB(int theValue) {
  println("a button event from colorB: "+theValue);
  c1 = c2;
  c2 = color(150,0,0);
}

// function colorC will receive changes from 
// controller with name colorC
public void colorC(int theValue) {
  println("a button event from colorC: "+theValue);
  c1 = c2;
  c2 = color(255,255,0);
}

public void play(int theValue) {
  println("a button event from buttonB: "+theValue);
  c1 = c2;
  c2 = color(0,0,0);
}


/*
a list of all methods available for the Button Controller
use ControlP5.printPublicMethodsFor(Button.class);
to print the following list into the console.

You can find further details about class Button in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Button : Button activateBy(int)
main.java.controlp5.Button : Button setOff()
main.java.controlp5.Button : Button setOn()
main.java.controlp5.Button : Button setSwitch(boolean)
main.java.controlp5.Button : Button setValue(float)
main.java.controlp5.Button : Button update()
main.java.controlp5.Button : String getInfo()
main.java.controlp5.Button : String toString()
main.java.controlp5.Button : boolean getBooleanValue()
main.java.controlp5.Button : boolean isOn()
main.java.controlp5.Button : boolean isPressed()
main.java.controlp5.Button : boolean isSwitch()
main.java.controlp5.Controller : Button addCallback(CallbackListener)
main.java.controlp5.Controller : Button addListener(ControlListener)
main.java.controlp5.Controller : Button addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Button align(int, int, int, int)
main.java.controlp5.Controller : Button bringToFront()
main.java.controlp5.Controller : Button bringToFront(ControllerInterface)
main.java.controlp5.Controller : Button hide()
main.java.controlp5.Controller : Button linebreak()
main.java.controlp5.Controller : Button listen(boolean)
main.java.controlp5.Controller : Button lock()
main.java.controlp5.Controller : Button onChange(CallbackListener)
main.java.controlp5.Controller : Button onClick(CallbackListener)
main.java.controlp5.Controller : Button onDoublePress(CallbackListener)
main.java.controlp5.Controller : Button onDrag(CallbackListener)
main.java.controlp5.Controller : Button onDraw(ControllerView)
main.java.controlp5.Controller : Button onEndDrag(CallbackListener)
main.java.controlp5.Controller : Button onEnter(CallbackListener)
main.java.controlp5.Controller : Button onLeave(CallbackListener)
main.java.controlp5.Controller : Button onMove(CallbackListener)
main.java.controlp5.Controller : Button onPress(CallbackListener)
main.java.controlp5.Controller : Button onRelease(CallbackListener)
main.java.controlp5.Controller : Button onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Button onStartDrag(CallbackListener)
main.java.controlp5.Controller : Button onWheel(CallbackListener)
main.java.controlp5.Controller : Button plugTo(Object)
main.java.controlp5.Controller : Button plugTo(Object, String)
main.java.controlp5.Controller : Button plugTo(Object[])
main.java.controlp5.Controller : Button plugTo(Object[], String)
main.java.controlp5.Controller : Button registerProperty(String)
main.java.controlp5.Controller : Button registerProperty(String, String)
main.java.controlp5.Controller : Button registerTooltip(String)
main.java.controlp5.Controller : Button removeBehavior()
main.java.controlp5.Controller : Button removeCallback()
main.java.controlp5.Controller : Button removeCallback(CallbackListener)
main.java.controlp5.Controller : Button removeListener(ControlListener)
main.java.controlp5.Controller : Button removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Button removeListenersFor(int)
main.java.controlp5.Controller : Button removeProperty(String)
main.java.controlp5.Controller : Button removeProperty(String, String)
main.java.controlp5.Controller : Button setArrayValue(float[])
main.java.controlp5.Controller : Button setArrayValue(int, float)
main.java.controlp5.Controller : Button setBehavior(ControlBehavior)
main.java.controlp5.Controller : Button setBroadcast(boolean)
main.java.controlp5.Controller : Button setCaptionLabel(String)
main.java.controlp5.Controller : Button setColor(CColor)
main.java.controlp5.Controller : Button setColorActive(int)
main.java.controlp5.Controller : Button setColorBackground(int)
main.java.controlp5.Controller : Button setColorCaptionLabel(int)
main.java.controlp5.Controller : Button setColorForeground(int)
main.java.controlp5.Controller : Button setColorLabel(int)
main.java.controlp5.Controller : Button setColorValue(int)
main.java.controlp5.Controller : Button setColorValueLabel(int)
main.java.controlp5.Controller : Button setDecimalPrecision(int)
main.java.controlp5.Controller : Button setDefaultValue(float)
main.java.controlp5.Controller : Button setHeight(int)
main.java.controlp5.Controller : Button setId(int)
main.java.controlp5.Controller : Button setImage(PImage)
main.java.controlp5.Controller : Button setImage(PImage, int)
main.java.controlp5.Controller : Button setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Button setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Button setLabel(String)
main.java.controlp5.Controller : Button setLabelVisible(boolean)
main.java.controlp5.Controller : Button setLock(boolean)
main.java.controlp5.Controller : Button setMax(float)
main.java.controlp5.Controller : Button setMin(float)
main.java.controlp5.Controller : Button setMouseOver(boolean)
main.java.controlp5.Controller : Button setMoveable(boolean)
main.java.controlp5.Controller : Button setPosition(float, float)
main.java.controlp5.Controller : Button setPosition(float[])
main.java.controlp5.Controller : Button setSize(PImage)
main.java.controlp5.Controller : Button setSize(int, int)
main.java.controlp5.Controller : Button setStringValue(String)
main.java.controlp5.Controller : Button setUpdate(boolean)
main.java.controlp5.Controller : Button setValue(float)
main.java.controlp5.Controller : Button setValueLabel(String)
main.java.controlp5.Controller : Button setValueSelf(float)
main.java.controlp5.Controller : Button setView(ControllerView)
main.java.controlp5.Controller : Button setVisible(boolean)
main.java.controlp5.Controller : Button setWidth(int)
main.java.controlp5.Controller : Button show()
main.java.controlp5.Controller : Button unlock()
main.java.controlp5.Controller : Button unplugFrom(Object)
main.java.controlp5.Controller : Button unplugFrom(Object[])
main.java.controlp5.Controller : Button unregisterTooltip()
main.java.controlp5.Controller : Button update()
main.java.controlp5.Controller : Button updateSize()
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

created: 2015/03/24 12:20:49

*/


