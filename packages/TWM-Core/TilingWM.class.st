"
I'm a window manager that can place windows in rows and column so they can all be visibles.

Try:
	(TilingWM forWorld: World) tileVisibleWindows.
	(TilingWM forWorld: World) tileBrowsers.
	(TilingWM forWorld: World) tileWorkspaces.
"
Class {
	#name : #TilingWM,
	#superclass : #Object,
	#instVars : [
		'world',
		'worldRecorder'
	],
	#classVars : [
		'LayoutStrategy',
		'NumberOfLastUsedWindows'
	],
	#category : 'TWM-Core'
}

{ #category : #accessing }
TilingWM class >> currentWorldSnapshots [
	^ self instanceForCurrentWorld snapshots
]

{ #category : #'layout strategy' }
TilingWM class >> defaultLayoutStrategy [
	^ TWMHorizontalLayoutStrategy.
]

{ #category : #'initialize-release' }
TilingWM class >> forWorld: aPasteUpMorph [ 
	^ self new 
			world: aPasteUpMorph;
			yourself.
]

{ #category : #accessing }
TilingWM class >> instanceForCurrentWorld [
	^ self allInstances detect: [:aTilingWM| aTilingWM world == World]
]

{ #category : #'layout strategy' }
TilingWM class >> layoutStrategy [
	LayoutStrategy ifNil: [LayoutStrategy := self defaultLayoutStrategy].
	^ LayoutStrategy.
]

{ #category : #'layout strategy' }
TilingWM class >> layoutStrategyClassName [
	^ self layoutStrategy name.
]

{ #category : #'layout strategy' }
TilingWM class >> layoutStrategyClassName: strategyClassName [
	LayoutStrategy := (Smalltalk at: strategyClassName ifAbsent: self defaultLayoutStrategy).
]

{ #category : #settings }
TilingWM class >> numberOfLastUsedWindows [
	^ NumberOfLastUsedWindows ifNil: [NumberOfLastUsedWindows := 3]. 
]

{ #category : #settings }
TilingWM class >> numberOfLastUsedWindows: anInteger [
	^ NumberOfLastUsedWindows := anInteger. 
]

{ #category : #windows }
TilingWM >> browsers [
	^ self windowsOfModels: #(Browser OBSystemBrowser OBCodeBrowser NautilusUI NautilusUI2 MessageListBrowser FinderUI).
]

{ #category : #windows }
TilingWM >> changes [
	^ self windowsOfModels: #(DualChangeSorter ChangeList ChangeSorter).
]

{ #category : #move }
TilingWM >> cycleClockwise [
	|queue|
	self flag: #TODO. "Need some love as World windws isn't working"
	queue := LinkedList newFrom: self visibleWindows.
	queue addLast: queue removeFirst.
	self tileWindows: queue.
]

{ #category : #move }
TilingWM >> cycleCounterClockwise [
	|queue|
	queue := LinkedList newFrom: self visibleWindows.
	queue addFirst: queue removeLast.  
	self tileWindows: queue.
]

{ #category : #windows }
TilingWM >> debuggers [
	^ self windowsOfModels: #(Debugger TimeProfiler)
]

{ #category : #history }
TilingWM >> deleteCurrentSnapshot [
	worldRecorder deleteCurrentSnapshot.
]

{ #category : #windows }
TilingWM >> inspectors [
	^ self windowsOfModels: #(Inspector EyeInspector)
]

{ #category : #accessing }
TilingWM >> lastUsedWindows [
	| lastWindows allWindows |
	allWindows := self windows.
	lastWindows := allWindows copyFrom: 1 to: (self class numberOfLastUsedWindows min: allWindows size).
	^ lastWindows
]

{ #category : #accessing }
TilingWM >> layoutStrategy [
	^ self class layoutStrategy new world: self world.
]

{ #category : #layout }
TilingWM >> maximizeAllWindows [
	"Make all windows maximize."

	world expandAll

]

{ #category : #layout }
TilingWM >> minimizeAllWindows [
	"Make all windows minimize."

	world collapseAll

]

{ #category : #windows }
TilingWM >> monticellos [
	^ self windowsOfModels:  #(MCTool MCPackageManager).
]

{ #category : #move }
TilingWM >> newTopWindowBoundsInArea:  aBlock [
	SystemWindow topWindow ifNotNil: [ 
				SystemWindow topWindow bounds: (aBlock value: world clearArea). ]
]

{ #category : #printing }
TilingWM >> printWorldRecorderPositionOn:  aStream [
	self worldRecorder printPositionOn: aStream.
]

{ #category : #history }
TilingWM >> snapshotWorld [
	worldRecorder snapshot
]

{ #category : #history }
TilingWM >> snapshots [ 
	^ worldRecorder snapshots 
]

{ #category : #world }
TilingWM >> switchToNextWorld [ 
	TWMWorldManager instance switchToNextWorld 
]

{ #category : #windows }
TilingWM >> system [
	^ self windowsOfModels: #(SettingBrowser)
]

{ #category : #accessing }
TilingWM >> taskbar [
	^ world submorphs detect: [:m| m isTaskbar] ifNone: [nil].
]

{ #category : #windows }
TilingWM >> testers [
	^ self windowsOfModels: #(TestRunner)
]

{ #category : #layout }
TilingWM >> tileBrowsers [
	self tileWindows: self browsers.

]

{ #category : #layout }
TilingWM >> tileChanges [
	self tileWindows: self changes.

]

{ #category : #layout }
TilingWM >> tileDebuggers [
	self tileWindows: self debuggers.

]

{ #category : #layout }
TilingWM >> tileInspectors [
	self tileWindows: self inspectors.

]

{ #category : #layout }
TilingWM >> tileLastUsedWindows [
	| lastWindows |
	lastWindows := self lastUsedWindows.
	self tileWindows: lastWindows
]

{ #category : #layout }
TilingWM >> tileMonticellos [
	self tileWindows: self monticellos.

]

{ #category : #layout }
TilingWM >> tileSystem [
	self tileWindows: self system.

]

{ #category : #layout }
TilingWM >> tileTesters [
	self tileWindows: self testers.

]

{ #category : #layout }
TilingWM >> tileTools [
	self tileWindows: self tools.

]

{ #category : #layout }
TilingWM >> tileVisibleWindows [
	self tileWindows: self visibleWindows.

]

{ #category : #layout }
TilingWM >> tileWindows: windows [
	self layoutStrategy tileWindows: windows.
	(self visibleWindows copyWithoutAll: windows) do: #minimize
]

{ #category : #layout }
TilingWM >> tileWorkspaces [
	self tileWindows: self workspaces.

]

{ #category : #windows }
TilingWM >> tools [
	^ self windowsOfModels: #(TranscriptModel ThreadSafeTranscript FileList ProcessBrowser)
]

{ #category : #move }
TilingWM >> topWindowMoveBottom [
	self newTopWindowBoundsInArea: [:area|  area leftCenter corner: area bottomRight].
]

{ #category : #move }
TilingWM >> topWindowMoveBottomLeft [
	self newTopWindowBoundsInArea: [:area|  area leftCenter corner: area bottomCenter].
]

{ #category : #move }
TilingWM >> topWindowMoveBottomRight [
	self newTopWindowBoundsInArea: [:area|  area center corner:  area bottomRight].
]

{ #category : #move }
TilingWM >> topWindowMoveFull [
	self newTopWindowBoundsInArea: [:area|  area topLeft corner: area bottomRight].
]

{ #category : #move }
TilingWM >> topWindowMoveLeft [
	self newTopWindowBoundsInArea: [:area|  area topLeft  corner: area bottomCenter].
]

{ #category : #move }
TilingWM >> topWindowMoveRight [
	self newTopWindowBoundsInArea: [:area|  area topCenter corner:  area bottomRight].
]

{ #category : #move }
TilingWM >> topWindowMoveTop [
	self newTopWindowBoundsInArea: [:area|  area topLeft  corner:  area rightCenter].
]

{ #category : #move }
TilingWM >> topWindowMoveTop23 [
	self newTopWindowBoundsInArea: [:area|  area topLeft  corner:  ((area bottomRight) * (1@0.66))].
]

{ #category : #move }
TilingWM >> topWindowMoveTopLeft [
	self newTopWindowBoundsInArea: [:area|  area topLeft  corner:  area center].
]

{ #category : #move }
TilingWM >> topWindowMoveTopRight [
	self newTopWindowBoundsInArea: [:area|  area topCenter corner:  area rightCenter].
]

{ #category : #filter }
TilingWM >> visibleWindows [
	^ self windows select: [:m| m isNotMinimized]. 
]

{ #category : #filter }
TilingWM >> windows [
	^ world systemWindows
]

{ #category : #filter }
TilingWM >> windowsOfModels:  listOfModels [
	|existingClasses|
	existingClasses := listOfModels 
			inject: OrderedCollection new 
			into: [:foundClasses :className| |foundClass|
				foundClass := Smalltalk at: className ifAbsent: nil.
				foundClass ifNotNil: [foundClasses add: foundClass].
				foundClasses.	].

	^ self windows select: [:window|  
							existingClasses  anySatisfy:  [:aClass| 
														 window model isKindOf: aClass]].
]

{ #category : #windows }
TilingWM >> workspaces [
	"Do both playground and plain old workspaces in case there are any."
	^  self windowsOfModels: #(GTPlayground Workspace).

]

{ #category : #accessing }
TilingWM >> world [
	^ world
]

{ #category : #accessing }
TilingWM >> world: aPasteUpMorph [ 
	world := aPasteUpMorph
]

{ #category : #history }
TilingWM >> worldBackward [
	self worldRecorder backward.
]

{ #category : #history }
TilingWM >> worldForward [
	self worldRecorder forward.
]

{ #category : #history }
TilingWM >> worldRecorder [
	^ worldRecorder ifNil: [worldRecorder := TWMWorldRecorder of: world].
]

{ #category : #history }
TilingWM >> worldRecorder: aWorldRecorder [
	worldRecorder := aWorldRecorder.
]
