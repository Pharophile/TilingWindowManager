Class {
	#name : #WMWithInspectorTranscriptAndMonticello,
	#superclass : #WMInANewWorldTestCase,
	#instVars : [
		'transcript',
		'monticello',
		'inspector'
	],
	#category : 'TWM-Tests'
}

{ #category : #asserting }
WMWithInspectorTranscriptAndMonticello >> assertWindowFillArea:  aWindow [ 
	self assert: (0@0 extent: 200@200) equals: aWindow bounds.
	self assert: aWindow isActive.
]

{ #category : #running }
WMWithInspectorTranscriptAndMonticello >> setUp [
	super setUp.
	
	inspector := self newWindowFor: #EyeInspectorThatFixesInitialExtentForTesting.
	transcript := self newWindowForModelClass: (Smalltalk at: #Transcript) class.
	monticello := self newWindowFor: #MCWorkingCopy.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testMonticellosShouldContainsMCBrowserWindow [
	self assert: {monticello}  equals: windowManager monticellos.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileInspectorsMaximizedShouldDeMaximizedIt [
	inspector maximize.
	windowManager tileInspectors.
	self deny: inspector isMaximized.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileInspectorsShouldPutInspectorFullArea [
	windowManager tileInspectors.
	self assertWindowFillArea: inspector.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileMonticellosShouldPutMCFullArea [
	windowManager tileMonticellos.
	self assertWindowFillArea: monticello.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileToolsShouldPutTranscriptFullArea [
	windowManager tileTools.
	self assertWindowFillArea: transcript.
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileVisibleWindowsShouldDistributeThemInOrderOfActivation [
	inspector activate.
	transcript activate.
	monticello activate.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 200@100) equals: monticello bounds.
	self assert: (0@100 extent: 100@100) equals: transcript bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	

	transcript activate.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 200@100) equals: transcript bounds.
	self assert: (0@100 extent: 100@100) equals: monticello bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	
]

{ #category : #'tile tests' }
WMWithInspectorTranscriptAndMonticello >> testTileVisibleWindowsWithVerticalLayoutStrategyShouldDistributeThemInOrderOfActivation [
	inspector activate.
	transcript activate.
	monticello activate.
	TilingWM layoutStrategyClassName: #TWMVerticalLayoutStrategy.
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 100@200) equals: monticello bounds.
	self assert: (100@0 extent: 100@100) equals: transcript bounds.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
	
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveBottomLeftShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveBottomLeft.
	self assert: (0@100 extent: 100@100) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveBottomRightShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveBottomRight.
	self assert: (100@100 extent: 100@100) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveBottomShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveBottom.
	self assert: (0@100 extent: 200@100) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveLeftShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveLeft.
	self assert: (0@0 extent: 100@200) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveRightShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveRight.
	self assert: (100@0 extent: 100@200) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveTopLeftShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveTopLeft.
	self assert: (0@0 extent: 100@100) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveTopRightShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveTopRight.
	self assert: (100@0 extent: 100@100) equals: inspector bounds.
]

{ #category : #'move tests' }
WMWithInspectorTranscriptAndMonticello >> testTopWindowMoveTopShouldPlaceIt [
	inspector activate.
	windowManager topWindowMoveTop.
	self assert: (0@0 extent: 200@100) equals: inspector bounds.
]
