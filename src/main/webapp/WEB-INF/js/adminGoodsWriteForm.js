$(document).ready(function() {
    // 상품명 실시간 업데이트
    $('#prdName').on('input', function() {
        $('#prdNameDisplay').text($(this).val());
    });

    // 이미지 파일 선택 시 미리보기
    $('#imageFile').on('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#productImage').attr('src', e.target.result);
                $('#uploadText').hide(); // 이미지가 업로드되면 텍스트 숨김
            }
            reader.readAsDataURL(file);
        }
    });
    
    // 이미지 업로드
    $('.left-section').on('click', function() {
        $('#imageFile').click();
    });
    
    // 폼 제출 시 유효성 검사
    $('#prdWriteBtn').click(function(){
        let formData = new FormData($('#imageUploadForm')[0]);
        
        $('#prdNameDiv').empty();
        $('#prdPriceDiv').empty();
        $('#qtyDiv').empty();
        $('#uploadText').text("이미지 등록").removeClass('error-text');

        let isValid = true;

	    if($('#imageFile')[0].files.length === 0){
            $('#uploadText').text("이미지를 등록해주세요").css('color', 'red').show();
            isValid = false;
        }
        else if($('#prdName').val() == ''){
            $('#prdNameDiv').text("상품명을 입력해주세요.").css('color', 'red');
            isValid = false;
        }
        else if($('#prdPrice').val() == ''){
            $('#prdPriceDiv').text("상품가격을 입력해주세요.").css('color', 'red');
            isValid = false;
        }
        else if($('#qty').val() == ''){
            $('#qtyDiv').text("상품개수를 입력해주세요.").css('color', 'red');
            isValid = false;
        } if(isValid) {
            $.ajax({
                type: 'post',
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                url: '/KBOMarket/admin/goodsWrite',
                data: formData,
                success: function(data){
                    alert(data);
                    location.href = '/KBOMarket/admin/adminList';
                },
                error: function(e){
                    console.log("AJAX 요청 실패: ", e);
                }
            });
        }
    }); 
});