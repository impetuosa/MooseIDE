Class {
	#name : #MiUMLPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #style }
MiUMLPalette >> beDefaultStyle [ 

	super beDefaultStyle .
	 self
		at: #boxBackground put: (Color colorFrom: 'cfd9df'); "light gray"
		at: #boxBorder put: (Color colorFrom: '666EA0'); "dark blue"
		at: #textColor put: Color black;
		at: #highlightBorder put: Color yellow darker;
		at: #highlightSelectedEntity put: (Color blue alpha: 0.3)
]
