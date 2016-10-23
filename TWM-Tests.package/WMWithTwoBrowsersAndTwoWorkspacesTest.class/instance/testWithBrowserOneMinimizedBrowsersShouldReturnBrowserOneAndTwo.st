filter tests
testWithBrowserOneMinimizedBrowsersShouldReturnBrowserOneAndTwo
	browser1 minimize.  
	self assert: {browser2. browser1} equals: windowManager browsers.