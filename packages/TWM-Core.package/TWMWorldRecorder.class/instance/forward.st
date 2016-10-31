navigate
forward
	self isAtLast ifFalse: [ 
		self currentPosition: self currentPosition + 1.
		self restoreCurrentSnapshot.
	]