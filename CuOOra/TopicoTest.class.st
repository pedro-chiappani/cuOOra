Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#classInstVars : [
		'top'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
TopicoTest class >> setUp [
	top := Topico titulo: 'Algoritmos' descripcion: 'Abarca todas las preguntas relacionadas con algortimos'.
]
