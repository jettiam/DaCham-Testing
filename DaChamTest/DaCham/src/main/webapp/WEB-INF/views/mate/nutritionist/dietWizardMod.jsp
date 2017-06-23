<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../../../dacham/resources/wizardJs/blockly_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/blocks_compressed.js"></script>
<script
	src="../../../dacham/resources/wizardJs/javascript_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/ko.js"></script>
<script src="../../../dacham/resources/wizardJs/wizard.js"></script>

<script>
	$(document).ready(
			function() {

				var block = '${block}';
				var xml_block = Blockly.Xml.textToDom(block);
				Blockly.Xml.domToWorkspace(xml_block, workspace);
				$("#cancle").click(function() {
					if (confirm("변경사항이 저장되지 않았습니다. \n정말 나가시겠습니까? ")) {
						self.opener = self;
						window.close();
					}
				});
				$("#alert").click(function() {
					var code = Blockly.JavaScript.workspaceToCode(workspace);
					var i=0;
					code = code.split("}\n{").join("},\n{");
					code = code.split("''").join("',\n'");
					code = code.split("}\n'").join("},\n'");
					code = code.split("'").join("\"");
					code = "{\n" + code + "\n}";
					
					
					code = code.split(";").join(",");
					alert(code);
				});

				//등록 버튼 클릭시...
				$("#registWizard").click(
						function() {
							var code = Blockly.JavaScript
									.workspaceToCode(workspace);
							code = code.split("}\n{").join("},\n{");
							code = code.split("''").join("',\n'");
							code = code.split("}\n'").join("},\n'");
							code = code.split("'").join("\"");
							code = "{\n" + code + "\n}";
							alert("코드\n" + code);
							var wizard = code;

							var xml = Blockly.Xml.workspaceToDom(workspace);
							var xml_text = Blockly.Xml.domToText(xml);
							$.ajax({
								url : "wizardInsert",
								type : "GET",
								data : {
									wizard : wizard,
									block : xml_text
								},
								success : function(data) {
									if (data == "success") {
										window.close();
									}
								},
								error : function(request, status, error) {
									alert("에러: " + request.status
											+ "\n massage"
											+ request.responseText);
								}
							});
						});
			});
</script>
<style>
.node circle {
	fill: steelblue;
	stroke: steelblue;
	stroke-width: 3px;
}

.node text {
	font: 12px sans-serif;
}

.link {
	fill: none;
	stroke: #ccc;
	stroke-width: 2px;
}

svg {
	float: right;
}
</style>

</head>
<body>

	<h1 id="alert" style="text-align: center;">Dacham Wizard</h1>
	<div>
		<button id="registWizard">등록</button>
		<button id="cancle">취소</button>
	</div>
	<span id="blockWizard">
		<div id="blocklyDiv"
			style="display: inline-block; height: 1000px; width: 1200px;"></div>
	  <xml xmlns="http://www.w3.org/1999/xhtml" id="toolbox"
			style="display: none"> <category name="1. 질문지 만들기"
			colour="#89934a"> <block type="makeQSheet"></block> </category>
			 <category name="2. 질문 입력" colour="#f57e24"> <block type="inputQ"></block>
		</category> <category name="3. 답안입력, 연결" colour="#f8b125"> <block
			type="answerLink"></block></category>
			<category name="4. 결과지와 연결하기"><block type="resultsheet"></block></category>
			<category name="5. 결과지 블록모음">
			<block type="d1"></block>
			<block type="d2"></block>
			<block type="d3"></block>
			</category></xml>
			
	</span>

	<script>
	//#blocklyDiv에 블록 inject.
	var workspace = Blockly.inject('blocklyDiv', {
		media : 'https://blockly-demo.appspot.com/static/media/',
		toolbox : document.getElementById('toolbox')
	});
	function drawGraph() {
		var code = Blockly.JavaScript.workspaceToCode(workspace);
		code = code.split("}\n{").join("},\n{");
		code = code.split("''").join("',\n'");
		code = code.split("}\n'").join("},\n'");
		code = code.split("'").join("\"");
		code = "{\n" + code + "\n}";
		code = code.split(";").join(",");
	
		
		
		var plainJson = JSON.parse(code);
		
		var countKey = 0;
		var keyArr = [];

		for ( var key in plainJson) {
			keyArr[countKey] = key;
			countKey++;
		}

		var jsonData = [];
		jsonData[0] = {};
		jsonData[0].name = "1";
		jsonData[0].parent = "null";
		var jsonDataInx = 1;

		for (i = 0; i < countKey; i++) {
			var k = 0;
			for ( var key in eval("plainJson." + keyArr[i]
					+ ".answerList")) {
				var getLinkText = "plainJson." + keyArr[i]
						+ ".answerList[" + k + "].link";
				var getLink = eval(getLinkText);
				jsonData[jsonDataInx] = {};
				jsonData[jsonDataInx].name = getLink;
				jsonData[jsonDataInx].parent = keyArr[i].replace(
						"q", "");
				jsonDataInx++;
				k++;
			}
		}
		var dataMap = jsonData.reduce(function(map, node) {
			map[node.name] = node;
			return map;
		}, {});

		var treeData = [];

		jsonData.forEach(function(node) {
			var parent = dataMap[node.parent];
			if (parent) {
				(parent.children || (parent.children = []))
						.push(node);
			} else {
				treeData.push(node);
			}
		});

		// ************** Generate the tree diagram	 *****************
		var margin = {
			top : 20,
			right : 120,
			bottom : 20,
			left : 10
		}, width = 530 - margin.right - margin.left, height = 500
				- margin.top - margin.bottom;

		var i = 0, duration = 750, root;

		var tree = d3.layout.tree().size([ height, width ]);

		var diagonal = d3.svg.diagonal().projection(function(d) {
			return [ d.x, d.y ];
		});

		$("#blockWizard>svg").remove();
		var svg = d3.select("#blockWizard").append("svg").attr(
				"width", width + margin.right + margin.left)
				.attr("height",
						height + margin.top + margin.bottom + 700)
				.append("g").attr(
						"transform",
						"translate(" + margin.left + ","
								+ margin.top + ")");

		root = treeData[0];
		root.x0 = height / 2;
		root.y0 = 0;

		update(root);

		d3.select(self.frameElement).style("height", "500px");

		function update(source) {

			// Compute the new tree layout.
			var nodes = tree.nodes(root).reverse(), links = tree
					.links(nodes);

			// Normalize for fixed-depth.
			nodes.forEach(function(d) {
				d.y = d.depth * 180;
			});

			// Update the nodes…
			var node = svg.selectAll("g.node").data(nodes,
					function(d) {
						return d.id || (d.id = ++i);
					});

			// Enter any new nodes at the parent's previous position.
			var nodeEnter = node.enter().append("g").attr("class",
					"node").attr(
					"transform",
					function(d) {
						return "translate(" + source.x0 + ","
								+ source.y0 + ")";
					}).on("click", click);

			nodeEnter.append("circle").attr("r", 1e-6).style(
					"fill",
					function(d) {
						return d._children ? "lightsteelblue"
								: "#fff";
					});

			nodeEnter.append("text").attr("x", function(d) {
				return d.children || d._children ? -13 : 13;
			}).attr("dy", ".35em").attr("text-anchor", function(d) {
				return d.children || d._children ? "end" : "start";
			}).text(function(d) {
				return d.name;
			}).style("fill-opacity", 1e-6);

			// Transition nodes to their new position.
			var nodeUpdate = node.transition().duration(duration)
					.attr(
							"transform",
							function(d) {
								return "translate(" + d.x + ","
										+ d.y + ")";
							});

			nodeUpdate.select("circle").attr("r", 10).style(
					"fill",
					function(d) {
						return d._children ? "lightsteelblue"
								: "#fff";
					});

			nodeUpdate.select("text").style("fill-opacity", 1);

			// Transition exiting nodes to the parent's new position.
			var nodeExit = node.exit().transition().duration(
					duration).attr(
					"transform",
					function(d) {
						return "translate(" + source.x + ","
								+ source.y + ")";
					}).remove();

			nodeExit.select("circle").attr("r", 1e-6);

			nodeExit.select("text").style("fill-opacity", 1e-6);

			// Update the links…
			var link = svg.selectAll("path.link").data(links,
					function(d) {
						return d.target.id;
					});

			// Enter any new links at the parent's previous position.
			link.enter().insert("path", "g").attr("class", "link")
					.attr("d", function(d) {
						var o = {
							x : source.x0,
							y : source.y0
						};
						return diagonal({
							source : o,
							target : o
						});
					});

			// Transition links to their new position.
			link.transition().duration(duration)
					.attr("d", diagonal);

			// Transition exiting nodes to the parent's new position.
			link.exit().transition().duration(duration).attr("d",
					function(d) {
						var o = {
							x : source.x,
							y : source.y
						};
						return diagonal({
							source : o,
							target : o
						});
					}).remove();

			// Stash the old positions for transition.
			nodes.forEach(function(d) {
				d.x0 = d.x;
				d.y0 = d.y;
			});
		}
		// Toggle children on click.
		function click(d) {
			if (d.children) {
				d._children = d.children;
				d.children = null;
			} else {
				d.children = d._children;
				d._children = null;
			}
			update(d);
		}
		
		}
		
		workspace.addChangeListener(drawGraph);
		$(document).ready(function() {							
			drawGraph();					
				});
	</script>

	<script>
		
	</script>
</body>
</html>