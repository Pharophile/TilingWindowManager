finders
itemNamed:aString fromMenu: aMenu
	self twmBar dock activeSubmenu: aMenu subMenu.
	^ aMenu subMenu allMorphs detect: [:aMorph| (aMorph isKindOf: MenuItemMorph)  
														and:[aMorph contents =  aString]].
	