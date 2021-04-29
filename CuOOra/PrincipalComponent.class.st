Class {
	#name : #PrincipalComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-UI'
}

{ #category : #callback }
PrincipalComponent >> desloguear [
]

{ #category : #rendering }
PrincipalComponent >> renderContentOn: aCanvas [														
	self renderTopPageOn: aCanvas.	"setea parte principal de la pagina"													
	aCanvas horizontalRule.
	
	self renderPreguntasOn: aCanvas.
	

]

{ #category : #rendering }
PrincipalComponent >> renderPreguntasOn: aCanvas [
	aCanvas heading 
		level: 3;
		with: 'Preguntas Relevantes'.
]

{ #category : #rendering }
PrincipalComponent >> renderTopPageOn: aCanvas [	
	aCanvas paragraph: [ aCanvas heading: 'Bienvenido ', self session usuario nombre . aCanvas anchor
									 												callback: [ self desloguear ];
									 												with: 'Cerrar Sesion' ].
]
