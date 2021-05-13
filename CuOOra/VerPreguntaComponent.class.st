Class {
	#name : #VerPreguntaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta',
		'sistema'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'instance creation' }
VerPreguntaComponent class >> crearPreguntaComponent: unaPregunta [
	| componentePregunta |
	componentePregunta := self new.
	componentePregunta pregunta:  unaPregunta.
	^ componentePregunta
]

{ #category : #initialization }
VerPreguntaComponent >> initialize [
	super initialize.
	sistema := CuOOra soleInstance
]

{ #category : #accessing }
VerPreguntaComponent >> pregunta:unaPregunta [
	pregunta:=unaPregunta 
]

{ #category : #initialization }
VerPreguntaComponent >> renderContentOn: aCanvas [
	self renderTopPageOn: aCanvas
]

{ #category : #rendering }
VerPreguntaComponent >> renderTopPageOn: aCanvas [
	aCanvas paragraph: (BasicComponent newWithParent: self)
]
