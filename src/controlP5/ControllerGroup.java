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
import processing.core.PFont;
import processing.core.PGraphics;
import processing.event.KeyEvent;

/**
 * ControllerGroup is an abstract class and is extended by class ControlGroup, Tab, or the ListBox.
 * 
 */
public abstract class ControllerGroup< T extends ControllerGroup< T > >
		implements ControllerInterface< T > , ControlListener , ControlP5Constants {
	protected final float[] position = new float[ 2 ];
	protected final float[] positionBuffer = new float[ 2 ];
	protected final float[] absolutePosition = new float[ 2 ];
	protected final ControllerList controllers = new ControllerList( );
	protected final List< ControlListener > _myControlListener = new ArrayList< >( );
	protected ControlP5 cp5;
	protected ControllerGroup< ? extends ControllerGroup< ? > > _myParent;
	protected String _myName = "";
	protected int _myId = -1;
	protected final CColor color = new CColor( );
	protected boolean isMousePressed = false;
	// only applies to the area of the title bar of a group
	protected boolean isInside = false;
	// applies to the area including controllers, currently only supported for listbox
	protected boolean isInsideGroup = false;
	protected boolean isVisible = true;
	protected boolean isOpen = true;
	protected boolean isBarVisible = true;
	protected boolean isArrowVisible = true;
	protected Button _myCloseButton;
	protected boolean isMoveable = true;
	protected Label _myLabel;
	protected Label _myValueLabel;
	protected int _myWidth = 99;
	protected int _myHeight = 9;
	protected boolean isUpdate;
	protected final List< Canvas > _myCanvas = new ArrayList< >( );
	protected float _myValue;
	protected String _myStringValue = "";
	protected float[] _myArrayValue;
	protected boolean isCollapse = true;
	protected int _myPickingColor = 0x6600ffff;
	protected final float[] autoPosition = new float[] { 10f , 30f };
	protected float tempAutoPositionHeight = 0f;
	protected float autoPositionOffsetX = 10f;
	protected String _myAddress = "";
	protected boolean mouseover;
	protected final T me = ( T ) this;

	/**
	 * Convenience constructor to extend ControllerGroup.
	 */
	public ControllerGroup( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , 0 , 0 );
		cp5.register( cp5.papplet , theName , this );
	}

	public ControllerGroup( ControlP5 theControlP5 , ControllerGroup< ? extends ControllerGroup< ? > > 
				theParent , String theName , int theX , int theY ) {
		set( position , theX , theY );
		cp5 = theControlP5;
		color.set( theParent == null ? cp5.color : theParent.color );
		_myName = theName;
		_myLabel = new Label( cp5 , _myName );
		_myLabel.setText( _myName ).setColor( color.getCaptionLabel( ) ).align( LEFT , TOP );
		setParent( theParent == null ? this : theParent );
	}

	protected ControllerGroup( int theX , int theY ) {
		set( position , theX , theY );
	}

	@ControlP5.Invisible @Override public void init( ) {
	}

	@ControlP5.Invisible @Override
	public ControllerGroup< ? extends ControllerGroup< ? > > getParent( ) {
		return _myParent;
	}

	public T setParent( final ControllerGroup< ? extends ControllerGroup< ? > > theParent ) {
		if ( _myParent != null && _myParent != this )  _myParent.remove( this );
		if ( ( _myParent = theParent ) != this )  theParent.add( this );
		final float x = x( position ) + x( theParent.absolutePosition );
		final float y = y( position ) + y( theParent.absolutePosition );
		set( absolutePosition , x , y );
		set( positionBuffer , position );
		if ( getWindow( ) != null )  setMouseOver( false );
		return me;
	}

	public final T setGroup( ControllerGroup< ? extends ControllerGroup< ? > > theGroup ) {
		setParent( theGroup );
		return me;
	}

	public final T setGroup( String theName ) {
		setParent( cp5.getGroup( theName ) );
		return me;
	}

	@Override public T moveTo( ControllerGroup< ? extends ControllerGroup< ? > > theGroup , 
				   Tab theTab , ControlWindow theControlWindow ) {
		if ( theGroup != null )  return setGroup( theGroup );
		if ( theControlWindow == null )  theControlWindow = getWindow( );
		return setTab( theControlWindow , theTab.getName( ) );
	}

	@Override public T moveTo( ControllerGroup< ? extends ControllerGroup< ? > > theGroup ) {
		return moveTo( theGroup , null , null );
	}

	public final T moveTo( Tab theTab ) {
		return moveTo( null , theTab , theTab.getWindow( ) );
	}

	public T moveTo( PApplet thePApplet ) {
		return moveTo( cp5.controlWindow );
	}

	public T moveTo( ControlWindow theControlWindow ) {
		return moveTo( null , theControlWindow.getTab( "default" ) , theControlWindow );
	}

	public final T moveTo( String theTabName ) {
		return moveTo( null , cp5.controlWindow.getTab( theTabName ) , cp5.controlWindow );
	}

	public final T moveTo( String theTabName , ControlWindow theControlWindow ) {
		return moveTo( null , theControlWindow.getTab( theTabName ) , theControlWindow );
	}

	public final T moveTo( ControlWindow theControlWindow , String theTabName ) {
		return moveTo( null , theControlWindow.getTab( theTabName ) , theControlWindow );
	}

	public final T moveTo( Tab theTab , ControlWindow theControlWindow ) {
		return moveTo( null , theTab , theControlWindow );
	}

	public final T setTab( String theName ) {
		setParent( cp5.getTab( theName ) );
		return me;
	}

	public final T setTab( ControlWindow theWindow , String theName ) {
		setParent( cp5.getTab( theWindow , theName ) );
		return me;
	}

	public final T setTab( Tab theTab ) {
		setParent( theTab );
		return me;
	}

	@Override public Tab getTab( ) {
		if ( this instanceof Tab )  return ( Tab ) this;
		if ( _myParent instanceof Tab )  return ( Tab ) _myParent;
		return _myParent.getTab( );
	}

	protected void updateFont( final ControlFont theControlFont ) {
		_myLabel.updateFont( theControlFont );
		if ( _myValueLabel != null )  _myValueLabel.updateFont( theControlFont );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) ) {
				if ( ci instanceof Controller< ? > ) {
					( ( Controller< ? > ) ci ).updateFont( theControlFont );
				} else {
					( ( ControllerGroup< ? > ) ci ).updateFont( theControlFont );
				}
			}
		}
	}

	@ControlP5.Invisible @Override public float[] getAbsolutePosition( ) {
		//return new float[] { x( absolutePosition ) , y( absolutePosition ) };
		return absolutePosition.clone();
	}

	@ControlP5.Invisible @Override public T setAbsolutePosition( final float... thePos ) {
		set( absolutePosition , thePos );
		return me;
	}

	@Override public float[] getPosition( ) {
		//return new float[] { x( position ) , y( position ) };
		return position.clone();
	}

	@Override public T setPosition( float theX , float theY ) {
		set( position , Math.round( theX ) , Math.round( theY ) );
		set( positionBuffer , position );
		return updateAbsolutePosition( );
	}

	@Override public T setPosition( final float... thePosition ) {
		return setPosition( x( thePosition ) , y( thePosition ) );
	}

	@Override public T updateAbsolutePosition( ) {
		final float x = x( position ) + x( _myParent.getAbsolutePosition( ) );
		final float y = y( position ) + y( _myParent.getAbsolutePosition( ) );
		set( absolutePosition , x , y );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.updateAbsolutePosition( );
		}
		return me;
	}

	@ControlP5.Invisible @Override public void continuousUpdateEvents( ) {
		final List< ControllerInterface< ? > > controls = controllers.get( );
		if ( !controls.isEmpty( ) )  synchronized ( controls ) {
			int i = controls.size( );
			while (  i-- != 0 )  controls.get( i ).continuousUpdateEvents( );
		}
	}

	@Override public T update( ) {
		final List< ControllerInterface< ? > > controls = controllers.get( );
		if ( !controls.isEmpty( ) )  synchronized ( controls ) {
			for ( int i = controls.size( ) ; i-- != 0 ; ) {
				final ControllerInterface< ? > ci = controls.get( i );
				if ( ci.isUpdate( ) )  ci.update( );
			}
		}
		return me;
	}

	/**
	 * enables or disables the update function of a controller.
	 */
	@Override public T setUpdate( final boolean theFlag ) {
		isUpdate = theFlag;
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) ) {
				ci.setUpdate( theFlag );
			}
		}
		return me;
	}

	/**
	 * checks the update status of a controller.
	 */
	@Override public boolean isUpdate( ) {
		return isUpdate;
	}

	@ControlP5.Invisible @Override public T updateEvents( ) {
		if ( isOpen ) {
			final List< ControllerInterface< ? > > controls = controllers.get( );
			if ( !controls.isEmpty( ) )  synchronized ( controls ) {
				int i = controls.size( );
				while (  i-- != 0 )  controls.get( i ).updateEvents( );
			}
		}
		final ControlWindow win = getWindow( );
		if ( isVisible && isMousePressed == win.mouselock ) {
			if ( isMousePressed && isMoveable && !cp5.isMoveable && cp5.isAltDown( ) ) {
				final float x = x( positionBuffer ), y = y( positionBuffer );
				set( positionBuffer , x + win.mouseX - win.pmouseX , 
						      y + win.mouseY - win.pmouseY );
				if ( cp5.isShiftDown( ) ) {
					final int xi = ( int ) x( positionBuffer );
					final int yi = ( int ) y( positionBuffer );
					set( position , xi / 10 * 10 , yi / 10 * 10 );
				} else {
					set( position , positionBuffer );
				}
				updateAbsolutePosition( );
			} else {
				if ( isInside )  setMouseOver( true );
				if ( !isInside && inside( ) ) {
					isInside = true;
					onEnter( );
					setMouseOver( true );
				} else if ( isInside && !isMousePressed ) {
					onLeave( );
					setMouseOver( isInside = false );
				}
			}
		}
		return me;
	}

	@ControlP5.Invisible @Override public T updateInternalEvents( PApplet theApplet ) {
		return me;
	}

	@Override public boolean isMouseOver( ) {
		return mouseover = isInside || isInsideGroup || !isBarVisible;
	}

	@Override public T setMouseOver( final boolean theFlag ) {
		if ( mouseover = isBarVisible ? theFlag : false ) {
			// TODO since inside can be either isInside or isInsideGroup.
			// There are 2 options here, which I am not sure how to handle them yet.
			getWindow( ).setMouseOverController( this );
		} else {
			isInsideGroup = isInside = false;
			getWindow( ).removeMouseOverFor( this );
			final List< ControllerInterface< ? > > controls = controllers.get( );
			if ( !controls.isEmpty( ) )  synchronized ( controls ) {
				int i = controls.size( );
				while (  i-- != 0 )  controls.get( i ).setMouseOver( false );
			}
		}
		return me;
	}

	@ControlP5.Invisible @Override public final void draw( final PGraphics theGraphics ) {
		if ( !isVisible )  return;
		theGraphics.pushMatrix( );
		theGraphics.translate( x( position ) , y( position ) );
		preDraw( theGraphics );
		drawControllers( cp5.papplet , theGraphics );
		postDraw( theGraphics );
		if ( _myValueLabel != null )  _myValueLabel.draw( theGraphics , 2 , 2 , this );
		theGraphics.popMatrix( );
	}

	protected void drawControllers( final PApplet theApplet , final PGraphics theGraphics ) {
		if ( !isOpen )  return;
		if ( !_myCanvas.isEmpty( ) )  synchronized ( _myCanvas ) {
			for ( final Canvas cc : _myCanvas )
				if ( cc.mode( ) == Canvas.PRE )  cc.draw( theGraphics );
		}
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) ) {
				if ( ci.isVisible( ) )
					ci.updateInternalEvents( theApplet ).draw( theGraphics );
			}
		}
		if ( controllers.sizeDrawable( ) != 0 )  synchronized ( controllers.getDrawables( ) ) {
			for ( final CDrawable cd : controllers.getDrawables( ) )  cd.draw( theGraphics );
		}
		if ( !_myCanvas.isEmpty( ) )  synchronized ( _myCanvas ) {
			for ( final Canvas cc : _myCanvas )
				if ( cc.mode( ) == Canvas.POST )  cc.draw( theGraphics );
		}
	}

	protected void preDraw( PGraphics theGraphics ) {
	}

	protected void postDraw( PGraphics theGraphics ) {
	}

	/**
	 * Adds a canvas to a controllerGroup such as a tab or group.
	 * Use processing's draw methods to add visual content.
	 */
	public Canvas addCanvas( final Canvas theCanvas ) {
		synchronized (_myCanvas) {
			_myCanvas.add( theCanvas );
		}
		// TODO theCanvas.setup( cp5.papplet );
		return theCanvas;
	}

	/**
	 * Removes a canvas from a controller group.
	 */
	public T removeCanvas( final Canvas theCanvas ) {
		if ( !_myCanvas.isEmpty( ) )  synchronized (_myCanvas) {
			_myCanvas.remove( theCanvas );
		}
		return me;
	}

	/**
	 * Adds a controller to the group, but use Controller.setGroup() instead.
	 */
	@Override public T add( ControllerInterface< ? > theElement ) {
		controllers.add( theElement );
		return me;
	}

	@Override public T bringToFront( ) {
		return bringToFront( this );
	}

	@Override public T bringToFront( final ControllerInterface< ? > theController ) {
		if ( _myParent instanceof Tab ) {
			moveTo( ( Tab ) _myParent );
		} else {
			_myParent.bringToFront( theController );
		}
		if ( theController != this && controllers.get( ).contains( theController ) ) {
			controllers.remove( theController );
			controllers.add( theController );
		}
		return me;
	}

	/**
	 * Removes a controller from the group, but use Controller.setGroup() instead.
	 */
	@Override public T remove( final ControllerInterface< ? > theElement ) {
		if ( theElement != null )  theElement.setMouseOver( false );
		controllers.remove( theElement );
		return me;
	}

	@ControlP5.Invisible public T addDrawable( CDrawable theElement ) {
		controllers.addDrawable( theElement );
		return me;
	}

	public T remove( CDrawable theElement ) {
		controllers.removeDrawable( theElement );
		return me;
	}

	/**
	 * removes the group from controlP5.
	 */
	@Override public void remove( ) {
		if ( cp5 != null )  {
			getWindow( ).removeMouseOverFor( this );
			if ( this instanceof Tab )  getWindow( ).removeTab( ( Tab ) this );
			cp5.remove( this );
		}
		if ( _myParent != null )  _myParent.remove( this );
		final List< ControllerInterface< ? > > controls = controllers.get( );
		if ( !controls.isEmpty( ) )  synchronized ( controls ) {
			for ( int i = controls.size( ) ; i-- != 0 ; )  controls.get( i ).remove( );
			controls.clear( );
		}
		controllers.clearDrawable( );
	}

	@Override public String getName( ) {
		return _myName;
	}

	@Override public String getAddress( ) {
		return _myAddress;
	}

	@Override public T setAddress( String theAddress ) {
		if ( _myAddress.length( ) == 0 )  _myAddress = theAddress;
		return me;
	}

	@Override public ControlWindow getWindow( ) {
		return cp5.getWindow( );
	}

	@ControlP5.Invisible @Override public void keyEvent( final KeyEvent theEvent ) {
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.keyEvent( theEvent );
		}
	}

	@Override public boolean setMousePressed( final boolean theStatus ) {
		if ( !isVisible )  return false;
		final List< ControllerInterface< ? > > controls = controllers.get( );
		if ( !controls.isEmpty( ) )  synchronized ( controls ) {
			for ( int i = controls.size( ) ; i-- != 0 ; )
				if ( controls.get( i ).setMousePressed( theStatus ) )  return true;
		}
		if ( theStatus && isInside ) {
			isMousePressed = true;
			mousePressed( );
			return true;
		} else if ( isMousePressed ) {
			isMousePressed = false;
			mouseReleased( );
		}
		return false;
	}

	protected void mousePressed( ) {
	}

	protected void mouseReleased( ) {
	}

	protected void onEnter( ) {
	}

	protected void onLeave( ) {
	}

	protected void onScroll( int theAmount ) {
	}

	@Override public T setId( int theId ) {
		_myId = theId;
		return me;
	}

	@Override public int getId( ) {
		return _myId;
	}

	@Override public T setColor( final CColor theColor ) {
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColor( theColor );
		}
		return me;
	}

	@Override public T setColorActive( final int theColor ) {
		color.setActive( theColor );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColorActive( theColor );
		}
		return me;
	}

	@Override public T setColorForeground( final int theColor ) {
		color.setForeground( theColor );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColorForeground( theColor );
		}
		return me;
	}

	@Override public T setColorBackground( final int theColor ) {
		color.setBackground( theColor );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColorBackground( theColor );
		}
		return me;
	}

	@Override public T setColorLabel( final int theColor ) {
		color.setCaptionLabel( theColor );
		if ( _myLabel != null )  _myLabel.setColor( color.getCaptionLabel( ) );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColorLabel( theColor );
		}
		return me;
	}

	@Override public T setColorValue( final int theColor ) {
		color.setValueLabel( theColor );
		if ( _myValueLabel != null )  _myValueLabel.setColor( color.getValueLabel( ) );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				ci.setColorValue( theColor );
		}
		return me;
	}

	@Override public T setLabel( String theLabel ) {
		_myLabel.set( theLabel );
		return me;
	}

	@Override public boolean isVisible( ) {
		return _myParent != null && _myParent != this && !getParent( ).isVisible( )? false : isVisible;
	}

	public T setVisible( boolean theFlag ) {
		isVisible = theFlag;
		return me;
	}

	@Override public T hide( ) {
		isVisible = false;
		return me;
	}

	@Override public T show( ) {
		isVisible = true;
		return me;
	}

	/**
	 * set the moveable status of the group, when false, the group can't be moved.
	 */
	public T setMoveable( boolean theFlag ) {
		isMoveable = theFlag;
		return me;
	}

	public boolean isMoveable( ) {
		return isMoveable;
	}

	public T setOpen( boolean theFlag ) {
		isOpen = theFlag;
		return me;
	}

	public boolean isOpen( ) {
		return isOpen;
	}

	public T open( ) {
		return setOpen( true );
	}

	public T close( ) {
		return setOpen( false );
	}

	/**
	 * TODO redesign or deprecate remove the close button.
	 */
	@ControlP5.Invisible public T removeCloseButton( ) {
		if ( _myCloseButton != null )  _myCloseButton.remove( );
		_myCloseButton = null;
		return me;
	}

	public T setTitle( String theTitle ) {
		getCaptionLabel( ).set( theTitle );
		return me;
	}

	public T hideBar( ) {
		isBarVisible = false;
		return me;
	}

	public T showBar( ) {
		isBarVisible = true;
		return me;
	}

	public boolean isBarVisible( ) {
		return isBarVisible;
	}

	public T hideArrow( ) {
		isArrowVisible = false;
		return me;
	}

	public T showArrow( ) {
		isArrowVisible = true;
		return me;
	}

	public boolean isArrowVisible( ) {
		return isArrowVisible;
	}

	/**
	 * TODO redesign or deprecate add a close button to the controlbar of this controlGroup.
	 */
	@ControlP5.Invisible public T addCloseButton( ) {
		if ( _myCloseButton == null ) {
			_myCloseButton = new Button( cp5 , this , getName( ) + "close" , 
						     1 , _myWidth + 1 , -10 , 12 , 9 );
			_myCloseButton.setCaptionLabel( "X" ).addListener( this );
		}
		return me;
	}

	@ControlP5.Invisible @Override public int getPickingColor( ) {
		return _myPickingColor;
	}

	@ControlP5.Invisible public T setPickingColor( final int c ) {
		_myPickingColor = c;
		return me;
	}

	@Override public CColor getColor( ) {
		return color;
	}

	@Override public T setValue( float theValue ) {
		_myValue = theValue;
		return me;
	}

	@Override public float getValue( ) {
		return _myValue;
	}

	@Override public String getStringValue( ) {
		return _myStringValue;
	}

	@Override public T setStringValue( String theValue ) {
		_myStringValue = theValue;
		return me;
	}

	@Override public float[] getArrayValue( ) {
		return _myArrayValue;
	}

	@Override public float getArrayValue( final int theIndex ) {
		if ( theIndex >= 0 && theIndex < _myArrayValue.length ) {
			return _myArrayValue[ theIndex ];
		} else {
			return Float.NaN;
		}
	}

	@Override public T setArrayValue( final int theIndex , final float theValue ) {
		if ( theIndex >= 0 && theIndex < _myArrayValue.length ) {
			_myArrayValue[ theIndex ] = theValue;
		}
		return me;
	}

	@Override public T setArrayValue( final float... theArray ) {
		_myArrayValue = theArray;
		return me;
	}

	public Controller< ? > getController( String theController ) {
		return cp5.getController( theController );
	}

	@Override public T setCaptionLabel( String theValue ) {
		getCaptionLabel( ).set( theValue );
		return me;
	}

	public Label getCaptionLabel( ) {
		return _myLabel;
	}

	public Label getValueLabel( ) {
		return _myValueLabel;
	}

	public T enableCollapse( ) {
		isCollapse = true;
		return me;
	}

	public T disableCollapse( ) {
		isCollapse = false;
		return me;
	}

	public boolean isCollapse( ) {
		return isCollapse;
	}

	@Override public int getWidth( ) {
		return _myWidth;
	}

	@Override public int getHeight( ) {
		return _myHeight;
	}

	public T setWidth( int theWidth ) {
		_myWidth = theWidth;
		return me;
	}

	public T setHeight( int theHeight ) {
		_myHeight = theHeight;
		return me;
	}

	public T setSize( int theWidth , int theHeight ) {
		setWidth( theWidth );
		// setHeight(theHeight) will set the Height of the bar therefore will not be used here.
		return me;
	}

	protected boolean inside( ) {
		final int mx = getWindow( ).mouseX, my = getWindow( ).mouseY;
		final int x = Math.round( x( position ) + x( _myParent.absolutePosition ) );
		final int y = Math.round( y( position ) + y( _myParent.absolutePosition ) );
		return mx > x && mx < x + _myWidth && my > y - _myHeight && my < y;
	}

	@Override public ControllerProperty getProperty( String thePropertyName ) {
		return cp5.getProperties( ).getProperty( this , thePropertyName );
	}

	@Override public ControllerProperty getProperty( String theSetter , String theGetter ) {
		return cp5.getProperties( ).getProperty( this , theSetter , theGetter );
	}

	@Override public T registerProperty( String thePropertyName ) {
		cp5.getProperties( ).register( this , thePropertyName );
		return me;
	}

	@Override public T registerProperty( String theSetter , String theGetter ) {
		cp5.getProperties( ).register( this , theSetter , theGetter );
		return me;
	}

	@Override public T removeProperty( String thePropertyName ) {
		cp5.getProperties( ).remove( this , thePropertyName );
		return me;
	}

	@Override public T removeProperty( String theSetter , String theGetter ) {
		cp5.getProperties( ).remove( this , theSetter , theGetter );
		return me;
	}

	@Override public void controlEvent( ControlEvent theEvent ) {
	}

	@Override public T addListener( final ControlListener theListener ) {
		synchronized ( _myControlListener ) {
			_myControlListener.add( theListener );
		}
		return me;
	}

	public T removeListener( final ControlListener theListener ) {
		if ( !_myControlListener.isEmpty( ) )  synchronized ( _myControlListener ) {
			_myControlListener.remove( theListener );
		}
		return me;
	}

	public int listenerSize( ) {
		return _myControlListener.size( );
	}

	@Override public String toString( ) {
		return getName( ) + " [" + getClass( ).getSimpleName( ) + "]";
	}

	public String getInfo( ) {
		return "type:\tControllerGroup" + "\nname:\t" + _myName + "\nlabel:\t" + _myLabel.getText( ) 
			+ "\nid:\t" + _myId + "\nvalue:\t" + _myValue + "\narrayvalue:\t" + CP.arrayToString( 
			_myArrayValue ) + "\nposition:\t" + position + "\nabsolute:\t" + absolutePosition 
			+ "\nwidth:\t" + getWidth( ) + "\nheight:\t" + getHeight( ) + "\ncolor:\t" 
			+ getColor( ) + "\nvisible:\t" + isVisible + "\nmoveable:\t" + isMoveable + "\n";
	}

	/**
	 * Convenience method to fill a float array in favor of theArray[0] = 1.2; etc.
	 * Takes a float array and fills it (starting from index 0) with arguments starting from index 1.  
	 */
	@SafeVarargs static public final float[] set( final float[] theArray , final float... theValues ) {
		if ( theArray == null || theValues == null )  return theArray;
		if ( theValues.length > theArray.length ) {
			System.arraycopy( theValues , 0 , theArray , 0 , theArray.length );
		} else {
			System.arraycopy( theValues , 0 , theArray , 0 , theValues.length );
		}
		return theArray;
	}

	/**
	 * returns the first element of the float array.
	 */
	static public final float x( final float[] theArray ) {
		return theArray != null && theArray.length > 0 ? theArray[ 0 ] : 0f;
	}

	/**
	 * returns the second element of the float array.
	 */
	static public final float y( final float[] theArray ) {
		return theArray != null && theArray.length > 1 ? theArray[ 1 ] : 0f;
	}

	@Override public T setFont( PFont thePFont ) {
		getValueLabel( ).setFont( thePFont );
		getCaptionLabel( ).setFont( thePFont );
		return me;
	}

	@Override public T setFont( ControlFont theFont ) {
		getValueLabel( ).setFont( theFont );
		getCaptionLabel( ).setFont( theFont );
		return me;
	}

	@ControlP5.Invisible public ControllerList getControllerList() {
		return controllers;
	}
}
