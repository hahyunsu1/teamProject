<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

=======
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${message ne null}">
	<script>
		alert('${message}');
<<<<<<< HEAD
		location.href='${loc}';
	</script>
</c:if>
<c:if test="${message eq null}">
	<script>		
		location.href='${loc}';
	</script>
</c:if>
=======
		location.href='${loc}'
	</script>
</c:if>
<c:if test="${message eq null}">
	<script>
		location.href='${loc}';
	</script>
</c:if>
	
>>>>>>> 3a6178e20cf2af11fdf12aa1d08bdfcf99d6a678
