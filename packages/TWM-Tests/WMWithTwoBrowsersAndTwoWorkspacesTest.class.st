Class {
	#name : #WMWithTwoBrowsersAndTwoWorkspacesTest,
	#superclass : #WMInANewWorldTestCase,
	#instVars : [
		'browser1',
		'browser2',
		'workspace1',
		'workspace2',
		'backupNumberOfWindowsSetting'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
WMWithTwoBrowsersAndTwoWorkspacesTest >> setUp [
	super setUp.
	
	browser1 := self newBrowserIn: testWorld.
	browser2 := self newBrowserIn: testWorld.
	workspace1 := self newWorkspaceIn: testWorld.
	workspace1 model contents: '1+1'.

	workspace2 := self newWorkspaceIn: testWorld.
	
	backupNumberOfWindowsSetting := TilingWM numberOfLastUsedWindows.
	TilingWM numberOfLastUsedWindows: 2.
]

{ #category : #running }
WMWithTwoBrowsersAndTwoWorkspacesTest >> tearDown [
	browser1 delete.
	browser2 delete.
	workspace1 delete.
	workspace2 delete.
	testWorld delete.
	
	TilingWM numberOfLastUsedWindows: backupNumberOfWindowsSetting.
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testBrowsersShouldReturnBrowserOneAndTwo [
	self assert: {browser2. browser1} equals: windowManager browsers.   
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testCycleClockwiseShouldPutBrowser1BeforeAllOtherWindows [
	windowManager cycleClockwise.
	self assert: {workspace1. browser2.browser1. workspace2.} equals: windowManager visibleWindows.   
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testCycleCounterClockwiseShouldPutWorkspace2AfterAllOtherWindows [
	windowManager cycleCounterClockwise.
	self assert: {browser1. workspace2. workspace1. browser2.} equals: windowManager visibleWindows.
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testNewWorldRecorderAndBackwardShouldCreateOnlyOneSnapshot [
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	recorder backward.
	self assert: 1 equals: recorder snapshots size.
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testNewWorldRecorderAndBackwardTwiceShouldCreateOnlyOneSnapshot [
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	recorder backward backward.
	self assert: 1 equals: recorder snapshots size.
]

{ #category : #'setting tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testNumberOfLastUsedWindowsShouldDefaultToThree [
	TilingWM numberOfLastUsedWindows: nil.
	self assert: 3 equals: TilingWM numberOfLastUsedWindows.
	
]

{ #category : #'tile tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileBrowsersWithBrowserOneHiddenShouldShowIt [
	browser1 hide.
	windowManager tileBrowsers.
	self assert: (windowManager visibleWindows includes: browser1).
	self assert: browser1 visible.
]

{ #category : #'tile tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileBrowsersWithBrowserOneMinimizedShouldRaiseIt [
	browser1 minimize.
	windowManager tileBrowsers.
	self assert: (windowManager visibleWindows includes: browser1).
]

{ #category : #'setting tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileLastUsedWindowsShouldTileOnlyLastTwoWindowsUsed [
	workspace1 activate.
	browser2 activate.
	workspace2 activate.
	browser1 activate.
	browser1 minimize.
	windowManager tileLastUsedWindows..
	self assert: (0@0 extent: 200@100) equals: browser1 bounds.
	self assert: (0@100 extent: 200@100) equals: workspace2 bounds.
	
]

{ #category : #'setting tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileLastUsedWindowsWithVerticalLayoutStrategyShouldTileVerticallyLastTwoWindowsUsed [
	workspace1 activate.
	browser2 activate.
	workspace2 activate.
	browser1 activate.
	browser1 minimize.
	
	TilingWM layoutStrategyClassName: #TWMVerticalLayoutStrategy.
	windowManager tileLastUsedWindows..
	self assert: (0@0 extent: 100@200) equals: browser1 bounds.
	self assert: (100@0 extent: 100@200) equals: workspace2 bounds.
]

{ #category : #'tile tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileVisibleWindowsShouldPlaceThemInTwoColumnsAndRows [
	windowManager tileVisibleWindows.
	self assert: (0@0 extent: 100@100) equals: workspace2 bounds.
	self assert: (100@0 extent: 100@100) equals: workspace1 bounds.
	self assert: (0@100 extent: 100@100) equals: browser2 bounds.
	self assert: (100@100 extent: 100@100) equals: browser1 bounds.
]

{ #category : #'tile tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileWorkspacesShouldPlaceThemInOneColumnAndTwoRows [
	windowManager tileWorkspaces.
	self assert: (0@0 extent: 200@100) equals: workspace2 bounds.
	self assert: (0@100 extent: 200@100) equals: workspace1 bounds.
]

{ #category : #'tile tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testTileWorkspacesWithWorkspaceOneMinimizedShouldRaiseIt [
	workspace1 minimize.
	windowManager tileWorkspaces.
	self assert: (windowManager visibleWindows includes: workspace1).
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testVisibleWindowsShouldReturnWorkspacesAndBrowsers [
	self assert: {workspace2. workspace1. browser2. browser1.} equals: windowManager visibleWindows.   
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testWithBrowserOneMinimizedBrowsersShouldReturnBrowserOneAndTwo [
	browser1 minimize.  
	self assert: {browser2. browser1} equals: windowManager browsers.
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testWithBrowserOneMinimizedVisibleWindowsShouldReturnAllButBrowserOne [
	browser1 minimize.
	self assert: {workspace2. workspace1. browser2. } equals: windowManager visibleWindows.
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testWithWorkspaceOneMinimizedWorkspacesShouldReturnWorkspaceOneAndTwo [
	workspace1 minimize.  
	self assert: {workspace2. workspace1} equals: windowManager workspaces. 
]

{ #category : #'filter tests' }
WMWithTwoBrowsersAndTwoWorkspacesTest >> testWorkspacesShouldReturnWorkspaceOneAndTwo [
	self assert: {workspace2. workspace1} equals: windowManager workspaces.   
]
