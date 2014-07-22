/**
* ControlP5 ListBox
*
* find a list of public methods available for the ListBox Controller
* at the bottom of this sketch.
* use the scrollwheel, up or down cursors to scroll through 
* a listbox when hovering with the mouse.
*
* DEPRECATED, use ScrollableList instead.
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
  l.getCaptionLabel().style().marginTop = 3;
  l.getValueLabel().style().marginTop = 3;
  
  for (int i=0;i<80;i++) {
    ListBoxItem lbi = l.addItem("item "+i, i);
    lbi.setColorBackground(0xffff0000);
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


controlP5.ControlGroup : ControlGroup activateEvent(boolean) 
controlP5.ControlGroup : ControlGroup addListener(ControlListener) 
controlP5.ControlGroup : ControlGroup hideBar() 
controlP5.ControlGroup : ControlGroup removeListener(ControlListener) 
controlP5.ControlGroup : ControlGroup setBackgroundColor(int) 
controlP5.ControlGroup : ControlGroup setBackgroundHeight(int) 
controlP5.ControlGroup : ControlGroup setBarHeight(int) 
controlP5.ControlGroup : ControlGroup showBar() 
controlP5.ControlGroup : ControllerGroup updateInternalEvents(PApplet) 
controlP5.ControlGroup : String info() 
controlP5.ControlGroup : String toString() 
controlP5.ControlGroup : boolean isBarVisible() 
controlP5.ControlGroup : int getBackgroundHeight() 
controlP5.ControlGroup : int getBarHeight() 
controlP5.ControlGroup : int listenerSize() 
controlP5.ControllerGroup : CColor getColor() 
controlP5.ControllerGroup : ControlWindow getWindow() 
controlP5.ControllerGroup : ControlWindowCanvas addCanvas(ControlWindowCanvas) 
controlP5.ControllerGroup : Controller getController(String) 
controlP5.ControllerGroup : ControllerGroup add(ControllerInterface) 
controlP5.ControllerGroup : ControllerGroup close() 
controlP5.ControllerGroup : ControllerGroup disableCollapse() 
controlP5.ControllerGroup : ControllerGroup enableCollapse() 
controlP5.ControllerGroup : ControllerGroup hide() 
controlP5.ControllerGroup : ControllerGroup moveTo(ControlWindow) 
controlP5.ControllerGroup : ControllerGroup open() 
controlP5.ControllerGroup : ControllerGroup registerProperty(String) 
controlP5.ControllerGroup : ControllerGroup registerProperty(String, String) 
controlP5.ControllerGroup : ControllerGroup remove(CDrawable) 
controlP5.ControllerGroup : ControllerGroup remove(ControllerInterface) 
controlP5.ControllerGroup : ControllerGroup removeCanvas(ControlWindowCanvas) 
controlP5.ControllerGroup : ControllerGroup removeProperty(String) 
controlP5.ControllerGroup : ControllerGroup removeProperty(String, String) 
controlP5.ControllerGroup : ControllerGroup setAddress(String) 
controlP5.ControllerGroup : ControllerGroup setArrayValue(float[]) 
controlP5.ControllerGroup : ControllerGroup setColor(CColor) 
controlP5.ControllerGroup : ControllerGroup setColorActive(int) 
controlP5.ControllerGroup : ControllerGroup setColorBackground(int) 
controlP5.ControllerGroup : ControllerGroup setColorForeground(int) 
controlP5.ControllerGroup : ControllerGroup setColorLabel(int) 
controlP5.ControllerGroup : ControllerGroup setColorValue(int) 
controlP5.ControllerGroup : ControllerGroup setHeight(int) 
controlP5.ControllerGroup : ControllerGroup setId(int) 
controlP5.ControllerGroup : ControllerGroup setLabel(String) 
controlP5.ControllerGroup : ControllerGroup setMoveable(boolean) 
controlP5.ControllerGroup : ControllerGroup setOpen(boolean) 
controlP5.ControllerGroup : ControllerGroup setPosition(PVector) 
controlP5.ControllerGroup : ControllerGroup setPosition(float, float) 
controlP5.ControllerGroup : ControllerGroup setStringValue(String) 
controlP5.ControllerGroup : ControllerGroup setUpdate(boolean) 
controlP5.ControllerGroup : ControllerGroup setValue(float) 
controlP5.ControllerGroup : ControllerGroup setVisible(boolean) 
controlP5.ControllerGroup : ControllerGroup setWidth(int) 
controlP5.ControllerGroup : ControllerGroup show() 
controlP5.ControllerGroup : ControllerGroup update() 
controlP5.ControllerGroup : ControllerGroup updateAbsolutePosition() 
controlP5.ControllerGroup : ControllerProperty getProperty(String) 
controlP5.ControllerGroup : ControllerProperty getProperty(String, String) 
controlP5.ControllerGroup : Label captionLabel() 
controlP5.ControllerGroup : Label valueLabel() 
controlP5.ControllerGroup : PVector getPosition() 
controlP5.ControllerGroup : String getAddress() 
controlP5.ControllerGroup : String getName() 
controlP5.ControllerGroup : String getStringValue() 
controlP5.ControllerGroup : String info() 
controlP5.ControllerGroup : String toString() 
controlP5.ControllerGroup : Tab getTab() 
controlP5.ControllerGroup : boolean isCollapse() 
controlP5.ControllerGroup : boolean isMouseOver() 
controlP5.ControllerGroup : boolean isMoveable() 
controlP5.ControllerGroup : boolean isOpen() 
controlP5.ControllerGroup : boolean isUpdate() 
controlP5.ControllerGroup : boolean isVisible() 
controlP5.ControllerGroup : boolean setMousePressed(boolean) 
controlP5.ControllerGroup : float getValue() 
controlP5.ControllerGroup : float[] getArrayValue() 
controlP5.ControllerGroup : int getHeight() 
controlP5.ControllerGroup : int getId() 
controlP5.ControllerGroup : int getWidth() 
controlP5.ControllerGroup : void remove() 
controlP5.ListBox : ListBox actAsPulldownMenu(boolean) 
controlP5.ListBox : ListBox addItems(List) 
controlP5.ListBox : ListBox addItems(List, int) 
controlP5.ListBox : ListBox addItems(String[]) 
controlP5.ListBox : ListBox clear() 
controlP5.ListBox : ListBox hideScrollbar() 
controlP5.ListBox : ListBox removeItem(String) 
controlP5.ListBox : ListBox scroll(float) 
controlP5.ListBox : ListBox setColorActive(int) 
controlP5.ListBox : ListBox setColorBackground(int) 
controlP5.ListBox : ListBox setColorForeground(int) 
controlP5.ListBox : ListBox setColorLabel(int) 
controlP5.ListBox : ListBox setHeight(int) 
controlP5.ListBox : ListBox setItemHeight(int) 
controlP5.ListBox : ListBox setListBoxItems(String[][]) 
controlP5.ListBox : ListBox setWidth(int) 
controlP5.ListBox : ListBox showScrollbar() 
controlP5.ListBox : ListBox toUpperCase(boolean) 
controlP5.ListBox : ListBoxItem addItem(String, int) 
controlP5.ListBox : ListBoxItem getItem(Controller) 
controlP5.ListBox : ListBoxItem getItem(String) 
controlP5.ListBox : ListBoxItem getItem(int) 
controlP5.ListBox : String[][] getListBoxItems() 
controlP5.ListBox : boolean isScrollbarVisible() 
java.lang.Object : String toString() 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/



