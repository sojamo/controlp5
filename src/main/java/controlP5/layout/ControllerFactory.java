package main.java.controlp5.layout;

import controlP5.*;
import main.java.controlp5.layout.lang.XMLParser;
import processing.core.PApplet;

import java.lang.reflect.Constructor;
import java.util.*;

public class ControllerFactory {
    private final PApplet applet;
    private final ControlP5 cp5;
    private final Map<String, Class<? extends Controller>> controlMap;


    public ControllerFactory(PApplet applet, ControlP5 cp5) {
        this.applet = applet;
        this.cp5 = cp5;


        controlMap = new HashMap<>();
//        controlMap.put("Accordion", Accordion.class);
//        controlMap.put("Background", Background.class);
//        controlMap.put("Canvas", Canvas.class);
//        controlMap.put("ChartData", ChartData.class);
//        controlMap.put("ChartDataSet", ChartDataSet.class);
//        controlMap.put("CheckBox", CheckBox.class);
//        controlMap.put("ColorPicker", ColorPicker.class);
//        controlMap.put("Group", Group.class);
//        controlMap.put("Label", Label.class);
//        controlMap.put("RadioButton", RadioButton.class);
//        controlMap.put("Textarea", Textarea.class);
//        controlMap.put("TickMark", TickMark.class);
//        controlMap.put("Tooltip", Tooltip.class);
        controlMap.put("Bang", Bang.class);
        controlMap.put("Button", Button.class);
        controlMap.put("ButtonBar", ButtonBar.class);
        controlMap.put("Chart", Chart.class);
        controlMap.put("ColorWheel", ColorWheel.class);
        controlMap.put("Icon", Icon.class);
        controlMap.put("Knob", Knob.class);
        controlMap.put("ListBox", ListBox.class);
        controlMap.put("Matrix", Matrix.class);
        controlMap.put("MultiList", MultiList.class);
        controlMap.put("MultilineTextfield", MultilineTextfield.class);
        controlMap.put("Numberbox", Numberbox.class);
        controlMap.put("Range", Range.class);
        controlMap.put("ScrollableList", ScrollableList.class);
        controlMap.put("Slider", Slider.class);
        controlMap.put("Slider2D", Slider2D.class);
        controlMap.put("Spacer", Spacer.class);
        controlMap.put("Textfield", Textfield.class);
        controlMap.put("Textlabel", Textlabel.class);
        controlMap.put("Toggle", Toggle.class);

    }

    /* creates  a controller based on the controlName */
    public Controller<?> createController(String controlName) {
        Class<? extends Controller> controllerClass = controlMap.get(controlName);
        if (controllerClass == null) {
            throw new IllegalArgumentException("Invalid control name: " + controlName);
        }

        try {
            //instantiate the controller
            Constructor<? extends Controller> constructor = controllerClass.getConstructor(ControlP5.class,String.class);
            return constructor.newInstance(cp5,"");
        } catch (Exception e) {
            throw new RuntimeException("Failed to create control: " + controlName, e);
        }
    }

    public Group createGroup(String groupName) {
        return new Group(cp5, groupName);
    };

    public void configure(Controller<?> controller, String attrName, XMLParser.ValueContext attrValueContext) {
        // eg. turn things like '23px' or '35%' into pixels value
        int attrValue = getValue(attrValueContext);

        switch (attrName) {
            case "x":
                controller.setPosition(attrValue, controller.getPosition()[1]);
                break;
            case "y":
                controller.setPosition(controller.getPosition()[0], attrValue);
                break;
            case "width":
                controller.setWidth(attrValue);
                break;
            case "height":
                controller.setHeight(attrValue);
                break;
            case "color":
                // Assuming color value is given as a hex string
                break;
//            case "label":
//                controller.setLabel(attrValue);
//                break;
//            case "visible":
//                controller.setVisible(Boolean.parseBoolean(attrValue));
//                break;
//            case "captionLabel":
//                controller.getCaptionLabel().setText(attrValue);
//                break;
//            case "valueLabel":
//                controller.getValueLabel().setText(attrValue);
//                break;
            default:
                System.out.println("Unknown attribute: " + attrName);
        }
    }

    private int getValue(XMLParser.ValueContext ctx) {
        String unit = ctx.UNIT().getText();
        String value = ctx.NUMBER().getText();

        switch (unit) {
            case "px":
                return Integer.parseInt(value);
            case "%":
                //get tabs
                ControllerList _myTabs = cp5.getWindow().getTabs();

                return (int) (Float.parseFloat(value) / 100.0f * _myTabs.get(0).getWidth());

            default:
                throw new IllegalArgumentException("Unknown unit: " + unit);
        }
    }
}
