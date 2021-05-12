Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topic'
	],
	#classInstVars : [
		'top'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
TopicoTest class >> setUp [
	top := Topico titulo: 'Algoritmos' descripcion: 'Abarca todas las preguntas relacionadas con algortimos'.
]

{ #category : #running }
TopicoTest >> setUp [
	topic := Topico new.

]

{ #category : #tests }
TopicoTest >> testEliminarPregunta [ 
	|preg |.
	preg:= Pregunta new.
	topic preguntas: preg.
	self assert: (topic preguntas includes: preg) equals: true.
	topic eliminarPregunta: preg.
	self assert: topic preguntas size equals: 0.	
]

{ #category : #tests }
TopicoTest >> testPreguntas [
	|preg|.
	preg:= Pregunta new.
	topic preguntas: preg.
	topic preguntas: preg.
	
	self assert: (topic preguntas includes: preg) equals: true.
	
]
