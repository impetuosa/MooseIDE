Class {
	#name : #MiDependencyButterflyPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyButterflyPalette >> beDefaultStyle [
	
	super beDefaultStyle.
	self
		addName: #mainNodeBackground forColor: Color red;
		addName: #incomingNodeBackground forColor: Color green;
		addName: #outgoingNodeBackground forColor: Color blue
]
