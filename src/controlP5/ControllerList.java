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
 */

package controlP5;

import java.util.List;
import java.util.ArrayList;
import java.util.RandomAccess;

/**
 * Stores objects of type ControllerInterface and CDrawable, mainly for internal use.
 */
public class ControllerList implements RandomAccess {
	protected final List< ControllerInterface< ? > > controllers = new ArrayList< >( );
	protected final List< CDrawable > drawables = new ArrayList< >( );

	public ControllerList add( final ControllerInterface< ? extends ControllerInterface< ? > > theController ) {
		if ( !contains( theController ) )  synchronized ( controllers ) {
			controllers.add( theController );
		}
		return this;
	}

	public ControllerList addDrawable( final CDrawable theController ) {
		if ( !containsDrawable( theController ) )  synchronized ( drawables ) {
			drawables.add( theController );
		}
		return this;
	}

	public ControllerList remove( final ControllerInterface< ? extends ControllerInterface< ? > > theController ) {
		if ( !isEmpty( ) )  synchronized ( controllers ) {
			controllers.remove( theController );
		}
		return this;
	}

	public ControllerList removeDrawable( final CDrawable theController ) {
		if ( !isEmptyDrawable( ) )  synchronized ( drawables ) {
			drawables.remove( theController );
		}
		return this;
	}

	public ControllerList clear( ) {
		if ( !isEmpty( ) )  synchronized ( controllers ) {
			controllers.clear( );
		}
		return this;
	}

	public ControllerList clearDrawable( ) {
		if ( !isEmptyDrawable( ) )  synchronized ( drawables ) {
			drawables.clear( );
		}
		return this;
	}

	public ControllerInterface< ? extends ControllerInterface< ? > > get( final int theIndex ) {
		return controllers.get( theIndex );
	}

	public List< ControllerInterface< ? > > get( ) {
		return controllers;
	}

	public CDrawable getDrawable( final int theIndex ) {
		return drawables.get( theIndex );
	}

	public List< CDrawable > getDrawables( ) {
		return drawables;
	}

	public boolean contains( final ControllerInterface< ? extends ControllerInterface< ? > > theController ) {
		return controllers.contains( theController );
	}

	public boolean containsDrawable( final CDrawable theController ) {
		return drawables.contains( theController );
	}

	public boolean isEmpty( ) {
		return controllers.isEmpty( );
	}

	public boolean isEmptyDrawable( ) {
		return drawables.isEmpty( );
	}

	public int size( ) {
		return controllers.size( );
	}

	public int sizeDrawable( ) {
		return drawables.size( );
	}
}
