$(document).ready(function(){
	
	var username = $('#readmovie-row').attr('data-username');
	getList(username);

	
})

function getList(username){
	$.ajax({
		url : 'getMyList',
		type : 'GET',
		data : {
			username : username
		},
		success : function(res){
			alert("succ");
			if(res != ''){
    			var listHtml="";
        		$.each(res, function(key, item){
        			listHtml += "<table id = 'movieInfo' class = 'col-lg-7 myreview'>";
        			listHtml += "<tr id = 'repForm' style = 'height : 33%;'>";
        			listHtml += "<td rowspan='4'><a href = '/myapp/movie/read?title="+item.moviename+"'><img src = '"+item.movielink+"'></a></td>>";
        			listHtml += '<th>영화제목</th>	<td><a href = "/myapp/movie/read?title='+item.moviename+'">'+item.moviename+'</a></td>';
        			listHtml += '<td><button type = "button" class = "btn delBt" data-num="'+item.reviewNum+'" data-username = "'+item.username+'">삭제</button></td></tr>';
        			listHtml += '<tr><th>작성자</th><td>'+item.username+'</td></tr><tr><th>내용</th><td>'+item.contents+'</td></tr><tr><th>날짜</th><td>'+item.inputdate+'</td></tr></table>;'
        		});
        		$('#readmovie-row').html(listHtml);
        		
        		$('.delBt').on('click', function(){
        			var num = $(this).attr('data-num');
        			
        			$.ajax({
        				url : 'deleteReview',
        				type : 'POST',
        				data : {
        					reviewNum : num
        				},
        				success : function(){
        					alert("삭제되었습니다");
        					getList(username);
        				}
        			})
        		})
    		}else{
    			var listHtml="";
    			listHtml += "<div style = 'color : #FFF; font-weight : bold; font-size : x-large;'>댓글이 없습니다</div>"
    			$('#readmovie-row').html(listHtml);
    		}
		}
	})
}