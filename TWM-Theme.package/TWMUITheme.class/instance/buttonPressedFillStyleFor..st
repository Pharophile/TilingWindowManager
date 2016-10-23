fill-styles-buttons
buttonPressedFillStyleFor: aButton
	"Return the button pressed fillStyle for the given color."

	| aColor c |
	aColor := aButton colorToUse.
	c := aColor luminance > 0.3
		ifTrue: [ aColor blacker ]
		ifFalse: [ aColor whiter ].
	^ (GradientFillStyle
		ramp:
			{(0.0 -> c darker duller).
			(0.1 -> c darker).
			(0.9 -> c twiceLighter).
			(1.0 -> Color white)})
		origin: aButton bounds origin;
		direction: 0 @ aButton height;
		radial: false