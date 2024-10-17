$(function() {
    // 로그인 버튼
    $('#loginBtn').click(function() {
        $('#checkidDiv').empty();
        $('#checkpwdDiv').empty();

        if ($('#userId').val() == '')
            $('#checkidDiv').html('<span style="color: red; font-weight: bold;">아이디 입력</span>');
        else if ($('#pwd').val() == '')
            $('#checkpwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 입력</span>');
        else{
            $.ajax({
                type: 'post',
                url: '/KBOMarket/user/login',
                data: {
               		userId: $('#userId').val(),
                    pwd: $('#pwd').val()
                },
                dataType: 'text',
                success: function(data) {
                    if (data.trim() == 'fail') {
                        alert("아이디 또는 비밀번호 틀림");
                    } else {
                        alert("로그인 완료");
                        location.href = '/KBOMarket/';
                    }
                },
                error: function(e) {
                    console.log(e);
                    alert("로그인 요청 중 오류 발생");
                }
            }); // ajax
		}
    }); //loginBtn

    // 다 작성했을 때 div의 값이 사라지도록
    $(document).on('click', function(event) {
        // 아이디와 비밀번호 입력란 외부 클릭 시
        if (!$(event.target).closest('#userId, #checkidDiv, #pwd, #checkpwdDiv').length) {
            // 아이디
            if ($('#userId').val() != '') {
                $('#checkidDiv').empty();
            }
            // 비밀번호
            if ($('#pwd').val() != '') {
                $('#checkpwdDiv').empty();
            }
        }
    }); // document click event

}); // function
 