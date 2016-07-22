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

import java.lang.reflect.Method;

import java.util.List;
import java.util.ArrayList;

import processing.core.PImage;
import static processing.core.PApplet.min;

/**
 * A radioButton is a list of toggles that can be turned on or off. radioButton is of type
 * ControllerGroup, therefore a controllerPlug can't be set. this means that an event from a
 * radioButton can't be forwarded to a method other than controlEvent in a sketch.
 * 
 * a radioButton has 2 sets of values. radioButton.getValue() returns the value of the active
 * radioButton item. radioButton.getArrayValue() returns a float array that represents the active
 * (1) and inactive (0) items of a radioButton.
 * 
 * ControlP5 CheckBox Toggle
 * 
 * @example controllers/ControlP5radioButton
 * 
 * @nosuperclasses Controller Controller
 */
public class RadioButton extends ControlGroup< RadioButton > {

	final protected List< Toggle > _myRadioToggles = new ArrayList< >( );

	final protected PImage[]  images = new PImage[ 3 ];
	final protected boolean[] availableImages = new boolean[ 3 ];

	protected int spacingRow = 1;
	protected int spacingColumn = 1;
	protected int itemsPerRow = -1;

	protected int itemHeight = 9;
	protected int itemWidth = 9;

	protected boolean noneSelectedAllowed = true;
	protected boolean isMultipleChoice = true;

	protected Object _myPlug;
	protected String _myPlugName = "";

	protected int alignX = RIGHT_OUTSIDE;
	protected int alignY = CENTER;
	protected int _myPaddingX = Label.paddingX;
	protected int _myPaddingY = 0;

	static protected final Class<?>[] CIA = { int[].class };

	/**
	 * Convenience constructor to extend RadioButton.
	 * 
	 * @example use/ControlP5extendController
	 * @param theControlP5
	 * @param theName
	 */
	public RadioButton( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , 0 , 0 );
		cp5.register( cp5.papplet , theName , this );
	}

	/**
	 * @exclude
	 * @param theControlP5
	 * @param theParent
	 * @param theName
	 * @param theX
	 * @param theY
	 */
	public RadioButton( ControlP5 theControlP5 , ControllerGroup< ? extends ControllerGroup< ? > > theParent , 
				String theName , int theX , int theY ) {
		super( theControlP5 , theParent , theName , theX , theY , 99 , 9 );
		isCollapse = isBarVisible = false;
		setItemsPerRow( 1 );
		_myPlug = cp5.papplet;
		if ( !ControllerPlug.checkPlug( cp5.papplet , _myPlugName = getName( ) , CIA ) )  _myPlug = cp5.papplet;
	}

	/**
	 * @param theName
	 * @param theValue
	 * @return
	 */
	public RadioButton addItem( final String theName , final float theValue ) {
		final Toggle t = cp5.addToggle( theName , 0 , 0 , itemWidth , itemHeight );
		t.getCaptionLabel( ).align( alignX , alignY ).setPadding( _myPaddingX , _myPaddingY );
		t.setMode( ControlP5.DEFAULT ).setImages( images ).setSize( images[ 0 ] );
		return addItem( t , theValue );
	}

	/**
	 * @param theToggle
	 * @param theValue
	 * @return
	 */
	public RadioButton addItem( final Toggle theToggle , final float theValue ) {
		theToggle.isBroadcast = theToggle.isMoveable = false;
		theToggle.setGroup( this ).setInternalValue( theValue );
		synchronized ( _myRadioToggles ) {
			_myRadioToggles.add( theToggle );
		}
		updateLayout( );
		getColor( ).copyTo( theToggle );
		theToggle.addListener( this );
		updateValues( false );
		cp5.removeProperty( theToggle );
		return this;
	}

	/**
	 * @param theName
	 */
	public RadioButton removeItem( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( int i = _myRadioToggles.size( ) ; i-- != 0 ; ) {
				final Toggle tog = _myRadioToggles.get( i );
				if ( theName.equals( tog.getName( ) ) ) {
					tog.removeListener( this ).remove();
					_myRadioToggles.remove( i );
				}
			}
			updateValues( false ).updateLayout( );
		}
		return this;
	}

	protected RadioButton updateAlign( ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).align( alignX , alignY );
		}
		return this;
	}

	public RadioButton align( int[] a ) {
		return align( a[ 0 ] , a[ 1 ] );
	}

	public RadioButton align( int theX , int theY ) {
		alignX = theX;
		alignY = theY;
		return updateAlign( );
	}

	public RadioButton alignX( int theX ) {
		return align( theX , alignY );
	}

	public RadioButton alignY( int theY ) {
		return align( alignX , theY );
	}

	public int[] getAlign( ) {
		return new int[] { alignX , alignY };
	}

	public RadioButton setLabelPadding( final int thePaddingX , final int thePaddingY ) {
		_myPaddingX = thePaddingX;
		_myPaddingY = thePaddingY;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )
				tog.getCaptionLabel( ).setPadding( thePaddingX , thePaddingY );
		}
		return this;
	}

	/**
	 * 
	 * @param theDefaultImage
	 * @param theOverImage
	 * @param theActiveImage
	 * @return RadioButton
	 */
	public RadioButton setImages( PImage theDefaultImage , PImage theOverImage , PImage theActiveImage ) {
		return setImage( theDefaultImage ).setImage( theOverImage , OVER ).setImage( theActiveImage , ACTIVE );
	}

	/**
	 * @param theImage
	 */
	public RadioButton setImage( PImage theImage ) {
		return setImage( theImage , DEFAULT );
	}

	/**
	 * @param theImage
	 * @param theState
	 *            use Controller.DEFAULT (background), or Controller.OVER (foreground), or
	 *            Controller.ACTIVE (active)
	 * @return
	 */
	public RadioButton setImage( final PImage theImage , final int theState ) {
		if ( theImage != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			images[ theState ] = theImage;
			availableImages[ theState ] = true;
			for ( final Toggle tog : _myRadioToggles )  tog.setImage( theImage , theState );
		}
		return this;
	}

	public RadioButton setSize( PImage theImage ) {
		return setSize( theImage.width , theImage.height );
	}

	public RadioButton setSize( int theWidth , int theHeight ) {
		return setItemWidth( theWidth ).setItemHeight( theHeight );
	}

	/**
	 * set the height of a radioButton/checkBox item. by default the height is 11px. in order to
	 * recognize a custom height, the itemHeight has to be set before adding items to a
	 * radioButton/checkBox.
	 * 
	 * @param theItemHeight
	 */
	public RadioButton setItemHeight( final int theItemHeight ) {
		itemHeight = theItemHeight;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.setHeight( theItemHeight );
		}
		return updateLayout( );
	}

	/**
	 * set the width of a radioButton/checkBox item. by default the width is 11px. in order to
	 * recognize a custom width, the itemWidth has to be set before adding items to a
	 * radioButton/checkBox.
	 * 
	 * @param theItemWidth
	 */
	public RadioButton setItemWidth( final int theItemWidth ) {
		itemWidth = theItemWidth;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.setWidth( theItemWidth );
		}
		return updateLayout( );
	}

	/**
	 * Gets a radio button item by index.
	 * 
	 * @param theIndex
	 * @return Toggle
	 */
	public Toggle getItem( int theIndex ) {
		return _myRadioToggles.get( theIndex );
	}

	public Toggle getItem( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )
				if ( theName.equals( tog.getName( ) ) )  return tog;
		}
		return null;
	}

	public List< Toggle > getItems( ) {
		return _myRadioToggles;
	}

	/**
	 * Gets the state of an item - this can be true (for on) or false (for off) - by index.
	 * 
	 * @param theIndex
	 * @return boolean
	 */
	public boolean getState( int theIndex ) {
		return ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ?
			_myRadioToggles.get( theIndex ).getState( ) : false;
	}

	/**
	 * Gets the state of an item - this can be true (for on) or false (for off) - by name.
	 * 
	 * @param theName
	 * @return
	 */
	public boolean getState( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )
				if ( theName.equals( tog.getName( ) ) )  return tog.getState( );
		}
		return false;
	}

	/**
	 * @exclude
	 */
	public RadioButton updateLayout( ) {
		synchronized ( _myRadioToggles ) {
			int nn = 0 , xx = 0 , yy = 0;
			for ( final Toggle tog : _myRadioToggles ) {
				set( tog.position , xx , yy );
				_myWidth = xx += tog.getWidth( ) + spacingColumn;
				if ( ++nn == itemsPerRow ) {
					xx = nn = 0;
					yy += tog.getHeight( ) + spacingRow;
				}
			}
		}
		return this;
	}

	/**
	 * Items of a radioButton or a checkBox are organized in columns and rows. SetItemsPerRow sets
	 * the limit of items per row. items exceeding the limit will be pushed to the next row.
	 * 
	 * @param theValue
	 */
	public RadioButton setItemsPerRow( final int theValue ) {
		itemsPerRow = theValue;
		return updateLayout( );
	}

	/**
	 * Sets the spacing in pixels between columns.
	 * 
	 * @param theSpacing
	 */
	public RadioButton setSpacingColumn( final int theSpacing ) {
		spacingColumn = theSpacing;
		return updateLayout( );
	}

	/**
	 * Sets the spacing in pixels between rows.
	 * 
	 * @param theSpacing
	 */
	public RadioButton setSpacingRow( final int theSpacing ) {
		spacingRow = theSpacing;
		return updateLayout( );
	}

	public RadioButton activateAll( ) {
		if ( !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.activate( );
			updateValues( );
		}
		return this;
	}

	public RadioButton deactivateAll( ) {
		if ( !isMultipleChoice & !noneSelectedAllowed || _myRadioToggles.isEmpty( ) )  return this;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.deactivate( );
		}
		_myValue = -1;
		return updateValues( true );
	}

	/**
	 * Deactivates all active RadioButton items and only activates the item corresponding to
	 * theIndex.
	 * TODO does not trigger function or value when called by code, fix!
	 * 
	 * @param theIndex
	 */
	public RadioButton activate( int theIndex ) {
		if ( ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ) {
			synchronized ( _myRadioToggles ) {
				for ( final Toggle tog : _myRadioToggles )  tog.deactivate( );
			}
			final Toggle tog = _myRadioToggles.get( theIndex );
			tog.activate( );
			_myValue = tog.internalValue( );
			updateValues( true );
		}
		return this;
	}

	/**
	 * @param theIndex
	 */
	public RadioButton deactivate( int theIndex ) {
		if ( isMultipleChoice | noneSelectedAllowed && 
		     ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ) {
			final Toggle tog = _myRadioToggles.get( theIndex );
			if ( tog.isActive ) {
				tog.deactivate( );
				_myValue = -1;
				updateValues( true );
			}
		}
		return this;
	}

	/**
	 * Actives an item of the Radio button by name.
	 * 
	 * @param theName
	 */
	public RadioButton activate( final String theName ) {
		if ( theName != null )  synchronized ( _myRadioToggles ) {
			for ( int len = _myRadioToggles.size( ) , i = 0 ; i < len ; ++i )
				if ( theName.equals( _myRadioToggles.get( i ).getName( ) ) )  return activate( i );
		}
		return this;
	}

	/**
	 * Deactivates a RadioButton by name and sets the value of the RadioButton to the default value -1.
	 * 
	 * @param theName
	 */
	public RadioButton deactivate( final String theName ) {
		if ( theName != null )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  if ( theName.equals( tog.getName( ) ) ) {
				tog.deactivate( );
				_myValue = -1;
				return updateValues( true );
			}
		}
		return this;
	}

	/**
	 * @exclude
	 * @param theIndex
	 */
	public RadioButton toggle( int theIndex ) {
		// TODO
		// boolean itemState = ((Toggle)
		// _myRadioToggles.get(theIndex)).getState();
		// if (theIndex < _myRadioToggles.size()) {
		// Toggle t = ((Toggle) _myRadioToggles.get(theIndex));
		// if (t.isActive) {
		// t.deactivate();
		// _myValue = -1;
		// updateValues(true);
		// }
		// }
		ControlP5.logger( ).info( "toggle() not yet implemented, working on it." );
		return this;
	}

	/**
	 * {@inheritDoc}
	 * 
	 * @exclude
	 */
	@ControlP5.Invisible @Override public void controlEvent( final ControlEvent theEvent ) {
		if ( !isMultipleChoice ) {
			final Controller< ? > ctrl = theEvent.getController( );
			if ( !noneSelectedAllowed && ctrl.getValue( ) < 1 && ctrl instanceof Toggle ) {
				final Toggle tog = ( Toggle ) ctrl;
				final boolean b = tog.isBroadcast( );
				tog.setBroadcast( false ).setState( true ).setBroadcast( b );
				return;
			}
			if ( !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
				_myValue = -1;
				for ( final Toggle tog : _myRadioToggles )
					if ( !tog.equals( ctrl ) )	tog.deactivate( );
					else if ( tog.isOn( ) )		_myValue = t.internalValue( );
			}
		}
		if ( _myPlug != null )  try {
				final Method method = _myPlug.getClass( ).getMethod( _myPlugName , int.class );
				method.invoke( _myPlug , ( int ) _myValue );
		} catch ( SecurityException | IllegalArgumentException | ReflectiveOperationException ex ) {
			ex.printStackTrace( );
		}
		updateValues( true );
	}

	public RadioButton plugTo( final Object theObject ) {
		_myPlug = ControllerPlug.checkPlug( theObject , _myPlugName , CIA ) ? theObject : null;
		return this;
	}

	public RadioButton plugTo( final Object theObject , final String thePlugName ) {
		_myPlugName = thePlugName;
		return plugTo( theObject );
	}

	protected RadioButton updateValues( final boolean theBroadcastFlag ) {
		if ( _myRadioToggles.isEmpty( ) )  _myArrayValue = new float[ 0 ];
		else synchronized ( _myRadioToggles ) {
			int i = 0 , len = _myRadioToggles.size( );
			_myArrayValue = new float[ len ];
			for ( final Toggle tog : _myRadioToggles )  _myArrayValue[ i++ ] = tog.getValue( );
		}
		if ( theBroadcastFlag )  cp5.getControlBroadcaster( ).broadcast( new ControlEvent( this ) , FLOAT );
		return this;
	}

	/**
	 * In order to always have 1 item selected, use setNoneSelectedAllowed(false), by default this
	 * is true. setNoneSelectedAllowed does not apply when in multipleChoice mode.
	 * 
	 * @param theValue
	 */
	public RadioButton setNoneSelectedAllowed( boolean theValue ) {
		noneSelectedAllowed = theValue;
		return this;
	}

	/**
	 * Sets the value for all RadioButton items according to the values of the array passed on.
	 * 0 will turn off an item, any other value will turn it on.
	 */
	@Override @SafeVarargs public final T setArrayValue( final float... theArray ) {
		if ( theArray != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			final int len = min( theArray.length , _myArrayValue.length , _myRadioToggles.size( ) );
			for ( int i = 0 ; i < len ; ++i )  if ( theArray[ i ] != _myArrayValue[ i ] ) {
				if ( theArray[ i ] == 0 )  deactivate( i );
				else 			   activate( i );
			}
			super.setArrayValue( theArray );
		}
		return me;
	}

	public RadioButton setColorLabels( final int theColor ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setColor( theColor );
		}
		return this;
	}

	public RadioButton hideLabels( ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setVisible( false );
		}
		return this;
	}

	public RadioButton showLabels( ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setVisible( true );
		}
		return this;
	}

	public RadioButton toUpperCase( final boolean theValue ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).toUpperCase( theValue );
		}
		return this;
	}

	/**
	 * @exclude {@inheritDoc}
	 */
	@Override public String getInfo( ) {
		return "type:\tRadioButton\n" + super.getInfo( );
	}

	/**
	 * @deprecated
	 * @exclude
	 */
	@Deprecated public RadioButton add( final String theName , final float theValue ) {
		return addItem( theName , theValue );
	}
}
