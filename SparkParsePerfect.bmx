SuperStrict

Type SparkParsePerfect
	Field firstIndex:Int = 0

	'set the start value for index based methods (e.g. JavaScript style = 0, BB / BMax style = 1)
	Method SetFirstIndex(index:Int)
		Self.firstIndex = index
	End Method

	'Flags: 1=ignore case; 
	Method IndexOf:Int(s:String, flags:Int)
		
		Return -1
	End Method
	
	Method LastIndexOf:Int(s:String)
		Return -1
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
End Type