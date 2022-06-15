Class {
	#name : #ToDoTest,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #'employee assignments' }
ToDoTest >> test01AToDoNoteCanBeAssignedToAnEmployee [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.

	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #creation }
ToDoTest >> test01AToDoNoteHasADescription [

	| aToDoNote aDescription |
	aDescription := 'Make some tests for the ToDoApp'.
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: aDescription
		             categorized: 'Development'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agus'.

	self assert: aToDoNote description equals: aDescription
]

{ #category : #'completion date assignments' }
ToDoTest >> test01AToDoNoteWithoutACompletionDateCanBeAssignedWithACompletionDate [

	| toDoNote toDoNoteBuilder |
	toDoNoteBuilder := ToDoBuilder
		                   withNumericalIdentifier: 1
		                   withDescription: 'A good description'.
	toDoNoteBuilder configuringCategory: 'A good category'.
	toDoNote := toDoNoteBuilder build.

	toDoNote completionDate withContentDo: [ :completionDate | 
		self assert: completionDate equals: 'Unassigned Completion Date' ].

	toDoNote assignCompletionDate: '1/01/2023'.

	toDoNote completionDate withContentDo: [ :completionDate | 
		self assert: completionDate equals: '1/01/2023' ]
]

{ #category : #'employee assignments' }
ToDoTest >> test02AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsInProgress [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Tomas'.
		aToDoNote setCompletionStatusToInProgress .
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoException
]

{ #category : #creation }
ToDoTest >> test02AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description'
		             categorized: 'ANiceCategory'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agus'.


	self assert: aToDoNote category equals: 'ANiceCategory'
]

{ #category : #'completion date assignments' }
ToDoTest >> test02AToDoNoteWithACompletionDateCanBeReassignedWithANewCompletionDate [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: '25/12/2022'
		             assignedTo: 'Agus'.

	aToDoNote assignCompletionDate: '25/12/2023'.
	aToDoNote completionDate withContentDo: [ :completionDate | self assert: completionDate equals: '25/12/2023']
]

{ #category : #'employee assignments' }
ToDoTest >> test03AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsFinished [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.
		aToDoNote setCompletionStatusToFinished.
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoException
]

{ #category : #creation }
ToDoTest >> test03AToDoNoteHasAFinishDateAndADescription [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'Some description'
		             categorized: 'Development'
		             endingOn: '5/6/2022'
		             assignedTo: 'Agus'.


	self assert: aToDoNote description equals: 'Some description'.
	self assert: aToDoNote completionDate equals: '5/6/2022'
]

{ #category : #creation }
ToDoTest >> test04AToDoNoteHasAFinishDateAndADescriptionAndACategory [

	| aToDoNote |
	aToDoNote := ToDo
		             identifiedByANumericalIdentifier: 1
		             described: 'Some description'
		             categorized: 'AGoodCategory'
		             endingOn: '5/6/2022'
		             assignedTo: 'Unassigned Employee'.

	self assert: aToDoNote description equals: 'Some description'.
	self assert: aToDoNote completionDate equals: '5/6/2022'.
	self assert: aToDoNote category equals: 'AGoodCategory'
]

{ #category : #creation }
ToDoTest >> test05AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

	self
		should: [ 
			ToDo
				identifiedByANumericalIdentifier: 1
				described: ''
				categorized: 'AGoodCategory'
				endingOn: '5/6/2022'
				assignedTo: 'Unassigned Employee' ]
		raise: ToDoException
]

{ #category : #creation }
ToDoTest >> test06AToDoNoteStartsWithoutAnAssignedEmployee [

	self
		assert: (ToDo
				 identifiedByANumericalIdentifier: 1
				 described: 'A good description'
				 categorized: 'A good category'
				 endingOn: '25/09/2022'
				 assignedTo: 'Unassigned employee') designatedEmployee
		equals: 'Unassigned employee'
]

{ #category : #creation }
ToDoTest >> test07AToDoNoteStartsWithAnIdentifier [

	self
		assert: (ToDo
				 identifiedByANumericalIdentifier: 1
				 described: 'A good description'
				 categorized: 'Make Tests'
				 endingOn: '25/12/22'
				 assignedTo: 'Unassigned Employee') identifier
		equals: 1
]
