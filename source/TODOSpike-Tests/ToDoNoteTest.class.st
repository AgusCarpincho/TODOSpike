Class {
	#name : #ToDoNoteTest,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #'employee assignments' }
ToDoNoteTest >> test01AToDoNoteCanBeAssignedToAnEmployee [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.

	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #creation }
ToDoNoteTest >> test01AToDoNoteHasADescription [

	| aToDoNote aDescription |
	aDescription := 'Make some tests for the ToDoApp'.
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: aDescription
		             categorized: 'Development'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agus'.

	self assert: aToDoNote description equals: aDescription
]

{ #category : #'completion status' }
ToDoNoteTest >> test01AToDoNoteStartsWithAnOpenCompletionStatus [

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

{ #category : #'completion date assignments' }
ToDoNoteTest >> test01AToDoNoteWithoutACompletionDateCanBeAssignedWithACompletionDate [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: 'Unassigned Completion Date'
		             assignedTo: 'Agustin'.aToDoNote assignCompletionDate: '25/12/2022'.
	self assert: aToDoNote completionDate equals: '25/12/2022'
]

{ #category : #'employee assignments' }
ToDoNoteTest >> test02AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsInProgress [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Tomas'.
		aToDoNote setCompletionStatusToInProgress .
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoNoteException
]

{ #category : #creation }
ToDoNoteTest >> test02AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'ANiceCategory'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agus'.


	self assert: aToDoNote category equals: 'ANiceCategory'
]

{ #category : #'completion date assignments' }
ToDoNoteTest >> test02AToDoNoteWithACompletionDateCanBeReassignedWithANewCompletionDate [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: '25/12/2022'
		             assignedTo: 'Agus'.

	aToDoNote assignCompletionDate: '25/12/2023'.
	self assert: aToDoNote completionDate equals: '25/12/2023'
]

{ #category : #'completion status' }
ToDoNoteTest >> test02AToDoNoteWithAnOpenCompletionStatusCanBeSettedToInProgress [

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

{ #category : #'employee assignments' }
ToDoNoteTest >> test03AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsFinished [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.
		aToDoNote setCompletionStatusToFinished.
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoNoteException
]

{ #category : #creation }
ToDoNoteTest >> test03AToDoNoteHasAFinishDateAndADescription [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'Some description'
		             categorized: 'Development'
		             endingOn: '5/6/2022'
		             assignedTo: 'Agus'.


	self assert: aToDoNote description equals: 'Some description'.
	self assert: aToDoNote completionDate equals: '5/6/2022'
]

{ #category : #'completion status' }
ToDoNoteTest >> test03AToDoNoteWithAnInProgressCompletionStatusCanBeSettedToFinished [

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

{ #category : #creation }
ToDoNoteTest >> test04AToDoNoteHasAFinishDateAndADescriptionAndACategory [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'Some description'
		             categorized: 'AGoodCategory'
		             endingOn: '5/6/2022'
		             assignedTo: 'Unassigned Employee'.

	self assert: aToDoNote description equals: 'Some description'.
	self assert: aToDoNote completionDate equals: '5/6/2022'.
	self assert: aToDoNote category equals: 'AGoodCategory'
]

{ #category : #creation }
ToDoNoteTest >> test05AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

	self
		should: [ 
			ToDoNote
				identifiedBy: 1
				described: ''
				categorized: 'AGoodCategory'
				endingOn: '5/6/2022'
				assignedTo: 'Unassigned Employee' ]
		raise: ToDoNoteException
]

{ #category : #creation }
ToDoNoteTest >> test06AToDoNoteStartsWithoutAnAssignedEmployee [

	self
		assert: (ToDoNote
				 identifiedBy: 1
				 described: 'A good description'
				 categorized: 'A good category'
				 endingOn: '25/09/2022'
				 assignedTo: 'Unassigned employee') designatedEmployee
		equals: 'Unassigned employee'
]

{ #category : #creation }
ToDoNoteTest >> test07AToDoNoteStartsWithAnIdentifier [

	self
		assert: (ToDoNote
				 identifiedBy: 1
				 described: 'A good description'
				 categorized: 'Make Tests'
				 endingOn: '25/12/22'
				 assignedTo: 'Unassigned Employee') identifier
		equals: 1
]
