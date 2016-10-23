running
tearDown
	browser1 delete.
	browser2 delete.
	workspace1 delete.
	workspace2 delete.
	testWorld delete.
	
	TilingWM numberOfLastUsedWindows: backupNumberOfWindowsSetting.