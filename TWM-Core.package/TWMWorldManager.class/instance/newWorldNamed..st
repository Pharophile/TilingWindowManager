create / remove worlds
newWorldNamed: aString
	| newWorld |
	(worlds includesKey: aString)
		ifTrue: [ ^ self error: 'World named ' , aString , ' already exists!' ].
	newWorld := WorldMorph newWorld.
	worlds at: aString put: newWorld.
	^newWorld 
