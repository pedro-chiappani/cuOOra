Class {
	#name : #PrincipalComponent,
	#superclass : #WAComponent,
	#instVars : [
		'sistema',
		'mensaje'
	],
	#category : #'CuOOra-UI'
}

{ #category : #callback }
PrincipalComponent >> desloguear [
	self answer .
]

{ #category : #initialization }
PrincipalComponent >> initialize [
	sistema := CuOOra soleInstance.
	mensaje:= ''
]

{ #category : #rendering }
PrincipalComponent >> obtenerUltimasCincoPreguntas [
	^ self ordenarPreguntasRelevantes takeFirst: 5	 "ifNil: [ ^ nil ]"
]

{ #category : #'as yet unclassified' }
PrincipalComponent >> ordenarPreguntasRelevantes [
	^ (sistema obtenerPreguntasRelevantesDeUsuario: self session usuario)
		asSortedCollection: [ :preg1 :preg2 | preg1 fechayhora > preg2 fechayhora ]
]

{ #category : #rendering }
PrincipalComponent >> renderContentOn: aCanvas [														
	self renderTopPageOn: aCanvas.	"setea parte principal de la pagina"													
	aCanvas horizontalRule.
	
	self renderPreguntasOn: aCanvas.
	

]

{ #category : #rendering }
PrincipalComponent >> renderListaDePreguntas: listado on: aCanvas [
	listado do: [ :each | self renderPregunta: each on: aCanvas ] 
]

{ #category : #rendering }
PrincipalComponent >> renderListaDeTopicos: topicos on: aCanvas [
	|t|
	aCanvas paragraph: [ 
		t:= topicos first: topicos size -1.
		aCanvas text: 'Topicos: '.
		t do:[:each | aCanvas text: '',each nombre ,', '].
		aCanvas text: topicos last nombre.
	].
]

{ #category : #rendering }
PrincipalComponent >> renderPregunta: unaPregunta on: aCanvas [
aCanvas anchor
				callback: ["self call: (PreguntaCuOOraComponent crearPreguntaComponent: unaPregunta  sistema: CuOOra soleInstance)"];
				with: [aCanvas heading level: 2 ; with: unaPregunta titulo.].
	aCanvas paragraph: unaPregunta descripcion.
	self renderListaDeTopicos: unaPregunta topicos on:aCanvas.  
	aCanvas paragraph: [
		aCanvas text: 'Realizada por '.
		aCanvas strong: unaPregunta usuario nombre printString.
		aCanvas anchor
           callback: ["self call: (UsuarioCuOOraComponent crearUsuarioComponent: unaPregunta usuario sistema: CuOOra soleInstance  )"];
           with: [ aCanvas button with: unaPregunta usuario nombre].
		aCanvas text: ' | ',unaPregunta respuestas size printString,' respuesta/s'. 
	].
	"self contadorLikesDislikes: unaPregunta on: aCanvas.
	self likeDislikeButtons: unaPregunta on: aCanvas."
	aCanvas horizontalRule.
	
]

{ #category : #rendering }
PrincipalComponent >> renderPreguntasOn: aCanvas [
	aCanvas heading
		level: 3;
		with: 'Preguntas Relevantes'.
	aCanvas anchor
		callback: [ "self call: CrearPreguntaCuOOraComponent new" ];
		with: [ aCanvas button with: 'Hacer nueva pregunta' ].
	aCanvas heading
		level: 4;
		with: mensaje.
	(self
		renderListaDePreguntas: self obtenerUltimasCincoPreguntas
		on: aCanvas) "ifNil: [ mensaje := 'No hay preguntas cargadas' ]"
]

{ #category : #rendering }
PrincipalComponent >> renderTopPageOn: aCanvas [
aCanvas paragraph: (BasicComponent newWithParent: self)
]
