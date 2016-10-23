create / remove worlds
deleteWorldNamed: aString
	| worldToDelete |
	(worlds includesKey: aString)
		ifFalse: [ ^ self error: 'World named ' , aString , ' does not exists!' ].
	worldToDelete := self worldNamed: aString.
	worlds removeKey: aString.
	World = worldToDelete ifTrue: [self switchToWorld: worlds values first]. 
