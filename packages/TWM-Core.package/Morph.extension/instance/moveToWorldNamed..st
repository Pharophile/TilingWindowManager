*TWM-Core
moveToWorldNamed: aString

	| destination |
	destination := TWMWorldManager instance worldNamed: aString.
	destination addMorph: self.