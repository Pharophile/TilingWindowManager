building
buildScrollPaneForSnapshotThumbnails
	^ (self builder newScrollPaneFor: self snapshotThumbnailsPanel)
		hResizing: #spaceFill;
		vResizing: #spaceFill