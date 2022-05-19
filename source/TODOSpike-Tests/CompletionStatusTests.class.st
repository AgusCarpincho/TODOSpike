Class {
	#name : #CompletionStatusTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
CompletionStatusTests >> test01AToDoNoteStartsWithAnOpenCompletionStatus [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'A good description for a good development' categorized: 'Development' endingDate: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Abierto'
]

{ #category : #tests }
CompletionStatusTests >> test02AToDoNoteWithAnOpenCompletionStatusCanBeSettedToInProgress [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'A good description for a good development' categorized: 'Development' endingDate: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Abierto'.
	aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'En progreso'
	
]

{ #category : #tests }
CompletionStatusTests >> test03AToDoNoteWithAnInProgressCompletionStatusCanBeSettedToFinished [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'A good description for a good development' categorized: 'Development' endingDate: '25/9/2022' .
	
	self assert: aToDoNote completionStatus equals: 'Abierto'.
	
	aToDoNote setCompletionStatusToInProgress.
	self assert: aToDoNote completionStatus equals: 'En progreso'.
	
	aToDoNote setCompletionStatusToFinished.
	self assert: aToDoNote completionStatus equals: 'Terminada'.
]
