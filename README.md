# ControlP5

ControlP5 is a library written by Andreas Schlegel for the programming environment [processing](http://www.processing.org). ControlP5 is a GUI and controller library for processing that can be used in authoring, application mode. 

The range of available controllers includes Slider, Button, Toggle, Knob, Textfield, RadioButton, Checkbox, Lists amongst others. These controllers can be easily added to a processing sketch, or displayed inside a separate control window. They can be organized in tabs or groups as well as rendered into PGraphics buffers. The state of a controller can be saved to file in JSON format.


## Getting Started

To get started, a simple example that will create a slider and automatically link its value to variable v1.

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



## History

ControlP5 is a project that started in 2006 as a very simple UI for controlling Processing parameters for better debugging, testing and interaction purposes. Starting from only 3 controllers its controller base has grown up to around 30 controllers and over 70 examples. A history of controlP5 versions is available at [google code downloads](https://code.google.com/p/controlp5/downloads/list?can=1&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount). This library has been widely used by processing user in academic, research and professional environments for prototyping and tool development.


### Why is controlP5's source code so convoluted and bloated 

ControlP5 has been in development for over 9 years and started as a small GUI library for Processing. Over the years both Processing and ControlP5 have grown substantially and as part of that journey many changes have been applied to both. From a ControlP5 perspective some changes were due to changes made to Processing's API and source code, other changes were due to additional controller implementations, extended functionality, user feedback and reuqests. Since writing controlP5 from scratch was a learning process for myself in itself, a proper initial strategy for the software architecture of the library was missing. When it became apparent that a proper architecture would have made the development much easier and comfortable it was already too late, I had to comply to the piles of code I had created. Would I do things differently now? yes I would. 


## Font rendering

Why is the bit-font so blurry? it used to be crisp. Let me blame this on the OpenGL texture rendering. If you have a suggestion or a simple and easy to implement solution, please let me know inside the issues section.



## Javascript

Currently there is no javascript version of ControlP5, though I had started implementing a slimmed down version for processing.js but since it is currently unclear which javascript version - processing.js or p5.js - will become the default js version of processing, controlP5.js is on hold. There is a tendency that p5.js will become the primary javascript environment 

