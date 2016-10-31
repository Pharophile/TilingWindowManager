custom-buttons
buttonsCollector
	^ buttonsCollector ifNil: [buttonsCollector := self newButtonsCollector]