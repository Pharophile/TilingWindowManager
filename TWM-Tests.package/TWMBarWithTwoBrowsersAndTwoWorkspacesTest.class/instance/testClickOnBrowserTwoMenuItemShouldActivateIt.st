tests
testClickOnBrowserTwoMenuItemShouldActivateIt
	|menuItem|
	menuItem := self itemNamed: 'String' fromMenuWithIcon: twmBar browsersMenuIcon.
	menuItem target perform: (menuItem selector).
	self assert: browser2 equals: SystemWindow topWindow.