<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<title>사내일정</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"/>' />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<script type="text/javascript" src="/group/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src='/group/resources/js/calendar.js'></script>
<script type="text/javascript" src='/group/resources/css/calendar.css'></script>

</script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

      var calendar = new Calendar(calendarEl, {
    	  events: [
    	    {
    	      title  : 'event1',
    	      start  : '2010-01-01'
    	    },
    	    {
    	      title  : 'event2',
    	      start  : '2010-01-05',
    	      end    : '2010-01-07'
    	    },
    	    {
    	      title  : 'event3',
    	      start  : '2010-01-09T12:30:00',
    	      allDay : false // will make the time show
    	    }
    	  ]
    	});
      
      
      $.ajax({
  		url: '/home/getUserReservation.do',
  		type: 'GET',
  		success: function(res){
  			var list = res;
  			console.log(list);
  			
  			
   			var calendarEl = document.getElementById('calendar');
  			
  			var events = list.map(function(item) {
  				return {
						title : item.reservationTitle,
						start : item.reservationDate + "T" + item.reservationTime
					}
  			});
  			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					events : events,
					eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  }
				});
				calendar.render();
  		},
  	});
</script>


</head>
<body>
    <div id="container">
		<%@ include file="../sidebar.jsp" %>
        <div id="content">
			
			<div id='calendar'></div>
        
        	
        </div> <!-- content 끝 -->
    </div> <!-- container 끝 -->
</body>


</html>