


function openAPI(){

		var w = 200,h = 200;
		
		var colorscale = d3.scale.category10();
		
		//Legend titles
		var foodMName = $("#foodMName").val();
		var LegendOptions = [foodMName];
		
		console.log("단백질:"+A);        
		var A = ($("#protein").val())/100;
		var B = ($("#carbohydrate").val())/100;
		var C = ($("#fat").val())/100;
		var D = ($("#na").val())/100;
		var E = ($("#fe").val())/100;
		//Data
		var d = [
			  [
				{axis: "단백질",value: A},
				{axis: "탄수화물",value: B},
				
				{axis:"지방",value:C},
				{axis:"나트륨",value:D},
				{axis:"철",value:E}
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