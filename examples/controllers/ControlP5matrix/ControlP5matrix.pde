/**
 * ControlP5 Matrix
 *
 * A matrix can be used for example as a sequencer, a drum machine.
 *
 * find a list of public methods available for the Matrix Controller
 * at the bottom of this sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */

import controlP5.*;

ControlP5 cp5;

Dong[][] d;
int nx = 10;
int ny = 10;

void setup() {
  size(700, 400);

  cp5 = new ControlP5(this);

  cp5.addMatrix("myMatrix")
     .setPosition(50, 100)
     .setSize(200, 200)
     .setGrid(nx, ny)
     .setGap(10, 1)
     .setInterval(200)
     .setMode(ControlP5.MULTIPLES)
     .setColorBackground(color(120))
     .setBackground(color(40))
     ;
  
  cp5.getController("myMatrix").getCaptionLabel().alignX(CENTER);
  
  // use setMode to change the cell-activation which by 
  // default is ControlP5.SINGLE_ROW, 1 active cell per row, 
  // but can be changed to ControlP5.SINGLE_COLUMN or 
  // ControlP5.MULTIPLES

    d = new Dong[nx][ny];
  for (int x = 0;x<nx;x++) {
    for (int y = 0;y<ny;y++) {
      d[x][y] = new Dong();
    }
  }  
  noStroke();
  smooth();
}


void draw() {
  background(0);
  fill(255, 100);
  pushMatrix();
  translate(width/2 + 150, height/2);
  rotate(frameCount*0.001);
  for (int x = 0;x<nx;x++) {
    for (int y = 0;y<ny;y++) {
      d[x][y].display();
    }
  }
  popMatrix();
}


void myMatrix(int theX, int theY) {
  println("got it: "+theX+", "+theY);
  d[theX][theY].update();
}


void keyPressed() {
  if (key=='1') {
    cp5.get(Matrix.class, "myMatrix").set(0, 0, true);
  } 
  else if (key=='2') {
    cp5.get(Matrix.class, "myMatrix").set(0, 1, true);
  }  
  else if (key=='3') {
    cp5.get(Matrix.class, "myMatrix").trigger(0);
  }
  else if (key=='p') {
    if (cp5.get(Matrix.class, "myMatrix").isPlaying()) {
      cp5.get(Matrix.class, "myMatrix").pause();
    } 
    else {
      cp5.get(Matrix.class, "myMatrix").play();
    }
  }  
  else if (key=='0') {
    cp5.get(Matrix.class, "myMatrix").clear();
  }
}

void controlEvent(ControlEvent theEvent) {
}


class Dong {
  float x, y;
  float s0, s1;

  Dong() {
    float f= random(-PI, PI);
    x = cos(f)*random(100, 150);
    y = sin(f)*random(100, 150);
    s0 = random(2, 10);
  }

  void display() {
    s1 += (s0-s1)*0.1;
    ellipse(x, y, s1, s1);
  }

  void update() {
    s1 = 50;
  }
}



/*
a list of all methods available for the Matrix Controller
use ControlP5.printPublicMethodsFor(Matrix.class);
to print the following list into the console.

You can find further details about class Matrix in the javadoc.

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
main.java.controlp5.Controller : Matrix addCallback(CallbackListener)
main.java.controlp5.Controller : Matrix addListener(ControlListener)
main.java.controlp5.Controller : Matrix addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Matrix align(int, int, int, int)
main.java.controlp5.Controller : Matrix bringToFront()
main.java.controlp5.Controller : Matrix bringToFront(ControllerInterface)
main.java.controlp5.Controller : Matrix hide()
main.java.controlp5.Controller : Matrix linebreak()
main.java.controlp5.Controller : Matrix listen(boolean)
main.java.controlp5.Controller : Matrix lock()
main.java.controlp5.Controller : Matrix onChange(CallbackListener)
main.java.controlp5.Controller : Matrix onClick(CallbackListener)
main.java.controlp5.Controller : Matrix onDoublePress(CallbackListener)
main.java.controlp5.Controller : Matrix onDrag(CallbackListener)
main.java.controlp5.Controller : Matrix onDraw(ControllerView)
main.java.controlp5.Controller : Matrix onEndDrag(CallbackListener)
main.java.controlp5.Controller : Matrix onEnter(CallbackListener)
main.java.controlp5.Controller : Matrix onLeave(CallbackListener)
main.java.controlp5.Controller : Matrix onMove(CallbackListener)
main.java.controlp5.Controller : Matrix onPress(CallbackListener)
main.java.controlp5.Controller : Matrix onRelease(CallbackListener)
main.java.controlp5.Controller : Matrix onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Matrix onStartDrag(CallbackListener)
main.java.controlp5.Controller : Matrix onWheel(CallbackListener)
main.java.controlp5.Controller : Matrix plugTo(Object)
main.java.controlp5.Controller : Matrix plugTo(Object, String)
main.java.controlp5.Controller : Matrix plugTo(Object[])
main.java.controlp5.Controller : Matrix plugTo(Object[], String)
main.java.controlp5.Controller : Matrix registerProperty(String)
main.java.controlp5.Controller : Matrix registerProperty(String, String)
main.java.controlp5.Controller : Matrix registerTooltip(String)
main.java.controlp5.Controller : Matrix removeBehavior()
main.java.controlp5.Controller : Matrix removeCallback()
main.java.controlp5.Controller : Matrix removeCallback(CallbackListener)
main.java.controlp5.Controller : Matrix removeListener(ControlListener)
main.java.controlp5.Controller : Matrix removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Matrix removeListenersFor(int)
main.java.controlp5.Controller : Matrix removeProperty(String)
main.java.controlp5.Controller : Matrix removeProperty(String, String)
main.java.controlp5.Controller : Matrix setArrayValue(float[])
main.java.controlp5.Controller : Matrix setArrayValue(int, float)
main.java.controlp5.Controller : Matrix setBehavior(ControlBehavior)
main.java.controlp5.Controller : Matrix setBroadcast(boolean)
main.java.controlp5.Controller : Matrix setCaptionLabel(String)
main.java.controlp5.Controller : Matrix setColor(CColor)
main.java.controlp5.Controller : Matrix setColorActive(int)
main.java.controlp5.Controller : Matrix setColorBackground(int)
main.java.controlp5.Controller : Matrix setColorCaptionLabel(int)
main.java.controlp5.Controller : Matrix setColorForeground(int)
main.java.controlp5.Controller : Matrix setColorLabel(int)
main.java.controlp5.Controller : Matrix setColorValue(int)
main.java.controlp5.Controller : Matrix setColorValueLabel(int)
main.java.controlp5.Controller : Matrix setDecimalPrecision(int)
main.java.controlp5.Controller : Matrix setDefaultValue(float)
main.java.controlp5.Controller : Matrix setHeight(int)
main.java.controlp5.Controller : Matrix setId(int)
main.java.controlp5.Controller : Matrix setImage(PImage)
main.java.controlp5.Controller : Matrix setImage(PImage, int)
main.java.controlp5.Controller : Matrix setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Matrix setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Matrix setLabel(String)
main.java.controlp5.Controller : Matrix setLabelVisible(boolean)
main.java.controlp5.Controller : Matrix setLock(boolean)
main.java.controlp5.Controller : Matrix setMax(float)
main.java.controlp5.Controller : Matrix setMin(float)
main.java.controlp5.Controller : Matrix setMouseOver(boolean)
main.java.controlp5.Controller : Matrix setMoveable(boolean)
main.java.controlp5.Controller : Matrix setPosition(float, float)
main.java.controlp5.Controller : Matrix setPosition(float[])
main.java.controlp5.Controller : Matrix setSize(PImage)
main.java.controlp5.Controller : Matrix setSize(int, int)
main.java.controlp5.Controller : Matrix setStringValue(String)
main.java.controlp5.Controller : Matrix setUpdate(boolean)
main.java.controlp5.Controller : Matrix setValue(float)
main.java.controlp5.Controller : Matrix setValueLabel(String)
main.java.controlp5.Controller : Matrix setValueSelf(float)
main.java.controlp5.Controller : Matrix setView(ControllerView)
main.java.controlp5.Controller : Matrix setVisible(boolean)
main.java.controlp5.Controller : Matrix setWidth(int)
main.java.controlp5.Controller : Matrix show()
main.java.controlp5.Controller : Matrix unlock()
main.java.controlp5.Controller : Matrix unplugFrom(Object)
main.java.controlp5.Controller : Matrix unplugFrom(Object[])
main.java.controlp5.Controller : Matrix unregisterTooltip()
main.java.controlp5.Controller : Matrix update()
main.java.controlp5.Controller : Matrix updateSize()
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
main.java.controlp5.Matrix : Matrix clear()
main.java.controlp5.Matrix : Matrix pause()
main.java.controlp5.Matrix : Matrix play()
main.java.controlp5.Matrix : Matrix plugTo(Object)
main.java.controlp5.Matrix : Matrix plugTo(Object, String)
main.java.controlp5.Matrix : Matrix set(int, int, boolean)
main.java.controlp5.Matrix : Matrix setBackground(int)
main.java.controlp5.Matrix : Matrix setCells(int[][])
main.java.controlp5.Matrix : Matrix setGap(int, int)
main.java.controlp5.Matrix : Matrix setGrid(int, int)
main.java.controlp5.Matrix : Matrix setInterval(int)
main.java.controlp5.Matrix : Matrix setMode(int)
main.java.controlp5.Matrix : Matrix setValue(float)
main.java.controlp5.Matrix : Matrix stop()
main.java.controlp5.Matrix : Matrix trigger(int)
main.java.controlp5.Matrix : Matrix update()
main.java.controlp5.Matrix : boolean get(int, int)
main.java.controlp5.Matrix : boolean isPlaying()
main.java.controlp5.Matrix : int getInterval()
main.java.controlp5.Matrix : int getMode()
main.java.controlp5.Matrix : int[][] getCells()
main.java.controlp5.Matrix : void remove()
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:14

*/


