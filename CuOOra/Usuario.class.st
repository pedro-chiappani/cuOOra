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
	#category : #'CuOOra-models'
}

{ #category : #creation }
Usuario class >> nombre:unNombre contra: unaPass [
	^self new 
		nombre: unNombre;
		contra: unaPass;
		yourself
]

{ #category : #'as yet unclassified' }
Usuario >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta
]

{ #category : #'as yet unclassified' }
Usuario >> agregarRespuesta: unaRespuesta [
	respuestas add: unaRespuesta 
]

{ #category : #'as yet unclassified' }
Usuario >> agregarSeguidor: unUsuario [
	seguidos add: unUsuario.
]

{ #category : #'as yet unclassified' }
Usuario >> agregarTopico: unTopico [
	topicosSeguidos add: unTopico.
]

{ #category : #accessing }
Usuario >> contra [
	^ contra
]

{ #category : #accessing }
Usuario >> contra: anObject [
	contra := anObject
]

{ #category : #'as yet unclassified' }
Usuario >> eliminarRespuestasPregunta: unaPregunta [
	respuestas remove: [ :each | each pregunta = unaPregunta ]
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
	seguidos := OrderedCollection new.
	topicosSeguidos := OrderedCollection new.
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
Usuario >> preguntas [
	^preguntas
]

{ #category : #'as yet unclassified' }
Usuario >> respuestas [ 
	^respuestas
]

{ #category : #'as yet unclassified' }
Usuario >> seguidos [
	^seguidos
]

{ #category : #accessing }
Usuario >> topicosSeguidos [
	^topicosSeguidos
]
