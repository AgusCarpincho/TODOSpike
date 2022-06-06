Class {
	#name : #ToDoNoteCompletionStatusTest,
	#superclass : #TestCase,
	#instVars : [
		'toDoNoteOpenCompletionStatusReferencingAToDoNote',
		'aToDoNote'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteCompletionStatusTest >> setUp [

	super setUp.

	"ToDos"
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: (Optional containing: 'A good category')
		             endingOn: (Optional containing: '25/09/2022')
		             assignedTo: (Optional containing: 'Agustin').

	"Completion Status - state"
	toDoNoteOpenCompletionStatusReferencingAToDoNote := ToDoNoteOpenCompletionStatus 
		                                                    references:
		                                                    aToDoNote
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test01AToDoNoteCompletionStatusIsAnAbstractClass [

	self assert: ToDoNoteCompletionStatus isAbstract
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test02AToDoNoteCompletionStatusReferencesAToDoNoteAndAnExceptionIsntRaised [

	self
		shouldnt: [ 
			ToDoNoteOpenCompletionStatus references: aToDoNote ]
		raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test03AToDoNoteOpenCompletionStatusCanAssignANewCompletionDateAndDoesntRaiseAnException [

	aToDoNote assignCompletionDate: '25/09/2070'.

		(aToDoNote completionDate withContentDo: [ :completionDate | 
			 self assert: (completionDate sameAs: '25/09/2070') ])
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test04AToDoNoteOpenCompletionStatusCanAssignTheToDoNoteToAnEmployeeAndDoesntRaiseAnException [

	self shouldnt: [aToDoNote assignTo: 'Tomas'] raise: ToDoNoteException.
	
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test05AToDoNoteOpenCompletionStatusIsNotFinished [

	self deny: aToDoNote isFinished
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test06AToDoNoteOpenCompletionStatusIsNotInProgress [

	self deny: aToDoNote isInProgress
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test07AToDoNoteOpenCompletionStatusIsOpen [

	self assert: aToDoNote isOpen
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test08AToDoNoteInProgressCompletionStatusIsNotOpen [

	aToDoNote setCompletionStatusToInProgress.
	self deny: aToDoNote isOpen
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test09AToDoNoteInProgressCompletionStatusIsNotFinished [

	aToDoNote setCompletionStatusToInProgress .
	self deny: aToDoNote isFinished
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test10AToDoNoteInProgressCompletionStatusIsInProgress [

	aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote isInProgress
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test11AToDoNoteInProgressCompletionStatusCantAssignANewCompletionDateAndRaiseAnException [

	aToDoNote setCompletionStatusToInProgress .
	self should: [aToDoNote assignCompletionDate: '25/09/2070'] raise: ToDoNoteException.
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test12AToDoNoteInProgressCompletionStatusCantAssignANewEmployee [

	aToDoNote setCompletionStatusToInProgress .
	self should: [ aToDoNote assignTo: 'Tomas' ] raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test13AToDoNoteFinishedCompletionStatusCantAssignANewCompletionDateAndRaiseAnException [

	aToDoNote setCompletionStatusToFinished.
		self
			should: [ aToDoNote assignCompletionDate: '25/09/2070' ]
			raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test14AToDoNoteFinishedCompletionStatusCantAssignANewEmployee [

	aToDoNote setCompletionStatusToFinished.
	self should: [ aToDoNote assignTo: 'Tomas' ] raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test15AToDoNoteFinishedCompletionStatusIsNotOpen [

	aToDoNote setCompletionStatusToFinished.
	self deny: aToDoNote isOpen
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test16AToDoNoteFinishedCompletionStatusIsNotInProgress [

	aToDoNote setCompletionStatusToFinished.
	self deny: aToDoNote isInProgress
]

{ #category : #tests }
ToDoNoteCompletionStatusTest >> test17AToDoNoteFinishedCompletionStatusIsFinished [

	aToDoNote setCompletionStatusToFinished.
	self assert: aToDoNote isFinished
]
