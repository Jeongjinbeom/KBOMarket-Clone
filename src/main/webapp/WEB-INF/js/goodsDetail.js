function selectSize(selectElement) {
    const selectedValue = selectElement.value;
    const orderDiv = document.getElementById('orderDiv');
    
	const prdNo = document.getElementById('prdNo').className; // class 값 가져오기
    const prdName = document.getElementById('prdName').className; // class 값 가져오기
    const prdPrice = document.getElementById('prdPrice').className; // class 값 가져오기
    
    // 기존 폼 제거
    orderDiv.innerHTML = '';

    if (selectedValue) {
    	console.log(selectedValue)
        // orderForm 생성
        orderDiv.innerHTML = `
        	<div class="orderDiv">
            <form name="orderForm" action="/KBOMarket/goods/order" method="post" id="orderForm">
            <input type="hidden" name="prdNo" value="` + prdNo + `" />
	            <table id="orderTable">
	            	<tr>
	           			<td><span class="orderSizeTitle">` + prdName + `(` + selectedValue + `)</span>
	           				<input type="hidden" name="prdSize" id="orderPrdSize" value="` + selectedValue + `" /></td>
	        			<td>
	        				<input type="number" name="qty" id="qty" value="1" readonly onchange="updatePrice()" />
	        				<input type="hidden" id="onePrice" value="` + prdPrice + `" />
	        			</td>
		               	<td>
				            <div class="buttonContainer">
				                <button id="up" type="button" onclick="changeQuantity(1)">▲</button>
				                <button id="down" type="button" onclick="changeQuantity(-1)">▼</button>
				            </div>
	               		<td>
	               			<input type="hidden" name="prdPrice" id="orderPrice" value="` + prdPrice + `" />
	               			<span id="displayPrice">` + prdPrice + `</span>
	               		</td>
		            </tr>
		        </table>
            </form>
            </div>
        `;

        updatePrice();
    }
}

function formatPrice(price) {
    // 가격을 문자열로 변환하고, 정규 표현식을 사용하여 형식화
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' 원';
}

function updatePrice() {
    const qty = document.getElementById('qty').value;
    const price = parseFloat(document.getElementById('onePrice').value);
    const totalPrice = price * qty;
    
    document.getElementById('displayPrice').textContent = formatPrice(totalPrice);
    document.getElementById('orderPrice').value = totalPrice; 
}

function changeQuantity(delta) {
    const qtyInput = document.getElementById('qty');
    let currentQty = parseInt(qtyInput.value, 10);
    
    // 수량을 증가시키거나 감소시킵니다.
    currentQty += delta;

    // 수량이 1 미만이 되지 않도록 합니다.
    if (currentQty < 1) {
        currentQty = 1;
    }
    
    if (currentQty > 10) {
    	currentQty = 10;
    }

    qtyInput.value = currentQty; // 업데이트된 수량을 입력 필드에 설정
    updatePrice(); // 가격 업데이트
}
