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

{ #category : #example }
CuOOra class >> example [
	| sistema pedro diego topico1 topico2 topico3 preguntapedro preguntadiego topicospedro juan topicosdiego |
	sistema := self new.
	pedro := sistema
		crearUsuario: 'pedro@cuoora.com'
		pass: 'pedro@cuoora.com'.
	diego := sistema
		crearUsuario: 'diego@cuoora.com'
		pass: 'diego@cuoora.com'.
	juan := sistema
		crearUsuario: 'juan@cuoora.com'
		pass: 'juan@cuoora.com'.
	topico1 := sistema crearTopico: 'OO1' descrip: ''.
	topico2 := sistema crearTopico: 'Test de unidad' descrip: ''.
	topico3 := sistema crearTopico: 'Smalltalk' descrip: ''.
	topicospedro := OrderedCollection new.
	topicosdiego := OrderedCollection new.
	topicospedro add: topico1.
	topicospedro add: topico2.
	topicosdiego add: topico1.
	topicosdiego add: topico3.
	preguntapedro := sistema
		crearPregunta: '¿Para que sirve el metodo SetUp?'
		topicos: topicospedro
		descripcion: ''
		usuario: pedro.
	preguntadiego := sistema
		crearPregunta: '¿Que significa #messageNotUnderstood?'
		topicos: topicosdiego
		descripcion: ''
		usuario: diego.
	sistema crearRespuesta: preguntapedro texto: 'Sirve para instanciar los objetos que son evaluados por el test en un √∫nico m√©todo y que se ejecute siempre antes de cada test.' usuario: diego.
	sistema crearRespuesta: preguntadiego  texto: 'Significa que el objeto que recibi el mensaje no encontro nungun metodo para ejecutar en respuesta' usuario: pedro.
	diego agregarTopico: topico3.
	pedro agregarTopico: topico1.
	juan agregarSeguidor: diego.
	pedro agregarSeguidor: juan.
	^ sistema
]

{ #category : #initialization }
CuOOra class >> initializeSampleInstance [
	soleInstance := self example.
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #accessing }
CuOOra >> crearPregunta: unTitulo topicos: unosTopicos descripcion: unaDescrip usuario: unUsuario [
	| preg |
	preg := Pregunta
		titulo: unTitulo
		descripcion: unaDescrip
		usuario: unUsuario
		topicos: unosTopicos.
	preguntas add: preg.
	unUsuario agregarPregunta: preg.
	unosTopicos do: [ :each | each preguntas: preg ].
	^ preg
]

{ #category : #accessing }
CuOOra >> crearRespuesta: unaPregunta texto: unTexto usuario: unUsuario [
	| res |
	res := Respuesta texto: unTexto pregunta: unaPregunta usuario: unUsuario.
	respuestas add: res.
	unaPregunta respuestas: res.
	unUsuario agregarRespuesta: res.
	^ res
]

{ #category : #accessing }
CuOOra >> crearTopico: unTitulo descrip: unaDescrip [
	|top|
	top := Topico titulo: unTitulo descripcion: unaDescrip.
	topicos add: top.
	^top.
]

{ #category : #accessing }
CuOOra >> crearUsuario: unNombre pass: unaPass [
	|usu|
	usu := Usuario nombre: unNombre contra: unaPass.
	usuarios add: usu.
	^usu.
]

{ #category : #accessing }
CuOOra >> eliminarPregunta: unaPregunta [
	respuestas removeAllSuchThat: [:each | each pregunta = unaPregunta ].
	unaPregunta eliminarRespuestas.
	unaPregunta usuario eliminarPregunta: unaPregunta.
	unaPregunta topicos do: [ :top | top eliminarPregunta: unaPregunta ].
	preguntas remove: unaPregunta.

]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	preguntas:= OrderedCollection new.
	topicos := OrderedCollection new.
	respuestas:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantesDeUsuario:unUsuario [
^unUsuario obtenerPreguntasRelevantes 
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

{ #category : #'as yet unclassified' }
CuOOra >> topicosConNombre: aString [
	^topicos select: [ :each | each nombre asLowercase includesSubstring: aString asLowercase ]
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
