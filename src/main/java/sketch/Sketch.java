package main.java.sketch;


import main.java.controlp5.Button;
import main.java.controlp5.ControlP5;
import main.java.controlp5.MultilineTextfield;
import processing.core.PApplet;

public class Sketch extends PApplet {

    static public void main (String[] args){

        PApplet.main("main.java.sketch.Sketch");
    }

    ControlP5 cp5;
    public void settings(){
        size(500,500);
    }
    public void setup(){
        cp5 = new ControlP5(this);

        Button b = new Button(cp5,"").setSize(100,100);
        MultilineTextfield ml = new MultilineTextfield(cp5,"mlt");


    }

    public void radioButton(int index) {

    }
    public void draw(){

    }
}
