layout
tileWindow: window bounds: bounds
	window isMaximized ifTrue: [window expandBoxHit].
	window
		expandAndActivate;
		bounds: bounds.
		