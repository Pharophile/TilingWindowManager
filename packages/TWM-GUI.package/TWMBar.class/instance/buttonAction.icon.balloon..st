factory
buttonAction: aBlock icon: aForm balloon: aBalloon
	| button |
	button := IconicButton  new
						target: aBlock;
						actionSelector: #value;
						labelGraphic: aForm;		"labelGraphic: aForm or labelFromString: aBalloon"						
						color: Color transparent.
	aBalloon ifNotNil: [ button setBalloonText: aBalloon ].
	^ button