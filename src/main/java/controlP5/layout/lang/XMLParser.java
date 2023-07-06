// Generated from XML.g4 by ANTLR 4.13.0
package controlP5.layout.lang;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class XMLParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.0", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		SELF_CLOSING=1, SPACE=2, OPEN=3, OPEN_SLASH=4, CLOSE=5, SLASH_CLOSE=6, 
		EQUALS=7, Name=8, STRING=9;
	public static final int
		RULE_document = 0, RULE_element = 1, RULE_startTag = 2, RULE_endTag = 3, 
		RULE_attribute = 4, RULE_content = 5;
	private static String[] makeRuleNames() {
		return new String[] {
			"document", "element", "startTag", "endTag", "attribute", "content"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, "'<'", "'</'", "'>'", "'/>'", "'='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "SELF_CLOSING", "SPACE", "OPEN", "OPEN_SLASH", "CLOSE", "SLASH_CLOSE", 
			"EQUALS", "Name", "STRING"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "XML.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public XMLParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class DocumentContext extends ParserRuleContext {
		public ElementContext element() {
			return getRuleContext(ElementContext.class,0);
		}
		public TerminalNode EOF() { return getToken(XMLParser.EOF, 0); }
		public DocumentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_document; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterDocument(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitDocument(this);
		}
	}

	public final DocumentContext document() throws RecognitionException {
		DocumentContext _localctx = new DocumentContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_document);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(12);
			element();
			setState(13);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ElementContext extends ParserRuleContext {
		public StartTagContext startTag() {
			return getRuleContext(StartTagContext.class,0);
		}
		public EndTagContext endTag() {
			return getRuleContext(EndTagContext.class,0);
		}
		public List<ContentContext> content() {
			return getRuleContexts(ContentContext.class);
		}
		public ContentContext content(int i) {
			return getRuleContext(ContentContext.class,i);
		}
		public List<TerminalNode> SPACE() { return getTokens(XMLParser.SPACE); }
		public TerminalNode SPACE(int i) {
			return getToken(XMLParser.SPACE, i);
		}
		public TerminalNode SELF_CLOSING() { return getToken(XMLParser.SELF_CLOSING, 0); }
		public ElementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_element; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterElement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitElement(this);
		}
	}

	public final ElementContext element() throws RecognitionException {
		ElementContext _localctx = new ElementContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_element);
		int _la;
		try {
			setState(26);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case OPEN:
				enterOuterAlt(_localctx, 1);
				{
				setState(15);
				startTag();
				setState(20);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 526L) != 0)) {
					{
					setState(18);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case SELF_CLOSING:
					case OPEN:
					case STRING:
						{
						setState(16);
						content();
						}
						break;
					case SPACE:
						{
						setState(17);
						match(SPACE);
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					setState(22);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(23);
				endTag();
				}
				break;
			case SELF_CLOSING:
				enterOuterAlt(_localctx, 2);
				{
				setState(25);
				match(SELF_CLOSING);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class StartTagContext extends ParserRuleContext {
		public TerminalNode OPEN() { return getToken(XMLParser.OPEN, 0); }
		public TerminalNode Name() { return getToken(XMLParser.Name, 0); }
		public TerminalNode CLOSE() { return getToken(XMLParser.CLOSE, 0); }
		public List<AttributeContext> attribute() {
			return getRuleContexts(AttributeContext.class);
		}
		public AttributeContext attribute(int i) {
			return getRuleContext(AttributeContext.class,i);
		}
		public StartTagContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_startTag; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterStartTag(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitStartTag(this);
		}
	}

	public final StartTagContext startTag() throws RecognitionException {
		StartTagContext _localctx = new StartTagContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_startTag);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(28);
			match(OPEN);
			setState(29);
			match(Name);
			setState(33);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Name) {
				{
				{
				setState(30);
				attribute();
				}
				}
				setState(35);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(36);
			match(CLOSE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class EndTagContext extends ParserRuleContext {
		public TerminalNode OPEN_SLASH() { return getToken(XMLParser.OPEN_SLASH, 0); }
		public TerminalNode Name() { return getToken(XMLParser.Name, 0); }
		public TerminalNode CLOSE() { return getToken(XMLParser.CLOSE, 0); }
		public EndTagContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_endTag; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterEndTag(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitEndTag(this);
		}
	}

	public final EndTagContext endTag() throws RecognitionException {
		EndTagContext _localctx = new EndTagContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_endTag);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(38);
			match(OPEN_SLASH);
			setState(39);
			match(Name);
			setState(40);
			match(CLOSE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class AttributeContext extends ParserRuleContext {
		public TerminalNode Name() { return getToken(XMLParser.Name, 0); }
		public TerminalNode EQUALS() { return getToken(XMLParser.EQUALS, 0); }
		public TerminalNode STRING() { return getToken(XMLParser.STRING, 0); }
		public AttributeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_attribute; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterAttribute(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitAttribute(this);
		}
	}

	public final AttributeContext attribute() throws RecognitionException {
		AttributeContext _localctx = new AttributeContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_attribute);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(42);
			match(Name);
			setState(43);
			match(EQUALS);
			setState(44);
			match(STRING);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ContentContext extends ParserRuleContext {
		public ElementContext element() {
			return getRuleContext(ElementContext.class,0);
		}
		public TerminalNode STRING() { return getToken(XMLParser.STRING, 0); }
		public ContentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_content; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterContent(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitContent(this);
		}
	}

	public final ContentContext content() throws RecognitionException {
		ContentContext _localctx = new ContentContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_content);
		try {
			setState(48);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case SELF_CLOSING:
			case OPEN:
				enterOuterAlt(_localctx, 1);
				{
				setState(46);
				element();
				}
				break;
			case STRING:
				enterOuterAlt(_localctx, 2);
				{
				setState(47);
				match(STRING);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\u0004\u0001\t3\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0005\u0001\u0013\b\u0001\n\u0001\f\u0001\u0016\t\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0003\u0001\u001b\b\u0001\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0005\u0002 \b\u0002\n\u0002\f\u0002#\t\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003"+
		"\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005"+
		"\u0003\u00051\b\u0005\u0001\u0005\u0000\u0000\u0006\u0000\u0002\u0004"+
		"\u0006\b\n\u0000\u00001\u0000\f\u0001\u0000\u0000\u0000\u0002\u001a\u0001"+
		"\u0000\u0000\u0000\u0004\u001c\u0001\u0000\u0000\u0000\u0006&\u0001\u0000"+
		"\u0000\u0000\b*\u0001\u0000\u0000\u0000\n0\u0001\u0000\u0000\u0000\f\r"+
		"\u0003\u0002\u0001\u0000\r\u000e\u0005\u0000\u0000\u0001\u000e\u0001\u0001"+
		"\u0000\u0000\u0000\u000f\u0014\u0003\u0004\u0002\u0000\u0010\u0013\u0003"+
		"\n\u0005\u0000\u0011\u0013\u0005\u0002\u0000\u0000\u0012\u0010\u0001\u0000"+
		"\u0000\u0000\u0012\u0011\u0001\u0000\u0000\u0000\u0013\u0016\u0001\u0000"+
		"\u0000\u0000\u0014\u0012\u0001\u0000\u0000\u0000\u0014\u0015\u0001\u0000"+
		"\u0000\u0000\u0015\u0017\u0001\u0000\u0000\u0000\u0016\u0014\u0001\u0000"+
		"\u0000\u0000\u0017\u0018\u0003\u0006\u0003\u0000\u0018\u001b\u0001\u0000"+
		"\u0000\u0000\u0019\u001b\u0005\u0001\u0000\u0000\u001a\u000f\u0001\u0000"+
		"\u0000\u0000\u001a\u0019\u0001\u0000\u0000\u0000\u001b\u0003\u0001\u0000"+
		"\u0000\u0000\u001c\u001d\u0005\u0003\u0000\u0000\u001d!\u0005\b\u0000"+
		"\u0000\u001e \u0003\b\u0004\u0000\u001f\u001e\u0001\u0000\u0000\u0000"+
		" #\u0001\u0000\u0000\u0000!\u001f\u0001\u0000\u0000\u0000!\"\u0001\u0000"+
		"\u0000\u0000\"$\u0001\u0000\u0000\u0000#!\u0001\u0000\u0000\u0000$%\u0005"+
		"\u0005\u0000\u0000%\u0005\u0001\u0000\u0000\u0000&\'\u0005\u0004\u0000"+
		"\u0000\'(\u0005\b\u0000\u0000()\u0005\u0005\u0000\u0000)\u0007\u0001\u0000"+
		"\u0000\u0000*+\u0005\b\u0000\u0000+,\u0005\u0007\u0000\u0000,-\u0005\t"+
		"\u0000\u0000-\t\u0001\u0000\u0000\u0000.1\u0003\u0002\u0001\u0000/1\u0005"+
		"\t\u0000\u00000.\u0001\u0000\u0000\u00000/\u0001\u0000\u0000\u00001\u000b"+
		"\u0001\u0000\u0000\u0000\u0005\u0012\u0014\u001a!0";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}