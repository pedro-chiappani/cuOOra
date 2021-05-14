Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuo',
		'usu',
		'usu2',
		'tops',
		'top1',
		'top2',
		'preg',
		'res'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	super setUp.
	cuo := CuOOra new.
	usu := cuo crearUsuario: 'Juan' pass: 'hila123'.
	usu2 := cuo crearUsuario: 'Manuel' pass: 'hila123'.
	top1 := cuo
		crearTopico: 'Algoritmos'
		descrip:
			'Este topico es para preguntas relacionadas con algoritmos de cualquier tipo'.
	top2 := cuo
		crearTopico: 'Python'
		descrip: 'Este topico es para preguntas relacionadas con Python'.
	tops := OrderedCollection new.
	tops add: top1.
	tops add: top2.
	preg := cuo
		crearPregunta: 'Como es la sentencia For en Python?'
		topicos: tops
		descripcion: 'Estoy empezando a programar con python y quiero saber como es el for'
		usuario: usu.
	res := cuo
		crearRespuesta: preg
		texto: 'el for se hace bla bla bla'
		usuario: usu2
]

{ #category : #tests }
CuOOraTest >> testCrearPregunta [
	self assert: (top1 tenesPregunta: preg).
	self assert: (top2 tenesPregunta: preg).
]

{ #category : #tests }
CuOOraTest >> testCrearRespuesta [
	self assert: (preg tenesRespuesta: res)
	
]

{ #category : #tests }
CuOOraTest >> testCrearTopico [
	self deny: cuo topicos isEmpty
]

{ #category : #tests }
CuOOraTest >> testCrearUsuario [
	self assert: (cuo usuarios size) equals: 2.
	cuo crearUsuario: 'Mariano' pass: '1234'.
	self assert: (cuo usuarios size) equals: 3. 
]

{ #category : #tests }
CuOOraTest >> testEliminarPregunta [
	| preg1 preg2 |
	preg1 := cuo
		crearPregunta: 'Como es la sentencia While en Python?'
		topicos: tops
		descripcion:
			'Estoy empezando a programar con python y quiero saber como es el while'
		usuario: usu.
	preg2 := cuo
		crearPregunta: 'Como es la sentencia Case en Python?'
		topicos: tops
		descripcion:
			'Estoy empezando a programar con python y quiero saber como es el case'
		usuario: usu.
	self assert: (cuo preguntas includes: preg).
	self assert: (cuo preguntas includes: preg1).
	self assert: (cuo preguntas includes: preg2).
	self assert: cuo respuestas size equals: 1.
	self assert: (res tuPreguntaEs: preg).
	self assert: (usu tenesPregunta: preg).
	self assert: (top1 tenesPregunta: preg).
	cuo eliminarPregunta: preg.
	self assert: cuo respuestas size equals: 0.
	self deny: (cuo preguntas includes: preg) equals: true.
	self deny: (usu tenesPregunta: preg).
	self deny: (top1 tenesPregunta: preg)
]
