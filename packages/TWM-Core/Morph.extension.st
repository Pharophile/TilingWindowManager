Extension { #name : #Morph }

{ #category : #'*TWM-Core' }
Morph >> moveToWorldNamed: aString [

	| destination |
	destination := TWMWorldManager instance worldNamed: aString.
	destination addMorph: self.
]
