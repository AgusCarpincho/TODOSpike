Class {
	#name : #ToDoNoteCreationTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
ToDoNoteCreationTests >> test01AToDoNoteHasADescription [

	| aToDoNote aDescription |
	
	aDescription := 'Make some tests for the ToDoApp'.
	aToDoNote := ToDoNote identifiedBy: 1 described: aDescription.
	
	self assert: ( aToDoNote description ) equals: aDescription
]

{ #category : #tests }
ToDoNoteCreationTests >> test02AToDoNoteHasACategoryAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote identifiedBy: 1 described: 'Some description' categorized: 'ANiceCategory'.
	
	self assert: ( aToDoNote category ) equals: 'ANiceCategory'
]

{ #category : #tests }
ToDoNoteCreationTests >> test03AToDoNoteHasAFinishDateAndADescription [

	| aToDoNote |
	
	aToDoNote := ToDoNote identifiedBy: 1 described: 'Some description' endingOn: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote completionDate ) equals: '5/6/2022'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test04AToDoNoteHasAFinishDateAndADescriptionAndACategory [

	| aToDoNote |
	
	aToDoNote := ToDoNote identifiedBy: 1 described: 'Some description' categorized: 'AGoodCategory' endingOn: '5/6/2022'.
	
	self assert: ( aToDoNote description ) equals: 'Some description'.
	self assert: ( aToDoNote completionDate ) equals: '5/6/2022'.
	self assert: ( aToDoNote category ) equals: 'AGoodCategory'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test05AToDoNoteRaiseAnExceptionIfTheDescriptionIsEmpty [

	self should: [ ToDoNote identifiedBy: 1 described: '' categorized: 'AGoodCategory' endingOn: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test06AToDoNoteRaiseAnExceptionIfTheDescriptionIsNil [

	self should: [ ToDoNote identifiedBy: 1 described: nil categorized: 'AGoodCategory' endingOn: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test07AToDoNoteRaiseAnExceptionIfTheDescriptionIsNotAString [

	self should: [ ToDoNote identifiedBy: 1 described: 10 categorized: 'AGoodCategory' endingOn: '5/6/2022' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test08AToDoNoteWithoutCategoryAndFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote identifiedBy: 1 described: nil ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test09AToDoNoteWithoutFinishDateWithANilDescriptionRaiseAFailure [

	self should: [ ToDoNote identifiedBy: 1 described: nil categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test10AToDoNoteWithoutCategoryAndFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote identifiedBy: 1 described: 10 ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test11AToDoNoteWithoutFinishDateWithADescriptionThatIsNotAStringRaiseAFailure [

	self should: [ ToDoNote identifiedBy: 1 described: 10 categorized: 'AGoodCategory' ] raise: ToDoNoteFailure.
]

{ #category : #tests }
ToDoNoteCreationTests >> test12AToDoNoteStartsWithoutAnAssignedEmployee [

	self assert: (ToDoNote identifiedBy: 1 described: 'A good description' categorized: 'A good category') designatedEmployee equals: 'Unassigned employee'.
]

{ #category : #tests }
ToDoNoteCreationTests >> test13AToDoNoteRaiseAnExceptionIfTheCategoryArgumentIsANonStringObject [

	self should: [ ToDoNote identifiedBy: 1 described: 'A good description' categorized: 1 ] raise: ToDoNoteFailure .
]

{ #category : #tests }
ToDoNoteCreationTests >> test14AToDoNoteStartsWithAnIdentifier [

	self assert: ((ToDoNote identifiedBy: 1 described: 'A good description' categorized: 'Make Tests' endingOn: '25/12/22') toDoIdentifier) equals: 1.
]
