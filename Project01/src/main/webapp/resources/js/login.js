$(document).ready(function(){
	$('#joinForm').hide();
	
	$('#join').on('click',function(){
		$('#loginForm').fadeOut(1000,function(){
			$('#joinForm').fadeIn(1000);
		});
	});
	
	$('#backBt').on('click',function(){
		$('#joinForm').fadeOut(1000,function(){
			$('#loginForm').fadeIn(1000);
		});
	})
	
	$('#inputUserName').focusout(function(){
		//id중복
	})
	
	$('#confirmPw').popover();
	
	$('#confirmPw').on('keyup',function(){
		var pw1 = $('#inputPw').val();
		var pw2 = $('#confirmPw').val();
		if(pw1 === pw2){
			$('#confirmPw').popover('hide');
		}else{
			$('#confirmPw').popover('show');
		}
	})
	
	$('#loginBt').on('click',function(){
		var username = $('#loginUsername').val();
		var password = $('#loginPassword').val();
		$.ajax({
			url : "login",
			type : "post",
			data : {
				'username' : username,
				'password' : password
			},
			success : function(str){
				if(str === "success"){
					
					location.href = "../"
				}
			}
		})
	});
	
	
})








































/*(function ($) {
    "use strict";


    ==================================================================
    [ Focus input ]
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    ==================================================================
    [ Validate ]
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    ==================================================================
    [ Show pass ]
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).addClass('active');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).removeClass('active');
            showPass = 0;
        }
        
    });


})(jQuery);
*/