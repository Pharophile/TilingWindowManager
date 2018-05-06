Class {
	#name : #TWMWindowSnapshotOfFinderTest,
	#superclass : #WMInANewWorldTestCase,
	#instVars : [
		'finder',
		'snapshot'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
TWMWindowSnapshotOfFinderTest >> setUp [
	super setUp.
	
	finder := self newWindowFor: #FinderUI.
	finder 
		activate;
		bounds: (10@10 corner: 120@120).
	
	snapshot := TWMWindowSnapshot of: finder.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testRestoreAfterCloseShouldDoNothing [
	finder delete.
	snapshot restore.
	self assert: {} equals: windowManager windows.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testRestoreAfterMaximizeShouldUnmaximizeIt [
	finder maximize.
	snapshot restore.
	
	self assert: (10@10 corner: 120@120) equals: finder bounds.
	self deny: finder isMaximized.
	self deny: finder isMinimized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testRestoreAfterMinimizeShouldExpandIt [
	finder minimize.
	snapshot restore.
	
	self assert: (10@10 corner: 120@120) equals: finder bounds.
	self deny: finder isMinimized.
	self deny: finder isMaximized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testRestoreAfterResizeShouldMoveItBackToSnapshot [
	finder bounds: (50@50 corner: 180@230).
	self assert: (50@50 corner: 180@230) equals: finder bounds.
	
	snapshot restore.
	self assert: (10@10 corner: 120@120) equals: finder bounds.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testRestoreWithoutMovingShouldKeepFinderAtItsPlace [
	snapshot restore.
	self assert: (10@10 corner: 120@120) equals: finder bounds.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testShouldBeEqualsAnotherSnapshotWithoutMoving [
	self assert: snapshot equals:  (TWMWindowSnapshot of: finder)
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testShouldNotBeEqualsAnotherSnapshotAfterMaximize [
	finder maximize.
	self deny: snapshot = (TWMWindowSnapshot of: finder)
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testShouldNotBeEqualsAnotherSnapshotAfterMinimize [
	finder minimize.
	self deny: snapshot = (TWMWindowSnapshot of: finder)
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testShouldNotBeEqualsAnotherSnapshotAfterMoving [
	finder bounds: (50@50 corner: 205@190).
	self deny: snapshot = (TWMWindowSnapshot of: finder)
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMaximizedThenRestoreFromMinimizeShouldMaximizeIt [
	finder maximize.
	snapshot snapshot: finder. 
	finder minimize.
	snapshot  restore.
	self assert: finder isMaximized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMaximizedThenRestoreFromUnMaximizedShouldMaximizeIt [
	finder maximize.
	
	snapshot snapshot: finder. 
	finder expandBoxHit.
	self deny: finder isMaximized.
	
	snapshot  restore.
	self assert: finder isMaximized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMaximizedThenRestoreShouldKeeptItMaximized [
	finder maximize.
	snapshot snapshot: finder. 
	
	snapshot  restore.
	self assert: finder isMaximized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMinimizedThenRestoreFromMaximizeShouldMinimizeIt [
	finder minimize.
	snapshot snapshot: finder. 
	finder maximize.
	snapshot  restore.
	self assert: finder isMinimized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMinimizedThenRestoreFromUnMinimizedShouldMinimizeIt [
	finder minimize.
	snapshot snapshot: finder. 
	finder expandBoxHit.
	snapshot  restore.
	self assert: finder isMinimized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testSnapshotMinimizedThenRestoreShouldKeeptItMinimized [
	finder minimize.
	snapshot snapshot: finder. 
	
	snapshot  restore.
	self assert: finder isMinimized.
]

{ #category : #tests }
TWMWindowSnapshotOfFinderTest >> testTilingWMBrowsersShouldReturnFinder [
	self assert: {finder} equals: windowManager browsers.
]
