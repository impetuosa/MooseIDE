Class {
	#name : #MiCoyaBrowser,
	#superclass : #CoyaSpecWidget,
	#instVars : [
		'toolbar',
		'up',
		'down',
		'status'
	],
	#category : #'MooseIDE-Coya-Browser'
}

{ #category : #'instance creation' }
MiCoyaBrowser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #models;
		  yourself
]

{ #category : #'instance creation' }
MiCoyaBrowser class >> new [ 
	^ self newApplication: MiCoyaApplication instance. 
]

{ #category : #'instance creation' }
MiCoyaBrowser class >> open [

	<example>
	self new openWithSpec
]

{ #category : #initialization }
MiCoyaBrowser >> addViewer [
	
]

{ #category : #initialization }
MiCoyaBrowser >> configureToolBar [

	toolbar := self newToolbar.
	toolbar addItem: (self newToolbarButton
			 icon: (self iconNamed: #smallAdd);
			 action: [ self addViewer ])
]

{ #category : #initialization }
MiCoyaBrowser >> initializePresenters [

	super initializePresenters.
	models := self newList.
	models items: (self request: #listModels).
	
	models whenSelectionChangedDo: [ :s | mooseModel := s selectedItem ]
]

{ #category : #initialization }
MiCoyaBrowser >> initializeTopicsAndServices [

	super initializeTopicsAndServices.
	self
		subscribe: #allMooseModels
		activating: #updateListModels:
		filter: (CoyaFilter shouldBeKindOf: MooseModel)
]

{ #category : #initialization }
MiCoyaBrowser >> installTransfer: aTransfer into: destination [
	(destination install: aTransfer passenger)
		dragTilte;
		browser: self;
		whenClose: [ :a | destination noteThatWidgetHasBeenClosed:  a ].
	aTransfer passenger hasBeenReinstalled
]

{ #category : #initialization }
MiCoyaBrowser >> newMultiDropInContainer [

	^ ((self instantiate: SpMultiDropInContainer)
		   borderWidth: 2;
		   dropEnabled: true;
		   wantsDrop: [ :transfer :destination | 
			   self shouldAcceptTransfer: transfer into: destination ];
		   acceptDrop: [ :transfer :destination | 
			   self installTransfer: transfer into: destination ]) yourself
]

{ #category : #initialization }
MiCoyaBrowser >> shouldAcceptTransfer: aTransfer into: aDestination [

	(aTransfer isKindOf: SpTransferMorph) ifFalse: [ ^ false ].
	^ aTransfer passenger canBeAdaptedToDropInto: aDestination
]

{ #category : #initialization }
MiCoyaBrowser >> updateListModels: aList [
	models items: aList.
]
