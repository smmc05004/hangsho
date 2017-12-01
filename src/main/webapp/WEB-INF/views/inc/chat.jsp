<%@ page pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	var ws = new WebSocket("ws://www.hangsho.com/chat.do");
	
	ws.onmessage = function(event) {
		var data = event.data;
		var dataItems = data.split(":");
		var protocol = dataItems[0];
		
		if (protocol == 'ON_USERS') {
			var messageItems = dataItems[1].split(",");
			
			$.each(messageItems, function(index, establishedUserId) {
				$("button#btn-req-" + establishedUserId).removeClass("disabled");					
			})
		} else if (protocol == 'OFF_USER') {
			var offlineUserId = dataItems[1];
			$("button#btn-req-" + offlineUserId).addClass("disabled");

			$("#chat-message-box").html("");
			$("#my-chat-modal input[name='nickname']").val("");
			$('#my-chat-modal').modal('hide');
		}  else if (protocol == 'OFF_CHAT') {
			var closedChatId = dataItems[1];
			$("button#btn-req-" + closedChatId).removeClass("disabled");
			$("#chat-message-box").html("");
			$("#my-chat-modal input[name='nickname']").val("");
			
			$('#my-chat-modal').modal('hide');
		} else if (protocol == 'CHAT_MSG') {
			var chatId = dataItems[1];
			var sendId = dataItems[2];
			var message = dataItems[3];
			var $chatbox = $("#chat-message-box").append("<p><strong>"+sendId+": </strong> "+message+"</p>");
			$("#chat-message-box").scrollTop($("#chat-message-box")[0].scrollHeight);
			
		} else if (protocol == 'ON_CHAT') {
			var chatId = dataItems[1];
			$("button#btn-req-" + chatId).addClass("disabled");
			$("#my-chat-modal input[name='nickname']").val(chatId);			
			$('#my-chat-modal').modal('show');
		}
	};
	
	$("div.btnlist").on("click", "button[id^='btn-req-']", function() {
		if (!$(this).hasClass('disabled')) {
			var responseId = $(this).attr("id").replace('btn-req-', '');
			
			ws.send('CONNECT:' + responseId);
			$(this).addClass('disabled');
		}
	});
	
	$("#btn-modal-close").on('click', function() {
		var closedId = $("#my-chat-modal input[name='nickname']").val();
		ws.send('CLOSE:' + closedId);
	});
	
	$("#btn-send-msg").on('click', function(event) {
		event.preventDefault();
		
		var chatId = $("#my-chat-modal input[name='nickname']").val();
		var message = $("#input-chat-message").val();
		if (message != "") {
			ws.send("MSG:" + chatId + ":" + message);
			$("#input-chat-message").val("");
		}
	});
	
	$("#input-chat-message").on('keydown', function(event) {
		if (event.which == 13) {
			event.preventDefault();
			var chatId = $("#my-chat-modal input[name='nickname']").val();
			var message = $(this).val();
			if (message != "") {
				ws.send("MSG:" + chatId + ":" + message);
				$(this).val("");
			}			
		}
	});
})
</script>
<div class="modal fade" id="my-chat-modal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">
          1:1 채팅 
          <button class='btn btn-danger btn-xs pull-right' id='btn-modal-close'>나가기</button></h4>
        </div>
        <div class="modal-body">
        	<div id="chat-message-box"></div>     	
        </div>
        <div class="modal-body">
        	<form class='form-inline'>
        		<input type="hidden" name='nickname'>
				<div class='form-group formgroupinline'>
					<input type='text' class='form-control' name='message' id='input-chat-message'>					
					<button type='button' class='btn btn-default btn-md' id='btn-send-msg'>보내기</button>					
				</div>
			</form>       	
        </div>
      </div>
    </div>
</div>