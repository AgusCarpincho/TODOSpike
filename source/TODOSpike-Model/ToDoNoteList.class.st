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

	[ toDos at: aToDoNote identifier ]
		on: KeyNotFound
		do: [ toDos at: aToDoNote identifier put: aToDoNote. ^ self ].
	ToDoNoteException signal: 'You cannot add a ToDo with the same ToDo number as another ToDo'
]

{ #category : #'CRUD operations' }
ToDoNoteList >> assignEmployee: nameEmployee toTheToDoIdentified: anIdentifier [

	(self selectTheToDoIdentified: anIdentifier) assignTo: nameEmployee
]

{ #category : #'CRUD operations' }
ToDoNoteList >> deleteToDoIdentified: anIdentifier [

	(toDos at: anIdentifier) isOpen
		ifTrue: [ toDos removeKey: anIdentifier ]
		ifFalse: [ 
			ToDoNoteException signal:
				'A ToDo Note with a completion status different than Open cant be deleted' ]
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
ToDoNoteList >> modifyCompletionStatusToFinishedTheToDoIdentified: anIdentifier [

	((self selectTheToDoIdentified: anIdentifier)
		setCompletionStatusToFinished)
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyCompletionStatusToInProgressTheToDoIdentified: anIdentifier [

	((self selectTheToDoIdentified: anIdentifier)
		setCompletionStatusToInProgress)
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyCompletionStatusToOpenTheToDoIdentified: anIdentifier [

	((self selectTheToDoIdentified: anIdentifier)
		setCompletionStatusToOpen)
]

{ #category : #'CRUD operations' }
ToDoNoteList >> modifyTheToDoIdentified: anIdentifier withTheNewCompletionDate: aCompletionDate [

	((toDos at: anIdentifier) assignCompletionDate: aCompletionDate)
]

{ #category : #accessing }
ToDoNoteList >> nextNumericalIdentifier [

	^ toDos size + 1
]

{ #category : #accessing }
ToDoNoteList >> numberOfToDos [
	
	^ toDos size
]

{ #category : #'CRUD operations' }
ToDoNoteList >> selectTheToDoIdentified: anIdentifier [

	^ toDos at: anIdentifier
]
