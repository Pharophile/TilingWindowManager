"
Tiling Window Manager is a set of tools to organize windows on you Pharo desktop.

Load with: 
  ConfigurationOfTilingWindowManager load.
(or see class side, protocol loading for alternate ways).

Then:
  TWMBar open.
(or browse settings for Tiling Window Manager).


If you want a more customized setup, try:

(Smalltalk at:#TWMUITheme) beCurrent. 
TaskbarMorph  showTaskbar: false.
TasklistMorph keepOpen: true.
(Smalltalk at:#TWMBar) perform: #showTWMBar: with: true.
"
Class {
	#name : #ConfigurationOfTilingWindowManager,
	#superclass : #ConfigurationOf,
	#category : 'ConfigurationOfTilingWindowManager'
}

{ #category : #catalog }
ConfigurationOfTilingWindowManager class >> catalogChangeLog [
^ 'Version 5.0.2 - Make TWM work in Pharo5'
]

{ #category : #catalog }
ConfigurationOfTilingWindowManager class >> catalogDescription [

^ 
'Tiling Window Manager, multi-desktop IDE. Improves window management and add keyboard shortcuts to handle lot of opened windows.'
]

{ #category : #catalog }
ConfigurationOfTilingWindowManager class >> catalogKeyClassesAndExample [
^ '==TilingWM== is the core class. Try:
[[[ 
(TilingWM forWorld: World) tileVisibleWindows.
(TilingWM forWorld: World) tileBrowsers.
(TilingWM forWorld: World) tileWorkspaces.
]]]

==TWMWorldManager== manages multiple desktops:

Add a world: 
[[[
WorldManager instance createOrSwitchToWorldNamed: ''JustAnotherWorld''. 
]]]

Return to the default world: 
[[[
WorldManager instance createOrSwitchToWorldNamed: ''Pharo''.
]]]


==TWMLayoutStrategy== subclasses provide several layout strategies. Implement your own !

==TWMBar== handles the GUI part of TWM. 
[[[
TWMBar new open
]]]

'.
]

{ #category : #catalog }
ConfigurationOfTilingWindowManager class >> catalogKeywords [
	^ #(IDE)
	
]

{ #category : #versions }
ConfigurationOfTilingWindowManager >> version504: spec [
	<version: '5.0.4'>

	spec for: #common do: [
		spec blessing: #development.
		spec author: 'Philippe Back'.
		spec description: 'TWM in Pharo 5.x'.
		spec timestamp: '10/31/2016 21:13'.
		spec baseline: 'TilingWindowManager' with: [ 
			spec repository: 'github://pharophile/TilingWindowManager:master/packages' ];
		import: 'ALL'
	].
	
			
]
