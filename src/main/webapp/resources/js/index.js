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
    dates[i] = `<div class="date"><a href="#" onclick="listOutput(this)">
    <span class=${condition}>${date}</span></a></div>`;
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
function listOutput(obj) {
	
}


