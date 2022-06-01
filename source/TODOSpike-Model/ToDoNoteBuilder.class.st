Class {
	#name : #ToDoNoteBuilder,
	#superclass : #Object,
	#instVars : [
		'toDoNote',
		'category',
		'description',
		'assignedEmployee',
		'completionDate',
		'identifier'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'initialization - private' }
ToDoNoteBuilder class >> withNumericalIdentifier: aNumericalIdentifier [

	^ self new initializeWithNumericalIdentifier: aNumericalIdentifier
]

{ #category : #building }
ToDoNoteBuilder >> build [

	| newToDo |
	AssertionChecker
		enforce: self hasADescription
		because: 'A ToDoNote must have a description'
		raising: ToDoNoteException.
	AssertionChecker
		enforce: self hasAnIdentifier
		because: 'A ToDoNote must have a valid identifier'
		raising: ToDoNoteException.
	newToDo := ToDoNote
		           identifiedBy: identifier
		           described: description
		           categorized: category
		           endingOn: completionDate
		           assignedTo: assignedEmployee
		           withStatus: 'Open'.
	newToDo assignedTo: assignedEmployee.
	^ newToDo
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringAssignedEmployee: anAssignedEmployee [

	assignedEmployee := anAssignedEmployee
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringCategory: aCategory [

	category := aCategory
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringCompletionDate: aCompletionDate [

	completionDate := aCompletionDate
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringDescription: aDescription [

	description := aDescription
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringWithoutCategory [
	
	category := ''
]

{ #category : #configuring }
ToDoNoteBuilder >> configuringWithoutCompletionDate [

	completionDate := 'Unassigned Completion Date'
]

{ #category : #testing }
ToDoNoteBuilder >> hasADescription [

	^ (description sameAs: 'Unassigned Description') not
]

{ #category : #testing }
ToDoNoteBuilder >> hasAnIdentifier [

	^ (identifier isNil) not
]

{ #category : #'initialization - private' }
ToDoNoteBuilder >> initializeWithNumericalIdentifier: aNumericalIdentifier [

	category := 'Unassigned Category'.
	description := 'Unassigned Description'.
	assignedEmployee := 'Unassigned Employee'.
	completionDate := 'Unassigned Completion Date'.
	identifier := aNumericalIdentifier
]
