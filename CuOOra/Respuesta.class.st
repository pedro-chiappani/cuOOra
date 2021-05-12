Class {
	#name : #Respuesta,
	#superclass : #Posteo,
	#instVars : [
		'pregunta'
	],
	#category : #'CuOOra-Models'
}

{ #category : #creation }
Respuesta class >> texto: unTexto pregunta: unaPregunta [
	^self new 
		texto: unTexto;
		pregunta: unaPregunta
		yourself
]

{ #category : #initialization }
Respuesta >> initialize [
	super initialize.
	fechayhora:= DateAndTime now.
	puntuacion := OrderedCollection  new.
]

{ #category : #accessing }
Respuesta >> pregunta [
	^pregunta
]

{ #category : #accessing }
Respuesta >> pregunta: unaPregunta [
	pregunta:= unaPregunta
]

{ #category : #'as yet unclassified' }
Respuesta >> tuPreguntaEs: unaPregunta [
	^pregunta = unaPregunta.
]
