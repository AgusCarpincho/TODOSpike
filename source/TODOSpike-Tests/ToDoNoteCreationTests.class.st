Class {
	#name : #ToDoNoteCreationTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
ToDoNoteCreationTests >> test01AToDoNoteHasADescription [

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

{ #category : #tests }
ToDoNoteCreationTests >> test02AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'ANiceCategory'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agus'.


	self assert: aToDoNote category equals: 'ANiceCategory'
]

{ #category : #tests }
ToDoNoteCreationTests >> test03AToDoNoteHasAFinishDateAndADescription [

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

{ #category : #tests }
ToDoNoteCreationTests >> test04AToDoNoteHasAFinishDateAndADescriptionAndACategory [

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

{ #category : #tests }
ToDoNoteCreationTests >> test05AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

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

{ #category : #tests }
ToDoNoteCreationTests >> test06AToDoNoteStartsWithoutAnAssignedEmployee [

	self
		assert: (ToDoNote
				 identifiedBy: 1
				 described: 'A good description'
				 categorized: 'A good category'
				 endingOn: '25/09/2022'
				 assignedTo: 'Unassigned employee') designatedEmployee
		equals: 'Unassigned employee'
]

{ #category : #tests }
ToDoNoteCreationTests >> test07AToDoNoteStartsWithAnIdentifier [

	self
		assert: (ToDoNote
				 identifiedBy: 1
				 described: 'A good description'
				 categorized: 'Make Tests'
				 endingOn: '25/12/22'
				 assignedTo: 'Unassigned Employee') identifier
		equals: 1
]
