reloading
reloadTWMBar
	self flag: #TODO. "If there are multiple worlds, this is flawed."
	TWMBar showTWMBar ifTrue: [TWMBar default rebuildDockContent].