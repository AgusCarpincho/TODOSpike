Class {
	#name : #ColumnListsView,
	#superclass : #WAPainter,
	#instVars : [
		'leftColumnToDoListView',
		'middleColumnToDoListView',
		'rightColumnToDoListView',
		'toDoListColumnViews'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
ColumnListsView class >> withToDoNoteLists: aToDoNoteLists [

	^ self new
		  initializeWithToDoNoteLists: aToDoNoteLists
]

{ #category : #'initialization - private' }
ColumnListsView >> initializeWithToDoNoteLists: aToDoNoteLists [

	toDoListColumnViews := aToDoNoteLists collect: [ :toDoNoteList | 
			(ToDoListColumnView withToDoNoteList: toDoNoteList) ]
]

{ #category : #rendering }
ColumnListsView >> renderContentOn: aRenderer [
	toDoListColumnViews do: [ :columnToDoListView | 
		aRenderer render: columnToDoListView ]
]
