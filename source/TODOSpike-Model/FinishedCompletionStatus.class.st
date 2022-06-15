Class {
	#name : #FinishedCompletionStatus,
	#superclass : #CompletionStatus,
	#instVars : [
		'toDo'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
FinishedCompletionStatus class >> references: aRepository [

	^ self new initializeIsStateOf: aRepository
]

{ #category : #transitioning }
FinishedCompletionStatus >> assignNewCompletionDate: aCompletionDate [

	ToDoStateCondition signal:
		'A ToDo cant modify its completion date if completion status is "Finished"'
]

{ #category : #transitioning }
FinishedCompletionStatus >> assignTo: aNameEmployee [

	ToDoStateCondition signal:
		'A ToDo cant be assigned to an employee if the completion status isnt Open. The actual completion status is "Finished"'
]

{ #category : #'initialization - private' }
FinishedCompletionStatus >> initializeIsStateOf: aToDo [

	toDo := aToDo
]

{ #category : #testing }
FinishedCompletionStatus >> isFinished [ 
	^ true
]
