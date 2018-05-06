"
I'm a dock used to group windows. Open with:

TWMDockingWindowMorph new openInWorld.
"
Class {
	#name : #TWMDockingWindowMorph,
	#superclass : #Morph,
	#instVars : [
		'groupWindowMorph'
	],
	#classVars : [
		'Default'
	],
	#category : 'TWM-GUI'
}

{ #category : #geometry }
TWMDockingWindowMorph >> defaultExtent [
	^ 400@300
]

{ #category : #geometry }
TWMDockingWindowMorph >> edgeToAdhereTo [
	^ #bottom
]

{ #category : #initialization }
TWMDockingWindowMorph >> initialize [
	"Initialize the receiver."
	super initialize.
	
	self 
		initializeAppearance;
		initializeGroupWindowMorph;
		initializeEdgeGrip.
]

{ #category : #initialization }
TWMDockingWindowMorph >> initializeAppearance [
	self 
		changeProportionalLayout;
		extent: self defaultExtent;
		color: (self theme worldMainDockingBarColorFor: self).
]

{ #category : #initialization }
TWMDockingWindowMorph >> initializeEdgeGrip [
	|topGrip|
	topGrip := EdgeGripMorph new 
					target: self; 
					position: self position; 
					edgeName: #top.
	topGrip layoutFrame topOffset: 22.
	self addMorph: topGrip.
]

{ #category : #initialization }
TWMDockingWindowMorph >> initializeGroupWindowMorph [
	groupWindowMorph := GroupWindowMorph new.
	groupWindowMorph color: Color black.
	self
		addMorph: groupWindowMorph 
		fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1))
]

{ #category : #geometry }
TWMDockingWindowMorph >> intoWorld: aWorld [
	"Stick to the bottom left now."
	
	self
		setToAdhereToEdge: #bottomLeft;
		updateBounds.
	super intoWorld: aWorld
]

{ #category : #testing }
TWMDockingWindowMorph >> isAdheringToBottom [
	^ true
]

{ #category : #testing }
TWMDockingWindowMorph >> isAdheringToLeft [
	^ false
]

{ #category : #testing }
TWMDockingWindowMorph >> isAdheringToRight [
	^ false
]

{ #category : #testing }
TWMDockingWindowMorph >> isAdheringToTop [
	^ false
]

{ #category : #testing }
TWMDockingWindowMorph >> isDockingBar [
	"Answer yes so we get updated when the Display is resized."

	^true
]

{ #category : #geometry }
TWMDockingWindowMorph >> minimumExtent [
	^ 400@50
]

{ #category : #'event handling' }
TWMDockingWindowMorph >> ownerChanged [
	"The receiver's owner has changed its layout.
	Since this method is called synchronously in the
	ui, delete the receiver if there are any excpetions."
	
	self owner ifNil: [^self].
	[self updateBounds]
		on: Exception
		do: [:ex | self delete. ex pass].
	super ownerChanged
]

{ #category : #accessing }
TWMDockingWindowMorph >> popUpOwner [

		^nil
]

{ #category : #initialization }
TWMDockingWindowMorph >> updateBounds [
	"Update the receiver's bounds to fill the world."

	self
		width: self owner width;
		snapToEdgeIfAppropriate.
]
