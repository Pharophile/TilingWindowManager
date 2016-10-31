switching worlds
createOrSwitchToWorldNamed: aString
	self switchToWorld: (self worldNamed: aString ifAbsent: [self newWorldNamed: aString])