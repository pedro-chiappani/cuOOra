Class {
	#name : #Pregunta,
	#superclass : #Posteo,
	#instVars : [
		'titulo',
		'topicos',
		'respuestas'
	],
	#category : #'CuOOra-Models'
}

{ #category : #creation }
Pregunta class >> titulo: unTitulo descripcion: unaDescrip usuario: unUsuario topicos: unosTopicos [
	^self new
		titulo: unTitulo;
		texto: unaDescrip; 
		usuario: unUsuario;
		agregarTopicos: unosTopicos;
		yourself
]

{ #category : #accessing }
Pregunta >> agregarTopicos: unosTopicos [
	topicos addAll: unosTopicos
]

{ #category : #accessing }
Pregunta >> eliminarRespuestas [
	respuestas removeAll.
]

{ #category : #initialization }
Pregunta >> initialize [ 
	super initialize.
	topicos := OrderedCollection new.
	fechayhora := DateAndTime now.
	respuestas := OrderedCollection new.
	puntuacion := OrderedCollection  new.
	
]

{ #category : #accessing }
Pregunta >> obtenerRespuestasPregunta [
	^respuestas asSortedCollection: [ :unaRes :otraRes | unaRes puntuacionTotal > otraRes puntuacionTotal ]
]

{ #category : #accessing }
Pregunta >> respuestas [ 
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: unaRespuesta [
	respuestas add: unaRespuesta
]

{ #category : #'as yet unclassified' }
Pregunta >> tenesRespuesta: unaRespuesta [
	^respuestas includes: unaRespuesta
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
Pregunta >> topicos [ 
	^topicos
]
