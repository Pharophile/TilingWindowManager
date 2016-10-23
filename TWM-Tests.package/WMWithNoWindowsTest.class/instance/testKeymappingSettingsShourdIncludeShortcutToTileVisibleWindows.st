tests-keymapping-settings
testKeymappingSettingsShourdIncludeShortcutToTileVisibleWindows
	| builder |
	builder := SettingTreeBuilder new.
		TWMKeymapping buildSettingsOn: builder.
		builder nodeList detect: [:aNode| aNode item name = #tileVisibleWindows].