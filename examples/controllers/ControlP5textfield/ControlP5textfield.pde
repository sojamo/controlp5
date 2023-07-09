/**
* ControlP5 Textfield
*
*
* find a list of public methods available for the Textfield Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

String textValue = "";

void setup() {
  size(700,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
                 
  cp5.addTextfield("textValue")
     .setPosition(20,170)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     ;
       
  cp5.addBang("clear")
     .setPosition(240,170)
     .setSize(80,40)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;    
  
  cp5.addTextfield("default")
     .setPosition(20,350)
     .setAutoClear(false)
     ;
     
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  text(cp5.get(Textfield.class,"input").getText(), 360,130);
  text(textValue, 360,180);
}

public void clear() {
  cp5.get(Textfield.class,"textValue").clear();
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }
}


public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}




/*
a list of all methods available for the Textfield Controller
use ControlP5.printPublicMethodsFor(Textfield.class);
to print the following list into the console.

You can find further details about class Textfield in the javadoc.

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
main.java.controlp5.Controller : Textfield addCallback(CallbackListener)
main.java.controlp5.Controller : Textfield addListener(ControlListener)
main.java.controlp5.Controller : Textfield addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Textfield align(int, int, int, int)
main.java.controlp5.Controller : Textfield bringToFront()
main.java.controlp5.Controller : Textfield bringToFront(ControllerInterface)
main.java.controlp5.Controller : Textfield hide()
main.java.controlp5.Controller : Textfield linebreak()
main.java.controlp5.Controller : Textfield listen(boolean)
main.java.controlp5.Controller : Textfield lock()
main.java.controlp5.Controller : Textfield onChange(CallbackListener)
main.java.controlp5.Controller : Textfield onClick(CallbackListener)
main.java.controlp5.Controller : Textfield onDoublePress(CallbackListener)
main.java.controlp5.Controller : Textfield onDrag(CallbackListener)
main.java.controlp5.Controller : Textfield onDraw(ControllerView)
main.java.controlp5.Controller : Textfield onEndDrag(CallbackListener)
main.java.controlp5.Controller : Textfield onEnter(CallbackListener)
main.java.controlp5.Controller : Textfield onLeave(CallbackListener)
main.java.controlp5.Controller : Textfield onMove(CallbackListener)
main.java.controlp5.Controller : Textfield onPress(CallbackListener)
main.java.controlp5.Controller : Textfield onRelease(CallbackListener)
main.java.controlp5.Controller : Textfield onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Textfield onStartDrag(CallbackListener)
main.java.controlp5.Controller : Textfield onWheel(CallbackListener)
main.java.controlp5.Controller : Textfield plugTo(Object)
main.java.controlp5.Controller : Textfield plugTo(Object, String)
main.java.controlp5.Controller : Textfield plugTo(Object[])
main.java.controlp5.Controller : Textfield plugTo(Object[], String)
main.java.controlp5.Controller : Textfield registerProperty(String)
main.java.controlp5.Controller : Textfield registerProperty(String, String)
main.java.controlp5.Controller : Textfield registerTooltip(String)
main.java.controlp5.Controller : Textfield removeBehavior()
main.java.controlp5.Controller : Textfield removeCallback()
main.java.controlp5.Controller : Textfield removeCallback(CallbackListener)
main.java.controlp5.Controller : Textfield removeListener(ControlListener)
main.java.controlp5.Controller : Textfield removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Textfield removeListenersFor(int)
main.java.controlp5.Controller : Textfield removeProperty(String)
main.java.controlp5.Controller : Textfield removeProperty(String, String)
main.java.controlp5.Controller : Textfield setArrayValue(float[])
main.java.controlp5.Controller : Textfield setArrayValue(int, float)
main.java.controlp5.Controller : Textfield setBehavior(ControlBehavior)
main.java.controlp5.Controller : Textfield setBroadcast(boolean)
main.java.controlp5.Controller : Textfield setCaptionLabel(String)
main.java.controlp5.Controller : Textfield setColor(CColor)
main.java.controlp5.Controller : Textfield setColorActive(int)
main.java.controlp5.Controller : Textfield setColorBackground(int)
main.java.controlp5.Controller : Textfield setColorCaptionLabel(int)
main.java.controlp5.Controller : Textfield setColorForeground(int)
main.java.controlp5.Controller : Textfield setColorLabel(int)
main.java.controlp5.Controller : Textfield setColorValue(int)
main.java.controlp5.Controller : Textfield setColorValueLabel(int)
main.java.controlp5.Controller : Textfield setDecimalPrecision(int)
main.java.controlp5.Controller : Textfield setDefaultValue(float)
main.java.controlp5.Controller : Textfield setHeight(int)
main.java.controlp5.Controller : Textfield setId(int)
main.java.controlp5.Controller : Textfield setImage(PImage)
main.java.controlp5.Controller : Textfield setImage(PImage, int)
main.java.controlp5.Controller : Textfield setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Textfield setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Textfield setLabel(String)
main.java.controlp5.Controller : Textfield setLabelVisible(boolean)
main.java.controlp5.Controller : Textfield setLock(boolean)
main.java.controlp5.Controller : Textfield setMax(float)
main.java.controlp5.Controller : Textfield setMin(float)
main.java.controlp5.Controller : Textfield setMouseOver(boolean)
main.java.controlp5.Controller : Textfield setMoveable(boolean)
main.java.controlp5.Controller : Textfield setPosition(float, float)
main.java.controlp5.Controller : Textfield setPosition(float[])
main.java.controlp5.Controller : Textfield setSize(PImage)
main.java.controlp5.Controller : Textfield setSize(int, int)
main.java.controlp5.Controller : Textfield setStringValue(String)
main.java.controlp5.Controller : Textfield setUpdate(boolean)
main.java.controlp5.Controller : Textfield setValue(float)
main.java.controlp5.Controller : Textfield setValueLabel(String)
main.java.controlp5.Controller : Textfield setValueSelf(float)
main.java.controlp5.Controller : Textfield setView(ControllerView)
main.java.controlp5.Controller : Textfield setVisible(boolean)
main.java.controlp5.Controller : Textfield setWidth(int)
main.java.controlp5.Controller : Textfield show()
main.java.controlp5.Controller : Textfield unlock()
main.java.controlp5.Controller : Textfield unplugFrom(Object)
main.java.controlp5.Controller : Textfield unplugFrom(Object[])
main.java.controlp5.Controller : Textfield unregisterTooltip()
main.java.controlp5.Controller : Textfield update()
main.java.controlp5.Controller : Textfield updateSize()
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
main.java.controlp5.Textfield : String getText()
main.java.controlp5.Textfield : String[] getTextList()
main.java.controlp5.Textfield : Textfield clear()
main.java.controlp5.Textfield : Textfield keepFocus(boolean)
main.java.controlp5.Textfield : Textfield setAutoClear(boolean)
main.java.controlp5.Textfield : Textfield setColor(int)
main.java.controlp5.Textfield : Textfield setColorCursor(int)
main.java.controlp5.Textfield : Textfield setFocus(boolean)
main.java.controlp5.Textfield : Textfield setFont(ControlFont)
main.java.controlp5.Textfield : Textfield setFont(PFont)
main.java.controlp5.Textfield : Textfield setFont(int)
main.java.controlp5.Textfield : Textfield setHeight(int)
main.java.controlp5.Textfield : Textfield setInputFilter(int)
main.java.controlp5.Textfield : Textfield setPasswordMode(boolean)
main.java.controlp5.Textfield : Textfield setSize(int, int)
main.java.controlp5.Textfield : Textfield setText(String)
main.java.controlp5.Textfield : Textfield setValue(String)
main.java.controlp5.Textfield : Textfield setValue(float)
main.java.controlp5.Textfield : Textfield setWidth(int)
main.java.controlp5.Textfield : Textfield submit()
main.java.controlp5.Textfield : boolean isAutoClear()
main.java.controlp5.Textfield : boolean isFocus()
main.java.controlp5.Textfield : int getIndex()
main.java.controlp5.Textfield : void draw(PGraphics)
main.java.controlp5.Textfield : void keyEvent(KeyEvent)
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:31

*/


