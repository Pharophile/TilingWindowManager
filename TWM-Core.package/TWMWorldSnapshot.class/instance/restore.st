snapshot
restore
	self windowSnapshots reverse do: [:aSnapshot| aSnapshot restore].
	self snapshot.