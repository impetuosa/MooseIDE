Class {
	#name : #MiDependencyVisualizationPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyVisualizationPalette >> beDefaultStyle [

	super beDefaultStyle.
	self
		addName: #incomingEdge forColor: Color green;
		addName: #outgoingEdge forColor: Color blue;
		addName: #incomingOutgoingEdge forColor: Color red;
		addName: #startingGradient forColor: Color white; "this is for background boxes"
		addName: #endingGradient forColor: Color darkGray; "this is for background boxes"
		addName: #legendBackground forColor: (Color white alpha: 0.8)
]
