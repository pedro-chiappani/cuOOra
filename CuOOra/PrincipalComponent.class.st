Class {
	#name : #PrincipalComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-UI'
}

{ #category : #rendering }
PrincipalComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'. "self session user nombre"
	
	aCanvas horizontalRule.

]
