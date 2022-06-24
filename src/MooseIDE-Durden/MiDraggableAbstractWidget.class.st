"
I define the same header as Midas widgets, and add the inside widget dynamically. I allow to attach/detach bus connections from my self
"
Class {
	#name : #MiDraggableAbstractWidget,
	#superclass : #SpAbstractWidgetPresenter,
	#instVars : [
		'selection',
		'toSelect',
		'browser',
		'dragMe',
		'dragMeOut',
		'close',
		'freezeButton'
	],
	#category : #'MooseIDE-Durden'
}

{ #category : #commands }
MiDraggableAbstractWidget class >> adapterName [

	 self error: 'should not be called '
]

{ #category : #commands }
MiDraggableAbstractWidget class >> basicDefaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newLeftToRight
				   add: #dragMe;
				   add: #freezeButton width: self iconWidth;
				   add: #dragMeOut width: self iconWidth;
				   add: #close width: self iconWidth;
				   yourself)
		  height: self toolbarHeight;
		  yourself
]

{ #category : #commands }
MiDraggableAbstractWidget class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [
	rootCommandGroup register: (MiPropagateCommand forSpecContext: presenterInstance).
	rootCommandGroup register: (MiInspectCommand forSpecContext: presenterInstance)
]

{ #category : #commands }
MiDraggableAbstractWidget class >> defaultLayout [ 

	^ self basicDefaultSpec
]

{ #category : #commands }
MiDraggableAbstractWidget class >> defaultSpec [

	^ self basicDefaultSpec
]

{ #category : #commands }
MiDraggableAbstractWidget class >> helpMessage [
	^ (self comment lines copyUpTo: '')
		fold: [ :s1 :s2 | s1 , Character cr asString , s2 ]
]

{ #category : #commands }
MiDraggableAbstractWidget class >> isAbstract [

	^ self = MiDraggableAbstractWidget
]

{ #category : #commands }
MiDraggableAbstractWidget class >> open [

	^ MiDraggableDefaultBrowser runMeWith: self
]

{ #category : #commands }
MiDraggableAbstractWidget class >> runMe [

	^ MiDraggableDefaultBrowser runMeWith: self
]

{ #category : #accessing }
MiDraggableAbstractWidget >> accept: anAlcixModel [

	^ self canFollowEntity: anAlcixModel
]

{ #category : #opening }
MiDraggableAbstractWidget >> adaptToDropInto: aDropDestination [

	owner noteThatWidgetHasBeenClosed: self.
	^ self
]

{ #category : #opening }
MiDraggableAbstractWidget >> browse: anAlcixLocalVariable [
	(AlceSourceCodePropagator new relatedWidget: self ) browse: anAlcixLocalVariable.

]

{ #category : #opening }
MiDraggableAbstractWidget >> browser: aBrowser [
	browser := aBrowser 
]

{ #category : #testing }
MiDraggableAbstractWidget >> canBeAdaptedToDropInto: aDestination [
	^ true
]

{ #category : #testing }
MiDraggableAbstractWidget >> canReceiveEntity: anAlcixModel [

	^ self accept: anAlcixModel
]

{ #category : #accessing }
MiDraggableAbstractWidget >> colorForTable: anEntity [

	^ anEntity color
]

{ #category : #testing }
MiDraggableAbstractWidget >> dragTilte [

	dragMe label: self title
]

{ #category : #opening }
MiDraggableAbstractWidget >> followAction [

	self subclassResponsibility
]

{ #category : #actions }
MiDraggableAbstractWidget >> followEntity: anAlcixModel [

	toSelect := anAlcixModel.
	self followAction
]

{ #category : #actions }
MiDraggableAbstractWidget >> freezeAction [

	^ self
]

{ #category : #actions }
MiDraggableAbstractWidget >> freezeDuring: aFullBlockClosure [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
MiDraggableAbstractWidget >> getSelectedItem: aSelection [

	| items |
	(aSelection respondsTo: #selectedItems)
		ifTrue: [ 
			items := aSelection selectedItems.
			^ items size = 1
				  ifTrue: [ items first ]
				  ifFalse: [ items ] ]
		ifFalse: [ ^ aSelection ]
]

{ #category : #opening }
MiDraggableAbstractWidget >> hasBeenReinstalled [
	self dragTilte.
	selection := toSelect.
	selection ifNotNil: [ self followAction ].
]

{ #category : #actions }
MiDraggableAbstractWidget >> initializePresenters [

	super initializePresenters.
	dragMe := self instantiate: SpDragMe.
	dragMe passenger: self.
	dragMe label: 'Drag'.
	dragMeOut := self newButton.
	dragMeOut action: [ 
		owner noteThatWidgetHasBeenClosed: self.
		MiDraggableDefaultBrowser new
			widget: self;
			open ].
	freezeButton := self newToggleButton
		                icon: (self iconNamed: #smallLock);
		                help: #'Freeze content from next interactions';
		                yourself.

	dragMeOut
		icon: (self iconNamed: #glamorousOver);
		help: #'Undeck widget';
		yourself.
	close := self newButton.
	close
		help: #'Close widget';
		icon: (self iconNamed: #glamorousClose)
]

{ #category : #testing }
MiDraggableAbstractWidget >> isFollow [
	browser ifNil: [ ^ false ].
	^ browser isFollow
]

{ #category : #testing }
MiDraggableAbstractWidget >> isFreeze [
	 ^ browser ifNotNil: [ browser isFreeze. ] ifNil: [ true ]
]

{ #category : #testing }
MiDraggableAbstractWidget >> isMiBrowser [

	^ false
]

{ #category : #accessing }
MiDraggableAbstractWidget >> miSelectedItem [
	^ selection
]

{ #category : #testing }
MiDraggableAbstractWidget >> propagate [

	browser ifNotNil: [ browser propagate: self  ]
]

{ #category : #'instance creation' }
MiDraggableAbstractWidget >> propagate: anAlcixAttribute [

	browser ifNotNil: [ browser propagate: anAlcixAttribute from: self ]
]

{ #category : #accessing }
MiDraggableAbstractWidget >> selectEntity: anEntity [

	"accessing"

	anEntity ifNil: [ ^ self ].
	freezeButton ifNotNil: [freezeButton state ifTrue: [ ^ self ]].
	(self accept: anEntity) ifFalse: [ ^ self ].
	toSelect := anEntity.

	MiFollowMode browser: self actOnEntity: anEntity
]

{ #category : #accessing }
MiDraggableAbstractWidget >> selection: aSelection [

	selection := self getSelectedItem: aSelection.
	self propagate
]

{ #category : #actions }
MiDraggableAbstractWidget >> startDragging [
	^ dragMe startDragging
]

{ #category : #testing }
MiDraggableAbstractWidget >> title [
 	^ self class title. 
]

{ #category : #actions }
MiDraggableAbstractWidget >> whenClose: aBlock [

	close action: [ aBlock cull: self cull: self owner ]
]
