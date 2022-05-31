Class {
	#name : #CompletionDateAssignmentTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
CompletionDateAssignmentTests >> test01AToDoNoteWithoutACompletionDateCanBeAssignedWithACompletionDate [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: 'Unassigned Completion Date'
		             assignedTo: 'Agustin'
		             withStatus: 'Open'.
	aToDoNote := aToDoNote assignCompletionDate: '25/12/2022'.
	self assert: aToDoNote completionDate equals: '25/12/2022'
]

{ #category : #tests }
CompletionDateAssignmentTests >> test02AToDoNoteWithACompletionDateCanBeReassignedWithANewCompletionDate [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: '25/12/2022'
		             assignedTo: 'Agus'
		             withStatus: 'Open'.

	aToDoNote := aToDoNote assignCompletionDate: '25/12/2023'.
	self assert: aToDoNote completionDate equals: '25/12/2023'
]

{ #category : #tests }
CompletionDateAssignmentTests >> test03ACompletionDateCantBeDeleted [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description'
		             categorized: 'Development'
		             endingOn: '25/12/2022'
		             assignedTo: 'Agus'
		             withStatus: 'Open'.
		
	self
		should: [ aToDoNote assignCompletionDate: '' ]
		raise: ToDoNoteException
]
