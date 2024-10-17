function deleteSelectedItems(){
	// 체크된 항목들의 prdNo 값을 배열에 추가
    var check = [];
    $("input[name='check']:checked").each(function() {
    	check.push($(this).val());
    });

    if (check.length === 0) {
        alert("삭제할 항목을 선택하세요.");
        return;
    }

    // 삭제 확인 메시지
    var confirmDelete = confirm("정말 삭제하시겠습니까?");
    
    if (confirmDelete) {
        // "Yes"를 선택했을 때 삭제 진행
        $.ajax({
            type: "POST",
            url: "/KBOMarket/admin/deleteAdminList", 
            data: $('#adminListForm').serialize(),
            success: function() {
                location.href="/KBOMarket/admin/adminList";
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    } else {
        // "No"를 선택했을 때 아무 동작도 하지 않음
        alert("삭제가 취소되었습니다.");
    }
}