snapshot
snapshot 
	|worldImage|
	windowSnapshots := world systemWindows collect: [:aWindow|  TWMWindowSnapshot of: aWindow].
	worldImage := World imageForm.
	thumbnail := worldImage magnifyBy: (self thumbnailWidth / worldImage width) asFloat.