$(function() {
	$("#acount").click(function() {
		if ($('#menus').is(':hidden')) {
			// 非表示の場合の処理
			$("#menus").css("visibility", "hidden");
		} else {
			// 表示されている場合の処理
			$("#menus").css("visibility", "visible");
		}
	});
});



