Class {
	#name : #Pregunta,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'descripcion',
		'fechayhora',
		'topico',
		'usuario',
		'puntuacion',
		'respuestas'
	],
	#category : #'CuOOra-models'
}

{ #category : #creation }
Pregunta class >> titulo: unTitulo descripcion: unaDescrip usuario: unUsuario [
	^self new
		titulo: unTitulo;
		descripcion: unaDescrip; 
		usuario: unUsuario;
		yourself
]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Pregunta >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #'as yet unclassified' }
Pregunta >> eliminarRespuestas [
	respuestas removeAll.
]

{ #category : #initialization }
Pregunta >> initialize [ 
	super initialize.
	fechayhora := DateAndTime now.
	respuestas := OrderedCollection new.
	puntuacion := Puntuacion new.
	
]

{ #category : #accessing }
Pregunta >> puntuacion [
	^ puntuacion
]

{ #category : #'as yet unclassified' }
Pregunta >> puntuacionTotal [
	^puntuacion sum: [ :each | each puntuacion]
]

{ #category : #'as yet unclassified' }
Pregunta >> registrarPuntuacion: unaPuntuacion [
	puntuacion add: unaPuntuacion
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

{ #category : #accessing }
Pregunta >> usuario: unUsuario [ 
	usuario:= unUsuario
]
