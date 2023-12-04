<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<form id="actionForm" action="" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
	<input type="hidden" name="age" value="${keyword.age}" />
	<input type="hidden" name="gender" value="${keyword.gender}" />
	<input type="hidden" name="income" value="${keyword.income}" />
	<input type="hidden" name="child" value="${keyword.child}" />
	<input type="hidden" name="job" value="${keyword.job}" />
	<input type="hidden" name="fmlyType" value="${keyword.fmlyType}" />
	<input type="hidden" name="bsnsType" value="${keyword.bsnsType}" />
	<input type="hidden" name="copType" value="${keyword.copType}" />
	<input type="hidden" name="handicap" value="${keyword.handicap}" />
	<input type="hidden" name="category" value="${category}" /> 
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