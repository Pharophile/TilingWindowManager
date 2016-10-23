factory
newWindowFor: aClassName
	^ self newWindowForModelClass: (Smalltalk at: aClassName).