/**
* ControlP5 Textarea
*
*
* find a list of public methods available for the Textarea Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;
Textarea myTextarea;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(100,100)
                  .setSize(200,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("Lorem Ipsum is simply dummy text of the printing and typesetting"
                    +" industry. Lorem Ipsum has been the industry's standard dummy text"
                    +" ever since the 1500s, when an unknown printer took a galley of type"
                    +" and scrambled it to make a type specimen book. It has survived not"
                    +" only five centuries, but also the leap into electronic typesetting,"
                    +" remaining essentially unchanged. It was popularised in the 1960s"
                    +" with the release of Letraset sheets containing Lorem Ipsum passages,"
                    +" and more recently with desktop publishing software like Aldus"
                    +" PageMaker including versions of Lorem Ipsum."
                    );
    
  cp5.addSlider("changeWidth")
     .setRange(100,400)
     .setValue(200)
     .setPosition(100,20)
     .setSize(100,19)
     ;
     
  cp5.addSlider("changeHeight")
     .setRange(100,400)
     .setValue(200)
     .setPosition(100,40)
     .setSize(100,19)
     ;
  
}


void keyPressed() {
  if(key=='r') {
    myTextarea.setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                      +" Quisque sed velit nec eros scelerisque adipiscing vitae eu sem."
                      +" Quisque malesuada interdum lectus. Pellentesque pellentesque molestie"
                      +" vestibulum. Maecenas ultricies, neque at porttitor lacinia, tellus enim"
                      +" suscipit tortor, ut dapibus orci lorem non ipsum. Mauris ut velit velit."
                      +" Fusce at purus in augue semper tincidunt imperdiet sit amet eros."
                      +" Vestibulum nunc diam, fringilla vitae tristique ut, viverra ut felis."
                      +" Proin aliquet turpis ornare leo aliquam dapibus. Integer dui nisi, condimentum"
                      +" ut sagittis non, fringilla vestibulum sapien. Sed ullamcorper libero et massa"
                      +" congue in facilisis mauris lobortis. Fusce cursus risus sit amet leo imperdiet"
                      +" lacinia faucibus turpis tempus. Pellentesque pellentesque augue sed purus varius"
                      +" sed volutpat dui rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                      );
                      
  } else if(key=='c') {
    myTextarea.setColor(0xffffffff);
  }
}
void draw() {
  background(0);
  if(keyPressed && key==' ') {
    myTextarea.scroll((float)mouseX/(float)width);
  }
  if(keyPressed && key=='l') {
    myTextarea.setLineHeight(mouseY);
  }
}

void changeWidth(int theValue) {
  myTextarea.setWidth(theValue);
}

void changeHeight(int theValue) {
  myTextarea.setHeight(theValue);
}




/*
a list of all methods available for the Textarea Controller
use ControlP5.printPublicMethodsFor(Textarea.class);
to print the following list into the console.

You can find further details about class Textarea in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


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
main.java.controlp5.ControllerGroup : Textarea add(ControllerInterface)
main.java.controlp5.ControllerGroup : Textarea addListener(ControlListener)
main.java.controlp5.ControllerGroup : Textarea bringToFront()
main.java.controlp5.ControllerGroup : Textarea bringToFront(ControllerInterface)
main.java.controlp5.ControllerGroup : Textarea close()
main.java.controlp5.ControllerGroup : Textarea disableCollapse()
main.java.controlp5.ControllerGroup : Textarea enableCollapse()
main.java.controlp5.ControllerGroup : Textarea hide()
main.java.controlp5.ControllerGroup : Textarea hideArrow()
main.java.controlp5.ControllerGroup : Textarea hideBar()
main.java.controlp5.ControllerGroup : Textarea moveTo(ControlWindow)
main.java.controlp5.ControllerGroup : Textarea moveTo(PApplet)
main.java.controlp5.ControllerGroup : Textarea open()
main.java.controlp5.ControllerGroup : Textarea registerProperty(String)
main.java.controlp5.ControllerGroup : Textarea registerProperty(String, String)
main.java.controlp5.ControllerGroup : Textarea remove(CDrawable)
main.java.controlp5.ControllerGroup : Textarea remove(ControllerInterface)
main.java.controlp5.ControllerGroup : Textarea removeCanvas(Canvas)
main.java.controlp5.ControllerGroup : Textarea removeListener(ControlListener)
main.java.controlp5.ControllerGroup : Textarea removeProperty(String)
main.java.controlp5.ControllerGroup : Textarea removeProperty(String, String)
main.java.controlp5.ControllerGroup : Textarea setAddress(String)
main.java.controlp5.ControllerGroup : Textarea setArrayValue(float[])
main.java.controlp5.ControllerGroup : Textarea setArrayValue(int, float)
main.java.controlp5.ControllerGroup : Textarea setCaptionLabel(String)
main.java.controlp5.ControllerGroup : Textarea setColor(CColor)
main.java.controlp5.ControllerGroup : Textarea setColorActive(int)
main.java.controlp5.ControllerGroup : Textarea setColorBackground(int)
main.java.controlp5.ControllerGroup : Textarea setColorForeground(int)
main.java.controlp5.ControllerGroup : Textarea setColorLabel(int)
main.java.controlp5.ControllerGroup : Textarea setColorValue(int)
main.java.controlp5.ControllerGroup : Textarea setHeight(int)
main.java.controlp5.ControllerGroup : Textarea setId(int)
main.java.controlp5.ControllerGroup : Textarea setLabel(String)
main.java.controlp5.ControllerGroup : Textarea setMouseOver(boolean)
main.java.controlp5.ControllerGroup : Textarea setMoveable(boolean)
main.java.controlp5.ControllerGroup : Textarea setOpen(boolean)
main.java.controlp5.ControllerGroup : Textarea setPosition(float, float)
main.java.controlp5.ControllerGroup : Textarea setPosition(float[])
main.java.controlp5.ControllerGroup : Textarea setSize(int, int)
main.java.controlp5.ControllerGroup : Textarea setStringValue(String)
main.java.controlp5.ControllerGroup : Textarea setTitle(String)
main.java.controlp5.ControllerGroup : Textarea setUpdate(boolean)
main.java.controlp5.ControllerGroup : Textarea setValue(float)
main.java.controlp5.ControllerGroup : Textarea setVisible(boolean)
main.java.controlp5.ControllerGroup : Textarea setWidth(int)
main.java.controlp5.ControllerGroup : Textarea show()
main.java.controlp5.ControllerGroup : Textarea showArrow()
main.java.controlp5.ControllerGroup : Textarea showBar()
main.java.controlp5.ControllerGroup : Textarea update()
main.java.controlp5.ControllerGroup : Textarea updateAbsolutePosition()
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
main.java.controlp5.Textarea : Label getValueLabel()
main.java.controlp5.Textarea : String getStringValue()
main.java.controlp5.Textarea : String getText()
main.java.controlp5.Textarea : Textarea append(String)
main.java.controlp5.Textarea : Textarea append(String, int)
main.java.controlp5.Textarea : Textarea clear()
main.java.controlp5.Textarea : Textarea disableColorBackground()
main.java.controlp5.Textarea : Textarea enableColorBackground()
main.java.controlp5.Textarea : Textarea hideScrollbar()
main.java.controlp5.Textarea : Textarea scroll(float)
main.java.controlp5.Textarea : Textarea setBorderColor(int)
main.java.controlp5.Textarea : Textarea setColor(int)
main.java.controlp5.Textarea : Textarea setColorBackground(int)
main.java.controlp5.Textarea : Textarea setFont(ControlFont)
main.java.controlp5.Textarea : Textarea setFont(PFont)
main.java.controlp5.Textarea : Textarea setFont(int)
main.java.controlp5.Textarea : Textarea setHeight(int)
main.java.controlp5.Textarea : Textarea setLineHeight(int)
main.java.controlp5.Textarea : Textarea setScrollActive(int)
main.java.controlp5.Textarea : Textarea setScrollBackground(int)
main.java.controlp5.Textarea : Textarea setScrollForeground(int)
main.java.controlp5.Textarea : Textarea setSize(int, int)
main.java.controlp5.Textarea : Textarea setText(String)
main.java.controlp5.Textarea : Textarea setWidth(int)
main.java.controlp5.Textarea : Textarea showScrollbar()
main.java.controlp5.Textarea : boolean isScrollable()
main.java.controlp5.Textarea : float getValue()
main.java.controlp5.Textarea : void controlEvent(ControlEvent)
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:29

*/


