custom-buttons
customButtons
	^ (self allButtonBuilders 
			sort: [:a :b|  a priority > b priority]) 
			collect: [:aBuilder| aBuilder button]