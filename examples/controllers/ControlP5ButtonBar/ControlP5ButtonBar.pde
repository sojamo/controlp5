/**
 * ControlP5 ButtonBar
 * 
 * work-in-progress
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 

import controlP5.*;

ControlP5 cp5;


void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(400, 20)
     .addItems(split("a b c d e f g h i j"," "))
     ;
     println(b.getItem("a"));
  b.changeItem("a","text","first");
  b.changeItem("b","text","second");
  b.changeItem("c","text","third");
  b.onMove(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar bar = (ButtonBar)ev.getController();
      println("hello ",bar.hover());
    }
  });
}

void bar(int n) {
  println("bar clicked, item-value:", n);
}

void draw() {
  background(220);
}

/*
a list of all methods available for the ButtonBar Controller
use ControlP5.printPublicMethodsFor(ButtonBar.class);
to print the following list into the console.

You can find further details about class ButtonBar in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ButtonBar : ButtonBar addItem(String, Object)
main.java.controlp5.ButtonBar : ButtonBar addItems(List)
main.java.controlp5.ButtonBar : ButtonBar addItems(Map)
main.java.controlp5.ButtonBar : ButtonBar addItems(String[])
main.java.controlp5.ButtonBar : ButtonBar clear()
main.java.controlp5.ButtonBar : ButtonBar removeItem(String)
main.java.controlp5.ButtonBar : ButtonBar removeItems(List)
main.java.controlp5.ButtonBar : ButtonBar setItems(List)
main.java.controlp5.ButtonBar : ButtonBar setItems(Map)
main.java.controlp5.ButtonBar : ButtonBar setItems(String[])
main.java.controlp5.ButtonBar : List getItems()
main.java.controlp5.ButtonBar : Map getItem(String)
main.java.controlp5.ButtonBar : int hover()
main.java.controlp5.ButtonBar : void changeItem(String, String, Object)
main.java.controlp5.ButtonBar : void onClick()
main.java.controlp5.Controller : ButtonBar addCallback(CallbackListener)
main.java.controlp5.Controller : ButtonBar addListener(ControlListener)
main.java.controlp5.Controller : ButtonBar addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ButtonBar align(int, int, int, int)
main.java.controlp5.Controller : ButtonBar bringToFront()
main.java.controlp5.Controller : ButtonBar bringToFront(ControllerInterface)
main.java.controlp5.Controller : ButtonBar hide()
main.java.controlp5.Controller : ButtonBar linebreak()
main.java.controlp5.Controller : ButtonBar listen(boolean)
main.java.controlp5.Controller : ButtonBar lock()
main.java.controlp5.Controller : ButtonBar onChange(CallbackListener)
main.java.controlp5.Controller : ButtonBar onClick(CallbackListener)
main.java.controlp5.Controller : ButtonBar onDoublePress(CallbackListener)
main.java.controlp5.Controller : ButtonBar onDrag(CallbackListener)
main.java.controlp5.Controller : ButtonBar onDraw(ControllerView)
main.java.controlp5.Controller : ButtonBar onEndDrag(CallbackListener)
main.java.controlp5.Controller : ButtonBar onEnter(CallbackListener)
main.java.controlp5.Controller : ButtonBar onLeave(CallbackListener)
main.java.controlp5.Controller : ButtonBar onMove(CallbackListener)
main.java.controlp5.Controller : ButtonBar onPress(CallbackListener)
main.java.controlp5.Controller : ButtonBar onRelease(CallbackListener)
main.java.controlp5.Controller : ButtonBar onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : ButtonBar onStartDrag(CallbackListener)
main.java.controlp5.Controller : ButtonBar onWheel(CallbackListener)
main.java.controlp5.Controller : ButtonBar plugTo(Object)
main.java.controlp5.Controller : ButtonBar plugTo(Object, String)
main.java.controlp5.Controller : ButtonBar plugTo(Object[])
main.java.controlp5.Controller : ButtonBar plugTo(Object[], String)
main.java.controlp5.Controller : ButtonBar registerProperty(String)
main.java.controlp5.Controller : ButtonBar registerProperty(String, String)
main.java.controlp5.Controller : ButtonBar registerTooltip(String)
main.java.controlp5.Controller : ButtonBar removeBehavior()
main.java.controlp5.Controller : ButtonBar removeCallback()
main.java.controlp5.Controller : ButtonBar removeCallback(CallbackListener)
main.java.controlp5.Controller : ButtonBar removeListener(ControlListener)
main.java.controlp5.Controller : ButtonBar removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ButtonBar removeListenersFor(int)
main.java.controlp5.Controller : ButtonBar removeProperty(String)
main.java.controlp5.Controller : ButtonBar removeProperty(String, String)
main.java.controlp5.Controller : ButtonBar setArrayValue(float[])
main.java.controlp5.Controller : ButtonBar setArrayValue(int, float)
main.java.controlp5.Controller : ButtonBar setBehavior(ControlBehavior)
main.java.controlp5.Controller : ButtonBar setBroadcast(boolean)
main.java.controlp5.Controller : ButtonBar setCaptionLabel(String)
main.java.controlp5.Controller : ButtonBar setColor(CColor)
main.java.controlp5.Controller : ButtonBar setColorActive(int)
main.java.controlp5.Controller : ButtonBar setColorBackground(int)
main.java.controlp5.Controller : ButtonBar setColorCaptionLabel(int)
main.java.controlp5.Controller : ButtonBar setColorForeground(int)
main.java.controlp5.Controller : ButtonBar setColorLabel(int)
main.java.controlp5.Controller : ButtonBar setColorValue(int)
main.java.controlp5.Controller : ButtonBar setColorValueLabel(int)
main.java.controlp5.Controller : ButtonBar setDecimalPrecision(int)
main.java.controlp5.Controller : ButtonBar setDefaultValue(float)
main.java.controlp5.Controller : ButtonBar setHeight(int)
main.java.controlp5.Controller : ButtonBar setId(int)
main.java.controlp5.Controller : ButtonBar setImage(PImage)
main.java.controlp5.Controller : ButtonBar setImage(PImage, int)
main.java.controlp5.Controller : ButtonBar setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : ButtonBar setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : ButtonBar setLabel(String)
main.java.controlp5.Controller : ButtonBar setLabelVisible(boolean)
main.java.controlp5.Controller : ButtonBar setLock(boolean)
main.java.controlp5.Controller : ButtonBar setMax(float)
main.java.controlp5.Controller : ButtonBar setMin(float)
main.java.controlp5.Controller : ButtonBar setMouseOver(boolean)
main.java.controlp5.Controller : ButtonBar setMoveable(boolean)
main.java.controlp5.Controller : ButtonBar setPosition(float, float)
main.java.controlp5.Controller : ButtonBar setPosition(float[])
main.java.controlp5.Controller : ButtonBar setSize(PImage)
main.java.controlp5.Controller : ButtonBar setSize(int, int)
main.java.controlp5.Controller : ButtonBar setStringValue(String)
main.java.controlp5.Controller : ButtonBar setUpdate(boolean)
main.java.controlp5.Controller : ButtonBar setValue(float)
main.java.controlp5.Controller : ButtonBar setValueLabel(String)
main.java.controlp5.Controller : ButtonBar setValueSelf(float)
main.java.controlp5.Controller : ButtonBar setView(ControllerView)
main.java.controlp5.Controller : ButtonBar setVisible(boolean)
main.java.controlp5.Controller : ButtonBar setWidth(int)
main.java.controlp5.Controller : ButtonBar show()
main.java.controlp5.Controller : ButtonBar unlock()
main.java.controlp5.Controller : ButtonBar unplugFrom(Object)
main.java.controlp5.Controller : ButtonBar unplugFrom(Object[])
main.java.controlp5.Controller : ButtonBar unregisterTooltip()
main.java.controlp5.Controller : ButtonBar update()
main.java.controlp5.Controller : ButtonBar updateSize()
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

created: 2015/03/24 12:20:51

*/


