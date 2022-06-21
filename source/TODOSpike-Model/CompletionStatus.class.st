Class {
	#name : #CompletionStatus,
	#superclass : #Object,
	#category : #'TODOSpike-Model'
}

{ #category : #testing }
CompletionStatus class >> isAbstract [
		
	^ self == CompletionStatus
]

{ #category : #'instance creation' }
CompletionStatus class >> references: aRepository [

	self subclassResponsibility
]

{ #category : #transitioning }
CompletionStatus >> assignNewCompletionDate: aCompletionDate [

	self subclassResponsibility
]

{ #category : #transitioning }
CompletionStatus >> assignTo: aNameEmployee [

	self subclassResponsibility
]

{ #category : #'initialization - private' }
CompletionStatus >> initializeIsStateOf: aRepository [

	self subclassResponsibility
]

{ #category : #asserter }
CompletionStatus >> isFinished [

	^ false
]

{ #category : #asserter }
CompletionStatus >> isInProgress [

	^ false
]

{ #category : #asserter }
CompletionStatus >> isOpen [

	^ false
]
