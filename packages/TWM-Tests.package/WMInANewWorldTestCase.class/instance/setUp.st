running
setUp
	testWorld := WorldMorph new
						initAsTestWorld: WorldState new;
						yourself.  
	testWorld bounds: (0@0 extent: 200@200).
	windowManager := TilingWM forWorld: testWorld.
	
	backupLayoutStrategy := TilingWM layoutStrategyClassName.
	TilingWM layoutStrategyClassName: #TWMHorizontalLayoutStrategy.