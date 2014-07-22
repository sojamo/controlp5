/**
 * ControlP5 controlFont. 
 *
 * this example shows how to create a button with controlP5 (1), how to
 * load and use a PFont with controlP5 (2), apply a ControlFont to
 * the caption label of a button (3), and adjust the location of a
 * caption label using the style() property of a controller.
 * 
 * by andreas schlegel, 2012
 */
import controlP5.*;

ControlP5 cp5;

controlP5.Button b;

int buttonValue = 1;

boolean isOpen;

int myColorBackground = color(0,0,0);


void setup() {
  size(700,400);
  smooth();
  
  cp5 = new ControlP5(this);
  // (1)
  // create some controllers
  cp5.addButton("button")
     .setValue(10)
     .setPosition(20,20)
     .setSize(100,50)
     .setId(1);
     
  b = cp5.addButton("buttonValue")
         .setValue(4)
         .setPosition(100,190)
         .setSize(200,200)
         .setId(2);
  
  // (2)
  // load a new font. ControlFont is a wrapper for processing's PFont
  // with processing 1.1 ControlFont.setSmooth() is not supported anymore.
  // to display a font as smooth or non-smooth, use true/false as 3rd parameter
  // when creating a PFont:
  
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
 
  

  // (3)
  // change the font and content of the captionlabels 
  // for both buttons create earlier.
  cp5.getController("button")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(24)
     ;
     
  b.getCaptionLabel()
   .setFont(font)
   .setSize(50)
   .toUpperCase(false)
   .setText("hello")
   ;
//  
  // (4)
  // adjust the location of a catiption label using the 
  // style property of a controller.
  b.getCaptionLabel().getStyle().marginLeft = 20;
  b.getCaptionLabel().getStyle().marginTop = 40;

}

void draw() {
  background(ControlP5.SILVER);
  // animate button b
  float x = b.x(b.getPosition());
  x += ((isOpen==true ? 0:-200) - x) * 0.2;;
  float y = b.y(b.getPosition());
  b.setPosition(x,y);
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getId());
}

public void button(float theValue) {
  println("a button event. "+theValue);
  isOpen = !isOpen;
  cp5.getController("button").setCaptionLabel((isOpen==true) ? "close":"open");
}




