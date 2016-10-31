open/close
openInWorld: aWorld
	wm := TilingWM forWorld: aWorld.
	dock := TWMDockingBarMorph new
				adhereToLeft;
				yourself.
	self rebuildDockContent.
	dock openInWorld: aWorld.
	  