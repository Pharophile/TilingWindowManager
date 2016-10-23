menus
updateWorldMenu: aMenu
	self windowManager world worldMenu items do: [:aMenuItem| aMenu addMenuItem:  aMenuItem].