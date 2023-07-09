/**
* ControlP5 Textlabel
*
*
* find a list of public methods available for the Textlabel Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;

Textlabel myTextlabelA;
Textlabel myTextlabelB;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  
  myTextlabelA = cp5.addTextlabel("label")
                    .setText("A single ControlP5 textlabel, in yellow.")
                    .setPosition(100,50)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",20))
                    ;
                    
  myTextlabelB = new Textlabel(cp5,"Another textlabel, not created through ControlP5 needs to be rendered separately by calling Textlabel.draw(PApplet).",100,100,400,200);

}



void draw() {
  background(0);
  myTextlabelB.draw(this); 
}



/*
a list of all methods available for the Textlabel Controller
use ControlP5.printPublicMethodsFor(Textlabel.class);
to print the following list into the console.

You can find further details about class Textlabel in the javadoc.

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
main.java.controlp5.Controller : Pointer getPointer()
main.java.controlp5.Controller : String getAddress()
main.java.controlp5.Controller : String getInfo()
main.java.controlp5.Controller : String getName()
main.java.controlp5.Controller : String getStringValue()
main.java.controlp5.Controller : String toString()
main.java.controlp5.Controller : Tab getTab()
main.java.controlp5.Controller : Textlabel addCallback(CallbackListener)
main.java.controlp5.Controller : Textlabel addListener(ControlListener)
main.java.controlp5.Controller : Textlabel addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Textlabel align(int, int, int, int)
main.java.controlp5.Controller : Textlabel bringToFront()
main.java.controlp5.Controller : Textlabel bringToFront(ControllerInterface)
main.java.controlp5.Controller : Textlabel hide()
main.java.controlp5.Controller : Textlabel linebreak()
main.java.controlp5.Controller : Textlabel listen(boolean)
main.java.controlp5.Controller : Textlabel lock()
main.java.controlp5.Controller : Textlabel onChange(CallbackListener)
main.java.controlp5.Controller : Textlabel onClick(CallbackListener)
main.java.controlp5.Controller : Textlabel onDoublePress(CallbackListener)
main.java.controlp5.Controller : Textlabel onDrag(CallbackListener)
main.java.controlp5.Controller : Textlabel onDraw(ControllerView)
main.java.controlp5.Controller : Textlabel onEndDrag(CallbackListener)
main.java.controlp5.Controller : Textlabel onEnter(CallbackListener)
main.java.controlp5.Controller : Textlabel onLeave(CallbackListener)
main.java.controlp5.Controller : Textlabel onMove(CallbackListener)
main.java.controlp5.Controller : Textlabel onPress(CallbackListener)
main.java.controlp5.Controller : Textlabel onRelease(CallbackListener)
main.java.controlp5.Controller : Textlabel onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Textlabel onStartDrag(CallbackListener)
main.java.controlp5.Controller : Textlabel onWheel(CallbackListener)
main.java.controlp5.Controller : Textlabel plugTo(Object)
main.java.controlp5.Controller : Textlabel plugTo(Object, String)
main.java.controlp5.Controller : Textlabel plugTo(Object[])
main.java.controlp5.Controller : Textlabel plugTo(Object[], String)
main.java.controlp5.Controller : Textlabel registerProperty(String)
main.java.controlp5.Controller : Textlabel registerProperty(String, String)
main.java.controlp5.Controller : Textlabel registerTooltip(String)
main.java.controlp5.Controller : Textlabel removeBehavior()
main.java.controlp5.Controller : Textlabel removeCallback()
main.java.controlp5.Controller : Textlabel removeCallback(CallbackListener)
main.java.controlp5.Controller : Textlabel removeListener(ControlListener)
main.java.controlp5.Controller : Textlabel removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Textlabel removeListenersFor(int)
main.java.controlp5.Controller : Textlabel removeProperty(String)
main.java.controlp5.Controller : Textlabel removeProperty(String, String)
main.java.controlp5.Controller : Textlabel setArrayValue(float[])
main.java.controlp5.Controller : Textlabel setArrayValue(int, float)
main.java.controlp5.Controller : Textlabel setBehavior(ControlBehavior)
main.java.controlp5.Controller : Textlabel setBroadcast(boolean)
main.java.controlp5.Controller : Textlabel setCaptionLabel(String)
main.java.controlp5.Controller : Textlabel setColor(CColor)
main.java.controlp5.Controller : Textlabel setColorActive(int)
main.java.controlp5.Controller : Textlabel setColorBackground(int)
main.java.controlp5.Controller : Textlabel setColorCaptionLabel(int)
main.java.controlp5.Controller : Textlabel setColorForeground(int)
main.java.controlp5.Controller : Textlabel setColorLabel(int)
main.java.controlp5.Controller : Textlabel setColorValue(int)
main.java.controlp5.Controller : Textlabel setColorValueLabel(int)
main.java.controlp5.Controller : Textlabel setDecimalPrecision(int)
main.java.controlp5.Controller : Textlabel setDefaultValue(float)
main.java.controlp5.Controller : Textlabel setHeight(int)
main.java.controlp5.Controller : Textlabel setId(int)
main.java.controlp5.Controller : Textlabel setImage(PImage)
main.java.controlp5.Controller : Textlabel setImage(PImage, int)
main.java.controlp5.Controller : Textlabel setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Textlabel setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Textlabel setLabel(String)
main.java.controlp5.Controller : Textlabel setLabelVisible(boolean)
main.java.controlp5.Controller : Textlabel setLock(boolean)
main.java.controlp5.Controller : Textlabel setMax(float)
main.java.controlp5.Controller : Textlabel setMin(float)
main.java.controlp5.Controller : Textlabel setMouseOver(boolean)
main.java.controlp5.Controller : Textlabel setMoveable(boolean)
main.java.controlp5.Controller : Textlabel setPosition(float, float)
main.java.controlp5.Controller : Textlabel setPosition(float[])
main.java.controlp5.Controller : Textlabel setSize(PImage)
main.java.controlp5.Controller : Textlabel setSize(int, int)
main.java.controlp5.Controller : Textlabel setStringValue(String)
main.java.controlp5.Controller : Textlabel setUpdate(boolean)
main.java.controlp5.Controller : Textlabel setValue(float)
main.java.controlp5.Controller : Textlabel setValueLabel(String)
main.java.controlp5.Controller : Textlabel setValueSelf(float)
main.java.controlp5.Controller : Textlabel setView(ControllerView)
main.java.controlp5.Controller : Textlabel setVisible(boolean)
main.java.controlp5.Controller : Textlabel setWidth(int)
main.java.controlp5.Controller : Textlabel show()
main.java.controlp5.Controller : Textlabel unlock()
main.java.controlp5.Controller : Textlabel unplugFrom(Object)
main.java.controlp5.Controller : Textlabel unplugFrom(Object[])
main.java.controlp5.Controller : Textlabel unregisterTooltip()
main.java.controlp5.Controller : Textlabel update()
main.java.controlp5.Controller : Textlabel updateSize()
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
main.java.controlp5.Textlabel : ControllerStyle getStyle()
main.java.controlp5.Textlabel : Label get()
main.java.controlp5.Textlabel : Textlabel append(String, int)
main.java.controlp5.Textlabel : Textlabel setColor(int)
main.java.controlp5.Textlabel : Textlabel setFont(ControlFont)
main.java.controlp5.Textlabel : Textlabel setFont(PFont)
main.java.controlp5.Textlabel : Textlabel setHeight(int)
main.java.controlp5.Textlabel : Textlabel setLetterSpacing(int)
main.java.controlp5.Textlabel : Textlabel setLineHeight(int)
main.java.controlp5.Textlabel : Textlabel setMultiline(boolean)
main.java.controlp5.Textlabel : Textlabel setStringValue(String)
main.java.controlp5.Textlabel : Textlabel setText(String)
main.java.controlp5.Textlabel : Textlabel setValue(String)
main.java.controlp5.Textlabel : Textlabel setValue(float)
main.java.controlp5.Textlabel : Textlabel setWidth(int)
main.java.controlp5.Textlabel : int getLineHeight()
main.java.controlp5.Textlabel : void draw()
main.java.controlp5.Textlabel : void draw(PApplet)
main.java.controlp5.Textlabel : void draw(PGraphics)
main.java.controlp5.Textlabel : void draw(int, int)
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:33

*/


