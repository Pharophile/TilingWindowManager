Class {
	#name : #WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest,
	#superclass : #WMWithTwoBrowsersAndTwoWorkspacesTest,
	#instVars : [
		'worldRecorder'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> setUp [
	super setUp.
	
	workspace1 bounds: (10@10 corner: 200@200).
	workspace2 bounds: (20@20 corner: 150@150).
	browser1 minimize.
	browser2 expandBoxHit.
	workspace2 activate.
	
	worldRecorder := TWMWorldRecorder of: testWorld.
	windowManager worldRecorder: worldRecorder.
	self assert: {workspace2. workspace1. browser2} equals: windowManager visibleWindows.
	
	windowManager minimizeAllWindows.
	windowManager tileWorkspaces.
	worldRecorder snapshot.
	self assert: {workspace2. workspace1} equals: windowManager visibleWindows.
	self assert: {workspace2. workspace1} equals: (worldRecorder currentSnapshot visibleWindows).
	
	windowManager minimizeAllWindows.
	windowManager tileBrowsers.
	worldRecorder snapshot.
	self assert: {browser2. browser1} equals: windowManager visibleWindows.
	
	windowManager minimizeAllWindows.
	self assert: {} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardFourTimesShouldKeepLastRestore [
	worldRecorder backward backward backward backward.
	self assert: {workspace2. workspace1. browser2} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardOnceShouldRestoreBrowsers [
	worldRecorder backward.
	self assert: {browser2. browser1.} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardOnceThenForwardShouldRestoreAllMinimize [
	worldRecorder backward forward.
	self assert: {} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardThenOpenWindowThenBackwardShouldRestoreBrowsers [
	| newWindow |
	worldRecorder backward.
	
	newWindow := SystemWindow new openInWorld: testWorld; yourself.
	worldRecorder backward.
	
	self assert: {browser2. browser1. newWindow} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardThreeTimesShouldRestoreWorkspacesAndBrowserTwo [
	worldRecorder backward backward backward.
	self assert: {workspace2. workspace1. browser2} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardTwiceShouldRestoreWorkspaces [
	worldRecorder backward.
	worldRecorder backward.
	
	self assert: {workspace2. workspace1.} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testBackwardTwiceThenForwardShouldRestoreBrowsers [
	worldRecorder backward backward forward.
	
	self assert: {browser2. browser1.} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testDeleteCurrentSnapshotThenBackwardShouldRestoreWorkspaces [
	worldRecorder deleteCurrentSnapshot backward.
	self assert: {workspace2. workspace1.} equals: windowManager visibleWindows.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testDeleteCurrentSnapshotWhenRemainsOnlyOne [
	| recorder |
	recorder := TWMWorldRecorder of: testWorld.
	self assert: 1 equals: recorder snapshots size.
	recorder deleteCurrentSnapshot.
	self assert: 1 equals: recorder snapshots size.

]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesSnapshotRecorderTest >> testForwardShouldKeepAllMinimize [
	worldRecorder forward.
	self assert: {} equals: windowManager visibleWindows.
]
