"
I am the MooseIDE visualization palette
"
Class {
	#name : #MiVisualizationPalette,
	#superclass : #Palette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiVisualizationPalette >> beDefaultStyle [

	self
		addName: #highlight forColor: Color yellow darker;
		addName: #nodeBackground forColor: (Color r: 0.68 g: 0.83 b: 0.97); "smalltalk color lightBlue"	
		addName: #highlightSelectedNode forColor: (Color blue alpha: 0.3); "make a shadow"
		addName: #label forColor: Color black;
		addName: #edge forColor: Color black;
		addName: #border forColor: Color black
]

{ #category : #initialization }
MiVisualizationPalette >> initialize [

	super initialize .
	self  beDefaultStyle
]
