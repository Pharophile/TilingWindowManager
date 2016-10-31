equality
hash
	^ (((super hash 
			bitXor: self bounds hash) 
				bitXor: (self window hash)) 
					bitXor: self shouldRestoreMaximized hash) 
						bitXor:  self shouldRestoreMinimized hash.