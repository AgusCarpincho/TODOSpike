Class {
	#name : #RepositorySystem,
	#superclass : #Object,
	#instVars : [
		'toDosRepository',
		'employeeNames'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'CRUD operations' }
RepositorySystem >> addEmployeeNamed: anEmployeeName [

	employeeNames add: anEmployeeName
]

{ #category : #'CRUD operations' }
RepositorySystem >> addToDoDescribedBy: contentOfDescriptionField categorizedBy: contentOfCategoryField assignedTo: anEmployeeName [

	| toDoBuilder |
	toDoBuilder := ToDoBuilder
		               withNumericalIdentifier:
		               toDosRepository numberOfToDos + 1
		               withDescription: contentOfDescriptionField.

	toDoBuilder configuringCategory: contentOfCategoryField.
	toDoBuilder configuringAssignedEmployee: anEmployeeName.
	
	toDosRepository addNewToDo: toDoBuilder build
]

{ #category : #'CRUD operations' }
RepositorySystem >> assignEmployee: nameEmployee toTheToDoIdentified: anIdentifier [

	toDosRepository assignEmployee: nameEmployee toTheToDoIdentified: anIdentifier
]

{ #category : #'CRUD operations' }
RepositorySystem >> deleteToDoIdentified: anIdentifier [
	
	toDosRepository deleteToDoIdentified: anIdentifier
]

{ #category : #'CRUD operations' }
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

	toDosRepository := RepositoryOfToDos new.
	employeeNames := OrderedCollection new
]

{ #category : #'CRUD operations' }
RepositorySystem >> modifyCompletionStatusToFinishedTheToDoIdentified: anIdentifier [

	toDosRepository modifyCompletionStatusToFinishedTheToDoIdentified:
		anIdentifier
]

{ #category : #'CRUD operations' }
RepositorySystem >> modifyCompletionStatusToInProgressTheToDoIdentified: anIdentifier [

	toDosRepository modifyCompletionStatusToInProgressTheToDoIdentified: anIdentifier
]

{ #category : #'CRUD operations' }
RepositorySystem >> modifyCompletionStatusToOpenTheToDoIdentified: anIdentifier [

	toDosRepository modifyCompletionStatusToOpenTheToDoIdentified:
		anIdentifier
]

{ #category : #'CRUD operations' }
RepositorySystem >> modifyTheToDoIdentified: anIdentifier withTheNewCompletionDate: aCompletionDate [

	toDosRepository modifyTheToDoIdentified: anIdentifier withTheNewCompletionDate: aCompletionDate
]

{ #category : #'CRUD operations' }
RepositorySystem >> openedToDos [ 
	^ toDosRepository openedToDos
]
