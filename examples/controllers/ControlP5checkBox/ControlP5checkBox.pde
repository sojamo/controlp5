/**
 * ControlP5 Checkbox
 * an example demonstrating the use of a checkbox in controlP5. 
 * CheckBox extends the RadioButton class.
 * to control a checkbox use: 
 * activate(), deactivate(), activateAll(), deactivateAll(), toggle(), getState()
 *
 * find a list of public methods available for the Checkbox Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlP5
 *
 */


import controlP5.*;

ControlP5 cp5;

CheckBox checkbox;

int myColorBackground;

void setup() {
  size(800, 400);
  smooth();
  cp5 = new ControlP5(this);
  checkbox = cp5.addCheckBox("checkBox")
                .setPosition(100, 200)
                .setSize(40, 40)
                .setItemsPerRow(3)
                .setSpacingColumn(30)
                .setSpacingRow(20)
                .addItem("0", 0)
                .addItem("50", 50)
                .addItem("100", 100)
                .addItem("150", 150)
                .addItem("200", 200)
                .addItem("255", 255)
                ;
}

void keyPressed() {
  if (key==' ') {
    checkbox.deactivateAll();
  } 
  else {
    for (int i=0;i<6;i++) {
      // check if key 0-5 have been pressed and toggle
      // the checkbox item accordingly.
      if (keyCode==(48 + i)) { 
        // the index of checkbox items start at 0
        checkbox.toggle(i);
        println("toggle "+checkbox.getItem(i).getName());
        // also see 
        // checkbox.activate(index);
        // checkbox.deactivate(index);
      }
    }
  }
}

void draw() {
  background(170);
  pushMatrix();
  translate(width/2 + 200, height/2);
  stroke(255);
  strokeWeight(2);
  fill(myColorBackground);
  ellipse(0,0,200,200);
  popMatrix();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    myColorBackground = 0;
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue());
    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      print(n);
      if(n==1) {
        myColorBackground += checkbox.getItem(i).internalValue();
      }
    }
    println();    
  }
}

void checkBox(float[] a) {
  println(a);
}


/*
a list of all methods available for the CheckBox Controller
use ControlP5.printPublicMethodsFor(CheckBox.class);
to print the following list into the console.

You can find further details about class CheckBox in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.CheckBox : CheckBox addItem(String, float)
main.java.controlp5.CheckBox : CheckBox addItem(Toggle, float)
main.java.controlp5.CheckBox : CheckBox deactivateAll()
main.java.controlp5.CheckBox : CheckBox hideLabels()
main.java.controlp5.CheckBox : CheckBox plugTo(Object)
main.java.controlp5.CheckBox : CheckBox plugTo(Object, String)
main.java.controlp5.CheckBox : CheckBox removeItem(String)
main.java.controlp5.CheckBox : CheckBox setArrayValue(float[])
main.java.controlp5.CheckBox : CheckBox setColorLabels(int)
main.java.controlp5.CheckBox : CheckBox setImage(PImage)
main.java.controlp5.CheckBox : CheckBox setImage(PImage, int)
main.java.controlp5.CheckBox : CheckBox setImages(PImage, PImage, PImage)
main.java.controlp5.CheckBox : CheckBox setItemHeight(int)
main.java.controlp5.CheckBox : CheckBox setItemWidth(int)
main.java.controlp5.CheckBox : CheckBox setItemsPerRow(int)
main.java.controlp5.CheckBox : CheckBox setNoneSelectedAllowed(boolean)
main.java.controlp5.CheckBox : CheckBox setSize(PImage)
main.java.controlp5.CheckBox : CheckBox setSize(int, int)
main.java.controlp5.CheckBox : CheckBox setSpacingColumn(int)
main.java.controlp5.CheckBox : CheckBox setSpacingRow(int)
main.java.controlp5.CheckBox : CheckBox showLabels()
main.java.controlp5.CheckBox : CheckBox toUpperCase(boolean)
main.java.controlp5.CheckBox : List getItems()
main.java.controlp5.CheckBox : String getInfo()
main.java.controlp5.CheckBox : String toString()
main.java.controlp5.CheckBox : Toggle getItem(int)
main.java.controlp5.CheckBox : boolean getState(String)
main.java.controlp5.CheckBox : boolean getState(int)
main.java.controlp5.CheckBox : void updateLayout()
main.java.controlp5.ControlGroup : CheckBox activateEvent(boolean)
main.java.controlp5.ControlGroup : CheckBox addListener(ControlListener)
main.java.controlp5.ControlGroup : CheckBox removeListener(ControlListener)
main.java.controlp5.ControlGroup : CheckBox setBackgroundColor(int)
main.java.controlp5.ControlGroup : CheckBox setBackgroundHeight(int)
main.java.controlp5.ControlGroup : CheckBox setBarHeight(int)
main.java.controlp5.ControlGroup : CheckBox setSize(int, int)
main.java.controlp5.ControlGroup : CheckBox updateInternalEvents(PApplet)
main.java.controlp5.ControlGroup : String getInfo()
main.java.controlp5.ControlGroup : String toString()
main.java.controlp5.ControlGroup : int getBackgroundHeight()
main.java.controlp5.ControlGroup : int getBarHeight()
main.java.controlp5.ControlGroup : int listenerSize()
main.java.controlp5.ControllerGroup : CColor getColor()
main.java.controlp5.ControllerGroup : Canvas addCanvas(Canvas)
main.java.controlp5.ControllerGroup : CheckBox add(ControllerInterface)
main.java.controlp5.ControllerGroup : CheckBox addListener(ControlListener)
main.java.controlp5.ControllerGroup : CheckBox bringToFront()
main.java.controlp5.ControllerGroup : CheckBox bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : CheckBox close()
main.java.controlp5.ControllerGroup : CheckBox disableCollapse()
main.java.controlp5.ControllerGroup : CheckBox enableCollapse()
main.java.controlp5.ControllerGroup : CheckBox hide()
main.java.controlp5.ControllerGroup : CheckBox hideArrow()
main.java.controlp5.ControllerGroup : CheckBox hideBar()
main.java.controlp5.ControllerGroup : CheckBox moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : CheckBox moveTo(PApplet)
main.java.controlp5.ControllerGroup : CheckBox open()
main.java.controlp5.ControllerGroup : CheckBox registerProperty(String)
main.java.controlp5.ControllerGroup : CheckBox registerProperty(String, String)
main.java.controlp5.ControllerGroup : CheckBox remove(CDrawable)
main.java.controlp5.ControllerGroup : CheckBox remove(ControllerInterface)
main.java.controlp5.ControllerGroup : CheckBox removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : CheckBox removeListener(ControlListener)
main.java.controlp5.ControllerGroup : CheckBox removeProperty(String)
main.java.controlp5.ControllerGroup : CheckBox removeProperty(String, String)
main.java.controlp5.ControllerGroup : CheckBox setAddress(String)
main.java.controlp5.ControllerGroup : CheckBox setArrayValue(float[])
main.java.controlp5.ControllerGroup : CheckBox setArrayValue(int, float)
main.java.controlp5.ControllerGroup : CheckBox setCaptionLabel(String)
main.java.controlp5.ControllerGroup : CheckBox setColor(CColor)
main.java.controlp5.ControllerGroup : CheckBox setColorActive(int)
main.java.controlp5.ControllerGroup : CheckBox setColorBackground(int)
main.java.controlp5.ControllerGroup : CheckBox setColorForeground(int)
main.java.controlp5.ControllerGroup : CheckBox setColorLabel(int)
main.java.controlp5.ControllerGroup : CheckBox setColorValue(int)
main.java.controlp5.ControllerGroup : CheckBox setHeight(int)
main.java.controlp5.ControllerGroup : CheckBox setId(int)
main.java.controlp5.ControllerGroup : CheckBox setLabel(String)
main.java.controlp5.ControllerGroup : CheckBox setMouseOver(boolean)
main.java.controlp5.ControllerGroup : CheckBox setMoveable(boolean)
main.java.controlp5.ControllerGroup : CheckBox setOpen(boolean)
main.java.controlp5.ControllerGroup : CheckBox setPosition(float, float)
main.java.controlp5.ControllerGroup : CheckBox setPosition(float[])
main.java.controlp5.ControllerGroup : CheckBox setSize(int, int)
main.java.controlp5.ControllerGroup : CheckBox setStringValue(String)
main.java.controlp5.ControllerGroup : CheckBox setTitle(String)
main.java.controlp5.ControllerGroup : CheckBox setUpdate(boolean)
main.java.controlp5.ControllerGroup : CheckBox setValue(float)
main.java.controlp5.ControllerGroup : CheckBox setVisible(boolean)
main.java.controlp5.ControllerGroup : CheckBox setWidth(int)
main.java.controlp5.ControllerGroup : CheckBox show()
main.java.controlp5.ControllerGroup : CheckBox showArrow()
main.java.controlp5.ControllerGroup : CheckBox showBar()
main.java.controlp5.ControllerGroup : CheckBox update()
main.java.controlp5.ControllerGroup : CheckBox updateAbsolutePosition()
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

created: 2015/03/24 12:20:56

*/


