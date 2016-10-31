snapshot
restore
	(shouldRestoreMinimized not & window isMinimized) ifTrue: [window expandBoxHit].
	(shouldRestoreMaximized not &window isMaximized) ifTrue: [window expandBoxHit].
	
	shouldRestoreMaximized ifTrue: [window maximize].
	shouldRestoreMinimized ifTrue: [window minimize].
	
	window 
		bounds: bounds;
		activate.