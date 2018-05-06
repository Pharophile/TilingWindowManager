Extension { #name : #SystemWindow }

{ #category : #'*twm-core' }
SystemWindow >> expandAndActivate [
	self 
		show;
		expand;
		comeToFront;
		activate.
]

{ #category : #'*twm-core' }
SystemWindow >> printOn: aStream [
	
	self model 
		ifNil:  [super printOn: aStream]
		ifNotNil: [aStream
					nextPutAll:  self className;
					nextPutAll:' for ['.
				self model printOn: aStream.
				aStream nextPutAll:  '] ('; 
					print: self identityHash;
					nextPutAll:  ')' ].
]
