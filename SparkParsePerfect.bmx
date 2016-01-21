'DEFAULT SETTINGS:
'=================
' * index starts with 0
' (to be continued)

'IMPORTANT:
'to get the ascii value of a character, type "A"[0] (to get "A"'s ascii value)
'this works for longer strings as well ("Hello"[4] returns "o"'s ascii value)

'@description Data type for string objects that have many manipulation options
'@TODO concept, method implementation, testing
Type S_String
	Field value:String
	
	'@description Sets the value of this object
	'@s The string whose value is assigned to this object
	Method SetValue(s:String)
		Self.value = s
	End Method
	
	'@description Gets the string value of this object
	'@return The string value of this object
	Method GetValue:String()
		Return Self.value
	End Method
	
	'@description Returns an index of a given search string.
	'@search The string whose index is needed
	'@flags [first; last; inner=%; occursMin=%; occursMax=%, occursExactly=%]
	'return the specified index of @search
	Method IndexOf:Int(search:String, flags:String="")
		Local selfCharPos:Int = 0
		Local searchCharPos:Int = 0
		Local indexFound:Int = -1
		
		While(selfCharPos < Len(Self.value))
			If(searchCharPos = Len(search)) Then Exit
				
			If(Self.value[selfCharPos] = search[searchCharPos]) Then
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
	
	'@description Returns all indexes of a given search string
	'@TODO
	Method AllIndexesOf:Int[](search:String, flags:String="")
		Return Null
	End Method
	
	'@description Returns the index range (first and last position) of a search string
	'@TODO
	Method IndexRangeOf:Int[](search:String, flags:Int=0)
		Local found:Int = Self.IndexOf(search)
		If(found = -1) Then Return [-1,-1]
		Return Null			
	End Method
	
	'@description Returns all index ranges of a given search string
	'@TODO
	Method AllIndexRangesOf()
		
	End Method
	
	'@description Searches for a Pattern in self
	'@TODO
	Method Search:Int(pattern:S_Pattern, flags:String="")
		Return -1
	End Method

	'@description Returns a substring of self with left and right borders.
	'@startPos The left border (where the result starts)
	'@endPos The right border (where the result ends) 
	'@flags: [endAsLength] -> return substring from startPos to (startPos+end)
	Method SubString:String(startPos:Int, endPos:Int, flags:String="")
		Local result:String = ""
		For Local i:Int = startPos To endPos
			result = result + Chr(Self.value[i])
		Next
		Return result
	End Method
	
	'@description Exchanges the occurrence(s) of a search string by a replacement string
	'@search The string that should be replaced
	'@replacement the string that will replace @search
	'@flags [self] -> apply to this object; [new] -> return reverse string to new String object
	'@return null if applied to self; otherwise the exchanged string
	Method Exchange:String(search:String, replacement:String, flags:String)
		Return ""
	End Method
	
	'@description Returns the ASCII code of the string character at a given position
	'@pos The position of the wanted character
	'@return the ASCII code of the string character at @pos
	Method AsciiAt:Int(pos:Int)
		Return Self.Value[pos]
	End Method
	
	'@description Returns the string character at a given position
	'@pos The position of the wanted character
	'@return the string character at @pos
	Method CharAt:String(pos:Int)
		Return Chr(Self.AsciiAt(pos))
	End Method
	
	'@description Splits self into a new String array divided by a delimiter string
	'@delimiter A delimiter string by which this object is split
	'@returns Null if delimiter not found, otherwise an array with separated strings
	'@TODO
	Method Split:String[](delimiter:String)
		Local delimiterOccurences = Self.CountOccurrences(delimiter)
		If(delimiterOccurences = 0) Then Return Null
		
		Local result:String[] = New String[delimiterOccurences-1]
		For Local i:Int = 0 To delimiterOccurences-1
			'result[i] = SubString()
		Next
	End Method
	
	'@description Counts how often a search string occurs
	'@search The search string
	'@flags TODO
	'@return 0 if not found, otherwise the number of occurrences
	Method CountOccurrences(search:String, flags:String="")
		Local result = 0
		Local pos:Int = 0
		Local i:Int = -1
		Repeat
			i = Self.IndexOf(search, "inner="+pos)
			If(i = -1) Then Exit
			result = result + 1
		Forever
		Return result
	End Method
	
	'@description Reverses the order of all string characters
	'@flags [self] -> apply to this object; [new] -> return reverse string to new String object
	'@return null if applied to self; otherwise the reverse string
	Method Reverse:String(flags:String="self")
		
	End Method
	
End Type

'@description Creates a new S_String object
'@value The string value for the new S_String object
'@return The new S_String object with @value
Function CreateSparkString:S_String(value:String)
	Local s:S_String = New S_String
	s.value = value
	Return s
End Function

'@description Data type for Pattern like RegEx's
'@TODO
Type S_Pattern
	'@description An arbitrary subset of @set occurs certain times
	'@set An S_StringSet object
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAny:Int(set:S_StringSet, howOftenMin:Int, howOftenMax:Int)
		
	End Method
	
	'@description A subset of @set with at least @howMany strings occurs certain times
	'@set An S_StringSet object
	'@howMany how many strings the subset of @set must have at least
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAtLeast(set:S_StringSet, howMany:Int, howOftenMin:Int, howOftenMax:Int)
	
	End Method
	
	'@description A subset of @set with at most @howMany strings occurs certain times
	'@set An S_StringSet object
	'@howMany how many strings the subset of @set can have at most
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAtMost(set:S_StringSet, howMany:Int, howOftenMin:Int, howOftenMax:Int)
	
	End Method
	
	'@description All strings of @set occur certain times
	'@set An S_StringSet object
	'@howOftenMin how often the set occurs at least
	'@howOftenMax how often the set occurs at most
	'@TODO
	Method OccursEvery(set:S_StringSet, howOftenMin:Int, howOftenMax:Int)
		
	End Method
End Type

'@description Data type for String collections that can be used for S_Pattern objects.
'@TODO
Type S_StringSet
	Field values:String[]

	'@description Adds a new String to Self
	'@newString a new String for this set
	Method Add(newString:String)
		
	End Method
	
	'@description Adds some new Strings to Self
	'@newString some new Strings for this set
	Method AddMany(newStrings:String[])
		
	End Method
End Type

'@description Data type for results after @Search-Method was executed on an S_String object
'@TODO
Type S_Trove
	Field howOften:Int				'how often the pattern was found
	Field atWhichPosition:Int[]		'at which position(s) in the string
	Field result:String[]				'what is (are) the result string(s)
End Type