building
snapshotThumbnailsPanel
	^ (self builder newColumn: self snapshotThumbnailButtons)
		cellPositioning: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap