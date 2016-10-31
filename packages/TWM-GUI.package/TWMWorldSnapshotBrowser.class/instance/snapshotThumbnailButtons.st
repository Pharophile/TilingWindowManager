building
snapshotThumbnailButtons
	^ TilingWM currentWorldSnapshots collect: [ :aWorldSnapshot | 
													self builder newRow: {
														self newButtonForWorldSnapshot: aWorldSnapshot.
														self newDeleteButtonForWorldSnapshot: aWorldSnapshot } ]