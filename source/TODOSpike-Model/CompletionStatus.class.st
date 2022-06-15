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

{ #category : #adding }
CompletionStatus >> isFinished [

	^ false
]

{ #category : #adding }
CompletionStatus >> isInProgress [

	^ false
]

{ #category : #adding }
CompletionStatus >> isOpen [

	^ false
]
