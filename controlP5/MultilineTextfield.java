package main.java.src2.main.java.controlP5.controlP5;

import processing.event.KeyEvent;

public class MultilineTextfield extends Textfield {

    public MultilineTextfield(ControlP5 theControlP5, String theName) {
        super(theControlP5, theName);
    }

    @Override
    public void keyEvent(KeyEvent theKeyEvent) {
        if (isUserInteraction && isTexfieldActive && isActive && theKeyEvent.getAction() == KeyEvent.PRESS) {
            if (ignorelist.contains(cp5.getKeyCode())) {
                return;
            }
            if (cp5.getKeyCode() == ENTER) {
                // Append a new line character to the text buffer
                _myTextBuffer.insert(_myTextBufferIndex, '\n');
                setIndex(_myTextBufferIndex + 1);
            } else {
                super.keyEvent(theKeyEvent);
            }
        }
    }
}
