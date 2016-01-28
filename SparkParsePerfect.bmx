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
	'@flags [first; last; inner=%; innerLast=%; occursMin=%; occursMax=%; occursExactly=%; ignoreCase]
	'return the specified index of @search
	Method IndexOf:Int(search:String, flags:String="first;")
		Local selfCharPos:Int = 0		'current position inside self
		Local searchCharPos:Int = 0		'current position inside the search string
		Local indexFound:Int = -1		'the position where the wanted index was found, or -1
		Local minIndexes:Int = -1		'how many indexes need to occur at least
		Local maxIndexes:Int = 10000	'how many indexes need to occur at most
		Local totalIndexes:Int = 0		'how many indexes have been found
		Local targetIndex:Int			'the how maniest index should be returned
		Local selfFormatted:String = Self.value
		Local searchFormatted:String = search
		
		'parse flags
		Local flagParser:S_FlagParser = New S_FlagParser
		flagParser.GetFlags(flags)
		For Local i:Int = 0 To Len(flagParser.key)-1
			Select flagParser.key[i]
				Case "first"
					targetIndex = 1
				Case "last"
					targetIndex = -1
				Case "inner"
					'Print "inner flag matched with value "+flagParser.value[i]
					targetIndex = Int(flagParser.value[i])
				Case "innerLast"
					targetIndex = 0 - Int(flagParser.value[i])
				Case "occursMin"
					minIndexes = Int(flagParser.value[i])
				Case "occursMax"
					maxIndexes = Int(flagParser.value[i])
				Case "occursExactly"
					minIndexes = Int(flagParser.value[i])
					maxIndexes = Int(flagParser.value[i])
				Case "ignoreCase"
					selfFormatted = Lower(selfFormatted)
					searchFormatted = Lower(searchFormatted)
			End Select
		Next
		
		While(selfCharPos < Len(selfFormatted))
			'Print "selfCharPos: "+selfCharPos
			'Print "searchCharPos: "+searchCharPos
				
			If(selfFormatted[selfCharPos] = searchFormatted[searchCharPos]) Then
				If(indexFound = -1) Then indexFound = selfCharPos
				searchCharPos = searchCharPos + 1
			Else
				searchCharPos = 0
				indexFound = -1
			EndIf
			
			selfCharPos = selfCharPos + 1
			
			If(searchCharPos = Len(search)) Then 
				totalIndexes = totalIndexes + 1
				If(((targetIndex = totalIndexes) Or targetIndex < 0) And (totalIndexes >= minIndexes) And (totalIndexes <= maxIndexes)) Then Exit
				searchCharPos = 0
			EndIf
		Wend

		If(targetIndex <> totalIndexes) Then indexFound = -1 
		Return indexFound
	End Method
	
	'@description Returns all indexes of a given search string
	'@search The string whose index is needed
	'@flags [occursMin=%; occursMax=%, occursExactly=%, ignoreCase]
	'@return all indexes of @search
	Method AllIndexesOf:Int[](search:String, flags:String="")
		Local result:Int[]
		Local lookIndex:Int = 1
		Repeat
			Print "hanging in AllIndexesOf with inner="+lookIndex
			'TODO: pass the remaining flags too
			Local currentResult:Int = Self.IndexOf(search, "inner="+lookIndex+";")
			If(currentResult > -1) Then
				result = result[..(Len(result)+1)]
				result[Len(result)-1] = currentResult
				lookIndex = lookIndex + 1
			Else
				Exit
			EndIf
		Forever
		
		Return result
	End Method
	
	'@description Returns the index range (first and last position) of a search string
	'@search The string whose index is needed
	'@flags [first; last; inner=%; occursMin=%; occursMax=%; occursExactly=%; ignoreCase]
	'return the specified index range of @search
	Method IndexRangeOf:Int[](search:String, flags:String="first;")
		Local found:Int = Self.IndexOf(search, flags)
		If(found = -1) Then Return [-1,-1]
		Local result:Int[] = New Int[2]
		result[0] = found
		result[1] = found + Len(search)-1		
		Return result
	End Method
	
	'@description Returns all index ranges of a given search string
	'@search The string whose index is needed
	'@flags [occursMin=%; occursMax=%, occursExactly=%]
	'return all index ranges of @search
	'@TODO
	Method AllIndexRangesOf()
		
	End Method
	
	'@description Searches for a Pattern in self
	'@pattern 
	'@flags 
	'@TODO
	Method Search:S_Trove(pattern:S_Pattern, flags:String="")
		Local result:S_Trove = New S_Trove
		
		'For Local p:
			
		Return result
	End Method

	'@description Returns a substring of self with left and right borders.
	'@startPos The left border (where the result starts)
	'@endPos The right border (where the result ends) 
	'@flags: [endAsLength] -> return substring from startPos to (startPos+end)
	Method SubString:String(startPos:Int, endPos:Int, flags:String="endAsPos")
		Local result:String = ""
		Local endPosReal:Int = endPos
		If(flags = "endAsLength") Then endPosReal = endPosReal + startPos
		For Local i:Int = startPos To endPosReal
			result = result + Chr(Self.value[i])
		Next
		Return result
	End Method
	
	'@description Exchanges the occurrence(s) of a search string by a replacement string
	'@search The string that should be replaced
	'@replacement the string that will replace @search
	'@flags [self] -> apply to this object; [new] -> return exchanged string to new String object
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
		Local delimiterIndexes:Int[] = Self.AllIndexesOf(delimiter)
		If(Len(delimiterIndexes) = 0) Then Return Null
		
		Local result:String[] 
		'if delimiter occurs at last position of self, there is no part-string behind it
		If(delimiterIndexes[Len(delimiterIndexes)-1] = Len(Self.value)-1) Then
			result = New String[Len(delimiterIndexes)]
		Else
			result = New String[Len(delimiterIndexes)+1]
		EndIf
		
		Local startPos:Int = 0
		For Local i:Int = 0 To Len(delimiterIndexes)-1
			result[i] = Self.SubString(startPos, delimiterIndexes[i]-1)
			startPos = delimiterIndexes[i] + 1
		Next
		If(startPos < Len(Self.value)) Then result[Len(delimiterIndexes)] = Self.SubString(startPos, Len(Self.value)-1)
		
		Return result
	End Method
	
	'@description Counts how often a search string occurs
	'@search The search string
	'@flags TODO
	'@return 0 if not found, otherwise the number of occurrences
	Method CountOccurrences:Int(search:String, flags:String="")
		Local result:Int = 0
		Local pos:Int = 1
		Local i:Int = -1
		Repeat
			i = Self.IndexOf(search, "inner="+pos+";")
			If(i = -1) Then Exit
			pos = pos + 1
			result = result + 1
		Forever
		Return result
	End Method
	
	'@description Reverses the order of all string characters
	'@flags [self] -> apply to this object; [new] -> return reverse string to new String object
	'@return null if applied to self; otherwise the reverse string
	Method Reverse:String(flags:String="self")
		Local result:String = ""
		For Local i:Int = Len(Self.value)-1 To 0 Step -1
			result = result + Self.CharAt(i)
		Next
	
		If(flags = "self") Then
			Return Null
		Else
			Return result
		EndIf
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

'@description Data type for Flag Parsing (used mainly in S_String object methods)
'@key A string array which saves all keys (=flag names)
'@value A string array which saves all flag values (if they exist)
Type S_FlagParser
	Field key:String[] = New String[0]
	Field value:String[] = New String[0]
	
	'@description Parses all flags from a given string and stores them in the object's @key / @value field
	'@flags An string that contains flags
	'@annotation This method uses "classical" string functions instead of S_String methods to avoid infinite loops
	Method GetFlags(flags:String)
		'get all delimiter positions
		Local delimiterPos:Int[] = New Int[0]
		Local currentDelimiterPos:Int = 0
		Repeat
			currentDelimiterPos = Instr(flags,";", currentDelimiterPos+1)
			If(currentDelimiterPos = 0) Then Exit
			delimiterPos = delimiterPos[..Len(delimiterPos)+1]
			delimiterPos[Len(delimiterPos)-1] = currentDelimiterPos
		Forever
		
		For Local i:Int=0 To Len(delimiterPos)-1
			Local startPos:Int
			If(i = 0) Then
				startPos = 1
			Else
				startPos = delimiterPos[i-1]+1
			EndIf
			Local flag:String = Trim(Mid(flags, startPos, delimiterPos[i]-startPos))
			
			Self.key = Self.key[..Len(Self.key)+1]
			Self.value = Self.value[..Len(Self.value)+1]
			Local equalsPos:Int = Instr(flag, "=")
			If(equalsPos > 0) Then
				Self.key[Len(Self.key)-1] = Mid(flag, 1, equalsPos-1)
				Self.value[Len(Self.value)-1] = Mid(flag, equalsPos+1)
			Else
				Self.key[Len(Self.key)-1] = flag
				Self.value[Len(Self.value)-1] = ""
			EndIf
		Next
	End Method
End Type

'@description Data type for Patterns like RegEx's
'@chain A TList object which saves the elements of which the Pattern consists
'@TODO
Type S_Pattern
	Field chain:TList

	'@description An arbitrary subset of @set occurs certain times
	'@set An S_StringSet object
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAny:Int(set:S_StringSet, howOftenMin:Int, howOftenMax:Int)
		AddOccurrence(set, -1, howOftenMin, howOftenMax, "any")
	End Method
	
	'@description A subset of @set with at least @howMany strings occurs certain times
	'@set An S_StringSet object
	'@howMany how many strings the subset of @set must have at least
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAtLeast(set:S_StringSet, howMany:Int, howOftenMin:Int, howOftenMax:Int)
		AddOccurrence(set, howMany, howOftenMin, howOftenMax, "at_least")
	End Method
	
	'@description A subset of @set with at most @howMany strings occurs certain times
	'@set An S_StringSet object
	'@howMany how many strings the subset of @set can have at most
	'@howOftenMin how often the subset occurs at least
	'@howOftenMax how often the subset occurs at most
	'@TODO
	Method OccursAtMost(set:S_StringSet, howMany:Int, howOftenMin:Int, howOftenMax:Int)
		AddOccurrence(set, howMany, howOftenMin, howOftenMax, "at_most")
	End Method
	
	'@description All strings of @set occur certain times
	'@set An S_StringSet object
	'@howOftenMin how often the set occurs at least
	'@howOftenMax how often the set occurs at most
	'@TODO
	Method OccursEvery(set:S_StringSet, howOftenMin:Int, howOftenMax:Int)
		AddOccurrence(set, -1, howOftenMin, howOftenMax, "every")
	End Method
	
	'@description A "parent pattern" occurs several times
	'@pattern A "parent" S_Pattern object
	'@howOftenMin how often @pattern occurs at least
	'@howOftenMax how often @pattern occurs at most
	'@TODO
	Method OccursPattern(pattern:S_Pattern, howOftenMin:Int, howOftenMax:Int)
		
	End Method
	
	Method AddOccurrence(set:S_StringSet, howMany:Int, howOftenMin:Int, howOftenMax:Int, sort:String)
		Local o:S_Occurrence = New S_Occurrence
		o.set = set
		o.howMany = howMany
		o.howOftenMin = howOftenMin
		o.howOftenMax = howOftenMax
		o.sort = sort
		chain.AddLast(o)
	End Method
	
	Method Find(search:S_String)
		For o:S_Occurrence = EachIn chain
			For s:String = EachIn o.set
				Local totalOccurrences:Int[] = search.AllIndexesOf(s)
				If(Len(totalOccurrences) >= o.howOftenMin And Len(totalOccurrences) <= o.howOftenMax) Then
					'add sub-result
				EndIf
			Next
		Next
	End Method
End Type

'@description Data type for Occurrences of S_StringSet's
Type S_Occurrence
	Field set:S_StringSet
	Field howMany:Int
	Field howOftenMin:Int
	Field howOftenMax:Int
	Field sort:String
End Type

'@description Data type for String collections that can be used for S_Pattern objects.
'@TODO
Type S_StringSet
	Field chain:String[]

	'@description Adds a new String to Self
	'@newString a new String for this set
	Method Add(newString:String)
		Self.chain = Self.chain[..Len(Self.chain)+1]
		Self.chain[Len(Self.chain)-1] = newString
	End Method
	
	'@description Adds some new Strings to Self
	'@newString some new Strings for this set
	Method AddMany(newStrings:String[])
		For Local currentString:String = EachIn newStrings
			Self.Add(currentString)
		Next
	End Method
End Type

'@description Data type for results after @Search-Method was executed on an S_String object
'@TODO
Type S_Trove
	Field result:String[]			'what is (are) the result string(s)
	Field howOften:Int				'how often the pattern was found
	Field atWhichPosition:Int[]		'at which position(s) in the string
End Type