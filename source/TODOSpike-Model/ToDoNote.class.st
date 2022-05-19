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
ToDoNote class >> enumerated: aToDoNumber with: aDescription [

	AssertionChecker
		enforce: (aDescription isNil) not
		because: 'No puede pasarse por argumento un objeto nulo como descripcion'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription isString)
		because: 'No puede pasarse por argumento un objeto que no sea un string'
		raising: ToDoNoteFailure.	
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'No puede haber una nota ToDo sin descripcion'
		raising: ToDoNoteFailure.
		
	^ self new
		  initializeEnumerated: aToDoNumber with: aDescription
		  categorized: ''
		  and: ''
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber with: aDescription and: aCompletionDate [

	AssertionChecker
		enforce: aDescription isNil not
		because:
		'No puede pasarse por argumento un objeto nulo como descripcion'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: aDescription isString
		because:
		'No puede pasarse por argumento un objeto que no sea un string'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'No puede haber una nota ToDo sin descripcion'
		raising: ToDoNoteFailure.

	^ self new
		  initializeEnumerated: aToDoNumber with: aDescription
		  categorized: ''
		  and: aCompletionDate
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber with: aDescription categorized: aCategory [
	
	AssertionChecker
		enforce: (aDescription isNil) not
		because: 'No puede pasarse por argumento un objeto nulo como descripcion'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription isString)
		because: 'No puede pasarse por argumento un objeto que no sea un string'
		raising: ToDoNoteFailure.	
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'No puede haber una nota ToDo sin descripcion'
		raising: ToDoNoteFailure.
	
	^ self new
		  initializeEnumerated: aToDoNumber with: aDescription
		  categorized: aCategory
		  and: ''
]

{ #category : #'instance creation' }
ToDoNote class >> enumerated: aToDoNumber with: aDescription categorized: aCategory and: aCompletionDate [

	AssertionChecker
		enforce: aDescription isNil not
		because:
		'No puede pasarse por argumento un objeto nulo como descripcion'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: aDescription isString
		because:
		'No puede pasarse por argumento un objeto que no sea un string'
		raising: ToDoNoteFailure.
	AssertionChecker
		enforce: (aDescription sameAs: '') not
		because: 'No puede haber una nota ToDo sin descripcion'
		raising: ToDoNoteFailure.

	^ self new
		  initializeEnumerated: aToDoNumber with: aDescription
		  categorized: aCategory
		  and: aCompletionDate
]

{ #category : #settings }
ToDoNote >> assignCompletionDate: aCompletionDate [
	
	(aCompletionDate allSatisfy: [ :character | character sameAs: '' ]) ifTrue: [ ToDoNoteFailure signal: 'The completion date cant be deleted' ] .
	completionDate := aCompletionDate
]

{ #category : #settings }
ToDoNote >> assignedTo: anEmployeeName [

	AssertionChecker
		enforce: (completionStatus sameAs: 'Abierto')
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
ToDoNote >> initializeEnumerated: aToDoNumber with: aDescription categorized: aCategory and: aCompletionDate [
	
	description := aDescription.
	category := aCategory.
	completionDate := aCompletionDate.
	completionStatus := 'Abierto'.
	toDoNumber := aToDoNumber
]

{ #category : #settings }
ToDoNote >> setCompletionStatusToFinished [
	
	completionStatus := 'Terminada'
]

{ #category : #settings }
ToDoNote >> setCompletionStatusToInProgress [

	completionStatus := 'En progreso'
]
