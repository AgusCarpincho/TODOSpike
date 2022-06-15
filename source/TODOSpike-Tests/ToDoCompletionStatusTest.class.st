Class {
	#name : #ToDoCompletionStatusTest,
	#superclass : #TestCase,
	#instVars : [
		'toDoNoteOpenCompletionStatusReferencingAToDoNote',
		'aToDoNote'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoCompletionStatusTest >> setUp [

	super setUp.

	"ToDos"
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description'
		             categorized: (Optional containing: 'A good category')
		             endingOn: (Optional containing: '25/09/2022')
		             assignedTo: (Optional containing: 'Agustin').

	"Completion Status - state"
	toDoNoteOpenCompletionStatusReferencingAToDoNote := OpenCompletionStatus 
		                                                    references:
		                                                    aToDoNote
]

{ #category : #tests }
ToDoCompletionStatusTest >> test01AToDoNoteCompletionStatusIsAnAbstractClass [

	self assert: CompletionStatus isAbstract
]

{ #category : #tests }
ToDoCompletionStatusTest >> test02AToDoNoteCompletionStatusReferencesAToDoNoteAndAnExceptionIsntRaised [

	self
		shouldnt: [ 
			OpenCompletionStatus references: aToDoNote ]
		raise: ToDoException
]

{ #category : #tests }
ToDoCompletionStatusTest >> test03AToDoNoteOpenCompletionStatusCanAssignANewCompletionDateAndDoesntRaiseAnException [

	aToDoNote assignCompletionDate: '25/09/2070'.

		(aToDoNote completionDate withContentDo: [ :completionDate | 
			 self assert: (completionDate sameAs: '25/09/2070') ])
]

{ #category : #tests }
ToDoCompletionStatusTest >> test04AToDoNoteOpenCompletionStatusCanAssignTheToDoNoteToAnEmployeeAndDoesntRaiseAnException [

	self shouldnt: [aToDoNote assignTo: 'Tomas'] raise: ToDoException.
	
]

{ #category : #tests }
ToDoCompletionStatusTest >> test11AToDoNoteInProgressCompletionStatusCantAssignANewCompletionDateAndRaiseAnException [

	aToDoNote setCompletionStatusToInProgress .
	self should: [aToDoNote assignCompletionDate: '25/09/2070'] raise: ToDoException.
]

{ #category : #tests }
ToDoCompletionStatusTest >> test12AToDoNoteInProgressCompletionStatusCantAssignANewEmployee [

	aToDoNote setCompletionStatusToInProgress .
	self should: [ aToDoNote assignTo: 'Tomas' ] raise: ToDoException
]

{ #category : #tests }
ToDoCompletionStatusTest >> test13AToDoNoteFinishedCompletionStatusCantAssignANewCompletionDateAndRaiseAnException [

	aToDoNote setCompletionStatusToFinished.
		self
			should: [ aToDoNote assignCompletionDate: '25/09/2070' ]
			raise: ToDoException
]

{ #category : #tests }
ToDoCompletionStatusTest >> test14AToDoNoteFinishedCompletionStatusCantAssignANewEmployee [

	aToDoNote setCompletionStatusToFinished.
	self should: [ aToDoNote assignTo: 'Tomas' ] raise: ToDoException
]
