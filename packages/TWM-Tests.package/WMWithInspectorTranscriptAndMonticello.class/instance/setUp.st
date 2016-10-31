running
setUp
	super setUp.
	
	inspector := self newWindowFor: #EyeInspectorThatFixesInitialExtentForTesting.
	transcript := self newWindowForModelClass: (Smalltalk at: #Transcript) class.
	monticello := self newWindowFor: #MCWorkingCopy.