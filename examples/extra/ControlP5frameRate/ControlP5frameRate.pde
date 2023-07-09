/**
 * ControlP5 FrameRate
 *
 *
 * uses a textlabel to display the current or average 
 * framerate of the sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */


import controlP5.*;

ControlP5 cp5;

void setup() {
  size(400,500);
  frameRate(60);
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10);
  
}

void draw() {
  background(129);
}

/*
a list of all methods available for the FrameRate Controller
use ControlP5.printPublicMethodsFor(FrameRate.class);
to print the following list into the console.

You can find further details about class FrameRate in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : ControlBehavior getBehavior()
main.java.controlp5.Controller : ControlWindow getControlWindow()
main.java.controlp5.Controller : ControlWindow getWindow()
main.java.controlp5.Controller : ControllerProperty getProperty(String)
main.java.controlp5.Controller : ControllerProperty getProperty(String, String)
main.java.controlp5.Controller : ControllerView getView()
main.java.controlp5.Controller : FrameRate addCallback(CallbackListener)
main.java.controlp5.Controller : FrameRate addListener(ControlListener)
main.java.controlp5.Controller : FrameRate addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : FrameRate align(int, int, int, int)
main.java.controlp5.Controller : FrameRate bringToFront()
main.java.controlp5.Controller : FrameRate bringToFront(ControllerInterface)
main.java.controlp5.Controller : FrameRate hide()
main.java.controlp5.Controller : FrameRate linebreak()
main.java.controlp5.Controller : FrameRate listen(boolean)
main.java.controlp5.Controller : FrameRate lock()
main.java.controlp5.Controller : FrameRate onChange(CallbackListener)
main.java.controlp5.Controller : FrameRate onClick(CallbackListener)
main.java.controlp5.Controller : FrameRate onDoublePress(CallbackListener)
main.java.controlp5.Controller : FrameRate onDrag(CallbackListener)
main.java.controlp5.Controller : FrameRate onDraw(ControllerView)
main.java.controlp5.Controller : FrameRate onEndDrag(CallbackListener)
main.java.controlp5.Controller : FrameRate onEnter(CallbackListener)
main.java.controlp5.Controller : FrameRate onLeave(CallbackListener)
main.java.controlp5.Controller : FrameRate onMove(CallbackListener)
main.java.controlp5.Controller : FrameRate onPress(CallbackListener)
main.java.controlp5.Controller : FrameRate onRelease(CallbackListener)
main.java.controlp5.Controller : FrameRate onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : FrameRate onStartDrag(CallbackListener)
main.java.controlp5.Controller : FrameRate onWheel(CallbackListener)
main.java.controlp5.Controller : FrameRate plugTo(Object)
main.java.controlp5.Controller : FrameRate plugTo(Object, String)
main.java.controlp5.Controller : FrameRate plugTo(Object[])
main.java.controlp5.Controller : FrameRate plugTo(Object[], String)
main.java.controlp5.Controller : FrameRate registerProperty(String)
main.java.controlp5.Controller : FrameRate registerProperty(String, String)
main.java.controlp5.Controller : FrameRate registerTooltip(String)
main.java.controlp5.Controller : FrameRate removeBehavior()
main.java.controlp5.Controller : FrameRate removeCallback()
main.java.controlp5.Controller : FrameRate removeCallback(CallbackListener)
main.java.controlp5.Controller : FrameRate removeListener(ControlListener)
main.java.controlp5.Controller : FrameRate removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : FrameRate removeListenersFor(int)
main.java.controlp5.Controller : FrameRate removeProperty(String)
main.java.controlp5.Controller : FrameRate removeProperty(String, String)
main.java.controlp5.Controller : FrameRate setArrayValue(float[])
main.java.controlp5.Controller : FrameRate setArrayValue(int, float)
main.java.controlp5.Controller : FrameRate setBehavior(ControlBehavior)
main.java.controlp5.Controller : FrameRate setBroadcast(boolean)
main.java.controlp5.Controller : FrameRate setCaptionLabel(String)
main.java.controlp5.Controller : FrameRate setColor(CColor)
main.java.controlp5.Controller : FrameRate setColorActive(int)
main.java.controlp5.Controller : FrameRate setColorBackground(int)
main.java.controlp5.Controller : FrameRate setColorCaptionLabel(int)
main.java.controlp5.Controller : FrameRate setColorForeground(int)
main.java.controlp5.Controller : FrameRate setColorLabel(int)
main.java.controlp5.Controller : FrameRate setColorValue(int)
main.java.controlp5.Controller : FrameRate setColorValueLabel(int)
main.java.controlp5.Controller : FrameRate setDecimalPrecision(int)
main.java.controlp5.Controller : FrameRate setDefaultValue(float)
main.java.controlp5.Controller : FrameRate setHeight(int)
main.java.controlp5.Controller : FrameRate setId(int)
main.java.controlp5.Controller : FrameRate setImage(PImage)
main.java.controlp5.Controller : FrameRate setImage(PImage, int)
main.java.controlp5.Controller : FrameRate setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : FrameRate setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : FrameRate setLabel(String)
main.java.controlp5.Controller : FrameRate setLabelVisible(boolean)
main.java.controlp5.Controller : FrameRate setLock(boolean)
main.java.controlp5.Controller : FrameRate setMax(float)
main.java.controlp5.Controller : FrameRate setMin(float)
main.java.controlp5.Controller : FrameRate setMouseOver(boolean)
main.java.controlp5.Controller : FrameRate setMoveable(boolean)
main.java.controlp5.Controller : FrameRate setPosition(float, float)
main.java.controlp5.Controller : FrameRate setPosition(float[])
main.java.controlp5.Controller : FrameRate setSize(PImage)
main.java.controlp5.Controller : FrameRate setSize(int, int)
main.java.controlp5.Controller : FrameRate setStringValue(String)
main.java.controlp5.Controller : FrameRate setUpdate(boolean)
main.java.controlp5.Controller : FrameRate setValue(float)
main.java.controlp5.Controller : FrameRate setValueLabel(String)
main.java.controlp5.Controller : FrameRate setValueSelf(float)
main.java.controlp5.Controller : FrameRate setView(ControllerView)
main.java.controlp5.Controller : FrameRate setVisible(boolean)
main.java.controlp5.Controller : FrameRate setWidth(int)
main.java.controlp5.Controller : FrameRate show()
main.java.controlp5.Controller : FrameRate unlock()
main.java.controlp5.Controller : FrameRate unplugFrom(Object)
main.java.controlp5.Controller : FrameRate unplugFrom(Object[])
main.java.controlp5.Controller : FrameRate unregisterTooltip()
main.java.controlp5.Controller : FrameRate update()
main.java.controlp5.Controller : FrameRate updateSize()
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
main.java.controlp5.FrameRate : FrameRate setInterval(int)
main.java.controlp5.FrameRate : void draw(PGraphics)
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

created: 2015/03/24 12:22:02

*/


