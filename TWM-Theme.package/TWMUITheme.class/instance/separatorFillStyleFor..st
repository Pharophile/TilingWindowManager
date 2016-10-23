fill-styles
separatorFillStyleFor: aSeparator
	"Return the separator fillStyle for the given separator."
	
	^ SolidFillStyle color: (self baseColorFor: aSeparator) darker