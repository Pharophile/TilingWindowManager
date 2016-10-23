icon
iconSubmorphBounds: aBlock
	|icon|
	
	icon := Morph new
				color: Color transparent;
				extent: 16@16.
	icon addMorph: ( Morph new
						color: Color gray darker;
						bounds: (aBlock value: icon)).
	^ icon imageForm.