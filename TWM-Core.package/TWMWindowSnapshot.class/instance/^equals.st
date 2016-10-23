equality
= anObject
	^ (anObject  isKindOf: self class) 
		and: [anObject window = self window 
				and: [anObject bounds = self bounds
						and: [anObject shouldRestoreMinimized = anObject shouldRestoreMinimized 
								and: [anObject shouldRestoreMaximized = anObject shouldRestoreMaximized ]]]].