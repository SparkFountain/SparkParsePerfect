'Examples for the SparkParsePerfect Module
Include "SparkParsePerfect.bmx"

Global parser:S_Parser = New S_Parser

'Create an arbitrary string of type S_String
Global helloWorld:S_String = CreateSparkString("The quick brown fox jumps over the lazy cat!")
Print helloWorld.value						'Pure string value
Print helloWorld.IndexOf("quicks",S_FIRST)	'Index of the letter "q" where the string "quick" first occurs
Print helloWorld.IndexOf("the",S_LAST)		'Index of the letter "t" where the string "the" last occurs


Print "==================="
Print "AWESOME, RIGHT?! ;)"