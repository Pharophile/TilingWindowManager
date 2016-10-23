building
newDeleteButtonForWorldSnapshot: aWorldSnapshot
	^ self builder
		newButtonFor: [ self deleteSnapshot: aWorldSnapshot ]
		action: #value
		label: 'Delete'
		help: 'Delete this snapshot'