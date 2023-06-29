package controlP5;

import processing.core.PApplet;
import processing.core.PGraphics;

import java.util.ArrayList;

import controlP5.ControlEvent;
import controlP5.ControlFont;
import controlP5.ControlListener;
import controlP5.ControlP5;
import controlP5.Slider;
import controlP5.Textfield;

/**
 * a textarea can be used to leave notes, it uses the controlP5 BitFont to
 * render text. Scrollbars
 * will automatically be added when text extends the visible area. Textarea
 * extends ControllerGroup,
 * for more methods available see the ControllerGroup documentation.
 *
 * @example controllers/ControlP5textarea
 */

public class TextfieldMultiline extends Textfield implements ControlListener {

	public boolean isScrollbarVisible = false;
	protected Slider _myScrollbar;

	public int _myWidth = 300;
	protected int _myTextBufferRowIndex = 0;
	protected int _myTextBufferColumnIndex = 0;

	private ArrayList<StringBuffer> _myTextBuffer = new ArrayList<StringBuffer>();

	public TextfieldMultiline(ControlP5 theControlP5, String theName) {
		super(theControlP5, theName);
		_myValueLabel.setLabeltype(_myValueLabel.new MultilineLabel());
		_myTextBuffer = new ArrayList<>(_myTextBuffer);
		keyMapping.put(ENTER, new NewLine());
		keyMapping.put(DOWN, new MoveDown());
		keyMapping.put(UP, new MoveUp());
		keyMapping.put(LEFT, new MoveLeft());
		keyMapping.put(RIGHT, new MoveRight());
		keyMapping.put(DEFAULT, new InsertCharacter());
		keyMapping.put(BACKSPACE, new DeleteCharacter());
	}

	class InsertCharacter implements TextfieldCommand {

		public void execute() {

			if ((int) (cp5.getKey()) == 65535) {
				return;
			}

			if (_myInputFilter.apply(cp5.getKey())) {

				_myTextBuffer.get(_myTextBufferRowIndex).insert(_myTextBufferColumnIndex, (char) cp5.getKey());
				_myTextBufferColumnIndex += 1;

			}
		}
	}

	class DeleteCharacter implements TextfieldCommand {
		public void execute() {
			if (_myTextBufferColumnIndex > 0) {
				_myTextBuffer.get(_myTextBufferRowIndex).deleteCharAt(_myTextBufferColumnIndex - 1);
				_myTextBufferColumnIndex -= 1;
			}
		}
	}

	class NewLine implements TextfieldCommand {
		public void execute() {
			_myTextBuffer.add(_myTextBufferRowIndex + 1, new StringBuffer());
			_myTextBufferRowIndex += 1;
			_myTextBufferColumnIndex = 0;
		}
	}

	class MoveDown implements TextfieldCommand {
		public void execute() {
			// if not at the last line
			if (_myTextBufferRowIndex < _myTextBuffer.size() - 1) {
				// if the next line is shorter than the current line
				// set cursor to the end of the next line
				if (_myTextBuffer.get(_myTextBufferRowIndex + 1).length() < _myTextBufferColumnIndex) {
					_myTextBufferColumnIndex = _myTextBuffer.get(_myTextBufferRowIndex + 1).length();
				}
				_myTextBufferRowIndex += 1;
			}
		}
	}

	class MoveUp implements TextfieldCommand {
		public void execute() {
			if (_myTextBufferRowIndex > 0) {
				// if the next line is shorter than the current line
				// set cursor to the end of the next line
				if (_myTextBuffer.get(_myTextBufferRowIndex - 1).length() < _myTextBufferColumnIndex) {
					_myTextBufferColumnIndex = _myTextBuffer.get(_myTextBufferRowIndex - 1).length();
				}
				_myTextBufferRowIndex -= 1;
			}

		}
	}

	class MoveLeft implements TextfieldCommand {
		public void execute() {
			// if not at the first char
			if(_myTextBufferColumnIndex > 0) {
				_myTextBufferColumnIndex -= 1;
			}// if at the first char of a line
			else if(_myTextBufferColumnIndex == 0 && _myTextBufferRowIndex > 0) {
				_myTextBufferRowIndex -= 1;
				_myTextBufferColumnIndex = _myTextBuffer.get(_myTextBufferRowIndex).length();
			}
		}
	}

	class MoveRight implements TextfieldCommand {
		public void execute() {
			if(_myTextBufferColumnIndex < _myTextBuffer.get(_myTextBufferRowIndex).length()) {
				_myTextBufferColumnIndex += 1;
			}else if (_myTextBufferColumnIndex == _myTextBuffer.get(_myTextBufferRowIndex).length() && _myTextBufferRowIndex < _myTextBuffer.size() - 1) {
				_myTextBufferRowIndex += 1;
				_myTextBufferColumnIndex = 0;
			}
		}
	}

	@Override
	public void controlEvent(ControlEvent theEvent) {

	}

	@Override
	public void draw(PGraphics theGraphics) {

		theGraphics.pushStyle();
		theGraphics.fill(color.getBackground());
		theGraphics.pushMatrix();
		theGraphics.translate(x(position), y(position));
		theGraphics.rect(0, 0, getWidth(), getHeight());
		theGraphics.noStroke();

		theGraphics.fill(_myColorCursor);
		theGraphics.pushMatrix();
		theGraphics.pushStyle();

		buffer.beginDraw();
		buffer.background(0, 0);
		final String text = getText();
		final int textWidth = ControlFont.getWidthFor(text.substring(0, _myTextBufferColumnIndex), _myValueLabel,buffer);
		final int dif = PApplet.max(textWidth - _myValueLabel.getWidth(), 0);
		final String thisLine = _myTextBuffer.get(_myTextBufferRowIndex).toString();
		final int _myTextBufferIndexPosition = ControlFont.getWidthFor(thisLine.substring(0, _myTextBufferColumnIndex),
				_myValueLabel, buffer);
		_myValueLabel.setText(text);
		_myValueLabel.draw(buffer, -dif, 0, this);
		buffer.noStroke();
		if (isTexfieldActive) {
			if (!cp5.papplet.keyPressed) {
				buffer.fill(_myColorCursor, PApplet.abs(PApplet.sin(cp5.papplet.frameCount * 0.05f)) * 255);
			} else {
				buffer.fill(_myColorCursor);
			}

			buffer.rect(PApplet.max(1, PApplet.min(_myTextBufferIndexPosition, _myValueLabel.getWidth() - 3)),
					(_myTextBufferRowIndex) * _myValueLabel.getLineHeight(), 1, 10);
		}
		buffer.endDraw();
		theGraphics.image(buffer, 0, 0);

		theGraphics.popStyle();
		theGraphics.popMatrix();

		theGraphics.fill(isTexfieldActive ? color.getActive() : color.getForeground());
		theGraphics.rect(0, 0, getWidth(), 1);
		theGraphics.rect(0, getHeight() - 1, getWidth(), 1);
		theGraphics.rect(-1, 0, 1, getHeight());
		theGraphics.rect(getWidth(), 0, 1, getHeight());
		_myCaptionLabel.draw(theGraphics, 0, 0, this);
		theGraphics.popMatrix();
		theGraphics.popStyle();
	}

	@Override
	public String getText() {
		StringBuilder sb = new StringBuilder();
		for (StringBuffer s : _myTextBuffer) {
			sb.append(s.toString() + "\n");
		}
		return sb.toString();
	}

	@Override
	public Textfield setValue(String theText) {
		_myTextBuffer = new ArrayList<StringBuffer>();

		// split theText into lines
		String[] lines = theText.split("\n");
		for (int i = 0; i < lines.length; i++) {
			_myTextBuffer.add(i, new StringBuffer(lines[i]));
		}

		return this;
	}

	public Textfield setText(String theText) {
		return setValue(theText);
	}

	public Textfield setIndex(int theColIndex, int theRowIndex) {
		_myTextBufferColumnIndex = theColIndex;
		_myTextBufferRowIndex = theRowIndex;
		return this;
	}

}