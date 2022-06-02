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
		             assignedTo: 'Agustin'.aToDoNote assignCompletionDate: '25/12/2022'.
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
		             assignedTo: 'Agus'.

	aToDoNote assignCompletionDate: '25/12/2023'.
	self assert: aToDoNote completionDate equals: '25/12/2023'
]
