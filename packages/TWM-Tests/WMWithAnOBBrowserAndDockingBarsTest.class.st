Class {
	#name : #WMWithAnOBBrowserAndDockingBarsTest,
	#superclass : #WMInANewWorldTestCase,
	#instVars : [
		'taskBar',
		'obbrowser',
		'leftBar'
	],
	#category : 'TWM-Tests'
}

{ #category : #testing }
WMWithAnOBBrowserAndDockingBarsTest >> expectedFailures [
	^ (Smalltalk at: #OBSystemBrowser ifAbsent: nil)   
		ifNil: [self class testSelectors]
		ifNotNil: [#()]
]

{ #category : #running }
WMWithAnOBBrowserAndDockingBarsTest >> setUp [
	super setUp.
	
	obbrowser :=  self newWindowFor:  #OBSystemBrowser.
	
	taskBar := TaskbarMorph new 
					openInWorld: testWorld;
					adhereToEdge: #bottom.
	
	leftBar := DockingBarMorph new 
						adhereToLeft;
						width: 25;
						openInWorld: testWorld.
]

{ #category : #tests }
WMWithAnOBBrowserAndDockingBarsTest >> testBrowsersShouldReturnOBBrowser [
	self assert: {obbrowser} equals: windowManager browsers   
]

{ #category : #tests }
WMWithAnOBBrowserAndDockingBarsTest >> testTaskbarHeightShouldBeMoreThanZero [
	self assert: (taskBar height > 0)
]

{ #category : #tests }
WMWithAnOBBrowserAndDockingBarsTest >> testTileVisibleWindowsShouldNotCoverDockedBar [
	windowManager tileVisibleWindows.
	self assert: ((leftBar width)@0 extent: (200 - leftBar width)@(200 - taskBar height)) equals: obbrowser bounds.
]
