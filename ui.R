library(shiny)

fluidPage(
	textInput('experimentName',label = '',value = ''),
	tabsetPanel(
		tabPanel('gemma',uiOutput('gemmaPage')),
		tabPanel('GEO',uiOutput('geoPage'))
	)

)