Class {
	#name : #ToDoNoteList,
	#superclass : #Object,
	#instVars : [
		'listName',
		'toDos'
	],
	#classInstVars : [
		'listName'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNoteList class >> named: aListName [

	^ self new initializeNamed: aListName
]

{ #category : #operations }
ToDoNoteList >> add: aToDoNote [ 

	toDos add: aToDoNote.
]

{ #category : #operations }
ToDoNoteList >> deleteToDoWithNumber: aToDoNumber [
	toDos removeAt: aToDoNumber
]

{ #category : #'initialization - private' }
ToDoNoteList >> initializeNamed: aListName [

	listName := aListName.
	toDos := OrderedCollection new.
]

{ #category : #accessing }
ToDoNoteList >> listName [
	^ listName
]

{ #category : #accessing }
ToDoNoteList >> numberOfToDos [
	
	^ toDos size
]
