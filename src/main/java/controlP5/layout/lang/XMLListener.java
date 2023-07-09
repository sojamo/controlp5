// Generated from XML.g4 by ANTLR 4.13.0
package main.java.controlp5.layout.lang;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link XMLParser}.
 */
public interface XMLListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link XMLParser#document}.
	 * @param ctx the parse tree
	 */
	void enterDocument(XMLParser.DocumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#document}.
	 * @param ctx the parse tree
	 */
	void exitDocument(XMLParser.DocumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#element}.
	 * @param ctx the parse tree
	 */
	void enterElement(XMLParser.ElementContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#element}.
	 * @param ctx the parse tree
	 */
	void exitElement(XMLParser.ElementContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#startTag}.
	 * @param ctx the parse tree
	 */
	void enterStartTag(XMLParser.StartTagContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#startTag}.
	 * @param ctx the parse tree
	 */
	void exitStartTag(XMLParser.StartTagContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#endTag}.
	 * @param ctx the parse tree
	 */
	void enterEndTag(XMLParser.EndTagContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#endTag}.
	 * @param ctx the parse tree
	 */
	void exitEndTag(XMLParser.EndTagContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#attribute}.
	 * @param ctx the parse tree
	 */
	void enterAttribute(XMLParser.AttributeContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#attribute}.
	 * @param ctx the parse tree
	 */
	void exitAttribute(XMLParser.AttributeContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#content}.
	 * @param ctx the parse tree
	 */
	void enterContent(XMLParser.ContentContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#content}.
	 * @param ctx the parse tree
	 */
	void exitContent(XMLParser.ContentContext ctx);
	/**
	 * Enter a parse tree produced by {@link XMLParser#value}.
	 * @param ctx the parse tree
	 */
	void enterValue(XMLParser.ValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link XMLParser#value}.
	 * @param ctx the parse tree
	 */
	void exitValue(XMLParser.ValueContext ctx);
}