$(function(){

	//아이디 중복 체크
	$('#userId').on('keyup blur', function(){
		$('#userIdDiv').empty();
		
		if($('#userId').val() == ''){
			$('#userIdDiv').html('<span style="color: red; font-weight: bold;">아이디 입력</span>');
		}else
			$.ajax({
				type: 'post',
				url: '/KBOMarket/user/getExistId',
				data: 'userId='+$('#userId').val(),
				dataType : 'text',
				success: function(data) {
					if(data == 'exist') {
						$('#userIdDiv').html('<span style="color: red; font-weight: bold;">사용 불가능</span>');
					}else {
						$('#userIdDiv').html('<span style="color: blue; font-weight: bold;">사용 가능</span>');
					}
				},error : function(e) {
					console.log(e);
				}
			});//ajax	
	});//id
	
	//비밀번호 체크, 중복체크
	$('#pwd, #repwd').on('keyup blur', function() {
    	var pwd = $('#pwd').val(); // 비밀번호 입력 필드의 값
   		var repwd = $('#repwd').val(); // 비밀번호 확인 입력 필드의 값

    	$('#pwdDiv').empty();
    	$('#repwdDiv').empty();

	    if (!pwd) {
	        $('#pwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 입력</span>');
	    } else if (!repwd) {
	        $('#repwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 확인</span>');
	    } else if (pwd !== repwd) {
	        $('#repwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 불일치</span>');
	    } else { // pwd === repwd
	        $('#repwdDiv').html('<span style="color: blue; font-weight: bold;">비밀번호 일치</span>');
	    }
	});//pwd
	
	//이름 체크
	$('#name').on('keyup blur', function(){
		$('#nameDiv').empty();	 
		
	});//name
	
	//이메일
	//다 작성했을때 div의 값이 사라지도록
	$(document).on('click', function(event) {
        //아이디 - 사용가능
        if (!$(event.target).closest('#userId, #userIdDiv, #repwdDiv').length) {
             if ($('#userIdDiv').text().includes('사용 가능')) {
                $('#userIdDiv').empty();
             }
         //비밀번호 - 일치
         	if ($('#repwdDiv').text().includes('비밀번호 일치')) {
                $('#repwdDiv').empty();
             }
            }
    	});
    	
}); //function
