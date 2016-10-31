actions
open
	TilingWM instanceForCurrentWorld snapshotWorld.
	scrollPane := self buildScrollPaneForSnapshotThumbnails.
	window := scrollPane
		extent: 600 @ 400;
		openInWindowLabeled: 'Browse snapshots'