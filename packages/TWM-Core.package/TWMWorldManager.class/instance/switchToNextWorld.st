switching worlds
switchToNextWorld
	| orderedWorlds currentWorldIndex nextWorld |
	self worlds ifNotEmpty: [
		orderedWorlds := self worlds asOrderedCollection.
		currentWorldIndex := orderedWorlds indexOf: World.
		nextWorld := (orderedWorlds last = World)
								ifTrue: [orderedWorlds first]
								ifFalse: [orderedWorlds at: (currentWorldIndex + 1)].
		self switchToWorld: nextWorld.
	]