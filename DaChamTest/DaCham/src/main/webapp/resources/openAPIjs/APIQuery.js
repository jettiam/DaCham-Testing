function openAPI(){
	var count = parseInt(localStorage['count']);
	if(localStorage['count'] == 0){
		$("#body").hide();
	}
	var w = 200,h = 200;
		
		var colorscale = d3.scale.category10();
		
		//Legend titles
		var LegendOptions = ['선택 반찬의 영양정보'];
		//Data
		var protein = 0;
		var carbohydrate = 0;
		var kcal = 0;
		var na = 0;
		var fat = 0;
		console.log(count);
		console.log(typeof(count));
		for(var i = 0; i < count; i++){
			protein += parseInt(localStorage[i+'_protein']);
			carbohydrate += localStorage[i+'_carbohydrate'];
			kcal += localStorage[i+'_kcal'];
			na += localStorage[i+'_na'];
			fat += localStorage[i+'_fat'];
			      
		}
		var sum = parseInt(localStorage[0+'_protein']) + parseInt(localStorage[1+'_protein']) + parseInt(localStorage[2 + '_protein']) + parseInt(localStorage[3+'_protein']);
		console.log("단백질"+protein/100000);
		console.log("단백질"+carbohydrate/100000);
		console.log("단백질"+kcal/100000);
		console.log("단백질"+na/100000);
		console.log("단백질"+fat/100000);
		var d = [
			  [
				{axis: "단백질",value: protein/100000},
				{axis: "탄수화물",value: carbohydrate/100000},
				
				{axis:"열량",value: kcal/100000},
				{axis:"나트륨",value:na/100000},
				{axis:"지방",value:fat/100000}
			  ]
			  
			];
		
		//Options for the Radar chart, other than default
		var mycfg = {
		w: w,
		h: h,
		maxValue: 0.6,
		levels: 6,
		ExtraWidthX: 300
		}
		
		//Call function to draw the Radar chart
		//Will expect that data is in %'s
		RadarChart.draw("#chart", d, mycfg);
		
		////////////////////////////////////////////
		/////////// Initiate legend ////////////////
		////////////////////////////////////////////
		
		var svg = d3.select('#body')
		.selectAll('svg')
		.append('svg')
		.attr("width", w+300)
		.attr("height", h)
		
		//Create the title for the legend
		var text = svg.append("text")
		.attr("class", "title")
		.attr('transform', 'translate(90,0)') 
		.attr("x", w - 70)
		.attr("y", 10)
		.attr("font-size", "12px")
		.attr("fill", "#404040")
		.text("영양 반찬의 현황");
			
		//Initiate Legend	
		var legend = svg.append("g")
		.attr("class", "legend")
		.attr("height", 100)
		.attr("width", 200)
		.attr('transform', 'translate(90,20)') 
		;
		//Create colour squares
		legend.selectAll('rect')
		  .data(LegendOptions)
		  .enter()
		  .append("rect")
		  .attr("x", w - 65)
		  .attr("y", function(d, i){ return i * 20;})
		  .attr("width", 10)
		  .attr("height", 10)
		  .style("fill", function(d, i){ return colorscale(i);})
		  ;
		//Create text next to squares
		legend.selectAll('text')
		  .data(LegendOptions)
		  .enter()
		  .append("text")
		  .attr("x", w - 52)
		  .attr("y", function(d, i){ return i * 20 + 9;})
		  .attr("font-size", "11px")
		  .attr("fill", "#737373")
		  .text(function(d) { return d; })
		  ;	
}