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

{ #category : #accessing }
CuOOra >> crearPregunta: unTitulo topicos: unosTopicos decripcion: unaDescrip usuario: unUsuario [
	|preg|
	preg := Pregunta titulo: unTitulo descripcion: unaDescrip usuario: unUsuario topicos: unosTopicos.
	preguntas add: preg.
	unUsuario agregarPregunta: preg.
	unosTopicos do: [ :each | each preguntas: preg ]
]

{ #category : #accessing }
CuOOra >> crearRespuesta: unaPregunta texto: unTexto usuario: unUsuario [
	|res|
	res := Respuesta texto: unTexto pregunta: unaPregunta .
	respuestas add: res.
	unaPregunta respuestas: res.
	unUsuario agregarRespuesta: res
]

{ #category : #accessing }
CuOOra >> crearTopico: unTitulo descrip: unaDescrip [
	|top|
	top := Topico titulo: unTitulo descripcion: unaDescrip.
	topicos add: top.
]

{ #category : #accessing }
CuOOra >> crearUsuario: unNombre pass: unaPass [
	|usu|
	usu := Usuario nombre: unNombre contra: unaPass.
	usuarios add: usu. 
]

{ #category : #accessing }
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

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #utility }
CuOOra >> usuarioConNombre: anNombre protegidoPor: aPassword [
	^ usuarios 
		detect: [ :each | each nombre  = anNombre & (each contra = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
