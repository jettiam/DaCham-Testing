<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>식단 위자드 발동</title>
<!-- <script src="http://d3js.org/d3.v3.min.js"></script>  -->
<script src="resources/wizardJs/d3.v3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/wizardJs/blockly_compressed.js"></script>
<script src="resources/wizardJs/blocks_compressed.js"></script>
<script
	src="resources/wizardJs/javascript_compressed.js"></script>
<script src="resources/wizardJs/ko.js"></script>
<script src="resources/wizardJs/wizard.js"></script>

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
					var i = 0;
					code = code.split("}\n{").join("},\n{");
					code = code.split("''").join("',\n'");
					code = code.split("}\n'").join("},\n'");
					code = code.split("'").join("\"");
					code = "{\n" + code + "\n}";

					code = code.split(";").join(",");
					//alert(code);
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
							//alert("코드\n" + code);
							var wizard = code;
							var xml = Blockly.Xml.workspaceToDom(workspace);
							var xml_text = Blockly.Xml.domToText(xml);
							
							alert(typeof wizard);
							console.log(wizard);
							$.ajax({
								url : "wizardInsert",
								
								type : "POST",
								data : {
									wizard : wizard,
									block : xml_text
								},
								success : function(data) {
									if (data == "success") {
										alert("성공입니다.");
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
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	font-family: 'Jeju Gothic', sans-serif;
}

.blocklyTreeLabel {
	font-family: 'Jeju Gothic';
}

#sideController {
	width: 150px;
	height: 400px;
	position: fixed;
	top: 100px;
	left: 90%;
	z-index: 100;
}

ul {
	margin: 0;
	padding: 0;
	left: 0%;
}

li {
	list-style-type: none;
}

.sideNaviStart {
	
}

.sideNavi {
	height: 60px;
	background-color: #de413b;
}



.blocklyTreeRoot {
	margin-top: 8px;
}

.blocklyText {
	font: 12px 'Jeju Gothic';
}

.node circle {
	fill: steelblue;
	stroke: steelblue;
	stroke-width: 3px;
}

.node text {
	font: 12px 'Jeju Gothic';
}

.link {
	fill: none;
	stroke: #ccc;
	stroke-width: 2px;
}

svg {
	
}
</style>

</head>
<body>

	<hr width="150">
	<h3 id="alert" style="text-align: center;">다 참 위 자 드</h3>
	<hr width="150">

	<div>
		<button id="registWizard">등록</button>
		<button id="cancle">취소</button>
	</div>
	<div id="graphWizard"></div>
	<div id="searchArea">
		<h3>블록을 찾겠습니다. 나중에 수정할 영역.</h3>
		<form name="f1" action=""
			onSubmit="if(this.t1.value!=null && this.t1.value!='') findString(this.t1.value);return false">
			<input type="text" name=t1 value="text" size=20> <input
				type="submit" name=b1 value="Find">
		</form>
	</div>
	<span id="blockWizard">
		<div id="blocklyDiv"
			style="display: inline-block; height: 3000px; width: 100%;"></div> <xml
			xmlns="http://www.w3.org/1999/xhtml" id="toolbox"
			style="display: none"> <category name="1. 질문지 만들기"
			colour="#89934a"> <block type="makeQSheet"></block> </category> <category
			name="2. 질문 입력" colour="#f57e24"> <block type="inputQ"></block>
		</category> <category name="3. 답안입력, 연결" colour="#f8b125"> <block
			type="answerLink"></block></category> <category name="4. 결과지와 연결하기">
		<block type="resultsheet"></block></category> <category name="5. 결과지 블록모음">
		<block type="d1"></block> <block type="d2"></block> <block type="d3"></block>
		</category></xml>
	</span>

	<!-- 오른쪽 컨트롤 네비 바 -->
	<div id="sideController">
		<ul>
			<li class="sideNaviStart"><img src="resources/wizardIcon.png"
				width="130px;"></li>
			<li class="sideNavi"><div>위자드 도우미</div></li>
			<li class="sideNavi">위자드 블록 검색 <input id="searchNum" type="text">에
				대하여
				<button id="searchBtn">찾기</button>
				<div id="showAllCount" style="display: none;">
					<span></span>
					<button id="prevCount">이전 찾기</button>
					<button id="nextCount">다음 찾기</button>
					<button id="closeCount">닫기</button>
				</div>
			</li>
			<li><img src="resources/wizardIconBottom.png"></li>
		</ul>
	</div>

	<script>
		//#blocklyDiv에 블록 inject.
		var workspace = Blockly.inject('blocklyDiv', {
			media : 'https://blockly-demo.appspot.com/static/media/',
			//scrollbars : false,
			toolbox : document.getElementById('toolbox')
		});

		//var can = new Trashcan(Blockly.Workspace(workspace));	
		//alert("삭제 직사각형: "+workspace.getClientRect());

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
				for ( var key in eval("plainJson." + keyArr[i] + ".answerList")) {
					var getLinkText = "plainJson." + keyArr[i] + ".answerList["
							+ k + "].link";
					var getLink = eval(getLinkText);
					jsonData[jsonDataInx] = {};
					jsonData[jsonDataInx].name = getLink;
					jsonData[jsonDataInx].parent = keyArr[i].replace("q", "");
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
					(parent.children || (parent.children = [])).push(node);
				} else {
					treeData.push(node);
				}
			});
			// ************** Generate the tree diagram	 *****************
			var margin = {
				top : 20,
				right : 120,
				bottom : 20,
				left : 50
			}, width = window.outerWidth, height = window.outerHeight / 3;
			var i = 0, duration = 750, root;
			var tree = d3.layout.tree().size([ height, width ]);
			var diagonal = d3.svg.diagonal().projection(function(d) {
				return [ d.y, d.x ];
			});

			$("#graphWizard>svg").remove();
			var svg = d3
					.select("#graphWizard")
					.append("svg")
					.attr("width", width + margin.right + margin.left)
					.attr("height", height)
					.append("g")
					.attr("transform",
							"translate(" + margin.left + "," + margin.top + ")");
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
					d.y = d.depth * 240;
				});
				// Update the nodes…
				var node = svg.selectAll("g.node").data(nodes, function(d) {
					return d.id || (d.id = ++i);
				});
				// Enter any new nodes at the parent's previous position.
				var nodeEnter = node.enter().append("g").attr("class", "node")
						.attr(
								"transform",
								function(d) {
									return "translate(" + source.y0 + ","
											+ source.x0 + ")";
								}).on("click", click);
				nodeEnter.append("circle").attr("r", 1e-6).style("fill",
						function(d) {
							return d._children ? "lightsteelblue" : "#fff";
						});
				nodeEnter.append("text").attr("x", function(d) {
					//return d.children || d._children ? -13 : 13;
					return d.children || d._children ? 3 : -3;
				}).attr("dy", ".35em").attr("text-anchor", function(d) {
					return d.children || d._children ? "end" : "start";
				}).text(function(d) {
					//console.log(d.name + "q번호임.");
					var q = eval("plainJson.q" + d.name);
					var keyArr = new Array();
					var cnt = 0;
					for ( var key in q) {
						//console.log(key);
						keyArr[cnt] = key;
						cnt++;
					}

					//console.log(keyArr);
					//console.log(q);
					//console.log(eval(q));

					//console.log(keyArr);
					/* if (keyArr[0] != undefined) {
						return (d.name+ ". ");
					} else {
						return d.name + "번 질문지 작성되지 않았습니다.";
					} */
					return d.name;
				}).style("fill-opacity", 1e-6);
				
				
				var answerLength; //질분지 블록이 있을 때 답변의 수만큼 text append 하기 위한 변수.
				
				nodeEnter.append('svg:text').attr('x', 0).attr('y', 0).attr(
						'class', 'id').append('svg:tspan').attr('x', 16).attr(
						'dy', 0).text(
						function(d) {
							var q = eval("plainJson.q" + d.name);
							var keyArr = new Array();
							var cnt = 0;
							for ( var key in q) {
								keyArr[cnt] = key;
								cnt++;
							}
							if (keyArr[0] != undefined) {
								var rtn = eval("plainJson.q" + d.name + "."
										+ keyArr[0]);
								return rtn;
							} else {
								return "질문 블록을 만들어주세요";
							}
						}).attr('class', function(d) {				
						return "class";				
				}).attr('font-size', function() {
					return '15px';
				})
				.style("fill", function(d){
					var q = eval("plainJson.q" + d.name);
					var keyArr = new Array();
					var cnt = 0;
					for ( var key in q) {
						keyArr[cnt] = key;
						cnt++;
					}
					if (keyArr[0] != undefined) {
						return "#000000";
					} else {
						return "#CC3D3D";
					}
				})
				.append('svg:tspan').attr('x', 16).attr('dy', 12).text(
						function(d) {
							var q = eval("plainJson.q" + d.name);
							var keyArr = new Array();
							var cnt = 0;
							for ( var key in q) {
								keyArr[cnt] = key;
								cnt++;
							}
							if (keyArr[0] != undefined) {
								var answerRtn ="";
								var answer = eval("plainJson.q"+d.name+"."+keyArr[1]);			
								for(i=0; i<answer.length; i++){
									answerRtn += answer[i].link + ". " + answer[i].answer + "   ";
								}								
							}
							return answerRtn;
						}).attr('font-size', '11px');

				var answerNodeStr = "nodeEnter.append('svg:text')";
				

				/*  .append('svg:tspan')
				 .attr('x', 100)
				 .attr('dy', 20)
				 .text(function(d) { return "1"; })
				 .append('svg:tspan')
				 .attr('x', 150)
				 .attr('dy', 20)			  
				 .text(function(d) { return "2"; })
				 .attr('font-size', '20px'); */

				// Transition nodes to their new position.
				var nodeUpdate = node.transition().duration(duration).attr(
						"transform", function(d) {
							return "translate(" + d.y + "," + d.x + ")";
						});
				nodeUpdate.select("circle").attr("r", 10).style("fill",
						function(d) {
							return d._children ? "lightsteelblue" : "#fff";
						});
				nodeUpdate.select("text").style("fill-opacity", 1);
				// Transition exiting nodes to the parent's new position.
				var nodeExit = node.exit().transition().duration(duration)
						.attr(
								"transform",
								function(d) {
									return "translate(" + source.x + ","
											+ source.y + ")";
								}).remove();
				nodeExit.select("circle").attr("r", 1e-6);
				nodeExit.select("text").style("fill-opacity", 1e-6);
				// Update the links…
				var link = svg.selectAll("path.link").data(links, function(d) {
					return d.target.id;
				});
				// Enter any new links at the parent's previous position.
				link.enter().insert("path", "g").attr("class", "link").attr(
						"d", function(d) {
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
				link.transition().duration(duration).attr("d", diagonal);
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

		function searchSheet(num) {
			alert(num + "번 질문지를 찾을꺼에요:)");
			var txt = $("#blocklyDiv").text();
			console.log(txt);
			alert(txt);
		}

		workspace.addChangeListener(drawGraph);

		$(document)
				.ready(
						function() {
							$("#searchBtn")
									.click(
											function() {
												var num = $("#searchNum").val();
												num = num.split(" ").join(
														"&nbsp;");
												alert(num + "에 대하여 찾습니다.");

												var searchedBox = document
														.getElementsByClassName("blocklyText");
												var selectList = new Array();
												var sCount = 0;
												var count = 0;
												for (var i = 0; i < searchedBox.length; i++) {
													if (searchedBox[i].innerHTML == num) {
														$("#showAllCount")
																.show();
														console
																.log(searchedBox[i].innerHTML);
														selectList[sCount] = searchedBox[i];
														sCount++;
														count++;
													}
												}
												if (count == 0) {
													alert("검색 값이 없습니다.");
												} else {
													console.log(selectList);
													var parent = selectList[0].parentNode.parentNode;
													$(parent).addClass(
															"blocklySelected");

													selectList[0]
															.scrollIntoView(true);
												}

											});

							drawGraph();
						});
	</script>
</body>
</html>