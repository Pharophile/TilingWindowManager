enumerating
shortcutsActionAndDescriptionDo: aBlock
	self shortcuts do: [:actionDescShortcut|
		aBlock 
			value: actionDescShortcut key key
			value: actionDescShortcut key value.
	].