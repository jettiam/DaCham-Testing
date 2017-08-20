function openAPI(){
	var count1 = parseInt(localStorage['count1']);
	var count2 = parseInt(localStorage['count2']);
	var count3 = parseInt(localStorage['count3']);
	var count4 = parseInt(localStorage['count4']);
	var count5 = parseInt(localStorage['count5']);
	var count6 = parseInt(localStorage['count6']);
	
	    var w = 200,h = 200;           
		 
		var colorscale = d3.scale.category10();
		 
		//Legend titles
		var LegendOptions = ['영양정보','1일 권장영양']; 
		
		//Data
		var protein = 0;
		var carbohydrate = 0;
		var kcal = 0;
		var na = 0;
		var fat = 0;
		
		
			protein = parseInt(localStorage[count1+'_protein1'])+parseInt(localStorage[count2+'_protein2'])+parseInt(localStorage[count3+'_protein3'])+parseInt(localStorage[count4+'_protein4'])+parseInt(localStorage[count5+'_protein5'])+parseInt(localStorage[count6+'_protein6']);
			carbohydrate = parseInt(localStorage[count1+'_carbohydrate1'])+parseInt(localStorage[count2+'_carbohydrate2'])+parseInt(localStorage[count3+'_carbohydrate3'])+parseInt(localStorage[count4+'_carbohydrate4'])+parseInt(localStorage[count5+'_carbohydrate5'])+parseInt(localStorage[count6+'_carbohydrate6']);
			kcal = parseInt(localStorage[count1+'_kcal1'])+parseInt(localStorage[count2+'_kcal2'])+parseInt(localStorage[count3+'_kcal3'])+parseInt(localStorage[count4+'_kcal4'])+parseInt(localStorage[count5+'_kcal5'])+parseInt(localStorage[count6+'_kcal6']);
			na = parseInt(localStorage[count1+'_na1'])+parseInt(localStorage[count2+'_na2'])+parseInt(localStorage[count3+'_na3'])+parseInt(localStorage[count4+'_na4'])+parseInt(localStorage[count5+'_na5'])+parseInt(localStorage[count6+'_na6']);
			fat = parseInt(localStorage[count1+'_fat1'])+parseInt(localStorage[count2+'_fat2'])+parseInt(localStorage[count3+'_fat3'])+parseInt(localStorage[count4+'_fat4'])+parseInt(localStorage[count5+'_fat5'])+parseInt(localStorage[count6+'_fat6']);
			      
			localStorage[0 + '_total1'] = protein;
			localStorage[0 + '_total2'] = carbohydrate;
			localStorage[0 + '_total3'] = kcal;
			localStorage[0 + '_total4'] = na;
			localStorage[0 + '_total5'] = fat;
		
		var sum = parseInt(localStorage[0+'_protein']) + parseInt(localStorage[1+'_protein']) + parseInt(localStorage[2 + '_protein']) + parseInt(localStorage[3+'_protein']);
		console.log("단백질"+protein);
		console.log("단백질"+carbohydrate);
		console.log("단백질"+kcal);
		console.log("단백질"+na);
		console.log("단백질"+fat);     
		
		var d = [
			  [
				{axis: "단백질(%)",value: (protein/50)*100},
				{axis: "탄수화물(%)",value: (carbohydrate/405)*100},
				
				{axis:"열량(%)",value: (kcal/2400)*100},     
				{axis:"나트륨(%)",value:(na/2000)*100},
				{axis:"지방(%)",value:(fat/40)*100}   
			  ],   
			  [
					{axis: "단백질(%)",value: 100},
					{axis: "탄수화물(%)",value: 100},
					
					{axis:"열량(%)",value: 100},     
					{axis:"나트륨(%)",value: 100},
					{axis:"지방(%)",value: 100}                          
				  ]          
			];
		
		
		
		//Options for the Radar chart, other than default
		var mycfg = {     
		w: w,
		h: h,
		maxValue: 150,
		levels: 5,
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