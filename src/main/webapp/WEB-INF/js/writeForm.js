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
		
		if($('#name').val() == '') {
	        $('#nameDiv').html('<span style="color: red; font-weight: bold;">이름 입력</span>');
	    }
	});//name
	
	//이메일 체크 -- 나중에 인증번호 관련해서 변경 
	$('#email').on('keyup blur', function(){
		$('#emailDiv').empty();	
		
		if($('#email').val() == '') {
	        $('#emailDiv').html('<span style="color: red; font-weight: bold;">이메일 입력</span>');
	    }
	});//email
	
	/*$(document).ready(function(){
		if('#emailcheck').click(function(){
			var email = $('#email').val();
			if(email) {
					
			}//if:email
			
		}//if:check
	});//email
	*/
	

//이메일 인증번호발송 -- 빈칸이면 번호발송을 눌러주세요 이메일 인증완료
let emailVerified = false;

    $('#mail-Check-Btn').click(function() {
        const email = $('#email').val();
        const checkInput = $('#mail-check-input');
        
        $.ajax({
            type: 'post',
            url: '/KBOMarket/user/mailCheck',
            data: { email: email },
            success: function (data) {
                checkInput.attr('disabled', false);
                alert('인증번호가 전송되었습니다.')
            },
            error: function() {
                alert('인증번호 발송에 실패했습니다.');
            }
        });
    });
    
// 인증번호 비교 
  $('#mail-check-input').blur(function () {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');
        
        $.ajax({
            type: 'post',
            url: '/KBOMarket/user/verifyEmail',
            data: { code: inputCode },
            success: function(response) {
                $resultMsg.html('인증번호가 일치합니다.');
                $resultMsg.css('color','green');
                $('#mail-Check-Btn').attr('disabled',true);
                $('#email').attr('readonly',true);
                emailVerified = true;
            },
            error: function() {
                $resultMsg.html('인증번호가 불일치합니다. 다시 확인해주세요!');
                $resultMsg.css('color','red');
                emailVerified = false;
            }
        });
    });



	
	//다 작성했을때 div의 값이 사라지도록
	$(document).on('click', function(event) {
        //아이디 - 사용가능
        if (!$(event.target).closest('#userId, #userIdDiv, #repwdDiv,#name, #nameDiv').length) {
             if ($('#userIdDiv').text().includes('사용 가능')) {
                $('#userIdDiv').empty();
             }
         //비밀번호 - 일치
         	if ($('#repwdDiv').text().includes('비밀번호 일치')) {
                $('#repwdDiv').empty();
             }
         //이름
         	if($('#name').val()!= ''){
         		$('#nameDiv').empty();
            }
          //이메일
           	if($('#email').val()!= ''){
         		$('#emailDiv').empty();
            }
          }//if  
    	});//Div부분
    	
    //회원 등록
    $('#joinBtn').click(function(){
    	$('#userIdDiv').empty();
    	$('#pwdDiv').empty();
    	$('#repwdDiv').empty();
    	$('#emailDiv').empty();
    	//$('#emailcheckDiv').empty();
    	
    	if($('#userId').val() == '')
    		$('#userIdDiv').html('<span style="color: red; font-weight: bold;">아이디 입력</span>');
    	else if($('#pwd').val() == '')
    		$('#pwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 입력</span>');   
    	else if($('#repwd').val() == '')
    	 	$('#repwdDiv').html('<span style="color: red; font-weight: bold;">비밀번호 확인</span>');
    	else if($('#email').val() == '')
    		$('#emailDiv').html('<span style="color: red; font-weight: bold;">이메일 입력</span>');
    	//else if($('#emailcheck').val() == '')
    	//	$('#emailcheckDiv').html('<span style="color: red; font-weight: bold;">이메일 인증 필수</span>'));
    	else
    		if (!emailVerified) { // 이부분부터 email 인증 관련 코드
            alert('이메일 인증을 완료해주세요.');
            return;
        }

        $.ajax({
            type: 'post',
            url: '/KBOMarket/user/join',
            data: $('#userWriteForm').serialize(),
            success: function(data) {
                if(data == 'success') {
                    alert('회원가입이 완료되었습니다.');
                    location.href = '/KBOMarket/user/loginForm';
                } else {
                    alert('회원가입에 실패했습니다. ' + data);
                }
            },
            error: function(e) {
                console.log(e);
                alert('회원가입 중 오류가 발생했습니다.');
            }
    		});
    	});//회원가입 버튼
    
}); //function
