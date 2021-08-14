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

	colorsDictionary 
		at: #highlight put: Color yellow darker;
		at: #nodeBackground put: (Color r: 0.68 g: 0.83 b: 0.97); "smalltalk color lightBlue"	
		at: #highlightSelectedNode put: (Color blue alpha: 0.3); "make a blue shadow behind the background of the selected entity"
		
		at: #contrasted put: Color black; "contrasted to the UI Theme"
		at: #label put: Color black;
		at: #edge put: Color black;
		at: #textColor put: Color black;
		at: #border put: Color black;
		
		at: #mainNodeBackground put: Color red;
		at: #incomingOutgoingEdge put: Color red;
		at: #backgroundReceivedEntity put: Color red;
		at: #inheritanceButtonsColor put: Color red;
		
		at: #incomingNodeBackground put: Color green;
		at: #incomingEdge put: Color green;
		
		at: #outgoingNodeBackground put: Color blue;
		at: #outgoingEdge put: Color blue;
		
		at: #startingGradient put: Color white; "this is for background boxes"
		at: #endingGradient put: Color darkGray; "this is for background boxes"
		at: #legendBackground put: (Color white alpha: 0.8);
		at: #referenceButtonColor put: Color lightGray;
		at: #boxBackground put: (Color colorFrom: 'cfd9df'); "light gray"
		at: #boxBorder put: (Color colorFrom: '666EA0'); "dark blue"
		at: #highlightSelectedEntity put: (Color blue alpha: 0.3)
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> borderColor [
	
	^ colorsDictionary at: #border
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> contrastedColor [
	
	^ colorsDictionary at: #label
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> edgeColor [ 

	^ colorsDictionary at: #contrasted
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> highlight [ 
	
	^ colorsDictionary at: #highlight
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> highlightSelectedEntity [ 

	^ colorsDictionary at: #highlightSelectedNode
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> incomingEdgeColor [

	^ colorsDictionary at: #incomingEdge
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> incomingEntityBackground [ 

	^ colorsDictionary at: #incomingNodeBackground
]

{ #category : #initialization }
MiVisualizationPalette >> initialize [

	super initialize .
	self  beDefaultStyle
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> labelColor [

	^ colorsDictionary at: #contrasted
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> mainEntityBackground [

	^ colorsDictionary at: #mainNodeBackground
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> outgoingEdgeColor [

	^ colorsDictionary at: #outgoingEdge
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> outgoingEntityBackground [

	^ colorsDictionary at: #outgoingNodeBackground
]
