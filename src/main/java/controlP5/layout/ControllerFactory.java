package controlP5.layout;

import controlP5.*;

import controlP5.layout.lang.XMLParser;
import processing.core.PApplet;

import java.awt.Color;
import java.lang.reflect.Constructor;
import java.util.*;

public class ControllerFactory {
    private final PApplet applet;
    private final ControlP5 cp5;
    private final Map<String, Class<? extends ControllerInterface<?>>> controlMap;


    public ControllerFactory(PApplet applet, ControlP5 cp5) {
        this.applet = applet;
        this.cp5 = cp5;


        controlMap = new HashMap<>();
        controlMap.put("Accordion", Accordion.class);
        controlMap.put("Background", Background.class);
//        controlMap.put("Canvas", Canvas.class);
//        controlMap.put("ChartData", ChartData.class);
//        controlMap.put("ChartDataSet", ChartDataSet.class);
        controlMap.put("CheckBox", CheckBox.class);
        controlMap.put("ColorPicker", ColorPicker.class);
        controlMap.put("Group", Group.class);
//        controlMap.put("Label", Label.class);
        controlMap.put("RadioButton", RadioButton.class);
        controlMap.put("Textarea", Textarea.class);
//        controlMap.put("TickMark", TickMark.class);
//        controlMap.put("Tooltip", Tooltip.class);

        controlMap.put("Accordion", Accordion.class);
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

    /* creates  a ControllerInterface based on the controllerTypeName */
    public ControllerInterface<?> createController(String controllerTypeName, Deque<LayoutBuilder.ElementProps> propertiesInheritance) {
        /* Class of the desired controller */
        Class<? extends ControllerInterface> controllerClass = controlMap.get(controllerTypeName);

        if (controllerClass == null) {
            throw new IllegalArgumentException("Invalid control name: " + controllerTypeName);
        }

        try {
            //instantiate the controller
            Constructor<? extends ControllerInterface> constructor = controllerClass.getConstructor(ControlP5.class, String.class);

            String uui = UUID.randomUUID().toString();

            ControllerInterface<?> controller = constructor.newInstance(cp5, uui);
            LayoutBuilder.ElementProps parentsProps = propertiesInheritance.peek();


            return controller;

        } catch (Exception e) {
            throw new RuntimeException("Failed to create control: " + controllerTypeName, e);
        }
    }


    public void configure(ControllerInterface<?> controller, HashMap<String, LayoutBuilder.Attribute<?>> attributes,Deque<LayoutBuilder.ElementProps> propertiesInheritance ) {

        LayoutBuilder.ElementProps parentsProps = propertiesInheritance.peek();

        for (Map.Entry<String, LayoutBuilder.Attribute<?>> entry : attributes.entrySet()) {
            String attrName = entry.getKey();
            LayoutBuilder.Attribute<?> attribute = entry.getValue();

            int width = 0;
            int height = 0;
            switch (attrName) {
                case "x":
                    int x = (int) attribute.getValue();
                    controller.setPosition(x, controller.getPosition()[1]);
                    break;
                case "y":
                    int y = (int) attribute.getValue();

                    controller.setPosition(controller.getPosition()[0], y);
                    break;
                case "width":
                    //if attribute has an int inside
                    if (attribute.getValue() instanceof Integer) {
                        width = (int) attribute.getValue();
                        height = controller.getHeight();
                        controller.setSize(width, height);
                    }//if it has a percentage
                    else if (attribute.getValue() instanceof LayoutBuilder.Percentage){
                        LayoutBuilder.Percentage percentage = (LayoutBuilder.Percentage) attribute.getValue();
                        float percentageValue = percentage.percentage;
                        width = (int) ( percentageValue / 100.0f * parentsProps.width);
                        height = controller.getHeight();
                        controller.setSize(width, height);
                    }

                case "height":
                    //if attribute has an int inside
                    if (attribute.getValue() instanceof Integer) {
                        height = (int) attribute.getValue();
                        width = controller.getWidth();
                        controller.setSize(width, height);
                    }
                    //if it has a percentage
                    else if (attribute.getValue() instanceof LayoutBuilder.Percentage){
                        int percentageValue = (int) ((LayoutBuilder.Percentage) attribute.getValue()).percentage;

                        height = (int) ((percentageValue) / 100.0f * parentsProps.height);
                        width = controller.getWidth();
                        controller.setSize(width, height);
                    }


                    break;
//                case "position":
//                    int[] pos = new int[]{40,40};
//                    controller.setPosition(pos[0], pos[1]);
//                    break;
//                case "size":
//                    int[] size = new int[]{40,40};
//                    controller.setSize(1000,500);
//                    break;
                case "background":
//                     if attribute has a color inside
                    if (attribute.getValue() instanceof Color) {
                        Color color = (Color) attribute.getValue();
                        int a = color.getAlpha();
                        int r = color.getRed();
                        int g = color.getGreen();
                        int b = color.getBlue();
                        int colorInt = (a << 24) | (r << 16) | (g << 8) | b;
                        if (controller instanceof Group) {
                        ((Group) controller).setBackgroundColor(colorInt);
                        }
                    }



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
