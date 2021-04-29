Class {
	#name : #Pregunta,
	#superclass : #Post,
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
Pregunta >> puntuacionTotal [
	^puntuacion sum: [ :each | each puntuacion ]
]

{ #category : #accessing }
Pregunta >> registrarPuntuacion: unUsuario valor: unValor [
	| punt aux |
	aux := puntuacion
		detect: [ :each | each usuario == unUsuario ]
		ifNone: [ punt := Puntuacion usuario: unUsuario.
			unValor > 0
				ifTrue: [ punt positivo ]
				ifFalse: [ punt negativo ].
			puntuacion add: punt ].
	aux
		ifNotNil: [ aux reset.
			unValor > 0
				ifTrue: [ aux positivo ]
				ifFalse: [ aux negativo ] ]
]

{ #category : #accessing }
Pregunta >> respuestas [ 
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: unaRespuesta [
	respuestas add: unaRespuesta
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]
