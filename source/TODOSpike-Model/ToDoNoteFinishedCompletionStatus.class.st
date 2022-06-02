Class {
	#name : #ToDoNoteFinishedCompletionStatus,
	#superclass : #ToDoNoteCompletionStatus,
	#instVars : [
		'toDoNote'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNoteFinishedCompletionStatus class >> isStateOf: aToDoNote [

	^ self new initializeIsStateOf: aToDoNote
]

{ #category : #transitioning }
ToDoNoteFinishedCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	ToDoNoteException signal:
		'A ToDoNote cant modify its completion date if completion status is "Finished"'
]

{ #category : #transitioning }
ToDoNoteFinishedCompletionStatus >> assignTo: aNameEmployee [

	ToDoNoteException signal: 'A ToDoNote cant be assigned to an employee if the completion status isnt Open. The actual completion status is "Finished"'
]

{ #category : #'initialization - private' }
ToDoNoteFinishedCompletionStatus >> initializeIsStateOf: aToDoNote [

	toDoNote := aToDoNote
]

{ #category : #testing }
ToDoNoteFinishedCompletionStatus >> isFinished [

	^ true
]

{ #category : #testing }
ToDoNoteFinishedCompletionStatus >> isInProgress [

	^ false
]

{ #category : #testing }
ToDoNoteFinishedCompletionStatus >> isOpen [

	^ false
]

{ #category : #accessing }
ToDoNoteFinishedCompletionStatus >> statusDescription [

	^ 'Finished'
]
