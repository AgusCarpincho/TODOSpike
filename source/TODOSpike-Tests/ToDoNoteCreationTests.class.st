Class {
	#name : #ToDoNoteCreationTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
ToDoNoteCreationTests >> test10AToDoNoteWithoutCategoryAndFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote with: 10 ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test11AToDoNoteWithoutFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote with: 10 categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test1AToDoNoteHasADescription [

	| aToDoNote aDescription |
	
	aDescription := 'Make some tests for the ToDoApp'.
	aToDoNote := ToDoNote with: aDescription.
	
	self assert: ( aToDoNote description ) equals: aDescription
]

{ #category : #tests }
ToDoNoteCreationTests >> test2AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'Some description' categorized: 'ANiceCategory'.
	
	self assert: ( aToDoNote category ) equals: 'ANiceCategory'
]

{ #category : #tests }
ToDoNoteCreationTests >> test3AToDoNoteHasAFinishDateAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'Some description' endingDate: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote finishDate ) equals: '5/6/2022'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test4AToDoNoteHasAFinishDateAndADescriptionAndACategory [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'Some description' categorized: 'AGoodCategory' endingDate: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote finishDate ) equals: '5/6/2022'.
	self assert: ( aToDoNote category ) equals: 'AGoodCategory'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test5AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

	self should: [ ToDoNote with: '' categorized: 'AGoodCategory' endingDate: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test6AToDoNoteRaiseAnExceptionIfTheDescriptionIsNil [

	self should: [ ToDoNote with: nil categorized: 'AGoodCategory' endingDate: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test7AToDoNoteRaiseAnExceptionIfTheDescriptionIsNotAString [

	self should: [ ToDoNote with: 10 categorized: 'AGoodCategory' endingDate: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test8AToDoNoteWithoutCategoryAndFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote with: nil ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test9AToDoNoteWithoutFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote with: nil categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]
