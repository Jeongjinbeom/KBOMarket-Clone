function toggleCheckboxes() {
    const checkboxes = document.querySelectorAll('.deleteBtn');
 	const btn = document.getElementById('deleteBtn'); 
    checkboxes.forEach(checkbox => {
        checkbox.style.display = checkbox.style.display === 'none' ? 'inline' : 'none';
    });
    
    btn.style.display = btn.style.display === 'none' ? 'inline' : 'none';
}

function toggleAll(checkbox) {
    const deleteCheckboxes = document.querySelectorAll('.deleteBtn:not(#allDeleteBtn)');
    deleteCheckboxes.forEach(cb => {
        cb.checked = checkbox.checked; // allDeleteBtn의 상태에 따라 체크박스 상태 설정
    });
}

function updateAllCheckbox(checkbox) {
    const allDeleteBtn = document.getElementById('allDeleteBtn');
    const deleteCheckboxes = document.querySelectorAll('.deleteBtn:not(#allDeleteBtn)');

    // 하나라도 체크 해제되면 allDeleteBtn 해제
    if (!checkbox.checked) {
        allDeleteBtn.checked = false;
    } else {
        // 모든 체크박스가 체크되어 있는지 확인
        allDeleteBtn.checked = Array.from(deleteCheckboxes).every(cb => cb.checked);
    }
}

$('#deleteBtn').click(function() {
    const checkbox = document.getElementById('allDeleteBtn');
    checkbox.checked = false;

    var checkedValues = $('.deleteBtn:checked').map(function() {
        return $(this).val();
    }).get(); // 배열로 변환

    if (checkedValues.length === 0) {
        alert("삭제할 항목을 선택하세요."); // 체크된 항목이 없을 경우 알림
        return;
    }
    

    // FormData 객체 생성
    let formData = new FormData();
    // 체크된 값들을 FormData에 추가 (배열 형태로)
    checkedValues.forEach(function(value) {
        formData.append('ids', value);
    });
    
    console.log(formData)

    $.ajax({
        type: 'post',
        url: '/KBOMarket/order/cartDelete',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            alert("삭제가 완료되었습니다.");
            location.href="/KBOMarket/order/cartForm"
        },
        error: function(xhr, status, error) {
            alert("삭제에 실패했습니다. 다시 시도해주세요.");
        }
    });
});