"
ToDoNote reify the concept of PostIt notes or something similar with the meaning to serve the user with the cotidiane labors
"
Class {
	#name : #ToDoNote,
	#superclass : #Object,
	#instVars : [
		'description',
		'category',
		'completionStatus',
		'employeeName',
		'completionDate',
		'toDoNumber'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber described: aDescription [

	AssertionChecker
		enforce: (aDescription isNil or: aToDoNumber isNil) not
		because: 'Cannot be passed a nil object by argument'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription isString)
		because: 'Cannot be passed a non string object by argument'
		raising: ToDoNoteFailure.	
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'The description cannot be a empty string'
		raising: ToDoNoteFailure.
		
	^ self new
		  initializeEnumerated: aToDoNumber described: aDescription
		  categorized: ''
		  endingOn: 'No completion date assigned yet'
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber described: aDescription categorized: aCategory [
	
	AssertionChecker
		enforce: (aDescription isNil or: aToDoNumber isNil) not
		because: 'Cannot be passed a nil object by argument'
		raising: ToDoNoteFailure.
		
	AssertionChecker
		enforce: (aDescription isString and: aCategory isString)
		because: 'Cannot be passed a non string object by argument'
		raising: ToDoNoteFailure.	
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'The description cannot be a empty string'
		raising: ToDoNoteFailure.
	
	^ self new
		  initializeEnumerated: aToDoNumber described: aDescription
		  categorized: aCategory
		  endingOn: 'No completion date assigned yet'
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber described: aDescription categorized: aCategory endingOn: aCompletionDate [

	AssertionChecker
		enforce: (aDescription isNil or: aToDoNumber isNil) not
		because: 'Cannot be passed a nil object by argument'
		raising: ToDoNoteFailure.

	AssertionChecker
		enforce: aDescription isString
		because:
		'Cannot be passed a non string object by argument'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'The description cannot be a empty string'
		raising: ToDoNoteFailure.

	^ self new
		  initializeEnumerated: aToDoNumber described: aDescription
		  categorized: aCategory
		  endingOn: aCompletionDate
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber described: aDescription endingOn: aCompletionDate [

	AssertionChecker
		enforce: (aDescription isNil or: aToDoNumber isNil) not
		because: 'Cannot be passed a nil object by argument'
		raising: ToDoNoteFailure.

	AssertionChecker
		enforce: aDescription isString
		because:
		'Cannot be passed a non string object by argument'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'The description cannot be a empty string'
		raising: ToDoNoteFailure.

	^ self new
		  initializeEnumerated: aToDoNumber described: aDescription
		  categorized: ''
		  endingOn: aCompletionDate
]

{ #category : #settings }
ToDoNote >> assignCompletionDate: aCompletionDate [
	
	(aCompletionDate allSatisfy: [ :character | character sameAs: '' ]) ifTrue: [ ToDoNoteFailure signal: 'The completion date cant be deleted' ] .
	completionDate := aCompletionDate
]

{ #category : #settings }
ToDoNote >> assignedTo: anEmployeeName [

	AssertionChecker
		enforce: (completionStatus sameAs: 'Open')
		because:
		'A ToDo cant be assigned to a new employee when the ToDo is in progress'
		raising: ToDoNoteFailure.
	employeeName := anEmployeeName
]

{ #category : #accessing }
ToDoNote >> category [
	^ category
]

{ #category : #accessing }
ToDoNote >> completionDate [

	^ completionDate
]

{ #category : #accessing }
ToDoNote >> completionStatus [
	
	^ completionStatus
]

{ #category : #accessing }
ToDoNote >> description [
	^ description
]

{ #category : #accessing }
ToDoNote >> designatedEmployee [
	
	^ employeeName
]

{ #category : #'initialization - private' }
ToDoNote >> initializeEnumerated: aToDoNumber described: aDescription categorized: aCategory endingOn: aCompletionDate [
	
	description := aDescription.
	category := aCategory.
	completionDate := aCompletionDate.
	completionStatus := 'Open'.
	toDoNumber := aToDoNumber.
	employeeName := 'Unassigned employee'
]

{ #category : #settings }
ToDoNote >> setCompletionDateTo: aCompletionDate [ 
	
	(completionStatus sameAs: 'Open') ifTrue: [completionDate := aCompletionDate] ifFalse: [ToDoNoteFailure signal: 'The completion date of the ToDo cant be modified if the completion status is not open']
]

{ #category : #settings }
ToDoNote >> setCompletionStatusToFinished [
	
	completionStatus := 'Finished'
]

{ #category : #settings }
ToDoNote >> setCompletionStatusToInProgress [

	completionStatus := 'In progress'
]

{ #category : #settings }
ToDoNote >> setCompletionStatusToOpen [
	
	completionStatus := 'Open'
]

{ #category : #accessing }
ToDoNote >> toDoNumber [

	^ toDoNumber
]
