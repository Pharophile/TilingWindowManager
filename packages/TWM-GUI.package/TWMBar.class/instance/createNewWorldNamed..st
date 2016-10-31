factory
createNewWorldNamed: aString
	| newWorld |
	newWorld := self worldManager newWorldNamed: aString.
	TWMBar showTWMBar ifTrue: [ TWMBar new openInWorld: newWorld ].
	self worldManager switchToWorld: newWorld.