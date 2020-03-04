$(document).ready(function(){
	var checkId=false;
	var checkPw=false;
	
	
	
	$('#backBt').on('click',function(){
		location.href="login";
	})
	
	$('#inputUserName').on('keyup',function(){
		$('#submitJoinBt').attr('disabled','true');
	})
	
	$('#checkBt').on('click',function(){
		var username = $('#inputUserName').val();
		$.ajax({
			url : "checkUsername",
			type : "get",
			data : {
				'username' : username
			},
			success : function(str){
				if(str == "fail" || username.trim().length < 3){
					alert("사용할 수 없는 ID입니다");
					document.getElementById('inputUserName').focus();
					checkId=false;
					return false;
				}else if(str == "success"){
					alert("사용할 수 있는 ID입니다");
					
					document.getElementById('inputPw').focus();
					checkId=true;
					if(checkId ==true && checkPw == true){
						$('#submitJoinBt').removeAttr('disabled');
					}
				}
			}
		})
	})
	
	$('#inputPw').on('keyup',function(){
		var pw1 = $('#inputPw').val();
		var pw2 = $('#confirmPw').val();
		if(pw1 === pw2){
			$('#checkPw').html('사용할 수 있는 비밀번호 입니다');
			checkPw=true;
		}else{
			$('#checkPw').html('비밀번호가 일치하지 않습니다');
			checkPw=false;
		}
		if(checkId ==true && checkPw == true){
			$('#submitJoinBt').removeAttr('disabled');
		}
		
	})
	
	$('#confirmPw').on('keyup',function(){
		var pw1 = $('#inputPw').val();
		var pw2 = $('#confirmPw').val();
		if(pw1 === pw2){
			$('#checkPw').html('사용할 수 있는 비밀번호 입니다');
			checkPw=true;
		}else{
			$('#checkPw').html('비밀번호가 일치하지 않습니다');
		}
		if(checkId ==true && checkPw == true){
			$('#submitJoinBt').removeAttr('disabled');
		}
	})
	
})