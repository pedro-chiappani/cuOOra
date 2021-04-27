Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contra',
		'fechayhora',
		'preguntas',
		'seguidos',
		'topicosSeguidos',
		'respuestas'
	],
	#category : #'CuOOra-Models'
}

{ #category : #creation }
Usuario class >> nombre:unNombre contra: unaPass [
	^self new 
		nombre: unNombre;
		contra: unaPass;
		yourself
]

{ #category : #accessing }
Usuario >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta
]

{ #category : #accessing }
Usuario >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta 
]

{ #category : #accessing }
Usuario >> agregarSeguidor: unUsuario [
	self == unUsuario ifFalse: [ seguidos add: unUsuario].
]

{ #category : #accessing }
Usuario >> agregarTopico: unTopico [
	topicosSeguidos add: unTopico.
]

{ #category : #'as yet unclassified' }
Usuario >> calcularPuntaje [
	|puntaje|
	puntaje := preguntas sum: [ :each | 20 + each puntuacionTotal ].
	puntaje := puntaje + (respuestas select: [:each | each usuario ~= self]) sum: [ :each | 50 + each puntuacionTotal ].
	^puntaje
]

{ #category : #accessing }
Usuario >> contra [
	^ contra
]

{ #category : #accessing }
Usuario >> contra: anObject [
	contra := anObject
]

{ #category : #accessing }
Usuario >> eliminarRespuestasPregunta: unaPregunta [
	respuestas
		removeAllSuchThat: [ :each | each pregunta == unaPregunta ]
]

{ #category : #accessing }
Usuario >> fechayhora [
	^ fechayhora
]

{ #category : #initialize }
Usuario >> initialize [
	fechayhora := DateAndTime now.
	preguntas := OrderedCollection new.
	respuestas:= OrderedCollection new.
	seguidos := Set new.
	topicosSeguidos := Set new.
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #'as yet unclassified' }
Usuario >> obtenerPreguntasRelevantes [
	| aux |
	aux := OrderedCollection new.
	aux
		addAll:
			(seguidos
				collect: [ :each | each preguntas asSet collect: [ :preg | preg ] ]).
	aux
		addAll:
			(topicosSeguidos
				collect: [ :each | each preguntas asSet collect: [ :preg | preg ] ]).
	^ aux
]

{ #category : #'as yet unclassified' }
Usuario >> obtenerPreguntasUsuario [
	^preguntas
]

{ #category : #'as yet unclassified' }
Usuario >> obtenerRespuestasUsuario [
	^respuestas
]

{ #category : #accessing }
Usuario >> preguntas [
	^preguntas
]

{ #category : #accessing }
Usuario >> respuestas [ 
	^respuestas
]

{ #category : #accessing }
Usuario >> seguidos [
	^seguidos
]

{ #category : #accessing }
Usuario >> topicosSeguidos [
	^topicosSeguidos
]
