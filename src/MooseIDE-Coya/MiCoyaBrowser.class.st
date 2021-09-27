Class {
	#name : #MiCoyaBrowser,
	#superclass : #CoyaSpecWidget,
	#instVars : [
		'#models',
		'#mooseModel => CoyaPublishSlot topic: #runningMooseModel'
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
MiCoyaBrowser >> updateListModels: aList [
	models items: aList.
]
