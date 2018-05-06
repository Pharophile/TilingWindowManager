"
I open a window used to browse and restore world snapshots
"
Class {
	#name : #TWMWorldSnapshotBrowser,
	#superclass : #Object,
	#instVars : [
		'window',
		'scrollPane'
	],
	#category : 'TWM-GUI'
}

{ #category : #accessing }
TWMWorldSnapshotBrowser class >> icons [
	^Smalltalk ui icons
]

{ #category : #actions }
TWMWorldSnapshotBrowser class >> open [
	self new open
]

{ #category : #buttons }
TWMWorldSnapshotBrowser class >> openBrowserButtonOn: aBuilder [
	<twmBarButton>
	aBuilder 
		action: [self open];
		icon: self icons tinyMenuIcon;
		help: 'Browse world snapshots'.
]

{ #category : #building }
TWMWorldSnapshotBrowser >> buildScrollPaneForSnapshotThumbnails [
	^ (self builder newScrollPaneFor: self snapshotThumbnailsPanel)
		hResizing: #spaceFill;
		vResizing: #spaceFill
]

{ #category : #accessing }
TWMWorldSnapshotBrowser >> builder [
	^ UITheme builder
]

{ #category : #callbacks }
TWMWorldSnapshotBrowser >> deleteSnapshot: aTWMWorldSnapshot [
	TilingWM instanceForCurrentWorld worldRecorder snapshots remove: aTWMWorldSnapshot.
	window removeMorph: scrollPane.
	scrollPane := self buildScrollPaneForSnapshotThumbnails.
	window 
		addMorph: scrollPane fullFrame: (LayoutFrame 	fractions: (0@0 extent: 1@1) offsets: (0@0 extent: 1@1)).
]

{ #category : #building }
TWMWorldSnapshotBrowser >> newButtonForWorldSnapshot: aWorldSnapshot [
	^ self builder
		newButtonFor: [ self restoreSnaphot: aWorldSnapshot ]
		action: #value
		label: (self builder newImage: aWorldSnapshot thumbnail)
		help: 'Restore this snapshot'
]

{ #category : #building }
TWMWorldSnapshotBrowser >> newDeleteButtonForWorldSnapshot: aWorldSnapshot [
	^ self builder
		newButtonFor: [ self deleteSnapshot: aWorldSnapshot ]
		action: #value
		label: 'Delete'
		help: 'Delete this snapshot'
]

{ #category : #actions }
TWMWorldSnapshotBrowser >> open [
	TilingWM instanceForCurrentWorld snapshotWorld.
	scrollPane := self buildScrollPaneForSnapshotThumbnails.
	window := scrollPane
		extent: 600 @ 400;
		openInWindowLabeled: 'Browse snapshots'
]

{ #category : #callbacks }
TWMWorldSnapshotBrowser >> restoreSnaphot: aTWMWorldSnapshot [
	aTWMWorldSnapshot restore.
	window activate.
]

{ #category : #building }
TWMWorldSnapshotBrowser >> snapshotThumbnailButtons [
	^ TilingWM currentWorldSnapshots collect: [ :aWorldSnapshot | 
													self builder newRow: {
														self newButtonForWorldSnapshot: aWorldSnapshot.
														self newDeleteButtonForWorldSnapshot: aWorldSnapshot } ]
]

{ #category : #building }
TWMWorldSnapshotBrowser >> snapshotThumbnailsPanel [
	^ (self builder newColumn: self snapshotThumbnailButtons)
		cellPositioning: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]
