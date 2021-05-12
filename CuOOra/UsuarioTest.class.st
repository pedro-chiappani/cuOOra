Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usu'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	usu := Usuario nombre: 'Joaquin' contra: 'abc123'.

]

{ #category : #tests }
UsuarioTest >> testAgregarPregunta [
	|preg|.
	preg:= Pregunta new.
	usu agregarPregunta: preg.
	usu agregarPregunta: preg.
	usu agregarPregunta: preg.
	self assert: usu preguntas size equals: 3. 
]

{ #category : #tests }
UsuarioTest >> testAgregarSeguidor [
	|seg|.
	seg:= Usuario nombre: 'Pepe' contra: '123'. 
	usu agregarSeguidor: seg.
	seg:= Usuario nombre: 'Feli' contra: '321'. 
	usu agregarSeguidor: seg.
	self assert: (usu sigoA: seg). 		
]

{ #category : #tests }
UsuarioTest >> testAgregarTopico [
	|topic topic2|.
	topic := Topico new.
	usu agregarTopico: topic.
	topic2 := Topico new.
	usu agregarTopico: topic2.
	self assert: usu topicosSeguidos size equals: 2. 		
	
	
]

{ #category : #tests }
UsuarioTest >> testCalcularPuntaje [
	|preg res|
	preg := Pregunta new.
	res := Respuesta new.
	preg registrarPuntuacion: (Usuario new) valor: true.
	preg registrarPuntuacion: (Usuario new) valor: true.
	usu agregarPregunta: preg.
	res registrarPuntuacion: (Usuario new) valor: true.
	usu agregarRespuesta: res.
	self assert: usu calcularPuntaje equals: 73.
]

{ #category : #tests }
UsuarioTest >> testObtenerPreguntasRelevantes [
	|tops usu2 preg preg1 top top2 tops2 preg2|
	tops:= OrderedCollection new.
	tops2 := OrderedCollection new.
	tops add: (top := Topico titulo: 'este topico' descripcion: 'topico A'). tops add: (top2 := Topico titulo: 'otro titulo' descripcion: 'topico B' ).
	preg := Pregunta titulo: 'esta pregunta' descripcion: 'es una pregunta importante' usuario: (usu2 := Usuario nombre: 'Mario' contra: '123') topicos: tops.
	tops remove: top.
	usu2 agregarPregunta: preg.
	preg1 := Pregunta titulo: 'otra pregunta' descripcion: 'esta no es tan importante' usuario: (Usuario nombre: 'Juan' contra: '321' ) topicos: tops.
	tops2 add: top2.
	preg2 := Pregunta titulo: 'ultimapregunta' descripcion: 'esta no es taaaan importante' usuario: (Usuario nombre: 'Juan' contra: '321' ) topicos: tops2.
	top preguntas: preg. top2 preguntas: preg. top preguntas: preg1. top2 preguntas: preg2.
	usu agregarSeguidor: usu2.
	usu agregarTopico: top.
	self assert: (usu obtenerPreguntasRelevantes includes: preg).
	self assert: (usu obtenerPreguntasRelevantes includes: preg1).
	self deny: (usu obtenerPreguntasRelevantes includes: preg2).
]

{ #category : #tests }
UsuarioTest >> testRespuestas [
	|resp preg topicos aux|.
	topicos := OrderedCollection new.
	aux := Topico new. topicos add: aux.
	aux := Topico new. topicos add: aux.
	preg := Pregunta titulo: 'titTest' descripcion: 'descTest'  usuario: usu topicos: topicos.
	usu agregarPregunta: preg.
	
	resp:= Respuesta new.
	resp pregunta: preg.
	
	usu agregarRespuesta: resp.
	usu agregarRespuesta: resp.
	usu agregarRespuesta: resp.
	usu agregarRespuesta: resp.
	self assert: usu respuestas size equals: 4. 	
		
	usu eliminarRespuestasPregunta: preg .
	self assert: usu respuestas size equals: 0. 			
]
