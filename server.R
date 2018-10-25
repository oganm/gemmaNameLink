function(input, output, session){
	
	experimentName = reactive({
		query = parseQueryString(session$clientData$url_search)
		text = input$experimentName
		
		if(text ==''){
			exp = query$exp
		} else{
			exp = text
		}
		return(exp)
	})
	
	output$gemmaPage = renderUI({
		name = experimentName()
		
		if(length(name)>=1){
			return(tags$iframe(src = glue('https://gemma.msl.ubc.ca/expressionExperiment/showExpressionExperiment.html?shortName={name}'),
							   seamless = "seamless",
							   frameBorder = '0',
							   height="1000", width="100%"))
			
		} else{
			return(NULL)
		}
		
	})
	
	
	output$geoPage = renderUI({
		name = experimentName()
		
		if(length(name)>=1){
			return(tags$iframe(src = glue('https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc={name}'),
							   seamless = "seamless",
							   frameBorder = '0',
							   height="1000", width="100%"))
			
		} else{
			return(NULL)
		}
	})
}