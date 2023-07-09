package main.java.src2.main.java.controlP5.controlP5.layout;


import main.java.src2.main.java.controlP5.controlP5.ControlP5;
import main.java.src2.main.java.controlP5.controlP5.layout.lang.XMLBaseVisitor;
import main.java.src2.main.java.controlP5.controlP5.layout.lang.XMLLexer;
import main.java.src2.main.java.controlP5.controlP5.layout.lang.XMLParser;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import processing.core.PApplet;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;


public class LayoutBuilder {
    private final ControlP5 _cp5;
    private final PApplet _pApplet;
    private final Deque<ElementProps> contextStack = new ArrayDeque<>();

    public LayoutBuilder(PApplet pApplet, ControlP5 cp5) {
        _cp5 = cp5;
        _pApplet = pApplet;


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
            for (int i = 0; i < ctx.children.size(); i++) {
                contextStack.push(new ElementProps(parentWidth, parentHeight));
                visit(ctx.children.get(i));
                contextStack.pop();
            }

            return null;

        }

        @Override
        public Object visitElement(XMLParser.ElementContext ctx) {
            //parent props
            ElementProps parentProps = contextStack.peek();
            Tag tag = (Tag) visitStartTag(ctx.startTag());
            System.out.println("im a " + tag.getName() + " and my parent has " + parentProps.width + " " + parentProps.height);



            //visit children
            for (int i = 0; i < ctx.children.size(); i++) {
                contextStack.push(new ElementProps(parentProps.width/2, parentProps.height/2));
                visit(ctx.children.get(i));
                contextStack.pop();
            }


            return null;
        }

        @Override
        public Object visitStartTag(XMLParser.StartTagContext ctx) {
            HashMap<String,Attribute<?>>  attributes = new HashMap<>();
            for (int i = 0; i < ctx.attribute().size() ; i++) {
                Attribute<?> attribute = (Attribute<?>) visitAttribute(ctx.attribute(i));
                attributes.put(attribute.getName(), attribute);
            }

            Tag tag = new Tag(ctx.Name().getText(), attributes);
            return tag;
        }

        @Override
        public Object visitAttribute(XMLParser.AttributeContext ctx) {
            if(ctx.value().STRING() != null){
                String name = ctx.Name().getText();
                String value = ctx.value().STRING().getText();
                return new Attribute<String>(name, value);
            }else if(ctx.value().NUMBER() != null) {
                String name = ctx.Name().getText();
                int value = Integer.parseInt(ctx.value().NUMBER().getText());

                return new Attribute<Integer>(name, value);
            }
            return null;
        }


    }

    private class ElementProps {
        int width;
        int height;

        public ElementProps(int width, int height) {
            this.width = width;
            this.height = height;
        }
    }

    private class Tag {
        private String name;
        private HashMap<String,Attribute<?>>  attributes;

        public Tag(String name, HashMap<String,Attribute<?>> attributes) {
            this.name = name;
            this.attributes = attributes;
        }
        public String getName() {
            return name;
        }
        public HashMap<String,Attribute<?>>  getAttributes() {
            return attributes;
        }
    }

    private class Attribute<T> {
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
}
