create / remove worlds
createWorldNamed: aString
	self switchToWorld: (self newWorldNamed: aString)