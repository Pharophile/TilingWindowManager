"
I'm the base class for defining strategies to tile / place windows.

Just implement #tileWindows:
"
Class {
	#name : #TWMLayoutStrategy,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : 'TWM-Core'
}

{ #category : #layout }
TWMLayoutStrategy >> tileWindow: window bounds: bounds [
	window isMaximized ifTrue: [window expandBoxHit].
	window
		expandAndActivate;
		bounds: bounds.
		
]

{ #category : #layout }
TWMLayoutStrategy >> tileWindows: windows [
	self subclassResponsibility
]

{ #category : #accessing }
TWMLayoutStrategy >> world [
	^ world
]

{ #category : #accessing }
TWMLayoutStrategy >> world: anObject [
	world := anObject 
]
