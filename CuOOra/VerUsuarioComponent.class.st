Class {
	#name : #VerUsuarioComponent,
	#superclass : #WAComponent,
	#instVars : [
		'sistema',
		'usuario'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
VerUsuarioComponent class >> crearUsuarioComponent: unUsuario [
	| componentUsuario |
	componentUsuario := self new.
	componentUsuario usuario:  unUsuario.
	^ componentUsuario
]

{ #category : #utility }
VerUsuarioComponent >> contadorPuntuacion: unaPublicacion on: aCanvas [
	aCanvas
		text: '' , unaPublicacion puntuacionTotal printString , ' Puntuacion '.
	aCanvas break
]

{ #category : #initialization }
VerUsuarioComponent >> initialize [ 
super initialize .
sistema:=CuOOra soleInstance .
]

{ #category : #utility }
VerUsuarioComponent >> likeDislikeButtons: unaPublicacion on: aCanvas [
	aCanvas anchor
		callback: [ unaPublicacion registrarPuntuacion: self session usuario valor: 1 ];
		with: [ aCanvas button with: 'Like' ].
	aCanvas anchor
		callback: [ unaPublicacion registrarPuntuacion: self session usuario valor: -1 ];
		with: [ aCanvas button with: 'Dislike' ]
]

{ #category : #rendering }
VerUsuarioComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas.
	self renderTitulo: aCanvas.
	self renderListaDePreguntas: usuario preguntas on: aCanvas
]

{ #category : #rendering }
VerUsuarioComponent >> renderListaDePreguntas: listado on: aCanvas [
	listado  do: [ :each | self renderPregunta: each on: aCanvas ]
]

{ #category : #rendering }
VerUsuarioComponent >> renderListaDeTopicos: topicos on: aCanvas [
	| t |
	aCanvas
		paragraph: [ t := topicos first: topicos size - 1.
			aCanvas text: 'Topicos: '.
			t do: [ :each | aCanvas text: '' , each nombre , ', ' ].
			aCanvas text: topicos last nombre ]
]

{ #category : #rendering }
VerUsuarioComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas anchor
		callback: [ self
				call: (VerPreguntaComponent crearPreguntaComponent: unaPregunta) ];
		with: [ aCanvas heading
				level: 2;
				with: unaPregunta titulo ].
	aCanvas paragraph: unaPregunta texto.
	self renderListaDeTopicos: unaPregunta topicos on: aCanvas.
	aCanvas
		paragraph: [ aCanvas text: 'Realizada por '.
			aCanvas strong: unaPregunta usuario nombre printString .
			aCanvas
				text: ' | ' , unaPregunta respuestas size printString , ' respuesta/s' ].
	self contadorPuntuacion: unaPregunta on: aCanvas.
	self likeDislikeButtons: unaPregunta on: aCanvas.
	aCanvas horizontalRule
]

{ #category : #rendering }
VerUsuarioComponent >> renderSeguirDejarDeSeguirButton: aCanvas [
	aCanvas
		tableData: [ (self session usuario seguidos anySatisfy: [ :each | each = usuario ])
				ifTrue: [ aCanvas anchor
						callback: [ self session usuario dejarSeguirUsuario: usuario ];
						with: 'Dejar de Seguir ' ]
				ifFalse: [ aCanvas anchor
						callback: [ self session usuario agregarSeguidor: usuario ];
						with: 'Seguir ' ] ]
]

{ #category : #rendering }
VerUsuarioComponent >> renderTitulo: aCanvas [
	aCanvas
		table: [ aCanvas
				tableRow: [ aCanvas
						tableData: [ aCanvas heading
								level: 1;
								with: 'Preguntas de ' , usuario nombre ].
					usuario = self session usuario
						ifFalse: [ 
							self renderSeguirDejarDeSeguirButton: aCanvas ] ] ]
]

{ #category : #rendering }
VerUsuarioComponent >> renderTopPageOn: aCanvas [
	aCanvas paragraph: (BasicComponent newWithParent: self)
]

{ #category : #accessing }
VerUsuarioComponent >> usuario: unUsuario [
usuario :=unUsuario 
]
