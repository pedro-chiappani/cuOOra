Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntas'
	],
	#category : #'CuOOra-Models'
}

{ #category : #creation }
Topico class >> titulo:unTitulo descripcion: unaDescripcion [
	^self new 
		nombre: unTitulo ;
		descripcion: unaDescripcion ;
		yourself
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Topico >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
Topico >> eliminarPregunta: unaPregunta [
	preguntas remove: unaPregunta
]

{ #category : #initialization }
Topico >> initialize [ 
	super initialize.
	preguntas:= OrderedCollection new.
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #accessing }
Topico >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
Topico >> preguntas [ 
	^preguntas
]

{ #category : #accessing }
Topico >> preguntas: unaPregunta [
	preguntas add: unaPregunta
]

{ #category : #'as yet unclassified' }
Topico >> tenesPregunta: unaPregunta [
	^preguntas includes: unaPregunta
]
