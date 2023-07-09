/**
 * ControlP5 Color picker. a simple color picker, 
 * 4 horizontal sliders controlling the RGBA channels of a color.
 * to grab the current color value, use function getColorValue() of
 * the color picker.
 *
 * find a list of public methods available for the ColorPicker Controller 
 * at the bottom of this sketch's source code
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlP5
 *
 */
import controlP5.*;

ControlP5 cp5;

ColorPicker cp;

void setup() {
  size(800, 400);
  noStroke();
  cp5 = new ControlP5(this);
  cp = cp5.addColorPicker("picker")
          .setPosition(60, 100)
          .setColorValue(color(255, 128, 0, 128))
          ;
}

void draw() {
  background(cp.getColorValue());
  fill(0, 80);
  rect(50, 90, 275, 80);
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r,g,b,a);
    println("event \talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}

// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  println("picker\talpha:"+int(alpha(col))+"\tred:"+int(red(col))+"\tgreen:"+int(green(col))+"\tblue:"+int(blue(col))+"\tcol"+col);
}


void keyPressed() {
  switch(key) {
    case('1'):
    // method A to change color
    cp.setArrayValue(new float[] {120, 0, 120, 255});
    break;
    case('2'):
    // method B to change color
    cp.setColorValue(color(255, 0, 0, 255));
    break;
  }
}
 
/*
a list of all methods available for the ColorPicker Controller
use ControlP5.printPublicMethodsFor(ColorPicker.class);
to print the following list into the console.

You can find further details about class ColorPicker in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.ColorPicker : ColorPicker plugTo(Object)
main.java.controlp5.ColorPicker : ColorPicker plugTo(Object, String)
main.java.controlp5.ColorPicker : ColorPicker setArrayValue(float[])
main.java.controlp5.ColorPicker : ColorPicker setColorValue(int)
main.java.controlp5.ColorPicker : String getInfo()
main.java.controlp5.ColorPicker : int getColorValue()
main.java.controlp5.ControlGroup : ColorPicker activateEvent(boolean)
main.java.controlp5.ControlGroup : ColorPicker addListener(ControlListener)
main.java.controlp5.ControlGroup : ColorPicker removeListener(ControlListener)
main.java.controlp5.ControlGroup : ColorPicker setBackgroundColor(int)
main.java.controlp5.ControlGroup : ColorPicker setBackgroundHeight(int)
main.java.controlp5.ControlGroup : ColorPicker setBarHeight(int)
main.java.controlp5.ControlGroup : ColorPicker setSize(int, int)
main.java.controlp5.ControlGroup : ColorPicker updateInternalEvents(PApplet)
main.java.controlp5.ControlGroup : String getInfo()
main.java.controlp5.ControlGroup : String toString()
main.java.controlp5.ControlGroup : int getBackgroundHeight()
main.java.controlp5.ControlGroup : int getBarHeight()
main.java.controlp5.ControlGroup : int listenerSize()
main.java.controlp5.ControllerGroup : CColor getColor()
main.java.controlp5.ControllerGroup : Canvas addCanvas(Canvas)
main.java.controlp5.ControllerGroup : ColorPicker add(ControllerInterface)
main.java.controlp5.ControllerGroup : ColorPicker addListener(ControlListener)
main.java.controlp5.ControllerGroup : ColorPicker bringToFront()
main.java.controlp5.ControllerGroup : ColorPicker bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : ColorPicker close()
main.java.controlp5.ControllerGroup : ColorPicker disableCollapse()
main.java.controlp5.ControllerGroup : ColorPicker enableCollapse()
main.java.controlp5.ControllerGroup : ColorPicker hide()
main.java.controlp5.ControllerGroup : ColorPicker hideArrow()
main.java.controlp5.ControllerGroup : ColorPicker hideBar()
main.java.controlp5.ControllerGroup : ColorPicker moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : ColorPicker moveTo(PApplet)
main.java.controlp5.ControllerGroup : ColorPicker open()
main.java.controlp5.ControllerGroup : ColorPicker registerProperty(String)
main.java.controlp5.ControllerGroup : ColorPicker registerProperty(String, String)
main.java.controlp5.ControllerGroup : ColorPicker remove(CDrawable)
main.java.controlp5.ControllerGroup : ColorPicker remove(ControllerInterface)
main.java.controlp5.ControllerGroup : ColorPicker removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : ColorPicker removeListener(ControlListener)
main.java.controlp5.ControllerGroup : ColorPicker removeProperty(String)
main.java.controlp5.ControllerGroup : ColorPicker removeProperty(String, String)
main.java.controlp5.ControllerGroup : ColorPicker setAddress(String)
main.java.controlp5.ControllerGroup : ColorPicker setArrayValue(float[])
main.java.controlp5.ControllerGroup : ColorPicker setArrayValue(int, float)
main.java.controlp5.ControllerGroup : ColorPicker setCaptionLabel(String)
main.java.controlp5.ControllerGroup : ColorPicker setColor(CColor)
main.java.controlp5.ControllerGroup : ColorPicker setColorActive(int)
main.java.controlp5.ControllerGroup : ColorPicker setColorBackground(int)
main.java.controlp5.ControllerGroup : ColorPicker setColorForeground(int)
main.java.controlp5.ControllerGroup : ColorPicker setColorLabel(int)
main.java.controlp5.ControllerGroup : ColorPicker setColorValue(int)
main.java.controlp5.ControllerGroup : ColorPicker setHeight(int)
main.java.controlp5.ControllerGroup : ColorPicker setId(int)
main.java.controlp5.ControllerGroup : ColorPicker setLabel(String)
main.java.controlp5.ControllerGroup : ColorPicker setMouseOver(boolean)
main.java.controlp5.ControllerGroup : ColorPicker setMoveable(boolean)
main.java.controlp5.ControllerGroup : ColorPicker setOpen(boolean)
main.java.controlp5.ControllerGroup : ColorPicker setPosition(float, float)
main.java.controlp5.ControllerGroup : ColorPicker setPosition(float[])
main.java.controlp5.ControllerGroup : ColorPicker setSize(int, int)
main.java.controlp5.ControllerGroup : ColorPicker setStringValue(String)
main.java.controlp5.ControllerGroup : ColorPicker setTitle(String)
main.java.controlp5.ControllerGroup : ColorPicker setUpdate(boolean)
main.java.controlp5.ControllerGroup : ColorPicker setValue(float)
main.java.controlp5.ControllerGroup : ColorPicker setVisible(boolean)
main.java.controlp5.ControllerGroup : ColorPicker setWidth(int)
main.java.controlp5.ControllerGroup : ColorPicker show()
main.java.controlp5.ControllerGroup : ColorPicker showArrow()
main.java.controlp5.ControllerGroup : ColorPicker showBar()
main.java.controlp5.ControllerGroup : ColorPicker update()
main.java.controlp5.ControllerGroup : ColorPicker updateAbsolutePosition()
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

created: 2015/03/24 12:20:58

*/