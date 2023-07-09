// Generated from /Users/gabrielsalvador/Code/controlp5/src/main/java/controlP5/layout/XML.g4 by ANTLR 4.12.0
package controlP5.layout;
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
	static { RuntimeMetaData.checkVersion("4.12.0", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		SELF_CLOSING=1, EMPTY=2, SPACE=3, OPEN=4, OPEN_SLASH=5, CLOSE=6, SLASH_CLOSE=7, 
		EQUALS=8, Name=9, STRING=10;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"SELF_CLOSING", "EMPTY", "SPACE", "OPEN", "OPEN_SLASH", "CLOSE", "SLASH_CLOSE", 
			"EQUALS", "Name", "STRING", "DIGIT", "ALPHA"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, "'<'", "'</'", "'>'", "'/>'", "'='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "SELF_CLOSING", "EMPTY", "SPACE", "OPEN", "OPEN_SLASH", "CLOSE", 
			"SLASH_CLOSE", "EQUALS", "Name", "STRING"
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
		"\u0004\u0000\nP\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b"+
		"\u0007\u000b\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0001"+
		"\u0005\u0001\u001f\b\u0001\n\u0001\f\u0001\"\t\u0001\u0001\u0002\u0001"+
		"\u0002\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0004\u0001"+
		"\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0007\u0001"+
		"\u0007\u0001\b\u0001\b\u0001\b\u0001\b\u0005\b6\b\b\n\b\f\b9\t\b\u0001"+
		"\t\u0001\t\u0005\t=\b\t\n\t\f\t@\t\t\u0001\t\u0001\t\u0001\t\u0005\tE"+
		"\b\t\n\t\f\tH\t\t\u0001\t\u0003\tK\b\t\u0001\n\u0001\n\u0001\u000b\u0001"+
		"\u000b\u0000\u0000\f\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t"+
		"\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u0000\u0017\u0000"+
		"\u0001\u0000\u0006\u0003\u0000\t\n\r\r  \u0002\u0000-.__\u0001\u0000\""+
		"\"\u0001\u0000\'\'\u0001\u000009\u0002\u0000AZazT\u0000\u0001\u0001\u0000"+
		"\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000"+
		"\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000"+
		"\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000"+
		"\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000"+
		"\u0000\u0013\u0001\u0000\u0000\u0000\u0001\u0019\u0001\u0000\u0000\u0000"+
		"\u0003 \u0001\u0000\u0000\u0000\u0005#\u0001\u0000\u0000\u0000\u0007%"+
		"\u0001\u0000\u0000\u0000\t\'\u0001\u0000\u0000\u0000\u000b*\u0001\u0000"+
		"\u0000\u0000\r,\u0001\u0000\u0000\u0000\u000f/\u0001\u0000\u0000\u0000"+
		"\u00111\u0001\u0000\u0000\u0000\u0013J\u0001\u0000\u0000\u0000\u0015L"+
		"\u0001\u0000\u0000\u0000\u0017N\u0001\u0000\u0000\u0000\u0019\u001a\u0003"+
		"\u0007\u0003\u0000\u001a\u001b\u0003\u0011\b\u0000\u001b\u001c\u0003\r"+
		"\u0006\u0000\u001c\u0002\u0001\u0000\u0000\u0000\u001d\u001f\u0003\u0005"+
		"\u0002\u0000\u001e\u001d\u0001\u0000\u0000\u0000\u001f\"\u0001\u0000\u0000"+
		"\u0000 \u001e\u0001\u0000\u0000\u0000 !\u0001\u0000\u0000\u0000!\u0004"+
		"\u0001\u0000\u0000\u0000\" \u0001\u0000\u0000\u0000#$\u0007\u0000\u0000"+
		"\u0000$\u0006\u0001\u0000\u0000\u0000%&\u0005<\u0000\u0000&\b\u0001\u0000"+
		"\u0000\u0000\'(\u0005<\u0000\u0000()\u0005/\u0000\u0000)\n\u0001\u0000"+
		"\u0000\u0000*+\u0005>\u0000\u0000+\f\u0001\u0000\u0000\u0000,-\u0005/"+
		"\u0000\u0000-.\u0005>\u0000\u0000.\u000e\u0001\u0000\u0000\u0000/0\u0005"+
		"=\u0000\u00000\u0010\u0001\u0000\u0000\u000017\u0003\u0017\u000b\u0000"+
		"26\u0003\u0017\u000b\u000036\u0003\u0015\n\u000046\u0007\u0001\u0000\u0000"+
		"52\u0001\u0000\u0000\u000053\u0001\u0000\u0000\u000054\u0001\u0000\u0000"+
		"\u000069\u0001\u0000\u0000\u000075\u0001\u0000\u0000\u000078\u0001\u0000"+
		"\u0000\u00008\u0012\u0001\u0000\u0000\u000097\u0001\u0000\u0000\u0000"+
		":>\u0005\"\u0000\u0000;=\b\u0002\u0000\u0000<;\u0001\u0000\u0000\u0000"+
		"=@\u0001\u0000\u0000\u0000><\u0001\u0000\u0000\u0000>?\u0001\u0000\u0000"+
		"\u0000?A\u0001\u0000\u0000\u0000@>\u0001\u0000\u0000\u0000AK\u0005\"\u0000"+
		"\u0000BF\u0005\'\u0000\u0000CE\b\u0003\u0000\u0000DC\u0001\u0000\u0000"+
		"\u0000EH\u0001\u0000\u0000\u0000FD\u0001\u0000\u0000\u0000FG\u0001\u0000"+
		"\u0000\u0000GI\u0001\u0000\u0000\u0000HF\u0001\u0000\u0000\u0000IK\u0005"+
		"\'\u0000\u0000J:\u0001\u0000\u0000\u0000JB\u0001\u0000\u0000\u0000K\u0014"+
		"\u0001\u0000\u0000\u0000LM\u0007\u0004\u0000\u0000M\u0016\u0001\u0000"+
		"\u0000\u0000NO\u0007\u0005\u0000\u0000O\u0018\u0001\u0000\u0000\u0000"+
		"\u0007\u0000 57>FJ\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}