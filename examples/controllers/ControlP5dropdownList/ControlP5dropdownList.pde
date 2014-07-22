/**
 * Control5 DropdownList
 * A dropdownList controller, extends the ListBox controller.
 * the most recently selected dropdownlist item is displayed inside
 * the menu bar of the DropdownList.
 *
 * find a list of public methods available for the DropdownList Controller 
 * at the bottom of this sketch's source code
 *
 * DEPRECATED, use ScrollableList instead.
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
  d2.setIndex(10);
}


void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set("dropdown");
  ddl.getCaptionLabel().style().marginTop = 3;
  ddl.getCaptionLabel().style().marginLeft = 3;
  ddl.getValueLabel().style().marginTop = 3;
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
 
 You can find further details about DropdownList in the javadoc.
 
 Format: returnType methodName(parameterType)
 
 controlP5.DropdownList : ControllerGroup setValue(float) 
 controlP5.DropdownList : float getValue() 
 controlP5.ListBox : ControllerInterface setColorActive(int) 
 controlP5.ListBox : ControllerInterface setColorBackground(int) 
 controlP5.ListBox : ControllerInterface setColorForeground(int) 
 controlP5.ListBox : ControllerInterface setColorLabel(int) 
 controlP5.ListBox : ControllerInterface setColorValue(int) 
 controlP5.ListBox : ListBox setHeight(int) 
 controlP5.ListBox : ListBox setWidth(int) 
 controlP5.ListBox : ListBox toUpperCase(boolean) 
 controlP5.ListBox : ListBoxItem addItem(String, int) 
 controlP5.ListBox : ListBoxItem item(Controller) 
 controlP5.ListBox : ListBoxItem item(String) 
 controlP5.ListBox : ListBoxItem item(int) 
 controlP5.ListBox : String[][] getListBoxItems() 
 controlP5.ListBox : boolean isScrollbarVisible() 
 controlP5.ListBox : float getScrollPosition() 
 controlP5.ListBox : void actAsPulldownMenu(boolean) 
 controlP5.ListBox : void addItems(List) 
 controlP5.ListBox : void addItems(List, int) 
 controlP5.ListBox : void addItems(String[]) 
 controlP5.ListBox : void clear() 
 controlP5.ListBox : void controlEvent(ControlEvent) 
 controlP5.ListBox : void hideScrollbar() 
 controlP5.ListBox : void keyEvent(KeyEvent) 
 controlP5.ListBox : void removeItem(String) 
 controlP5.ListBox : void scroll(float) 
 controlP5.ListBox : void scrolled(int) 
 controlP5.ListBox : void setItemHeight(int) 
 controlP5.ListBox : void setListBoxItems(String[][]) 
 controlP5.ListBox : void showScrollbar() 
 controlP5.ListBox : void updateListBoxItems() 
 controlP5.ControlGroup : ControlGroup activateEvent(boolean) 
 controlP5.ControlGroup : String info() 
 controlP5.ControlGroup : String stringValue() 
 controlP5.ControlGroup : String toString() 
 controlP5.ControlGroup : boolean isBarVisible() 
 controlP5.ControlGroup : int getBackgroundHeight() 
 controlP5.ControlGroup : int getBarHeight() 
 controlP5.ControlGroup : int listenerSize() 
 controlP5.ControlGroup : void addCloseButton() 
 controlP5.ControlGroup : void addListener(ControlListener) 
 controlP5.ControlGroup : void controlEvent(ControlEvent) 
 controlP5.ControlGroup : void hideBar() 
 controlP5.ControlGroup : void mousePressed() 
 controlP5.ControlGroup : void removeCloseButton() 
 controlP5.ControlGroup : void removeListener(ControlListener) 
 controlP5.ControlGroup : void setBackgroundColor(int) 
 controlP5.ControlGroup : void setBackgroundHeight(int) 
 controlP5.ControlGroup : void setBarHeight(int) 
 controlP5.ControlGroup : void showBar() 
 controlP5.ControllerGroup : CColor getColor() 
 controlP5.ControllerGroup : ControlWindow getWindow() 
 controlP5.ControllerGroup : ControlWindowCanvas addCanvas(ControlWindowCanvas) 
 controlP5.ControllerGroup : Controller getController(String) 
 controlP5.ControllerGroup : ControllerGroup setHeight(int) 
 controlP5.ControllerGroup : ControllerGroup setValue(float) 
 controlP5.ControllerGroup : ControllerGroup setWidth(int) 
 controlP5.ControllerGroup : ControllerInterface add(ControllerInterface) 
 controlP5.ControllerGroup : ControllerInterface hide() 
 controlP5.ControllerGroup : ControllerInterface moveTo(ControlGroup, Tab, ControlWindow) 
 controlP5.ControllerGroup : ControllerInterface registerProperty(String) 
 controlP5.ControllerGroup : ControllerInterface registerProperty(String, String) 
 controlP5.ControllerGroup : ControllerInterface remove(ControllerInterface) 
 controlP5.ControllerGroup : ControllerInterface removeProperty(String) 
 controlP5.ControllerGroup : ControllerInterface removeProperty(String, String) 
 controlP5.ControllerGroup : ControllerInterface setColor(CColor) 
 controlP5.ControllerGroup : ControllerInterface setColorActive(int) 
 controlP5.ControllerGroup : ControllerInterface setColorBackground(int) 
 controlP5.ControllerGroup : ControllerInterface setColorForeground(int) 
 controlP5.ControllerGroup : ControllerInterface setColorLabel(int) 
 controlP5.ControllerGroup : ControllerInterface setColorValue(int) 
 controlP5.ControllerGroup : ControllerInterface setId(int) 
 controlP5.ControllerGroup : ControllerInterface setLabel(String) 
 controlP5.ControllerGroup : ControllerInterface show() 
 controlP5.ControllerGroup : ControllerProperty getProperty(String) 
 controlP5.ControllerGroup : ControllerProperty getProperty(String, String) 
 controlP5.ControllerGroup : Label captionLabel() 
 controlP5.ControllerGroup : Label valueLabel() 
 controlP5.ControllerGroup : PVector getAbsolutePosition() 
 controlP5.ControllerGroup : PVector getPosition() 
 controlP5.ControllerGroup : String getName() 
 controlP5.ControllerGroup : String getStringValue() 
 controlP5.ControllerGroup : String info() 
 controlP5.ControllerGroup : String toString() 
 controlP5.ControllerGroup : Tab getTab() 
 controlP5.ControllerGroup : boolean isCollapse() 
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
 controlP5.ControllerGroup : void close() 
 controlP5.ControllerGroup : void disableCollapse() 
 controlP5.ControllerGroup : void enableCollapse() 
 controlP5.ControllerGroup : void moveTo(ControlGroup) 
 controlP5.ControllerGroup : void moveTo(ControlWindow) 
 controlP5.ControllerGroup : void moveTo(ControlWindow, String) 
 controlP5.ControllerGroup : void moveTo(String) 
 controlP5.ControllerGroup : void moveTo(String, ControlWindow) 
 controlP5.ControllerGroup : void moveTo(Tab) 
 controlP5.ControllerGroup : void moveTo(Tab, ControlWindow) 
 controlP5.ControllerGroup : void open() 
 controlP5.ControllerGroup : void remove() 
 controlP5.ControllerGroup : void remove(CDrawable) 
 controlP5.ControllerGroup : void removeCanvas(ControlWindowCanvas) 
 controlP5.ControllerGroup : void setAbsolutePosition(PVector) 
 controlP5.ControllerGroup : void setArrayValue(float[]) 
 controlP5.ControllerGroup : void setGroup(ControllerGroup) 
 controlP5.ControllerGroup : void setGroup(String) 
 controlP5.ControllerGroup : void setMoveable(boolean) 
 controlP5.ControllerGroup : void setOpen(boolean) 
 controlP5.ControllerGroup : void setPosition(PVector) 
 controlP5.ControllerGroup : void setPosition(float, float) 
 controlP5.ControllerGroup : void setTab(ControlWindow, String) 
 controlP5.ControllerGroup : void setTab(String) 
 controlP5.ControllerGroup : void setTab(Tab) 
 controlP5.ControllerGroup : void setUpdate(boolean) 
 controlP5.ControllerGroup : void setVisible(boolean) 
 controlP5.ControllerGroup : void update() 
 controlP5.ControllerGroup : void updateAbsolutePosition() 
 java.lang.Object : String toString() 
 java.lang.Object : boolean equals(Object) 
 */
