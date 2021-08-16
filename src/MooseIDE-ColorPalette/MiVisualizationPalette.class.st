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
		
		at: #contrastedToTheme put: Color black; "contrasted to the UI Theme"
		at: #border put: Color black;
		
		at: #mainNodeBackground put: Color red;
		at: #incomingAndOutgoingEdge put: Color red;
		
		at: #incomingNodeBackground put: Color green;
		at: #incomingEdge put: Color green;
		
		at: #outgoingNodeBackground put: Color blue;
		at: #outgoingEdge put: Color blue;
		
		at: #startingGradient put: Color white; "this is for background boxes in MiDependencyVisu"
		at: #endingGradient put: Color darkGray; "this is for background boxes in MiDependencyVisu"
		at: #legendBackground put: (Color white alpha: 0.8); "for miDependencyVisualization"
		
		at: #referenceButtonColor put: Color lightGray; "used in MiNavigationTreeVisualization>>#buildAssociationButtons"
		at: #inheritanceButtonColor put: Color red "used in MiNavigationTreeVisualization>>#buildAssociationButtons"
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> borderColor [
	
	^ colorsDictionary at: #border
]

{ #category : #'api - accessing' }
MiVisualizationPalette >> defaultEntityBackground [

	^ self colorAt: #nodeBackground
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
MiVisualizationPalette >> incomingAndOutgoingEdge [ 

	^ self colorAt: #incomingAndOutgoingEdge
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
