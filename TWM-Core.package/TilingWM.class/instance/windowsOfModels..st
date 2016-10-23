filter
windowsOfModels:  listOfModels
	|existingClasses|
	existingClasses := listOfModels 
			inject: OrderedCollection new 
			into: [:foundClasses :className| |foundClass|
				foundClass := Smalltalk at: className ifAbsent: nil.
				foundClass ifNotNil: [foundClasses add: foundClass].
				foundClasses.	].

	^ self windows select: [:window|  
							existingClasses  anySatisfy:  [:aClass| 
														 window model isKindOf: aClass]].