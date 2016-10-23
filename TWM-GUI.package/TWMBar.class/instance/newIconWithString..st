icon
newIconWithString: aString
	^ ((SimpleButtonMorph new)
		extent: 16 @ 16;
		color: Color transparent;
		label: aString) imageForm