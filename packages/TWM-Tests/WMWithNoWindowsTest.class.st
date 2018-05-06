Class {
	#name : #WMWithNoWindowsTest,
	#superclass : #WMInANewWorldTestCase,
	#category : 'TWM-Tests'
}

{ #category : #'tests-keymapping-settings' }
WMWithNoWindowsTest >> testKeymappingRepositoryShourdIncludeCategoryNamedtwmShortcuts [
	self assert: (KMRepository default includesCategoryNamed: #twmShortcuts) 
]

{ #category : #'tests-keymapping-settings' }
WMWithNoWindowsTest >> testKeymappingSettingsShourdIncludeShortcutToTileVisibleWindows [
	| builder |
	builder := SettingTreeBuilder new.
		TWMKeymapping buildSettingsOn: builder.
		builder nodeList detect: [:aNode| aNode item name = #tileVisibleWindows].
]

{ #category : #'tests-tiling' }
WMWithNoWindowsTest >> testTileLastUsedWindowsShouldNotRaiseError [
	self shouldnt: [windowManager tileLastUsedWindows] raise: Error.
]

{ #category : #'tests-tiling' }
WMWithNoWindowsTest >> testTileVisibleWindowsShouldNotRaiseError [
	self shouldnt: [windowManager tileVisibleWindows ] raise: Error.
]

{ #category : #'tests-tiling' }
WMWithNoWindowsTest >> testWindowManagerWorldShouldReturnTestWorld [
	self assert:  testWorld equals: windowManager world.
]
