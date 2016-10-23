layout
tileWindows: windows
	self layoutStrategy tileWindows: windows.
	(self visibleWindows copyWithoutAll: windows) do: #minimize