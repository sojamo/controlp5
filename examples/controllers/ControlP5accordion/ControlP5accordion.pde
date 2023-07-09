/**
 * ControlP5 Accordion
 * arrange controller groups in an accordion like style.
 *
 * find a list of public methods available for the Accordion Controller 
 * at the bottom of this sketch. In the example below 3 groups with controllers
 * are created and added to an accordion controller. Furthermore several key 
 * combinations are mapped to control individual settings of the accordion.
 * An accordion comes in 2 modes, Accordion.SINGLE and Accordion.MULTI where the 
 * latter allows to open multiple groups of an accordion and the SINGLE mode only
 * allows 1 group to be opened at a time.  
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */

import controlP5.*;

ControlP5 cp5;

Accordion accordion;

color c = color(0, 160, 100);

void setup() {
  size(400, 600);
  noStroke();
  smooth();
  gui();
}

void gui() {
  
  cp5 = new ControlP5(this);
  
  // group number 1, contains 2 bangs
  Group g1 = cp5.addGroup("myGroup1")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addBang("bang")
     .setPosition(10,20)
     .setSize(100,100)
     .moveTo(g1)
     .plugTo(this,"shuffle");
     ;
     
  // group number 2, contains a radiobutton
  Group g2 = cp5.addGroup("myGroup2")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addRadioButton("radio")
     .setPosition(10,20)
     .setItemWidth(20)
     .setItemHeight(20)
     .addItem("black", 0)
     .addItem("red", 1)
     .addItem("green", 2)
     .addItem("blue", 3)
     .addItem("grey", 4)
     .setColorLabel(color(255))
     .activate(2)
     .moveTo(g2)
     ;

  // group number 3, contains a bang and a slider
  Group g3 = cp5.addGroup("myGroup3")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
  
  cp5.addBang("shuffle")
     .setPosition(10,20)
     .setSize(40,50)
     .moveTo(g3)
     ;
     
  cp5.addSlider("hello")
     .setPosition(60,20)
     .setSize(100,20)
     .setRange(100,500)
     .setValue(100)
     .moveTo(g3)
     ;
     
  cp5.addSlider("world")
     .setPosition(60,50)
     .setSize(100,20)
     .setRange(100,500)
     .setValue(200)
     .moveTo(g3)
     ;

  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(40,40)
                 .setWidth(200)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 ;
                 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0,1,2);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
}
  

void radio(int theC) {
  switch(theC) {
    case(0):c=color(0,200);break;
    case(1):c=color(255,0,0,200);break;
    case(2):c=color(0, 200, 140,200);break;
    case(3):c=color(0, 128, 255,200);break;
    case(4):c=color(50,128);break;
  }
} 


void shuffle() {
  c = color(random(255),random(255),random(255),random(128,255));
}


void draw() {
  background(220);
  
  fill(c);
  
  float s1 = cp5.getController("hello").getValue();
  ellipse(200,400,s1,s1);
  
  float s2 = cp5.getController("world").getValue();
  ellipse(300,100,s2,s2);
}





/*
a list of all methods available for the Accordion Controller
use ControlP5.printPublicMethodsFor(Accordion.class);
to print the following list into the console.

You can find further details about class Accordion in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Accordion : Accordion addItem(ControlGroup)
main.java.controlp5.Accordion : Accordion close()
main.java.controlp5.Accordion : Accordion open()
main.java.controlp5.Accordion : Accordion remove(ControllerInterface)
main.java.controlp5.Accordion : Accordion removeItem(ControlGroup)
main.java.controlp5.Accordion : Accordion setCollapseMode(int)
main.java.controlp5.Accordion : Accordion setItemHeight(int)
main.java.controlp5.Accordion : Accordion setMinItemHeight(int)
main.java.controlp5.Accordion : Accordion setWidth(int)
main.java.controlp5.Accordion : Accordion updateItems()
main.java.controlp5.Accordion : int getItemHeight()
main.java.controlp5.Accordion : int getMinItemHeight()
main.java.controlp5.ControlGroup : Accordion activateEvent(boolean)
main.java.controlp5.ControlGroup : Accordion addListener(ControlListener)
main.java.controlp5.ControlGroup : Accordion removeListener(ControlListener)
main.java.controlp5.ControlGroup : Accordion setBackgroundColor(int)
main.java.controlp5.ControlGroup : Accordion setBackgroundHeight(int)
main.java.controlp5.ControlGroup : Accordion setBarHeight(int)
main.java.controlp5.ControlGroup : Accordion setSize(int, int)
main.java.controlp5.ControlGroup : Accordion updateInternalEvents(PApplet)
main.java.controlp5.ControlGroup : String getInfo()
main.java.controlp5.ControlGroup : String toString()
main.java.controlp5.ControlGroup : int getBackgroundHeight()
main.java.controlp5.ControlGroup : int getBarHeight()
main.java.controlp5.ControlGroup : int listenerSize()
main.java.controlp5.ControllerGroup : Accordion add(ControllerInterface)
main.java.controlp5.ControllerGroup : Accordion addListener(ControlListener)
main.java.controlp5.ControllerGroup : Accordion bringToFront()
main.java.controlp5.ControllerGroup : Accordion bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : Accordion close()
main.java.controlp5.ControllerGroup : Accordion disableCollapse()
main.java.controlp5.ControllerGroup : Accordion enableCollapse()
main.java.controlp5.ControllerGroup : Accordion hide()
main.java.controlp5.ControllerGroup : Accordion hideArrow()
main.java.controlp5.ControllerGroup : Accordion hideBar()
main.java.controlp5.ControllerGroup : Accordion moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : Accordion moveTo(PApplet)
main.java.controlp5.ControllerGroup : Accordion open()
main.java.controlp5.ControllerGroup : Accordion registerProperty(String)
main.java.controlp5.ControllerGroup : Accordion registerProperty(String, String)
main.java.controlp5.ControllerGroup : Accordion remove(CDrawable)
main.java.controlp5.ControllerGroup : Accordion remove(ControllerInterface)
main.java.controlp5.ControllerGroup : Accordion removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : Accordion removeListener(ControlListener)
main.java.controlp5.ControllerGroup : Accordion removeProperty(String)
main.java.controlp5.ControllerGroup : Accordion removeProperty(String, String)
main.java.controlp5.ControllerGroup : Accordion setAddress(String)
main.java.controlp5.ControllerGroup : Accordion setArrayValue(float[])
main.java.controlp5.ControllerGroup : Accordion setArrayValue(int, float)
main.java.controlp5.ControllerGroup : Accordion setCaptionLabel(String)
main.java.controlp5.ControllerGroup : Accordion setColor(CColor)
main.java.controlp5.ControllerGroup : Accordion setColorActive(int)
main.java.controlp5.ControllerGroup : Accordion setColorBackground(int)
main.java.controlp5.ControllerGroup : Accordion setColorForeground(int)
main.java.controlp5.ControllerGroup : Accordion setColorLabel(int)
main.java.controlp5.ControllerGroup : Accordion setColorValue(int)
main.java.controlp5.ControllerGroup : Accordion setHeight(int)
main.java.controlp5.ControllerGroup : Accordion setId(int)
main.java.controlp5.ControllerGroup : Accordion setLabel(String)
main.java.controlp5.ControllerGroup : Accordion setMouseOver(boolean)
main.java.controlp5.ControllerGroup : Accordion setMoveable(boolean)
main.java.controlp5.ControllerGroup : Accordion setOpen(boolean)
main.java.controlp5.ControllerGroup : Accordion setPosition(float, float)
main.java.controlp5.ControllerGroup : Accordion setPosition(float[])
main.java.controlp5.ControllerGroup : Accordion setSize(int, int)
main.java.controlp5.ControllerGroup : Accordion setStringValue(String)
main.java.controlp5.ControllerGroup : Accordion setTitle(String)
main.java.controlp5.ControllerGroup : Accordion setUpdate(boolean)
main.java.controlp5.ControllerGroup : Accordion setValue(float)
main.java.controlp5.ControllerGroup : Accordion setVisible(boolean)
main.java.controlp5.ControllerGroup : Accordion setWidth(int)
main.java.controlp5.ControllerGroup : Accordion show()
main.java.controlp5.ControllerGroup : Accordion showArrow()
main.java.controlp5.ControllerGroup : Accordion showBar()
main.java.controlp5.ControllerGroup : Accordion update()
main.java.controlp5.ControllerGroup : Accordion updateAbsolutePosition()
main.java.controlp5.ControllerGroup : CColor getColor()
main.java.controlp5.ControllerGroup : Canvas addCanvas(Canvas)
main.java.controlp5.ControllerGroup : ControlWindow getWindow()
main.java.controlp5.ControllerGroup : Controller getController(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String)
main.java.controlp5.ControllerGroup : ControllerProperty getProperty(String, String)
main.java.controlp5.ControllerGroup : Label getCaptionLabel()
main.java.controlp5.ControllerGroup : Label getValueLabel()
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
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:25:32

*/


