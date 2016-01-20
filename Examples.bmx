'Examples for the SparkParsePerfect Module
Include "SparkParsePerfect.bmx"

'Create an arbitrary string of type S_String
Global helloWorld:S_String = CreateSparkString("The quick brown fox jumps over the lazy cat!")
Print helloWorld.value						'Pure string value
Print helloWorld.IndexOf("quick","first")	'Index of the letter "q" where the string "quick" first occurs
Print helloWorld.IndexOf("the","last")		'Index of the letter "t" where the string "the" last occurs
Print helloWorld.SubString(10,18)			'Sub-String from position 11 to 19 (both inclusive; index 0)
Print helloWorld.AsciiAt(3)					'Ascii code of character at position 3 (= space character [32])
Print helloWorld.CharAt(4)					'character at position 4 ["q"]
Print helloWorld.CountOccurrences("a")		'how often letter "a" occurs in the string [2]


Print "==================="
Print "AWESOME, RIGHT?! ;)"