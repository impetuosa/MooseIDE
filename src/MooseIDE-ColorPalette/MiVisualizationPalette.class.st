"
I am the Midas visualization palette
"
Class {
	#name : #MiVisualizationPalette,
	#superclass : #Palette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiVisualizationPalette >> beDefaultStyle [ 

	self addName: #highlightColor forColor: Color yellow darker;
		  addName: #noHighlightColor forColor: (Color r: 0.68 g: 0.83 b: 0.97 alpha: 0.4)
]

{ #category : #initialization }
MiVisualizationPalette >> initialize [

	super initialize .
	self  beDefaultStyle
]
