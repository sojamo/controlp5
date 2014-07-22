/**
 * ControlP5 ButtonBar
 * 
 * work-in-progress
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 *
 */
 

import controlP5.*;

ControlP5 cp5;


void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(400, 20)
     .addItems(split("a b c d e f g h i j"," "))
     ;
     println(b.getItem("a"));
  b.changeItem("a","text","first");
  b.changeItem("b","text","second");
  b.changeItem("c","text","third");
  b.onMove(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar bar = (ButtonBar)ev.getController();
      println("hello ",bar.hover());
    }
  });
}

void bar(int n) {
  println("bar clicked, item-value:", n);
}

void draw() {
  background(220);
}

