Class {
	#name : #InProgressCompletionStatus,
	#superclass : #CompletionStatus,
	#instVars : [
		'toDo'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
InProgressCompletionStatus class >> references: aRepository [

	^ self new initializeIsStateOf: aRepository
]

{ #category : #transitioning }
InProgressCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	ToDoStateCondition signal:
		'A ToDo cant modify its completion date if completion status is "In Progress"'
]

{ #category : #transitioning }
InProgressCompletionStatus >> assignTo: aNameEmployee [

	ToDoStateCondition signal:
		'A ToDo cant be assigned to an employee if the completion status isnt Open. The actual completion status is "In Progress"'
]

{ #category : #'initialization - private' }
InProgressCompletionStatus >> initializeIsStateOf: aToDo [

	toDo := aToDo
]

{ #category : #testing }
InProgressCompletionStatus >> isInProgress [

	^ true
]
