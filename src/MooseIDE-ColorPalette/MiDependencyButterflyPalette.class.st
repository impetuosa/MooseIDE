Class {
	#name : #MiDependencyButterflyPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiDependencyButterflyPalette >> beDefaultStyle [
	
	super beDefaultStyle.
	self
		addName: #backgroundMainNode forColor: Color red;
		addName: #backgroundIncomingNode forColor: Color green;
		addName: #backgroundOutgoingNode forColor: Color blue;
		addName: #labelColor forColor: Color black;
		addName: #edgeColor forColor: Color lightGray
]

{ #category : #initialization }
MiDependencyButterflyPalette >> initialize [ 

	super initialize 
]
