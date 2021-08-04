Class {
	#name : #MiDependencyVisualizationPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyVisualizationPalette >> beDefaultStyle [

	super beDefaultStyle.
	self
		addName: #defaultEdge forColor: Color black;
		addName: #incomingEdge forColor: Color green;
		addName: #outgoingEdge forColor: Color blue;
		addName: #incomingOutgoingEdge forColor: Color red;
		addName: #numberOfLinesBeginScale forColor: Color white; "this is for background boxes"
		addName: #numberOfLinesEndScale forColor: Color darkGray; "this is for background boxes"
		addName: #highlightNode forColor: Color yellow darker "when we hover an entity"
]
