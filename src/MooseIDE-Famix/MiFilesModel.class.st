Class {
	#name : #MiFilesModel,
	#superclass : #Object,
	#instVars : [
		'fileReference',
		'mooseModel'
	],
	#category : #'MooseIDE-Famix-FilesBrowser'
}

{ #category : #accessing }
MiFilesModel >> fileReference [
	^ fileReference
]

{ #category : #accessing }
MiFilesModel >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #accessing }
MiFilesModel >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
MiFilesModel >> mooseModel: anObject [
	mooseModel := anObject
]
