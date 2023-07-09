/**
 * ControlP5 ScrollableList
 *
 * replaces DropdownList and and ListBox. 
 * List can be scrolled by dragging the list or using the scroll-wheel. 
 *
 * by Andreas Schlegel, 2014
 * www.sojamo.de/libraries/controlp5
 *
 */


import controlP5.*;
import java.util.*;


ControlP5 cp5;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  List l = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("dropdown")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l)
     // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
     ;
     
     
}

void draw() {
  background(240);
}

void dropdown(int n) {
  /* request the selected item based on index n */
  println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
  
  /* here an item is stored as a Map  with the following key-value pairs:
   * name, the given name of the item
   * text, the given text of the item by default the same as name
   * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
   * color, the given color of the item, how to change, see below
   * view, a customizable view, is of type CDrawable 
   */
  
   CColor c = new CColor();
  c.setBackground(color(255,0,0));
  cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);
  
}

void keyPressed() {
  switch(key) {
    case('1'):
    /* make the ScrollableList behave like a ListBox */
    cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.LIST);
    break;
    case('2'):
    /* make the ScrollableList behave like a DropdownList */
    cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
    break;
    case('3'):
    /*change content of the ScrollableList */
    List l = Arrays.asList("a-1", "b-1", "c-1", "d-1", "e-1", "f-1", "g-1", "h-1", "i-1", "j-1", "k-1");
    cp5.get(ScrollableList.class, "dropdown").setItems(l);
    break;
    case('4'):
    /* remove an item from the ScrollableList */
    cp5.get(ScrollableList.class, "dropdown").removeItem("k-1");
    break;
    case('5'):
    /* clear the ScrollableList */
    cp5.get(ScrollableList.class, "dropdown").clear();
    break;
  }
}
/*
a list of all methods available for the ScrollableList Controller
use ControlP5.printPublicMethodsFor(ScrollableList.class);
to print the following list into the console.

You can find further details about class ScrollableList in the javadoc.

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
main.java.controlp5.Controller : ScrollableList addCallback(CallbackListener)
main.java.controlp5.Controller : ScrollableList addListener(ControlListener)
main.java.controlp5.Controller : ScrollableList addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ScrollableList align(int, int, int, int)
main.java.controlp5.Controller : ScrollableList bringToFront()
main.java.controlp5.Controller : ScrollableList bringToFront(ControllerInterface)
main.java.controlp5.Controller : ScrollableList hide()
main.java.controlp5.Controller : ScrollableList linebreak()
main.java.controlp5.Controller : ScrollableList listen(boolean)
main.java.controlp5.Controller : ScrollableList lock()
main.java.controlp5.Controller : ScrollableList onChange(CallbackListener)
main.java.controlp5.Controller : ScrollableList onClick(CallbackListener)
main.java.controlp5.Controller : ScrollableList onDoublePress(CallbackListener)
main.java.controlp5.Controller : ScrollableList onDrag(CallbackListener)
main.java.controlp5.Controller : ScrollableList onDraw(ControllerView)
main.java.controlp5.Controller : ScrollableList onEndDrag(CallbackListener)
main.java.controlp5.Controller : ScrollableList onEnter(CallbackListener)
main.java.controlp5.Controller : ScrollableList onLeave(CallbackListener)
main.java.controlp5.Controller : ScrollableList onMove(CallbackListener)
main.java.controlp5.Controller : ScrollableList onPress(CallbackListener)
main.java.controlp5.Controller : ScrollableList onRelease(CallbackListener)
main.java.controlp5.Controller : ScrollableList onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : ScrollableList onStartDrag(CallbackListener)
main.java.controlp5.Controller : ScrollableList onWheel(CallbackListener)
main.java.controlp5.Controller : ScrollableList plugTo(Object)
main.java.controlp5.Controller : ScrollableList plugTo(Object, String)
main.java.controlp5.Controller : ScrollableList plugTo(Object[])
main.java.controlp5.Controller : ScrollableList plugTo(Object[], String)
main.java.controlp5.Controller : ScrollableList registerProperty(String)
main.java.controlp5.Controller : ScrollableList registerProperty(String, String)
main.java.controlp5.Controller : ScrollableList registerTooltip(String)
main.java.controlp5.Controller : ScrollableList removeBehavior()
main.java.controlp5.Controller : ScrollableList removeCallback()
main.java.controlp5.Controller : ScrollableList removeCallback(CallbackListener)
main.java.controlp5.Controller : ScrollableList removeListener(ControlListener)
main.java.controlp5.Controller : ScrollableList removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ScrollableList removeListenersFor(int)
main.java.controlp5.Controller : ScrollableList removeProperty(String)
main.java.controlp5.Controller : ScrollableList removeProperty(String, String)
main.java.controlp5.Controller : ScrollableList setArrayValue(float[])
main.java.controlp5.Controller : ScrollableList setArrayValue(int, float)
main.java.controlp5.Controller : ScrollableList setBehavior(ControlBehavior)
main.java.controlp5.Controller : ScrollableList setBroadcast(boolean)
main.java.controlp5.Controller : ScrollableList setCaptionLabel(String)
main.java.controlp5.Controller : ScrollableList setColor(CColor)
main.java.controlp5.Controller : ScrollableList setColorActive(int)
main.java.controlp5.Controller : ScrollableList setColorBackground(int)
main.java.controlp5.Controller : ScrollableList setColorCaptionLabel(int)
main.java.controlp5.Controller : ScrollableList setColorForeground(int)
main.java.controlp5.Controller : ScrollableList setColorLabel(int)
main.java.controlp5.Controller : ScrollableList setColorValue(int)
main.java.controlp5.Controller : ScrollableList setColorValueLabel(int)
main.java.controlp5.Controller : ScrollableList setDecimalPrecision(int)
main.java.controlp5.Controller : ScrollableList setDefaultValue(float)
main.java.controlp5.Controller : ScrollableList setHeight(int)
main.java.controlp5.Controller : ScrollableList setId(int)
main.java.controlp5.Controller : ScrollableList setImage(PImage)
main.java.controlp5.Controller : ScrollableList setImage(PImage, int)
main.java.controlp5.Controller : ScrollableList setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : ScrollableList setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : ScrollableList setLabel(String)
main.java.controlp5.Controller : ScrollableList setLabelVisible(boolean)
main.java.controlp5.Controller : ScrollableList setLock(boolean)
main.java.controlp5.Controller : ScrollableList setMax(float)
main.java.controlp5.Controller : ScrollableList setMin(float)
main.java.controlp5.Controller : ScrollableList setMouseOver(boolean)
main.java.controlp5.Controller : ScrollableList setMoveable(boolean)
main.java.controlp5.Controller : ScrollableList setPosition(float, float)
main.java.controlp5.Controller : ScrollableList setPosition(float[])
main.java.controlp5.Controller : ScrollableList setSize(PImage)
main.java.controlp5.Controller : ScrollableList setSize(int, int)
main.java.controlp5.Controller : ScrollableList setStringValue(String)
main.java.controlp5.Controller : ScrollableList setUpdate(boolean)
main.java.controlp5.Controller : ScrollableList setValue(float)
main.java.controlp5.Controller : ScrollableList setValueLabel(String)
main.java.controlp5.Controller : ScrollableList setValueSelf(float)
main.java.controlp5.Controller : ScrollableList setView(ControllerView)
main.java.controlp5.Controller : ScrollableList setVisible(boolean)
main.java.controlp5.Controller : ScrollableList setWidth(int)
main.java.controlp5.Controller : ScrollableList show()
main.java.controlp5.Controller : ScrollableList unlock()
main.java.controlp5.Controller : ScrollableList unplugFrom(Object)
main.java.controlp5.Controller : ScrollableList unplugFrom(Object[])
main.java.controlp5.Controller : ScrollableList unregisterTooltip()
main.java.controlp5.Controller : ScrollableList update()
main.java.controlp5.Controller : ScrollableList updateSize()
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
main.java.controlp5.ScrollableList : List getItems()
main.java.controlp5.ScrollableList : Map getItem(String)
main.java.controlp5.ScrollableList : Map getItem(int)
main.java.controlp5.ScrollableList : ScrollableList addItem(String, Object)
main.java.controlp5.ScrollableList : ScrollableList addItems(List)
main.java.controlp5.ScrollableList : ScrollableList addItems(Map)
main.java.controlp5.ScrollableList : ScrollableList addItems(String[])
main.java.controlp5.ScrollableList : ScrollableList clear()
main.java.controlp5.ScrollableList : ScrollableList close()
main.java.controlp5.ScrollableList : ScrollableList open()
main.java.controlp5.ScrollableList : ScrollableList removeItem(String)
main.java.controlp5.ScrollableList : ScrollableList removeItems(List)
main.java.controlp5.ScrollableList : ScrollableList setBackgroundColor(int)
main.java.controlp5.ScrollableList : ScrollableList setBarHeight(int)
main.java.controlp5.ScrollableList : ScrollableList setBarVisible(boolean)
main.java.controlp5.ScrollableList : ScrollableList setItemHeight(int)
main.java.controlp5.ScrollableList : ScrollableList setItems(List)
main.java.controlp5.ScrollableList : ScrollableList setItems(Map)
main.java.controlp5.ScrollableList : ScrollableList setItems(String[])
main.java.controlp5.ScrollableList : ScrollableList setOpen(boolean)
main.java.controlp5.ScrollableList : ScrollableList setScrollSensitivity(float)
main.java.controlp5.ScrollableList : ScrollableList setType(int)
main.java.controlp5.ScrollableList : boolean isBarVisible()
main.java.controlp5.ScrollableList : boolean isOpen()
main.java.controlp5.ScrollableList : int getBackgroundColor()
main.java.controlp5.ScrollableList : int getBarHeight()
main.java.controlp5.ScrollableList : int getHeight()
main.java.controlp5.ScrollableList : void controlEvent(ControlEvent)
main.java.controlp5.ScrollableList : void keyEvent(KeyEvent)
main.java.controlp5.ScrollableList : void setDirection(int)
main.java.controlp5.ScrollableList : void updateItemIndexOffset()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:22

*/


