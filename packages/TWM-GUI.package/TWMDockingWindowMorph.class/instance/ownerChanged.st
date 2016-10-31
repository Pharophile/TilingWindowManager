event handling
ownerChanged
	"The receiver's owner has changed its layout.
	Since this method is called synchronously in the
	ui, delete the receiver if there are any excpetions."
	
	self owner ifNil: [^self].
	[self updateBounds]
		on: Exception
		do: [:ex | self delete. ex pass].
	super ownerChanged