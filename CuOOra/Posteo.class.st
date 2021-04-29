Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'texto',
		'fechayhora',
		'usuario',
		'puntuacion'
	],
	#category : #'CuOOra-Models'
}

{ #category : #accessing }
Posteo >> fechayhota [
	^fechayhora 
]

{ #category : #initialization }
Posteo >> initialize [ 
	fechayhora := DateAndTime now.
	puntuacion := OrderedCollection new.
]

{ #category : #accessing }
Posteo >> puntuacionTotal [ 
	^self subclassResponsibility 
]

{ #category : #accessing }
Posteo >> puntucacion [
	^puntuacion
]

{ #category : #accessing }
Posteo >> texto [ 
	^texto
]

{ #category : #accessing }
Posteo >> texto: unTexto [
	texto:= unTexto 
]

{ #category : #accessing }
Posteo >> usuario [ 
	^usuario
]

{ #category : #accessing }
Posteo >> usuario: unUsuario [
	usuario:= unUsuario 
]
