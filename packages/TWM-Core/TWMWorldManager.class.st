"
I provide an unlimited number of blank canvases on which to create...

""Add a world:""
TWMWorldManager instance createOrSwitchToWorldNamed: 'JustAnotherWorld'. 

""Return to the default world:""
TWMWorldManager instance createOrSwitchToWorldNamed: 'Pharo'.

See http://forum.world.st/Multiple-Worlds-was-Re-Can-I-use-Projects-in-Pharo-td2240869.html for original discussion.
"
Class {
	#name : #TWMWorldManager,
	#superclass : #Object,
	#instVars : [
		'worlds'
	],
	#classVars : [
		'Instance'
	],
	#category : 'TWM-Core'
}

{ #category : #'initialize-release' }
TWMWorldManager class >> instance [
	^Instance ifNil: [Instance := self new]
]

{ #category : #'switching worlds' }
TWMWorldManager >> createOrSwitchToWorldNamed: aString [
	self switchToWorld: (self worldNamed: aString ifAbsent: [self newWorldNamed: aString])
]

{ #category : #'create / remove worlds' }
TWMWorldManager >> createWorldNamed: aString [
	self switchToWorld: (self newWorldNamed: aString)
]

{ #category : #accessing }
TWMWorldManager >> currentWorldName [
	 ^ worlds keyAtValue: World
]

{ #category : #'create / remove worlds' }
TWMWorldManager >> deleteCurrentWorld [
	self deleteWorldNamed: (self worlds keyAtValue: World).
]

{ #category : #'create / remove worlds' }
TWMWorldManager >> deleteWorldNamed: aString [
	| worldToDelete |
	(worlds includesKey: aString)
		ifFalse: [ ^ self error: 'World named ' , aString , ' does not exists!' ].
	worldToDelete := self worldNamed: aString.
	worlds removeKey: aString.
	World = worldToDelete ifTrue: [self switchToWorld: worlds values first]. 

]

{ #category : #initialization }
TWMWorldManager >> initialize [
	super initialize.
	worlds := Dictionary new.
	^self
]

{ #category : #'create / remove worlds' }
TWMWorldManager >> newWorldNamed: aString [
	| newWorld |
	(worlds includesKey: aString)
		ifTrue: [ ^ self error: 'World named ' , aString , ' already exists!' ].
	newWorld := WorldMorph newWorld.
	worlds at: aString put: newWorld.
	^newWorld 

]

{ #category : #notification }
TWMWorldManager >> notifyWorldChanged [

	 GrowlMorph 
				openWithLabel: 'World changed'
				contents: 'Now in ', self currentWorldName asString
]

{ #category : #'switching worlds' }
TWMWorldManager >> switchToNextWorld [
	| orderedWorlds currentWorldIndex nextWorld |
	self worlds ifNotEmpty: [
		orderedWorlds := self worlds asOrderedCollection.
		currentWorldIndex := orderedWorlds indexOf: World.
		nextWorld := (orderedWorlds last = World)
								ifTrue: [orderedWorlds first]
								ifFalse: [orderedWorlds at: (currentWorldIndex + 1)].
		self switchToWorld: nextWorld.
	]
]

{ #category : #'switching worlds' }
TWMWorldManager >> switchToWorld: newWorld [
	newWorld == World
		ifTrue: [ ^ self ].
	self flag: #TODO. "There is something stinky in here, as World isn't the same instance we expect it to be.."
	(worlds includes: World)
		ifFalse: [ self halt.worlds at: 'XYZ' put: World ].
	World prepareToDeactivate.
	newWorld install.
	WorldState addDeferredUIMessage: [ 
		newWorld restoreMorphicDisplay.
		self notifyWorldChanged ].
]

{ #category : #'switching worlds' }
TWMWorldManager >> switchToWorldNamed: aString [
	self halt.
	self switchToWorld: (self worldNamed: aString)
]

{ #category : #'switching worlds' }
TWMWorldManager >> switchToWorldNamed: aString ifAbsent: aBlock [
	self switchToWorld: (self worldNamed: aString ifAbsent: aBlock)
]

{ #category : #accessing }
TWMWorldManager >> worldNamed: aString [
	^worlds at: aString
]

{ #category : #accessing }
TWMWorldManager >> worldNamed: aString ifAbsent: aBlock [
	^worlds at: aString ifAbsent: aBlock
]

{ #category : #accessing }
TWMWorldManager >> worlds [
	^worlds
]
