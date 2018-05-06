Class {
	#name : #WMInANewWorldTestCase,
	#superclass : #TestCase,
	#instVars : [
		'testWorld',
		'windowManager',
		'backupLayoutStrategy'
	],
	#category : 'TWM-Tests'
}

{ #category : #testing }
WMInANewWorldTestCase class >> isAbstract [
	^ self = WMInANewWorldTestCase
]

{ #category : #factory }
WMInANewWorldTestCase >> newBrowserIn: aWorld [
	^ SystemWindow new
						model: Browser new; 
						openInWorld: testWorld;
						yourself.  
]

{ #category : #factory }
WMInANewWorldTestCase >> newWindowFor: aClassName [
	^ self newWindowForModelClass: (Smalltalk at: aClassName).
]

{ #category : #factory }
WMInANewWorldTestCase >> newWindowForModelClass: aClass [
	^ SystemWindow new
						model: aClass new; 
						openInWorld: testWorld;
						yourself.  
]

{ #category : #factory }
WMInANewWorldTestCase >> newWorkspaceIn: aWorld [
	| workspace |
	workspace := SystemWindow new
						model: Workspace new; 
						openInWorld: testWorld;
						yourself.  
						
	workspace addMorph: workspace model buildTextMorph.
	^ workspace
]

{ #category : #running }
WMInANewWorldTestCase >> setUp [
	testWorld := WorldMorph new
						initAsTestWorld: WorldState new;
						yourself.  
	testWorld bounds: (0@0 extent: 200@200).
	windowManager := TilingWM forWorld: testWorld.
	
	backupLayoutStrategy := TilingWM layoutStrategyClassName.
	TilingWM layoutStrategyClassName: #TWMHorizontalLayoutStrategy.
]

{ #category : #running }
WMInANewWorldTestCase >> tearDown [
	TilingWM layoutStrategyClassName: backupLayoutStrategy
	
]
