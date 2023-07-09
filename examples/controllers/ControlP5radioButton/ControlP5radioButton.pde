/**
* ControlP5 RadioButton
*
*
* find a list of public methods available for the RadioButton Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(0,0,0);

RadioButton r1, r2;

void setup() {
  size(700,400);
  
  cp5 = new ControlP5(this);
  r1 = cp5.addRadioButton("radioButton")
         .setPosition(100,180)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(5)
         .setSpacingColumn(50)
         .addItem("50",1)
         .addItem("100",2)
         .addItem("150",3)
         .addItem("200",4)
         .addItem("250",5)
         ;
     
     for(Toggle t:r1.getItems()) {
       t.getCaptionLabel().setColorBackground(color(255,80));
       t.getCaptionLabel().getStyle().moveMargin(-7,0,0,-3);
       t.getCaptionLabel().getStyle().movePadding(7,0,0,3);
       t.getCaptionLabel().getStyle().backgroundWidth = 45;
       t.getCaptionLabel().getStyle().backgroundHeight = 13;
     }
   
}


void draw() {
  background(myColorBackground);
}


void keyPressed() {
  switch(key) {
    case('0'): r1.deactivateAll(); break;
    case('1'): r1.activate(0); break;
    case('2'): r1.activate(1); break;
    case('3'): r1.activate(2); break;
    case('4'): r1.activate(3); break;
    case('5'): r1.activate(4); break;
  }
  
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(r1)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());
    myColorBackground = color(int(theEvent.getGroup().getValue()*50),0,0);
  }
}

void radioButton(int a) {
  println("a radio Button event: "+a);
}

/*
a list of all methods available for the RadioButton Controller
use ControlP5.printPublicMethodsFor(RadioButton.class);
to print the following list into the console.

You can find further details about class RadioButton in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ControlGroup : RadioButton activateEvent(boolean)
main.java.controlp5.ControlGroup : RadioButton addListener(ControlListener)
main.java.controlp5.ControlGroup : RadioButton removeListener(ControlListener)
main.java.controlp5.ControlGroup : RadioButton setBackgroundColor(int)
main.java.controlp5.ControlGroup : RadioButton setBackgroundHeight(int)
main.java.controlp5.ControlGroup : RadioButton setBarHeight(int)
main.java.controlp5.ControlGroup : RadioButton setSize(int, int)
main.java.controlp5.ControlGroup : RadioButton updateInternalEvents(PApplet)
main.java.controlp5.ControlGroup : String getInfo()
main.java.controlp5.ControlGroup : String toString()
main.java.controlp5.ControlGroup : int getBackgroundHeight()
main.java.controlp5.ControlGroup : int getBarHeight()
main.java.controlp5.ControlGroup : int listenerSize()
main.java.controlp5.ControllerGroup : CColor getColor()
main.java.controlp5.ControllerGroup : Canvas addCanvas(Canvas)
main.java.controlp5.ControllerGroup : ControlWindow getWindow()
main.java.controlp5.ControllerGroup : Controller getController(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String, String)
main.java.controlp5.ControllerGroup : Label getCaptionLabel()
main.java.controlp5.ControllerGroup : Label getValueLabel()
main.java.controlp5.ControllerGroup : RadioButton add(ControllerInterface)
main.java.controlp5.ControllerGroup : RadioButton addListener(ControlListener)
main.java.controlp5.ControllerGroup : RadioButton bringToFront()
main.java.controlp5.ControllerGroup : RadioButton bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : RadioButton close()
main.java.controlp5.ControllerGroup : RadioButton disableCollapse()
main.java.controlp5.ControllerGroup : RadioButton enableCollapse()
main.java.controlp5.ControllerGroup : RadioButton hide()
main.java.controlp5.ControllerGroup : RadioButton hideArrow()
main.java.controlp5.ControllerGroup : RadioButton hideBar()
main.java.controlp5.ControllerGroup : RadioButton moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : RadioButton moveTo(PApplet)
main.java.controlp5.ControllerGroup : RadioButton open()
main.java.controlp5.ControllerGroup : RadioButton registerProperty(String)
main.java.controlp5.ControllerGroup : RadioButton registerProperty(String, String)
main.java.controlp5.ControllerGroup : RadioButton remove(CDrawable)
main.java.controlp5.ControllerGroup : RadioButton remove(ControllerInterface)
main.java.controlp5.ControllerGroup : RadioButton removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : RadioButton removeListener(ControlListener)
main.java.controlp5.ControllerGroup : RadioButton removeProperty(String)
main.java.controlp5.ControllerGroup : RadioButton removeProperty(String, String)
main.java.controlp5.ControllerGroup : RadioButton setAddress(String)
main.java.controlp5.ControllerGroup : RadioButton setArrayValue(float[])
main.java.controlp5.ControllerGroup : RadioButton setArrayValue(int, float)
main.java.controlp5.ControllerGroup : RadioButton setCaptionLabel(String)
main.java.controlp5.ControllerGroup : RadioButton setColor(CColor)
main.java.controlp5.ControllerGroup : RadioButton setColorActive(int)
main.java.controlp5.ControllerGroup : RadioButton setColorBackground(int)
main.java.controlp5.ControllerGroup : RadioButton setColorForeground(int)
main.java.controlp5.ControllerGroup : RadioButton setColorLabel(int)
main.java.controlp5.ControllerGroup : RadioButton setColorValue(int)
main.java.controlp5.ControllerGroup : RadioButton setHeight(int)
main.java.controlp5.ControllerGroup : RadioButton setId(int)
main.java.controlp5.ControllerGroup : RadioButton setLabel(String)
main.java.controlp5.ControllerGroup : RadioButton setMouseOver(boolean)
main.java.controlp5.ControllerGroup : RadioButton setMoveable(boolean)
main.java.controlp5.ControllerGroup : RadioButton setOpen(boolean)
main.java.controlp5.ControllerGroup : RadioButton setPosition(float, float)
main.java.controlp5.ControllerGroup : RadioButton setPosition(float[])
main.java.controlp5.ControllerGroup : RadioButton setSize(int, int)
main.java.controlp5.ControllerGroup : RadioButton setStringValue(String)
main.java.controlp5.ControllerGroup : RadioButton setTitle(String)
main.java.controlp5.ControllerGroup : RadioButton setUpdate(boolean)
main.java.controlp5.ControllerGroup : RadioButton setValue(float)
main.java.controlp5.ControllerGroup : RadioButton setVisible(boolean)
main.java.controlp5.ControllerGroup : RadioButton setWidth(int)
main.java.controlp5.ControllerGroup : RadioButton show()
main.java.controlp5.ControllerGroup : RadioButton showArrow()
main.java.controlp5.ControllerGroup : RadioButton showBar()
main.java.controlp5.ControllerGroup : RadioButton update()
main.java.controlp5.ControllerGroup : RadioButton updateAbsolutePosition()
main.java.controlp5.ControllerGroup : String getAddress()
main.java.controlp5.ControllerGroup : String getInfo()
main.java.controlp5.ControllerGroup : String getName()
main.java.controlp5.ControllerGroup : String getStringValue()
main.java.controlp5.ControllerGroup : String toString()
main.java.controlp5.ControllerGroup : Tab getTab()
main.java.controlp5.ControllerGroup : boolean isBarVisible()
main.java.controlp5.ControllerGroup : boolean isCollapse()
main.java.controlp5.ControllerGroup : boolean isMouseOver()
main.java.controlp5.ControllerGroup : boolean isMoveable()
main.java.controlp5.ControllerGroup : boolean isOpen()
main.java.controlp5.ControllerGroup : boolean isUpdate()
main.java.controlp5.ControllerGroup : boolean isVisible()
main.java.controlp5.ControllerGroup : boolean setMousePressed(boolean)
main.java.controlp5.ControllerGroup : float getArrayValue(int)
main.java.controlp5.ControllerGroup : float getValue()
main.java.controlp5.ControllerGroup : float[] getArrayValue()
main.java.controlp5.ControllerGroup : float[] getPosition()
main.java.controlp5.ControllerGroup : int getHeight()
main.java.controlp5.ControllerGroup : int getId()
main.java.controlp5.ControllerGroup : int getWidth()
main.java.controlp5.ControllerGroup : int listenerSize()
main.java.controlp5.ControllerGroup : void controlEvent(ControlEvent)
main.java.controlp5.ControllerGroup : void remove()
main.java.controlp5.RadioButton : List getItems()
main.java.controlp5.RadioButton : RadioButton activate(String)
main.java.controlp5.RadioButton : RadioButton activate(int)
main.java.controlp5.RadioButton : RadioButton addItem(String, float)
main.java.controlp5.RadioButton : RadioButton addItem(Toggle, float)
main.java.controlp5.RadioButton : RadioButton align(int, int)
main.java.controlp5.RadioButton : RadioButton align(int[])
main.java.controlp5.RadioButton : RadioButton alignX(int)
main.java.controlp5.RadioButton : RadioButton alignY(int)
main.java.controlp5.RadioButton : RadioButton deactivate(String)
main.java.controlp5.RadioButton : RadioButton deactivate(int)
main.java.controlp5.RadioButton : RadioButton deactivateAll()
main.java.controlp5.RadioButton : RadioButton hideLabels()
main.java.controlp5.RadioButton : RadioButton plugTo(Object)
main.java.controlp5.RadioButton : RadioButton plugTo(Object, String)
main.java.controlp5.RadioButton : RadioButton removeItem(String)
main.java.controlp5.RadioButton : RadioButton setArrayValue(float[])
main.java.controlp5.RadioButton : RadioButton setColorLabels(int)
main.java.controlp5.RadioButton : RadioButton setImage(PImage)
main.java.controlp5.RadioButton : RadioButton setImage(PImage, int)
main.java.controlp5.RadioButton : RadioButton setImages(PImage, PImage, PImage)
main.java.controlp5.RadioButton : RadioButton setItemHeight(int)
main.java.controlp5.RadioButton : RadioButton setItemWidth(int)
main.java.controlp5.RadioButton : RadioButton setItemsPerRow(int)
main.java.controlp5.RadioButton : RadioButton setLabelPadding(int, int)
main.java.controlp5.RadioButton : RadioButton setNoneSelectedAllowed(boolean)
main.java.controlp5.RadioButton : RadioButton setSize(PImage)
main.java.controlp5.RadioButton : RadioButton setSize(int, int)
main.java.controlp5.RadioButton : RadioButton setSpacingColumn(int)
main.java.controlp5.RadioButton : RadioButton setSpacingRow(int)
main.java.controlp5.RadioButton : RadioButton showLabels()
main.java.controlp5.RadioButton : RadioButton toUpperCase(boolean)
main.java.controlp5.RadioButton : RadioButton toggle(int)
main.java.controlp5.RadioButton : String getInfo()
main.java.controlp5.RadioButton : Toggle getItem(String)
main.java.controlp5.RadioButton : Toggle getItem(int)
main.java.controlp5.RadioButton : boolean getState(String)
main.java.controlp5.RadioButton : boolean getState(int)
main.java.controlp5.RadioButton : int[] getAlign()
main.java.controlp5.RadioButton : void updateLayout()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:19

*/


