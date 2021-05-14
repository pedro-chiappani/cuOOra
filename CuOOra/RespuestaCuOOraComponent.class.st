Class {
	#name : #RespuestaCuOOraComponent,
	#superclass : #WAComponent,
	#instVars : [
		'texto',
		'pregunta',
		'sistema'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
RespuestaCuOOraComponent class >> crearRespuesta: unaPregunta [

^(self new)iniciar:unaPregunta
]

{ #category : #utility }
RespuestaCuOOraComponent >> contadorPuntuacion: unaPublicacion on: aCanvas [
	aCanvas
		text: '' , unaPublicacion puntuacionTotal printString , ' Puntuacion '.
	aCanvas break
]

{ #category : #'as yet unclassified' }
RespuestaCuOOraComponent >> iniciar: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #initialization }
RespuestaCuOOraComponent >> initialize [
	super initialize.
	sistema := CuOOra soleInstance
]

{ #category : #utility }
RespuestaCuOOraComponent >> likeDislikeButtons: unaPublicacion on: aCanvas [
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

{ #category : #callback }
RespuestaCuOOraComponent >> publicarPregunta [
	^ sistema crearRespuesta: pregunta texto: texto usuario: self session usuario
]

{ #category : #rendering }
RespuestaCuOOraComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas.
	self renderPregunta: pregunta on: aCanvas.
	self respuestaForm: aCanvas.
]

{ #category : #rendering }
RespuestaCuOOraComponent >> renderListaDeTopicos: topicos on: aCanvas [
	| t |
	aCanvas
		paragraph: [ t := topicos first: topicos size - 1.
			aCanvas text: 'Topicos: '.
			t do: [ :each | aCanvas text: '' , each nombre , ', ' ].
			aCanvas text: topicos last nombre ]
]

{ #category : #rendering }
RespuestaCuOOraComponent >> renderPregunta: unaPregunta on: aCanvas [
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
			aCanvas strong: unaPregunta usuario nombre printString.
			aCanvas anchor
				callback: [ self
						call: (VerUsuarioComponent crearUsuarioComponent: unaPregunta usuario) ];
				with: [ aCanvas button with: unaPregunta usuario nombre ].
			aCanvas
				text: ' | ' , unaPregunta respuestas size printString , ' respuesta/s' ].
	self contadorPuntuacion: unaPregunta on: aCanvas.
	self likeDislikeButtons: unaPregunta on: aCanvas.
	aCanvas horizontalRule
]

{ #category : #rendering }
RespuestaCuOOraComponent >> renderTopPageOn: aCanvas [
	aCanvas paragraph: (BasicComponent newWithParent: self)
]

{ #category : #'as yet unclassified' }
RespuestaCuOOraComponent >> respuestaForm: aCanvas [
	aCanvas
		form: [ 
			aCanvas strong: 'Respuesta: '.
			aCanvas break.
			(aCanvas textArea)
                callback: [ :value |  texto:= value];
                id: 'miAreaDeTexto';
                with: ''.
			aCanvas break.
			aCanvas break.
			aCanvas submitButton
				callback: [self publicarPregunta.
							  self answer.
							];
				value: 'Publicar'.
			aCanvas submitButton
				callback: [self answer.];
				value: 'Cancelar'].
]
