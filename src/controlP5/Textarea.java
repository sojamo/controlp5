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

import java.util.Arrays;
import java.util.List;

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;

/**
 * a textarea can be used to leave notes, it uses the controlP5 BitFont to render text. Scrollbars
 * will automatically be added when text extends the visible area. Textarea extends ControllerGroup,
 * for more methods available see the ControllerGroup documentation.
 * 
 * @example controllers/ControlP5textarea
 */
public class Textarea extends ControllerGroup< Textarea > {

	protected String _myText;
	protected Slider _myScrollbar;
	protected int _myColorBackground = 0x000000;
	protected boolean isColorBackground = false;
	protected float _myScrollValue = 0;
	protected boolean isScrollbarVisible = true;
	protected int _myBottomOffset = 4;
	private int _myScrollbarWidth = 5;

	/**
	 * Convenience constructor to extend Textarea.
	 * 
	 * @example use/ControlP5extendController
	 * @param theControlP5
	 * @param theName
	 */
	public Textarea( ControlP5 theControlP5 , String theName ) {
		this( theControlP5 , theControlP5.getDefaultTab( ) , theName , "" , 0 , 0 , 199 , 99 );
		theControlP5.register( theControlP5.papplet , theName , this );
	}

	/**
	 * 
	 * @param theControlP5
	 *            ControlP5
	 * @param theGroup
	 *            ControllerGroup
	 * @param theName
	 *            String
	 * @param theText
	 *            String
	 * @param theX
	 *            int
	 * @param theY
	 *            int
	 * @param theW
	 *            int
	 * @param theH
	 *            int
	 */
	protected Textarea( ControlP5 theControlP5 , ControllerGroup< ? extends ControllerGroup< ? > > theGroup , 
			    String theName , String theText , int theX , int theY , int theW , int theH ) {
		super( theControlP5 , theGroup , theName , theX , theY );
		_myWidth = theW;
		_myHeight = theH;
		_myText = theText;
		setup( );
	}

	/**
	 * 
	 * @param theText
	 *            String
	 * @param theX
	 *            int
	 * @param theY
	 *            int
	 */
	public Textarea( String theText , int theX , int theY ) {
		super( theX , theY );
		_myText = theText;
		setup( );
	}

	private void setup( ) {
		_myValueLabel = new Label( cp5 , _myText );

		_myValueLabel.setFont( cp5.controlFont == cp5.defaultFont ? cp5.defaultFontForText : cp5.controlFont );

		_myValueLabel.setWidth( _myWidth );
		_myValueLabel.setHeight( _myHeight );
		_myValueLabel.setMultiline( true );
		_myValueLabel.toUpperCase( false );
		_myValueLabel.setColor( color.getValueLabel( ) );

		_myScrollbar = new Slider( cp5 , _myParent , getName( ) + "Scroller" , 0 , 1 , 1 , _myWidth - 5 , 0 , 5 , _myHeight );
		_myScrollbar.init( );
		_myScrollbar.setBroadcast( false );
		_myScrollbar.setSliderMode( Slider.FLEXIBLE );
		_myScrollbar.isMoveable = false;
		_myScrollbar.isLabelVisible = false;
		_myScrollbar.setParent( this );
		_myScrollbar.addListener( this );
		add( _myScrollbar );
		setWidth( _myWidth );
		setHeight( _myHeight );
		_myScrollbar.color.set( color );
		_myScrollbar.setColorBackground( 0x00000000 );
		_myScrollbar.setHandleSize( 40 );
	}

	/**
	 * 
	 * @param theEvent
	 *            ControlEvent
	 */
	@Override public void controlEvent( ControlEvent theEvent ) {
		_myScrollValue = theEvent.getValue( ) - 1;
		scroll( );
	}

	public Textarea hideScrollbar( ) {
		isScrollbarVisible = false;
		_myScrollbar.hide( );
		return this;
	}

	public Textarea showScrollbar( ) {
		isScrollbarVisible = true;
		boolean isScrollbar = _myHeight < _myValueLabel.getTextHeight( ) + _myValueLabel.getLineHeight( );
		if ( isScrollbar )  _myScrollbar.show( );
		return this;
	}

	public boolean isScrollable( ) {
		return _myScrollbar.isVisible( );
	}

	@Override public T setColorBackground( int theColor ) {
		_myColorBackground = theColor;
		return enableColorBackground( );
	}

	public Textarea enableColorBackground( ) {
		isColorBackground = true;
		return this;
	}

	public Textarea disableColorBackground( ) {
		isColorBackground = false;
		return this;
	}

	/**
	 * scroll the Textarea remotely. values must range from 0 to 1.
	 * 
	 * @param theValue
	 */
	public Textarea scroll( float theValue ) {
		_myScrollbar.setValue( 1 - theValue );
		return this;
	}

	/**
	 * private update method for the scrollbar.
	 */
	private Textarea scroll( ) {
		_myScrollValue = PApplet.constrain( _myScrollValue , -1 , 0 );
		float myLen = _myValueLabel.getTextHeight( ) + _myValueLabel.getLineHeight( );
		boolean isScrollbar = _myHeight < myLen;
		//float myOffset = isScrollbar ? _myScrollValue * ( myLen - _myHeight + _myBottomOffset ) : 0;
		_myScrollbar.setVisible( isScrollbarVisible ? isScrollbar : false );
		_myValueLabel.setOffsetYratio( _myScrollValue );
		return this;
	}

	@ControlP5.Invisible public void scrolled( int theStep ) {
		if ( _myScrollbar.isVisible( ) ) {
			float lines = _myValueLabel.getTextHeight( ) / _myValueLabel.getLineHeight( );
			scroll( theStep/lines - getScrollPosition( ) + 1f );
		}
	}

	@ControlP5.Invisible public float getScrollPosition( ) {
		return _myScrollbar.getValue( );
	}

	/**
	 * set the width of the textarea.
	 * 
	 * @param theWidth
	 *            int
	 */
	@Override public T setWidth( int theWidth ) {
		_myWidth = Math.max( 10 , theWidth );
		_myValueLabel.setWidth( _myWidth - _myScrollbarWidth - 10 );
		return me;
	}

	/**
	 * set the height of the textarea.
	 * 
	 * @param theHeight
	 *            int
	 */
	@Override public T setHeight( int theHeight ) {
		_myHeight = Math.max( 10 , theHeight );
		_myValueLabel.setHeight( _myHeight - 2 );
		_myScrollbar.setHeight( theHeight );
		return me;
	}

	@Override public T setSize( int theWidth , int theHeight ) {
		setWidth( theWidth );
		setHeight( theHeight );
		return me;
	}

	/**
	 * set the lineheight of the textarea.
	 * 
	 * @param theLineHeight
	 *            int
	 */
	public Textarea setLineHeight( int theLineHeight ) {
		_myValueLabel.setLineHeight( theLineHeight );
		return scroll( );
	}

	/**
	 * set the text color of the textarea.
	 * 
	 * @param theColor
	 *            int
	 */
	public Textarea setColor( int theColor ) {
		_myValueLabel.setColor( theColor , true );
		return this;
	}

	/**
	 * set the text of the textarea.
	 * 
	 * @param theText
	 *            String
	 */
	public Textarea setText( String theText ) {
		_myValueLabel.set( theText );
		_myScrollValue = ( float ) _myHeight / _myValueLabel.getTextHeight( );
		final ControllerStyle style = _myValueLabel.getStyle( );
		_myScrollbar.setHeight( _myHeight + style.paddingTop + style.paddingBottom );
		return this;
	}

	public Textarea clear( ) {
		return setText( "" );
	}

	public Textarea append( String theText ) {
		return setText( getText( ) + theText );
	}

	public Textarea append( String theText , int max ) {
		String str = getText( ) + theText;
		if ( max == -1 )  return setText( str );
		List< String > strs = Arrays.asList( str.split( "\n" ) );
		int len = strs.size( );
		return setText( CP.join( strs.subList( Math.max( 0 , len - max ) , len ) , "\n" ) );
	}

	/**
	 * returns the text content of the textarea.
	 * 
	 * @return String
	 */
	public String getText( ) {
		return getStringValue( );
	}

	@Override protected void preDraw( final PGraphics theGraphics ) {
		if ( isScrollbarVisible )  _myScrollbar.setVisible( _myValueLabel.getOverflow( ) > 1 );
		if ( !isColorBackground && !_myScrollbar.isVisible( ) )  return;
		final ControllerStyle style = _myValueLabel.getStyle( );
		float x = _myWidth - _myScrollbarWidth + style.paddingLeft + style.paddingRight;
		set( _myScrollbar.getPosition( ) , x , y( _myScrollbar.getPosition( ) ) );
		if ( isColorBackground ) {
			int a = _myColorBackground >> 24 & 0xff;
			theGraphics.fill( _myColorBackground , a > 0 ? a : 0xff );
		} else theGraphics.noFill( );
		int ww = _myWidth  + style.paddingLeft + style.paddingRight;
		int hh = _myHeight + style.paddingTop  + style.paddingBottom;
		theGraphics.rect( 0 , 0 , ww , hh );
	}

	// !!! add padding to the box.
	// padding and margin doesn't work nicely with Textarea yet!
	@Override protected boolean inside( ) {
		final int mx = getWindow( ).mouseX, my = getWindow( ).mouseY;
		final int x = Math.round( x( position ) + x( _myParent.absolutePosition ) );
		final int y = Math.round( y( position ) + y( _myParent.absolutePosition ) );
		return mx > x && mx < x + _myWidth && my > y && my < y + _myHeight;
	}

	@Override public String getStringValue( ) {
		return _myValueLabel.getText( );
	}

	@Override public T setFont( ControlFont theFont ) {
		getValueLabel( ).setFont( theFont );
		return me;
	}

	@Override public T setFont( PFont thePFont ) {
		getValueLabel( ).setFont( thePFont );
		return me;
	}

	public Textarea setFont( int theFontIndex ) {
		getValueLabel( ).setFont( theFontIndex );
		return this;
	}

	/**
	 * @param theColor
	 * @return Textarea
	 */
	public Textarea setScrollBackground( int theColor ) {
		_myScrollbar.setColorBackground( theColor );
		return this;
	}

	/**
	 * @param theColor
	 * @return Textarea
	 */
	public Textarea setScrollForeground( int theColor ) {
		_myScrollbar.setColorForeground( theColor );
		return this;
	}

	/**
	 * @param theColor
	 * @return Textarea
	 */
	public Textarea setScrollActive( int theColor ) {
		_myScrollbar.setColorActive( theColor );
		return this;
	}

	/**
	 * @param theColor
	 * @return Textarea
	 */
	public Textarea setBorderColor( int theColor ) {
		color.setBackground( theColor );
		return this;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override public float getValue( ) {
		return 0;
	}

	@Deprecated public float value( ) {
		return 0;
	}

	@Deprecated public String stringValue( ) {
		return getStringValue( );
	}

	@Deprecated public Label valueLabel( ) {
		return getValueLabel( );
	}

	/**
	 * @exclude
	 * @deprecated
	 * @return
	 */
	@Deprecated public boolean isScrollbarVisible( ) {
		return isScrollbarVisible;
	}

	/**
	 * @deprecated
	 * @exclude
	 * @return
	 */
	@Deprecated public String text( ) {
		return getText( );
	}
}

// @todo linebreaking algorithm.
// http://www.leverkruid.eu/GKPLinebreaking/index.html
// found at http://www.texone.org/?p=43

