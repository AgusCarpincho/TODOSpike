Class {
	#name : #CompletionStatusTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
CompletionStatusTests >> test01AToDoNoteStartsWithAnOpenCompletionStatus [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'
		             withStatus: 'Open'.

	self assert: aToDoNote completionStatus equals: 'Open'
]

{ #category : #tests }
CompletionStatusTests >> test02AToDoNoteWithAnOpenCompletionStatusCanBeSettedToInProgress [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'
		             withStatus: 'Open'.

	self assert: aToDoNote completionStatus equals: 'Open'.
	aToDoNote := aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'In Progress'
]

{ #category : #tests }
CompletionStatusTests >> test03AToDoNoteWithAnInProgressCompletionStatusCanBeSettedToFinished [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description for a good development'
		             categorized: 'Development'
		             endingOn: '25/9/2022'
		             assignedTo: 'Unassigned Employee'
		             withStatus: 'Open'.

	self assert: aToDoNote completionStatus equals: 'Open'.

	aToDoNote := aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'In Progress'.

	aToDoNote := aToDoNote setCompletionStatusToFinished.
	self assert: aToDoNote completionStatus equals: 'Finished'
]
