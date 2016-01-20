Const S_FIRST:Int = 1
Const S_LAST:Int = 2
Const S_IGNORE_CASE:Int = 4

Function GetFlagArray:Int[](flags:Int)
	
End Function

'IMPORTANT:
'to get the ascii value of a character, type "A"[0] (to get "A"'s ascii value)

Type S_String
	Field value:String
	
	Method SetValue(s:String)
		Self.value = s
	End Method
	
	Method GetValue:String()
		Return Self.value
	End Method
	
	'Flags: 1=ignore case; 
	Method IndexOf:Int(search:String, flags:Int=0)
		Local selfCharPos:Int = 1
		Local searchCharPos:Int = 1
		Local indexFound:Int = -1
		
		While(selfCharPos <= Len(Self.value))
			If(searchCharPos > Len(search)) Then Exit
				
			If(Mid(Self.value, selfCharPos, 1)[0] = Mid(search, searchCharPos, 1)[0]) Then
				If(indexFound = -1) Then indexFound = selfCharPos
				selfCharPos = selfCharPos + 1
				searchCharPos = searchCharPos + 1
			Else
				selfCharPos = selfCharPos + 1
				searchCharPos = 1
				indexFound = -1
			EndIf
		Wend

		Return indexFound
	End Method
	
	Method AllIndexesOf(s:String)
	
	End Method
	
	Method IndexRangeOf:Int[](search:String, flags:Int=0)
		Local found:Int = Self.IndexOf(search)
		If(found = -1) Then Return [-1,-1]
		
		
	End Method
	
	Method AllIndexRangesOf()
		
	End Method
	
	Method Search:Int(s:String, isRegex:Int=0)
		Return -1
	End Method
	
	Method Slice(startPos:Int, endPos:Int)
		'TODO find out how to return arrays
		'Return 
	End Method
	
	'endAsLength: if true, return substring from startPos to (startPos+end)
	Method SubString:String(startPos:Int, endPos:Int, endAsLength:Int=0)
		Return ""
	End Method
	
	Method Replace:String(searchString:String, newString:String, s:String)
		Return ""
	End Method
	
	Method CharAt:String(s:String)
		Return ""
	End Method
	
	Method Split(s:String, delimiter:String)
		'TODO returns an array
	End Method
	
	Method IsSameChar()
		
	End Method
End Type

Function CreateSparkString:S_String(value:String)
	Local s:S_String = New S_String
	s.value = value
	Return s
End Function


Type S_Parser
	Field innerFirstIndex:Int = 0

	'set the start value for index based methods (e.g. JavaScript style = 0, BB / BMax style = 1)
	Method SetFirstIndex(index:Int)
		Self.innerFirstIndex = index
	End Method

	
End Type


Type S_Pattern
	Method Occurs:Int(s:String, howOftenMin:Int, howOftenMax:Int)
		
	End Method
End Type


Type S_CharSet
	
End Type