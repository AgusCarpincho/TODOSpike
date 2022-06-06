Class {
	#name : #ToDoNoteBuilder,
	#superclass : #Object,
	#instVars : [
		'category',
		'description',
		'assignedEmployee',
		'completionDate',
		'identifier'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNoteBuilder class >> withNumericalIdentifier: aNumericalIdentifier [

	AssertionChecker
		enforce: aNumericalIdentifier isNumber
		because: 'An identifier must be numerical'
		raising: ToDoNoteException.
	^ self new
		  initializeWithNumericalIdentifier: aNumericalIdentifier
		  withDescription: 'A good description'
]

{ #category : #building }
ToDoNoteBuilder >> build [

	^ ToDoNote
		  identifiedBy: identifier
		  described: description
		  categorized: category
		  endingOn: completionDate
		  assignedTo: assignedEmployee
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringAssignedEmployee: anAssignedEmployee [

	assignedEmployee := Optional containing: anAssignedEmployee
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringCategory: aCategory [

	category := Optional containing: aCategory
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringCompletionDate: aCompletionDate [

	completionDate := Optional containing: aCompletionDate
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringWithoutCategory [
	
	category := Optional unusedBecause: 'Unassigned Category' 
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringWithoutCompletionDate [

	completionDate := Optional unusedBecause: 'Unassigned Completion Date'
]

{ #category : #testing }
ToDoNoteBuilder >> hasADescription [

	((description) withContentDo: [ :descriptionContent | ^ (descriptionContent sameAs: 'Unassigned Description') not ])
]

{ #category : #'initialization - private' }
ToDoNoteBuilder >> initializeWithNumericalIdentifier: aNumericalIdentifier withDescription: aDescription [

	category := Optional unusedBecause: 'Unassigned Category'.
	description := aDescription.
	assignedEmployee := Optional unusedBecause: 'Unassigned Employee'.
	completionDate := Optional unusedBecause:
		                  'Unassigned Completion Date'.
	identifier := aNumericalIdentifier
]
