Class {
	#name : #ToDoNoteInProgressCompletionStatus,
	#superclass : #ToDoNoteCompletionStatus,
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNoteInProgressCompletionStatus class >> referenceAToDoNote: aToDoNote [

	^ self new initializeIsStateOf: aToDoNote
]

{ #category : #transitioning }
ToDoNoteInProgressCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	ToDoNoteException signal:
		'A ToDoNote cant modify its completion date if completion status is "In Progress"'
]

{ #category : #transitioning }
ToDoNoteInProgressCompletionStatus >> assignTo: aNameEmployee [

	ToDoNoteException signal: 'A ToDoNote cant be assigned to an employee if the completion status isnt Open. The actual completion status is "In Progress"'
]

{ #category : #'initialization - private' }
ToDoNoteInProgressCompletionStatus >> initializeIsStateOf: aToDoNote [

	toDoNote := aToDoNote
]

{ #category : #testing }
ToDoNoteInProgressCompletionStatus >> isFinished [

	^ false
]

{ #category : #testing }
ToDoNoteInProgressCompletionStatus >> isInProgress [

	^ true
]

{ #category : #testing }
ToDoNoteInProgressCompletionStatus >> isOpen [

	^ false
]
