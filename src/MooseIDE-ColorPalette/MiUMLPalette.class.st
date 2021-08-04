Class {
	#name : #MiUMLPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiUMLPalette >> beDefaultStyle [ 

	super beDefaultStyle .
	 self
		addName: #boxBackground forColor: (Color colorFrom: 'cfd9df'); "light gray"
		addName: #boxBorder forColor: (Color colorFrom: '666EA0'); "dark blue"
		addName: #textColor forColor: Color black;
		addName: #highlightBorder forColor: Color yellow darker;
		addName: #highlightSelectedEntity forColor: (Color blue alpha: 0.3)
]
