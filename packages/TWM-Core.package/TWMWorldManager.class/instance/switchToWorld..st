switching worlds
switchToWorld: newWorld
	newWorld == World
		ifTrue: [ ^ self ].
	self flag: #TODO. "There is something stinky in here, as World isn't the same instance we expect it to be.."
	(worlds includes: World)
		ifFalse: [ self halt.worlds at: 'XYZ' put: World ].
	World prepareToDeactivate.
	newWorld install.
	WorldState addDeferredUIMessage: [ 
		newWorld restoreMorphicDisplay.
		self notifyWorldChanged ].