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

{ #category : #'as yet unclassified' }
Pregunta >> agregarTopicos: unosTopicos [
	topicos addAll: unosTopicos
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Pregunta >> obtenerRespuestasPregunta [
	^respuestas asSortedCollection: [ :unaRes :otraRes | unaRes puntuacionTotal > otraRes puntuacionTotal ]
]

{ #category : #'as yet unclassified' }
Pregunta >> puntuacionTotal [
	^puntuacion sum: [ :each | each puntuacion ]
]

{ #category : #'as yet unclassified' }
Pregunta >> registrarPuntuacion: unUsuario valor: unValor [
	| punt |
	puntuacion
		detect: [ :each | 
			each usuario == unUsuario
				ifTrue: [ each reset.
					unValor > 0
						ifTrue: [ each positivo ]
						ifFalse: [ each negativo ] ] ]
		ifNone: [ punt := Puntuacion usuario: unUsuario.
			unValor > 0
				ifTrue: punt positivo
				ifFalse: punt negativo.
			puntuacion add: punt ]
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
