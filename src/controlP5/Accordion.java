package controlP5;

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

/**
 * <p>
 * An Accordion here is a list of ControlGroups which can be expanded and collapsed. 
 * 
 * @see controlP5.ControllerGroup
 * @see controlP5.ControlGroup
 * @example controllers/ControlP5accordion
 */
public class Accordion extends ControlGroup< Accordion > {

	protected int spacing = 1;
	protected int minHeight = 100;
	protected int itemHeight;
	protected int _myMode = SINGLE;

	public Accordion( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , 0 , 0 , 200 );
		cp5.register( cp5.papplet , theName , this );
	}

	Accordion( ControlP5 theControlP5 , Tab theTab , String theName , int theX , int theY , int theW ) {
		super( theControlP5 , theTab , theName , theX , theY , theW , 9 );
		hideBar( );
	}

	/**
	 * Adds items of type ControlGroup to the Accordion, only ControlGroups can be added.
	 * 
	 * @exclude
	 * @param theGroup
	 * @return Accordion
	 */
	public Accordion addItem( final ControlGroup< ? extends ControlGroup< ? > > theGroup ) {
		theGroup.close( ).moveTo( this ).activateEvent( true ).addListener( this ).setMoveable( false );
		if ( theGroup.getBackgroundHeight( ) < minHeight )  theGroup.setBackgroundHeight( minHeight );
		controllers.add( theGroup );
		return updateItems( );
	}

	/**
	 * Removes a ControlGroup from the accordion AND from controlP5. 
	 * remove(ControllerInterface theGroup) overwrites its super method.
	 * If you want to remove a ControlGroup only from the Accordion, use removeItem(ControlGroup).
	 *
	 * @see controlP5.Accordion#removeItem(ControlGroup)
	 * @return ControllerInterface
	 */
	@Override public Accordion remove( final ControllerInterface< ? extends ControlGroup< ? > > theGroup ) {
		theGroup.removeListener( this );
		updateItems( );
		return super.remove( theGroup );
	}

	/**
	 * Removes a ControlGroup from the accordion and puts it back into the default tab of controlP5.
	 * If you don't have access to a ControlGroup via a variable, 
	 * use controlP5.group("theNameOfTheGroup") which will return a
	 * 
	 * @return Accordion
	 */
	public Accordion removeItem( final ControlGroup< ? extends ControlGroup< ? > > theGroup ) {
		if ( theGroup == null )  return this;
		controllers.remove( theGroup );
		theGroup.removeListener( this ).moveTo( cp5.controlWindow );
		return updateItems( );
	}

	/**
	 * updateItems() is called when changes such as remove, change of height are performed on an Accordion.
	 * updateItems() is called automatically for such cases, but by calling updateItems()
	 * manually an update will be forced.
	 * 
	 * @return Accordion
	 */
	public Accordion updateItems( ) {
		setWidth( _myWidth );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			int n = 0;
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				if ( ci instanceof ControlGroup< ? > ) {
					final ControlGroup< ? > cg = ( ControlGroup< ? > ) ci;
					cg.setPosition( 0 , n += cg.getBarHeight( ) + spacing );
					if ( cg.isOpen( ) ) n += cg.getBackgroundHeight( );
				}
		}
		return this;
	}

	/**
	 * Sets the minimum height of a collapsed item, default value is 100.
	 * 
	 * @param theHeight
	 * @return Accordion
	 */
	public Accordion setMinItemHeight( int theHeight ) {
		minHeight = theHeight;
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				if ( ci instanceof ControlGroup< ? > ) {
					final ControlGroup< ? > cg = ( ControlGroup< ? > ) ci;
					if ( cg.getBackgroundHeight( ) < minHeight )
						cg.setBackgroundHeight( minHeight );
				}
		}
		return updateItems( );
	}

	public int getMinItemHeight( ) {
		return minHeight;
	}

	public Accordion setItemHeight( int theHeight ) {
		itemHeight = theHeight;
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				if ( cg instanceof ControlGroup< ? > )
					( ( ControlGroup< ? > ) ci ).setBackgroundHeight( itemHeight );
		}
		return updateItems( );
	}

	public int getItemHeight( ) {
		return itemHeight;
	}

	@Override public T setWidth( final int theWidth ) {
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
		for ( ControllerInterface< ? > ci : controllers.get( ) )
			if ( cg instanceof ControlGroup< ? > )
				( ( ControlGroup< ? > ) ci ).setWidth( theWidth );
		}
		return super.setWidth( theWidth );
	}

	/**
	 * @exclude {@inheritDoc}
	 */
	@ControlP5.Invisible @Override public void controlEvent( final ControlEvent theEvent ) {
		if ( theEvent.isGroup( ) && controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			int n = 0;
			for ( final ControllerInterface< ? > ci : controllers.get( ) ) {
				if ( ci instanceof ControlGroup< ? > ) {
					final ControlGroup< ? > cg = ( ControlGroup< ? > ) ci;
					cg.setPosition( 0 , n += cg.getBarHeight( ) + spacing );
					if ( _myMode != SINGLE ) {
						if ( cg.isOpen( ) )  n += cg.getBackgroundHeight( );
					} else	if ( cg.isOpen( ) && cg == theEvent.getGroup( ) ) {
						n += cg.getBackgroundHeight( );
					} else	cg.close( );
				}
			}
		}
	}

	@Override public T open( ) {
		final int len = controllers.size( ) , n[] = new int[ len ];
		for ( int i = 0 ; i < len ; n[ i ] = i++ );
		return open( n );
	}

	@Override public T close( ) {
		final int len = controllers.size( ) , n[] = new int[ len ];
		for ( int i = 0 ; i < len ; n[ i ] = i++ );
		return close( n );
	}

	@SafeVarargs public final T open( final int... theIds ) {
		if ( theIds == null || theIds[ 0 ] == -1 )  return open( );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			int n = 0 , i = 0;
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				if ( ci instanceof ControlGroup< ? > ) {
					final ControlGroup< ? > cg = ( ControlGroup< ? > ) ci;
					boolean idCheck = false;
					for ( final int id : theIds )  if ( id == i ) {
						idCheck = true;
						break;
					}
					++i;
					cg.setPosition( 0 , n += cg.getBarHeight( ) + spacing );
					if ( idCheck || cg.isOpen( ) )  n += cg.open( ).getBackgroundHeight( );
				}
		}
		return me;
	}

	@SafeVarargs public final T close( final int... theIds ) {
		if ( theIds == null || theIds[ 0 ] == -1 )  return close( );
		if ( controllers.size( ) != 0 )  synchronized ( controllers.get( ) ) {
			int n = 0 , i = 0;
			for ( final ControllerInterface< ? > ci : controllers.get( ) )
				if ( ci instanceof ControlGroup< ? > ) {
					final ControlGroup< ? > cg = ( ControlGroup< ? > ) ci;
					boolean idCheck = false;
					for ( final int id : theIds )  if ( id == i ) {
						idCheck = true;
						break;
					}
					++i;
					cg.setPosition( 0 , n += cg.getBarHeight( ) + spacing );
					if ( idCheck || !cg.isOpen( ) )	cg.close( );
					else				n += cg.getBackgroundHeight( );
				}
		}
		return me;
	}

	public Accordion setCollapseMode( final int theMode ) {
		_myMode = theMode == 0 ? SINGLE : MULTI;
		return this;
	}
}
