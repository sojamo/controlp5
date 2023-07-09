/**
 *
 * DEPRECATED, use ScrollableList instead.
 * 
 * Control5 DropdownList
 * A dropdownList controller, extends the ListBox controller.
 * the most recently selected dropdownlist item is displayed inside
 * the menu bar of the DropdownList.
 *
 * find a list of public methods available for the DropdownList Controller 
 * at the bottom of this sketch's source code
 *
 *
 * by andreas schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 */

import controlP5.*;

ControlP5 cp5;

DropdownList d1, d2;

int cnt = 0;

void setup() {
  size(700, 400 );
  cp5 = new ControlP5(this);
  
  // DropdownList is DEPRECATED, 
  // use ScrollableList instead, 
  // see example ControlP5scrollableList
  
  
  
  
  
  
  
  
  
  
  
  
  
  // create a DropdownList, 
  d1 = cp5.addDropdownList("myList-d1")
          .setPosition(100, 100)
          ;
          
  customize(d1); // customize the first list
  
  // create a second DropdownList
  d2 = cp5.addDropdownList("myList-d2")
          .setPosition(400, 100)
          .setSize(200,200)
          ;
  
  customize(d2); // customize the second list
}


void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set("dropdown");
  for (int i=0;i<40;i++) {
    ddl.addItem("item "+i, i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}



void keyPressed() {
  // some key events to change the properties of DropdownList d1
  if (key=='1') {
    // set the height of a pulldown menu, should always be a multiple of itemHeight
    d1.setHeight(210);
  } 
  else if (key=='2') {
    // set the height of a pulldown menu, should always be a multiple of itemHeight
    d1.setHeight(120);
  }
  else if (key=='3') {
    // set the height of a pulldown menu item, should always be a fraction of the pulldown menu
    d1.setItemHeight(30);
  } 
  else if (key=='4') {
    // set the height of a pulldown menu item, should always be a fraction of the pulldown menu
    d1.setItemHeight(12);
    d1.setBackgroundColor(color(255));
  } 
  else if (key=='5') {
    // add new items to the pulldown menu
    int n = (int)(random(100000));
    d1.addItem("item "+n, n);
  } 
  else if (key=='6') {
    // remove items from the pulldown menu  by name
    d1.removeItem("item "+cnt);
    cnt++;
  }
  else if (key=='7') {
    d1.clear();
  }
}

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

void draw() {
  background(128);
}

/* 
a list of all methods available for the DropdownList Controller
use ControlP5.printPublicMethodsFor(DropdownList.class);
to print the following list into the console.

You can find further details about class DropdownList in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ControlBehavior getBehavior()
main.java.controlp5.Controller : ControlWindow getControlWindow()
main.java.controlp5.Controller : ControlWindow getWindow()
main.java.controlp5.Controller : ControllerProperty getProperty(String)
main.java.controlp5.Controller : ControllerProperty getProperty(String, String)
main.java.controlp5.Controller : ControllerView getView()
main.java.controlp5.Controller : DropdownList addCallback(CallbackListener)
main.java.controlp5.Controller : DropdownList addListener(ControlListener)
main.java.controlp5.Controller : DropdownList addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : DropdownList align(int, int, int, int)
main.java.controlp5.Controller : DropdownList bringToFront()
main.java.controlp5.Controller : DropdownList bringToFront(ControllerInterface)
main.java.controlp5.Controller : DropdownList hide()
main.java.controlp5.Controller : DropdownList linebreak()
main.java.controlp5.Controller : DropdownList listen(boolean)
main.java.controlp5.Controller : DropdownList lock()
main.java.controlp5.Controller : DropdownList onChange(CallbackListener)
main.java.controlp5.Controller : DropdownList onClick(CallbackListener)
main.java.controlp5.Controller : DropdownList onDoublePress(CallbackListener)
main.java.controlp5.Controller : DropdownList onDrag(CallbackListener)
main.java.controlp5.Controller : DropdownList onDraw(ControllerView)
main.java.controlp5.Controller : DropdownList onEndDrag(CallbackListener)
main.java.controlp5.Controller : DropdownList onEnter(CallbackListener)
main.java.controlp5.Controller : DropdownList onLeave(CallbackListener)
main.java.controlp5.Controller : DropdownList onMove(CallbackListener)
main.java.controlp5.Controller : DropdownList onPress(CallbackListener)
main.java.controlp5.Controller : DropdownList onRelease(CallbackListener)
main.java.controlp5.Controller : DropdownList onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : DropdownList onStartDrag(CallbackListener)
main.java.controlp5.Controller : DropdownList onWheel(CallbackListener)
main.java.controlp5.Controller : DropdownList plugTo(Object)
main.java.controlp5.Controller : DropdownList plugTo(Object, String)
main.java.controlp5.Controller : DropdownList plugTo(Object[])
main.java.controlp5.Controller : DropdownList plugTo(Object[], String)
main.java.controlp5.Controller : DropdownList registerProperty(String)
main.java.controlp5.Controller : DropdownList registerProperty(String, String)
main.java.controlp5.Controller : DropdownList registerTooltip(String)
main.java.controlp5.Controller : DropdownList removeBehavior()
main.java.controlp5.Controller : DropdownList removeCallback()
main.java.controlp5.Controller : DropdownList removeCallback(CallbackListener)
main.java.controlp5.Controller : DropdownList removeListener(ControlListener)
main.java.controlp5.Controller : DropdownList removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : DropdownList removeListenersFor(int)
main.java.controlp5.Controller : DropdownList removeProperty(String)
main.java.controlp5.Controller : DropdownList removeProperty(String, String)
main.java.controlp5.Controller : DropdownList setArrayValue(float[])
main.java.controlp5.Controller : DropdownList setArrayValue(int, float)
main.java.controlp5.Controller : DropdownList setBehavior(ControlBehavior)
main.java.controlp5.Controller : DropdownList setBroadcast(boolean)
main.java.controlp5.Controller : DropdownList setCaptionLabel(String)
main.java.controlp5.Controller : DropdownList setColor(CColor)
main.java.controlp5.Controller : DropdownList setColorActive(int)
main.java.controlp5.Controller : DropdownList setColorBackground(int)
main.java.controlp5.Controller : DropdownList setColorCaptionLabel(int)
main.java.controlp5.Controller : DropdownList setColorForeground(int)
main.java.controlp5.Controller : DropdownList setColorLabel(int)
main.java.controlp5.Controller : DropdownList setColorValue(int)
main.java.controlp5.Controller : DropdownList setColorValueLabel(int)
main.java.controlp5.Controller : DropdownList setDecimalPrecision(int)
main.java.controlp5.Controller : DropdownList setDefaultValue(float)
main.java.controlp5.Controller : DropdownList setHeight(int)
main.java.controlp5.Controller : DropdownList setId(int)
main.java.controlp5.Controller : DropdownList setImage(PImage)
main.java.controlp5.Controller : DropdownList setImage(PImage, int)
main.java.controlp5.Controller : DropdownList setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : DropdownList setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : DropdownList setLabel(String)
main.java.controlp5.Controller : DropdownList setLabelVisible(boolean)
main.java.controlp5.Controller : DropdownList setLock(boolean)
main.java.controlp5.Controller : DropdownList setMax(float)
main.java.controlp5.Controller : DropdownList setMin(float)
main.java.controlp5.Controller : DropdownList setMouseOver(boolean)
main.java.controlp5.Controller : DropdownList setMoveable(boolean)
main.java.controlp5.Controller : DropdownList setPosition(float, float)
main.java.controlp5.Controller : DropdownList setPosition(float[])
main.java.controlp5.Controller : DropdownList setSize(PImage)
main.java.controlp5.Controller : DropdownList setSize(int, int)
main.java.controlp5.Controller : DropdownList setStringValue(String)
main.java.controlp5.Controller : DropdownList setUpdate(boolean)
main.java.controlp5.Controller : DropdownList setValue(float)
main.java.controlp5.Controller : DropdownList setValueLabel(String)
main.java.controlp5.Controller : DropdownList setValueSelf(float)
main.java.controlp5.Controller : DropdownList setView(ControllerView)
main.java.controlp5.Controller : DropdownList setVisible(boolean)
main.java.controlp5.Controller : DropdownList setWidth(int)
main.java.controlp5.Controller : DropdownList show()
main.java.controlp5.Controller : DropdownList unlock()
main.java.controlp5.Controller : DropdownList unplugFrom(Object)
main.java.controlp5.Controller : DropdownList unplugFrom(Object[])
main.java.controlp5.Controller : DropdownList unregisterTooltip()
main.java.controlp5.Controller : DropdownList update()
main.java.controlp5.Controller : DropdownList updateSize()
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
main.java.controlp5.DropdownList : DropdownList addItem(String, Object)
main.java.controlp5.DropdownList : DropdownList addItems(List)
main.java.controlp5.DropdownList : DropdownList addItems(Map)
main.java.controlp5.DropdownList : DropdownList addItems(String[])
main.java.controlp5.DropdownList : DropdownList clear()
main.java.controlp5.DropdownList : DropdownList close()
main.java.controlp5.DropdownList : DropdownList open()
main.java.controlp5.DropdownList : DropdownList removeItem(String)
main.java.controlp5.DropdownList : DropdownList removeItems(List)
main.java.controlp5.DropdownList : DropdownList setBackgroundColor(int)
main.java.controlp5.DropdownList : DropdownList setBarHeight(int)
main.java.controlp5.DropdownList : DropdownList setBarVisible(boolean)
main.java.controlp5.DropdownList : DropdownList setItemHeight(int)
main.java.controlp5.DropdownList : DropdownList setItems(List)
main.java.controlp5.DropdownList : DropdownList setItems(Map)
main.java.controlp5.DropdownList : DropdownList setItems(String[])
main.java.controlp5.DropdownList : DropdownList setOpen(boolean)
main.java.controlp5.DropdownList : DropdownList setScrollSensitivity(float)
main.java.controlp5.DropdownList : DropdownList setType(int)
main.java.controlp5.DropdownList : List getItems()
main.java.controlp5.DropdownList : Map getItem(String)
main.java.controlp5.DropdownList : Map getItem(int)
main.java.controlp5.DropdownList : boolean isBarVisible()
main.java.controlp5.DropdownList : boolean isOpen()
main.java.controlp5.DropdownList : int getBackgroundColor()
main.java.controlp5.DropdownList : int getBarHeight()
main.java.controlp5.DropdownList : int getHeight()
main.java.controlp5.DropdownList : void controlEvent(ControlEvent)
main.java.controlp5.DropdownList : void keyEvent(KeyEvent)
main.java.controlp5.DropdownList : void setDirection(int)
main.java.controlp5.DropdownList : void updateItemIndexOffset()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:05

*/


