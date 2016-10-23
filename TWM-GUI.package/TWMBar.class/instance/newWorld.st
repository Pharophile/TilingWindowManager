callback
newWorld
	| worldName |
	worldName := (UIManager default request: 'Enter the new World name').
	worldName ifNil: [ ^ self ].
	self createNewWorldNamed: worldName.
	TaskbarMorph showTaskbarPreferenceChanged.