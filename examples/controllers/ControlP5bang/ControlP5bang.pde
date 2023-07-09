/**
 * ControlP5 Bang
 * A bang triggers an event that can be received by a function named after the bang.
 * By default a bang is triggered when pressed, this can be changed to 'release' 
 * using theBang.setTriggerEvent(Bang.RELEASE).
 *
 * find a list of public methods available for the Bang Controller 
 * at the bottom of this sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 * 
 */

import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0, 0, 0);

color[] col = new color[] {
  color(100), color(150), color(200), color(250)
};


void setup() {
  size(400, 600);
  noStroke();
  cp5 = new ControlP5(this);
  for (int i=0;i<col.length;i++) {
    cp5.addBang("bang"+i)
       .setPosition(40+i*80, 200)
       .setSize(40, 40)
       .setId(i)
       ;
  }
  
  // change the trigger event, by default it is PRESSED.
  cp5.addBang("bang")
     .setPosition(40, 300)
     .setSize(280, 40)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("changeBackground")
     ;
           
}

void draw() {
  background(myColorBackground);
  for (int i=0;i<col.length;i++) {
    fill(col[i]);
    rect(40+i*80, 50, 40, 80);
  }
}


public void bang() {
  int theColor = (int)random(255);
  myColorBackground = color(theColor);
  println("### bang(). a bang event. setting background to "+theColor);
}

public void controlEvent(ControlEvent theEvent) {
  for (int i=0;i<col.length;i++) {
    if (theEvent.getController().getName().equals("bang"+i)) {
      col[i] = color(random(255));
    }
  }
  
  println(
  "## controlEvent / id:"+theEvent.controller().getId()+
    " / name:"+theEvent.controller().getName()+
    " / value:"+theEvent.controller().getValue()
    );
}


/*
a list of all methods available for the Bang Controller
use ControlP5.printPublicMethodsFor(Bang.class);
to print the following list into the console.

You can find further details about class Bang in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Bang : Bang setTriggerEvent(int)
main.java.controlp5.Bang : Bang setValue(float)
main.java.controlp5.Bang : Bang update()
main.java.controlp5.Bang : String getInfo()
main.java.controlp5.Bang : String toString()
main.java.controlp5.Bang : int getTriggerEvent()
main.java.controlp5.Controller : Bang addCallback(CallbackListener)
main.java.controlp5.Controller : Bang addListener(ControlListener)
main.java.controlp5.Controller : Bang addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Bang align(int, int, int, int)
main.java.controlp5.Controller : Bang bringToFront()
main.java.controlp5.Controller : Bang bringToFront(ControllerInterface)
main.java.controlp5.Controller : Bang hide()
main.java.controlp5.Controller : Bang linebreak()
main.java.controlp5.Controller : Bang listen(boolean)
main.java.controlp5.Controller : Bang lock()
main.java.controlp5.Controller : Bang onChange(CallbackListener)
main.java.controlp5.Controller : Bang onClick(CallbackListener)
main.java.controlp5.Controller : Bang onDoublePress(CallbackListener)
main.java.controlp5.Controller : Bang onDrag(CallbackListener)
main.java.controlp5.Controller : Bang onDraw(ControllerView)
main.java.controlp5.Controller : Bang onEndDrag(CallbackListener)
main.java.controlp5.Controller : Bang onEnter(CallbackListener)
main.java.controlp5.Controller : Bang onLeave(CallbackListener)
main.java.controlp5.Controller : Bang onMove(CallbackListener)
main.java.controlp5.Controller : Bang onPress(CallbackListener)
main.java.controlp5.Controller : Bang onRelease(CallbackListener)
main.java.controlp5.Controller : Bang onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Bang onStartDrag(CallbackListener)
main.java.controlp5.Controller : Bang onWheel(CallbackListener)
main.java.controlp5.Controller : Bang plugTo(Object)
main.java.controlp5.Controller : Bang plugTo(Object, String)
main.java.controlp5.Controller : Bang plugTo(Object[])
main.java.controlp5.Controller : Bang plugTo(Object[], String)
main.java.controlp5.Controller : Bang registerProperty(String)
main.java.controlp5.Controller : Bang registerProperty(String, String)
main.java.controlp5.Controller : Bang registerTooltip(String)
main.java.controlp5.Controller : Bang removeBehavior()
main.java.controlp5.Controller : Bang removeCallback()
main.java.controlp5.Controller : Bang removeCallback(CallbackListener)
main.java.controlp5.Controller : Bang removeListener(ControlListener)
main.java.controlp5.Controller : Bang removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Bang removeListenersFor(int)
main.java.controlp5.Controller : Bang removeProperty(String)
main.java.controlp5.Controller : Bang removeProperty(String, String)
main.java.controlp5.Controller : Bang setArrayValue(float[])
main.java.controlp5.Controller : Bang setArrayValue(int, float)
main.java.controlp5.Controller : Bang setBehavior(ControlBehavior)
main.java.controlp5.Controller : Bang setBroadcast(boolean)
main.java.controlp5.Controller : Bang setCaptionLabel(String)
main.java.controlp5.Controller : Bang setColor(CColor)
main.java.controlp5.Controller : Bang setColorActive(int)
main.java.controlp5.Controller : Bang setColorBackground(int)
main.java.controlp5.Controller : Bang setColorCaptionLabel(int)
main.java.controlp5.Controller : Bang setColorForeground(int)
main.java.controlp5.Controller : Bang setColorLabel(int)
main.java.controlp5.Controller : Bang setColorValue(int)
main.java.controlp5.Controller : Bang setColorValueLabel(int)
main.java.controlp5.Controller : Bang setDecimalPrecision(int)
main.java.controlp5.Controller : Bang setDefaultValue(float)
main.java.controlp5.Controller : Bang setHeight(int)
main.java.controlp5.Controller : Bang setId(int)
main.java.controlp5.Controller : Bang setImage(PImage)
main.java.controlp5.Controller : Bang setImage(PImage, int)
main.java.controlp5.Controller : Bang setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Bang setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Bang setLabel(String)
main.java.controlp5.Controller : Bang setLabelVisible(boolean)
main.java.controlp5.Controller : Bang setLock(boolean)
main.java.controlp5.Controller : Bang setMax(float)
main.java.controlp5.Controller : Bang setMin(float)
main.java.controlp5.Controller : Bang setMouseOver(boolean)
main.java.controlp5.Controller : Bang setMoveable(boolean)
main.java.controlp5.Controller : Bang setPosition(float, float)
main.java.controlp5.Controller : Bang setPosition(float[])
main.java.controlp5.Controller : Bang setSize(PImage)
main.java.controlp5.Controller : Bang setSize(int, int)
main.java.controlp5.Controller : Bang setStringValue(String)
main.java.controlp5.Controller : Bang setUpdate(boolean)
main.java.controlp5.Controller : Bang setValue(float)
main.java.controlp5.Controller : Bang setValueLabel(String)
main.java.controlp5.Controller : Bang setValueSelf(float)
main.java.controlp5.Controller : Bang setView(ControllerView)
main.java.controlp5.Controller : Bang setVisible(boolean)
main.java.controlp5.Controller : Bang setWidth(int)
main.java.controlp5.Controller : Bang show()
main.java.controlp5.Controller : Bang unlock()
main.java.controlp5.Controller : Bang unplugFrom(Object)
main.java.controlp5.Controller : Bang unplugFrom(Object[])
main.java.controlp5.Controller : Bang unregisterTooltip()
main.java.controlp5.Controller : Bang update()
main.java.controlp5.Controller : Bang updateSize()
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

created: 2015/03/24 12:25:36

*/


