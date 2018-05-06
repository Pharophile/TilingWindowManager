Extension { #name : #PasteUpMorph }

{ #category : #'*twm-core' }
PasteUpMorph class >> defaultWorldColor [
	^ Color white.

]

{ #category : #'*twm-core' }
PasteUpMorph >> initAsTestWorld: aWorldState [
	worldState := aWorldState.
	bounds := Display boundingBox.
	self viewBox: bounds.
]

{ #category : #'*twm-core' }
PasteUpMorph >> initAsWorld: aWorldState [
	worldState := aWorldState.
	bounds := Display boundingBox.
	self color: self defaultWorldColor.
	self addHand: HandMorph new.
	self setProperty: #optimumExtentFromAuthor toValue: Display extent.
	self borderWidth: 0.
	"model := nil." "This doesn't exists in PasteUpMorph anymore."
]

{ #category : #'*twm-core' }
PasteUpMorph class >> newWorld [

	^ self new initAsWorld: WorldState new
]

{ #category : #'*twm-core' }
PasteUpMorph >> prepareToDeactivate [
	"Some things still may need to be brought from Squeak:
		* MorphicProject>>pauseSoundPlayers"

	self
		triggerEvent: #aboutToLeaveWorld;
		sleep.
		
	Sensor
		flushNonKbdEvents;
		flushKeyboard.
]
