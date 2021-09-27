Class {
	#name : #MiCoyaApplication,
	#superclass : #CoyaApplication,
	#instVars : [
		'modelPublisher'
	],
	#category : #'MooseIDE-Coya-Browser'
}

{ #category : #initialization }
MiCoyaApplication >> addModel: aModel [
	MooseModelRoot root add: aModel.
	modelPublisher publish: self listModels 
]

{ #category : #initialization }
MiCoyaApplication >> initializeTopicsAndServices [

	super initializeTopicsAndServices.
	self provide: #registerNewModel sending: #addModel: to: self.
	self provide: #removeModel sending: #removeModel: to: self.
	self provide: #listModels sending: #listModels to: self.
	modelPublisher := self publisher: #allMooseModels for: self
]

{ #category : #initialization }
MiCoyaApplication >> listModels [

	^ MooseModelRoot root entities asOrderedCollection
]

{ #category : #initialization }
MiCoyaApplication >> removeModel: aModel [

	MooseModelRoot root remove: aModel.
	modelPublisher publish: self listModels
]
