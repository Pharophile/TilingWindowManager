accessing
windowManager
	^ wm ifNil: [wm := TilingWM forWorld: World].