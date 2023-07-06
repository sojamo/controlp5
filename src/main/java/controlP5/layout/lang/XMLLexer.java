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
		SELF_CLOSING=1, SPACE=2, OPEN=3, OPEN_SLASH=4, CLOSE=5, SLASH_CLOSE=6, 
		EQUALS=7, Name=8, STRING=9;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"SELF_CLOSING", "SPACE", "OPEN", "OPEN_SLASH", "CLOSE", "SLASH_CLOSE", 
			"EQUALS", "Name", "STRING", "DIGIT", "ALPHA"
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
		"\u0004\u0000\tH\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0001\u0000"+
		"\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0002"+
		"\u0001\u0002\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004"+
		"\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0007"+
		"\u0001\u0007\u0001\u0007\u0001\u0007\u0005\u0007.\b\u0007\n\u0007\f\u0007"+
		"1\t\u0007\u0001\b\u0001\b\u0005\b5\b\b\n\b\f\b8\t\b\u0001\b\u0001\b\u0001"+
		"\b\u0005\b=\b\b\n\b\f\b@\t\b\u0001\b\u0003\bC\b\b\u0001\t\u0001\t\u0001"+
		"\n\u0001\n\u0000\u0000\u000b\u0001\u0001\u0003\u0002\u0005\u0003\u0007"+
		"\u0004\t\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\u0000\u0015\u0000"+
		"\u0001\u0000\u0006\u0003\u0000\t\n\r\r  \u0002\u0000-.__\u0001\u0000\""+
		"\"\u0001\u0000\'\'\u0001\u000009\u0002\u0000AZazK\u0000\u0001\u0001\u0000"+
		"\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000"+
		"\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000"+
		"\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000"+
		"\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000"+
		"\u0001\u0017\u0001\u0000\u0000\u0000\u0003\u001b\u0001\u0000\u0000\u0000"+
		"\u0005\u001d\u0001\u0000\u0000\u0000\u0007\u001f\u0001\u0000\u0000\u0000"+
		"\t\"\u0001\u0000\u0000\u0000\u000b$\u0001\u0000\u0000\u0000\r\'\u0001"+
		"\u0000\u0000\u0000\u000f)\u0001\u0000\u0000\u0000\u0011B\u0001\u0000\u0000"+
		"\u0000\u0013D\u0001\u0000\u0000\u0000\u0015F\u0001\u0000\u0000\u0000\u0017"+
		"\u0018\u0003\u0005\u0002\u0000\u0018\u0019\u0003\u000f\u0007\u0000\u0019"+
		"\u001a\u0003\u000b\u0005\u0000\u001a\u0002\u0001\u0000\u0000\u0000\u001b"+
		"\u001c\u0007\u0000\u0000\u0000\u001c\u0004\u0001\u0000\u0000\u0000\u001d"+
		"\u001e\u0005<\u0000\u0000\u001e\u0006\u0001\u0000\u0000\u0000\u001f \u0005"+
		"<\u0000\u0000 !\u0005/\u0000\u0000!\b\u0001\u0000\u0000\u0000\"#\u0005"+
		">\u0000\u0000#\n\u0001\u0000\u0000\u0000$%\u0005/\u0000\u0000%&\u0005"+
		">\u0000\u0000&\f\u0001\u0000\u0000\u0000\'(\u0005=\u0000\u0000(\u000e"+
		"\u0001\u0000\u0000\u0000)/\u0003\u0015\n\u0000*.\u0003\u0015\n\u0000+"+
		".\u0003\u0013\t\u0000,.\u0007\u0001\u0000\u0000-*\u0001\u0000\u0000\u0000"+
		"-+\u0001\u0000\u0000\u0000-,\u0001\u0000\u0000\u0000.1\u0001\u0000\u0000"+
		"\u0000/-\u0001\u0000\u0000\u0000/0\u0001\u0000\u0000\u00000\u0010\u0001"+
		"\u0000\u0000\u00001/\u0001\u0000\u0000\u000026\u0005\"\u0000\u000035\b"+
		"\u0002\u0000\u000043\u0001\u0000\u0000\u000058\u0001\u0000\u0000\u0000"+
		"64\u0001\u0000\u0000\u000067\u0001\u0000\u0000\u000079\u0001\u0000\u0000"+
		"\u000086\u0001\u0000\u0000\u00009C\u0005\"\u0000\u0000:>\u0005\'\u0000"+
		"\u0000;=\b\u0003\u0000\u0000<;\u0001\u0000\u0000\u0000=@\u0001\u0000\u0000"+
		"\u0000><\u0001\u0000\u0000\u0000>?\u0001\u0000\u0000\u0000?A\u0001\u0000"+
		"\u0000\u0000@>\u0001\u0000\u0000\u0000AC\u0005\'\u0000\u0000B2\u0001\u0000"+
		"\u0000\u0000B:\u0001\u0000\u0000\u0000C\u0012\u0001\u0000\u0000\u0000"+
		"DE\u0007\u0004\u0000\u0000E\u0014\u0001\u0000\u0000\u0000FG\u0007\u0005"+
		"\u0000\u0000G\u0016\u0001\u0000\u0000\u0000\u0006\u0000-/6>B\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}