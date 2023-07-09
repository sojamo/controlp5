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
import processing.core.PFont;
import processing.core.PGraphics;
import processing.event.KeyEvent;

/**
 * 
 * The ControllerInterface is inherited by all ControllerGroup and Controller classes.
 * 
 */
public interface ControllerInterface< T > {

	@ControlP5.Invisible
    void init( );

	int getWidth( );

	int getHeight( );

	T setValue( float theValue );

	float getValue( );

	T setStringValue( String theValue );

	String getStringValue( );

	float[] getArrayValue( );

	float getArrayValue( int theIndex );

	T setArrayValue( int theIndex , float theValue );

	T setArrayValue( float[] theArray );

	int getId( );

	float[] getPosition( );

	@ControlP5.Invisible
    T setPosition(float theX , float theY );

	@ControlP5.Invisible
    T setPosition(float[] thePosition );

	float[] getAbsolutePosition( );

	T setAbsolutePosition( float[] thePosition );

	T updateAbsolutePosition( );

	ControllerInterface< ? > getParent( );

	T update( );

	T setUpdate( boolean theFlag );

	T bringToFront( );

	T bringToFront( ControllerInterface< ? > theController );

	boolean isUpdate( );

	@ControlP5.Invisible
    T updateEvents( );

	@ControlP5.Invisible
    void continuousUpdateEvents( );

	/**
	 * a method for putting input events like e.g. mouse or keyboard events and queries. this has
	 * been taken out of the draw method for better overwriting capability.
	 * 
	 * 
	 */
	@ControlP5.Invisible
    T updateInternalEvents(PApplet theApplet );

	@ControlP5.Invisible
    void draw(PGraphics theGraphics );

	T add( ControllerInterface< ? > theElement );

	T remove( ControllerInterface< ? > theElement );

	void remove( );

	String getName( );

	String getAddress( );

	ControlWindow getWindow( );

	Tab getTab( );

	boolean setMousePressed( boolean theStatus );

	@ControlP5.Invisible
    void keyEvent(KeyEvent theEvent );

	@ControlP5.Invisible
    T setAddress(String theAddress );

	T setId( int theValue );

	T setLabel( String theString );

	T setColorActive( int theColor );

	T setColorForeground( int theColor );

	T setColorBackground( int theColor );

	T setColorLabel( int theColor );

	T setColorValue( int theColor );

	T setColor( CColor theColor );

	CColor getColor( );

	T show( );

	T hide( );

	boolean isVisible( );

	T moveTo( ControllerGroup< ? > theGroup , Tab theTab , ControlWindow theWindow );

	T moveTo( ControllerGroup< ? > theGroup );

	@ControlP5.Invisible
    int getPickingColor( );

	ControllerProperty getProperty( String thePropertyName );

	ControllerProperty getProperty( String theSetter , String theGetter );

	T registerProperty( String thePropertyName );

	T registerProperty( String theSetter , String theGetter );

	T removeProperty( String thePropertyName );

	T removeProperty( String theSetter , String theGetter );

	boolean isMouseOver( );

	T setMouseOver( boolean theFlag );
	
	T setFont( PFont theFont );
	
	T setFont( ControlFont theFont );
	
	T addListener( ControlListener theListener );

	T setCaptionLabel( String theValue );
}
