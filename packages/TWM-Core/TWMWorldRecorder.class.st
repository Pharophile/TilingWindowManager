"
I create and store snapshots of the world, so you can go back and forth between different windows / world contexts
"
Class {
	#name : #TWMWorldRecorder,
	#superclass : #Object,
	#instVars : [
		'world',
		'snapshots',
		'currentPosition'
	],
	#classInstVars : [
		'world'
	],
	#category : 'TWM-Core'
}

{ #category : #'initialize-release' }
TWMWorldRecorder class >> of: aWorld [
	^ self new world: aWorld
]

{ #category : #navigate }
TWMWorldRecorder >> backward [	
	| currentWorld |
	currentWorld := (TWMWorldSnapshot of: world).
	(self snapshots includes: currentWorld) 
		ifFalse: [self snapshots add: currentWorld.
				self currentPosition:  self currentPosition + 1].
	self currentPosition:  self currentPosition - 1.  
	self restoreCurrentSnapshot.
]

{ #category : #accessing }
TWMWorldRecorder >> currentPosition [ 
	^ currentPosition ifNil: [currentPosition := 1]
]

{ #category : #accessing }
TWMWorldRecorder >> currentPosition: anInteger [
	anInteger > 0 ifTrue: [currentPosition := (anInteger min: self snapshots size)].
]

{ #category : #accessing }
TWMWorldRecorder >> currentSnapshot [ 
	^ self snapshots at: (self currentPosition)
]

{ #category : #snapshot }
TWMWorldRecorder >> deleteCurrentSnapshot [
	(self snapshots size = 1) not  ifTrue: [
		self snapshots remove:  self currentSnapshot.
		self currentPosition:  self currentPosition - 1.
		]
]

{ #category : #navigate }
TWMWorldRecorder >> forward [
	self isAtLast ifFalse: [ 
		self currentPosition: self currentPosition + 1.
		self restoreCurrentSnapshot.
	]
]

{ #category : #testing }
TWMWorldRecorder >> isAtLast [
	^ self currentPosition = self snapshots size.
]

{ #category : #printing }
TWMWorldRecorder >> printPositionOn:  aStream [
	aStream  nextPutAll:   self currentPosition asString, '/',  self snapshots size asString.  
]

{ #category : #snapshot }
TWMWorldRecorder >> restoreCurrentSnapshot [ 
	self currentSnapshot restore.
]

{ #category : #snapshot }
TWMWorldRecorder >> snapshot [
	self snapshots add: (TWMWorldSnapshot of: world).
	self currentPosition:  self snapshots  size.
]

{ #category : #accessing }
TWMWorldRecorder >> snapshots [ 
	^ snapshots ifNil: [snapshots := OrderedCollection new]
]

{ #category : #accessing }
TWMWorldRecorder >> world: aPasteUpMorph [ 
	world := aPasteUpMorph.
	self snapshot.
]
