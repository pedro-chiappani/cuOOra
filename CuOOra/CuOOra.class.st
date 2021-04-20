Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos',
		'preguntas',
		'respuestas'
	],
	#category : #'CuOOra-models'
}

{ #category : #'as yet unclassified' }
CuOOra >> calcularPuntajeUsuario: unUsuario [
	|puntaje|
	puntaje := 0.
	unUsuario preguntas do: [ :preg | puntaje:= puntaje + 20 + preg puntuacionTotal ].
	unUsuario respuestas do: [ :res | puntaje := puntaje + 50 + res puntuacionTotal ].
	^puntaje
]

{ #category : #'as yet unclassified' }
CuOOra >> crearPregunta: unTitulo topicos: unosTopicos decripcion: unaDescrip usuario: unUsuario [
	|preg|
	preg := Pregunta new titulo: unTitulo descripcion: unaDescrip usuario: unUsuario.
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
CuOOra >> crearUsusario: unNombre pass: unaPass [
	|usu|
	usu := Usuario nombre: unNombre contra: unaPass.
	usuarios add: usu. 
]

{ #category : #'as yet unclassified' }
CuOOra >> eliminarPregunta: unaPregunta [
	respuestas remove: [ :unaRes | unaRes pregunta = unaPregunta ].
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

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantes: unUsuario [
	| aux |
	aux := OrderedCollection new.
	unUsuario topicosSeguidos
		do: [ :each | each preguntas do: [ :preg | aux addAll: preg] ] .
	unUsuario seguidos
		do: [ :each | each preguntas do: [ :pregunta | aux addAll: pregunta ] ] .
	^ aux
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasTopico: unTopico [ 
	^unTopico preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasUsuario: unUsuario [
	^unUsuario preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestasPregunta: unaPregunta [
	^unaPregunta respuestas asSortedCollection: [ :unaRes :otraRes | unaRes puntuacionTotal > otraRes puntuacionTotal ]
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestasUsuario: unUsuario [
	^respuestas collect: [ :each | each usuario = unUsuario ]
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #'as yet unclassified' }
CuOOra >> registrarPuntuacion: anObject usuario: unUsuario valor: unValor [
	| punt aux |
	aux := anObject puntuacion.
	aux
		detect: [ :each | 
			each usuario = unUsuario
				ifTrue: [ punt := each ] ]
		ifFound: [ punt reset.
			unValor > 0
				ifTrue: [ punt positivo ]
				ifFalse: [ punt negativo ] ]
		ifNone: [ punt := Puntuacion usuario: unUsuario.
			unValor > 0
				ifTrue: [ punt positivo ]
				ifFalse: [ punt negativo ].
			anObject registrarPuntuacion: punt ]
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

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
