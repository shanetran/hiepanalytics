$(function() {
	check_textProduct_search();
	check_textSale_search();
	function check_textProduct_search() {
		if ($("#search_day_from, #search_day_to").val() == "") {
			$("#btn-product-search").attr("disabled", "disabled");
		} else {
			$("#btn-product-search").attr("disabled", false);
		}
	}

	function check_textSale_search() {
		if ($("#search_sales_day_from, #search_sales_day_to").val() == "") {
			$("#btn-sale-search").attr("disabled", "disabled");
		} else {
			$("#btn-sale-search").attr("disabled", false);
		}
	}


	$("#search_day_from, #search_day_to").blur(function() {
		check_textProduct_search();
	});
	$("#search_sales_day_from, #search_sales_day_to").blur(function() {
		check_textSale_search();
	});

	$(".product-popup").click(function() {
		$("#product-dialog").dialog({
			autoOpen : true,
			title : "Thêm sản phẩm mới",
			maxWidth : 600,
			maxHeight : 600,
			width : 600,
			height : 600,
			modal : true,
		});
		return false;
	});
	$(".sale-popup").click(function() {
		$("#sale-dialog").dialog({
			autoOpen : true,
			title : "Thêm sản phẩm bán",
			maxWidth : 600,
			maxHeight : 600,
			width : 600,
			height : 600,
			modal : true,
		});
		return false;
	});

});
