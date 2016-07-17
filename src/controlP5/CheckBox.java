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
 * A multiple-choice radioButton. items are added to a checkBox and can be organized in rows and
 * columns. items of a checkBox are of type Toggle.
 * 
 * @example controllers/ControlP5checkBox
 * 
 * @see controlP5.Toggle
 * 
 */
public class CheckBox extends ControlGroup< CheckBox > {

	final protected List< Toggle > _myRadioToggles = new ArrayList< >( );

	final protected PImage[]  images = new PImage[ 3 ];
	final protected boolean[] availableImages = new boolean[ 3 ];

	protected int spacingRow = 1;
	protected int spacingColumn = 1;
	protected int itemsPerRow = -1;

	protected int itemHeight = 9;
	protected int itemWidth  = 9;

	protected boolean noneSelectedAllowed = true;
	protected boolean isMultipleChoice = true;

	protected Object _myPlug;
	protected String _myPlugName = "";

	static protected final Class<?>[] CFA = { float[].class };

	/**
	 * Convenience constructor to extend CheckBox.
	 * 
	 * @example use/ControlP5extendController
	 * @param theControlP5
	 * @param theName
	 */
	public CheckBox( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , 0 , 0 );
		cp5.register( cp5.papplet , theName , this );
	}

	/**
	 * A CheckBox should only be added to controlP5 by using controlP5.addCheckBox()
	 * 
	 * @exclude
	 * @param theControlP5
	 * @param theParent
	 * @param theName
	 * @param theX
	 * @param theY
	 */
	public CheckBox( ControlP5 theControlP5 , ControllerGroup< ? extends ControllerGroup< ? > > theParent , 
				String theName , int theX , int theY ) {
		super( theControlP5 , theParent , theName , theX , theY , 99 , 9 );
		isCollapse = isBarVisible = false;
		setItemsPerRow( 1 );
		if ( ControllerPlug.checkPlug( cp5.papplet , _myPlugName = getName( ) , CFA )  _myPlug = cp5.papplet;
	}

	public CheckBox activateAll( ) {
		if ( !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.activate( );
			updateValues( );
		}
		return this;
	}

	/**
	 * Activates a single checkbox item by index
	 */
	public CheckBox activate( int theIndex ) {
		if ( ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ) {
			_myRadioToggles.get( theIndex ).activate( );
			updateValues( );
		}
		return this;
	}

	/**
	 * Deactivates a single checkbox item by index
	 */
	public CheckBox deactivate( int theIndex ) {
		if ( ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ) {
			_myRadioToggles.get( theIndex ).deactivate( );
			updateValues( );
		}
		return this;
	}

	/**
	 * Toggles a single checkbox item by index
	 */
	public CheckBox toggle( int theIndex ) {
		if ( ( theIndex = Math.abs( theIndex ) ) < _myRadioToggles.size( ) ) {
			final Toggle tog = _myRadioToggles.get( theIndex );
			if ( tog.getState( ) )	tog.deactivate( );
			else 			tog.activate( );
			updateValues( );
		}
		return this;
	}

	/**
	 * Toggles a single checkbox item by name
	 */
	public CheckBox toggle( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  if ( theName.equals( tog.getName( ) ) ) {
				if ( tog.getState( ) )	tog.deactivate( );
				else			tog.activate( );
				return updateValues( );
			}
		}
		return this;
	}

	/**
	 * Activates a single checkbox item by name
	 */
	public CheckBox activate( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  if ( theName.equals( tog.getName( ) ) ) {
				tog.activate( );
				return updateValues( );
			}
		}
		return this;
	}

	/**
	 * Deactivates a single checkbox item by name
	 */
	public CheckBox deactivate( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  if ( theName.equals( tog.getName( ) ) ) {
				tog.deactivate( );
				return updateValues( );
			}
		}
		return this;
	}

	@ControlP5.Invisible protected CheckBox updateValues( ) {
		_myValue = -1;
		return updateValues( true );
	}

	protected CheckBox updateValues( final boolean theBroadcastFlag ) {
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
	 * Sets the value for all CheckBox items according to the values of the array passed on. 0 will
	 * turn off an item, any other value will turn it on.
	 */
	@Override @SafeVarargs public final T setArrayValue( final float... theArray ) {
		if ( theArray != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			final int len = min( theArray.length , _myArrayValue.length , _myRadioToggles.size( ) );
			for ( int i = 0 ; i < len ; ++i )  if ( theArray[ i ] != _myArrayValue[ i ] ) {
				if ( theArray[ i ] == 0 )  _myRadioToggles.get( i ).deactivate( );
				else 			   _myRadioToggles.get( i ).activate( );
			}
			super.setArrayValue( theArray );
		}
		return me;
	}

	/**
	 * @exclude {@inheritDoc}
	 */
	@Override public String getInfo( ) {
		return "type:\tCheckBox\n" + super.getInfo( );
	}

	/**
	 * @param theName
	 * @param theValue
	 * @return
	 */
	public CheckBox addItem( final String theName , final float theValue ) {
		final Toggle t = cp5.addToggle( theName , 0 , 0 , itemWidth , itemHeight );
		t.getCaptionLabel( ).align( RIGHT_OUTSIDE , CENTER ).setPadding( Label.paddingX , 0 );
		t.setMode( ControlP5.DEFAULT ).setImages( images );
		return addItem( t , theValue );
	}

	/**
	 * @param theToggle
	 * @param theValue
	 * @return
	 */
	public CheckBox addItem( final Toggle theToggle , final float theValue ) {
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
	public CheckBox removeItem( final String theName ) {
		if ( theName != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			for ( int i = _myRadioToggles.size( ) ; i-- != 0 ; ) {
				final Toggle tog = _myRadioToggles.get( i );
				if ( theName.equals( tog.getName( ) ) ) {
					tog.removeListener( this );
					_myRadioToggles.remove( i );
				}
			}
			updateValues( false );
		}
		return this;
	}

	/**
	 * 
	 * @param theDefaultImage
	 * @param theOverImage
	 * @param theActiveImage
	 * @return CheckBox
	 */
	public CheckBox setImages( PImage theDefaultImage , PImage theOverImage , PImage theActiveImage ) {
		return setImage( theDefaultImage ).setImage( theOverImage , OVER ).setImage( theActiveImage , ACTIVE );
	}

	/**
	 * @param theImage
	 */
	public CheckBox setImage( PImage theImage ) {
		return setImage( theImage , DEFAULT );
	}

	/**
	 * @param theImage
	 * @param theState
	 *            use Controller.DEFAULT (background), or Controller.OVER (foreground), or
	 *            Controller.ACTIVE (active)
	 * @return
	 */
	public CheckBox setImage( final PImage theImage , final int theState ) {
		if ( theImage != null && !_myRadioToggles.isEmpty( ) )  synchronized ( _myRadioToggles ) {
			images[ theState ] = theImage;
			availableImages[ theState ] = true;
			for ( final Toggle tog : _myRadioToggles )  tog.setImage( theImage , theState );
		}
		return this;
	}

	public CheckBox setSize( PImage theImage ) {
		return setSize( theImage.width , theImage.height );
	}

	public CheckBox setSize( int theWidth , int theHeight ) {
		return setItemWidth( theWidth ).setItemHeight( theHeight );
	}

	/**
	 * Sets the height of a radioButton/checkBox item. by default the height is 11px.
	 * In order to recognize a custom height, the itemHeight has to be set 
	 * before adding items to a radioButton/checkBox.
	 * 
	 * @param theItemHeight
	 */
	public CheckBox setItemHeight( final int theItemHeight ) {
		itemHeight = theItemHeight;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.setHeight( theItemHeight );
		}
		return updateLayout( );
	}

	/**
	 * Sets the width of a radioButton/checkBox item. by default the width is 11px.
	 * In order to recognize a custom width, the itemWidth has to be set 
	 * before adding items to a radioButton/checkBox.
	 * 
	 * @param theItemWidth
	 */
	public CheckBox setItemWidth( final int theItemWidth ) {
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
	public CheckBox updateLayout( ) {
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
	 * Items of a RadioButton or a CheckBox are organized in columns and rows.
	 * setItemsPerRow() sets the limit of items per row.
	 * Items exceeding the limit will be pushed to the next row.
	 * 
	 * @param theValue
	 */
	public CheckBox setItemsPerRow( final int theValue ) {
		itemsPerRow = theValue;
		return updateLayout( );
	}

	/**
	 * Sets the spacing in pixels between columns.
	 * 
	 * @param theSpacing
	 */
	public CheckBox setSpacingColumn( final int theSpacingCol ) {
		spacingColumn = theSpacingCol;
		return updateLayout( );
	}

	/**
	 * Sets the spacing in pixels between rows.
	 * 
	 * @param theSpacing
	 */
	public CheckBox setSpacingRow( final int theSpacingRow ) {
		spacingRow = theSpacingRow;
		return updateLayout( );
	}

	public CheckBox deactivateAll( ) {
		if ( !isMultipleChoice & !noneSelectedAllowed || _myRadioToggles.isEmpty( ) )  return this;
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.deactivate( );
		}
		_myValue = -1;
		return updateValues( true );
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
		updateValues( true );
		if ( _myPlug != null )	try {
			final Method method = _myPlug.getClass( ).getMethod( _myPlugName , float[].class );
			method.invoke( _myPlug , getArrayValue( ) );
		} catch ( SecurityException | IllegalArgumentException | ReflectiveOperationException ex ) {
			ex.printStackTrace( );
		}
	}

	public CheckBox plugTo( final Object theObject ) {
		_myPlug = ControllerPlug.checkPlug( theObject , _myPlugName , CFA ) ? theObject : null;
		return this;
	}

	public CheckBox plugTo( final Object theObject , final String thePlugName ) {
		_myPlugName = thePlugName;
		return plugTo( theObject );
	}

	/**
	 * In order to always have 1 item selected, use setNoneSelectedAllowed(false).
	 * By default this is true. setNoneSelectedAllowed() does not apply when in multipleChoice mode.
	 * 
	 * @param theValue
	 */
	public CheckBox setNoneSelectedAllowed( boolean theValue ) {
		noneSelectedAllowed = theValue;
		return this;
	}

	public CheckBox setColorLabels( final int theColor ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setColor( theColor );
		}
		return this;
	}

	public CheckBox hideLabels( ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setVisible( false );
		}
		return this;
	}

	public CheckBox showLabels( ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).setVisible( true );
		}
		return this;
	}

	public CheckBox toUpperCase( boolean theValue ) {
		synchronized ( _myRadioToggles ) {
			for ( final Toggle tog : _myRadioToggles )  tog.getCaptionLabel( ).toUpperCase( theValue );
		}
		return this;
	}

	/**
	 * @deprecated
	 * @exclude
	 */
	@Deprecated public CheckBox add( final String theName , final float theValue ) {
		return addItem( theName , theValue );
	}

}
