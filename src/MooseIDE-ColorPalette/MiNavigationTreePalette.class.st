Class {
	#name : #MiNavigationTreePalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiNavigationTreePalette >> beDefaultStyle [

	super beDefaultStyle.
	self
		at: #backgroundReceivedEntity put: Color red;
		at: #inheritanceButtonsColor put: Color red;
		at: #referenceButtonColor put: Color lightGray
]
