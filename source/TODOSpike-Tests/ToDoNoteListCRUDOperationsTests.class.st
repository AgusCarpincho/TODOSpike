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
		                       described: 'A good description'
		                       categorized: 'Fixes'.
	aToDoNoteInProgress setCompletionStatusToInProgress.

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.

	aToDoNoteListWithASingleToDo := ToDoNoteList named:
		                                'Development ToDos'.
	aToDoNoteListWithASingleToDo addNewToDo:
		(ToDoNote enumerated: 1 described: 'A good description').

	aToDoNoteListWithASingleToDoInProgress := ToDoNoteList named:
		                                          'Development ToDos'.
	aToDoNoteListWithASingleToDoInProgress addNewToDo:
		aToDoNoteInProgress.

	aToDoNoteListWithASingleToDoFinished := ToDoNoteList named:
		                                        'Development ToDos'.
	aToDoNoteFinished := ToDoNote
		                     enumerated: 1
		                     described: 'A good description'
		                     categorized: 'Fixes'.
	aToDoNoteFinished setCompletionStatusToFinished.
	aToDoNoteListWithASingleToDoFinished addNewToDo: aToDoNoteFinished
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test01AToDoNoteListCanAddANewToDoNoteAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList addNewToDo: (ToDoNote
			 enumerated: 1
			 described: 'A good description'
			 categorized: 'Reify ToDoNoteList'
			 endingOn: '25/9/2022').
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test02AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList addNewToDo: (ToDoNote
			 enumerated: 1
			 described: 'A good description'
			 categorized: 'Reify ToDoNoteList').
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test03AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList addNewToDo:
		(ToDoNote enumerated: 1 described: 'A good description').
	self assert: aToDoNoteList numberOfToDos equals: 1
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

	aToDoNoteList addNewToDo:
		(ToDoNote enumerated: 1 described: 'A good description').

	self
		should: [ 
			aToDoNoteList addNewToDo:
				(ToDoNote enumerated: 1 described: 'A good description') ]
		raise: ToDoNoteFailure
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test09ToDoNoteCompletionDateCanBeUpdatedIfItHasNotCompletionDate [

	| aToDoNoteSelected |
	aToDoNoteListWithASingleToDo modifyCompletionStatusToOpenTheToDoWithNumber: 1.
	aToDoNoteSelected := aToDoNoteListWithASingleToDo 
		                     selectTheToDoWithNumber: 1.
	self assert: (aToDoNoteSelected completionDate sameAs:
			 'No completion date assigned yet').
	aToDoNoteListWithASingleToDo
		modifyTheToDoNumber: 1
		withTheNewCompletionDate: '01/02/2023'.
	self assert: (aToDoNoteSelected completionDate sameAs: '01/02/2023')
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test10AToDoNoteCompletionDateCantBeModifyIfCompletionStatusIsInProgressOrFinished [

	aToDoNoteListWithASingleToDo 
		modifyCompletionStatusToInProgressTheToDoWithNumber: 1.

	self
		should:
			[(aToDoNoteListWithASingleToDoInProgress selectTheToDoWithNumber: 1)
				setCompletionDateTo: '31/12/2022']
		raise: ToDoNoteFailure.

	aToDoNoteListWithASingleToDoFinished 
		modifyCompletionStatusToFinishedTheToDoWithNumber: 1.

	self
		should:
			[(aToDoNoteListWithASingleToDoFinished selectTheToDoWithNumber: 1)
				setCompletionDateTo: '31/12/2022']
		raise: ToDoNoteFailure
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test11AToDoNoteCanBeAssignedIfOnlyItIsInOpenCompletionStatus [

	aToDoNoteListWithASingleToDo assignEmployee: 'Agustin' toTheToDoWithNumber: 1.
	self
		assert:
		(aToDoNoteListWithASingleToDo selectTheToDoWithNumber: 1) designatedEmployee
		equals: 'Agustin'
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test12AToDoNoteAssignedWhenTheCompletionStatusIsNotOpenRaiseAnError [

	self
		should:
			[aToDoNoteListWithASingleToDoInProgress
		assignEmployee: 'Agustin'
		toTheToDoWithNumber: 1]
		raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test13AToDoNoteCompletionStatusCanBeSettedToOpenCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToOpenTheToDoWithNumber: 1.
		
	self assert: ((aToDoNoteListWithASingleToDoInProgress selectTheToDoWithNumber: 1) completionStatus) equals: 'Open'
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test14AToDoNoteCompletionStatusCanBeSettedToInProgressCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToInProgressTheToDoWithNumber: 1.
		
	self
		assert:
			(aToDoNoteListWithASingleToDoInProgress selectTheToDoWithNumber: 1)
				completionStatus
		equals: 'In progress'
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test15AToDoNoteCompletionStatusCanBeSettedToFinishedCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToFinishedTheToDoWithNumber: 1.

	self
		assert:
			(aToDoNoteListWithASingleToDoInProgress selectTheToDoWithNumber: 1)
				completionStatus
		equals: 'Finished'
]
