Class {
	#name : #OpenCompletionStatus,
	#superclass : #CompletionStatus,
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
OpenCompletionStatus class >> references: aRepository [

	^ self new initializeIsStateOf: aRepository
]

{ #category : #transitioning }
OpenCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	toDo throughStateAssignNewCompletionDate: aCompletionDate
]

{ #category : #transitioning }
OpenCompletionStatus >> assignTo: aNameEmployee [

	toDo throughStateAssignTo: aNameEmployee
]

{ #category : #'initialization - private' }
OpenCompletionStatus >> initializeIsStateOf: aToDo [

	toDo := aToDo
]

{ #category : #testing }
OpenCompletionStatus >> isOpen [

	^ true
]
