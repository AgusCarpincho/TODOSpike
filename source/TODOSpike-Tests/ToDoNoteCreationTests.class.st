Class {
	#name : #ToDoNoteCreationTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
ToDoNoteCreationTests >> test10AToDoNoteWithoutCategoryAndFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote enumerated: 1 with: 10 ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test11AToDoNoteWithoutFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote enumerated: 1 with: 10 categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test1AToDoNoteHasADescription [

	| aToDoNote aDescription |
	
	aDescription := 'Make some tests for the ToDoApp'.
	aToDoNote := ToDoNote enumerated: 1 with: aDescription.
	
	self assert: ( aToDoNote description ) equals: aDescription
]

{ #category : #tests }
ToDoNoteCreationTests >> test2AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'Some description' categorized: 'ANiceCategory'.
	
	self assert: ( aToDoNote category ) equals: 'ANiceCategory'
]

{ #category : #tests }
ToDoNoteCreationTests >> test3AToDoNoteHasAFinishDateAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'Some description' and: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote completionDate ) equals: '5/6/2022'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test4AToDoNoteHasAFinishDateAndADescriptionAndACategory [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'Some description' categorized: 'AGoodCategory' and: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote completionDate ) equals: '5/6/2022'.
	self assert: ( aToDoNote category ) equals: 'AGoodCategory'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test5AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

	self should: [ ToDoNote enumerated: 1 with: '' categorized: 'AGoodCategory' and: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test6AToDoNoteRaiseAnExceptionIfTheDescriptionIsNil [

	self should: [ ToDoNote enumerated: 1 with: nil categorized: 'AGoodCategory' and: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test7AToDoNoteRaiseAnExceptionIfTheDescriptionIsNotAString [

	self should: [ ToDoNote enumerated: 1 with: 10 categorized: 'AGoodCategory' and: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test8AToDoNoteWithoutCategoryAndFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote enumerated: 1 with: nil ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test9AToDoNoteWithoutFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote enumerated: 1 with: nil categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]
