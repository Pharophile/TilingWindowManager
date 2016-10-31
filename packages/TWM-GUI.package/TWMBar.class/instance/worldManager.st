accessing
worldManager
	^ worldManager ifNil: [worldManager := TWMWorldManager instance].