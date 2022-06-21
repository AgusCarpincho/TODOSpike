Class {
	#name : #PrincipalContentView,
	#superclass : #WAPainter,
	#instVars : [
		'openedToDosColumnView',
		'inProgressToDosColumnView',
		'finishedToDoListView',
		'repositorySystem'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
PrincipalContentView class >> withRepositorySystem: aRepository [

	^ self new
		  initializeWithRepository: aRepository
]

{ #category : #configuring }
PrincipalContentView >> beIdentifiable [

	^ true
]

{ #category : #'initialization - private' }
PrincipalContentView >> initializeWithRepository: aRepositorySystem [

	repositorySystem := aRepositorySystem.
	openedToDosColumnView := ToDosColumnView withToDos: repositorySystem openedToDos named: 'Open'.
	inProgressToDosColumnView := ToDosColumnView withToDos: repositorySystem inProgressToDos named: 'In Progress'.
	finishedToDoListView := ToDosColumnView withToDos: repositorySystem finishedToDos named: 'Finished'.
]

{ #category : #rendering }
PrincipalContentView >> renderContentOn: aRenderer [

		aRenderer render: openedToDosColumnView.
		aRenderer render: inProgressToDosColumnView.
		aRenderer render: finishedToDoListView.
]
