*twm-core
initAsWorld: aWorldState
	worldState := aWorldState.
	bounds := Display boundingBox.
	self color: self defaultWorldColor.
	self addHand: HandMorph new.
	self setProperty: #optimumExtentFromAuthor toValue: Display extent.
	self borderWidth: 0.
	"model := nil." "This doesn't exists in PasteUpMorph anymore."