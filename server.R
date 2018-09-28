function(input, output, session){
	output$gemmaPage = renderUI({
		query = parseQueryString(session$clientData$url_search)
		text = input$experimentName
	
		if(text ==''){
			experimentName = query$exp
		} else{
			experimentName = text
		}
		
		dataset = gemmaAPI::datasetInfo(experimentName)
		
		if(length(dataset)>=1){
			id = dataset[[1]]$id
			return(tags$iframe(src = glue('https://gemma.msl.ubc.ca/expressionExperiment/showExpressionExperiment.html?id={id}'),
							   seamless = "seamless",
							   frameBorder = '0',
							   height="1000", width="100%"))
			
		} else{
			return(NULL)
		}
		
	})
}