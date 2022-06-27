Class {
	#name : #RepositorySystem,
	#superclass : #Object,
	#instVars : [
		'toDosRepository',
		'employeeNames'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #initialization }
RepositorySystem >> addEmployeeName: anEmployeeName [

	employeeNames add: anEmployeeName
]

{ #category : #adding }
RepositorySystem >> addToDoDescribedBy: contentOfDescriptionField categorizedBy: contentOfCategoryField [

	| toDoBuilder |
	
	toDoBuilder := ToDoBuilder withNumericalIdentifier: (toDosRepository numberOfToDos + 1) withDescription: contentOfDescriptionField.
	
	toDoBuilder configuringCategory: contentOfCategoryField.
	
	toDosRepository addNewToDo: toDoBuilder build
]

{ #category : #adding }
RepositorySystem >> deleteToDoIdentified: anIdentifier [
	
	toDosRepository deleteToDoIdentified: anIdentifier
]

{ #category : #initialization }
RepositorySystem >> employeeNames [

	^ employeeNames
]

{ #category : #'CRUD operations' }
RepositorySystem >> finishedToDos [
	^ toDosRepository finishedToDos 
]

{ #category : #'CRUD operations' }
RepositorySystem >> inProgressToDos [
	^ toDosRepository inProgressToDos 
]

{ #category : #initialization }
RepositorySystem >> initialize [

	toDosRepository := Repository new.
	employeeNames := OrderedCollection new.
]

{ #category : #'CRUD operations' }
RepositorySystem >> openedToDos [ 
	^ toDosRepository openedToDos
]
