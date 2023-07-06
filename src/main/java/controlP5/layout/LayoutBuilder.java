package controlP5.layout;

import controlP5.layout.lang.XMLBaseListener;
import controlP5.layout.lang.XMLLexer;
import controlP5.layout.lang.XMLParser;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class LayoutBuilder {

    public static void parseXML(String xml) throws Exception {
        ANTLRInputStream input = new ANTLRInputStream(xml);
        XMLLexer lexer = new XMLLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        XMLParser parser = new XMLParser(tokens);
        ParseTree tree = parser.document();

        ParseTreeWalker walker = new ParseTreeWalker();
        XMLListener listener = new XMLListener();
        walker.walk(listener, tree);
    }

    private static class XMLListener extends XMLBaseListener {
        @Override
        public void enterStartTag(XMLParser.StartTagContext ctx) {
            String controlName = ctx.Name().getText();

            // Create ControlP5 instance based on controlName
            // ControlP5 control = ControlP5Factory.create(controlName);

            int attrCount = ctx.attribute().size();
            for(int i = 0; i < attrCount; i++) {
                String attrName = ctx.attribute(i).Name().getText();
                String attrValue = ctx.attribute(i).STRING().getText();

                // Set attribute
                // control.setAttribute(attrName, attrValue);
            }

            // After setting all attributes, you could add the control to your UI or store it somewhere
        }
    }
}
