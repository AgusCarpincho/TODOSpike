"
ToDoNoteList is an object that fulfills the function of storing the ToDoNotes as if it were a real life list
"
Class {
	#name : #Repository,
	#superclass : #Object,
	#instVars : [
		'toDos'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'CRUD operations' }
Repository >> addNewToDo: aToDo(self [ existsToDoIdentified: aToDo identifier) ifTrue: [ 
		ToDoException signal:
			'A ToDo with the same identifier already exists in the repository' ].

	toDos add: aToDo
]

{ #category : #'CRUD operations' }
Repository >> assignEmployee: nameEmployee toTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) assignTo: nameEmployee
]

{ #category : #'CRUD operations' }
Repository >> deleteToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier).
	
	toDos removeAllSuchThat: [ :toDoNote | 
		toDoNote identifier = anIdentifier and: toDoNote isOpen ]
]

{ #category : #'private - asserting' }
Repository >> existsToDoIdentified: anIdentifier [

	^ toDos anySatisfy: [ :toDo | toDo identifier = anIdentifier ]
]

{ #category : #'CRUD operations' }
Repository >> finishedToDos [

	^ toDos select: [ :toDo | toDo identifier isFinished ]
]

{ #category : #'CRUD operations' }
Repository >> inProgressToDos [

	^ toDos select: [ :toDo | toDo identifier isInProgress ]
]

{ #category : #'initialization - private' }
Repository >> initialize [

	toDos := OrderedCollection new.
	
]

{ #category : #'CRUD operations' }
Repository >> modifyCompletionStatusToFinishedTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToFinished

]

{ #category : #'CRUD operations' }
Repository >> modifyCompletionStatusToInProgressTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToInProgress
]

{ #category : #'CRUD operations' }
Repository >> modifyCompletionStatusToOpenTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToOpen
]

{ #category : #'CRUD operations' }
Repository >> modifyTheToDoIdentified: anIdentifier withTheNewCompletionDate: aCompletionDate [

	(self selectToDoWith: anIdentifier) assignCompletionDate: aCompletionDate
]

{ #category : #accessing }
Repository >> numberOfFinishedToDos [

	^ (toDos select: [ :toDo | toDo isFinished ]) size
]

{ #category : #accessing }
Repository >> numberOfInProgressToDos [

	^ (toDos select: [ :toDo | toDo isInProgress ]) size
]

{ #category : #accessing }
Repository >> numberOfOpenToDos [

	^ (toDos select: [ :toDo | toDo isOpen ]) size
]

{ #category : #accessing }
Repository >> numberOfToDos [

	^ toDos size
]

{ #category : #'CRUD operations' }
Repository >> openedToDos [

	^ toDos select: [ :toDo | toDo identifier isOpen ]
]

{ #category : #'CRUD operations' }
Repository >> selectToDoWith: anIdentifier [

	| collectionOfToDos |
	
		collectionOfToDos := (toDos select: [ :toDo | toDo identifier = anIdentifier ]).
		collectionOfToDos ifEmpty: [ 
ToDoNotFound signal: 'The ToDo doesnt exists in the repository' ].
	^ collectionOfToDos first .
]
