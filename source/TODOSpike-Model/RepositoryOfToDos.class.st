"
ToDoNoteList is an object that fulfills the function of storing the ToDoNotes as if it were a real life list
"
Class {
	#name : #RepositoryOfToDos,
	#superclass : #Object,
	#instVars : [
		'toDos'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'CRUD operations' }
RepositoryOfToDos >> addNewToDo: aToDo [

	(self existsToDoIdentified: aToDo identifier) ifTrue: [ 
		ToDoException signal:
			'A ToDo with the same identifier already exists in the repository' ].

	toDos add: aToDo
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> assignEmployee: nameEmployee toTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) assignTo: nameEmployee
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> deleteToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier).
	
	toDos removeAllSuchThat: [ :toDoNote | 
		toDoNote identifier = anIdentifier and: toDoNote isOpen ]
]

{ #category : #'private - asserting' }
RepositoryOfToDos >> existsToDoIdentified: anIdentifier [

	^ toDos anySatisfy: [ :toDo | toDo identifier = anIdentifier ]
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> finishedToDos [

	^ toDos select: [ :toDo | toDo isFinished ]
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> inProgressToDos [

	^ toDos select: [ :toDo | toDo isInProgress ]
]

{ #category : #'initialization - private' }
RepositoryOfToDos >> initialize [

	toDos := OrderedCollection new.
	
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> modifyCompletionStatusToFinishedTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToFinished

]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> modifyCompletionStatusToInProgressTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToInProgress
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> modifyCompletionStatusToOpenTheToDoIdentified: anIdentifier [

	(self selectToDoWith: anIdentifier) setCompletionStatusToOpen
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> modifyTheToDoIdentified: anIdentifier withTheNewCompletionDate: aCompletionDate [

	(self selectToDoWith: anIdentifier) assignCompletionDate: aCompletionDate
]

{ #category : #accessing }
RepositoryOfToDos >> numberOfFinishedToDos [

	^ (toDos select: [ :toDo | toDo isFinished ]) size
]

{ #category : #accessing }
RepositoryOfToDos >> numberOfInProgressToDos [

	^ (toDos select: [ :toDo | toDo isInProgress ]) size
]

{ #category : #accessing }
RepositoryOfToDos >> numberOfOpenToDos [

	^ (toDos select: [ :toDo | toDo isOpen ]) size
]

{ #category : #accessing }
RepositoryOfToDos >> numberOfToDos [

	^ toDos size
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> openedToDos [

	^ toDos select: [ :toDo | toDo isOpen ]
]

{ #category : #'CRUD operations' }
RepositoryOfToDos >> selectToDoWith: anIdentifier [

	| collectionOfToDos |
	
		collectionOfToDos := (toDos select: [ :toDo | toDo identifier = anIdentifier ]).
		collectionOfToDos ifEmpty: [ 
ToDoNotFound signal: 'The ToDo doesnt exists in the repository' ].
	^ collectionOfToDos first .
]
