Class {
	#name : #MiDependencyButterflyPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyButterflyPalette >> beDefaultStyle [
	
	super beDefaultStyle.
	self
		at: #mainNodeBackground put: Color red;
		at: #incomingNodeBackground put: Color green;
		at: #outgoingNodeBackground put: Color blue
]
