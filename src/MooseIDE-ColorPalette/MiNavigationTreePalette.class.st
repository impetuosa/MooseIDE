Class {
	#name : #MiNavigationTreePalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiNavigationTreePalette >> beDefaultStyle [

	super beDefaultStyle.
	self
		addName: #backgroundReceivedEntity forColor: Color red;
		addName: #inheritanceButtonsColor forColor: Color red;
		addName: #referenceButtonColor forColor: Color lightGray
]
