package main.java.src2.main.java.controlP5.controlP5;

/**
 * controlP5 is a processing gui library.
 * 
 * 2006-2015 by Andreas Schlegel
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA
 * 
 * @author Andreas Schlegel (http://www.sojamo.de)
 * @modified ##date##
 * @version ##version##
 * 
 */

import processing.core.PApplet;

/**
 * Constant variables used with ControlP5 are stored here.
 */
public interface ControlP5Constants {

	String eventMethod = "controlEvent";
	boolean VERBOSE = false;
	float PI = ( float ) Math.PI;
	float TWO_PI = PI * 2;
	float HALF_PI = PI / 2;
	int INVALID = -1;
	int METHOD = 0;
	int FIELD = 1;
	int EVENT = 2;
	int INTEGER = 1;
	int FLOAT = 2;
	int BOOLEAN = 3;
	int STRING = 4;
	int ARRAY = 5;
	int BITFONT = 100;
	Class< ? >[] acceptClassList = { int.class , float.class , boolean.class , String.class };
	Class< ? > controlEventClass = ControlEvent.class;
	int UP = PApplet.UP; // KeyEvent.VK_UP;
	int DOWN = PApplet.DOWN; // KeyEvent.VK_DOWN;
	int LEFT = PApplet.LEFT; // KeyEvent.VK_LEFT;
	int RIGHT = PApplet.RIGHT; // KeyEvent.VK_RIGHT;
	int SHIFT = PApplet.SHIFT; // KeyEvent.VK_SHIFT;
	int DELETE = PApplet.DELETE; // KeyEvent.VK_DELETE;
	int BACKSPACE = PApplet.BACKSPACE; // KeyEvent.VK_BACK_SPACE;
	int ENTER = PApplet.ENTER; // KeyEvent.VK_ENTER;
	int ESCAPE = PApplet.ESC; // KeyEvent.VK_ESCAPE;
	int ALT = PApplet.ALT; // KeyEvent.VK_ALT;
	int CONTROL = PApplet.CONTROL;// KeyEvent.VK_CONTROL;
	int COMMANDKEY = 157; // Event.VK_META;
	int TAB = PApplet.TAB; // KeyEvent.VK_TAB;
	char INCREASE = PApplet.UP;
	char DECREASE = PApplet.DOWN;
	char SWITCH_FORE = PApplet.LEFT;
	char SWITCH_BACK = PApplet.RIGHT;
	char SAVE = 'S';
	char RESET = 'R';
	char PRINT = ' ';
	char HIDE = 'H';
	char LOAD = 'L';
	char MENU = 'M';
	char KEYCONTROL = 'K';
	int TOP = 101; // PApplet.TOP
	int BOTTOM = 102; // PApplet.BOTTOM
	int CENTER = 3; // PApplet.CENTER
	int BASELINE = 0; // PApplet.BASELINE
	int HORIZONTAL = 0;
	int VERTICAL = 1;
	int DEFAULT = 0;
	int OVER = 1;
	int ACTIVE = 2;
	int HIGHLIGHT = 3;
	int IMAGE = 1;
	int SPRITE = 2;
	int CUSTOM = 3;
	int SWITCH = 100;
	int MOVE = 0;
	int RELEASE = 2;
	int RELEASED = 2;
	int PRESSED = 1;
	int PRESS = 1;
	int LINE = 1;
	int ELLIPSE = 2;
	int ARC = 3;
	int INACTIVE = 0;
	int WAIT = 1;
	int TRANSITION_WAIT_FADEIN = 2;
	int FADEIN = 3;
	int IDLE = 4;
	int FADEOUT = 5;
	int DONE = 6;
	int SINGLE_COLUMN = 0;
	int SINGLE_ROW = 1;
	int MULTIPLES = 2;
	int LIST = 0;
	int DROPDOWN = 1;
	int CHECKBOX = 2; /* TODO */
	int TREE = 3; /* TODO */

	@Deprecated
	int ACTION_PRESSED = 1; // MouseEvent.PRESS
	int ACTION_PRESS = 1; // MouseEvent.PRESS

	@Deprecated
	int ACTION_RELEASED = 2; // MouseEvent.RELEASE
	int ACTION_RELEASE = 2; // MouseEvent.RELEASE

	int ACTION_CLICK = 3; // MouseEvent.CLICK
	int ACTION_DRAG = 4; // MouseEvent.DRAG
	int ACTION_MOVE = 5; // MouseEvent.MOVE
	int ACTION_ENTER = 6; // MouseEvent.ENTER
	int ACTION_LEAVE = 7; // MouseEvent.EXIT
	int ACTION_EXIT = 7; // MouseEvent.EXIT
	int ACTION_WHEEL = 8; // MouseEvent.WHEEL
	@Deprecated
	int ACTION_RELEASEDOUTSIDE = 9;
	int ACTION_RELEASE_OUTSIDE = 9;
	int ACTION_START_DRAG = 10;
	int ACTION_END_DRAG = 11;
	int ACTION_DOUBLE_PRESS = 12;
	int ACTION_BROADCAST = 100;
	int LEFT_OUTSIDE = 10;
	int RIGHT_OUTSIDE = 11;
	int TOP_OUTSIDE = 12;
	int BOTTOM_OUTSIDE = 13;
	int CAPTIONLABEL = 0;
	int VALUELABEL = 1;
	int SINGLE = 0;

	@Deprecated
	int ALL = 1;
	int MULTI = 1;

	/* http://clrs.cc/ */
	int NAVY = 0xFF001F3F;
	int BLUE = 0xFF0074D9;
	int AQUA = 0xFF7FDBFF;
	int TEAL = 0xFF39CCCC;
	int OLIVE = 0xFF3D9970;
	int GREEN = 0xFF2ECC40;
	int LIME = 0xFF01FF70;
	int YELLOW = 0xFFFFDC00;
	int ORANGE = 0xFFFF851B;
	int RED = 0xFFFF4136;
	int MAROON = 0xFF85144B;
	int FUCHSIA = 0xFFF012BE;
	int PURPLE = 0xFFB10DC9;
	int WHITE = 0xFFFFFFFF;
	int SILVER = 0xFFDDDDDD;
	int GRAY = 0xFFAAAAAA;
	int BLACK = 0xFF111111;

	
	/*fg, bg, active, caption, value ) */
	CColor THEME_RETRO = new CColor( 0xff00698c , 0xff003652 , 0xff08a2cf , 0xffffffff , 0xffffffff );
	CColor THEME_CP52014 = new CColor( 0xff0074D9 , 0xff002D5A, 0xff00aaff , 0xffffffff , 0xffffffff );
	CColor THEME_CP5BLUE = new CColor( 0xff016c9e , 0xff02344d , 0xff00b4ea , 0xffffffff , 0xffffffff );
	CColor THEME_RED = new CColor( 0xffaa0000 , 0xff660000 , 0xffff0000 , 0xffffffff , 0xffffffff );
	CColor THEME_GREY = new CColor( 0xffeeeeee, 0xffbbbbbb , 0xffffffff , 0xff555555 , 0xff555555 );
	CColor THEME_A = new CColor( 0xff00FFC8 , 0xff00D7FF , 0xffffff00 , 0xff00B0FF , 0xff00B0FF );

	// other colors: #ff3838 red-salmon; #08ffb4 turquoise; #40afff light-blue; #f3eddb beige; 
	
	int standard58 = 0;
	int standard56 = 1;
	int synt24 = 2;
	int grixel = 3;
	int J2D = 1;
	int P2D = 2;
	int P3D = 3;

	String JSON = "JSON";
	String SERIALIZED = "SERIALIZED";
	
	String delimiter = " ";
	String pathdelimiter = "/";
	
}
