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
ToDoNoteList >> add: aToDoNote [

	[ toDos at: aToDoNote toDoNumber ]
		on: KeyNotFound
		do: [ toDos at: aToDoNote toDoNumber put: aToDoNote. ^ self ].
	ToDoNoteFailure signal: 'You cannot add a ToDo with the same ToDo number as another ToDo'
]

{ #category : #'CRUD operations' }
ToDoNoteList >> deleteToDoWithNumber: aToDoNumber [

	(((toDos at: aToDoNumber) completionStatus) sameAs: 'Abierto') ifTrue: [toDos removeKey: aToDoNumber] ifFalse: [ ToDoNoteFailure signal: 'A ToDo Note with a completion status different than Open cant be deleted' ]
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

{ #category : #accessing }
ToDoNoteList >> numberOfToDos [
	
	^ toDos size
]
