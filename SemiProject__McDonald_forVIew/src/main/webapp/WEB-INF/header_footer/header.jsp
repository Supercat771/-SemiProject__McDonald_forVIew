<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>    
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>

<%-- Required meta tags --%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<%-- header footer CSS --%> 
<link rel="stylesheet" href="<%=ctxPath%>/css/header_footer/header_footer.css" type="text/css"/>

<%-- Optional JavaScript --%>
<script src="<%=ctxPath%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script> 

<%-- jQueryUI CSS 및 JS  --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />  
<script type="text/javascript" src="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 맥도날드 폰트  --%>
<style type="text/css">
@font-face {
  font-family:SpeedeeK;
  font-weight:400;
  font-style:normal;
  src:  url(../css/font/Speedee_K_L.woff) format('woff')}
@font-face {
  font-family:SpeedeeK;
  font-weight:500;
  font-style:normal;
 
  src: url(../css/font/Speedee_K_R.woff) format('woff')}
@font-face {
  font-family:SpeedeeK;
  font-weight:600;
  font-style:normal;
  src: url(../css/font/Speedee_K_B.woff) format('woff')} 
</style>

<script type="text/javascript">
   
   <%-- 네비게이션 시작 --%>
   $(document).ready(function(){
      
      $("ul.depth2").hide(); // 처음에는 depth2 메뉴를 hide()
      
       $("li.nav-item").mouseover(      
         function(e){
            $("ul.depth2").show(); // header 메뉴에 마우스를 over 하면 depth2 메뉴 보여줌
               
            $("header").mouseover(function(){ // 그 이후는 header 안에 있다면 depth2 메뉴는 hide 되지 않다가
               $("ul.depth2").show();
            })
         }
      );
      
      
      $("header").mouseout(function(){ // 마우스가 header를 벗어날 때 hide() 함 
         $("ul.depth2").hide();
      })
   
      $("button.navbar-toggler").click(function(){
         $("nav.navbar").toggleClass("fixed-top");
         $("a.btn").toggle();
      });
      
      
      $("li.nav-item > a").mouseover(      
            function(e){
               $(e.target).find("span").addClass("menuhover");
            }
      );
      
      
      $("li.nav-item > a >span").mouseover(      
            function(e){
               $(e.target).parent().find("span").addClass("menuhover");
            }
      );
       

      $("li.nav-item").mouseout(      
            function(e){
               $("li.nav-item > a > span").removeClass("menuhover");
            }
      );
      
   });//end of  $(document).ready(function()----------------------------------------
   <%-- 네비게이션 끝 --%>

   // == 로그아웃을 처리해주는 페이지로 이동 ==
   function goLogOut() {
      
      
      location.href="<%= request.getContextPath()%>/login/logout.run"; 
      
   }//end of function goLogOut() --------------------------------------------------
   
   // === 나의정보 수정하기 ===
   function goEditPersonal(userid){
      
      // 나의 정보 수정 팝업창 띄우기
      const url = "<%=request.getContextPath()%>/member/memberEdit.run?userid="+userid;
      
      // 너비 800, 높이 680 인 팝업창을 화면 가운데 위치시키기
      const pop_width  = 800;
      const pop_height = 680;
      const pop_left = Math.ceil((window.screen.width - pop_width) / 2); <%-- 정수로 만듦 ceil 올림 floor 내림 --%>
      const pop_top = Math.ceil((window.screen.height - pop_height) / 2);               
                  
      window.open(url,"memeberEdit",
      "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height); 
      
   }//end of function goEditPersonal(userid)----------------------------------------
   
   
</script>

<meta charset="UTF-8">
<title>맥도날드</title>
</head>
<body>

   <header>
   
      <nav class="navbar navbar-expand-lg fixed-top border mx-0 px-4" style="background-color: #fff;">
      
      <div style="display:flex; margin:0 auto;">
    
      <a class="navbar-brand ml-5 mt-1" href="<%=ctxPath%>/"><img src="<%=ctxPath%>/images/logo.png" alt="이미지가 존재하지 않습니다."/></a>
      
      <!-- 아코디언 같은 Navigation Bar 만들기 -->
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
         <span class="navbar-toggler-icon"><i class="fa-regular fa-square-caret-down fa-3x"></i></span>
       </button>
      
      <div class="collapse navbar-collapse" id="collapsibleNavbar" style="font-weight: bold" >
        <ul class="navbar-nav" style="font-size: 16pt;">
           
           <li class="nav-item active">
              <a class="nav-link menufont_size pt-5 pl-5 ml-5" href="#"><span>Menu</span></a>
              <ul class="depth2" style="position: relative; left: 45px;"><%-- 평소에 가려지는 부분 --%>
                 <li><a href="<%=ctxPath%>/menu/burgerMain.run">버거</a></li>
               <li><a href="<%=ctxPath%>/menu/mcMorningMain.run">맥모닝</a></li>
             <li><a href="<%=ctxPath%>/menu/sideMain.run">사이드</a></li>
             <li><a href="<%=ctxPath%>/menu/dessertMain.run">디저트</a></li>
             <li><a href="<%=ctxPath%>/menu/drinkMain.run">맥카페&음료</a></li>
              </ul>
           </li>
           
          <li class="nav-item">
             <a class="nav-link menufont_size pt-5 pl-2 ml-5" href="#"><span>What's New</span></a>
             <ul class="depth2" style="position: relative;left: 25px;"><%-- 평소에 가려지는 부분 --%>
                <li><a href="<%=ctxPath%>/promotion/promotionMain.run">프로모션</a></li>
             </ul>              
          </li>
          
           <li class="nav-item">
              <a class="nav-link menufont_size pt-5 pl-5 ml-5" href="#"><span>Story</span></a>
              <ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
                <li><a href="<%=ctxPath%>/quality/qualityView.run">맥도날드 품질 이야기</a></li>
                <li><a href="<%=ctxPath%>/daan/aboutUs.run">맥도날드 사람들</a></li>
            </ul>              
           </li>
           
           <%-- ** 로그인을 전 시작 ** --%>
           <c:if test="${empty sessionScope.loginuser}">
              <li class="nav-item">
                 <a class="nav-link menufont_size pt-5 pl-5 ml-5" style="color: #ffbc0d;" href="<%=ctxPath%>/login/login.run">LOGIN</a><%-- 로그인 창 --%>
                 <ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
               </ul>              
              </li>  
          </c:if>    
           <%-- ** 로그인을 전 끝 ** --%>
            
           <%-- ** 로그인을 후 시작 ** --%>
           <c:if test="${not empty sessionScope.loginuser}"> 
              <li class="nav-item">
                 <a class="nav-link menufont_size pt-5 pl-5 ml-5" style="color: #ffbc0d; cursor: pointer;" onclick="goLogOut();">LOGOUT</a><%-- 로그인 창 --%>
                 <ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
                     <c:if test="${sessionScope.loginuser.userid != 'kingkingadmin'}"> 
                       <li><a  style="color: #ffbc0d;" href="javascript:goEditPersonal('${(sessionScope.loginuser).userid}');">나의 정보 수정</a></li>
                       <li><a  style="color: #ffbc0d;" href="<%= ctxPath %>/totalorder/totalOrderMain.run">나의 주문 내역</a></li>
                       <li><a  style="color: #ffbc0d;" href="<%= ctxPath %>/member/memberDelete.run?userid=${(sessionScope.loginuser).userid}">회원탈퇴</a></li>
                    </c:if>   
               </ul>              
              </li>  
          </c:if>  
           <%-- ** 로그인을 후 끝 ** --%> 
           
           <li class="nav-item">
             <a class="nav-link menufont_size pt-5 pl-4 ml-5" style="color: #ffbc0d;" href="<%=ctxPath%>/order/orderMain.run">McDelivery</a>
             <ul class="depth2" style="position: relative;left: 45px;"></ul><%-- 평소에 가려지는 부분 --%>
           </li> 
           
           <%-- kingkingadmin(관리자)으로 로그인 시작 --%>
           <c:if test="${sessionScope.loginuser != null and sessionScope.loginuser.userid == 'kingkingadmin'}"> 
               <li class="nav-item"> 
                 <a class="nav-link menufont_size pt-5 pl-5 ml-5" style="color: #ff8533;">ADMIN</a><%-- 로그인 창 --%>
                 <ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
                   <li><a style="color: #ff8533;" href="<%= ctxPath %>/member/memberList.run">회원목록</a></li>
                   <li><a style="color: #ff8533;" href="<%= ctxPath %>/item/itemList.run">제품등록&목록</a></li>
                   <li><a style="color: #ff8533;" href="<%= ctxPath %>/totalorder/totalOrderMain.run">전체주문내역</a></li>
               </ul>              
              </li> 
           </c:if>
           <%-- kingkingadmin(관리자)으로 로그인 끝 --%>   
           
           <li class="nav-item">
             <a class="nav-link menufont_size pt-5 pl-4 ml-5" style="color: #ff8533;" href="<%=ctxPath%>/daan/aboutUs.run">☆소감문☆</a>
             <ul class="depth2" style="position: relative;left: 45px;"></ul><%-- 평소에 가려지는 부분 --%>
           </li>
           
              
         </ul>
       </div>   
     </div>
    
       <div id="div_flex1">
         <a href="<%=ctxPath%>/quality/qualityView.run"><img src="<%=ctxPath%>/images/btn_story.png"></a>
       </div>
       
       <div id="div_flex2">
          <a href="<%=ctxPath%>/order/orderMain.run"><img src="<%=ctxPath%>/images/btn_delivery.png"></a>
       </div>
       
       <div id="div_flex3">
          <a href="#"><img src="<%=ctxPath%>/images/btn_top.png"></a>
       </div>
       
   </nav>
</header>
   