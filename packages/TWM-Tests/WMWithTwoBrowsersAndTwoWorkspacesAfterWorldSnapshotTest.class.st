Class {
	#name : #WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest,
	#superclass : #WMWithTwoBrowsersAndTwoWorkspacesTest,
	#instVars : [
		'worldSnapshot'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> setUp [
	super setUp.
	
	workspace1 bounds: (10@10 corner: 200@200).
	workspace2 bounds: (20@20 corner: 150@150).
	browser1 minimize.
	browser2 expandBoxHit.
	workspace2 activate.
	
	worldSnapshot := TWMWorldSnapshot of: testWorld.
	
	windowManager tileVisibleWindows.
	browser2 delete.
	workspace1 activate.
	worldSnapshot restore.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testBrowserOneShouldBeMinimized [
	self assert: browser1 isMinimized
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testBrowserTwoShouldNotBeVisible [
	self deny: (testWorld systemWindows includes:  browser2 )
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testShouldBeEqualsOtherSnapshotWithoutMoving [
	self assert: worldSnapshot equals: (TWMWorldSnapshot of: testWorld).
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testVisibleWindowsShouldReturnWorkspaceTwoAndOne [
	self assert:  {workspace2. workspace1} equals: worldSnapshot  visibleWindows. 
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testWindowSnapshotForDeletedBrowserTwoShouldBeDiscarded [
	self assert:  {workspace2. workspace1. browser1} equals: (worldSnapshot windows)
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testWorkspaceOneBoundsShouldBe10At10Corner200At200 [
	self assert:  (10@10 corner: 200@200) equals: workspace1 bounds.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testWorkspaceTwoBoundsShouldBe20At20Corner150At150 [
	self assert:  (20@20 corner: 150@150) equals: workspace2 bounds.
]

{ #category : #tests }
WMWithTwoBrowsersAndTwoWorkspacesAfterWorldSnapshotTest >> testWorkspaceTwoShouldBeOnTop [
	self assert: workspace2 equals: workspace2 topWindow.
]
