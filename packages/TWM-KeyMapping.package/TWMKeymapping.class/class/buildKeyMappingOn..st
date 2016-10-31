shortcuts
buildKeyMappingOn: aBuilder  
	<keymap>
	"See shortucts accessor to add/change a shortcut "
	
	
	self shortcutsActionAndKeysDo: [:action :keys :description|
"		self halt."
		(aBuilder shortcut: action)
			category: self shortcutCategory
			default: keys
			do: [  self windowManager perform: action ]
			description: description.
	].

	
	aBuilder setAsGlobalCategory: self shortcutCategory.
	