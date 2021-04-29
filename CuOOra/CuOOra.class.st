Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos',
		'preguntas',
		'respuestas'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-Models'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'as yet unclassified' }
CuOOra >> crearPregunta: unTitulo topicos: unosTopicos decripcion: unaDescrip usuario: unUsuario [
	|preg|
	preg := Pregunta titulo: unTitulo descripcion: unaDescrip usuario: unUsuario topicos: unosTopicos.
	preguntas add: preg.
	unUsuario agregarPregunta: preg.
	unosTopicos do: [ :each | each preguntas: preg ]
]

{ #category : #'as yet unclassified' }
CuOOra >> crearRespuesta: unaPregunta texto: unTexto usuario: unUsuario [
	|res|
	res := Respuesta texto: unTexto pregunta: unaPregunta .
	respuestas add: res.
	unaPregunta respuestas: res.
	unUsuario agregarRespuesta: res
]

{ #category : #'as yet unclassified' }
CuOOra >> crearTopico: unTitulo descrip: unaDescrip [
	|top|
	top := Topico titulo: unTitulo descripcion: unaDescrip.
	topicos add: top.
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: unNombre pass: unaPass [
	|usu|
	usu := Usuario nombre: unNombre contra: unaPass.
	usuarios add: usu. 
]

{ #category : #'as yet unclassified' }
CuOOra >> eliminarPregunta: unaPregunta [
	respuestas removeAllSuchThat: [:each | each pregunta == unaPregunta ].
	unaPregunta eliminarRespuestas.
	usuarios
		do: [ :usu | 
			usu preguntas
				do: [ :preg | 
					preg = unaPregunta
						ifTrue: [ preg eliminarRespuestas.
							preg remove ].
					usu eliminarRespuestasPregunta: unaPregunta ] ]
]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	preguntas:= OrderedCollection new.
	topicos := OrderedCollection new.
	respuestas:= OrderedCollection new.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #accessing }
CuOOra >> respuestas [
	^ respuestas
]

{ #category : #'as yet unclassified' }
CuOOra >> seguirTopico: unTopico usuario: unUsuario [
	unUsuario agregarTopico: unTopico 
]

{ #category : #'as yet unclassified' }
CuOOra >> seguirUsuario: unUsuario usuario: otroUsuario [
	otroUsuario agregarSeguidor: unUsuario
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #utility }
CuOOra >> usuarioConEmail: anEmail protegidoPor: aPassword [
	^ usuarios 
		detect: [ :each | each email = anEmail & (each password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
