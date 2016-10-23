navigate
backward	
	| currentWorld |
	currentWorld := (TWMWorldSnapshot of: world).
	(self snapshots includes: currentWorld) 
		ifFalse: [self snapshots add: currentWorld.
				self currentPosition:  self currentPosition + 1].
	self currentPosition:  self currentPosition - 1.  
	self restoreCurrentSnapshot.