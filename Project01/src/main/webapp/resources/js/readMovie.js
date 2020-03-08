$(document).ready(function(){
	
	var str = $('#actorTd').html().toString().replace(/  /gi, ", ");
	var index = str.lastIndexOf(",");
	$('#actorTd').html(str.substring(0,index));
	
	var sessionUId = $('#usernameTd').html();
    var moviename = $('#moviename').val();

    getList();
    $('#submitReplyBt').on('click',function(){
		$.ajax({
			url : '../review/insertReview',
			type : 'POST',
			data : {
				username : sessionUId,
				moviename : moviename,
				contents : $('#inputReply').val(),
				movielink : $('#movielink').val()
			},
			success : function(){
				alert('입력되었습니다');
				getList();
				$('#inputReply').val("");
			}
		})
	})
})

function getList(){
	var sessionUId = $('#usernameTd').html();
    var moviename = $('#moviename').val();
    
    	$.ajax({
        	url : '../review/getList',
        	type : 'GET',
        	data : {
        		moviename : moviename
        	},
        	success : function(res){
        		if(res != ''){
        			var listHtml = "<tr>";
            		$.each(res, function(key, item){
            			listHtml += "<td class = 'repUsername'>"+item.username+"</td>";
            			listHtml += "<td class = 'repContents' style = 'word-wrap: break-word'>"+item.contents.replace(/(?:\r\n|\r|\n)/g, '<br />')+"</td>";
            			listHtml += "<td class = 'repInputdate'>"+item.inputdate+"</td></tr>";
            		});
            		$('#repList').html(listHtml);
        		}
        	}
        })
    }