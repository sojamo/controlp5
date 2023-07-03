package sketch;

import controlP5.ControlEvent;
import controlP5.ControlP5;
import controlP5.RadioButton;
import controlP5.TextfieldMultiline;
import processing.core.PApplet;

public class Sketch extends PApplet {

    static public void main (String[] args){

        PApplet.main("sketch.Sketch");
    }

    ControlP5 cp5;
    public void settings(){
        size(500,500);
    }
    public void setup(){
        cp5 = new ControlP5(this);

        RadioButton b = new RadioButton(cp5,"radioButton")
                .setPosition(100,100)
                .setSize(40,20)
                .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
                .setItemsPerRow(3)
                .setSpacingColumn(50)
                .addItem("foo",1)
                .addItem("bar",2)
                .addItem("baz",3)
                .activate(0)
                ;

        b.plugTo(this,"radioButton");


    }

    public void radioButton(int index) {

    }
    public void draw(){

    }
}
