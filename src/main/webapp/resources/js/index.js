

/* 달력 날짜 JS */


	let date = new Date();

	const renderCalender = () => {
  	const viewYear = date.getFullYear();
  	const viewMonth = date.getMonth();

	document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;
  
  /*  */
  const prevLast = new Date(viewYear, viewMonth, 0);		//지난 달
  const thisLast = new Date(viewYear, viewMonth + 1, 0);	//이번 달

  const PLDate = prevLast.getDate();	//지난 달의 마지막 날짜
  const PLDay = prevLast.getDay();		//지난 달의 마지막 요일

  const TLDate = thisLast.getDate();	//이번  달의 마지막 날짜
  const TLDay = thisLast.getDay();		//이번 달의 마지막 요일

  const prevDates = [];
  const thisDates = [...Array(TLDate + 1).keys()].slice(1);
  const nextDates = [];

  if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift(PLDate - i);
    }
  }

  for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push(i);
  }


  /* 날짜 */
  const dates = prevDates.concat(thisDates, nextDates);
  const firstDateIndex = dates.indexOf(1);
  const lastDateIndex = dates.lastIndexOf(TLDate);

  /* 달력에 날짜 넣는 반복문 */
  dates.forEach((date, i) => {
    const condition = i >= firstDateIndex && i < lastDateIndex + 1
                      ? 'this'
                      : 'other';
    dates[i] = `<div class="date" onclick = "f_selectDate(${viewYear}, ${viewMonth+1}, ${date}">
    <a data-bs-toggle="modal" data-bs-target="#addModal">
    <span class=${condition} >${date}</span><br>
    
    <span>${scheduleList}</span>
    
    </a></div>`;
  });

  document.querySelector('.dates').innerHTML = dates.join('');

  /* 오늘 날짜 찾기 */
  const today = new Date();
  if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
    for (let date of document.querySelectorAll('.this')) {
      if (+date.innerText === today.getDate()) {
        date.classList.add('today');
        break;
      }
    }
  }
};

renderCalender();

const prevMonth = () => {
  date.setMonth(date.getMonth() - 1);
  renderCalender();
};

const nextMonth = () => {
  date.setMonth(date.getMonth() + 1);
  renderCalender();
};

const goToday = () => {
  date = new Date();
  renderCalender();
};


/* 날짜 클릭시 아래 함수 실행됨 */
// 달력에서 선택한 날짜를 기본값으로 세팅 
	function selectDate(year, month, day) {
		
		$("#add_start").val(year+"-"+month+"-"+date);
		
	}


function fn_selectDate(date){
	
	var year = CDate.getFullYear();
	var month = CDate.getMonth() + 1;
	var date_txt = "";
	if(CDate.getMonth + 1 < 10){
		month = "0" + (CDate.getMonth() + 1);
	}
	if(date < 10){
		date_txt = "0" + date;
	}
	
	if(selectCk == 0){
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");
		
		$("#period_1").val(year+"-"+month+"-"+date);
		$("#period_2").val("");
		selectCk = date;
	}else{
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");		
		for(var i = selectCk + 1 ; i < date ; i++){
			$("#date_"+i).css("background-color", "#FFDDDD");
		}
		
		$("#period_2").val(year+"-"+month+"-"+date);
		selectCk = 0;
	}
	
}
	


