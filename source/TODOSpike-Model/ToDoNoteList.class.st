"
ToDoNoteList is an object that fulfills the function of storing the ToDoNotes as if it were a real life list
"
Class {
	#name : #ToDoNoteList,
	#superclass : #Object,
	#instVars : [
		'listName',
		'toDos'
	],
	#classInstVars : [
		'listName'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNoteList class >> named: aListName [

	^ self new initializeNamed: aListName
]

{ #category : #'CRUD operations' }
ToDoNoteList >> addNewToDo: aToDoNote [

	[ toDos at: aToDoNote toDoNumber ]
		on: KeyNotFound
		do: [ toDos at: aToDoNote toDoNumber put: aToDoNote. ^ self ].
	ToDoNoteFailure signal: 'You cannot add a ToDo with the same ToDo number as another ToDo'
]

{ #category : #'CRUD operations' }
ToDoNoteList >> assignEmployee: nameEmployee toTheToDoWithNumber: aToDoNumber [ 
	
	(self selectTheToDoWithNumber: aToDoNumber) assignedTo: nameEmployee
]

{ #category : #'CRUD operations' }
ToDoNoteList >> deleteToDoWithNumber: aToDoNumber [

	(((toDos at: aToDoNumber) completionStatus) sameAs: 'Open') ifTrue: [toDos removeKey: aToDoNumber] ifFalse: [ ToDoNoteFailure signal: 'A ToDo Note with a completion status different than Open cant be deleted' ]
]

{ #category : #'initialization - private' }
ToDoNoteList >> initializeNamed: aListName [

	listName := aListName.
	toDos := Dictionary new.
]

{ #category : #accessing }
ToDoNoteList >> listName [
	
	^ listName
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyCompletionStatusToFinishedTheToDoWithNumber: aToDoNumber [

	(self selectTheToDoWithNumber: aToDoNumber) setCompletionStatusToFinished
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyCompletionStatusToInProgressTheToDoWithNumber: aToDoNumber [

	(self selectTheToDoWithNumber: aToDoNumber) setCompletionStatusToInProgress
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyCompletionStatusToOpenTheToDoWithNumber: aToDoNumber [

	(self selectTheToDoWithNumber: aToDoNumber) setCompletionStatusToOpen
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyTheToDoNumber: aToDoNumber withTheNewCompletionDate: aCompletionDate [
	
	(toDos at: aToDoNumber) setCompletionDateTo: aCompletionDate
]

{ #category : #accessing }
ToDoNoteList >> numberOfToDos [
	
	^ toDos size
]

{ #category : #'CRUD operations' }
ToDoNoteList >> selectTheToDoWithNumber: aToDoNumber [

	^ toDos at: aToDoNumber
]
