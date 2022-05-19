Class {
	#name : #ToDoNote,
	#superclass : #Object,
	#instVars : [
		'description',
		'category',
		'finishDate',
		'completionStatus',
		'employeeName'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNote class >> with: aDescription [

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
		  initializeWith: aDescription
		  categorized: ''
		  andFinishIn: ''
]

{ #category : #'instance creation' }
ToDoNote class >> with: aDescription categorized: aCategory [
	
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
		  initializeWith: aDescription
		  categorized: aCategory
		  andFinishIn: ''
]

{ #category : #'instance creation' }
ToDoNote class >> with: aDescription categorized: aCategory endingDate: anEndDate [

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
		  initializeWith: aDescription
		  categorized: aCategory
		  andFinishIn: anEndDate
]

{ #category : #'instance creation' }
ToDoNote class >> with: aDescription endingDate: anEndDate [

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
		  initializeWith: aDescription
		  categorized: ''
		  andFinishIn: anEndDate
]

{ #category : #settings }
ToDoNote >> assignedTo: anEmployeeName [
	AssertionChecker enforce: (completionStatus sameAs: 'Abierto') because: 'No puede asignarse este ToDo a un nuevo empleado cuando el ToDo esta en progreso' raising: ToDoNoteFailure .
	employeeName := anEmployeeName
]

{ #category : #accessing }
ToDoNote >> category [
	^ category
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

{ #category : #accessing }
ToDoNote >> finishDate [
	^ finishDate
]

{ #category : #'initialization - private' }
ToDoNote >> initializeWith: aDescription categorized: aCategory andFinishIn: aFinishDate [

	description := aDescription .
	category := aCategory .
	finishDate := aFinishDate .
	completionStatus := 'Abierto'
]

{ #category : #setting }
ToDoNote >> setCompletionStatusToFinished [
	
	completionStatus := 'Terminada'
]

{ #category : #accessing }
ToDoNote >> setCompletionStatusToInProgress [

	completionStatus := 'En progreso'
]
