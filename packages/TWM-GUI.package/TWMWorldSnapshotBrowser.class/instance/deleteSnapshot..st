callbacks
deleteSnapshot: aTWMWorldSnapshot
	TilingWM instanceForCurrentWorld worldRecorder snapshots remove: aTWMWorldSnapshot.
	window removeMorph: scrollPane.
	scrollPane := self buildScrollPaneForSnapshotThumbnails.
	window 
		addMorph: scrollPane fullFrame: (LayoutFrame 	fractions: (0@0 extent: 1@1) offsets: (0@0 extent: 1@1)).