# ControlP5

ControlP5 is a library written by Andreas Schlegel for the programming environment [Processing](http://www.processing.org). ControlP5 is a GUI and controller library for processing that can be used in authoring, application mode.

The range of available controllers includes Slider, Button, Toggle, Knob, Textfield, RadioButton, Checkbox, Lists amongst others. These controllers can be easily added to a processing sketch, or displayed inside a separate control window. They can be organized in tabs or groups as well as rendered into PGraphics buffers. The state of a controller can be saved to file in JSON format.


## Getting Started

To get started, a simple example that demonstrates how to create a slider and automatically link its value to variable v1.

```java

	import controlP5.*;

	ControlP5 cp5;
	int v1;

	void setup() {
		size(400,400);  
		noStroke();
		cp5 = new ControlP5(this);
		cp5.addSlider("v1")
		   .setPosition(40,40)
		   .setSize(200,20)
		   .setRange(100,300)
		   .setValue(250)
		   .setColorCaptionLabel(0xff111111);
	}

	void draw() {
		background(0xffdddddd);
		pushMatrix();
		fill(0xffffdc00);
		rect(v1,100,60,200);
		fill(0xff01ff70);
		rect(40,v1,320,40);
		translate(200,200);
		rotate(map(v1,100,300,-PI,PI));
		fill(0xff39cccc);
		rect(0,0,100,100);
		popMatrix();
	}
```


## How does ControlP5 work?


ControlP5 provides a range of controllers, each controller comes with an example which is located inside the examples/controllers folder. This is a good place to get started with ControlP5.

### Instantiate ControlP5

To create an instance of ControlP5, you need to call ControlP5's constructor and pass a reference of your sketch as argument, in most cases this will happen inside setup() and the argument and the argument for the constructor call is _this_, the reference to the current sketch object.

```java

	import controlP5.*;
	ControlP5 cp5;

	void setup() {
		cp5 = new ControlP5(this);
	}
```

Alternatively, ControlP5 can be instantiated from other places as well for example from another object. Here, just as before, you need to pass a sketch reference as argument when instantiating the ControlP5 object.

```java

	import controlP5.*;
	GUI gui;

	void setup() {
		gui = new GUI(this);
	}

	class GUI {
		ControlP5 cp5;
		GUI(ControlP5 theControlP5) {
			cp5 = new ControlP5(theControlP5);
		}
	}
```

### Adding Controllers

To add controllers to a ControlP5 object, use the add function followed by the name of the Controller, for example to add a Slider use cp5.addSlider("mySlider"). Here function addSlider takes one argument which is the unique name of the controller to be added. In case a controller with the same name is already registered with ControlP5, the old controller will be overriden - this is then indicated and printed as a warning message in the console. All default add functions are implemented with class ControlP5Base; have a look at its source code for further reference.

```java

	import controlP5.*;
	ControlP5 cp5;

	void setup() {
		size(400,400);
		cp5 = new ControlP5(this);
		cp5.addSlider("mySlider");
		cp5.addButton("myButton");
	}

	void draw() {}
```

The example above adds 2 controllers to your sketch and renders them on top of your sketch. To adjust the size, position, color, etc. ControlP5 uses [method chaining](http://en.wikipedia.org/wiki/Method_chaining) and [setter](http://en.wikipedia.org/wiki/Mutator_method) functions. For example setPosition(x,y) will change the position of a controller, setSize(width,height) will change the size of a controller; the naming convention is straight forward, a function does what it says,  and the same goes for the other setters and getters as well. For further reference and overview, start with browsing the source code of class Controller and its implementations, furthermore have a look at the documentation.

```java

	import controlP5.*;
	ControlP5 cp5;

	void setup() {
		size(400,400);
		cp5 = new ControlP5(this);
		cp5.addSlider("mySlider").setPosition(20,20).setSize(200,20);
		cp5.addButton("myButton").setPosition(20,60).setSize(100,40);
	}

	void draw() {}
```

### Accessing Controllers

### Event Handling

#### ControlEvent

#### Callbacks

#### Linking a variable or function to a Controller

#### Customised event handling

### Bring a Controller to the front

To change the order of controllers, use Controller.bringToFront() which will position the controller on top of all others. See example [ControlP5bringToFront](examples/use/ControlP5bringToFront/ControlP5bringToFront.pde)

### Grouping Controllers

#### Tab

#### Group

#### Window

### What do all these Controllers do?


  - **Accordion** use an accordion to arrange multiple groups in vertical order
  - **Bang** triggers an event on press without passing a value
  - **Button** triggers an event and passes on a value
  - **ButtonBar** a horizontal multi-button bar
  - **Canvas**
  - CheckBox
  - ColorPicker
  - ColorWheel
  - **DropdownList** (use ScrollableList instead)
  - Group
  - **ListBox** (use ScrollableList instead)  
  - Knob
  - Matrix  
  - Numberbox  
  - RadioButton  
  - Range
  - **ScrollableList**
  - **Slider** a number slider, can be horizontal or vertical
  - Slider2D  
  - Spacer
  - **Tab** arrange controllers inside a range of tabs
  - **Textfield** a field for single line text input
  - **Textarea** a multi line area for text output
  - Textlabel
  - **Toggle** switches between 2 states, true and false.

### What else is there?

  - Chart
  - FrameRate
  - Pointer
  - Println


### Rendering

#### Default rendering

##### Customised rendering

### Saving and loading states

### Removing Controllers

### Deprecated

#### My code worked before now it doesn't anymore

#### Tooltip, MultiList, DropdownList, ListBox



## History

ControlP5 is a project that started in 2006 as a very simple UI for controlling Processing parameters for better debugging, testing and interaction purposes. Starting from only 3 controllers its controller base has grown up to around 30 controllers and over 70 examples. A history of controlP5 versions is available on [google code downloads](https://code.google.com/p/controlp5/downloads/list?can=1&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount). This library has been widely used by processing user in academic, research and professional environments for prototyping and tool development.


### Why is controlP5's source code so convoluted and bloated

ControlP5 has been in development for over 9 years and started as a small GUI library for Processing. Over the years both Processing and ControlP5 have grown substantially and as part of that journey many changes have been applied to both. From a ControlP5 perspective some changes were due to changes made to Processing's API and source code, other changes were due to additional controller implementations, extended functionality, user feedback and reuqests. Since writing controlP5 from scratch was a learning process for myself in itself, a proper initial strategy for the software architecture of the library was missing. When it became apparent that a proper architecture would have made the development much easier and comfortable it was already too late, I had to comply to the piles of code I had created. Would I do things differently now? yes I would.


## Font rendering

Why is the bit-font so blurry? it used to be crisp. Let me blame this on the OpenGL texture rendering. If you have a suggestion or a simple and easy to implement solution, please let me know inside the issues section.



## Javascript

Currently there is no javascript version of ControlP5, though I had started implementing a slimmed down version for processing.js but since it is currently unclear which javascript version - processing.js or p5.js - will become the default js version of processing, controlP5.js is on hold. There is a tendency that p5.js will become the primary javascript environment
