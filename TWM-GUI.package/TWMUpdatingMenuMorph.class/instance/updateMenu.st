update
updateMenu
	"Reconstitute the menu by first removing the contents and then building it afresh"
	self flag: #TODO. "Reinstate this feature once we figure out why it crashes"
	
	self removeAllMorphs.
	updater perform: updateSelector with: self

