catalog
catalogKeyClassesAndExample
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