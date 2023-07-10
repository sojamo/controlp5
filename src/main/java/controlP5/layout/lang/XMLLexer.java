// Generated from XML.g4 by ANTLR 4.13.0
package controlP5.layout.lang;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class XMLLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.0", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, SELF_CLOSING=7, UNIT=8, 
		WS=9, OPEN=10, OPEN_SLASH=11, CLOSE=12, SLASH_CLOSE=13, EQUALS=14, Name=15, 
		STRING=16, NUMBER=17;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "SELF_CLOSING", "UNIT", 
			"WS", "OPEN", "OPEN_SLASH", "CLOSE", "SLASH_CLOSE", "EQUALS", "Name", 
			"STRING", "NUMBER", "DIGIT", "ALPHA"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'<Window>'", "'</Window>'", "'rgb'", "'('", "','", "')'", null, 
			null, null, "'<'", "'</'", "'>'", "'/>'", "'='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, "SELF_CLOSING", "UNIT", "WS", 
			"OPEN", "OPEN_SLASH", "CLOSE", "SLASH_CLOSE", "EQUALS", "Name", "STRING", 
			"NUMBER"
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


	public XMLLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "XML.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\u0004\u0000\u0011\u0084\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000"+
		"\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0005"+
		"\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0007"+
		"\u0001\u0007\u0001\u0007\u0003\u0007L\b\u0007\u0001\b\u0004\bO\b\b\u000b"+
		"\b\f\bP\u0001\b\u0001\b\u0001\t\u0001\t\u0001\n\u0001\n\u0001\n\u0001"+
		"\u000b\u0001\u000b\u0001\f\u0001\f\u0001\f\u0001\r\u0001\r\u0001\u000e"+
		"\u0001\u000e\u0001\u000e\u0001\u000e\u0005\u000ee\b\u000e\n\u000e\f\u000e"+
		"h\t\u000e\u0001\u000f\u0001\u000f\u0005\u000fl\b\u000f\n\u000f\f\u000f"+
		"o\t\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0005\u000ft\b\u000f\n\u000f"+
		"\f\u000fw\t\u000f\u0001\u000f\u0003\u000fz\b\u000f\u0001\u0010\u0004\u0010"+
		"}\b\u0010\u000b\u0010\f\u0010~\u0001\u0011\u0001\u0011\u0001\u0012\u0001"+
		"\u0012\u0000\u0000\u0013\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004"+
		"\t\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017"+
		"\f\u0019\r\u001b\u000e\u001d\u000f\u001f\u0010!\u0011#\u0000%\u0000\u0001"+
		"\u0000\u0006\u0003\u0000\t\n\r\r  \u0002\u0000-.__\u0001\u0000\"\"\u0001"+
		"\u0000\'\'\u0001\u000009\u0002\u0000AZaz\u008a\u0000\u0001\u0001\u0000"+
		"\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000"+
		"\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000"+
		"\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000"+
		"\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000"+
		"\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000"+
		"\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000"+
		"\u0000\u001b\u0001\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000"+
		"\u0000\u001f\u0001\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0001"+
		"\'\u0001\u0000\u0000\u0000\u00030\u0001\u0000\u0000\u0000\u0005:\u0001"+
		"\u0000\u0000\u0000\u0007>\u0001\u0000\u0000\u0000\t@\u0001\u0000\u0000"+
		"\u0000\u000bB\u0001\u0000\u0000\u0000\rD\u0001\u0000\u0000\u0000\u000f"+
		"K\u0001\u0000\u0000\u0000\u0011N\u0001\u0000\u0000\u0000\u0013T\u0001"+
		"\u0000\u0000\u0000\u0015V\u0001\u0000\u0000\u0000\u0017Y\u0001\u0000\u0000"+
		"\u0000\u0019[\u0001\u0000\u0000\u0000\u001b^\u0001\u0000\u0000\u0000\u001d"+
		"`\u0001\u0000\u0000\u0000\u001fy\u0001\u0000\u0000\u0000!|\u0001\u0000"+
		"\u0000\u0000#\u0080\u0001\u0000\u0000\u0000%\u0082\u0001\u0000\u0000\u0000"+
		"\'(\u0005<\u0000\u0000()\u0005W\u0000\u0000)*\u0005i\u0000\u0000*+\u0005"+
		"n\u0000\u0000+,\u0005d\u0000\u0000,-\u0005o\u0000\u0000-.\u0005w\u0000"+
		"\u0000./\u0005>\u0000\u0000/\u0002\u0001\u0000\u0000\u000001\u0005<\u0000"+
		"\u000012\u0005/\u0000\u000023\u0005W\u0000\u000034\u0005i\u0000\u0000"+
		"45\u0005n\u0000\u000056\u0005d\u0000\u000067\u0005o\u0000\u000078\u0005"+
		"w\u0000\u000089\u0005>\u0000\u00009\u0004\u0001\u0000\u0000\u0000:;\u0005"+
		"r\u0000\u0000;<\u0005g\u0000\u0000<=\u0005b\u0000\u0000=\u0006\u0001\u0000"+
		"\u0000\u0000>?\u0005(\u0000\u0000?\b\u0001\u0000\u0000\u0000@A\u0005,"+
		"\u0000\u0000A\n\u0001\u0000\u0000\u0000BC\u0005)\u0000\u0000C\f\u0001"+
		"\u0000\u0000\u0000DE\u0003\u0013\t\u0000EF\u0003\u001d\u000e\u0000FG\u0003"+
		"\u0019\f\u0000G\u000e\u0001\u0000\u0000\u0000HI\u0005p\u0000\u0000IL\u0005"+
		"x\u0000\u0000JL\u0005%\u0000\u0000KH\u0001\u0000\u0000\u0000KJ\u0001\u0000"+
		"\u0000\u0000L\u0010\u0001\u0000\u0000\u0000MO\u0007\u0000\u0000\u0000"+
		"NM\u0001\u0000\u0000\u0000OP\u0001\u0000\u0000\u0000PN\u0001\u0000\u0000"+
		"\u0000PQ\u0001\u0000\u0000\u0000QR\u0001\u0000\u0000\u0000RS\u0006\b\u0000"+
		"\u0000S\u0012\u0001\u0000\u0000\u0000TU\u0005<\u0000\u0000U\u0014\u0001"+
		"\u0000\u0000\u0000VW\u0005<\u0000\u0000WX\u0005/\u0000\u0000X\u0016\u0001"+
		"\u0000\u0000\u0000YZ\u0005>\u0000\u0000Z\u0018\u0001\u0000\u0000\u0000"+
		"[\\\u0005/\u0000\u0000\\]\u0005>\u0000\u0000]\u001a\u0001\u0000\u0000"+
		"\u0000^_\u0005=\u0000\u0000_\u001c\u0001\u0000\u0000\u0000`f\u0003%\u0012"+
		"\u0000ae\u0003%\u0012\u0000be\u0003#\u0011\u0000ce\u0007\u0001\u0000\u0000"+
		"da\u0001\u0000\u0000\u0000db\u0001\u0000\u0000\u0000dc\u0001\u0000\u0000"+
		"\u0000eh\u0001\u0000\u0000\u0000fd\u0001\u0000\u0000\u0000fg\u0001\u0000"+
		"\u0000\u0000g\u001e\u0001\u0000\u0000\u0000hf\u0001\u0000\u0000\u0000"+
		"im\u0005\"\u0000\u0000jl\b\u0002\u0000\u0000kj\u0001\u0000\u0000\u0000"+
		"lo\u0001\u0000\u0000\u0000mk\u0001\u0000\u0000\u0000mn\u0001\u0000\u0000"+
		"\u0000np\u0001\u0000\u0000\u0000om\u0001\u0000\u0000\u0000pz\u0005\"\u0000"+
		"\u0000qu\u0005\'\u0000\u0000rt\b\u0003\u0000\u0000sr\u0001\u0000\u0000"+
		"\u0000tw\u0001\u0000\u0000\u0000us\u0001\u0000\u0000\u0000uv\u0001\u0000"+
		"\u0000\u0000vx\u0001\u0000\u0000\u0000wu\u0001\u0000\u0000\u0000xz\u0005"+
		"\'\u0000\u0000yi\u0001\u0000\u0000\u0000yq\u0001\u0000\u0000\u0000z \u0001"+
		"\u0000\u0000\u0000{}\u0003#\u0011\u0000|{\u0001\u0000\u0000\u0000}~\u0001"+
		"\u0000\u0000\u0000~|\u0001\u0000\u0000\u0000~\u007f\u0001\u0000\u0000"+
		"\u0000\u007f\"\u0001\u0000\u0000\u0000\u0080\u0081\u0007\u0004\u0000\u0000"+
		"\u0081$\u0001\u0000\u0000\u0000\u0082\u0083\u0007\u0005\u0000\u0000\u0083"+
		"&\u0001\u0000\u0000\u0000\t\u0000KPdfmuy~\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}