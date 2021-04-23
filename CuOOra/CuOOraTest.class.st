Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuo'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	cuo := CuOOra new.
]

{ #category : #tests }
CuOOraTest >> testCrearPregunta [
	|usu tops top1 top2|
	usu := Usuario nombre: 'Manuel' contra: 'goa123'.
	top1 := Topico titulo: 'Algoritmos' descripcion: 'Este topico es para preguntas relacionadas con algoritmos de cualquier tipo'.
	top2:= Topico titulo: 'Python' descripcion: 'Este topico es para preguntas relacionadas con Python'.
	tops := OrderedCollection new.
	tops add: top1.
	tops add: top2.
	cuo crearPregunta: 'Como es la sentencia For en Python?' topicos: tops decripcion: 'Estoy empezando a programar con python y quiero saber como es el for' usuario: usu.
	self assert: (top1 preguntas detect: [:each | each usuario == usu]) usuario equals: usu.
	self assert: (top2 preguntas detect: [:each | each usuario == usu]) usuario equals: usu.
]

{ #category : #tests }
CuOOraTest >> testCrearRespuesta [
	|usu usu2 tops top1 top2 preg|
	usu := Usuario nombre: 'Manuel' contra: 'goa123'.
	usu2 := Usuario nombre: 'jaja' contra: 'mamama'.
	top1 := Topico titulo: 'Algoritmos' descripcion: 'Este topico es para preguntas relacionadas con algoritmos de cualquier tipo'.
	top2:= Topico titulo: 'Python' descripcion: 'Este topico es para preguntas relacionadas con Python'.
	tops := OrderedCollection new.
	tops add: top1.
	tops add: top2.
	cuo crearPregunta: 'Como es la sentencia For en Python?' topicos: tops decripcion: 'Estoy empezando a programar con python y quiero saber como es el for' usuario: usu.
	preg := cuo preguntas	first.
	cuo crearRespuesta: preg texto: 'el for se hace bla bla bla' usuario: usu2.
	self assert: (cuo respuestas detect: [:each | each pregunta == preg]) pregunta equals: preg
	
]

{ #category : #tests }
CuOOraTest >> testCrearTopico [
	cuo crearTopico: 'Algoritmos' descrip: 'Aca se pueden hacer consultas relacionadas con los algoritmos'.
	self assert: (cuo topicos detect: [:each | each nombre == 'Algoritmos']) nombre equals: 'Algoritmos'
]

{ #category : #tests }
CuOOraTest >> testCrearUsuario [
	cuo crearUsuario: 'Juan' pass: 'hila123'.
	self assert: (cuo usuarios detect: [:each | each nombre == 'Juan']) nombre equals: 'Juan'
]
