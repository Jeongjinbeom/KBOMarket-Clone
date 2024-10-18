$(document).ready(function() {
    var items = $(".admin-item-container"); 
    var numItems = items.length;
    var perPage = 10;

    items.slice(perPage).hide();

    if ($("#pagination").length) {
        $("#pagination").pagination({
            items: numItems,
            itemsOnPage: perPage,
            cssStyle: 'light-theme',
            prevText: "이전",
            nextText: "다음",
            onPageClick: function(pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
            },
            edges: 1,
            displayedPages: 3
        });
    } else {
        console.error("Pagination div not found");
    }
});

function deleteSelectedItems(event){
	
	event.preventDefault();
	
	// 체크된 항목들의 prdNo 값을 배열에 추가
	var check = [];
    $("input[name='check']:checked").each(function() {
    	check.push($(this).val());
    });
	
    if (check.length === 0) {
        alert("삭제할 항목을 선택하세요.");
       	location.href='/KBOMarket/admin/adminList';
       	return;
    }else{
		// 삭제 확인 메시지
	    var confirmDelete = confirm("정말 삭제하시겠습니까?");
	    
	    if (confirmDelete) {
	        $('#adminListForm').submit();
	    } else {
	        // "No"를 선택했을 때 아무 동작도 하지 않음
	        alert("삭제가 취소되었습니다.");
	    }    
    }

    
} 