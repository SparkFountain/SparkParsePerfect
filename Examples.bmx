SuperStrict

'Examples for the SparkParsePerfect Module
Include "SparkParsePerfect.bmx"

'Create an arbitrary string of type S_String
Global helloWorld:S_String = CreateSparkString("The quick brown fox jumps over the lazy cat!")


Print "==================="
Print "Pure string value: "+helloWorld.value
Print "Index of the letter 'q' where the String 'quick' first occurs: "+helloWorld.IndexOf("quick", "first;")
Print "Index of the letter 't' where the String 'the' last occurs: "+helloWorld.IndexOf("the", "last;")

Local allOs:Int[] = helloWorld.AllIndexesOf("o")
Print "All indexes of the letter 'o' [12, 17, 26]:"
For Local i:Int = 0 To Len(allOs)-1
	Print allOs[i]
Next

Local quickRange:Int[] = helloWorld.IndexRangeOf("quick")
Print "Index range of substring 'quick' [4, 8]: "+quickRange[0]+", "+quickRange[1]

Print "Substring from position 10 To 18 (both inclusive; index 0) ['brown fox']: "+helloWorld.SubString(10,18)
Print "Ascii code of character at position 3 (= space character [32]): "+helloWorld.AsciiAt(3)
Print "character at position 22 ['m']: "+helloWorld.CharAt(22)
Print "how often letter 'a' occurs in the string [2]: "+helloWorld.CountOccurrences("a")

Print "reverse the whole string: "+helloWorld.Reverse("new")

Local splitBySpaces:String[] = helloWorld.Split(" ")
Print "Array that contains each Substring split by space character:"
For Local i:Int = 0 To Len(splitBySpaces)-1
	Print splitBySpaces[i]
Next

Print "Find all phone numbers in a string:"
Local dialText:S_String = CreateSparkString("Just dial +49 171 / 123 456 78, 030-99991842 or try (0043) 18956935 for support!")
Print dialText.value
Local countryCode:S_PatternChain = New S_PatternChain
Local initCC:S_Pattern = New S_Pattern
initCC.AddMany(["+", "00"])
initCC.OccursExactly(1)
countryCode.AddPattern(initCC)
Local ccDigits:S_Pattern = New S_Pattern
ccDigits.AddMany(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
ccDigits.Occurs(1, 3)
countryCode.AddPattern(ccDigits)
countryCode.SurroundChoice(["(", "["], [")", "]"], "keepIndex; optional;")
Local trove:S_Trove = dialText.Search(countryCode)
'Print "How often it was found [3]: "+trove.howOften


Print "==================="
Print "AWESOME, RIGHT?! ;)"