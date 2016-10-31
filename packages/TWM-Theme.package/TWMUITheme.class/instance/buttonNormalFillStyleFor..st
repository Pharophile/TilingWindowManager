fill-styles-buttons
buttonNormalFillStyleFor: aButton
	"Return the normal button fillStyle for the given button."
	
	|aColor|
	aColor := self buttonColorFor: aButton.
	^(GradientFillStyle ramp: {
			0.0->Color white.
			0.1->aColor twiceLighter.
			0.9->aColor darker.
			1.0->aColor twiceDarker darker duller})
		origin: aButton bounds origin;
		direction: 0 @ aButton height;
		radial: false