settings
defaultSettings
	"Answer the default settings for the theme."
	defaultSettings := nil.
	^defaultSettings ifNil: [
		self defaultSettings: self newDefaultSettings.
		defaultSettings]