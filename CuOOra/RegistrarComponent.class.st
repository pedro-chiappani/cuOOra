Class {
	#name : #RegistrarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'number'
	],
	#category : #'CuOOra-UI'
}

{ #category : #initialization }
RegistrarComponent >> initialize [ 
	super initialize.
	number:= 0.
]

{ #category : #callbacks }
RegistrarComponent >> random [
	number := 100 atRandom.
]

{ #category : #rendering }
RegistrarComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas paragraph
				with: [ aCanvas text: 'El numero que estas pensando es: '.
					aCanvas space.
					aCanvas strong with: number printString ].
			aCanvas anchor
				callback: [ self random ];
				with: [ aCanvas button: 'Intentar de nuevo' ] ]
]
