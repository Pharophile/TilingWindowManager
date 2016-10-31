enumerating
shortcutsDo: aBlock
	self shortcuts do: [:actionDescShortcut| |action description shortcutBlock|
		action := actionDescShortcut key key.
		description := actionDescShortcut key value.
		shortcutBlock := actionDescShortcut key value. "because Character>>#command is not in PharoCore"
	].