Class {
	#name : #Respuesta,
	#superclass : #Post,
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

{ #category : #'as yet unclassified' }
Respuesta >> registrarPuntuacion: unUsuario valor: unValor [
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
