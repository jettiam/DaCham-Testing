// 블록 정의

/**
 * 질문지 생성 블록. 질문지 번호 입력.
 */
Blockly.Blocks['makeQSheet'] = {
  init: function() {
    this.appendValueInput("question_sheet")
      .setCheck(null)
      .appendField("질문지 번호: ")
      .appendField(new Blockly.FieldNumber(1), "q_no");
    this.setColour("#89934a");
    this.setTooltip('');
    this.setHelpUrl('');
  }
};
Blockly.Blocks['resultsheet'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("결과: ");
    this.appendValueInput("result")
        .setCheck(null)
        .appendField("결과를 블록으로 연결하세요.");
    this.setInputsInline(false);
    this.setOutput(true, null);
    this.setColour(75);
    this.setTooltip('');
    this.setHelpUrl(''); 
  }
};



/**
 * 질문지 입력기능, 답안지 연결 기능.
 */
Blockly.Blocks['inputQ'] = {
  init: function() {
    this.appendDummyInput()
      .appendField("질문: ")
      .appendField(new Blockly.FieldTextInput("질문을 입력하세요."), "question");
    this.setColour("#f57e24");
    this.itemCount_ = 3;
    this.updateShape_();
    this.setOutput(true, 'Array');
    this.setMutator(new Blockly.Mutator(['lists_create_with_item']));
  },
  mutationToDom: function() {
    var container = document.createElement('mutation');
    container.setAttribute('items', this.itemCount_);
    return container;
  },
  domToMutation: function(xmlElement) {
    this.itemCount_ = parseInt(xmlElement.getAttribute('items'), 10);
    this.updateShape_();
  },
  decompose: function(workspace) {
    var containerBlock = workspace.newBlock('lists_create_with_container');
    containerBlock.initSvg();
    var connection = containerBlock.getInput('STACK').connection;
    for (var i = 0; i < this.itemCount_; i++) {
      var itemBlock = workspace.newBlock('lists_create_with_item');
      itemBlock.initSvg();
      connection.connect(itemBlock.previousConnection);
      connection = itemBlock.nextConnection;
    }
    return containerBlock;
  },
  compose: function(containerBlock) {
    var itemBlock = containerBlock.getInputTargetBlock('STACK');
    var connections = [];
    while (itemBlock) {
      connections.push(itemBlock.valueConnection_);
      itemBlock = itemBlock.nextConnection &&
        itemBlock.nextConnection.targetBlock();
    }
    for (var i = 0; i < this.itemCount_; i++) {
      var connection = this.getInput('ADD' + i).connection.targetConnection;
      if (connection && connections.indexOf(connection) == -1) {
        connection.disconnect();
      }
    }
    this.itemCount_ = connections.length;
    this.updateShape_();
    for (var i = 0; i < this.itemCount_; i++) {
      Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
    }
  },
  saveConnections: function(containerBlock) {
    var itemBlock = containerBlock.getInputTargetBlock('STACK');
    var i = 0;
    while (itemBlock) {
      var input = this.getInput('ADD' + i);
      itemBlock.valueConnection_ = input && input.connection.targetConnection;
      i++;
      itemBlock = itemBlock.nextConnection &&
        itemBlock.nextConnection.targetBlock();
    }
  },
  updateShape_: function() {
    if (this.itemCount_ && this.getInput('EMPTY')) {
      this.removeInput('EMPTY');
    } else if (!this.itemCount_ && !this.getInput('EMPTY')) {
      this.appendDummyInput('EMPTY')
        .appendField("답변이 없는 질문지");
    }
    for (var i = 0; i < this.itemCount_; i++) {
      if (!this.getInput('ADD' + i)) {
        var input = this.appendValueInput('ADD' + i);
        if (i == 0) {
          //input.appendField("답변 리스트");
          input.appendField("답변을 블록으로 연결하세요.");
        }
      }
    }
    while (this.getInput('ADD' + i)) {
      this.removeInput('ADD' + i);
      i++;
    }
  }
};

/**
 * 답변 입력 기능, 답안과 다른 질문지 연결 기능.
 */
Blockly.Blocks['answerLink'] = {
  init: function() {
    this.appendDummyInput()
      .appendField("답변 :")
      .appendField(new Blockly.FieldTextInput("답변을 입력하세요"), "answer");
    this.appendDummyInput()
      .appendField("질문지")
      .appendField(new Blockly.FieldNumber(1), "link_no")
      .appendField("로 연결합니다.");
    this.setOutput(true, null);
    this.setColour("#f8b125");
    this.setTooltip('');
    this.setHelpUrl('');
  }
};

//당뇨 결과 블록들 1~3 위로 갈수록 심각.
Blockly.Blocks['d1'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("당뇨");
    this.appendDummyInput()
        .appendField("주의");
    this.setOutput(true, null);
    this.setColour(160);
    this.setTooltip('');
    this.setHelpUrl('');
  }
};

Blockly.Blocks['d2'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("당뇨");
    this.appendDummyInput()
        .appendField("위험");
    this.setOutput(true, null);
    this.setColour(290);
    this.setTooltip('');
    this.setHelpUrl('');
  }
};

Blockly.Blocks['d3'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("당뇨");
    this.appendDummyInput()
        .appendField("고위험");
    this.setOutput(true, null);
    this.setColour(0);
    this.setTooltip('');
    this.setHelpUrl('');
  }
};












// 블록 코드 정의


/**
 * 질문지 생성블록 코드 정의.
 * @return jsonParse    [json형태로 코드를 파싱함.]
 */
Blockly.JavaScript['makeQSheet'] = function(block) {
  var number_q_no = block.getFieldValue('q_no');
  var value_question_sheet = Blockly.JavaScript.valueToCode(block,
    'question_sheet',
    Blockly.JavaScript.ORDER_ATOMIC);
  var jsonParse = "'q"+number_q_no+"' : {" + value_question_sheet + "\n}";
  return [jsonParse, Blockly.JavaScript.ORDER_ATOMIC];
};

/**
 * 질문 입력 및 답안 연결 블록 코드 정의.
 * @return 질문, 연결된 답안과 연결지.
 */
Blockly.JavaScript['inputQ'] = function(block) {
  var text_question = block.getFieldValue('question');
  for (var arr = Array(block.itemCount_), k = 0; k < block.itemCount_; k++) {
    arr[k] = Blockly.JavaScript.valueToCode(block, "ADD" + k, Blockly.JavaScript.ORDER_NONE) || "null";
  }

  var listParse = "\n'question' : '" + text_question + "'\n" +
    "'answerList' : [" + arr.join(" , ") + "]";
  listParse = listParse.replace("'\n'", "',\n'");
  return [listParse, Blockly.JavaScript.ORDER_ATOMIC]
};

/**
 * 답안과 답안에 따른 질문지 연결 블록 코드 정의.
 * @return answer, link를 json 형태로 리턴.
 */
Blockly.JavaScript['answerLink'] = function(block) {
  var text_answer = block.getFieldValue('answer');
  var number_link_no = block.getFieldValue('link_no');

  var linkParse = "{'answer' : '"+text_answer+"', 'link' : '"+number_link_no+"'}"
  return [linkParse, Blockly.JavaScript.ORDER_ATOMIC];
};

/**
 * 결과에 따른 값을 선택 해줌.
 */
Blockly.JavaScript['resultsheet'] = function(block) {
	  var value_result = Blockly.JavaScript.valueToCode(block, 'result', Blockly.JavaScript.ORDER_ATOMIC);
	  // TODO: Assemble JavaScript into code variable.
	  var code = "'result' : '결과', \n" + "'resultList' : {"+value_result+"}";
	  // TODO: Change ORDER_NONE to the correct strength.
	  return [code, Blockly.JavaScript.ORDER_ATOMIC];
	};


	
	
	// 당뇨 고위험군
	Blockly.JavaScript['d1'] = function(block) {
		  var code = " 'result': '당뇨', 'judg':'주의' ";
		  return [code, Blockly.JavaScript.ORDER_ATOMIC];
		};

	
	// 당뇨 고위험군
	Blockly.JavaScript['d2'] = function(block) {
		  var code = " 'result': '당뇨', 'judg':'위험' ";
		  return [code, Blockly.JavaScript.ORDER_ATOMIC];
		};

	
	
	
// 당뇨 고위험군
Blockly.JavaScript['d3'] = function(block) {
	  var code = " 'result': '당뇨', 'judg':'고위험' ";
	  return [code, Blockly.JavaScript.ORDER_ATOMIC];
	};
