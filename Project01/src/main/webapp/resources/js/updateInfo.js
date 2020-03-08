$(document).ready(function(){
	var checkPw=false;
	
	
	
	$('#backBt').on('click',function(){
		location.href="/myapp";
	})
	
	$('#inputUserName').on('keyup',function(){
		$('#submitJoinBt').attr('disabled','true');
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
		if(checkPw == true){
			$('#submitUpdateBt').removeAttr('disabled');
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
		if(checkPw == true){
			$('#submitUpdateBt').removeAttr('disabled');
		}
	})
	
})