Class {
	#name : #CrearPreguntaCuOOraComponent,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'sistema'
	],
	#category : #'CuOOra-UI'
}

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> descripcion: anObject [
	^ descripcion := anObject
]

{ #category : #initialization }
CrearPreguntaCuOOraComponent >> initialize [
	super initialize.
	sistema:= CuOOra soleInstance 
]

{ #category : #callback }
CrearPreguntaCuOOraComponent >> publicarPregunta [
	sistema
		crearPregunta: titulo
		topicos: self topicosIngresados
		descripcion: descripcion
		usuario: self session usuario
]

{ #category : #rendering }
CrearPreguntaCuOOraComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas.
	aCanvas break.
	aCanvas heading
		level: 2;
		with: 'Nueva pregunta'.
	aCanvas
		form: [ aCanvas text: 'Titulo: '.
			aCanvas break.
			aCanvas textInput on: #titulo of: self.
			aCanvas break.
			aCanvas break.
			aCanvas text: 'Descripcion: '.
			aCanvas break.
			aCanvas textArea
				callback: [ :value | descripcion := value ];
				id: 'miAreaDeTexto';
				with: ''.
			aCanvas break.
			aCanvas break.
			aCanvas text: 'Topicos: '.
			aCanvas break.
			aCanvas textInput on: #topicos of: self.
			aCanvas break.
			aCanvas break.
			aCanvas submitButton
				callback: [ self publicarPregunta.
					self answer ];
				value: ' Publicar '.
			aCanvas submitButton
				callback: [ self answer ];
				value: ' Cancelar ' ]
]

{ #category : #utility }
CrearPreguntaCuOOraComponent >> renderTopPageOn: aCanvas [
	aCanvas
		paragraph: (BasicComponent newWithParent: self)
]

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
CrearPreguntaCuOOraComponent >> topicos: anObject [
	topicos := anObject
]

{ #category : #callback }
CrearPreguntaCuOOraComponent >> topicosIngresados [
	|listaTopicos|
	listaTopicos := OrderedCollection new.
	listaTopicos :=( topicos findBetweenSubstrings: ', ') 
		collect: [ :each |
			((sistema topicos) detect: [ :t | t nombre = each ] 
										 	ifNone: [sistema crearTopico:each  descrip: '']).
		 	
			].
	^listaTopicos
]
