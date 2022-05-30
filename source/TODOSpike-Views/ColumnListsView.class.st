Class {
	#name : #ColumnListsView,
	#superclass : #WAPainter,
	#instVars : [
		'leftColumnToDoList',
		'middleColumnToDoList',
		'rightColumnToDoList'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'as yet unclassified' }
ColumnListsView >> createLeftColumnToDoList [

	^ ToDoListColumnView title: 'Open'
]

{ #category : #'as yet unclassified' }
ColumnListsView >> createMiddleColumnToDoList [

	^ ToDoListColumnView title: 'In Progress'
]

{ #category : #'as yet unclassified' }
ColumnListsView >> createRightColumnToDoList [

	^ ToDoListColumnView title: 'Finished'
]

{ #category : #rendering }
ColumnListsView >> initialize [

	leftColumnToDoList := self createLeftColumnToDoList.
	middleColumnToDoList := self createMiddleColumnToDoList.
	rightColumnToDoList := self createRightColumnToDoList
]

{ #category : #rendering }
ColumnListsView >> renderContentOn: aRenderer [

	aRenderer render: leftColumnToDoList.
	aRenderer render: middleColumnToDoList.
	aRenderer render: rightColumnToDoList.
	
]
