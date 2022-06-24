Class {
	#name : #RepositorySystem,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #adding }
RepositorySystem >> addToDoDescribedBy: contentOfDescriptionField categorizedBy: contentOfCategoryField [

	| toDoBuilder |
	
	toDoBuilder := ToDoBuilder withNumericalIdentifier: (repository numberOfToDos + 1) withDescription: contentOfDescriptionField.
	
	toDoBuilder configuringCategory: contentOfCategoryField.
	
	repository addNewToDo: toDoBuilder build
]

{ #category : #adding }
RepositorySystem >> deleteToDoIdentified: anIdentifier [
	
	repository deleteToDoIdentified: anIdentifier
]

{ #category : #'CRUD operations' }
RepositorySystem >> finishedToDos [
	^ repository finishedToDos 
]

{ #category : #'CRUD operations' }
RepositorySystem >> inProgressToDos [
	^ repository inProgressToDos 
]

{ #category : #initialization }
RepositorySystem >> initialize [

	repository := Repository new.
]

{ #category : #'CRUD operations' }
RepositorySystem >> openedToDos [ 
	^ repository openedToDos
]
