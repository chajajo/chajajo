<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="actionForm" action="/service/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
</form>

<ul class="pagination justify-content-center">
	<c:if test="${pageMaker.cri.pageNum >1}">
		<li class="page-item"><a class="page-link" href="1"><i
				class="fa-solid fa-angles-left"></i></a></li>
	</c:if>

	<c:if test="${pageMaker.prev}">
		<li class="page-item"><a class="page-link"
			href="${pageMaker.startPage-1}"><i class="fa-solid fa-angle-left">
			</i></a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
		var="num">
		<li class="page-item ${ pageMaker.cri.pageNum== num ? 'active' : '' }">
			<a class="page-link" href="${num}">${num}</a>
		</li>
	</c:forEach>

	<c:if test="${pageMaker.next}">
		<li class="page-item"><a class="page-link"
			href="${pageMaker.endPage+1}"><i class="fa-solid fa-angle-right">
			</i></a></li>
	</c:if>

	<c:if test="${pageMaker.cri.pageNum< pageMaker.totalPage}">
		<li class="page-item"><a class="page-link"
			href="${pageMaker.totalPage}"> <i
				class="fa-solid fa-angles-right"></i></a></li>
	</c:if>
</ul>