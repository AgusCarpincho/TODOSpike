Class {
	#name : #RepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		'toDoBuilder',
		'aToDoInProgress',
		'aToDoWithoutCompletionDateAndOpen',
		'aToDoFinished',
		'aRepositoryOfToDosEmpty',
		'aRepositoryOfToDosWithAToDoOpen',
		'aRepositoryOfToDosWithAToDoInProgress',
		'aRepositoryOfToDosWithAToDoFinished'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
RepositoryTest >> setUp [

	super setUp.

	"Creation of repositories"

	aRepositoryOfToDosEmpty := Repository new.
	aRepositoryOfToDosWithAToDoOpen := Repository new.
	aRepositoryOfToDosWithAToDoInProgress := Repository new.
	aRepositoryOfToDosWithAToDoFinished := Repository new.


	"Creation of ToDoBuilder"

	toDoBuilder := ToDoBuilder
		               withNumericalIdentifier: 1
		               withDescription: 'A good description'.

	"Configuring the basic of ToDoBuilder"

	toDoBuilder
		configuringCategory: 'Reify ToDoNoteList';
		configuringCompletionDate: '25/9/2022'.

	"Building ToDos"

	aToDoInProgress := toDoBuilder build setCompletionStatusToInProgress.

	aToDoWithoutCompletionDateAndOpen := (toDoBuilder
		                                      
			                                      configuringWithoutCompletionDate;
		                                      build)
		                                     setCompletionStatusToOpen.

	aToDoFinished := toDoBuilder build setCompletionStatusToFinished.

	"Adding toDos"
	aRepositoryOfToDosWithAToDoOpen addNewToDo:
		aToDoWithoutCompletionDateAndOpen.

	aRepositoryOfToDosWithAToDoInProgress addNewToDo: aToDoInProgress.
	aRepositoryOfToDosWithAToDoFinished addNewToDo: aToDoFinished
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test01AToDoIsAddedToANewRepositoryAndTheNumberOfToDosInTheRepositoryIsOne [

	| newToDo aNewRepository |
	
	newToDo := toDoBuilder build.
	aNewRepository := Repository new.
	aNewRepository addNewToDo: newToDo.

	self assert: aNewRepository numberOfToDos equals: 1
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test02ARepositoryCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	toDoBuilder configuringWithoutCompletionDate.
	aRepositoryOfToDosEmpty addNewToDo: toDoBuilder build.
	self assert: aRepositoryOfToDosEmpty numberOfToDos equals: 1
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test03ARepositoryCanAddANewToDoWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheRepository [

	toDoBuilder configuringWithoutCompletionDate.
	toDoBuilder configuringWithoutCategory.
	aRepositoryOfToDosEmpty addNewToDo: toDoBuilder build.
	self assert: aRepositoryOfToDosEmpty numberOfToDos equals: 1
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test04AToDoCanBeDeletedFromTheRepositoryIfItsCompletionStatusIsOpen [

	self assert: aRepositoryOfToDosWithAToDoOpen numberOfToDos equals: 1.
	aRepositoryOfToDosWithAToDoOpen deleteToDoIdentified: 1.
	self assert: aRepositoryOfToDosWithAToDoOpen numberOfToDos equals: 0
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test05AToDoCantBeDeletedFromTheRepositoryIfItsCompletionStatusIsInProgress [

	self
		assert: aRepositoryOfToDosWithAToDoInProgress numberOfToDos
		equals: 1.
	aRepositoryOfToDosWithAToDoInProgress deleteToDoIdentified: 1.
	self
		assert: aRepositoryOfToDosWithAToDoInProgress numberOfToDos
		equals: 1
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test06AToDoCantBeDeletedFromTheRepositoryIfItsCompletionStatusIsFinished [

	self
		assert: aRepositoryOfToDosWithAToDoFinished numberOfToDos
		equals: 1.
		aRepositoryOfToDosWithAToDoFinished deleteToDoIdentified: 1.
		self assert: aRepositoryOfToDosWithAToDoFinished numberOfToDos equals: 1
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test07CantBePossibleToDeleteANonExistingOpenToDoFromTheRepository [

	self
		should: [ aRepositoryOfToDosWithAToDoOpen deleteToDoIdentified: 2 ]
		raise: ToDoException
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test08CantBePossibleToAddAToDoEnumeratedWithTheSameNumberThatAnotherToDo [

	 aRepositoryOfToDosEmpty addNewToDo: toDoBuilder build.

	self
		should: [ aRepositoryOfToDosEmpty addNewToDo: toDoBuilder build ]
		raise: ToDoException
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test09ItIsPossibleToAssignAnEndDateInCaseTheToDoDoesNotHaveOne [

	| aToDoNoteSelected |
	aRepositoryOfToDosEmpty addNewToDo: toDoBuilder build.

	aToDoNoteSelected := aRepositoryOfToDosEmpty 
		                     selectToDoWith: 1.

	aToDoNoteSelected completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: 'Unassigned Completion Date') ].

	aRepositoryOfToDosEmpty
		modifyTheToDoIdentified: 1
		withTheNewCompletionDate: '01/02/2023'.

	aToDoNoteSelected completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: '01/02/2023') ]
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test10AToDoCompletionDateCantBeModifyIfCompletionStatusIsInProgressOrFinished [

	self
		should: [ 
			(aRepositoryOfToDosWithAToDoInProgress selectToDoWith: 1) 
				assignCompletionDate: '31/12/2022' ]
		raise: ToDoStateCondition.

	self
		should: [ 
			(aRepositoryOfToDosWithAToDoFinished selectToDoWith: 1) 
				assignCompletionDate: '31/12/2022' ]
		raise: ToDoStateCondition
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test11AToDoCanBeAssignedIfOnlyItIsInOpenCompletionStatus [

	self deny: ((aRepositoryOfToDosWithAToDoOpen selectToDoWith: 1) isAssigned).
	
	aRepositoryOfToDosWithAToDoOpen assignEmployee: 'Agustin' toTheToDoIdentified: 1.
	
	self assert: ((aRepositoryOfToDosWithAToDoOpen selectToDoWith: 1) isAssigned).
	
	(aRepositoryOfToDosWithAToDoOpen selectToDoWith: 1)
		designatedEmployee withContentDo: [ :deisgnatedEmployee | 
		self assert: deisgnatedEmployee equals: 'Agustin' ]
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test12AToDoAssignedWhenTheCompletionStatusIsNotOpenRaiseAnError [

	self
		should: [ 
			aRepositoryOfToDosWithAToDoInProgress
				assignEmployee: 'Agustin'
				toTheToDoIdentified: 1 ]
		raise: ToDoException.
		
	self
		should: [ 
			aRepositoryOfToDosWithAToDoFinished
				assignEmployee: 'Agustin'
				toTheToDoIdentified: 1 ]
		raise: ToDoException.
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test13AToDoCompletionStatusCanBeSettedToOpenCompletionStatus [

	aRepositoryOfToDosWithAToDoInProgress 
		modifyCompletionStatusToOpenTheToDoIdentified: 1.
	aRepositoryOfToDosWithAToDoFinished 
		modifyCompletionStatusToOpenTheToDoIdentified: 1.

	self
		assert: aRepositoryOfToDosWithAToDoInProgress numberOfOpenToDos
		equals: 1.

	self
		assert:
		aRepositoryOfToDosWithAToDoInProgress numberOfInProgressToDos
		equals: 0.


	self
		assert: aRepositoryOfToDosWithAToDoFinished numberOfOpenToDos
		equals: 1.


	self
		assert: aRepositoryOfToDosWithAToDoFinished numberOfFinishedToDos
		equals: 0
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test14AToDoCompletionStatusCanBeSettedToInProgressCompletionStatus [

	aRepositoryOfToDosWithAToDoOpen 
		modifyCompletionStatusToInProgressTheToDoIdentified: 1.

	self assert: (aRepositoryOfToDosWithAToDoOpen 
			 selectToDoWith: 1) isInProgress
]

{ #category : #'CRUD - operations' }
RepositoryTest >> test15AToDoCompletionStatusCanBeSettedToFinishedCompletionStatus [

	aRepositoryOfToDosWithAToDoOpen 
		modifyCompletionStatusToFinishedTheToDoIdentified: 1.

	self assert: (aRepositoryOfToDosWithAToDoOpen 
			 selectToDoWith: 1) isFinished
]

{ #category : #creation }
RepositoryTest >> test16ARepositoryStartsWithZeroToDos [

	self assert: Repository new numberOfToDos equals: 0
]
