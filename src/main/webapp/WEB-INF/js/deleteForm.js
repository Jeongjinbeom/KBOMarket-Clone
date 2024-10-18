$(function(){
	
	//탈퇴버튼
	$('#deleteBtn').click(function(){
		$('#checkDiv').empty();
		
		if($('#pwd').val()==''){
			$('#checkDiv').html('<span style="color: red; font-weight: bold;">비밀번호 필수 입력</span>');	
		}else{
			$.ajax({
				type: 'post',
				url: '/KBOMarket/user/getExistPwd',
				data: 'pwd='+$('#pwd').val(),
				success: function(data){
				//alert(data);
				if(data.pwd == $('#pwd').val()){
					if(confirm('정말로 탈퇴하시겠습니까?')){
					$.ajax({
						type: 'post',
						url: '/KBOMarket/user/delete',
						data: 'pwd=' +$('#pwd').val(),
						success: function(){
							//로그아웃도 가능하게
							$.ajax({
								type:'post',
								url:'/KBOMarket/user/logout',
								success: function(){
										alert('회원탈퇴 완료');
										location.href ='/KBOMarket/';		
									},
								error:function(e){
									alert('로그아웃 실패');
									console.log(e);
								}
							   });//ajax
							  },error:function(e){
									alert('회원탈퇴 실패');
									console.log(e);
							}
						});//ajax
					}//if
				}else{
					$('#checkDiv').html('<span style="color: red; font-weight: bold;">비밀번호 잘못 입력</span>')	
				}
			},error: function(e){
				console.log(e);
			}
		});
	}//deleteBtn
	});
});//fun