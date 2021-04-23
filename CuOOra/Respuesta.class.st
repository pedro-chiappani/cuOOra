Class {
	#name : #Respuesta,
	#superclass : #Object,
	#instVars : [
		'texto',
		'fechayhora',
		'pregunta',
		'puntuacion',
		'usuario'
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
	puntuacion := Puntuacion new.
]

{ #category : #accessing }
Respuesta >> pregunta [
	^pregunta
]

{ #category : #accessing }
Respuesta >> pregunta: unaPregunta [
	pregunta:= unaPregunta
]

{ #category : #accessing }
Respuesta >> puntuacion [ 	
	^puntuacion
]

{ #category : #accessing }
Respuesta >> puntuacionTotal [
	^puntuacion sum: [ :each | each puntuacion ]
]

{ #category : #'as yet unclassified' }
Respuesta >> registrarPuntuacion: unaPuntuacion [
	puntuacion add: unaPuntuacion
]

{ #category : #accessing }
Respuesta >> texto [
	^texto
]

{ #category : #accessing }
Respuesta >> texto: unTexto [
	texto := unTexto 
]
