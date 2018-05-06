Class {
	#name : #TWMBarWithTwoBrowsersAndTwoWorkspacesTest,
	#superclass : #WMWithTwoBrowsersAndTwoWorkspacesTest,
	#traits : 'TWMTestHelpers',
	#classTraits : 'TWMTestHelpers classTrait',
	#instVars : [
		'twmBar'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> setUp [
	super setUp.
	twmBar := TWMBar new openInWorld: testWorld. 
	browser1 model setClass: Boolean selector: nil.
	browser2 model setClass: String selector: nil. 

	workspace2 model contents: 'I am a Workspace with a very long first line. So long, that it would mess up the layout of the TWMBar Menu. So we make sure it gets cut.'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testBrowserMenuShouldContainsEntryBooleanForBrowserOne [
	self assertMenuWithIcon: twmBar browsersMenuIcon containsItemNamed: 'Boolean'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testBrowserMenuShouldContainsEntryStringForBrowserTwo [
	self assertMenuWithIcon: twmBar browsersMenuIcon containsItemNamed: 'String'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testClickOnBrowserTwoMenuItemShouldActivateIt [
	|menuItem|
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testClickOnBrowserTwoMenuItemWhenHiddenShouldShowIt [
	|menuItem|
	browser2 hide.
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.
	self assert: (windowManager visibleWindows includes: browser2).
	self assert: browser2 visible.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testClickOnBrowserTwoMenuItemWhenMinimizedShouldActivateIt [
	|menuItem|
	browser2 minimize.
	workspace1 activate.
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.
	self assert: (windowManager visibleWindows includes: browser2).
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testOtherToolsMenuShouldContainsEntryForOpeningSUnitTestRunner [
	self assertMenuWithIcon: twmBar otherToolsMenuIcon containsItemNamed: 'New TestRunner'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testWindowsMenuShouldContainsEntryStringForBrowserTwo [
	self assertMenuWithIcon: twmBar windowsIcon containsItemNamed: 'String'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testWorkspace2MenuShouldContainShortenedStringForWorkspaceThree [
	self assertMenuWithIcon: twmBar workspacesMenuIcon containsItemNamed: 'I am a Workspace with a very long first line. ...'.
]

{ #category : #tests }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> testWorkspaceMenuShouldContainsEntryStringForWorkspaceOne [
	self assertMenuWithIcon: twmBar workspacesMenuIcon containsItemNamed: '1+1 ...'.
]

{ #category : #requirements }
TWMBarWithTwoBrowsersAndTwoWorkspacesTest >> twmBar [
	^ twmBar
]
