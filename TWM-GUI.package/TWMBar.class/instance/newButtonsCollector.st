custom-buttons
newButtonsCollector 
	| collector |
	collector := (PragmaCollector filter: [	:pragma | 
											pragma keyword = self pragmaButtonKeyword ]).
	collector whenChangedSend: #rebuildDockContent to: self.
	^ collector 