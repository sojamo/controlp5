/**
* ControlP5 Group
*
*
* find a list of public methods available for the Group Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

void setup() {  
  size(800,400);

  cp5 = new ControlP5(this);
  
  Group g1 = cp5.addGroup("g1")
                .setPosition(100,100)
                .setBackgroundHeight(100)
                .setBackgroundColor(color(255,50))
                ;
                     
  cp5.addBang("A-1")
     .setPosition(10,20)
     .setSize(80,20)
     .setGroup(g1)
     ;
          
  cp5.addBang("A-2")
     .setPosition(10,60)
     .setSize(80,20)
     .setGroup(g1)
     ;
     
  
  Group g2 = cp5.addGroup("g2")
                .setPosition(250,100)
                .setWidth(300)
                .activateEvent(true)
                .setBackgroundColor(color(255,80))
                .setBackgroundHeight(100)
                .setLabel("Hello World.")
                ;
  
  cp5.addSlider("S-1")
     .setPosition(80,10)
     .setSize(180,9)
     .setGroup(g2)
     ;
     
  cp5.addSlider("S-2")
     .setPosition(80,20)
     .setSize(180,9)
     .setGroup(g2)
     ;
     
  cp5.addRadioButton("radio")
     .setPosition(10,10)
     .setSize(20,9)
     .addItem("black",0)
     .addItem("red",1)
     .addItem("green",2)
     .addItem("blue",3)
     .addItem("grey",4)
     .setGroup(g2)
     ;
     
  Group g3 = cp5.addGroup("g3")
                .setPosition(600,100)
                .setSize(150,200)
                .setBackgroundColor(color(255,100))
                ;
                
  
  cp5.addScrollableList("list")
     .setPosition(10,10)
     .setSize(130,100)
     .setGroup(g3)
     .addItems(java.util.Arrays.asList("a","b","c","d","e","f","g"))
     ;
}


void draw() {
  background(0);
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup()) {
    println("got an event from group "
            +theEvent.getGroup().getName()
            +", isOpen? "+theEvent.getGroup().isOpen()
            );
            
  } else if (theEvent.isController()){
    println("got something from a controller "
            +theEvent.getController().getName()
            );
  }
}


void keyPressed() {
  if(key==' ') {
    if(cp5.getGroup("g1")!=null) {
      cp5.getGroup("g1").remove();
    }
  }
}




/*
a list of all methods available for the Group Controller
use ControlP5.printPublicMethodsFor(Group.class);
to print the following list into the console.

You can find further details about class Group in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ControlGroup : Group activateEvent(boolean)
main.java.controlp5.ControlGroup : Group addListener(ControlListener)
main.java.controlp5.ControlGroup : Group removeListener(ControlListener)
main.java.controlp5.ControlGroup : Group setBackgroundColor(int)
main.java.controlp5.ControlGroup : Group setBackgroundHeight(int)
main.java.controlp5.ControlGroup : Group setBarHeight(int)
main.java.controlp5.ControlGroup : Group setSize(int, int)
main.java.controlp5.ControlGroup : Group updateInternalEvents(PApplet)
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
main.java.controlp5.ControllerGroup : Group add(ControllerInterface)
main.java.controlp5.ControllerGroup : Group addListener(ControlListener)
main.java.controlp5.ControllerGroup : Group bringToFront()
main.java.controlp5.ControllerGroup : Group bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : Group close()
main.java.controlp5.ControllerGroup : Group disableCollapse()
main.java.controlp5.ControllerGroup : Group enableCollapse()
main.java.controlp5.ControllerGroup : Group hide()
main.java.controlp5.ControllerGroup : Group hideArrow()
main.java.controlp5.ControllerGroup : Group hideBar()
main.java.controlp5.ControllerGroup : Group moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : Group moveTo(PApplet)
main.java.controlp5.ControllerGroup : Group open()
main.java.controlp5.ControllerGroup : Group registerProperty(String)
main.java.controlp5.ControllerGroup : Group registerProperty(String, String)
main.java.controlp5.ControllerGroup : Group remove(CDrawable)
main.java.controlp5.ControllerGroup : Group remove(ControllerInterface)
main.java.controlp5.ControllerGroup : Group removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : Group removeListener(ControlListener)
main.java.controlp5.ControllerGroup : Group removeProperty(String)
main.java.controlp5.ControllerGroup : Group removeProperty(String, String)
main.java.controlp5.ControllerGroup : Group setAddress(String)
main.java.controlp5.ControllerGroup : Group setArrayValue(float[])
main.java.controlp5.ControllerGroup : Group setArrayValue(int, float)
main.java.controlp5.ControllerGroup : Group setCaptionLabel(String)
main.java.controlp5.ControllerGroup : Group setColor(CColor)
main.java.controlp5.ControllerGroup : Group setColorActive(int)
main.java.controlp5.ControllerGroup : Group setColorBackground(int)
main.java.controlp5.ControllerGroup : Group setColorForeground(int)
main.java.controlp5.ControllerGroup : Group setColorLabel(int)
main.java.controlp5.ControllerGroup : Group setColorValue(int)
main.java.controlp5.ControllerGroup : Group setHeight(int)
main.java.controlp5.ControllerGroup : Group setId(int)
main.java.controlp5.ControllerGroup : Group setLabel(String)
main.java.controlp5.ControllerGroup : Group setMouseOver(boolean)
main.java.controlp5.ControllerGroup : Group setMoveable(boolean)
main.java.controlp5.ControllerGroup : Group setOpen(boolean)
main.java.controlp5.ControllerGroup : Group setPosition(float, float)
main.java.controlp5.ControllerGroup : Group setPosition(float[])
main.java.controlp5.ControllerGroup : Group setSize(int, int)
main.java.controlp5.ControllerGroup : Group setStringValue(String)
main.java.controlp5.ControllerGroup : Group setTitle(String)
main.java.controlp5.ControllerGroup : Group setUpdate(boolean)
main.java.controlp5.ControllerGroup : Group setValue(float)
main.java.controlp5.ControllerGroup : Group setVisible(boolean)
main.java.controlp5.ControllerGroup : Group setWidth(int)
main.java.controlp5.ControllerGroup : Group show()
main.java.controlp5.ControllerGroup : Group showArrow()
main.java.controlp5.ControllerGroup : Group showBar()
main.java.controlp5.ControllerGroup : Group update()
main.java.controlp5.ControllerGroup : Group updateAbsolutePosition()
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

created: 2015/03/24 12:21:07

*/


