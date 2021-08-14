Class {
	#name : #MiDependencyVisualizationPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyVisualizationPalette >> beDefaultStyle [

	super beDefaultStyle.
	self
		at: #incomingEdge put: Color green;
		at: #outgoingEdge put: Color blue;
		at: #incomingOutgoingEdge put: Color red;
		at: #startingGradient put: Color white; "this is for background boxes"
		at: #endingGradient put: Color darkGray; "this is for background boxes"
		at: #legendBackground put: (Color white alpha: 0.8)
]
