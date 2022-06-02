Class {
	#name : #ToDoNoteCompletionStatus,
	#superclass : #Object,
	#category : #'TODOSpike-Model'
}

{ #category : #testing }
ToDoNoteCompletionStatus class >> isAbstract [
		
	^ self == ToDoNoteCompletionStatus
]

{ #category : #'instance creation' }
ToDoNoteCompletionStatus class >> isStateOf: aTodoNote [

	self subclassResponsibility
]

{ #category : #transitioning }
ToDoNoteCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	self subclassResponsibility
]

{ #category : #transitioning }
ToDoNoteCompletionStatus >> assignTo: aNameEmployee [

	self subclassResponsibility
]

{ #category : #'initialization - private' }
ToDoNoteCompletionStatus >> initializeIsStateOf: aToDoNote [

	self subclassResponsibility
]

{ #category : #testing }
ToDoNoteCompletionStatus >> isFinished [

	self subclassResponsibility
]

{ #category : #testing }
ToDoNoteCompletionStatus >> isInProgress [

	self subclassResponsibility
]

{ #category : #testing }
ToDoNoteCompletionStatus >> isOpen [

	self subclassResponsibility
]

{ #category : #accessing }
ToDoNoteCompletionStatus >> statusDescription [

	self subclassResponsibility
]
