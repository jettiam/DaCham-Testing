<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../../../dacham/resources/wizardJs/blockly_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/blocks_compressed.js"></script>
<script
	src="../../../dacham/resources/wizardJs/javascript_compressed.js"></script>
<script src="../../../dacham/resources/wizardJs/ko.js"></script>
<script src="../../../dacham/resources/wizardJs/wizard.js"></script>

<script>
	$(document).ready(function() {
	
		var block ='${block}';
		var xml_block = Blockly.Xml.textToDom(block);
		Blockly.Xml.domToWorkspace(xml_block, workspace);
		$("#cancle").click(function() {
			if(confirm("변경사항이 저장되지 않았습니다. \n정말 나가시겠습니까? ")){
				self.opener = self;
				window.close();
			}
		});
		$("#alert").click(function(){
			var code = Blockly.JavaScript.workspaceToCode(workspace);
			code = code.split("}\n{").join("},\n{");
			code = code.split("''").join("',\n'");
			code = code.split("}\n'").join("},\n'");
			
			code = code.split("'").join("\"");
			
			code = "{\n" + code + "\n}";
			alert(code);
		});
		
		//등록 버튼 클릭시...
		$("#registWizard").click(function(){
			var code = Blockly.JavaScript.workspaceToCode(workspace);
			code = code.split("}\n{").join("},\n{");
			code = code.split("''").join("',\n'");
			code = code.split("}\n'").join("},\n'");
			code = code.split("'").join("\"");			
			code = "{\n" + code + "\n}";
			alert("코드\n"+code);
			var wizard = code;
			
			var xml = Blockly.Xml.workspaceToDom(workspace);
			var xml_text = Blockly.Xml.domToText(xml);
			alert(xml_text);
			$.ajax({
				url : "wizardInsert",
				type:"GET",
				data: {
					wizard : wizard,
					block : xml_text
				},
				success: function(data){
					if(data == "success"){						
						window.close();								
					}
				}, 
				error: function(request, status, error){
					alert("에러: "+request.status+"\n massage"+request.responseText);
				}
			});
		});
	});
</script>
</head>
<body>

	<h1 id="alert" style="text-align: center;">Dacham Wizard</h1>
	<!-- <div id="parseCode"
		style="display: inline-block; border: 1px solid blue; height: 480px; width: 600px;">
	</div> -->
	<div>
		<button id="registWizard">등록</button>
		<button id="cancle">취소</button>
	</div>
	<div>
		<div id="blocklyDiv"
			style="display: inline-block;  height:1000px; width: 700px;">
		</div>
		<xml xmlns="http://www.w3.org/1999/xhtml" id="toolbox"
			style="display: none"> <category name="1. 질문지 만들기"
			colour="#89934a"> <block type="makeQSheet"></block> </category> <category
			name="2. 질문 입력" colour="#f57e24"> <block type="inputQ"></block>
		</category> <category name="3. 답안입력, 연결" colour="#f8b125"> <block
			type="answerLink"></block> </category> </xml>
			
	</div>

	
	<script>
		var workspace = Blockly.inject('blocklyDiv', {
			media : 'https://blockly-demo.appspot.com/static/media/',
			toolbox : document.getElementById('toolbox')
		});
	</script>

</body>
</html>