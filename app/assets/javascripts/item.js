$(function(){
	$("img.item-change-photo").click(function(){
		var ImgSrc = $(this).attr("src");
		var ImgAlt = $(this).attr("alt");
		$("img.item-main-photo").attr({src:ImgSrc,alt:ImgAlt});
		$("img.item-main-photo").hide();
		$("img.item-main-photo").fadeIn("slow");
		return false;
	});
});