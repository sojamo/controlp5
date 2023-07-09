// Generated from XML.g4 by ANTLR 4.13.0
package controlP5.layout.lang;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class XMLParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.0", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, SELF_CLOSING=3, UNIT=4, WS=5, OPEN=6, OPEN_SLASH=7, CLOSE=8, 
		SLASH_CLOSE=9, EQUALS=10, Name=11, STRING=12, NUMBER=13;
	public static final int
		RULE_document = 0, RULE_element = 1, RULE_startTag = 2, RULE_endTag = 3, 
		RULE_attribute = 4, RULE_content = 5, RULE_value = 6;
	private static String[] makeRuleNames() {
		return new String[] {
			"document", "element", "startTag", "endTag", "attribute", "content", 
			"value"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'<Window>'", "'</Window>'", null, null, null, "'<'", "'</'", "'>'", 
			"'/>'", "'='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, "SELF_CLOSING", "UNIT", "WS", "OPEN", "OPEN_SLASH", 
			"CLOSE", "SLASH_CLOSE", "EQUALS", "Name", "STRING", "NUMBER"
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
		public List<ElementContext> element() {
			return getRuleContexts(ElementContext.class);
		}
		public ElementContext element(int i) {
			return getRuleContext(ElementContext.class,i);
		}
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitDocument(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DocumentContext document() throws RecognitionException {
		DocumentContext _localctx = new DocumentContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_document);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(14);
			match(T__0);
			setState(16); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(15);
				element();
				}
				}
				setState(18); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==SELF_CLOSING || _la==OPEN );
			setState(20);
			match(T__1);
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
		public ContentContext content() {
			return getRuleContext(ContentContext.class,0);
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitElement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ElementContext element() throws RecognitionException {
		ElementContext _localctx = new ElementContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_element);
		int _la;
		try {
			setState(29);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case OPEN:
				enterOuterAlt(_localctx, 1);
				{
				setState(22);
				startTag();
				setState(24);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 4168L) != 0)) {
					{
					setState(23);
					content();
					}
				}

				setState(26);
				endTag();
				}
				break;
			case SELF_CLOSING:
				enterOuterAlt(_localctx, 2);
				{
				setState(28);
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitStartTag(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StartTagContext startTag() throws RecognitionException {
		StartTagContext _localctx = new StartTagContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_startTag);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(31);
			match(OPEN);
			setState(32);
			match(Name);
			setState(36);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Name) {
				{
				{
				setState(33);
				attribute();
				}
				}
				setState(38);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(39);
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitEndTag(this);
			else return visitor.visitChildren(this);
		}
	}

	public final EndTagContext endTag() throws RecognitionException {
		EndTagContext _localctx = new EndTagContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_endTag);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(41);
			match(OPEN_SLASH);
			setState(42);
			match(Name);
			setState(43);
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
		public ValueContext value() {
			return getRuleContext(ValueContext.class,0);
		}
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitAttribute(this);
			else return visitor.visitChildren(this);
		}
	}

	public final AttributeContext attribute() throws RecognitionException {
		AttributeContext _localctx = new AttributeContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_attribute);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(45);
			match(Name);
			setState(46);
			match(EQUALS);
			setState(47);
			value();
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
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitContent(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ContentContext content() throws RecognitionException {
		ContentContext _localctx = new ContentContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_content);
		try {
			setState(51);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case SELF_CLOSING:
			case OPEN:
				enterOuterAlt(_localctx, 1);
				{
				setState(49);
				element();
				}
				break;
			case STRING:
				enterOuterAlt(_localctx, 2);
				{
				setState(50);
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

	@SuppressWarnings("CheckReturnValue")
	public static class ValueContext extends ParserRuleContext {
		public TerminalNode STRING() { return getToken(XMLParser.STRING, 0); }
		public TerminalNode NUMBER() { return getToken(XMLParser.NUMBER, 0); }
		public TerminalNode UNIT() { return getToken(XMLParser.UNIT, 0); }
		public ValueContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_value; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).enterValue(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof XMLListener ) ((XMLListener)listener).exitValue(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof XMLVisitor ) return ((XMLVisitor<? extends T>)visitor).visitValue(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ValueContext value() throws RecognitionException {
		ValueContext _localctx = new ValueContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_value);
		try {
			setState(56);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case STRING:
				enterOuterAlt(_localctx, 1);
				{
				setState(53);
				match(STRING);
				}
				break;
			case NUMBER:
				enterOuterAlt(_localctx, 2);
				{
				setState(54);
				match(NUMBER);
				setState(55);
				match(UNIT);
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
		"\u0004\u0001\r;\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0001\u0000\u0001\u0000\u0004"+
		"\u0000\u0011\b\u0000\u000b\u0000\f\u0000\u0012\u0001\u0000\u0001\u0000"+
		"\u0001\u0001\u0001\u0001\u0003\u0001\u0019\b\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0003\u0001\u001e\b\u0001\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0005\u0002#\b\u0002\n\u0002\f\u0002&\t\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0003\u00054\b\u0005"+
		"\u0001\u0006\u0001\u0006\u0001\u0006\u0003\u00069\b\u0006\u0001\u0006"+
		"\u0000\u0000\u0007\u0000\u0002\u0004\u0006\b\n\f\u0000\u00009\u0000\u000e"+
		"\u0001\u0000\u0000\u0000\u0002\u001d\u0001\u0000\u0000\u0000\u0004\u001f"+
		"\u0001\u0000\u0000\u0000\u0006)\u0001\u0000\u0000\u0000\b-\u0001\u0000"+
		"\u0000\u0000\n3\u0001\u0000\u0000\u0000\f8\u0001\u0000\u0000\u0000\u000e"+
		"\u0010\u0005\u0001\u0000\u0000\u000f\u0011\u0003\u0002\u0001\u0000\u0010"+
		"\u000f\u0001\u0000\u0000\u0000\u0011\u0012\u0001\u0000\u0000\u0000\u0012"+
		"\u0010\u0001\u0000\u0000\u0000\u0012\u0013\u0001\u0000\u0000\u0000\u0013"+
		"\u0014\u0001\u0000\u0000\u0000\u0014\u0015\u0005\u0002\u0000\u0000\u0015"+
		"\u0001\u0001\u0000\u0000\u0000\u0016\u0018\u0003\u0004\u0002\u0000\u0017"+
		"\u0019\u0003\n\u0005\u0000\u0018\u0017\u0001\u0000\u0000\u0000\u0018\u0019"+
		"\u0001\u0000\u0000\u0000\u0019\u001a\u0001\u0000\u0000\u0000\u001a\u001b"+
		"\u0003\u0006\u0003\u0000\u001b\u001e\u0001\u0000\u0000\u0000\u001c\u001e"+
		"\u0005\u0003\u0000\u0000\u001d\u0016\u0001\u0000\u0000\u0000\u001d\u001c"+
		"\u0001\u0000\u0000\u0000\u001e\u0003\u0001\u0000\u0000\u0000\u001f \u0005"+
		"\u0006\u0000\u0000 $\u0005\u000b\u0000\u0000!#\u0003\b\u0004\u0000\"!"+
		"\u0001\u0000\u0000\u0000#&\u0001\u0000\u0000\u0000$\"\u0001\u0000\u0000"+
		"\u0000$%\u0001\u0000\u0000\u0000%\'\u0001\u0000\u0000\u0000&$\u0001\u0000"+
		"\u0000\u0000\'(\u0005\b\u0000\u0000(\u0005\u0001\u0000\u0000\u0000)*\u0005"+
		"\u0007\u0000\u0000*+\u0005\u000b\u0000\u0000+,\u0005\b\u0000\u0000,\u0007"+
		"\u0001\u0000\u0000\u0000-.\u0005\u000b\u0000\u0000./\u0005\n\u0000\u0000"+
		"/0\u0003\f\u0006\u00000\t\u0001\u0000\u0000\u000014\u0003\u0002\u0001"+
		"\u000024\u0005\f\u0000\u000031\u0001\u0000\u0000\u000032\u0001\u0000\u0000"+
		"\u00004\u000b\u0001\u0000\u0000\u000059\u0005\f\u0000\u000067\u0005\r"+
		"\u0000\u000079\u0005\u0004\u0000\u000085\u0001\u0000\u0000\u000086\u0001"+
		"\u0000\u0000\u00009\r\u0001\u0000\u0000\u0000\u0006\u0012\u0018\u001d"+
		"$38";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}