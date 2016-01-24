SuperStrict

'Examples for the SparkParsePerfect Module
Include "SparkParsePerfect.bmx"

'Create an arbitrary string of type S_String
Global helloWorld:S_String = CreateSparkString("The quick brown fox jumps over the lazy cat!")
Print "==================="
Print "Pure string value: "+helloWorld.value
Print "Index of the letter 'q' where the String 'quick' first occurs: "+helloWorld.IndexOf("quick","first")
Print "Index of the letter 't' where the String 'the' last occurs: "+helloWorld.IndexOf("the","last")

Local allOs:Int[] = helloWorld.AllIndexesOf("o")
Print "All indexes of the letter 'o' [12, 17, 26]:"
For Local i:Int=0 To Len(allOs)-1
	Print allOs[i]
Next

Local quickRange:Int[] = helloWorld.IndexRangeOf("quick")
Print "Index range of substring 'quick' [5, 9]: "+quickRange[0]+", "+quickRange[1]

Print "Substring from position 10 To 18 (both inclusive; index 0) ['brown fox']: "+helloWorld.SubString(10,18)
Print "Ascii code of character at position 3 (= space character [32]): "+helloWorld.AsciiAt(3)
Print "character at position 4 ['q']: "+helloWorld.CharAt(4)
Print "how often letter 'a' occurs in the string [2]: "+helloWorld.CountOccurrences("a")

Print "reverse the whole string: "+helloWorld.Reverse("new")


Print "==================="
Print "AWESOME, RIGHT?! ;)"