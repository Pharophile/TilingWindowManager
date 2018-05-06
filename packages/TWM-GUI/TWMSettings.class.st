"
System Settings for Tiling Window Manager
"
Class {
	#name : #TWMSettings,
	#superclass : #Object,
	#category : 'TWM-GUI'
}

{ #category : #settings }
TWMSettings class >> displayEnableTWMSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #showTWMBar) 
		label: 'Enable Tiling Window Manager' translated;
		target: TWMBar;
		parent: #twm;
		description: 'Open a dock with TWM actions' translated;
		order: 1

]

{ #category : #settings }
TWMSettings class >> displayLayoutStrategySettingsOn: aBuilder [
	<systemsettings>
	(aBuilder pickOne: #layoutStrategyClassName) 
		label: 'Layout strategy' translated;
		target: TilingWM;
		parent: #twm;
		order: 2;
		description: 'Layout strategy to tile windows' translated;
		default: #TWMHorizontalLayoutStrategy;
		domainValues: (TWMLayoutStrategy subclasses collect: [:aClass| (aClass strategyName) -> aClass name]).
]

{ #category : #settings }
TWMSettings class >> displayNumberOfLastUsedWindowsSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #numberOfLastUsedWindows) 
		label: 'Last used windows to show' translated;
		target: TilingWM;
		parent: #twm;
		order: 3;
		description: 'Number of last used windows to show' translated.

]

{ #category : #settings }
TWMSettings class >> displayTWMBarSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #twm) 
		label: 'Tiling Window Manager' translated;
		description: 'TWM allows to put windows side by side automatically' translated.
]

{ #category : #'initialize-release' }
TWMSettings class >> initialize [
	self reloadTWMBar.
]

{ #category : #reloading }
TWMSettings class >> reloadTWMBar [
	self flag: #TODO. "If there are multiple worlds, this is flawed."
	TWMBar showTWMBar ifTrue: [TWMBar default rebuildDockContent].
]

{ #category : #accessing }
TWMSettings class >> windowManager [
	^ TilingWM instanceForCurrentWorld
]
