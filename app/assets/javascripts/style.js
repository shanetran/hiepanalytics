$(function() {
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
