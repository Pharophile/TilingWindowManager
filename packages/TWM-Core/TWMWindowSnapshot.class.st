"
I remember the state of a SystemWindow (bounds, minimized / maximized) and I'm able to restore it later.
"
Class {
	#name : #TWMWindowSnapshot,
	#superclass : #Object,
	#instVars : [
		'window',
		'bounds',
		'shouldRestoreMinimized',
		'shouldRestoreMaximized'
	],
	#category : 'TWM-Core'
}

{ #category : #'initialize-release' }
TWMWindowSnapshot class >> of: aSystemWindow [ 
	^ self new snapshot: aSystemWindow
]

{ #category : #equality }
TWMWindowSnapshot >> = anObject [
	^ (anObject  isKindOf: self class) 
		and: [anObject window = self window 
				and: [anObject bounds = self bounds
						and: [anObject shouldRestoreMinimized = anObject shouldRestoreMinimized 
								and: [anObject shouldRestoreMaximized = anObject shouldRestoreMaximized ]]]].
]

{ #category : #accessing }
TWMWindowSnapshot >> bounds [
	^ bounds
]

{ #category : #equality }
TWMWindowSnapshot >> hash [
	^ (((super hash 
			bitXor: self bounds hash) 
				bitXor: (self window hash)) 
					bitXor: self shouldRestoreMaximized hash) 
						bitXor:  self shouldRestoreMinimized hash.
]

{ #category : #snapshot }
TWMWindowSnapshot >> restore [
	(shouldRestoreMinimized not & window isMinimized) ifTrue: [window expandBoxHit].
	(shouldRestoreMaximized not &window isMaximized) ifTrue: [window expandBoxHit].
	
	shouldRestoreMaximized ifTrue: [window maximize].
	shouldRestoreMinimized ifTrue: [window minimize].
	
	window 
		bounds: bounds;
		activate.
]

{ #category : #accessing }
TWMWindowSnapshot >> shouldRestoreMaximized [ 
	^ shouldRestoreMaximized 
]

{ #category : #accessing }
TWMWindowSnapshot >> shouldRestoreMinimized [
	^ shouldRestoreMinimized 
]

{ #category : #snapshot }
TWMWindowSnapshot >> snapshot:   aSystemWindow [ 
	window := aSystemWindow.
	bounds := window bounds.
	shouldRestoreMinimized := window isMinimized.
	shouldRestoreMaximized := window isMaximized.
]

{ #category : #accessing }
TWMWindowSnapshot >> window [
	^ window
]
