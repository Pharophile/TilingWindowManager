Extension { #name : #MenuMorph }

{ #category : #'*twm-gui' }
MenuMorph >> add: aString target: aReceiver selector: aSelector icon: aForm [
	self 
		add: aString
		target: aReceiver
		selector: aSelector.
		
	self lastItem icon: aForm.
]
