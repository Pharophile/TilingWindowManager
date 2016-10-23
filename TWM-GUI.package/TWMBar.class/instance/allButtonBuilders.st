custom-buttons
allButtonBuilders 
	^ self allButtonPragmas 
				collect: [:aPragma|  |aButtonBuilder|
									aButtonBuilder := TWMBarButtonBuilder new.
									aPragma methodClass theNonMetaClass 
											perform: aPragma selector 
											with: aButtonBuilder.
									aButtonBuilder].