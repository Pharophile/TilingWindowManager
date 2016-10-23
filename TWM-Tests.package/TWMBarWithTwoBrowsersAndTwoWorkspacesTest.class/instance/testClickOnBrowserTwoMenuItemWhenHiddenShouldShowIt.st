tests
testClickOnBrowserTwoMenuItemWhenHiddenShouldShowIt
	|menuItem|
	browser2 hide.
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.
	self assert: (windowManager visibleWindows includes: browser2).
	self assert: browser2 visible.