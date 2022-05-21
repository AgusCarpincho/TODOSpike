Class {
	#name : #CompletionStatusTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
CompletionStatusTests >> test01AToDoNoteStartsWithAnOpenCompletionStatus [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description for a good development' categorized: 'Development' and: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Open'
]

{ #category : #tests }
CompletionStatusTests >> test02AToDoNoteWithAnOpenCompletionStatusCanBeSettedToInProgress [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description for a good development' categorized: 'Development' and: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Open'.
	aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'In progress'
	
]

{ #category : #tests }
CompletionStatusTests >> test03AToDoNoteWithAnInProgressCompletionStatusCanBeSettedToFinished [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description for a good development' categorized: 'Development' and: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Open'.
	
	aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'In progress'.
	
	aToDoNote setCompletionStatusToFinished.
	self assert: aToDoNote completionStatus equals: 'Finished'.
]
