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

package controlP5;

import java.util.ArrayList;
import java.util.List;

import processing.core.PApplet;
import processing.core.PGraphics;

/**
 * <p>
 * In previous versions you would use the ControlGroup class
 * to bundle controllers in a group. Now please use the
 * Group class to do so.
 * </p>
 * <p>
 * ControlGroup extends ControllerGroup, for a list and
 * documentation of available methods see the
 * {@link ControllerGroup} documentation.
 * </p>
 * 
 * @see controlP5.Group
 * @example controllers/ControlP5group
 */
public class ControlGroup< T extends ControlGroup< T > > extends ControllerGroup< T > {
	protected int _myBackgroundHeight = 0;
	protected int _myBackgroundColor  = 0x00ffffff;
	protected boolean isEventActive;

	/**
	 * Convenience constructor to extend ControlGroup.
	 */
	public ControlGroup( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , 0 , 0 , 100 , 9 );
		cp5.register( theControlP5.papplet , theName , this );
	}

	public ControlGroup( ControlP5 theControlP5 , ControllerGroup< ? extends ControllerGroup< ? > > theParent , 
				String theName , int theX , int theY , int theW , int theH ) {
		super( theControlP5 , theParent , theName , theX , theY );
		_myValueLabel = new Label( cp5 , "" );
		_myWidth  = theW;
		_myHeight = theH;
	}

	@ControlP5.Invisible @Override
	public void mousePressed( ) {
		if ( !( isBarVisible && isCollapse && !cp5.isAltDown( ) ) )  return;
		isOpen = !isOpen;
		if ( !isEventActive )  return;
		final ControlEvent myEvent = new ControlEvent( this );
		cp5.getControlBroadcaster( ).broadcast( myEvent , METHOD );
		if ( !_myControlListener.isEmpty( ) )  synchronized ( _myControlListener ) {
			for ( final ControlListener cl : _myControlListener )  cl.controlEvent( myEvent );
		}
	}

	/**
	 * activates or deactivates the Event status of a
	 * ControlGroup.
	 */
	public T activateEvent( boolean theFlag ) {
		isEventActive = theFlag;
		return me;
	}

	@Override
	public T setSize( int theWidth , int theHeight ) {
		super.setSize( theWidth , theHeight );
		return setBackgroundHeight( theHeight );
	}

	public int getBackgroundHeight( ) {
		return _myBackgroundHeight;
	}

	public T setBackgroundHeight( int theHeight ) {
		_myBackgroundHeight = theHeight;
		return me;
	}

	public T setBackgroundColor( int theColor ) {
		_myBackgroundColor = theColor;
		return me;
	}

	public T setBarHeight( int theHeight ) {
		_myHeight = theHeight;
		return me;
	}

	public int getBarHeight( ) {
		return _myHeight;
	}

	@Override
	public T updateInternalEvents( PApplet theApplet ) {
		if ( isInside && isBarVisible )  getWindow( ).setMouseOverController( this );
		return me;
	}

	@Override
	protected void preDraw( PGraphics theGraphics ) {
		if ( isOpen ) {
			theGraphics.fill( _myBackgroundColor );
			theGraphics.rect( 0 , 0 , _myWidth , _myBackgroundHeight - 1 );
		}
	}

	@Override
	protected void postDraw( PGraphics theGraphics ) {
		if ( !isBarVisible )  return;
		theGraphics.fill( isInside ? color.getForeground( ) : color.getBackground( ) );
		theGraphics.rect( 0 , -1 , _myWidth , -_myHeight );
		_myLabel.draw( theGraphics , 0 , -_myHeight - 1 , this );
		if ( !isCollapse || !isArrowVisible )  return;
		theGraphics.fill( _myLabel.getColor( ) );
		final int w = _myWidth + 2 , h = -( _myHeight >> 1 );
		final int h1 = isOpen ? h - 3 : h , h2 = isOpen ? h : h - 3;
		theGraphics.triangle( w - 10 , h1 , w - 4 , h1 , w - 7 , h2 );
	}

	@ControlP5.Invisible @Override
	public void controlEvent( ControlEvent theEvent ) {
		if ( theEvent.getController( ).getName( ).equals( getName( ) + "close" ) )  hide( );
	}

	@ControlP5.Invisible
	public String stringValue( ) {
		return Float.toString( _myValue );
	}

	@Override
	public String getInfo( ) {
		return "type:\tControlGroup\n" + super.getInfo( );
	}
}
