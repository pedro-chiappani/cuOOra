Class {
	#name : #BuscadorDeTopicosComponent,
	#superclass : #WAComponent,
	#instVars : [
		'searchText',
		'topico',
		'sistema'
	],
	#category : #'CuOOra-UI'
}

{ #category : #initialization }
BuscadorDeTopicosComponent >> initialize [
	super initialize.
	searchText := ''.
	sistema := CuOOra soleInstance
]

{ #category : #rendering }
BuscadorDeTopicosComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas.
	self renderSearchFormOn: aCanvas.
	self renderSearchResultsOn: aCanvas.
]

{ #category : #rendering }
BuscadorDeTopicosComponent >> renderSearchFormOn: aCanvas [
	aCanvas heading
		level: 4;
		with: 'Ingrese el topico que desea buscar.'.
	aCanvas
		form: [ aCanvas space: 10.
			aCanvas textInput on: #searchText of: self.
			aCanvas space.
			aCanvas submitButton with: 'Buscar' ].
	aCanvas horizontalRule.
]

{ #category : #rendering }
BuscadorDeTopicosComponent >> renderSearchResultsOn: aCanvas [
	| topicos |
	topicos := sistema topicosConNombre: searchText.
	topicos
		ifEmpty: [ aCanvas paragraph: 'No hay ningun topico con ese nombre' ]
		ifNotEmpty: [ self renderTopicos: topicos on: aCanvas ]
]

{ #category : #rendering }
BuscadorDeTopicosComponent >> renderTopPageOn: aCanvas [
	aCanvas paragraph: (BasicComponent newWithParent: self)
]

{ #category : #rendering }
BuscadorDeTopicosComponent >> renderTopicos: topicos on: aCanvas [
	^ aCanvas
		unorderedList: [ topicos
				do: [ :top | 
					aCanvas
						listItem: [ aCanvas
								text: top nombre;
								space: 5.
							aCanvas
								tableData: [ (self session usuario topicosSeguidos
										anySatisfy: [ :each | each = top ])
										ifTrue: [ aCanvas anchor
												callback: [ self session usuario dejarSeguirTopico: top ];
												with: 'Dejar de Seguir ' ]
										ifFalse: [ aCanvas anchor
												callback: [ self session usuario agregarTopico: top ];
												with: 'Seguir ' ] ] ] ] ]
]

{ #category : #accessing }
BuscadorDeTopicosComponent >> searchText [
	^ searchText
]

{ #category : #accessing }
BuscadorDeTopicosComponent >> searchText: anObject [
	searchText := anObject
]
