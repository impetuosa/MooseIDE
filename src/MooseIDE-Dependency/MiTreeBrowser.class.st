"
Shows the containment tree (direct relations for now) between the entities.

- Follow: Accepts a MooseEntity using TEntityMetaLevelDependency.
- Highlight: Entities if present.
- Propagate: <TODO>
"
Class {
	#name : #MiTreeBrowser,
	#superclass : #MiAbstractDependencyBrowser,
	#instVars : [
		'tree'
	],
	#category : #'MooseIDE-Dependency-Tree'
}

{ #category : #specs }
MiTreeBrowser class >> defaultSpec [
	^ super defaultSpec
		add: #tree;
		yourself
]

{ #category : #specs }
MiTreeBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	<miBrowsers>
	(aBuilder item: #TreeBrowser)
		parent: self toolbarDependencyName;
		label: self title;
		order: 1.0;
		icon: (self iconNamed: #mooseTree);
		help: self helpMessage;
		action: [ self open ]
]

{ #category : #'as yet unclassified' }
MiTreeBrowser class >> newModel [
	^ MiTreeBrowserModel new
]

{ #category : #specs }
MiTreeBrowser class >> open [
	<script>
	^ super open
]

{ #category : #'as yet unclassified' }
MiTreeBrowser class >> title [
	^ 'Tree'
]

{ #category : #'as yet unclassified' }
MiTreeBrowser >> canReceiveEntity: anObject [
	^ anObject usesFamixTrait: TEntityMetaLevelDependency
]

{ #category : #actions }
MiTreeBrowser >> followEntity: anEntity [

	self model selected: anEntity.
	self model root: anEntity.
	self refresh
]

{ #category : #'as yet unclassified' }
MiTreeBrowser >> initialize [
	super initialize.
	model := MiTreeBrowserModel new
]

{ #category : #'as yet unclassified' }
MiTreeBrowser >> initializePresenters [

	super initializePresenters.
	tree := self newTreeTable.
	tree
		addColumn: (SpCompositeTableColumn new
				 addColumn: ((SpImageTableColumn evaluated: #midasIcon)
						  width: 20;
						  yourself);
				 addColumn: (SpStringTableColumn evaluated: #name);
				 yourself);
		children: [ :aClass | aClass children asOrderedCollection ];
		beMultipleSelection;
		beResizable.
	tree whenSelectionChangedDo: [ :selected | 
		self freezeDuring: [ 
			| selectedEntity |
			selectedEntity := self miSelectedItem.
			model selected: selectedEntity.
			self buses do: [ :bus | bus globallySelect: selectedEntity ] ] ]
]

{ #category : #accessing }
MiTreeBrowser >> miSelectedItem [

	| selection |
	selection := tree selection.
	^ selection selectedItems size = 1
		  ifTrue: [ selection selectedItem ]
		  ifFalse: [ MooseGroup withAll: selection selectedItems ]
]

{ #category : #'as yet unclassified' }
MiTreeBrowser >> refresh [
	tree roots: { self model root }
]
