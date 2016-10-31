versions
version504: spec
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
	
			