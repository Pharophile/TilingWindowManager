accessing
instanceForCurrentWorld
	^ self allInstances detect: [:aTilingWM| aTilingWM world == World]