Class {
	#name : #RepositorySystemTest,
	#superclass : #TestCase,
	#instVars : [
		'repositorySystem'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
RepositorySystemTest >> setUp [
	
	super setUp.
	
	repositorySystem := RepositorySystem new.
]

{ #category : #tests }
RepositorySystemTest >> test01AnEmployeeIsAddedThroughTheRepositorySystem [

	repositorySystem addEmployeeNamed: 'Agus'.
	self assert: (repositorySystem employeeNames first sameAs: 'Agus')
]

{ #category : #tests }
RepositorySystemTest >> test02AToDoIsAddedThroughTheRepositorySystemAndTheNumberOfToDosIsOne [

	repositorySystem addToDoDescribedBy: 'A description' categorizedBy: 'A category'  assignedTo: 'Agus'.
	self assert: (repositorySystem openedToDos) size equals: 1
]

{ #category : #tests }
RepositorySystemTest >> test03AToDoCanBeAssignedToAnotherEmployeeThroughTheRepositorySystemAndTheDesignatedEmployeeChangedInTheToDo [

	repositorySystem addEmployeeNamed: 'Agus'.
	repositorySystem addEmployeeNamed: 'Tomas'.
	repositorySystem
		addToDoDescribedBy: 'A description'
		categorizedBy: 'A category'
		assignedTo: 'Agus'.

	repositorySystem assignEmployee: 'Tomas' toTheToDoIdentified: 1.
	self assert: repositorySystem openedToDos size equals: 1.
	repositorySystem openedToDos first designatedEmployee withContentDo: [ 
		:employee | self assert: employee equals: 'Tomas' ]
]

{ #category : #tests }
RepositorySystemTest >> test04AToDoIsDeletedFromTheRepositorySystemAndTheNumberOfToDosIsZero [

	| identifier |
	repositorySystem
		addToDoDescribedBy: 'A description'
		categorizedBy: 'A category'
		assignedTo: 'Agus'.
	identifier := repositorySystem openedToDos first identifier.
	repositorySystem deleteToDoIdentified: identifier.
	self assert: repositorySystem openedToDos isEmpty.
	self assert: repositorySystem inProgressToDos isEmpty.
	self assert: repositorySystem finishedToDos isEmpty
]

{ #category : #tests }
RepositorySystemTest >> test05ThreeEmployeesWereAddedAndTheNumberOfEmployeesIsThreeAndTheNamesAreCorrect [

	| expectedNumberOfEmployees |
	expectedNumberOfEmployees := 3.

	repositorySystem addEmployeeNamed: 'Agustin'.

	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem addEmployeeNamed: 'Abel'.

	self
		assert: repositorySystem employeeNames size
		equals: expectedNumberOfEmployees.
	self assert: (repositorySystem employeeNames first sameAs: 'Agustin').
	self assert: (repositorySystem employeeNames second sameAs: 'Tomas').
	self assert: (repositorySystem employeeNames third sameAs: 'Abel')
]

{ #category : #tests }
RepositorySystemTest >> test06ANewToDoIsAddedAndTransitionedToFinishedAndTheNumberOfToDosIsOne [

	| identifier numberOfToDosFinishedExcepted |

	numberOfToDosFinishedExcepted := 1.

	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.
	repositorySystem modifyCompletionStatusToFinishedTheToDoIdentified:
		identifier.
	self
		assert: repositorySystem finishedToDos size
		equals: numberOfToDosFinishedExcepted
]

{ #category : #tests }
RepositorySystemTest >> test07ANewToDoIsAddedAndTransitionedToInProgressAndTheNumberOfToDosIsOne [

	| identifier numberOfToDosInProgressExcepted |
	numberOfToDosInProgressExcepted := 1.

	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.
	repositorySystem modifyCompletionStatusToInProgressTheToDoIdentified:
		identifier.
	self
		assert: repositorySystem inProgressToDos size
		equals: numberOfToDosInProgressExcepted
]

{ #category : #tests }
RepositorySystemTest >> test08ANewRepositorySystemHasZeroToDosAndZeroEmployees [

	| newRepositorySystem numberExptectedOfToDos numberExptectedOfEmployees |
	
	newRepositorySystem := RepositorySystem new.
	numberExptectedOfToDos := 0.
	numberExptectedOfEmployees := 0.
	
	self assert: newRepositorySystem employeeNames size equals: numberExptectedOfEmployees.
	self assert: newRepositorySystem openedToDos size equals: numberExptectedOfToDos.
	self assert: newRepositorySystem inProgressToDos size equals: numberExptectedOfToDos.
	self assert: newRepositorySystem finishedToDos size equals: numberExptectedOfToDos.
]

{ #category : #tests }
RepositorySystemTest >> test09ANewToDoIsAddedAndTransitionedToOpenAndTheNumberOfToDosIsOne [

	| identifier numberOfToDosOpenExcepted |
	numberOfToDosOpenExcepted := 1.

	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.
	repositorySystem 
		modifyCompletionStatusToOpenTheToDoIdentified: identifier.
	self
		assert: repositorySystem openedToDos size
		equals: numberOfToDosOpenExcepted
]

{ #category : #tests }
RepositorySystemTest >> test10AnOpenToDoIsTransitionedToInProgress [

	| identifier |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.

	repositorySystem modifyCompletionStatusToInProgressTheToDoIdentified:
		identifier.

	self assert: repositorySystem inProgressToDos first isInProgress
]

{ #category : #tests }
RepositorySystemTest >> test11AnOpenToDoIsTransitionedToFinished [

	| identifier |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.

	repositorySystem 
		modifyCompletionStatusToFinishedTheToDoIdentified: identifier.

	self assert: repositorySystem finishedToDos first isFinished
]

{ #category : #tests }
RepositorySystemTest >> test12AnInProgressToDoIsTransitionedToFinished [

	| identifier |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.

	repositorySystem modifyCompletionStatusToInProgressTheToDoIdentified:
		identifier.

	repositorySystem modifyCompletionStatusToFinishedTheToDoIdentified:
		identifier.

	self assert: repositorySystem finishedToDos first isFinished
]

{ #category : #tests }
RepositorySystemTest >> test13AFinishedToDoIsTransitionedToInProgress [

	| identifier |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.

	repositorySystem 
		modifyCompletionStatusToFinishedTheToDoIdentified: identifier.

	repositorySystem modifyCompletionStatusToInProgressTheToDoIdentified:
		identifier.

	self assert: repositorySystem inProgressToDos first isInProgress
]

{ #category : #tests }
RepositorySystemTest >> test14AnInProgressToDoIsTransitionedToOpen [

	| identifier |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.

	repositorySystem modifyCompletionStatusToInProgressTheToDoIdentified:
		identifier.

	repositorySystem 
		modifyCompletionStatusToOpenTheToDoIdentified: identifier.

	self assert: repositorySystem openedToDos first isOpen
]

{ #category : #tests }
RepositorySystemTest >> test15AToDoWithoutCompletionDateIsAssignedWithANewOne [

	| identifier exptectedCompletionDate |
	repositorySystem addEmployeeNamed: 'Tomas'.

	repositorySystem
		addToDoDescribedBy: 'Reify'
		categorizedBy: 'Develop'
		assignedTo: 'Tomas'.

	identifier := repositorySystem openedToDos first identifier.
	exptectedCompletionDate := Optional containing: '20 July 2022'.

	self
		assert: repositorySystem openedToDos first completionDate
		equals: (Optional unusedBecause: 'Unassigned Completion Date').

	repositorySystem
		modifyTheToDoIdentified: identifier
		withTheNewCompletionDate: '20 July 2022'.

	self
		assert: repositorySystem openedToDos first completionDate
		equals: exptectedCompletionDate
]
