filter tests
testBrowsersShouldReturnBrowserOneAndTwo
	self assert: {browser2. browser1} equals: windowManager browsers.   