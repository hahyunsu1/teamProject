<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/team/stomp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
$(function() {

	var sock = new SockJS(
				"${pageContext.request.contextPath}/endpoint");
	var client = Stomp.over(sock);
    
    	client.connect({},function() {
			//메세지 들어오는곳 == 구독한 채팅 채널
            //roomNo는 채팅창 접속하는 url에 get방식의 값으로 연결해줌
            //ex)채팅url?roomNo=13 이면 jsp el태그로 ${roomNo}로 가져와서 사용
			client.subscribe('/subscribe/chat/'+ roomNo,function(chat) {
			//받은 데이터
			var content = JSON.parse(chat.body);
			//후에 받은 데이터를 html코드로 뿌려주면 됨					
			});
                            
       });

});
client.send('/app/hello/' + roomNo, {}, JSON
		.stringify({
			chatContent : message,
			memberId : "${loginMember.memberId}"

}));

</script>