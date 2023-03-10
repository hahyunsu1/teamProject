<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<c:set var="user" value="${sessionScope.member}" />
<!DOCTYPE html>
<html>
<head>

<title></title>

  	<%@ include file="/WEB-INF/include/import.jsp"%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css_2sotto/blog_main.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
    <style type="text/css">


		a:visited {
			color: #000000;
		}
		
		ul, li {
			list-style: none;
		}


		h2 {
			margin-top: 100px;
			padding-top: 100px;
		}
		
		hr.dot {
			border: none;
			border: 1px dashed #ffffff;
			opacity: 0.4;
			margin: 20px 0px; /* 0 > 40px */
		}
		
		#replybox, #reply {
			margin: 0 40px;
		}
		
		#reply_h4 {
			margin-left: 50px;
			margin-bottom: 50px;
		}
		
		#btns_wrapper {
			text-align: right;
		}
		
		#btns {
			display: inline-block;
		}
		
		.container > li {
			float: right;
		}
		
		.reCom:before {

     	    content: "";
		    position: absolute;
		    display: inline-block;
		    top: 10;
		    left: 30px;
		    width: 16px;
		    height: 16px;
		    border: 1px solid #ccc;
		    border-width: 0 0 1px 1px;
		    border-radius: 0 0 0 2px;

 		}
 		.writereCom:before {

     	    content: "";
		    position: absolute;
		    display: inline-block;
		    top: 0;
		    left: 30px;
		    width: 16px;
		    height: 16px;
		    border: 1px solid #ccc;
		    border-width: 0 0 1px 1px;
		    border-radius: 0 0 0 2px;
		}
		 
		.main-card {
			background-color: #ffffff;
 			box-shadow: rgba(0, 0, 0, 0.08) 0px 20px 40px 0px;
			padding: 100px;
			border-radius: 6px;
			position: relative;	
		}
		
		#back-icon {
			position: absolute;
			top: 7px;
			left: 10px;
			font-size: 34px;
			color: rgba(233, 33, 101, 0.2);
		}
		
		.commentIcons {
			font-size: 20px;
			color: rgba(233, 33, 101, 0.2);
			padding: 0 2px;
		}

		#commentBox, #comment {
			margin-left: 50px;
			margin-right: 50px;
		}

		.heart-comment-time-area {
			margin: 5px 10px 50px 3px;
			color: #838383;
		}

		.heart-and-comment {
			margin: 50px 0 30px;
		}
	
	</style>
</head>
<%@ include file="/WEB-INF/include/header.jsp"%>
	<div class="container">
		<div class="side_overlay">
			<div class="main-card">
				<a href="main"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
				
				<!-- ????????? ??? ?????? ???????????? ?????? -->
				<div class="d-flex">  <!--  style="display: inline-block;" -->
				<a href="main"><span id="back-icon"><i class="fas fa-angle-double-left"></i></span></a>
					<!-- <span class="align-self-center"><b>${post.nick}</b>?????? </span> -->
					<h4 class="align-self-center">Q&A</h4>
					
					<!-- <span class="align-self-center">??? ?????????</span>   			 -->
				</div>

				<h1>${qna.title}</h1>	
				<li class="nav-item dropdown" style="float: right;">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span><i class="fas fa-ellipsis-v"></i></span></a>
						<c:if test="${(sessionScope.member.status eq 99) or (sessionScope.member.userid eq qna.userid)}">
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						
						<c:if test="${sessionScope.member.status eq 99}">
							<a class="dropdown-item" href="reply?qaindex=${qna.qaindex}">????????? ??????</a>
			            </c:if>	
			            <c:if test="${sessionScope.member.userid eq qna.userid}">
			            	<a class="dropdown-item" href="edit?qaindex=${qna.qaindex}">??????</a>			            	
			            	<a class="dropdown-item" href="javascript:;" id="delete">??????</a>
			            </c:if> 
			            
					  	</div>
					</c:if>
				</li>
				
				<div class="heart-comment-time-area">					
					<span>${qna.qatime}</span>
				</div>
				<h5>?????? ??????</h5>
				
			
			<hr>
			<div>
			${qna.content}
			</div>
			<div style="margin-top: 50px;">
			<hr>
			<h5>????????? ??????</h5>
			<hr>
				${qna.replyContent}
			</div>
			
				<hr>
				
				
				<h4 id="reply_h4">??????</h4>
				
				<div id="commentBox"></div>
					<!-- ?????? ??? -->
					
					<br>
					<form name="comment" id="comment" method="POST">
						?????????&nbsp;&nbsp;${sessionScope.member.userid}<br>						
						<textarea rows="3" cols="" id="content" name="content" style="width: 100%"></textarea>
						<br>
						<input type="reset" class="btn btn-sm" value="?????? ??????">
						<input type="button" class="btn btn-sm" value="??????" id="writecom">
						
					</form>
					<!-- ?????? ??? ??? -->
					
					<hr>
					
					
			</div>
		</div>
	</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 	
	
	<%@ include file="/WEB-INF/include/footer.jsp"%>	
</body>



	




<script>


// QNA ??? ?????? ??? ?????? ??? ????????? ?????? ??? ??????
$('#delete').click(function(){
	let con = confirm("????????? ?????????????????????????");
	if(con){
		return location.href='delete?qaindex=${qna.qaindex}';
	}else{
		return;
	}
});
	
	
	//?????? ?????? load ??? ?????? ????????? ?????? ?????? ??? ????????????
	$(function() {
		
		getCommentList();
		insertComment();
		
	});


	//?????? ?????? ????????????
	function getCommentList() {
		
		$.ajax({
	    
			url:"getCommentList",

			datatype: "json",
			data: { qaindex:'${qna.qaindex}'},
			success: function(data) {
				
				var html = "";
				console.log("data: "+data);
				//alert("data===="+JSON.stringify(data));
				$.each(data, function(i, element) {
					
					html += "<div id='commentUserid'><b>";
					html += element.userid;
					//????????? ??????
					html += "</b></div>";
					html += "<div id='commentContent"+element.qnaindex+"'>";
					html += element.content;
					html += "</div>";
					html += "<div id='commentDate'><h6>";
					html += element.rtime;
					html += "</h6></div>";
					html += "<input type='hidden' name='commentNum' id='commentNum' value='";
					html += element.qnalike;
					html += "'> <a href='" + "javascript:void(0);' onclick='editComment(" + element.qnaindex + ");  this.onclick=null;'; id='editCommentBtn" + element.qnaindex + "';><span class='commentIcons'><i class='fas fa-edit'></i></span></a>";
					html += "<a href='" + "javascript:void(0);' onclick='deleteComment(" + element.qnaindex + ")'; id='deleteCommentBtn'><span class='commentIcons'><i class='fas fa-trash-alt'></i></span></a>";
					html += "<div id='editForm"+element.qnaindex+"'></div>"
					html += "</div>";
				});
				
				$('#commentBox').append(html);
				
		
				
			}
		});
		
	}


	//?????? ??????
	function insertComment() {
		$('#writecom').click(function(){
			
			if(!comment.content.value) {
				swal('?????? ????????? ???????????????!');
				comment.content.focus();
				return false;
			}
			
			$.ajax ({
				
				url:"writeComment",
				type: "post",
				datatype:"json",
				data: { qaindex:'${qna.qaindex}',
						userid: '${sessionScope.member.userid}',
						content: $('#content').val()
					  },	
				success: function(data) {
						$('#commentBox').empty();
						$('#content').val("");
						getCommentList();
						$('#qnaCount').html($('#qnaCount').html()*1+1);
					}
					
			});
			
			return false;
			
		});
	}

	//?????? ?????? ??? ?????? 
	function editComment(qnaindex) {
						
					let html = "";
					let content = $('#commentContent'+qnaindex+'').text();
					
					html += '<form name="editCommentBox" id ="editCommentBox" method="POST">';
					html +=	'<input type="hidden" id="qnaindex" value="'+qnaindex+'">';
					html +=	'<textarea rows="3" cols="" id="content" name="content" style="width: 100%">'+content+'</textarea><br>';
					html +=	'<input type="reset" class="btn btn-sm" value="????????????">';
					html +=	'<input type="button" class="btn btn-sm" value="??????" id="editcom"></form>';
					
					
					$('#editForm'+qnaindex+'').append(html);
					
					//?????? ?????? ????????? ????????????
					$('#comment.content.value').empty();
					$('#comment').hide();

			return false;
			
	};


	//?????? ?????? ??????
	//?????? ?????? ???????????? on????????? ???????????? ????????? ????????????
	$(document).on("click","#editcom",function(){
			
	 		if(!editCommentBox.content.value) {
				swal('?????? ????????? ???????????????!');
				editCommentBox.content.focus();
				return false;
			}
			
	 		var qnaindex = $('#qnaindex').val();
	 		var content = $('#content').val();
	 		console.log(qnaindex);
	 		console.log(content);
	 		
	 		$.ajax ({
				
				url:"editComment",
				type: "post",
				datatype:"json",
				data: { qnaindex: $('#qnaindex').val(),
						userid: '${sessionScope.member.userid}',
						content: $('#content').val()
					  },	
				success: function(data) {
						$('#editCommentBox').remove();
						$('#commentContent'+qnaindex+'').text(content);
						$('#editCommentBtn'+qnaindex+'').attr("onclick", "editComment("+qnaindex+"); this.onclick=null;");
						//?????? ?????? ????????? ?????????
						$('#comment').show();
						
				}
			}); 
			
			return false;
			
	});


	// ?????? ?????? ??? ?????? ??? ????????? ?????? ??? ??????
	function deleteComment(qnaindex) {
		let con = confirm("????????? ?????????????????????????");
		if(con){
			return location.href='deleteComment?qnaindex='+qnaindex+'&qaindex=${qna.qaindex}';
		}else{
			return;
		}
	}
	
</script>
	
</body>
</html>