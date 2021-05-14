Class {
	#name : #VerPreguntaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta',
		'sistema'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'instance creation' }
VerPreguntaComponent class >> crearPreguntaComponent: unaPregunta [
	| componentePregunta |
	componentePregunta := self new.
	componentePregunta pregunta:  unaPregunta.
	^ componentePregunta
]

{ #category : #utility }
VerPreguntaComponent >> contadorPuntuacion: unaPublicacion on: aCanvas [
	aCanvas
		text: '' , unaPublicacion puntuacionTotal printString , ' Puntuacion '.
	aCanvas break
]

{ #category : #initialization }
VerPreguntaComponent >> initialize [
	super initialize.
	sistema := CuOOra soleInstance
]

{ #category : #utility }
VerPreguntaComponent >> likeDislikeButtons: unaPublicacion on: aCanvas [
	aCanvas anchor
		callback:
				[ unaPublicacion registrarPuntuacion: self session usuario valor: true ];
		with: [ aCanvas button with: 'Like' ].
	aCanvas anchor
		callback: [ unaPublicacion
				registrarPuntuacion: self session usuario
				valor: false ];
		with: [ aCanvas button with: 'Dislike' ]
]

{ #category : #accessing }
VerPreguntaComponent >> pregunta:unaPregunta [
	pregunta:=unaPregunta 
]

{ #category : #initialization }
VerPreguntaComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas.
	self renderPregunta: pregunta on: aCanvas
	"self renderListaDeRespuestasOn: aCanvas."
]

{ #category : #rendering }
VerPreguntaComponent >> renderListaDeTopicos: topicos on: aCanvas [
	| t |
	aCanvas
		paragraph: [ t := topicos first: topicos size - 1.
			aCanvas text: 'Topicos: '.
			t do: [ :each | aCanvas text: '' , each nombre , ', ' ].
			aCanvas text: topicos last nombre ]
]

{ #category : #rendering }
VerPreguntaComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas heading
		level: 2;
		with: unaPregunta titulo.
	aCanvas paragraph: unaPregunta texto.
	self renderListaDeTopicos: unaPregunta topicos on: aCanvas.
	aCanvas
		paragraph: [ aCanvas text: 'Realizada por '.
			aCanvas anchor
				callback: [ self
						call:
							(VerUsuarioComponent crearUsuarioComponent: unaPregunta usuario) ];
				with: [ aCanvas button with: unaPregunta usuario nombre ].
			aCanvas
				text: ' | ' , unaPregunta respuestas size printString , ' respuesta/s' ].
	self contadorPuntuacion: unaPregunta on: aCanvas.
	self likeDislikeButtons: unaPregunta on: aCanvas.
	aCanvas horizontalRule
]

{ #category : #rendering }
VerPreguntaComponent >> renderTopPageOn: aCanvas [
	aCanvas paragraph: (BasicComponent newWithParent: self)
]
