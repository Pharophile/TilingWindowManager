switching worlds
switchToWorldNamed: aString
	self halt.
	self switchToWorld: (self worldNamed: aString)