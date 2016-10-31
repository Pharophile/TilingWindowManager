running
setUp
	super setUp.
	
	finder := self newWindowFor: #FinderUI.
	finder 
		activate;
		bounds: (10@10 corner: 120@120).
	
	snapshot := TWMWindowSnapshot of: finder.