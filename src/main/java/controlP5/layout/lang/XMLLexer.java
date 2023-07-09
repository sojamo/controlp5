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
		T__0=1, T__1=2, SELF_CLOSING=3, UNIT=4, WS=5, OPEN=6, OPEN_SLASH=7, CLOSE=8, 
		SLASH_CLOSE=9, EQUALS=10, Name=11, STRING=12, NUMBER=13;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "SELF_CLOSING", "UNIT", "WS", "OPEN", "OPEN_SLASH", "CLOSE", 
			"SLASH_CLOSE", "EQUALS", "Name", "STRING", "NUMBER", "DIGIT", "ALPHA"
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
		"\u0004\u0000\rr\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b"+
		"\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0001"+
		"\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001"+
		"\u0000\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0003\u0001"+
		"\u0003\u0001\u0003\u0003\u0003:\b\u0003\u0001\u0004\u0004\u0004=\b\u0004"+
		"\u000b\u0004\f\u0004>\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005"+
		"\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0007\u0001\u0007\u0001\b\u0001"+
		"\b\u0001\b\u0001\t\u0001\t\u0001\n\u0001\n\u0001\n\u0001\n\u0005\nS\b"+
		"\n\n\n\f\nV\t\n\u0001\u000b\u0001\u000b\u0005\u000bZ\b\u000b\n\u000b\f"+
		"\u000b]\t\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0005\u000bb\b\u000b"+
		"\n\u000b\f\u000be\t\u000b\u0001\u000b\u0003\u000bh\b\u000b\u0001\f\u0004"+
		"\fk\b\f\u000b\f\f\fl\u0001\r\u0001\r\u0001\u000e\u0001\u000e\u0000\u0000"+
		"\u000f\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006"+
		"\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b\u0000"+
		"\u001d\u0000\u0001\u0000\u0006\u0003\u0000\t\n\r\r  \u0002\u0000-.__\u0001"+
		"\u0000\"\"\u0001\u0000\'\'\u0001\u000009\u0002\u0000AZazx\u0000\u0001"+
		"\u0001\u0000\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005"+
		"\u0001\u0000\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001"+
		"\u0000\u0000\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000"+
		"\u0000\u0000\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000"+
		"\u0000\u0000\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000"+
		"\u0000\u0000\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000"+
		"\u0000\u0000\u0001\u001f\u0001\u0000\u0000\u0000\u0003(\u0001\u0000\u0000"+
		"\u0000\u00052\u0001\u0000\u0000\u0000\u00079\u0001\u0000\u0000\u0000\t"+
		"<\u0001\u0000\u0000\u0000\u000bB\u0001\u0000\u0000\u0000\rD\u0001\u0000"+
		"\u0000\u0000\u000fG\u0001\u0000\u0000\u0000\u0011I\u0001\u0000\u0000\u0000"+
		"\u0013L\u0001\u0000\u0000\u0000\u0015N\u0001\u0000\u0000\u0000\u0017g"+
		"\u0001\u0000\u0000\u0000\u0019j\u0001\u0000\u0000\u0000\u001bn\u0001\u0000"+
		"\u0000\u0000\u001dp\u0001\u0000\u0000\u0000\u001f \u0005<\u0000\u0000"+
		" !\u0005W\u0000\u0000!\"\u0005i\u0000\u0000\"#\u0005n\u0000\u0000#$\u0005"+
		"d\u0000\u0000$%\u0005o\u0000\u0000%&\u0005w\u0000\u0000&\'\u0005>\u0000"+
		"\u0000\'\u0002\u0001\u0000\u0000\u0000()\u0005<\u0000\u0000)*\u0005/\u0000"+
		"\u0000*+\u0005W\u0000\u0000+,\u0005i\u0000\u0000,-\u0005n\u0000\u0000"+
		"-.\u0005d\u0000\u0000./\u0005o\u0000\u0000/0\u0005w\u0000\u000001\u0005"+
		">\u0000\u00001\u0004\u0001\u0000\u0000\u000023\u0003\u000b\u0005\u0000"+
		"34\u0003\u0015\n\u000045\u0003\u0011\b\u00005\u0006\u0001\u0000\u0000"+
		"\u000067\u0005p\u0000\u00007:\u0005x\u0000\u00008:\u0005%\u0000\u0000"+
		"96\u0001\u0000\u0000\u000098\u0001\u0000\u0000\u0000:\b\u0001\u0000\u0000"+
		"\u0000;=\u0007\u0000\u0000\u0000<;\u0001\u0000\u0000\u0000=>\u0001\u0000"+
		"\u0000\u0000><\u0001\u0000\u0000\u0000>?\u0001\u0000\u0000\u0000?@\u0001"+
		"\u0000\u0000\u0000@A\u0006\u0004\u0000\u0000A\n\u0001\u0000\u0000\u0000"+
		"BC\u0005<\u0000\u0000C\f\u0001\u0000\u0000\u0000DE\u0005<\u0000\u0000"+
		"EF\u0005/\u0000\u0000F\u000e\u0001\u0000\u0000\u0000GH\u0005>\u0000\u0000"+
		"H\u0010\u0001\u0000\u0000\u0000IJ\u0005/\u0000\u0000JK\u0005>\u0000\u0000"+
		"K\u0012\u0001\u0000\u0000\u0000LM\u0005=\u0000\u0000M\u0014\u0001\u0000"+
		"\u0000\u0000NT\u0003\u001d\u000e\u0000OS\u0003\u001d\u000e\u0000PS\u0003"+
		"\u001b\r\u0000QS\u0007\u0001\u0000\u0000RO\u0001\u0000\u0000\u0000RP\u0001"+
		"\u0000\u0000\u0000RQ\u0001\u0000\u0000\u0000SV\u0001\u0000\u0000\u0000"+
		"TR\u0001\u0000\u0000\u0000TU\u0001\u0000\u0000\u0000U\u0016\u0001\u0000"+
		"\u0000\u0000VT\u0001\u0000\u0000\u0000W[\u0005\"\u0000\u0000XZ\b\u0002"+
		"\u0000\u0000YX\u0001\u0000\u0000\u0000Z]\u0001\u0000\u0000\u0000[Y\u0001"+
		"\u0000\u0000\u0000[\\\u0001\u0000\u0000\u0000\\^\u0001\u0000\u0000\u0000"+
		"][\u0001\u0000\u0000\u0000^h\u0005\"\u0000\u0000_c\u0005\'\u0000\u0000"+
		"`b\b\u0003\u0000\u0000a`\u0001\u0000\u0000\u0000be\u0001\u0000\u0000\u0000"+
		"ca\u0001\u0000\u0000\u0000cd\u0001\u0000\u0000\u0000df\u0001\u0000\u0000"+
		"\u0000ec\u0001\u0000\u0000\u0000fh\u0005\'\u0000\u0000gW\u0001\u0000\u0000"+
		"\u0000g_\u0001\u0000\u0000\u0000h\u0018\u0001\u0000\u0000\u0000ik\u0003"+
		"\u001b\r\u0000ji\u0001\u0000\u0000\u0000kl\u0001\u0000\u0000\u0000lj\u0001"+
		"\u0000\u0000\u0000lm\u0001\u0000\u0000\u0000m\u001a\u0001\u0000\u0000"+
		"\u0000no\u0007\u0004\u0000\u0000o\u001c\u0001\u0000\u0000\u0000pq\u0007"+
		"\u0005\u0000\u0000q\u001e\u0001\u0000\u0000\u0000\t\u00009>RT[cgl\u0001"+
		"\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}