package sketch;

import controlP5.ControlP5;
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
        TextfieldMultiline commandTextfield = new TextfieldMultiline(cp5, "commandTextfield");
        commandTextfield.setPosition(0, 0)
                .setSize(200, 50)
                // .setFont(mainFont)
                .setColor(color(255))
                .setColorForeground(color(255, 100))
                .setText("");

        //cp5.addToggle(commandTextfield,"commandTextfield");
    }
    public void draw(){

    }
}
