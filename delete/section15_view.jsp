<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
---
---
<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="referrer" content="always">
		<meta property="og:type" content="article">
		<meta property="og:site_name" content="순대공장 신창식품&amp;신토리">
		<meta property="og:type" content="article">
		<meta property="og:url" content="https://www.shinchangfood.com">
		<meta property="og:title" content="[순대공장 신창식품&amp;신토리 - 홈] 순대공장,순대제조,신창식품,아바이순대,순대,순대국재료,순대국육수,순대국창업">
		<meta property="og:image" content="image-real/character.png">
		<meta name="twitter:image" content="image-real/character.png">	  
		<title>홈 | 순대공장 신창식품&amp;신토리</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="{{ site.baseurl }}/static/css/section15.css" />
		<link rel="stylesheet" href="{{ site.baseurl }}/static/css/section15_mobile_736.css" />			
		<link rel="stylesheet" href="{{ site.baseurl }}/static/css/section15_view.css" />
		<style>
.comment-text{
	white-space: pre-wrap !important;
	line-height: 1.2rem;
	padding:5px 0 7px 0;
	max-height: 700px;
	overflow: auto;
}		
.btn-delete-comment {
    background-color: rgb(193, 48, 48) !important;
    color: white !important;
    padding: 6px 12px !important;
    border: none !important;
    border-radius: 6px !important;
    font-size: 13px !important;
    cursor: pointer !important;
    transition: background-color 0.2s ease-in-out !important;
}

.btn-delete-comment:hover {
  background-color: rgb(160, 40, 40);
  color:white !important;
}		
.supervisor {
  color: rgb(198,43,43) !important;
  font-weight: bold !important;
}

		</style>
	</head>
	<body class="is-preload">

			<!-- Header -->
			<section id="header">
				{% include header.html %}
			</section>

			<div id="wrapper">
				<!-- Main -->
				<div id="main">
					<section id="zero">
						<div class="preview main">
							<a href="/">순대공장 신창식품&amp;신토리</a>
						</div>
					</section>
					<!-- One -->
					<section id="fourteen">
						<div class="container preview">
							<a href="/section15.do" class="major">
								<h2>게시판 - 상세보기 </h2>
							</a>
							
							<div class="board-container">
							  <h2 class="board-title">${board.title}</h2>
							  <div class="board-meta">
							    <span class="${fn:contains(board.writer, '신창식품') ? 'supervisor' : ''}">
								  <c:choose>
									  <c:when test="${fn:contains(board.writer, '신창식품')}"> <%-- 관리자의 글일 경우에는, '작성자:' 는 안띄움--%>
									    <c:out value="${board.writer}" escapeXml="false" />
									  </c:when>
									  <c:otherwise>
									    <strong>작성자:</strong> <c:out value="${board.writer}" escapeXml="false" />
									  </c:otherwise>
									</c:choose>
								</span>
							    <span><strong>작성일:</strong> ${board.createdAt}</span>
							  </div>
							  <div class="board-content">${fn:trim(board.content)}</div>

							
							  <div class="comment-section">
							    <h3 class="comment-title">댓글</h3>
							    
							    
								<ul class="comment-list">
								  <c:forEach var="comment" items="${comments}">
								    <c:if test="${comment.parentId == null}">
								      <!-- 댓글 -->
								      <li class="comment-item" data-comment-id="${comment.id}">
								        
								        <!-- 작성자와 시간 -->
								        <div class="comment-meta">
								          <span class="comment-writer ${fn:contains(comment.writer, '신창식품') ? 'supervisor' : ''}">
										  <c:out value="${comment.writer}" escapeXml="false" />
										</span>
								          <span class="comment-time">
								            <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm" />
								          </span>
								        </div>
								
								        <!-- 댓글 내용 -->
								        <div class="comment-text">${comment.content}</div>
								
										<c:if test="${sessionScope.supervisor}">
										  <a href="{{ site.baseurl }}/section15/deleteComment.do?id=${comment.id}" 
										     class="btn-delete-comment" 
										     onclick="event.stopPropagation(); return confirm('댓글을 삭제하시겠습니까?')">삭제</a>
										</c:if>
										
										<!-- 답글 목록 -->
										<c:set var="hasReply" value="false" />
										<c:forEach var="r" items="${comments}">
										  <c:if test="${r.parentId == comment.id}">
										    <c:set var="hasReply" value="true" />
										  </c:if>
										</c:forEach>
										
										<c:if test="${hasReply}">
										  <ul class="reply-list">
										    <c:forEach var="reply" items="${comments}">
										      <c:if test="${reply.parentId == comment.id}">
										        <li class="reply-item">
										          <div class="comment-meta">
													<span class="comment-writer ${fn:contains(reply.writer, '신창식품') ? 'supervisor' : ''}">
													  <c:out value="${reply.writer}" escapeXml="false" />
													</span>
										            <span class="comment-time">
										              <fmt:formatDate value="${reply.createdAt}" pattern="yyyy-MM-dd HH:mm" />
										            </span>
										          </div>
										          <div class="comment-text">${reply.content}</div>
										          
										          <c:if test="${sessionScope.supervisor}">
													  <a href="{{ site.baseurl }}/section15/deleteComment.do?id=${reply.id}" 
													     class="btn-delete-comment" 
													     onclick="event.stopPropagation(); return confirm('댓글을 삭제하시겠습니까?')">삭제</a>
  												  </c:if>
										        </li>
										      </c:if>
										    </c:forEach>
										  </ul>
										</c:if>
								
								        <!-- 답글 토글 버튼 -->
								        <button class="reply-open-button">답글 등록</button>
								
								        <!-- 답글 입력 폼 -->
								        <div class="reply-form" style="display: none;">
								          <textarea class="reply-input comment-input" placeholder="답글을 입력하세요"></textarea>
								          <button class="reply-comment-submit">등록</button>
								        </div>
								      </li>
								    </c:if>
								  </c:forEach>
								</ul>

							
								<div class="comment-form" data-board-id="${board.id}">
								  <textarea class="comment-input" placeholder="댓글을 입력하세요"></textarea>
								  <button class="main-comment-submit">댓글 등록</button>
								</div>
							  </div>
							</div>

							<div class="spaceHeight"></div> 
														
							<jsp:include page="/WEB-INF/jsp/common/bannerAndSign.jsp" />							
						</div>
					</section>
					<!-- Footer -->
					<jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
			</div>
			
			<div id="fullscreenModal" onclick="hideFullscreen()" style="display: none; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.9); justify-content: center; align-items: center; z-index: 9999; padding: 1rem; box-sizing: border-box;">
				<img id="fullscreenImage"/>
			</div>
		<!-- Scripts -->
		<script src="{{ site.baseurl }}/static/js/jquery.min.js"></script>
		<script src="{{ site.baseurl }}/static/js/jquery.scrollex.min.js"></script>
		<script src="{{ site.baseurl }}/static/js/jquery.scrolly.min.js"></script>
		<script src="{{ site.baseurl }}/static/js/browser.min.js"></script>
		<script src="{{ site.baseurl }}/static/js/breakpoints.min.js"></script>
		<script src="{{ site.baseurl }}/static/js/util.js"></script>
		<script src="{{ site.baseurl }}/static/js/main.js"></script>
		<script src="{{ site.baseurl }}/static/js/make.js"></script>
		<script>
		// ===== 댓글 등록 =====
document.addEventListener("DOMContentLoaded", function () {			
		document.querySelector('.main-comment-submit').addEventListener('click', function () {
		  const form = document.querySelector('.comment-form');
		  const boardId = form.dataset.boardId;
		  const content = form.querySelector('.comment-input').value.trim();

		  if (!content) {
		    alert('댓글 내용을 입력하세요.');
		    return;
		  }
		  if (!confirm('댓글을 등록하시겠습니까?')){
			  return;
		  }
		  const writer = getOrCreateNickname();

		  fetch("/section15/insertComment.do", {
		    method: 'POST',
		    headers: {
		      'Content-Type': 'application/x-www-form-urlencoded'
		    },
		    body: "boardId=" + boardId +
		          "&writer=" + encodeURIComponent(writer) +
		          "&content=" + encodeURIComponent(content)
		  })
		  .then(response => {
		    if (response.redirected) {
		      alert('댓글이 등록되었습니다.');
		      window.location.href = response.url;
		    } else {
		      return response.text();
		    }
		  })
		  .catch(error => {
		    console.error('댓글 등록 중 오류:', error);
		    alert('댓글 등록 실패');
		  });
		});

		// ===== 답글 폼 토글 =====
		document.querySelectorAll('.reply-open-button').forEach(function (button) {
		  button.addEventListener('click', function () {
			console.log('답글 버튼 열림')
		    const commentItem = button.closest('.comment-item');
    		const replyForm = commentItem.querySelector('.reply-form');
    		replyForm.style.display = (replyForm.style.display === 'none' || replyForm.style.display === '') ? 'block' : 'none';
		  });
		});

		// ===== 답글 등록 =====
		document.querySelectorAll('.reply-comment-submit').forEach(function (button) {
		  button.addEventListener('click', function () {
		    const commentItem = button.closest('.comment-item');
		    const parentId = commentItem.dataset.commentId;
		    const boardId = document.querySelector('.comment-form').dataset.boardId;
		    const content = commentItem.querySelector('.reply-input').value.trim();
		    const writer = getOrCreateNickname();

		    if (!content) {
		      alert('답글 내용을 입력하세요.');
		      return;
		    }

		    fetch("/section15/insertComment.do", {
		      method: 'POST',
		      headers: {
		        'Content-Type': 'application/x-www-form-urlencoded'
		      },
		      body: "boardId=" + boardId +
		            "&writer=" + encodeURIComponent(writer) +
		            "&content=" + encodeURIComponent(content) +
		            "&parentId=" + parentId
		    })
		    .then(response => {
		      if (response.redirected) {
		        window.location.href = response.url;
		      }
		    })
		    .catch(error => {
		      console.error("답글 등록 오류:", error);
		      alert("답글 등록 실패");
		    });
		  });
		});

		  
		  
	  	// ===== 닉네임 생성 =====
		function getOrCreateNickname() {
		  // 서버 세션의 관리자 여부를 EL로 JS에 전달
		  const isSupervisor = ${sessionScope.supervisor == true ? 'true' : 'false'};
		
		  if (isSupervisor) {
		    return "신창식품&신토리";
		  }
		
		  let nickname = sessionStorage.getItem('nickname');
		  if (!nickname) {
		    nickname = generateRandomNickname();
		    sessionStorage.setItem('nickname', nickname);
		  }
		  return nickname;
		}

		
		  function generateRandomNickname() {
		    return "익명" + Math.floor(1000 + Math.random() * 9000);
		  }
});		  
		</script>

	</body>
</html>