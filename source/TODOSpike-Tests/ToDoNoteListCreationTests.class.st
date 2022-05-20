Class {
	#name : #ToDoNoteListCreationTests,
	#superclass : #TestCase,
	#instVars : [
		'aToDoNoteList'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
ToDoNoteListCreationTests >> test01AToDoNoteListCanStartWithAListName [

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	self assert: aToDoNoteList listName equals: 'Development ToDos'
]

{ #category : #tests }
ToDoNoteListCreationTests >> test02AToDoNoteListStartsWithZeroToDoNotes [

	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	self assert: aToDoNoteList numberOfToDos equals: 0
]
