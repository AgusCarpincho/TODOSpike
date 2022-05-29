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

	^ ContainerWebView
		  wrapping: (ToDoListColumnView title: 'Open')
		  intoElementBuiltUsing: [ :canvas | canvas div ]
		  applying: [ :theContainer | 
			  theContainer addClass willow.
			  theContainer setStyleTo: [ :style | 
				  style
					  backgroundColor: '#	F3F3F3';
					  boxShadow:
						  '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					  color: '#EE8625';
					  borderRadius: 10 px;
					  padding: 20 px;
					  height: 300 px;
					  fontSize: 20 px;
					  width: 400 px;	
					  margin: 20 px ] ]
]

{ #category : #'as yet unclassified' }
ColumnListsView >> createMiddleColumnToDoList [

	^ ContainerWebView
		  wrapping: (ToDoListColumnView title: 'In progress')
		  intoElementBuiltUsing: [ :canvas | canvas div ]
		  applying: [ :theContainer | 
			  theContainer addClass willow.
			  theContainer setStyleTo: [ :style | 
				  style
					  backgroundColor: '#	F3F3F3';
					  boxShadow:
						  '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					  color: '#EE8625';
					  borderRadius: 10 px;
					  padding: 20 px;
					  height: 300 px;
					  fontSize: 20 px;
					  width: 400 px;
					  margin: 20 px ] ]
]

{ #category : #'as yet unclassified' }
ColumnListsView >> createRightColumnToDoList [

	^ ContainerWebView
		  wrapping: (ToDoListColumnView title: 'Finished')
		  intoElementBuiltUsing: [ :canvas | canvas div ]
		  applying: [ :theContainer | 
			  theContainer addClass willow.
			  theContainer setStyleTo: [ :style | 
				  style
					  backgroundColor: '#	F3F3F3';
					  boxShadow:
						  '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					  color: '#EE8625';
					  borderRadius: 10 px;
					  padding: 20 px;
					  height: 300 px;
					  fontSize: 20 px;
					  width: 400 px;
					  margin: 20 px ] ]
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
