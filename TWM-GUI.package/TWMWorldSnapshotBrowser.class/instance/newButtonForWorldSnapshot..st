building
newButtonForWorldSnapshot: aWorldSnapshot
	^ self builder
		newButtonFor: [ self restoreSnaphot: aWorldSnapshot ]
		action: #value
		label: (self builder newImage: aWorldSnapshot thumbnail)
		help: 'Restore this snapshot'