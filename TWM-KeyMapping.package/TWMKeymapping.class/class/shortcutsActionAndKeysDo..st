enumerating
shortcutsActionAndKeysDo: aBlock
	self shortcuts do: [:actionDescShortcut|
		aBlock 
			value: actionDescShortcut key key
			value: actionDescShortcut value value
			value: actionDescShortcut key value.
	].