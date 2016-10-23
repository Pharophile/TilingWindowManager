tests
testWorkspace2MenuShouldContainShortenedStringForWorkspaceThree
	self assertMenuWithIcon: twmBar workspacesMenuIcon containsItemNamed: 'I am a Workspace with a very long first line. ...'.