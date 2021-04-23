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
	self assert: usu seguidos size equals: 2. 		
]

{ #category : #tests }
UsuarioTest >> testAgregarTopico [
	|topic|.
	topic := Topico new.
	usu agregarTopico: topic.
	usu agregarTopico: topic.
	self assert: usu topicosSeguidos size equals: 2. 		
	
	
]

{ #category : #tests }
UsuarioTest >> testRespuestas [
	|resp preg|.
	preg := Pregunta titulo: 'titTest' descripcion: 'descTest'  usuario: usu.
	
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
