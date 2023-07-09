/**
*
* DEPRECATED, use ScrollableList instead.
*
* ControlP5 ListBox
*
* find a list of public methods available for the ListBox Controller
* at the bottom of this sketch.
* use the scrollwheel, up or down cursors to scroll through 
* a listbox when hovering with the mouse.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

ListBox l;

int cnt = 0;

void setup() {
  
  size(700, 400);
  cp5 = new ControlP5(this);
  
  // ListBox is DEPRECATED, 
  // use ScrollableList instead, 
  // see example ControlP5scrollableList
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  l = cp5.addListBox("myList")
         .setPosition(100, 100)
         .setSize(120, 120)
         .setItemHeight(15)
         .setBarHeight(15)
         .setColorBackground(color(255, 128))
         .setColorActive(color(0))
         .setColorForeground(color(255, 100,0))
         ;

  l.getCaptionLabel().toUpperCase(true);
  l.getCaptionLabel().set("A Listbox");
  l.getCaptionLabel().setColor(0xffff0000);
  for (int i=0;i<80;i++) {
    l.addItem("item "+i, i);
    l.getItem("item "+i).put("color", new CColor().setBackground(0xffff0000).setBackground(0xffff8800));
  }
  
}

void keyPressed() {
  if (key=='0') {
    // will activate the listbox item with value 5
    l.setValue(5);
  }
  if (key=='1') {
    // set the height of a listBox should always be a multiple of itemHeight
    l.setHeight(210);
  } 
  else if (key=='2') {
    // set the height of a listBox should always be a multiple of itemHeight
    l.setHeight(120);
  } 
  else if (key=='3') {
    // set the width of a listBox
    l.setWidth(200);
  }
  else if (key=='i') {
    // set the height of a listBoxItem, should always be a fraction of the listBox
    l.setItemHeight(30);
  } 
  else if (key=='u') {
    // set the height of a listBoxItem, should always be a fraction of the listBox
    l.setItemHeight(10);
    l.setBackgroundColor(color(100, 0, 0));
  } 
  else if (key=='a') {
    int n = (int)(random(100000));
    l.addItem("item "+n, n);
  } 
  else if (key=='d') {
    l.removeItem("item "+cnt);
    cnt++;
  } else if (key=='c') {
    l.clear();
  }
}

void controlEvent(ControlEvent theEvent) {
  // ListBox is if type ControlGroup.
  // 1 controlEvent will be executed, where the event
  // originates from a ControlGroup. therefore
  // you need to check the Event with
  // if (theEvent.isGroup())
  // to avoid an error message from controlP5.

  if (theEvent.isGroup()) {
    // an event from a group e.g. scrollList
    println(theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  }
  
  if(theEvent.isGroup() && theEvent.getName().equals("myList")){
    int test = (int)theEvent.getGroup().getValue();
    println("test "+test);
}
}

void draw() {
  background(128);
  // scroll the scroll List according to the mouseX position
  // when holding down SPACE.
  if (keyPressed && key==' ') {
    //l.scroll(mouseX/((float)width)); // scroll taks values between 0 and 1
  }
  if (keyPressed && key==' ') {
    l.setWidth(mouseX);
  }
}



/*
a list of all methods available for the ListBox Controller
use ControlP5.printPublicMethodsFor(ListBox.class);
to print the following list into the console.

You can find further details about class ListBox in the javadoc.

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
main.java.controlp5.Controller : ListBox addCallback(CallbackListener)
main.java.controlp5.Controller : ListBox addListener(ControlListener)
main.java.controlp5.Controller : ListBox addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ListBox align(int, int, int, int)
main.java.controlp5.Controller : ListBox bringToFront()
main.java.controlp5.Controller : ListBox bringToFront(ControllerInterface)
main.java.controlp5.Controller : ListBox hide()
main.java.controlp5.Controller : ListBox linebreak()
main.java.controlp5.Controller : ListBox listen(boolean)
main.java.controlp5.Controller : ListBox lock()
main.java.controlp5.Controller : ListBox onChange(CallbackListener)
main.java.controlp5.Controller : ListBox onClick(CallbackListener)
main.java.controlp5.Controller : ListBox onDoublePress(CallbackListener)
main.java.controlp5.Controller : ListBox onDrag(CallbackListener)
main.java.controlp5.Controller : ListBox onDraw(ControllerView)
main.java.controlp5.Controller : ListBox onEndDrag(CallbackListener)
main.java.controlp5.Controller : ListBox onEnter(CallbackListener)
main.java.controlp5.Controller : ListBox onLeave(CallbackListener)
main.java.controlp5.Controller : ListBox onMove(CallbackListener)
main.java.controlp5.Controller : ListBox onPress(CallbackListener)
main.java.controlp5.Controller : ListBox onRelease(CallbackListener)
main.java.controlp5.Controller : ListBox onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : ListBox onStartDrag(CallbackListener)
main.java.controlp5.Controller : ListBox onWheel(CallbackListener)
main.java.controlp5.Controller : ListBox plugTo(Object)
main.java.controlp5.Controller : ListBox plugTo(Object, String)
main.java.controlp5.Controller : ListBox plugTo(Object[])
main.java.controlp5.Controller : ListBox plugTo(Object[], String)
main.java.controlp5.Controller : ListBox registerProperty(String)
main.java.controlp5.Controller : ListBox registerProperty(String, String)
main.java.controlp5.Controller : ListBox registerTooltip(String)
main.java.controlp5.Controller : ListBox removeBehavior()
main.java.controlp5.Controller : ListBox removeCallback()
main.java.controlp5.Controller : ListBox removeCallback(CallbackListener)
main.java.controlp5.Controller : ListBox removeListener(ControlListener)
main.java.controlp5.Controller : ListBox removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : ListBox removeListenersFor(int)
main.java.controlp5.Controller : ListBox removeProperty(String)
main.java.controlp5.Controller : ListBox removeProperty(String, String)
main.java.controlp5.Controller : ListBox setArrayValue(float[])
main.java.controlp5.Controller : ListBox setArrayValue(int, float)
main.java.controlp5.Controller : ListBox setBehavior(ControlBehavior)
main.java.controlp5.Controller : ListBox setBroadcast(boolean)
main.java.controlp5.Controller : ListBox setCaptionLabel(String)
main.java.controlp5.Controller : ListBox setColor(CColor)
main.java.controlp5.Controller : ListBox setColorActive(int)
main.java.controlp5.Controller : ListBox setColorBackground(int)
main.java.controlp5.Controller : ListBox setColorCaptionLabel(int)
main.java.controlp5.Controller : ListBox setColorForeground(int)
main.java.controlp5.Controller : ListBox setColorLabel(int)
main.java.controlp5.Controller : ListBox setColorValue(int)
main.java.controlp5.Controller : ListBox setColorValueLabel(int)
main.java.controlp5.Controller : ListBox setDecimalPrecision(int)
main.java.controlp5.Controller : ListBox setDefaultValue(float)
main.java.controlp5.Controller : ListBox setHeight(int)
main.java.controlp5.Controller : ListBox setId(int)
main.java.controlp5.Controller : ListBox setImage(PImage)
main.java.controlp5.Controller : ListBox setImage(PImage, int)
main.java.controlp5.Controller : ListBox setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : ListBox setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : ListBox setLabel(String)
main.java.controlp5.Controller : ListBox setLabelVisible(boolean)
main.java.controlp5.Controller : ListBox setLock(boolean)
main.java.controlp5.Controller : ListBox setMax(float)
main.java.controlp5.Controller : ListBox setMin(float)
main.java.controlp5.Controller : ListBox setMouseOver(boolean)
main.java.controlp5.Controller : ListBox setMoveable(boolean)
main.java.controlp5.Controller : ListBox setPosition(float, float)
main.java.controlp5.Controller : ListBox setPosition(float[])
main.java.controlp5.Controller : ListBox setSize(PImage)
main.java.controlp5.Controller : ListBox setSize(int, int)
main.java.controlp5.Controller : ListBox setStringValue(String)
main.java.controlp5.Controller : ListBox setUpdate(boolean)
main.java.controlp5.Controller : ListBox setValue(float)
main.java.controlp5.Controller : ListBox setValueLabel(String)
main.java.controlp5.Controller : ListBox setValueSelf(float)
main.java.controlp5.Controller : ListBox setView(ControllerView)
main.java.controlp5.Controller : ListBox setVisible(boolean)
main.java.controlp5.Controller : ListBox setWidth(int)
main.java.controlp5.Controller : ListBox show()
main.java.controlp5.Controller : ListBox unlock()
main.java.controlp5.Controller : ListBox unplugFrom(Object)
main.java.controlp5.Controller : ListBox unplugFrom(Object[])
main.java.controlp5.Controller : ListBox unregisterTooltip()
main.java.controlp5.Controller : ListBox update()
main.java.controlp5.Controller : ListBox updateSize()
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
main.java.controlp5.ListBox : List getItems()
main.java.controlp5.ListBox : ListBox addItem(String, Object)
main.java.controlp5.ListBox : ListBox addItems(List)
main.java.controlp5.ListBox : ListBox addItems(Map)
main.java.controlp5.ListBox : ListBox addItems(String[])
main.java.controlp5.ListBox : ListBox clear()
main.java.controlp5.ListBox : ListBox close()
main.java.controlp5.ListBox : ListBox open()
main.java.controlp5.ListBox : ListBox removeItem(String)
main.java.controlp5.ListBox : ListBox removeItems(List)
main.java.controlp5.ListBox : ListBox setBackgroundColor(int)
main.java.controlp5.ListBox : ListBox setBarHeight(int)
main.java.controlp5.ListBox : ListBox setBarVisible(boolean)
main.java.controlp5.ListBox : ListBox setItemHeight(int)
main.java.controlp5.ListBox : ListBox setItems(List)
main.java.controlp5.ListBox : ListBox setItems(Map)
main.java.controlp5.ListBox : ListBox setItems(String[])
main.java.controlp5.ListBox : ListBox setOpen(boolean)
main.java.controlp5.ListBox : ListBox setScrollSensitivity(float)
main.java.controlp5.ListBox : ListBox setType(int)
main.java.controlp5.ListBox : Map getItem(String)
main.java.controlp5.ListBox : Map getItem(int)
main.java.controlp5.ListBox : boolean isBarVisible()
main.java.controlp5.ListBox : boolean isOpen()
main.java.controlp5.ListBox : int getBackgroundColor()
main.java.controlp5.ListBox : int getBarHeight()
main.java.controlp5.ListBox : int getHeight()
main.java.controlp5.ListBox : void controlEvent(ControlEvent)
main.java.controlp5.ListBox : void keyEvent(KeyEvent)
main.java.controlp5.ListBox : void setDirection(int)
main.java.controlp5.ListBox : void updateItemIndexOffset()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:12

*/


