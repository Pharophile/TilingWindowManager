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