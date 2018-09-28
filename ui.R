library(shiny)

fluidPage(
	textInput('experimentName',label = '',value = ''),
	uiOutput('gemmaPage')
)