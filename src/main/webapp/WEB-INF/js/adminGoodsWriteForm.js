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
                     $('.upload-text').hide(); // 이미지가 업로드되면 "이미지 등록" 텍스트 숨김
                 }
                 reader.readAsDataURL(file);
             }
         });
         
         // 이미지 업로드
         $('.left-section').on('click', function() {
             $('#imageFile').click();
         });
         
     });
	 
$('#prdWriteBtn').click(function(){
    let formData = new FormData($('#imageUploadForm')[0]);
    
    $('#prdNameDiv').empty();
    $('#prdPriceDiv').empty();
    $('#qtyDiv').empty();

    if($('#prdName').val() == ''){
        $('#prdNameDiv').text("상품명을 입력해주세요.").css('color', 'red');
        console.log("상품명이 입력되지 않음");
    } else if($('#prdPrice').val() == ''){
        $('#prdPriceDiv').text("상품가격을 입력해주세요.").css('color', 'red');
        console.log("상품가격이 입력되지 않음");
    } else if($('#qty').val() == ''){
        $('#qtyDiv').text("상품개수를 입력해주세요.").css('color', 'red');
        console.log("상품개수가 입력되지 않음");
    } else {
        console.log("AJAX 요청 실행 준비 완료");
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
        }); // ajax
    }
});