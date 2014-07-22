
(function(){

		var initializing = false, fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;
		// The base Class implementation (does nothing)
		this.Class = function(){};
		// Create a new Class that inherits from this class
		Class.extend = function(prop) {
			var _super = this.prototype;
			// Instantiate a base class (but only create the instance,
			// don't run the init constructor)
			initializing = true;
			var prototype = new this();
			initializing = false;
			// Copy the properties over onto the new prototype
			for (var name in prop) {
			// Check if we're overwriting an existing function
				prototype[name] = typeof prop[name] == "function" && 
				typeof _super[name] == "function" && fnTest.test(prop[name]) ?
				(function(name, fn){
					return function() {
						var tmp = this._super;
						// Add a new ._super() method that is the same method
						// but on the super-class
						this._super = _super[name];
						// The method only need to be bound temporarily, so we
						// remove it when we're done executing
						var ret = fn.apply(this, arguments);        
						this._super = tmp;
						return ret;
					};
				})(name, prop[name]) :
				prop[name];
			}

			// The dummy class constructor
			function Class() {
			// All construction is actually done in the init method
				if ( !initializing && this.init )
					this.init.apply(this, arguments);
			}
	    
	    	// Populate our constructed prototype object
			Class.prototype = prototype;
	    
	    	// Enforce the constructor to be what we expect
	    	Class.prototype.constructor = Class;
	
			// And make this class extendable
			Class.extend = arguments.callee;
			return Class;
		};
	})();

if(!C) {

	var C = (function() {

		var cp5;


		// this is taken from processing.js
		// -------------------------------------
		var stylePaddingLeft, stylePaddingTop, styleBorderLeft, styleBorderTop;

		var setStyleValues = function ( curElement ) {
			if ( document.defaultView && document.defaultView.getComputedStyle ) {
				var style = document.defaultView.getComputedStyle(curElement, null);
			    stylePaddingLeft = parseInt( style['paddingLeft'], 10 ) || 0;
			    stylePaddingTop = parseInt( style['paddingTop'], 10 ) || 0;
			    styleBorderLeft = parseInt( style['borderLeftWidth'], 10 ) || 0;
			    styleBorderTop = parseInt( style['borderTopWidth'], 10 ) || 0;
			}
		}

		function calculateOffset(curElement, event) {

	      var element = curElement , offsetX = 0 , offsetY = 0;
	
	      // Find element offset
	      if (element.offsetParent) {
	        do {
	          offsetX += element.offsetLeft;
	          offsetY += element.offsetTop;
	        } while (!!(element = element.offsetParent));
	      }
	
	      // Find Scroll offset
	      element = curElement;
	      do {
	        offsetX -= element.scrollLeft || 0;
	        offsetY -= element.scrollTop || 0;
	      } while (!!(element = element.parentNode));
	
	      // Add padding and border style widths to offset
	      offsetX += stylePaddingLeft;
	      offsetY += stylePaddingTop;
	
	      offsetX += styleBorderLeft;
	      offsetY += styleBorderTop;
	
	      // Take into account any scrolling done
	      offsetX += window.pageXOffset;
	      offsetY += window.pageYOffset;
	
			return {X:offsetX, Y:offsetY};
	    }
		// -------------------------------------
		
		
		var addEventListenerImpl = function( target, event, callback ) {
	        if ( 'addEventListener' in target ) {
	            target.addEventListener( event, callback );
	        } else {
	            var originalEvent = target["on"+event];
	            target["on"+event] = function ( evt ) {
	                var bubble = callback.apply( evt.target, [evt] );
	                if ( originalEvent ) originalEvent.apply( target, [evt] );
	                return bubble;
	            };
	        }
	    };

	    var opts;

		var C = function() {

			opts = arguments[ 0 ];

	        this.target = opts.target;

        	setStyleValues( this.target );

        	this.pointer = { x: 0 , y: 0 , px: 0 , py: 0 , dx: 0 , dy: 0 };

			this.controllers = []; /* all controllers including groups */

			this.root = new Root();

			this.fontsize = 10;

			this.papplet = opts.papplet;

			this.font = this.papplet.createFont( "" , this.fontsize );
			
			this.target.addEventListener('mousewheel',function(event){
    			event.preventDefault();
    			return false;
				}, false);

			if ( this.papplet && 'draw' in this.papplet ) {
				var drawStored = this.papplet.draw;
				this.papplet.draw = (function( ia , pa , ds ){
					return function(){
						ia.preDraw( pa );
						ds.apply( pa );
						ia.postDraw( pa );
					};
				})( this , this.papplet , drawStored );
			}

        	var events = [
            	"mousemove", "mousedown", "mouseup", "click", "dblclick", 
            	"mouseover", "mouseout", "mouseenter", "mouseleave", "mousewheel",
				"DOMMouseScroll", "keydown" , "keyup", "keypress"
        	];
        	
        	var eventDests = {
            	"mousemove": "mouseMoved",
            	"mousedown": "mousePressed",
            	"dblclick": "mouseDoubleClicked",
            	"mouseup": "mouseReleased",
				"mousewheel": "mouseScrolled",
				"DOMMouseScroll": "mouseScrolled",
				"keypress": "keyPressed",
				"keydown": "keyDown",
				"keyup": "keyReleased"
        	};

        	for ( var e in events ) {

            	(function( control , target , event , m ){

	                addEventListenerImpl( target , event , function( evt ) {

						var offset = calculateOffset( target, evt );

						control.pointer.px = control.pointer.x ; control.pointer.py = control.pointer.y ;

						control.pointer.x = evt.pageX - offset.X ; control.pointer.y = evt.pageY - offset.Y ;						

						control.pointer.dx = control.pointer.x - control.pointer.px ; control.pointer.dy = control.pointer.y - control.pointer.py ;

						var collection = [ ];

						traverse( collection , control.root.children , 0 , 0 , control.pointer.x , control.pointer.y );
						
						/* TODO 
						 * when mouse is dragged outside of a controller and passes through another controller, this controller gets activated.
						 * to avoid this behavior, only register the dragged controller when traversing and ignore all others.
						 */

						if(evt instanceof KeyboardEvent) {
							/* key events */
							for(c in control.controllers) {
								if ( m in control.controllers[ c ] ) {
									control.controllers[ c ][ m ]( evt );
								}
							}
						} else if (evt instanceof MouseEvent){
						/* mouse events */
							//for(item in collection) {
								if(collection.length > 0) {
									var item = collection.pop();							
									var c = item.controller.name;
									if ( m in control.controllers[ c ] ) {	
										var pointer = { 	type: m,
															ax: control.pointer.x , 
															ay: control.pointer.y , 
															apx: control.pointer.px ,  
															apy: control.pointer.py , 
															rx: item.x , 
															ry: item.y , 
															dx: control.pointer.dx ,  
															dy: control.pointer.dy 
														}

										control.controllers[ c ][ m ]( pointer );
										control.controllers[ c ]['callback'].map( function( item ) { if(m==item.ev) { item.fn( pointer )} } );
										collection = [];
									}

									if (evt instanceof WheelEvent) { /* Chrome */
										/* http://phrogz.net/JS/wheeldelta.html */
										console.log( "mouseWheel event detected (1) : " + evt +" / "+ c );
									}
								}
							//}
							
						} else {
							if (evt instanceof WheelEvent) { /* Safari */
								/* http://phrogz.net/JS/wheeldelta.html */
								if(collection.length > 0 ) {
									var item = collection.pop();							
									var c = item.controller.name;
									console.log( "mouseWheel event detected (2) : " + evt +" / "+c);
								}
							}
						}
						// else if (evt instanceof TouchEvent){
						// 	/* tbd, does cause a breakpoint in Safari */
						// }
                	});
            	})( this , this.target , events[ e ] , eventDests[ events[ e ] ] );
        	}

        	var inside = function( mx , my , x0 , y0 , x1 , y1 ) { return ( mx > x0 && mx < x1 && my > y0 && my < y1 ); }

        	var traverse = function( col , a , x0 , y0 , mx , my ) {
        			for(c in a) {
	        			var x = x0 + a[ c ].x;
    	    			var y = y0 + a[ c ].y;
        				var b =  ( !a[ c ].state.visible ) ? false : inside( mx , my , x , y + a[ c ].yoff , x + a[ c ].getWidth() , y + a[ c ].getHeight() );
        				b = ( a[ c ].state.active ) ? true : b;
        				if( b ) { col.push( { controller: a[ c ], x: mx - x, y: my - y } ) };
        				if(a[ c ].state.open ) { traverse( col ,  a[ c ].children , x , y , mx , my ); }	
        			}
        	}
			
			
        	this.add = function( c ) {
            	this.controllers[ c.name ] = c ;
            	c.parent = this.root;
            	this.root.children.push( c );
            	return c;
	        }

	        this.remove = function( c ) {
	        	c.parent.remove( c );
	        	this.controllers.splice( this.controllers.indexOf( c ) , 1 );
            	return this;
	        }

			this.draw = 	function ( papplet ) {  }
			this.preDraw = 	function ( papplet ) { }
			this.postDraw = function ( papplet ) { papplet.textFont( this.font ); this.root.draw( papplet ); }
		}

		C.papplet = function ( ) { return cp5.papplet; }
        C.font = 	function ( ) { return cp5.font; }
		C.pointer = function ( c ) { return cp5.pointer; }		
		C.add = 	function ( c ) { return cp5.add( c ); }
        C.get = 	function ( c ) { return cp5.controllers[ c ]; }
        
        C.remove = 	function ( c ) { return cp5.remove( c ); }
        C.test = 	function ( m , v ) { var target = opts.papplet; C.invoke( target , m , v ); }
        C.event = 	function ( ev ) { var target = opts.papplet; var method = 'controlEvent'; C.invoke( target , method , ev ) ; }
		C.make = 	function ( t ) { cp5 = new C({ target: t.externals.canvas, papplet: t }); }
        C.invoke = 	function ( target , method , event ) {
        	if( ! ( target == undefined ) ) {
        		if ( ! ( target[method] == undefined ) ) {
        			if(event==undefined) {
						target[method]( );
        			} else {
        				target[method](event);
        			}
        		}
        	}
        }

	return C;
})();
	
	
	var CENTER			= 3
	var LEFT			= 37
	var RIGHT			= 39
	var TOP				= 101
	var BOTTOM			= 102
	var BASELINE		= 0
	var UP 				= 38
	var DOWN 			= 40
	var LEFT_OUTSIDE 	= 10
	var RIGHT_OUTSIDE 	= 11
	var TOP_OUTSIDE 	= 12
	var BOTTOM_OUTSIDE 	= 13

	var clip 		= function ( theValue , theMin , theMax ) { return theValue < theMin ? theMin : ( theValue > theMax ? theMax : theValue ); }
	var norm 		= function ( theValue , theStart , theStop ) { return ( theValue - theStart ) / ( theStop - theStart ); }
	var map 		= function ( theValue ,theStart0 , theStop0 , theStart1 , theStop1 ) { return theStart1 + ( theStop1 - theStart1 ) * ( ( theValue - theStart0 ) / ( theStop0 - theStart0 ) ); }
	var constrain 	= function ( theValue , theStart0 , theStop0 , theStart1 , theStop1 ) { return clip( map( theValue , theStart0 , theStop0 , theStart1 , theStop1 ) , theStart1 , theStop1 ); }
	var remove 		= function ( theArray , theItem ) { if( theArray.indexOf( theItem ) > -1 ) { theArray.splice(theArray.indexOf( theItem ) , 1 ); } }
	var add 		= function ( theArray , theItem ) { theArray.push( theItem ); }

	/* Root */

	var Root = Class.extend({
		children: [ ]
		, x: 0
		, y: 0
		, draw: 	function ( p ) { p.pushStyle(); for ( var c in this.children ) { this.children[ c ].draw( p ); }; p.popStyle();	 }
		, remove: 	function ( elem ) { this.children.splice( this.children.indexOf( elem ) , 1 ); }
	});

		
	/* ControlListener */
	var ControlListener = Class.extend({
		controlEvent: function( l ) { }
	});

		
	/* ControlView */
	var ControllerView = Class.extend({
		display: function( p , c ) { }
	});

	/* Label */
	var Label = Class.extend({
		alignX: LEFT
		, alignY: CENTER
		, text: ""
		, x: 0
		, y: 0
		, init: function( theIndex ) { this.margin = {top:0, right:0, bottom:0, left:0 }  }
		, align: function( x , y ) { this.alignX = x; this.alignY = y; return this; }
		, set: function( s ) { this.setText( s ); return this; }
		, setText: function( s ) { this.text = s; return this; }
		, getText: function( s ) { return this.text; }
		, setMargin: function( which , value ) { this.margin[which] = value; console.log(this.margin); return this; }
		, draw: function( p , c ) { 

			var x = 0
			var ax = this.alignX
			switch(this.alignX) {
				case(CENTER) : x = c.getWidth() / 2; break;
				case(RIGHT_OUTSIDE) : ax = LEFT; x = c.getWidth() + this.margin.left; break;
				case(RIGHT) : x = c.getWidth() - this.margin.right; break;
				case(LEFT_OUTSIDE) : ax = RIGHT; x = - this.margin.right; break;
				case(LEFT) : x = this.margin.left; break;
			}

			var y = 0;
			var ay = this.alignY;
			switch(this.alignY) {
				case(CENTER) : y = c.getHeight() / 2; break;
				case(BOTTOM_OUTSIDE) : ay = TOP; y = c.getHeight() + this.margin.bottom; break;
				case(BOTTOM) : y = c.getHeight() - this.margin.bottom; break;
				case(TOP_OUTSIDE) : ay = BOTTOM; y = this.margin.top; break;
				case(TOP) : y = this.margin.top; break;
			}


			txtalign( p , this.getText() , x , y , ax , ay  );
		}
	});

	/* Controller */
	var Controller = Class.extend({
		init: function( theIndex ) {
			this.view 				= new ControllerView();
			this.event 				= { };
			this.x 					= 0;
			this.y 					= 0; 
			this.yoff 				= 0; /* necessary for groups, the group's bar is in the negative for the y position */
			this.value 				= 0;
			this.name 				= theIndex;
			this.label 				= theIndex;
			this.decimalPrecision 	= 1
			this.valueLabel 		= new Label().set( theIndex )
			this.captionLabel 		= new Label().set( theIndex )
			this.state 				= { broadcast: 	true
										, inside: 	false 
										, visible: 	true
										, active: 	false
										, pressed: 	false
										, dragged: 	false 
										, open: 	true
									}

			this.color 				= { colorBackground: 		0xff003652
										, colorForeground: 		0xff009bd7
										, colorActive: 			0xff00c5ff
										, colorCaptionLabel: 	0xffffffff
										, colorValueLabel: 		0xffffffff
									}				

			this.event 				= { onLeave: 	 		function( c , pointer ) { } 
									  , onEnter:  			function( c , pointer ) { } 
									  , onMove:  			function( c , pointer ) { } 
									  , onStartDrag:  		function( c , pointer ) { } 
									  , onDrag:  			function( c , pointer ) { } 
									  , onEndDrag:  		function( c , pointer ) { } 
									  , onPress: 			function( c , pointer ) { } 
									  , onRelease: 			function( c , pointer ) { } 
									  , onReleaseOutside: 	function( c , pointer ) { }
									  , onWheel: 			function( c , pointer ) { } 
									}

			this.callback 			= [ ];

			this.listeners 			= [ ];

			this.children 			= [ ];

			this.parent 			= undefined;

			this.id 				= -1;

			this.setup( );

		} 

		, draw: function( p ) {
			if(this.state.visible) { 
				p.pushMatrix( );
				p.pushStyle();
				p.translate( this.x , this.y ); 
				this.view.display( p , this );
				if(this.state.open) {	
					for( var c in this.children ) { this.children[ c ].draw( p ); }
				}
				p.popStyle();
				p.popMatrix( ); 
			}
		}
		, broadcast: function ( ) { 
			if( this.state.broadcast ) { 
				var ev = new ControlEvent( this ); 
				C.event( ev ); 
				C.test( this.getName() , this.getValue() ); 
				this.listeners.map( function( item ) { C.invoke( item , 'controlEvent' , ev ) } ); 
			} 
		}
		, addCallback:			function ( c , ev , fn ) { this.callback.push( {'c':c , 'ev':ev , 'fn':fn } ); return this; }
		, addListener: 			function( l ) { add( this.listeners , l ); return this; }
		, removeListener: 		function( l ) { remove( this.listeners , l ); return this; }
		, setup:  				function ( ) { }
		, setPosition: 			function ( theX , theY ) { this.x = theX; this.y = theY; return this; }
		, setSize: 				function ( theW , theH ) { this.setWidth( theW ); this.setHeight( theH ); return this; }
		, setWidth: 			function ( theW ) { this.width = theW; return this; }
		, setHeight: 			function ( theH ) { this.height = theH; return this; }
		, setCaptionLabel: 		function ( theString ) { this.label = theString; return this; }
		, inside: 				function ( theX0 , theY0 ) { return (theX0 >= 0 && theX0 <= ( this.getWidth( ) )  && theY0 >= 0 + this.yoff && theY0 <= ( this.getHeight( ) ) ) ; }
		, setColorActive: 		function ( theCol ) { this.color.colorActive = theCol; return this; }
		, setColorBackground: 	function ( theCol ) { this.color.colorBackground = theCol; return this;}
		, setColorForeground: 	function ( theCol ) { this.color.colorForeground = theCol; return this; }
		, setColorCaptionLabel: function ( theCol ) { this.color.colorCaptionLabel = theCol; return this; }
		, setColorValueLabel: 	function ( theCol ) { this.color.colorValueLabel = theCol; return this; }
		, getColor: 			function ( ) { return this.color; }
		, getId: 				function ( ) { return this.id; }
		, getName: 				function ( ) { return this.name; }
		, getValue: 			function ( ) { return this.value; }
		, getWidth: 			function ( ) { return this.width; }
		, getHeight: 			function ( ) { return this.height; }
		, getDecimalPrecision: 	function ( ) { return this.decimalPrecision; } 
		, getView: 				function ( ) { return this.view; }
		, setValue: 			function ( val ) { this.value = val; return this; }
		, setVisible: 			function ( b ) { this.state.visible = ( b == true ) ? true : false ; return this; } 
		, setDecimalPrecision: 	function ( i ) { this.decimalPrecision = i; } 
		, setId: 				function ( theId ) { this.id = theId; return this; } 
		, moveTo: 				function ( theParent ) { this.parent.remove( this ); this.parent = theParent; theParent.children.push( this ) ; return this; }
		, remove: 				function ( theElement ) { this.children.splice(this.children.indexOf( theElement ), 1); }
		, hide: 				function ( ) { this.state.visible = false; return this; }
		, show: 				function ( ) { this.state.visible = true; return this; }
		, setCaptionLabel: 		function ( theLabel ) { this.captionLabel.set( theLabel ); return this; }
		, setBroadcast: 		function ( b ) { this.state.broadcast = (b === true) ? true : false; return this; } 
		, setView: 				function ( theView ) { this.view = theView; return this; }
		, remove: 				function ( ) { C.remove( this ); } 
		, isVisible: 			function ( ) { return this.state.visible; } 
		, mousePressed: 		function ( pointer ) { this.event.onPress( this , pointer ); this.state.pressed = true ; }
		, mouseReleased: 		function ( pointer ) { if( this.state.dragged ) { this.onEndDrag( pointer ) } else { this.event.onRelease( this , pointer ); }; if(!this.state.inside) { this.event.onReleaseOutside( this , pointer ); this.state.active = false; }  this.state.dragged = false ; this.state.pressed = false ;  }
		, onDrag: 				function ( pointer ) { if( !this.state.dragged ) { this.onStartDrag( pointer ) }; this.event.onDrag( this , pointer ); this.state.dragged = true ; }
		, onMove: 				function ( pointer ) { this.event.onMove( this , pointer ); }
		, onStartDrag: 			function ( pointer ) { this.event.onStartDrag( this , pointer ); }
		, onEndDrag: 			function ( pointer ) { this.event.onEndDrag( this , pointer ); }
		, onEnter: 				function ( pointer ) { this.event.onEnter( this , pointer ); }
		, onLeave: 				function ( pointer ) { this.event.onLeave( this , pointer ); }
		, mouseMoved: 			function ( pointer ) {
			this.state.inside = this.inside( pointer.rx , pointer.ry );
			this.onMove( pointer );
			if ( this.state.active && this.state.pressed ) {
				this.onDrag( pointer );
			} else {
				if ( this.state.active != this.state.inside ) { if ( this.state.active ) {  this.onLeave( pointer ); } else { this.onEnter( pointer ); } }
				this.state.active = this.state.inside;
			}
		} 
		, setImage: 			function( ) { console.log("setImage is not implemented for this controller."); }
		, setView: 				function ( theView ) { return this; }
	});
	

	/* Slider */
	var Slider = Controller.extend({
		normalized: 0
		, min: 0
		, max: 100
		, setup: function( ) { 

			this.captionLabel.align( RIGHT_OUTSIDE , CENTER ).setMargin('left' , 4 );

			this.valueLabel.align( LEFT , CENTER ).setMargin( 'left' , 4 );

			this.view.display = function( p , c ) {
				p.noStroke(); 
				p.fill( c.color.colorBackground ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) ); 
				p.noStroke(); 
				p.fill( c.state.inside | c.state.dragged ? c.color.colorActive : c.color.colorForeground ); 
				p.rect( 0 , 0 , c.getWidth( ) * c.normalized , c.getHeight( ) );
				p.fill( c.color.colorValueLabel );
				c.valueLabel.set( c.getValue().toFixed( c.getDecimalPrecision( ) ) );
				c.valueLabel.draw( p , c );
				p.fill( c.color.colorCaptionLabel ); 
				c.captionLabel.draw( p , c );
			}

			this.event['onPress'] = function( c , pointer ) { 
				c.normalized = constrain( pointer.rx, 0 , c.getWidth( ) , 0 , 1 ) ;
				c.state.active = true ; 
				c.broadcast( ); 
			}

			this.event['onDrag'] = 	function( c , pointer ) { 
				c.normalized = constrain( pointer.rx , 0 , c.getWidth( ) , 0 , 1 ) ; 
				c.broadcast( ) ; 
			}
		}
		
		, getValue: function ( ) { return map( this.normalized , 0 , 1 , this.min , this.max ) ; }
		, setRange: function ( theMin , theMax ) { this.min = theMin ; this.max = theMax ; return this ; }
	});
	

	/* Button */
	var Button = Controller.extend({

		setup: function( ) {

			this.view.display = function( p , c ) {
				p.noStroke( ); 
				p.fill( c.state.inside |  c.state.dragged ? ( c.state.pressed |  c.state.dragged ? c.color.colorActive : c.color.colorForeground ) : c.color.colorBackground ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) );
			
				p.fill( c.color.colorCaptionLabel ); 
				txtalign( p , c.label.toUpperCase() , c.getWidth() / 2 , c.getHeight() / 2 , p.CENTER , p.CENTER );
			}

			this.event['onPress'] = function( c , pointer ) { c.broadcast( ); }
		}
		, setImage: function ( img ) {
			this.setSize( img.width , img.height );
			this.view['image'] = function( p , c ) { if( c.getWidth( )==0 ) { c.setSize( img0.width , img0.height ); } p.image(img, 0 , 0); } 
			this.seq = [ 'image' ];

		} 
		, setImages: function ( img0, img1, img2 ) {
			this.setSize( img0.width , img0.height );
			this.view.display = function( p , c ) {
				if( c.getWidth( )==0 ) { c.setSize( img0.width , img0.height ); }
				if( c.state.active ) { if(c.state.pressed) { p.image( img2 , 0 , 0 ); } else { p.image( img1 , 0 , 0 ); } } else { p.image( img0 , 0 , 0 ); }
			}
		}
	});


	/* Toggle */
	var Toggle = Button.extend({

		setup: function( ) {

			this.value = 0;

			this.captionLabel.align( CENTER , CENTER );

			this.view.display = function( p , c ) {
				p.noStroke( ); 
				p.fill( ( c.getValue() == 0 ) ? c.state.inside ? c.color.colorForeground : c.color.colorBackground : c.color.colorActive ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) ); 

				p.fill( c.color.colorCaptionLabel ); 
				c.captionLabel.draw( p , c );
			}

			this.event['onPress'] = function( c , pointer ) { 
				c.setValue( (c.getValue() == 0) ? 1 : 0 ) ; 
				c.broadcast( ); 
			}
		}
	});


	/* Bang */
	var Bang = Button.extend({

		setup: function( ) {

			this.value = undefined;

			this.view.display = function( p , c ) {
				p.noStroke( ); 
				p.fill( ( c.state.pressed ) ? c.color.colorActive : c.color.colorBackground ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) ); 
			
				p.fill( c.color.colorCaptionLabel ); 
				txtalign(p, c.label , c.getWidth() / 2 , c.getHeight() / 2 , p.CENTER , p.CENTER );
			}

			this.event['onPress'] = function( c , pointer ) {
				c.broadcast( ); 
			}
		}	
	});


	/* Numberbox */
	var Numberbox = Controller.extend({
		min: -100
		, max: 100
		, setup: function( ) {

			this.value = 0;

			this.view.display = function( p , c ) {
				p.noStroke( ); 
				p.fill( c.color.colorBackground ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) ); 
				p.fill( ( c.state.pressed ) ? c.color.colorActive : c.color.colorForeground );
				var h = c.getHeight() / 2;
				p.triangle( 0 , h - 6 , 6 , h , 0 , h + 6 );
			
				p.fill( c.color.colorValueLabel ); 
				c.valueLabel.set( c.getValue().toFixed( c.getDecimalPrecision( ) ) );
				c.valueLabel.draw( p , c );
			
				p.fill( c.color.colorCaptionLabel ); 
				c.captionLabel.draw( p , c );
			}

			this.event['onPress'] = function( c , pointer ) {
				c.broadcast( ); 
			}

			this.event['onDrag'] = 	function( c , pointer ) { 
				c.value += pointer.dy;
				c.value = Math.min( c.max , Math.max( c.min , c.value ) );
				c.broadcast( ) ; 
			}
		}
		
		, setRange: function ( theMin , theMax ) { this.min = theMin ; this.max = theMax ; return this ; }	
	});



	/* Slider2D */
	var Slider2D = Controller.extend({
		cursorX: 0
		, cursorY: 0
		, cursorWidth: 10
		, cursorHeight: 10
		, isCrosshairs: true
		, minX: 0
		, minY: 0
		, maxX: 100
		, maxY: 100
		, setup: function( ) {

			this.value = 0;

			this.view.display = function( p , c ) {
				p.noStroke( ); 
				p.fill( c.color.colorBackground ); 
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) ); 
			
				p.noStroke( ); 
				p.fill( c.state.dragged ? c.color.colorActive : c.color.colorForeground ); 
				p.rect( c.cursorX , c.cursorY , c.cursorWidth , c.cursorHeight ); 
			
				p.fill( c.color.colorValueLabel ); 
				c.valueLabel.set( c.getValue()['x'].toFixed( c.getDecimalPrecision( ) ) );
				c.valueLabel.draw( p , c );
			
				p.fill( c.color.colorCaptionLabel ); 
				c.captionLabel.draw( p , c );
			}

			this.event['onPress'] = function( c , pointer ) {
				//this.event['onDrag']( c, pointer );
			}

			this.event['onDrag'] = 	function( c , pointer ) { 
				c.cursorX = Math.max( 0, Math.min( pointer.rx , c.getWidth() - c.cursorWidth ) );
				c.cursorY = Math.max( 0, Math.min( pointer.ry , c.getHeight() - c.cursorHeight ) );
				c.broadcast( ) ; 
			}
		}
		, getValue: function( ) {return { 'x' : map( this.cursorX , 0 , this.getWidth()-this.cursorWidth , this.minX , this.maxX ) , 'y' : map( this.cursorY , 0 , this.getHeight()-this.cursorHeight , this.minY , this.maxY) }; }
		, setRange: function( theMinX , theMaxX , theMinY , theMaxY ) { this.minX = theMinX ; this.maxX = theMaxX ; this.minY = theMinY ; this.maxY = theMaxY ; return this ; }
		, setMinX: function( theMinX ) { this.minX = theMinX; return this; }
		, setMinY: function( theMinY ) { this.minY = theMinY; return this; }
		, setMaxX: function( theMaxX ) { this.maxX = theMaxX; return this; }
		, setMaxY: function( theMaxY ) { this.maxY = theMaxY; return this; }
		, getMinX: function( ) { return this.minX; }
		, getMinY: function( ) { return this.minY; }
		, getMaxX: function( ) { return this.maxX; }
		, getMaxY: function( ) { return this.maxY; }
		, getCursorX: function( ) { return this.cursorX; }
		, getCursorY: function( ) { return this.cursorY; }
		, getCursorWidth: function( ) { return this.cursorWidth; }
		, getCursorHeight: function( ) { return this.cursorHeight; }
		, disableCrosshair: function( ) { this.isCrosshairs = false; return this; }
		, enableCrosshair: function( ) { this.isCrosshairs = true; return this; }
	});



	var Knob = Controller.extend({
		normalized: 0
		, min: 0
		, max: 100
		, startAngle: Math.PI / 2 + Math.PI * 0.25
		, angleRange:  Math.PI + Math.PI / 2
		, setup: function( ) {

			this.view.display = function( p , c ) {

				p.noStroke( ); 
				p.ellipseMode(p.CENTER);
				p.fill( c.color.colorBackground ); 
				p.ellipse( c.getWidth( ) / 2 , c.getHeight( ) / 2 , c.getWidth( ) , c.getHeight( ) );

				p.fill( ( c.state.pressed ) ? c.color.colorActive : c.color.colorForeground );
				p.arc( c.getWidth( ) / 2 , c.getHeight( ) / 2 , c.getWidth( ) , c.getHeight( ) , c.startAngle , c.startAngle + c.angleRange * 0.01 ); 
				p.arc( c.getWidth( ) / 2 , c.getHeight( ) / 2 , c.getWidth( ) , c.getHeight( ) , c.startAngle , c.startAngle + map( c.normalized , 0 , 1 , 0 , c.angleRange ) ); 
				p.fill( c.color.colorBackground ); 
				p.ellipse( c.getWidth( ) / 2 , c.getHeight( ) / 2 , c.getWidth( ) * 0.75 , c.getHeight( ) * 0.75 ); 

				p.fill( c.color.colorCaptionLabel ); 
				txtalign(p, c.getValue().toFixed( c.getDecimalPrecision( ) ) , c.getWidth() / 2 , c.getHeight() / 2 , p.CENTER , p.CENTER );
			
				p.fill( c.color.colorValueLabel ); 
				txtalign(p, c.label , c.getWidth() / 2 , c.getHeight() + 2 , p.CENTER , p.TOP );
			}

			this.event['onPress'] = function( c , pointer ) { 
				c.normalized = constrain( pointer.rx, 0 , c.getWidth( ) , 0 , 1 ) ;
				c.state.active = true ; 
				c.broadcast( ); 
			}

			this.event['onDrag'] = 	function( c , pointer ) { 
				c.normalized = constrain( pointer.rx , 0 , c.getWidth( ) , 0 , 1 ) ; 
				c.broadcast( ) ; 
			}

		}
		, setRadius: function( theRadius ) { this.setSize( theRadius * 2 , theRadius * 2 ); return this; }
		, getValue: function ( ) { return map( this.normalized , 0 , 1 , this.min , this.max ) ; }
		, setRange: function ( theMin , theMax ) { this.min = theMin ; this.max = theMax ; return this ; }	
	});


	/* Listbox */

	var ListBox = Controller.extend( {

		setup: function( ) {

			this.state.open 	= true;
			this.barHeight 		= 20;
			this.items 			= [ ];
			this.itemHeight 	= 30;
			this.itemHover 		= -1;
			this.itemIndex 		= 0;
			this.itemRange 		= 6;


			for(var i = 0 ; i<100;i++ ) {
				this.items.push("item "+i);
			}



			var listboxitem = function ( p , c , i ) {
				p.fill( c.color.colorBackground , (i==c.itemHover ? 255 : 120 ) );
				p.rect( 0 , 0 , c.getWidth( ), c.itemHeight - 1 );
				p.fill( c.color.colorCaptionLabel );
				p.text( c.items[ i ] , 4 , 20 );
			}

			this.view.display = function( p , c ) {

				p.noStroke( ); 
				p.fill( c.color.colorBackground );
				p.rect( 0 , 0 , c.getWidth( ) , c.barHeight );
			
				p.fill( c.color.colorForeground );
				p.pushMatrix();
				p.translate( c.getWidth( ) - 8 , c.barHeight / 2  -2 );
				if( c.state.open ) { p.triangle( -3 , 0 , 3 , 0 , 0 , 3 ); } else { p.triangle( -3 , 3 , 3 , 3 , 0 , 0 ); }
				p.popMatrix();
			
				p.fill( 255 ); 
				txt(p, c.label , 4 , 15 ); /* TODO */
			
				if( c.state.open ) {
					p.fill( c.color.colorBackground , 120 );
					p.rect( 0 , c.barHeight , c.width , c.getHeight( ) - c.barHeight );
					p.pushMatrix();
					p.translate( 0 , c.barHeight + 1 );
					for(var i = c.itemIndex; i < ( c.itemIndex + c.itemRange ) ; i++ ) {
						listboxitem( p , c , i );
						p.translate( 0 , c.itemHeight );
					}
					p.popMatrix( );
				}
			
				if(c.state.active && c.state.open) {
					p.fill( c.color.colorForeground , 120 );
					p.pushMatrix();
					p.translate( c.width - 8 , c.barHeight + 4 );
					var len = 20;
					var pos = Math.floor( map( c.itemIndex, 0, c.items.length, 0, c.getHeight( ) - c.barHeight - len ) );
					p.rect( 0 , pos , 4, len );
					p.popMatrix();
				}
			}

			
			this.event['onRelease'] = function( c , pointer ) { 
				var n = Math.floor( ( pointer.ry - c.barHeight ) / c.itemHeight );
				if( n == -1 ) { c.state.open = !c.state.open; c.height = c.state.open ? c.barHeight + c.itemRange * c.itemHeight : c.barHeight; }
				c.setValue( c.itemIndex + n );
				c.broadcast( );
			}

			this.event['onDrag'] = function( c , pointer ) {
				c.itemIndex += pointer.dy * 0.5;
				c.itemIndex = Math.floor( Math.max( 0 , Math.min(c.itemIndex, c.items.length - c.itemRange ) ) );
				c.itemHover = -1;
			}

			this.event['onLeave'] = function( c , pointer ) { c.itemHover = -1; }

			this.event['onEnter'] = this.event['onMove'] = this.event['onEndDrag'] = function( c , pointer ) {
				var n = Math.floor( ( pointer.ry - c.barHeight ) / c.itemHeight );
				c.itemHover = c.itemIndex + n ;
			}

		}
		, setHeight: function( h ) { this.height = this.barHeight + this.itemRange * this.itemHeight; }
	});

	/* Textfield */

	var Textfield = Controller.extend({
		
		strindex : 0

		, setup: function( ) {

			this.text = "";

			this.strindex = 0;

			this.captionLabel.align(LEFT , BOTTOM_OUTSIDE).setMargin('left' , 0 )

			this.valueLabel.setMargin('left' , 4 ).setMargin('right' , 4 )

			this.view.display = function( p , c ) {
				p.noStroke( );
				p.fill( c.state.active ? c.color.colorActive : c.color.colorForeground );
				p.rect( 0 , 0 , c.getWidth( ) , c.getHeight( ) );
				p.fill( c.color.colorBackground );
				p.rect( 1 , 1 , c.getWidth( ) - 2 , c.getHeight( ) - 2 );
			
				p.fill( c.color.colorCaptionLabel );
				c.captionLabel.draw( p , c );
			
				
				var t = c.text;
				n = 0;	

				while(p.textWidth( t ) > ( c.getWidth() - ( c.valueLabel.margin.left + c.valueLabel.margin.right ) ) ) {
					n++; t = t.substring(1, t.length);
				}

				c.valueLabel.set( t );
				p.fill( c.color.colorValueLabel );
				c.valueLabel.draw( p , c );

			}

		} 
		, keyPressed: function ( theKeyEvent ) { 
			if(this.state.active) {
				switch(theKeyEvent.keyCode) {
					case(13):  this.broadcast(); this.text = ""; this.strindex = 0; break;
					default: this.text += String.fromCharCode( theKeyEvent.charCode ); this.strindex++; break;
				}
			}
		}
		, keyDown: function ( theKeyEvent ) { 
			if(this.state.active) {
				switch(theKeyEvent.keyCode) {
					/* delete is not working in Safari */
					case(8): this.text = this.text.slice(0, Math.max( 0 , this.strindex-1 ) ) + this.text.slice(this.strindex, this.text.len);  this.strindex--; this.strindex = Math.max( 0 , this.strindex); break;
					case(37): this.strindex--; this.strindex = Math.max( 0 , this.strindex ); break;
					case(39): this.strindex++; this.strindex = Math.min( this.text.length , this.strindex ); break;
				}
			}
		}
		, mouseMoved: 		function ( pointer ) { } 
		, mousePressed: 	function ( pointer ) { this.state.active = true ; this.state.pressed = true; }
		, mouseReleased: 	function ( pointer ) { this.color.colorForeground = 0xff009bd7 ; this.state.active = this.inside( pointer.rx , pointer.ry ) ? this.state.active : false ; this.state.pressed = false ; }		

	});
	
	var CheckBox = Controller.extend({
		spacingRow: 1
		, spacingColumn: 1
		, itemsPerRow: -1
		, isMultipleChoice: false
		, itemHeight: 9
		, itemWidth: 9
		, items: [ ]
		, setup: function( ) {

			this.addItem( "a" , "b" );

		} 
		, sayHello: function( ) {
			console.log("hello..");
		}
		, addItem: function( theName , theValue ) {
			var target = this;
			var t = C.add( new Toggle( this.name+"-"+theName ).setSize( this.itemWidth , this.itemHeight ).setPosition( 0 , 0 ) ).setCaptionLabel( theName );
			t.captionLabel.align( RIGHT_OUTSIDE , CENTER ).margin.left = 4;
			t.addCallback( t , 'mouseReleased' , function( ev ) { target.sayHello(); } );
			t.moveTo( this );
			return this;
		}
	});

	var Group = Controller.extend({

		setup: function( ) {

			this.state.open = true;

			this.barHeight = 20;

			this.yoff = -this.barHeight;

			this.captionLabel.align( LEFT , TOP ).setMargin('left' , 4 ).setMargin( 'top' , -this.barHeight + 4 );


			this.view.display = function( p , c ) {
				if( c.state.open ) {
					p.fill(c.color.colorBackground , 100);
					p.noStroke();
					p.rect(0 , 0 , c.getWidth() , c.getHeight() );
				}
			
				p.noStroke( ); 
				p.fill( c.color.colorBackground );
				p.rect( 0 , -c.barHeight , c.getWidth() , c.barHeight );
			
				p.fill( c.color.colorForeground );
				p.pushMatrix();
				p.translate( c.width - 8 , -c.barHeight / 2  -2 );
				if( c.state.open ) { p.triangle( -3 , 0 , 3 , 0 , 0 , 3 ); } else { p.triangle( -3 , 3 , 3 , 3 , 0 , 0 ); }
				p.popMatrix();
			
				p.fill( this.colorCaptionLabel ); 
				c.captionLabel.draw( p , c );
			}

			this.event['onRelease'] = 	function( c , pointer ) {  c.state.open = pointer.ry >= 0 ^ !c.state.open;  }
			this.event['onDrag'] = 		function( c , pointer ) {  c.x += pointer.dx; c.y += pointer.dy; }
		}
		, getHeight: function() { return (this.state.open ? this.height : 0 ); }
	});

	

	// DropdownList, ListBox
	// Tab, Group
	// Slider2D
	// Textfield
	// Range
	// CheckBox, RadioButton
	// Numberbox

	// Callback
	// ControllerPlug
	// ControllerView
	// Canvas

	var ControlEvent = Class.extend({
		c: undefined
		, init: 			function ( c ) { this.c = c; } 
		, getValue: 		function ( ) { return this.c.getValue(); }
		, getController: 	function ( ) { return this.c; }
		, getGroup: 		function ( ) { return this.c; }
		, getName: 			function ( ) { return this.c.getName( ); }
		, getId: 			function ( ) { return this.c.getId( ); }
		, isFrom: 			function ( cc ) {  if(C.get( cc ) !== undefined ) { return C.get( cc ).getName( ) === this.c.getName( ); } return this.c === cc;  }
	});


	var ControlP5 = Class.extend({
	
		init: 					function ( t ) { C.make( t ); } 
		, addSlider: 			function ( theIndex ) { return C.add( new Slider( theIndex ).setPosition( 0 , 0 ).setSize( 100 , 15 ) ); } 
		, addButton: 			function ( theIndex ) { return C.add( new Button( theIndex ).setPosition( 0 , 0 ).setSize( 50 , 30 ) ); } 
		, addBang: 				function ( theIndex ) { return C.add( new Bang( theIndex ).setPosition( 0 , 0 ).setSize( 50 , 30 ) ); }
		, addToggle: 			function ( theIndex ) { return C.add( new Toggle( theIndex ).setPosition( 0 , 0 ).setSize( 40 , 20 ) ); }  
		, addNumberbox: 		function ( theIndex ) { return C.add( new Numberbox( theIndex ).setPosition( 0 , 0 ).setSize( 100 , 20 ) ); }  
		, addRange: 			function ( theIndex ) { } /* TODO */
		, addKnob: 				function ( theIndex ) { return C.add( new Knob( theIndex ).setPosition( 0 , 0 ).setSize( 40 , 40 ) ); }  
		, addSlider2D: 			function ( theIndex ) { return C.add( new Slider2D( theIndex ).setPosition( 0 , 0 ).setSize( 50 , 50 ) ); }  
		, addTextfield: 		function ( theIndex ) { return C.add( new Textfield( theIndex ).setPosition( 0 , 0 ).setSize( 200 , 20 ) ); }
		, addRadioButton: 		function ( theIndex ) { } /* TODO */
		, addCheckBox: 			function ( theIndex ) { return C.add( new CheckBox( theIndex ).setPosition( 0 , 0 ).setSize( 200 , 20 ) ); }
		, addTab: 				function ( theIndex ) { } /* TODO */
		, addGroup: 			function ( theIndex ) { return C.add( new Group( theIndex ).setPosition( 0 , 0 ).setSize( 200 , 200 ) ); }  
		, addDropdownList: 		function ( theIndex ) { } /* TODO */
		, addListBox: 			function ( theIndex ) { return C.add( new ListBox( theIndex ).setPosition( 0 , 0 ).setSize( 200 , 185 ) ); }
		, addCanvas: 			function ( theIndex ) { } /* TODO */
		, get: 					function ( theIndex ) { return C.get( theIndex ); }
		, getAll: 				function ( ) { return C.get( ).controllers; }
		, getAll: 				function ( theType ) { /* returns a list of all registered controllers of type theType */ }
		, getFont: 				function ( ) { return C.get( ).font; }
		, getListener: 			function ( theIndex )  { } /* TODO */
		, getValue: 			function ( theIndex ) {return C.get( theIndex ).getValue( ); } 
		, isAutoDraw: 			function ( ) { return true; }
		, isMouseOver: 			function ( ) { return false; }
		, isMouseOver: 			function ( theController ) { return false; }
		, isMoveable: 			function ( ) { return true ;}
		, isShortcuts: 			function ( ) { return false; } 
		, addCallback: 			function ( theListener ) { }
		, addCanvas: 			function ( theCanvas ) { } 
		, remove: 				function ( theIndex ) { } 
		, removeCallback: 		function ( theController ) { } 
		, removeCanvas: 		function ( theCanvas ) { } 
		, removeListener: 		function ( theListener ) { }  
		, setBroadcast: 		function ( b ) { } 
		, setMoveable: 			function ( b ) { } 
		, setFont: 				function ( thePFont ) { C.get( ).font = thePFont; return this; }
		, setFont: 				function ( thePFont , theFontsize ) { C.get( ).font = thePFont; C.get( ).fontsize = theFontsize; return this; }
		, setColor: 			function ( theColor ) { return this; }
		, setColorActive: 		function ( theColor ) { return this; }
		, setColorBackground: 	function ( theColor ) { return this; }
		, setColorCaptionLabel: function ( theColor ) { return this; }
		, setColorForeground: 	function ( theColor ) { return this; }
		, setColorValueLabel: 	function ( theColor ) { return this; }
		, disableShortcuts: 	function ( ) { return this; }
		, enableShortcuts: 		function ( ) { return this; }
		, hide: 				function ( ) { return this; } 
		, show: 				function ( ) { return this; } 
		, setAutoDraw: 			function ( b ) { return this; } 
	});

	
	var txtboxed = function( p , theText , theX , theY , theAlignX , theAlignY , theW , theH ) {
		p.pushMatrix( );
		p.translate( theX , theY );
		p.textAlign( theAlignX , theAlignY );
		p.text( theText , 0 , 0 , theW , theH );
		p.popMatrix() ;
	}



	var txtalign = function( p , theText , theX , theY , theAlignX , theAlignY ) {
		p.pushMatrix( );
		p.translate( theX , theY );
		p.textAlign( theAlignX , theAlignY );
		p.text( theText , 0 , 0 );
		p.popMatrix() ;
	}



	var txt = function(  p , theText , theX , theY ) {
		p.pushMatrix( );
		p.translate( theX , theY );
		p.text( theText , 0 , 0 );
		p.popMatrix() ;
	}
	

};



// function numDecimals(x) {
//     x = x.toString();
//     if (x.indexOf('.') > -1) {
//       return x.length - x.indexOf('.') - 1;
//     } else {
//       return 0;
//     }
//   }


//, setSize: 			function ( theW, theH ) { this.buffer = C.papplet( ).createGraphics( theW - 8 , theH); return this._super(theW, theH); } 

				// c.buffer.beginDraw();
				// c.buffer.background( c.colorBackground );
				// c.buffer.smooth();
				// c.buffer.textFont( C.font( ));
				// var off = -p.max( 0 , p.textWidth( c.text ) - c.buffer.width );
				// c.buffer.fill( 255 );
				// c.buffer.text(c.text ,  off , c.height/2 + 5 );
				// c.buffer.endDraw();
				// p.image(c.buffer, 4 , 0 );