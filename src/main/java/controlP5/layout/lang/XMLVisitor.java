// Generated from XML.g4 by ANTLR 4.13.0
package controlP5.layout.lang;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link XMLParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface XMLVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link XMLParser#document}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDocument(XMLParser.DocumentContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#element}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitElement(XMLParser.ElementContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#startTag}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStartTag(XMLParser.StartTagContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#endTag}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEndTag(XMLParser.EndTagContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#attribute}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAttribute(XMLParser.AttributeContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#content}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContent(XMLParser.ContentContext ctx);
	/**
	 * Visit a parse tree produced by {@link XMLParser#value}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitValue(XMLParser.ValueContext ctx);
}