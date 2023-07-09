/**
* ControlP5 ControlP5chartsCombined
*
* find a list of public methods available for the Chart Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/


import controlP5.*;

ControlP5 cp5;

Chart myChart;

void setup() {
  size(400, 700);
  smooth();
  cp5 = new ControlP5(this);
  cp5.printPublicMethodsFor(Chart.class);
  myChart = cp5.addChart("hello")
               .setPosition(50, 50)
               .setSize(200, 200)
               .setRange(-20, 20)
               .setView(Chart.BAR) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               ;

  myChart.getColor().setBackground(color(255, 100));


  myChart.addDataSet("world");
  myChart.setColors("world", color(255,0,255),color(255,0,0));
  myChart.setData("world", new float[4]);

  myChart.setStrokeWeight(1.5);

  myChart.addDataSet("earth");
  myChart.setColors("earth", color(255), color(0, 255, 0));
  myChart.updateData("earth", 1, 2, 10, 3);

}


void draw() {
  background(0);
  // unshift: add data from left to right (first in)
  myChart.unshift("world", (sin(frameCount*0.01)*10));
  
  // push: add data from right to left (last in)
  myChart.push("earth", (sin(frameCount*0.1)*10));
}







/*
a list of all methods available for the Chart Controller
use ControlP5.printPublicMethodsFor(Chart.class);
to print the following list into the console.

You can find further details about class Chart in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


main.java.controlp5.Chart : Chart addData(ChartData)
main.java.controlp5.Chart : Chart addData(ChartDataSet, float)
main.java.controlp5.Chart : Chart addData(String, ChartData)
main.java.controlp5.Chart : Chart addData(String, float)
main.java.controlp5.Chart : Chart addData(float)
main.java.controlp5.Chart : Chart addDataSet(String)
main.java.controlp5.Chart : Chart addFirst(String, float)
main.java.controlp5.Chart : Chart addFirst(float)
main.java.controlp5.Chart : Chart addLast(String, float)
main.java.controlp5.Chart : Chart addLast(float)
main.java.controlp5.Chart : Chart push(String, float)
main.java.controlp5.Chart : Chart push(float)
main.java.controlp5.Chart : Chart removeData(ChartData)
main.java.controlp5.Chart : Chart removeData(String, ChartData)
main.java.controlp5.Chart : Chart removeData(String, int)
main.java.controlp5.Chart : Chart removeData(int)
main.java.controlp5.Chart : Chart removeDataSet(String)
main.java.controlp5.Chart : Chart removeFirst()
main.java.controlp5.Chart : Chart removeFirst(String)
main.java.controlp5.Chart : Chart removeLast()
main.java.controlp5.Chart : Chart removeLast(String)
main.java.controlp5.Chart : Chart setData(String, int, ChartData)
main.java.controlp5.Chart : Chart setData(int, ChartData)
main.java.controlp5.Chart : Chart setDataSet(ChartDataSet)
main.java.controlp5.Chart : Chart setDataSet(String, ChartDataSet)
main.java.controlp5.Chart : Chart setRange(float, float)
main.java.controlp5.Chart : Chart setResolution(int)
main.java.controlp5.Chart : Chart setStrokeWeight(float)
main.java.controlp5.Chart : Chart setValue(float)
main.java.controlp5.Chart : Chart setView(int)
main.java.controlp5.Chart : Chart unshift(String, float)
main.java.controlp5.Chart : Chart unshift(float)
main.java.controlp5.Chart : ChartData getData(String, int)
main.java.controlp5.Chart : ChartDataSet getDataSet(String)
main.java.controlp5.Chart : LinkedHashMap getDataSet()
main.java.controlp5.Chart : String getInfo()
main.java.controlp5.Chart : String toString()
main.java.controlp5.Chart : float getStrokeWeight()
main.java.controlp5.Chart : float[] getValuesFrom(String)
main.java.controlp5.Chart : int getResolution()
main.java.controlp5.Chart : int size()
main.java.controlp5.Chart : void onEnter()
main.java.controlp5.Chart : void onLeave()
main.java.controlp5.Controller : CColor getColor()
main.java.controlp5.Controller : Chart addCallback(CallbackListener)
main.java.controlp5.Controller : Chart addListener(ControlListener)
main.java.controlp5.Controller : Chart addListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Chart align(int, int, int, int)
main.java.controlp5.Controller : Chart bringToFront()
main.java.controlp5.Controller : Chart bringToFront(ControllerInterface)
main.java.controlp5.Controller : Chart hide()
main.java.controlp5.Controller : Chart linebreak()
main.java.controlp5.Controller : Chart listen(boolean)
main.java.controlp5.Controller : Chart lock()
main.java.controlp5.Controller : Chart onChange(CallbackListener)
main.java.controlp5.Controller : Chart onClick(CallbackListener)
main.java.controlp5.Controller : Chart onDoublePress(CallbackListener)
main.java.controlp5.Controller : Chart onDrag(CallbackListener)
main.java.controlp5.Controller : Chart onDraw(ControllerView)
main.java.controlp5.Controller : Chart onEndDrag(CallbackListener)
main.java.controlp5.Controller : Chart onEnter(CallbackListener)
main.java.controlp5.Controller : Chart onLeave(CallbackListener)
main.java.controlp5.Controller : Chart onMove(CallbackListener)
main.java.controlp5.Controller : Chart onPress(CallbackListener)
main.java.controlp5.Controller : Chart onRelease(CallbackListener)
main.java.controlp5.Controller : Chart onReleaseOutside(CallbackListener)
main.java.controlp5.Controller : Chart onStartDrag(CallbackListener)
main.java.controlp5.Controller : Chart onWheel(CallbackListener)
main.java.controlp5.Controller : Chart plugTo(Object)
main.java.controlp5.Controller : Chart plugTo(Object, String)
main.java.controlp5.Controller : Chart plugTo(Object[])
main.java.controlp5.Controller : Chart plugTo(Object[], String)
main.java.controlp5.Controller : Chart registerProperty(String)
main.java.controlp5.Controller : Chart registerProperty(String, String)
main.java.controlp5.Controller : Chart registerTooltip(String)
main.java.controlp5.Controller : Chart removeBehavior()
main.java.controlp5.Controller : Chart removeCallback()
main.java.controlp5.Controller : Chart removeCallback(CallbackListener)
main.java.controlp5.Controller : Chart removeListener(ControlListener)
main.java.controlp5.Controller : Chart removeListenerFor(int, CallbackListener)
main.java.controlp5.Controller : Chart removeListenersFor(int)
main.java.controlp5.Controller : Chart removeProperty(String)
main.java.controlp5.Controller : Chart removeProperty(String, String)
main.java.controlp5.Controller : Chart setArrayValue(float[])
main.java.controlp5.Controller : Chart setArrayValue(int, float)
main.java.controlp5.Controller : Chart setBehavior(ControlBehavior)
main.java.controlp5.Controller : Chart setBroadcast(boolean)
main.java.controlp5.Controller : Chart setCaptionLabel(String)
main.java.controlp5.Controller : Chart setColor(CColor)
main.java.controlp5.Controller : Chart setColorActive(int)
main.java.controlp5.Controller : Chart setColorBackground(int)
main.java.controlp5.Controller : Chart setColorCaptionLabel(int)
main.java.controlp5.Controller : Chart setColorForeground(int)
main.java.controlp5.Controller : Chart setColorLabel(int)
main.java.controlp5.Controller : Chart setColorValue(int)
main.java.controlp5.Controller : Chart setColorValueLabel(int)
main.java.controlp5.Controller : Chart setDecimalPrecision(int)
main.java.controlp5.Controller : Chart setDefaultValue(float)
main.java.controlp5.Controller : Chart setHeight(int)
main.java.controlp5.Controller : Chart setId(int)
main.java.controlp5.Controller : Chart setImage(PImage)
main.java.controlp5.Controller : Chart setImage(PImage, int)
main.java.controlp5.Controller : Chart setImages(PImage, PImage, PImage)
main.java.controlp5.Controller : Chart setImages(PImage, PImage, PImage, PImage)
main.java.controlp5.Controller : Chart setLabel(String)
main.java.controlp5.Controller : Chart setLabelVisible(boolean)
main.java.controlp5.Controller : Chart setLock(boolean)
main.java.controlp5.Controller : Chart setMax(float)
main.java.controlp5.Controller : Chart setMin(float)
main.java.controlp5.Controller : Chart setMouseOver(boolean)
main.java.controlp5.Controller : Chart setMoveable(boolean)
main.java.controlp5.Controller : Chart setPosition(float, float)
main.java.controlp5.Controller : Chart setPosition(float[])
main.java.controlp5.Controller : Chart setSize(PImage)
main.java.controlp5.Controller : Chart setSize(int, int)
main.java.controlp5.Controller : Chart setStringValue(String)
main.java.controlp5.Controller : Chart setUpdate(boolean)
main.java.controlp5.Controller : Chart setValue(float)
main.java.controlp5.Controller : Chart setValueLabel(String)
main.java.controlp5.Controller : Chart setValueSelf(float)
main.java.controlp5.Controller : Chart setView(ControllerView)
main.java.controlp5.Controller : Chart setVisible(boolean)
main.java.controlp5.Controller : Chart setWidth(int)
main.java.controlp5.Controller : Chart show()
main.java.controlp5.Controller : Chart unlock()
main.java.controlp5.Controller : Chart unplugFrom(Object)
main.java.controlp5.Controller : Chart unplugFrom(Object[])
main.java.controlp5.Controller : Chart unregisterTooltip()
main.java.controlp5.Controller : Chart update()
main.java.controlp5.Controller : Chart updateSize()
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
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2014/08/16 19:11:34

*/


