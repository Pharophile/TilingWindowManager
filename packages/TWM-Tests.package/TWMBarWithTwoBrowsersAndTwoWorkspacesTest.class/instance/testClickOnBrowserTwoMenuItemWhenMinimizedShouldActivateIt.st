tests
testClickOnBrowserTwoMenuItemWhenMinimizedShouldActivateIt
	|menuItem|
	browser2 minimize.
	workspace1 activate.
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.
	self assert: (windowManager visibleWindows includes: browser2).