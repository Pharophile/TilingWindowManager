"
I remember the state of all the windows opened in a World and I'm able to restore it later.
"
Class {
	#name : #TWMWorldSnapshot,
	#superclass : #Object,
	#instVars : [
		'world',
		'windowSnapshots',
		'thumbnail'
	],
	#category : 'TWM-Core'
}

{ #category : #'initialize-release' }
TWMWorldSnapshot class >> of: aWorld [
	^ self new snapshot:  aWorld.
]

{ #category : #equality }
TWMWorldSnapshot >> = anObject [
	^ self windowSnapshots = anObject windowSnapshots.
]

{ #category : #equality }
TWMWorldSnapshot >> hash [
	^ super hash bitXor:  windowSnapshots hash.
]

{ #category : #snapshot }
TWMWorldSnapshot >> restore [
	self windowSnapshots reverse do: [:aSnapshot| aSnapshot restore].
	self snapshot.
]

{ #category : #snapshot }
TWMWorldSnapshot >> snapshot [ 
	|worldImage|
	windowSnapshots := world systemWindows collect: [:aWindow|  TWMWindowSnapshot of: aWindow].
	worldImage := World imageForm.
	thumbnail := worldImage magnifyBy: (self thumbnailWidth / worldImage width) asFloat.
]

{ #category : #snapshot }
TWMWorldSnapshot >> snapshot: aWorld [
	world := aWorld.
	self snapshot.
]

{ #category : #accessing }
TWMWorldSnapshot >> thumbnail [
	^ thumbnail ifNil: [Form new]
]

{ #category : #accessing }
TWMWorldSnapshot >> thumbnailWidth [
	^ 200
]

{ #category : #accessing }
TWMWorldSnapshot >> visibleWindows [ 
	^ self windows reject: [:aWindow| aWindow isMinimized]
]

{ #category : #accessing }
TWMWorldSnapshot >> windowSnapshots [ 
	^ (windowSnapshots ifNil: [windowSnapshots := {}])
		reject: [:aSnapshot| aSnapshot window owner isNil].
	
]

{ #category : #accessing }
TWMWorldSnapshot >> windows [
	^ self windowSnapshots collect: [:aWindowSnapshot| aWindowSnapshot window].
]
