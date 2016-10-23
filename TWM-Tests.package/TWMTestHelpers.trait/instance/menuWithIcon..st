finders
menuWithIcon: aForm
	^ self twmBar dock
						findDeepSubmorphThat: [:aMorph|  
								(aMorph isKindOf: MenuItemMorph)  and:[aMorph icon =  aForm]]
						ifAbsent: [nil].