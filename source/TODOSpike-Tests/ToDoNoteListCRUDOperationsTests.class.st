Class {
	#name : #ToDoNoteListCRUDOperationsTests,
	#superclass : #TestCase,
	#instVars : [
		'aToDoNoteList',
		'aToDoNoteListWithASingleToDo',
		'aToDoNoteListWithASingleToDoInProgress',
		'aToDoNoteInProgress',
		'aToDoNoteListWithASingleToDoFinished',
		'aToDoNoteFinished',
		'toDoNoteBuilder',
		'aToDoNoteWithoutCompletionDateAndOpen'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteListCRUDOperationsTests >> setUp [

	super setUp.

	"Creation of lists"

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	
	aToDoNoteListWithASingleToDo := ToDoNoteList named:
		                                'Development ToDos'.
	aToDoNoteListWithASingleToDoInProgress := ToDoNoteList named:
		                                          'Development ToDos'.
	aToDoNoteListWithASingleToDoFinished := ToDoNoteList named:
		                                        'Development ToDos'.
	"Creation of ToDoBuilder"
		
	toDoNoteBuilder := ToDoNoteBuilder withNumericalIdentifier:
		                   aToDoNoteList nextNumericalIdentifier.

	"Configuring the basic of ToDoBuilder"
	toDoNoteBuilder
		configuringDescription: 'A good description';
		configuringCategory: 'Reify ToDoNoteList';
		configuringCompletionDate: '25/9/2022';
		configuringAssignedEmployee: 'Agustin'.
	
	"Building ToDos"
	aToDoNoteInProgress := toDoNoteBuilder build
		                       setCompletionStatusToInProgress.

	aToDoNoteWithoutCompletionDateAndOpen := (toDoNoteBuilder configuringWithoutCompletionDate; build) setCompletionStatusToOpen.
	
	aToDoNoteFinished := toDoNoteBuilder build
		                     setCompletionStatusToFinished.
	
	"Adding the ToDos to the Lists"	
	aToDoNoteListWithASingleToDo addNewToDo:
		aToDoNoteWithoutCompletionDateAndOpen.
		
	aToDoNoteListWithASingleToDoInProgress addNewToDo:
		aToDoNoteInProgress.

	aToDoNoteListWithASingleToDoFinished addNewToDo: aToDoNoteFinished
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test01AToDoNoteListCanAddANewToDoNoteAndTheNumberOfTodosIsOneInTheToDoNoteList [

	| newToDo |
	
	newToDo := toDoNoteBuilder build.
	aToDoNoteList addNewToDo: newToDo.

	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test02AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	toDoNoteBuilder configuringWithoutCompletionDate.
	aToDoNoteList addNewToDo: toDoNoteBuilder build.
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test03AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheToDoNoteList [

	toDoNoteBuilder configuringWithoutCompletionDate.
	toDoNoteBuilder configuringWithoutCategory.
	aToDoNoteList addNewToDo: toDoNoteBuilder build.
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test04AToDoNoteCanBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsOpen [

	aToDoNoteListWithASingleToDo deleteToDoIdentified: 1.
	self assert: aToDoNoteListWithASingleToDo numberOfToDos equals: 0.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test05AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsInProgress [

	self should: [ aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ] raise: ToDoNoteException .
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test06AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsFinished [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ]
		raise: ToDoNoteException.
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test07CantBePossibleToDeleteANonExistingToDoFromTheToDoNoteList [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ]
		raise: ToDoNoteException.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test08CantBePossibleToAddAToDoNoteEnumeratedWithTheSameNumberThatAnotherToDo [

	aToDoNoteList addNewToDo:
		toDoNoteBuilder build.

	self
		should: [ 
			aToDoNoteList addNewToDo:
				(toDoNoteBuilder build) ]
		raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test09ToDoNoteCompletionDateCanBeUpdatedIfItHasNotCompletionDate [

	| aToDoNoteSelected |
	aToDoNoteListWithASingleToDo modifyCompletionStatusToOpenTheToDoIdentified: 1.
	aToDoNoteSelected := aToDoNoteListWithASingleToDo 
		                     selectTheToDoIdentified: 1.
	self assert: (aToDoNoteSelected completionDate sameAs:
			 'Unassigned Completion Date').
	aToDoNoteListWithASingleToDo
		modifyTheToDoIdentified: 1
		withTheNewCompletionDate: '01/02/2023'.
	self assert: ((aToDoNoteListWithASingleToDo 
		                     selectTheToDoIdentified: 1) completionDate sameAs: '01/02/2023')
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test10AToDoNoteCompletionDateCantBeModifyIfCompletionStatusIsInProgressOrFinished [

	self
		should: [ 
			(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1) 
				assignCompletionDate: '31/12/2022' ]
		raise: ToDoNoteException.

	self
		should: [ 
			(aToDoNoteListWithASingleToDoFinished selectTheToDoIdentified: 1) 
				assignCompletionDate: '31/12/2022' ]
		raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test11AToDoNoteCanBeAssignedIfOnlyItIsInOpenCompletionStatus [

	aToDoNoteListWithASingleToDo assignEmployee: 'Agustin' toTheToDoIdentified: 1.
	self
		assert:
		(aToDoNoteListWithASingleToDo selectTheToDoIdentified: 1) designatedEmployee
		equals: 'Agustin'
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test12AToDoNoteAssignedWhenTheCompletionStatusIsNotOpenRaiseAnError [

	self
		should:
			[aToDoNoteListWithASingleToDoInProgress
		assignEmployee: 'Agustin'
		toTheToDoIdentified: 1]
		raise: ToDoNoteException.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test13AToDoNoteCompletionStatusCanBeSettedToOpenCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToOpenTheToDoIdentified: 1.

	self assert:
		(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1)
			isOpen
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test14AToDoNoteCompletionStatusCanBeSettedToInProgressCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToInProgressTheToDoIdentified: 1.

	self
		assert:
			(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1) isInProgress
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test15AToDoNoteCompletionStatusCanBeSettedToFinishedCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToFinishedTheToDoIdentified: 1.

	self assert:
		(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1)
			isFinished
]
