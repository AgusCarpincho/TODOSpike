Class {
	#name : #ToDoNoteListCRUDOperationsTests,
	#superclass : #TestCase,
	#instVars : [
		'aToDoNoteList',
		'aToDoNoteListWithASingleToDo',
		'aToDoNoteListWithASingleToDoInProgress',
		'aToDoNoteInProgress',
		'aToDoNoteListWithASingleToDoFinished',
		'aToDoNoteFinished'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteListCRUDOperationsTests >> setUp [

	super setUp.
	aToDoNoteInProgress := ToDoNote
		                       enumerated: 1
		                       with: 'A good description'.
	aToDoNoteInProgress setCompletionStatusToInProgress.

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.

	aToDoNoteListWithASingleToDo := ToDoNoteList named:
		                                'Development ToDos'.
	aToDoNoteListWithASingleToDo add:
		(ToDoNote enumerated: 1 with: 'A good description').

	aToDoNoteListWithASingleToDoInProgress := ToDoNoteList named:
		                                          'Development ToDos'.
	aToDoNoteListWithASingleToDoInProgress add: aToDoNoteInProgress.
	
	aToDoNoteListWithASingleToDoFinished := ToDoNoteList named: 'Development ToDos'.
	aToDoNoteFinished := ToDoNote enumerated: 1 with: 'A good description' .
	aToDoNoteFinished setCompletionStatusToFinished.
	aToDoNoteListWithASingleToDoFinished add: aToDoNoteFinished.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test01AToDoNoteListCanAddANewToDoNoteAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description' categorized: 'Reify ToDoNoteList' and: '25/9/2022').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test02AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description' categorized: 'Reify ToDoNoteList').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test03AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test04AToDoNoteCanBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsOpen [

	aToDoNoteListWithASingleToDo deleteToDoWithNumber: 1.
	self assert: aToDoNoteListWithASingleToDo numberOfToDos equals: 0.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test05AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsInProgress [

	self should: [ aToDoNoteListWithASingleToDoInProgress deleteToDoWithNumber: 1 ] raise: ToDoNoteFailure .
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test06AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsFinished [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoWithNumber: 1 ]
		raise: ToDoNoteFailure.
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test07CantBePossibleToDeleteANonExistingToDoFromTheToDoNoteList [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoWithNumber: 1 ]
		raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test08CantBePossibleToAddAToDoNoteEnumeratedWithTheSameNumberThatAnotherToDo [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description').
	
	self should: [aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description')] raise: ToDoNoteFailure .
]
