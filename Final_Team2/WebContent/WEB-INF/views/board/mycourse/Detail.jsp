<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <!-- https://codepen.io/uckjae/pen/WNNmMEO (타임라인 참조사이트링크) -->
    <c:import url="/common/HeadTag.jsp" />
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/timeLine.css">
    <title>Insert title here</title>
    <script type="text/javascript">
        $(function () {
            $(".like-button").click(function () {
                $.ajax({
                    type: "post",
                    url: "LikeNum",
                    cache: false,
                    dataType: "text",
                    data: 'mCIdx=${mCBoard.mCidx}',
                    success: function (data) {
                        console.log(data);
                        $("#likeNum").text(data);
                    }

                });
            });

            setReadNum(${ mCBoard.bIdx });
            $("#replybtn").click(function () {
                $.ajax({

                });
            });
        });
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <c:set var="currUser" value="${sessionScope.memberId }" />
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    <!-- Vertical Timeline -->
    <c:set var="mCBoard" value="${requestScope.mCBoard}" />
    <div class="content">
        <div id="conference-timeline">
            <div class="row">
                <div class="text-left">
                    <span>글번호 : &nbsp;&nbsp;${mCBoard.bIdx}</span>
                    &nbsp;&nbsp;
                    <span>작성자 : &nbsp;&nbsp;${mCBoard.id }</span>
                </div>
                <h1 class="form-control mb-3 text-center">${mCBoard.title} </h1>
            </div>
            <div class="timeline-start">Start</div>

            <div class="text-right mt-3" style="float: right;">
                <span class="like-button">추천</span>
                <span id="likeNum">${mCBoard.likeNum }</span>
            </div>
            <div class="conference-center-line"></div>
            <div class="conference-timeline-content">
                <!-- Article -->
                <c:forEach var="photo" items="${mCBoard.photoList}" varStatus="status">

                    <c:choose>
                        <c:when test="${status.index%2 != 1}">
                            <c:set var="number" value="${status.index}" />
                            <div class="timeline-article">
                                <div class="content-left-container">
                                    <div class="content-left">
                                        <p>${mCBoard.contentsList[number*2]}</p>
                                        <span class="article-number">${number+1}</span>
                                    </div>
                                    <span class="timeline-author">${mCBoard.contentsList[number*2+1]}</span>
                                    <div class="meta-date">
                                        <img class="image2" src="upload/${photo.photoName }" alt="여행지사진"
                                            onError="this.src='images/scenery.png'">
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:set var="number" value="${status.index}" />
                            <div class="timeline-article">
                                <div class="content-right-container">
                                    <div class="content-right">
                                        <p>${mCBoard.contentsList[number*2]}</p>
                                        <span class="article-number">${number+1}</span>
                                    </div>
                                    <span class="timeline-author">${mCBoard.contentsList[number*2+1]}</span>
                                    <div class="meta-date">
                                        <img class="image2" src="upload/${photo.photoName }" alt="여행지사진"
                                            onError="this.src='images/scenery.png'">
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div class="timeline-end">End</div>

            <div class="text-right">
                <a href="MyCourseBoardList.do"><span>목록</span></a>
                <c:if
                    test="${qnaDetail.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
                    <input type="button" class="btn btn-primary" value="수정"
                        onclick="location.href='MyCourseBoardWrite.do?cmd=edit&bidx=${mCBoard.bIdx}'">
                    <input type="button" class="btn btn-primary" value="삭제"
                        onclick="location.href='MyCourseBoardWrite.do?bidx=${mCBoard.bIdx}'">
                </c:if>
            </div>

        </div>
        <!-- Reply  -->
        <c:set var="replies" value="${mCBoard.replies}" scope="request" />
        <jsp:include page="../common/Reply.jsp">
            <jsp:param name="bIdx" value="${ mCBoard.bIdx }" />
        </jsp:include>

    </div>

    <!-- // Vertical Timeline -->
    <div class="content" style="text-align: center;">
        <h1>지도자리</h1>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</body>

</html>