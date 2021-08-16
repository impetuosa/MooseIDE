Class {
	#name : #MiDependencyButterfly,
	#superclass : #MiAbstractVisualization,
	#instVars : [
		'entity',
		'butterfly'
	],
	#category : #'MooseIDE-Telescope-Butterfly'
}

{ #category : #running }
MiDependencyButterfly >> decorateEntity [
	butterfly mainEntity: self entity.
	(butterfly styleSheet > #entity)
		backgroundColor: (self palette mainEntityBackground);
		nodeLabel: #name.
	butterfly > #central addStyle: #entity
]

{ #category : #running }
MiDependencyButterfly >> decorateIncoming [
	butterfly
		leftEntities: [ :e | e queryAllIncoming withoutSelfLoops atScope: entity class ].
	butterfly styleSheet > #incoming backgroundColor: (self palette incomingEntityBackground).
	butterfly > #left addStyle: #incoming
]

{ #category : #running }
MiDependencyButterfly >> decorateOutgoing [
	butterfly
		rightEntities: [ :e | e queryAllOutgoing withoutSelfLoops atScope: entity class ].
	butterfly styleSheet > #outgoing backgroundColor: (self palette outgoingEntityBackground).
	butterfly > #right addStyle: #outgoing
]

{ #category : #accessing }
MiDependencyButterfly >> entity [
	^ entity
]

{ #category : #accessing }
MiDependencyButterfly >> entity: anObject [
	entity := anObject
]

{ #category : #running }
MiDependencyButterfly >> run [
	super run.
	butterfly := TLButterfly new.
	self setButterflyStyle.
	self
		decorateEntity;
		decorateIncoming;
		decorateOutgoing.
	butterfly openInCanvas: self canvas.
	self canvas zoomToFit
]

{ #category : #initialization }
MiDependencyButterfly >> setButterflyStyle [
	butterfly styleSheet
		shape: TLEllipse;
		width: 40;
		borderWidth: 0.5
]
