$(function(){
	$.ajax({
		url: path + "/user/getUser.do",
		type:"post",
		dataType:"text",
		success:function(respText){
			var userObj = $.parseJSON(respText);
			if(userObj.user != null) {
				$("#loginAlertIs").html(userObj.user.username);
			}
		},
		error:function() {
			alert("系统错误");
		}
	});
});