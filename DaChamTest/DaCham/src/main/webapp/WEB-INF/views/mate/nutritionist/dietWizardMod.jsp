<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp"%>

<title></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../../../dacham/resources/wizardJs/blockly_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/blocks_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/javascript_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/ko.js"></script>
<script src="../../../dacham/resources/wizardJs/wizard.js"></script>

<script>	
	$(document).ready(function(){
		$("#cancle").click(function(){
			window.location.href = "wizard";
		});
	});
</script>
</head>
<body>
	<h1 style="text-align: center;">Dacham Wizard</h1>
	<!-- <div id="parseCode"
		style="display: inline-block; border: 1px solid blue; height: 480px; width: 600px;">
	</div> -->
	<div>
	<div id="blocklyDiv"
		style="display: block; margin: 0 auto; height: 1500px; width: 1500px;">
	</div>
	<xml xmlns="http://www.w3.org/1999/xhtml" id="toolbox"
		style="display: none"> <category name="1. 질문지 만들기"
		colour="#89934a"> <block type="makeQSheet"></block> </category> <category
		name="2. 질문 입력" colour="#f57e24"> <block type="inputQ"></block>
	</category> <category name="3. 답안입력, 연결" colour="#f8b125"> <block
		type="answerLink"></block> </category> </xml>
	</div>
	
	<div>
		<button>등록</button>
		<button id="cancle">취소</button>
	</div>
	  <script>
    var workspace = Blockly.inject('blocklyDiv', {
      media: 'https://blockly-demo.appspot.com/static/media/',
      toolbox: document.getElementById('toolbox')
    });


    $("#blocklyDiv").click(function(){
      var code = Blockly.JavaScript.workspaceToCode(workspace);
      code = code.replace("}\n{", "},\n{");
      code = code.replace("''", "',\n'");
      document.getElementById("parseCode").innerText = "[\n" + code + "\n]";
    });

  </script>
	
</body>
</html>