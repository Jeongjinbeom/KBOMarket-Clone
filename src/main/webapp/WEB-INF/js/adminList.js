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