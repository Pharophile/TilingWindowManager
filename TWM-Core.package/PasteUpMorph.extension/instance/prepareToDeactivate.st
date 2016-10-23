*twm-core
prepareToDeactivate
	"Some things still may need to be brought from Squeak:
		* MorphicProject>>pauseSoundPlayers"

	self
		triggerEvent: #aboutToLeaveWorld;
		sleep.
		
	Sensor
		flushNonKbdEvents;
		flushKeyboard.