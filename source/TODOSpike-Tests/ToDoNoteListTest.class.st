Class {
	#name : #ToDoNoteListTest,
	#superclass : #TestCase,
	#instVars : [
		'aToDoNoteList',
		'aToDoNoteListWithASingleToDo',
		'aToDoNoteListWithASingleToDoInProgress',
		'aToDoNoteListWithASingleToDoFinished',
		'toDoNoteBuilder',
		'aToDoNoteInProgress',
		'aToDoNoteWithoutCompletionDateAndOpen',
		'aToDoNoteFinished'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteListTest >> setUp [

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

	toDoNoteBuilder := ToDoNoteBuilder
		                   withNumericalIdentifier:
		                   aToDoNoteList nextNumericalIdentifier
		                   withDescription: 'A good description'.

	"Configuring the basic of ToDoBuilder"
	toDoNoteBuilder
		configuringCategory: 'Reify ToDoNoteList';
		configuringCompletionDate: '25/9/2022';
		configuringAssignedEmployee: 'Agustin'.

	"Building ToDos"
	aToDoNoteInProgress := toDoNoteBuilder build
		                       setCompletionStatusToInProgress.

	aToDoNoteWithoutCompletionDateAndOpen := (toDoNoteBuilder
		                                          
			                                          configuringWithoutCompletionDate;
		                                          build)
		                                         setCompletionStatusToOpen.

	aToDoNoteFinished := toDoNoteBuilder build
		                     setCompletionStatusToFinished.

	"Adding the ToDos to the Lists"
	aToDoNoteListWithASingleToDo addNewToDo:
		aToDoNoteWithoutCompletionDateAndOpen.

	aToDoNoteListWithASingleToDoInProgress addNewToDo:
		aToDoNoteInProgress.

	aToDoNoteListWithASingleToDoFinished addNewToDo: aToDoNoteFinished
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test01AToDoNoteListCanAddANewToDoNoteAndTheNumberOfTodosIsOneInTheToDoNoteList [

	| newToDo |
	
	newToDo := toDoNoteBuilder build.
	aToDoNoteList addNewToDo: newToDo.

	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #creation }
ToDoNoteListTest >> test01AToDoNoteListCanStartWithAListName [

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	self assert: aToDoNoteList listName equals: 'Development ToDos'
]

{ #category : #'completion status' }
ToDoNoteListTest >> test01AToDoNoteStartsWithAnOpenCompletionStatus [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'.

	self
		assert: aToDoNote isOpen
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test02AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	toDoNoteBuilder configuringWithoutCompletionDate.
	aToDoNoteList addNewToDo: toDoNoteBuilder build.
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #creation }
ToDoNoteListTest >> test02AToDoNoteListStartsWithZeroToDoNotes [

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	self assert: aToDoNoteList numberOfToDos equals: 0
]

{ #category : #'completion status' }
ToDoNoteListTest >> test02AToDoNoteWithAnOpenCompletionStatusCanBeSettedToInProgress [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'.

	self assert: aToDoNote isOpen.
	aToDoNote := aToDoNote setCompletionStatusToInProgress.
	self
		assert: aToDoNote isInProgress
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test03AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheToDoNoteList [

	toDoNoteBuilder configuringWithoutCompletionDate.
	toDoNoteBuilder configuringWithoutCategory.
	aToDoNoteList addNewToDo: toDoNoteBuilder build.
	self assert: aToDoNoteList numberOfToDos equals: 1
]

{ #category : #'completion status' }
ToDoNoteListTest >> test03AToDoNoteWithAnInProgressCompletionStatusCanBeSettedToFinished [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'.

	self assert: aToDoNote isOpen.

	aToDoNote := aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote isInProgress.

	aToDoNote := aToDoNote setCompletionStatusToFinished.
	self
		assert: aToDoNote isFinished
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test04AToDoNoteCanBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsOpen [

	aToDoNoteListWithASingleToDo deleteToDoIdentified: 1.
	self assert: aToDoNoteListWithASingleToDo numberOfToDos equals: 0.
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test05AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsInProgress [

	self should: [ aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ] raise: ToDoNoteException .
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1.
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test06AToDoNoteCantBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsFinished [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ]
		raise: ToDoNoteException.
	self
		assert: aToDoNoteListWithASingleToDoInProgress numberOfToDos
		equals: 1
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test07CantBePossibleToDeleteANonExistingToDoFromTheToDoNoteList [

	self
		should: [ 
		aToDoNoteListWithASingleToDoInProgress deleteToDoIdentified: 1 ]
		raise: ToDoNoteException.
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test08CantBePossibleToAddAToDoNoteEnumeratedWithTheSameNumberThatAnotherToDo [

	aToDoNoteList addNewToDo:
		toDoNoteBuilder build.

	self
		should: [ 
			aToDoNoteList addNewToDo:
				(toDoNoteBuilder build) ]
		raise: ToDoNoteException
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test09TheCompletionDateOfTheToDoNoteCanBeUpdatedIfDoesntHaveOne [

	| aToDoNoteSelected |
	aToDoNoteListWithASingleToDo 
		modifyCompletionStatusToOpenTheToDoIdentified: 1.

	aToDoNoteSelected := aToDoNoteListWithASingleToDo 
		                     selectTheToDoIdentified: 1.

	"self deny: aToDoNoteSelected hasCompletionDate."
	aToDoNoteSelected completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: 'Unassigned Completion Date') ].

	aToDoNoteListWithASingleToDo
		modifyTheToDoIdentified: 1
		withTheNewCompletionDate: '01/02/2023'.

	aToDoNoteSelected completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: '01/02/2023') ]
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test10AToDoNoteCompletionDateCantBeModifyIfCompletionStatusIsInProgressOrFinished [

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

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test11AToDoNoteCanBeAssignedIfOnlyItIsInOpenCompletionStatus [

	aToDoNoteListWithASingleToDo
		assignEmployee: 'Agustin'
		toTheToDoIdentified: 1.
(aToDoNoteListWithASingleToDo selectTheToDoIdentified: 1)
				designatedEmployee
		withContentDo: [:deisgnatedEmployee | self assert: deisgnatedEmployee equals: 'Agustin']
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test12AToDoNoteAssignedWhenTheCompletionStatusIsNotOpenRaiseAnError [

	self
		should:
			[aToDoNoteListWithASingleToDoInProgress
		assignEmployee: 'Agustin'
		toTheToDoIdentified: 1]
		raise: ToDoNoteException.
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test13AToDoNoteCompletionStatusCanBeSettedToOpenCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToOpenTheToDoIdentified: 1.

	self assert:
		(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1)
			isOpen
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test14AToDoNoteCompletionStatusCanBeSettedToInProgressCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToInProgressTheToDoIdentified: 1.

	self
		assert:
			(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1) isInProgress
]

{ #category : #'CRUD - operations' }
ToDoNoteListTest >> test15AToDoNoteCompletionStatusCanBeSettedToFinishedCompletionStatus [

	aToDoNoteListWithASingleToDoInProgress 
		modifyCompletionStatusToFinishedTheToDoIdentified: 1.

	self assert:
		(aToDoNoteListWithASingleToDoInProgress selectTheToDoIdentified: 1)
			isFinished
]
