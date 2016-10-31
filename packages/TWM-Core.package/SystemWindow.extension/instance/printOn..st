*twm-core
printOn: aStream
	
	self model 
		ifNil:  [super printOn: aStream]
		ifNotNil: [aStream
					nextPutAll:  self className;
					nextPutAll:' for ['.
				self model printOn: aStream.
				aStream nextPutAll:  '] ('; 
					print: self identityHash;
					nextPutAll:  ')' ].