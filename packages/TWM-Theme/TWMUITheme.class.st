Class {
	#name : #TWMUITheme,
	#superclass : #UITheme,
	#category : 'TWM-Theme'
}

{ #category : #accessing }
TWMUITheme class >> baseColor [
	^ Color r: 190 g: 190 b: 190 range: 255
]

{ #category : #accessing }
TWMUITheme class >> basePassiveBackgroundColor [
	^ Color r: 245 g: 245 b: 245 range: 255
]

{ #category : #accessing }
TWMUITheme class >> baseSelectionColor [
	^ Color r: 97 g: 163 b: 225 range: 255
]

{ #category : #accessing }
TWMUITheme class >> darkBaseColor [
	^ Color r: 180 g: 180 b: 180 range: 255
]

{ #category : #settings }
TWMUITheme class >> defaultSettings [
	"Answer the default settings for the theme."
	defaultSettings := nil.
	^defaultSettings ifNil: [
		self defaultSettings: self newDefaultSettings.
		defaultSettings]
]

{ #category : #private }
TWMUITheme class >> importIcons: icons fromFolder: aString inClass: aClass category: aCategory [
	icons
		do: [:each |
			| method form |
			form := PNGReadWriter formFromFileNamed: aString, '/', each , '.png'.
			method := each , Character cr asString ,
				(aClass methodStart: each),		
				form storeString,
				aClass methodEnd.
			aClass class compile: method classified: aCategory ].
	aClass initialize
]

{ #category : #accessing }
TWMUITheme class >> isAbstract [ 
	^ false
]

{ #category : #accessing }
TWMUITheme class >> lightBaseColor [
	^ Color r: 200 g: 200 b: 200 range: 255
]

{ #category : #accessing }
TWMUITheme class >> lightSelectionColor [
	^ Color r: 175 g: 213 b: 250 range: 255
]

{ #category : #settings }
TWMUITheme class >> newDefaultSettings [
	BalloonMorph setBalloonColorTo: self lightSelectionColor.
	^super newDefaultSettings
		menuColor: self baseColor;
		menuTitleColor: self baseColor;
		windowColor: self baseColor;
		selectionColor: self lightSelectionColor;
		menuSelectionColor: self baseSelectionColor;
		progressBarColor: self baseColor;
		standardColorsOnly: false;
		autoSelectionColor: false;
		preferRoundCorner: false;
		flatMenu: true
]

{ #category : #settings }
TWMUITheme class >> setPreferredWorldBackground [
	"self setPreferredWorldBackground"
	"World color: (
		(GradientFillStyle 
			ramp: { 0.0 -> Color white.  1.0 -> Color gray})
			origin: 50 @ 50;
			direction: 800@0;
			normal: 0@800;
		radial: true)"
	World color: Color white
]

{ #category : #accessing }
TWMUITheme class >> themeName [
	^ 'TWM Theme'
]

{ #category : #accessing }
TWMUITheme class >> veryLightSelectionColor [
	^ Color r: 218 g: 234 b: 250 range: 255
]

{ #category : #private }
TWMUITheme >> baseColorFor: aMorph [
	^ self class baseColor
	"unfortunately, it looks like paneColor does not always return the wanted color"
	"aButton paneColorOrNil ifNil: [Color r: 200 g: 200 b: 200 range: 255]"
]

{ #category : #private }
TWMUITheme >> baseDarkColorFor: aMorph [
	^ self class darkBaseColor
]

{ #category : #private }
TWMUITheme >> basePassiveBackgroundColorFor: aMorph [
	^ self class basePassiveBackgroundColor
]

{ #category : #private }
TWMUITheme >> baseSelectionColorFor: aMorph [
	^ self class baseSelectionColor
]

{ #category : #'border-styles-buttons' }
TWMUITheme >> buttonCornerStyleIn: aThemedMorph [
	"If asked, we only allow square corners"
	
	^ #square
]

{ #category : #'label-styles' }
TWMUITheme >> buttonLabelForText: aTextOrString [
	"Answer the label to use for the given text."
	^aTextOrString isString
		ifTrue: [(LabelMorph contents: aTextOrString) color: Color black]
		ifFalse: [super buttonLabelForText: aTextOrString]
]

{ #category : #defaults }
TWMUITheme >> buttonMinHeight [
	"Answer the minumum height of a button for this theme."
	
	^24
]

{ #category : #defaults }
TWMUITheme >> buttonMinWidth [
	"Answer the minumum width of a button for this theme."
	
	^24
]

{ #category : #'border-styles-buttons' }
TWMUITheme >> buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."

	| outerColor innerColor |
	(aButton valueOfProperty: #noBorder ifAbsent: [false]) ifTrue: [
		^ SimpleBorder new width: 0; baseColor: Color transparent ].
	outerColor := self baseDarkColorFor: aButton.
	^SimpleBorder new
					width: 1;
					baseColor: outerColor
]

{ #category : #'fill-styles-buttons' }
TWMUITheme >> buttonNormalFillStyleFor: aButton [
	"Return the normal button fillStyle for the given button."
	
	|aColor|
	aColor := self buttonColorFor: aButton.
	^(GradientFillStyle ramp: {
			0.0->Color white.
			0.1->aColor twiceLighter.
			0.9->aColor darker.
			1.0->aColor twiceDarker darker duller})
		origin: aButton bounds origin;
		direction: 0 @ aButton height;
		radial: false
]

{ #category : #'fill-styles-buttons' }
TWMUITheme >> buttonPressedFillStyleFor: aButton [
	"Return the button pressed fillStyle for the given color."

	| aColor c |
	aColor := aButton colorToUse.
	c := aColor luminance > 0.3
		ifTrue: [ aColor blacker ]
		ifFalse: [ aColor whiter ].
	^ (GradientFillStyle
		ramp:
			{(0.0 -> c darker duller).
			(0.1 -> c darker).
			(0.9 -> c twiceLighter).
			(1.0 -> Color white)})
		origin: aButton bounds origin;
		direction: 0 @ aButton height;
		radial: false
]

{ #category : #'border-styles-buttons' }
TWMUITheme >> buttonSelectedBorderStyleFor: aButton [
	^ self buttonNormalBorderStyleFor: aButton
]

{ #category : #forms }
TWMUITheme >> checkboxButtonNormalFillStyleFor: aCheckboxButton [
	"Return the normal checkbox button fillStyle for the given checkbox button."
	
	^(ImageFillStyle form: self checkboxForm) origin: aCheckboxButton topLeft
]

{ #category : #'fill-styles-buttons' }
TWMUITheme >> checkboxButtonSelectedFillStyleFor: aCheckboxButton [
	"Return the selected checkbox button fillStyle for the given checkbox button."
	
	^(ImageFillStyle form: self checkboxSelectedForm) origin: aCheckboxButton topLeft
]

{ #category : #forms }
TWMUITheme >> checkboxForm [
	"Answer the form to use for a normal checkbox."

	^self  checkboxUnselectedForm
]

{ #category : #forms }
TWMUITheme >> checkboxSelectedForm [
	"Answer the form to use for a selected checkbox."

	^ TWMUIThemeIcons checkboxSelectedForm
]

{ #category : #forms }
TWMUITheme >> checkboxUnselectedForm [
	"Answer the form to use for a selected checkbox."

	^ TWMUIThemeIcons checkboxUnselectedForm
]

{ #category : #'border-styles' }
TWMUITheme >> configureWindowBorderFor: aWindow [
	| aStyle |
	aStyle := (SimpleBorder new)
		color: (Color black alpha: 0.5);
		width: 1.
	aWindow borderStyle: aStyle
]

{ #category : #'border-styles' }
TWMUITheme >> configureWindowDropShadowFor: aWindow [

	aWindow hasDropShadow: false
]

{ #category : #'label-styles' }
TWMUITheme >> configureWindowLabelAreaFor: aWindow [
	"Configure the label area for the given window."

	|padding|
	padding := 0.
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0).
	aWindow hasCloseBox ifTrue: [aWindow addCloseBox. padding := padding + 1].
	aWindow hasCollapseBox ifTrue: [aWindow addCollapseBox. padding := padding + 1].
	aWindow hasExpandBox ifTrue: [aWindow addExpandBox. padding := padding + 1].
	aWindow hasMenuBox ifTrue: [padding := padding - 1].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	aWindow basicLabel ifNotNil: [:label | aWindow labelArea addMorphBack: label; hResizing: #shrinkWrap].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0; hResizing: #spaceFill).
	padding > 0 ifTrue: [
		aWindow labelArea
			addMorphBack: (Morph new extent: (aWindow boxExtent x * padding) @ 0)].
	aWindow hasMenuBox ifTrue: [aWindow addMenuControl].
	aWindow labelArea
		addMorphBack: (Morph new extent: aWindow class borderWidth @ 0)
]

{ #category : #'label-styles' }
TWMUITheme >> createMenuBoxFor: aSystemWindow [
	"Answer a button for the window menu."
	
	|form msb|
	form := self windowMenuForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuPassiveForm.
	msb extent: form extent.
	msb activeDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	form := self windowMenuPassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [aSystemWindow offerWindowMenu];
		setBalloonText: 'window menu' translated;
		extent: aSystemWindow boxExtent.
	^msb
]

{ #category : #'fill-styles' }
TWMUITheme >> dockingBarNormalFillStyleFor: aToolDockingBar [
	^ SolidFillStyle color: Color transparent
]

{ #category : #'fill-styles' }
TWMUITheme >> dropListDisabledFillStyleFor: aDropList [
	"Return the disabled fillStyle for the given drop list."
	
	^ self textEditorDisabledFillStyleFor: aDropList
]

{ #category : #'border-styles' }
TWMUITheme >> dropListNormalBorderStyleFor: aDropList [
	"Return the normal borderStyle for the given drop list"

	^ self buttonNormalBorderStyleFor: aDropList
]

{ #category : #'fill-styles' }
TWMUITheme >> dropListNormalFillStyleFor: aDropList [
	"Return the normal fillStyle for the given drop list."
	
	^ SolidFillStyle color: Color white
]

{ #category : #'border-styles' }
TWMUITheme >> groupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a group panel."

	^ SimpleBorder new
		width: 1;
		baseColor: ((self baseColorFor: aGroupPanel))
]

{ #category : #private }
TWMUITheme >> lightColorFor: aMorph [
	^ self class lightBaseColor
]

{ #category : #private }
TWMUITheme >> lightSelectionColorFor: aMorph [
	^ self class lightSelectionColor
]

{ #category : #'fill-styles' }
TWMUITheme >> listDisabledFillStyleFor: aList [
	"Return the disabled fillStyle for the given list."
	
	^ self textEditorDisabledFillStyleFor: aList
]

{ #category : #forms }
TWMUITheme >> menuPinForm [
	"Answer the form to use for the pin button of a menu."

	^ TWMUIThemeIcons menuPinForm
]

{ #category : #forms }
TWMUITheme >> newCheckboxMarkerForm [
	"Answer a new checkbox marker form."

	^ TWMUIThemeIcons checkboxMarkerForm
]

{ #category : #'morph creation' }
TWMUITheme >> newFocusIndicatorMorphFor: aMorph [
	"Answer a new focus indicator for the given morph."

	|radius|
	radius := aMorph focusIndicatorCornerRadius.
	^ BorderedMorph new
		fillStyle: Color transparent;
		borderStyle: (SimpleBorder new
			 width: 1;
			baseColor: (self baseSelectionColorFor: aMorph));
		bounds: aMorph focusBounds
]

{ #category : #forms }
TWMUITheme >> newRadioButtonMarkerForm [
	"Answer a new radio button marker form. We make it empty because we already have the selected radio button take care of the state."

	^ TWMUIThemeIcons radioButtonMarkerForm  
]

{ #category : #'initialize-release' }
TWMUITheme >> newRadioMarkerForm [
	"Answer a new checkbox marker form."

	^Form extent: 12@12 depth: 32
]

{ #category : #forms }
TWMUITheme >> newWindowCloseForm [
	"Answer a new form for a window close box."

	^ TWMUIThemeIcons windowCloseForm 
]

{ #category : #forms }
TWMUITheme >> newWindowCloseOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowCloseForm
]

{ #category : #forms }
TWMUITheme >> newWindowMaximizeForm [
	"Answer a new form for a window maximize box."

	^ TWMUIThemeIcons windowMaximizeForm
]

{ #category : #forms }
TWMUITheme >> newWindowMaximizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMaximizeForm
]

{ #category : #forms }
TWMUITheme >> newWindowMenuForm [
	"Answer a new form for a window menu box."

	^ TWMUIThemeIcons windowMenuForm
]

{ #category : #forms }
TWMUITheme >> newWindowMenuPassiveForm [
	"Answer a new form for a window menu box."

	^ TWMUIThemeIcons windowMenuInactiveForm
]

{ #category : #forms }
TWMUITheme >> newWindowMinimizeForm [
	"Answer a new form for a window minimize box."

	^ TWMUIThemeIcons windowMinimizeForm
]

{ #category : #forms }
TWMUITheme >> newWindowMinimizeOverForm [
	"Answer a new form for a window menu box."

	^ self newWindowMinimizeForm
]

{ #category : #private }
TWMUITheme >> normalFillStyleFor: aMorph height: anInteger [
	"Return the normal button fillStyle for the given button."
	
	| baseColor |
	baseColor := self baseColorFor: aMorph.
	^ self normalFillStyleWithBaseColor: baseColor for: aMorph height: anInteger

]

{ #category : #private }
TWMUITheme >> normalFillStyleWithBaseColor: aColor for: aMorph height: anInteger [
	
	| top bottom |
	top := aColor twiceLighter.
	bottom := aColor.
	^(GradientFillStyle ramp: {
			0.0->top.
			0.7->bottom.})
		origin: aMorph bounds origin;
		direction: 0 @ anInteger;
		radial: false
]

{ #category : #'border-styles' }
TWMUITheme >> plainGroupPanelBorderStyleFor: aGroupPanel [
	"Answer the normal border style for a plain group panel."

	^SimpleBorder new
		width: 1;
		baseColor: Color transparent
]

{ #category : #'fill-styles' }
TWMUITheme >> progressBarFillStyleFor: aProgressBar [
	^ self basePassiveBackgroundColorFor: aProgressBar
]

{ #category : #'fill-styles' }
TWMUITheme >> progressBarProgressFillStyleFor: aProgressBar [
	^ (self lightSelectionColorFor: aProgressBar)
]

{ #category : #forms }
TWMUITheme >> radioButtonForm [
	"Answer the form to use for a normal radio button."

	^ TWMUIThemeIcons radioButtonUnselectedForm
]

{ #category : #forms }
TWMUITheme >> radioButtonNormalFillStyleFor: aRadioButton [
	"Return the normal radio button fillStyle for the given button."
	
	^(ImageFillStyle form: self radioButtonForm) origin: aRadioButton topLeft
]

{ #category : #forms }
TWMUITheme >> radioButtonSelectedFillStyleFor: aRadioButton [
	"Return the selected radio button fillStyle for the given button."
	
	^(ImageFillStyle form: self radioButtonSelectedForm) origin: aRadioButton topLeft
]

{ #category : #forms }
TWMUITheme >> radioButtonSelectedForm [
	"Answer the form to use for a selected radio button."

	^ TWMUIThemeIcons radioButtonSelectedForm 
]

{ #category : #'fill-styles' }
TWMUITheme >> resizerGripNormalFillStyleFor: aResizer [
	"Return the normal fillStyle for the given resizer.
	For the moment, answer a transparent colour for no drawing,
	non transparent to draw as normal."
	
	^Color transparent
]

{ #category : #'fill-styles-scrollbars' }
TWMUITheme >> scrollbarNormalButtonFillStyleFor: aScrollbar [
	"Return the normal scrollbar button fillStyle for the given scrollbar."
	
	^ self scrollbarNormalThumbFillStyleFor: aScrollbar
]

{ #category : #'fill-styles-scrollbars' }
TWMUITheme >> scrollbarNormalFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	^ "(self glamorousBaseColorFor: aScrollbar) muchLighter"
	Color r: 245 g: 245 b: 245 range: 255
]

{ #category : #'fill-styles-scrollbars' }
TWMUITheme >> scrollbarNormalThumbFillStyleFor: aScrollbar [
	"Return the normal scrollbar fillStyle for the given scrollbar."
	
	^ (self normalFillStyleWithBaseColor: aScrollbar paneColor for:  aScrollbar height: aScrollbar height)
		direction: (aScrollbar bounds isWide
			ifTrue: [0 @ aScrollbar height]
			ifFalse: [aScrollbar width @ 0])
]

{ #category : #'border-styles-scrollbars' }
TWMUITheme >> scrollbarPagingAreaCornerStyleIn: aThemedMorph [	
	^#square
]

{ #category : #'border-styles-scrollbars' }
TWMUITheme >> scrollbarThumbCornerStyleIn: aThemedMorph [	
	^#square
]

{ #category : #'fill-styles' }
TWMUITheme >> separatorFillStyleFor: aSeparator [
	"Return the separator fillStyle for the given separator."
	
	^ SolidFillStyle color: (self baseColorFor: aSeparator) darker
]

{ #category : #'fill-styles' }
TWMUITheme >> sliderDisabledFillStyleFor: aSlider [
	"Return the disabled fillStyle for the given slider."
	
	^ self textEditorDisabledFillStyleFor: aSlider
]

{ #category : #'fill-styles' }
TWMUITheme >> splitterNormalFillStyleFor: aSplitter [
	"Return the normal splitter fillStyle for the given splitter."
	
	^ SolidFillStyle color: Color transparent
]

{ #category : #'fill-styles' }
TWMUITheme >> splitterPressedFillStyleFor: aSplitter [
	"Return the pressed splitter fillStyle for the given splitter."
	
	|aColor|
	aColor := self baseColorFor: aSplitter.
	^ (GradientFillStyle ramp: {0.0->aColor lighter. 0.9-> aColor})
		origin: aSplitter topLeft;
		direction: (aSplitter splitsTopAndBottom
			ifTrue: [0 @ aSplitter height]
			ifFalse: [aSplitter width @ 0]);
		radial: false
]

{ #category : #'basic-colors' }
TWMUITheme >> subgroupColorFrom: paneColor [
	"Answer the colour for a subgroup given the pane colour."

	^ self lightColorFor: paneColor" self class baseColor"
]

{ #category : #'border-styles' }
TWMUITheme >> tabLabelNormalBorderStyleFor: aTabLabel [
"	^SimpleBorder new
		width: 0;
		baseColor: (self buttonBaseColorFor: aTabLabel) darker
"	^ self buttonNormalBorderStyleFor: aTabLabel
]

{ #category : #'border-styles' }
TWMUITheme >> tabLabelNormalFillStyleFor: aTabLabel [
	^ self baseColorFor: aTabLabel 
]

{ #category : #'border-styles' }
TWMUITheme >> tabLabelSelectedFillStyleFor: aTabLabel [
	^ self baseSelectionColorFor: aTabLabel
]

{ #category : #'border-styles' }
TWMUITheme >> tabPanelBorderStyleFor: aTabGroup [
	^ StandardTabPanelBorder new 
		width: 1;
		baseColor: ((self baseDarkColorFor: aTabGroup));
		tabSelector: aTabGroup tabSelectorMorph
]

{ #category : #'basic-colors' }
TWMUITheme >> taskbarButtonLabelColorFor: aButton [
	"Answer the colour for the label of the given taskbar button."

	^aButton model
		ifNil: [super taskbarButtonLabelColorFor: aButton]
		ifNotNil: [:win |
			win isActive
				ifTrue: [Color black]
				ifFalse: [Color gray darker]]
]

{ #category : #'border-styles' }
TWMUITheme >> taskbarThumbnailCornerStyleFor: aMorph [
	"Answer the corner style for the taskbar thumbnail/tasklist."
	
	^#square
]

{ #category : #'border-styles' }
TWMUITheme >> taskbarThumbnailNormalBorderStyleFor: aWindow [
	^ self buttonNormalBorderStyleFor: aWindow
]

{ #category : #'fill-styles' }
TWMUITheme >> textEditorDisabledFillStyleFor: aTextEditor [
	"Return the disabled fillStyle for the given text editor."
	
	^self basePassiveBackgroundColorFor: aTextEditor
]

{ #category : #'border-styles' }
TWMUITheme >> textEditorNormalBorderStyleFor: aTextEditor [
	"Return the normal text editor borderStyle for the given text editor."

	^self buttonNormalBorderStyleFor: aTextEditor
]

{ #category : #scrollbars }
TWMUITheme >> verticesForSimpleArrow: aRectangle [ 
	| vertices |
	vertices := OrderedCollection new.
	""
	vertices add: aRectangle bottomLeft.
	vertices add: aRectangle center x @ (aRectangle top + (aRectangle width / 8)).
	vertices add: aRectangle bottomRight.
	vertices add: aRectangle bottomRight + (0@0.01).
	""
	^ vertices
]

{ #category : #forms }
TWMUITheme >> windowClosePassiveForm [
	"Answer the form to use for passive (background) window close buttons"

	^ TWMUIThemeIcons windowCloseInactiveForm
]

{ #category : #forms }
TWMUITheme >> windowMaximizePassiveForm [
	"Answer the form to use for passive (background) window maximize/restore buttons"

	^ TWMUIThemeIcons windowMaximizeInactiveForm
]

{ #category : #'label-styles' }
TWMUITheme >> windowMenuPassiveForm [
	"Answer the form to use for passive (background) window menu buttons"

	^self newWindowMenuPassiveForm
]

{ #category : #forms }
TWMUITheme >> windowMinimizePassiveForm [
	"Answer the form to use for passive (background) window minimize buttons"

	^ TWMUIThemeIcons windowMinimizeInactiveForm
]
