package controlP5.layout;


import controlP5.ColorPicker;
import controlP5.ControlP5;
import controlP5.ControllerInterface;
import controlP5.Group;
import controlP5.layout.lang.XMLBaseVisitor;
import controlP5.layout.lang.XMLLexer;
import controlP5.layout.lang.XMLParser;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import processing.core.PApplet;

import java.awt.*;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;


public class LayoutBuilder {
    private final ControlP5 _cp5;
    private final PApplet _pApplet;
    private final Deque<ElementProps> propertiesInheritance = new ArrayDeque<>();
    private final ControllerFactory _factory;

    public LayoutBuilder(PApplet pApplet, ControlP5 cp5) {
        _cp5 = cp5;
        _pApplet = pApplet;
        _factory = new ControllerFactory(pApplet, _cp5);


    }

    public void parseXML(String xml) throws Exception {
        ANTLRInputStream input = new ANTLRInputStream(xml);
        XMLLexer lexer = new XMLLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        XMLParser parser = new XMLParser(tokens);
        ParseTree tree = parser.document();

        //create walker
        ParseTreeWalker walker = new ParseTreeWalker();
        XMLVisitor visitor = new XMLVisitor(_pApplet, _cp5);
        visitor.visit(tree);


    }

    private class XMLVisitor extends XMLBaseVisitor {

        private final ControlP5 _cp5;
        private final PApplet _pApplet;

        public XMLVisitor(PApplet pApplet, ControlP5 cp5) {
            _cp5 = cp5;
            _pApplet = pApplet;
        }


        //visit first node
        @Override
        public Object visitDocument(XMLParser.DocumentContext ctx) {
            // get width and height from the papplet
            int parentWidth = _pApplet.width;
            int parentHeight = _pApplet.height;


            //visit children
            propertiesInheritance.push(new ElementProps(parentWidth, parentHeight));
            for (int i = 0; i < ctx.children.size(); i++) {
                visit(ctx.children.get(i));
            }
            propertiesInheritance.pop();

            return null;

        }

        @Override
        public Object visitElement(XMLParser.ElementContext ctx) {

            visitStartTag(ctx.startTag());
            if(ctx.content() != null){
                visitContent(ctx.content());
            }
            visitEndTag(ctx.endTag());

            return null;
        }

        @Override
        public Object visitStartTag(XMLParser.StartTagContext ctx) {
            HashMap<String, Attribute<?>> attributes = new HashMap<>();
            for (int i = 0; i < ctx.attribute().size(); i++) {
                Attribute<?> attribute = (Attribute<?>) visitAttribute(ctx.attribute(i));
                attributes.put(attribute.getName(), attribute);
            }

            Tag tag = new Tag(ctx.Name().getText(), attributes);

            ControllerInterface<?> controller = _factory.createController(tag.getName(), propertiesInheritance);

            _factory.configure(controller, tag.getAttributes(),propertiesInheritance);

            //push to the inheritance stack
            propertiesInheritance.push(new ElementProps(controller.getWidth(), controller.getHeight()));

            return tag;
        }

        @Override
        public Object visitContent(XMLParser.ContentContext ctx) {
            return super.visitContent(ctx);
        }

        public Object visitEndTag(XMLParser.EndTagContext ctx) {
            propertiesInheritance.pop();
            return super.visitEndTag(ctx);
        }

        @Override
        public Object visitAttribute(XMLParser.AttributeContext ctx) {
            if (ctx.value().STRING() != null) {
                String name = ctx.Name().getText();
                String value = ctx.value().STRING().getText();
                return new Attribute<String>(name, value);
            }
            //if it px
            else if (ctx.value().UNIT() != null && ctx.value().UNIT().getText().equals("px")) {
                String name = ctx.Name().getText();
                int value = Integer.parseInt(ctx.value().NUMBER().getText());
                return new Attribute<Integer>(name, value);
            }
            //if it a percentage
            else if(ctx.value().UNIT() != null && ctx.value().UNIT().getText().equals("%")){
                String name = ctx.Name().getText();
                int value = Integer.parseInt(ctx.value().NUMBER().getText());
                Percentage percentage = new Percentage(value);
                return new Attribute<Percentage>(name, percentage);
            }
            // if its a rgb(r,g,b,)
            else if (ctx.value().rgb() != null) {
                String name = ctx.Name().getText();
                int a = 1;
                int r = Integer.parseInt(ctx.value().rgb().NUMBER(0).getText());
                int g = Integer.parseInt(ctx.value().rgb().NUMBER(1).getText());
                int b = Integer.parseInt(ctx.value().rgb().NUMBER(2).getText());
//                Color color = (a << 24) | (r << 16) | (g << 8) | b;
                Color c = new Color(r,g,b,a);
                return new Attribute<Color>(name, c);
            }

            return null;
        }


    }

    public class ElementProps {
        int width;
        int height;

        public ElementProps(int width, int height) {
            this.width = width;
            this.height = height;
        }
    }

    private class Tag {
        private String name;
        private HashMap<String, Attribute<?>> attributes;

        public Tag(String name, HashMap<String, Attribute<?>> attributes) {
            this.name = name;
            this.attributes = attributes;
        }

        public String getName() {
            return name;
        }

        public HashMap<String, Attribute<?>> getAttributes() {
            return attributes;
        }
    }

    public class Attribute<T> {
        private String name;
        private T value;

        public Attribute(String name, T value) {
            this.name = name;
            this.value = value;
        }

        public String getName() {
            return name;
        }

        public T getValue() {
            return value;
        }
    }


    public static class Percentage{

        public float percentage;

        public Percentage (float percentage){
            this.percentage = percentage;
        }

    }
}
