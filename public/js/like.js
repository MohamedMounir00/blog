
$(".like").on('click',function() {
	var like_s = $(this).attr('data-like');
		var post_id = $(this).attr('data-postid');
		post_id = post_id.slice(0,-2);

//alert(post_id);

$.ajax({

	type: 'POST',
	url: url,
	data: {like_s: like_s, post_id: post_id, _token: token},


	  success: function (data) {
	  	//alert(data.is_like);

	  	if (data.is_like ==1) 
	  	{
	  		$('*[data-postid="'+post_id+'_l"]').removeClass('btn-secondry').addClass('btn-success');
	  	   $('*[data-postid="'+post_id+'_d"]').removeClass('btn-danger').addClass('btn-secondry');
	  	   var cu_like  = $('*[data-postid="'+post_id+'_l"]').find('.like_count').text();
	  
	  	   var new_like =parseInt(cu_like)+1;
	  	   $('*[data-postid="'+post_id+'_l"]').find('.like_count').text(new_like);
	  	   if(data.chang_like == 1)
	  	   {
	  	   	var cu_dslike  = $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text();
	  
	  	   var new_dslike =parseInt(cu_dslike) -1;
	  	   $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text(new_dslike);

	  	   }

	  	}

	  	if (data.is_like ==0) 
	  	{
	  		$('*[data-postid="'+post_id+'_l"]').removeClass('btn-success').addClass('btn-secondry');
	  		 var cu_like  = $('*[data-postid="'+post_id+'_l"]').find('.like_count').text();
	  
	  	   var new_like =parseInt(cu_like)-1;
	  	   $('*[data-postid="'+post_id+'_l"]').find('.like_count').text(new_like);
	  	}
	  }
});


});


$(".dislike").on('click',function() {
	var like_s = $(this).attr('data-like');
		var post_id = $(this).attr('data-postid');
		post_id = post_id.slice(0,-2);

//alert(post_id);

$.ajax({

	type: 'POST',
	url: url_dis,
	data: {like_s: like_s, post_id: post_id, _token: token},


	  success: function (data) {
	  	//alert(data.is_like);

	  	if (data.disis_like ==1) 
	  	{
	  		$('*[data-postid="'+post_id+'_d"]').removeClass('btn-secondry').addClass('btn-danger');
	  			  		$('*[data-postid="'+post_id+'_l"]').removeClass('btn-success').addClass('btn-secondry');
	  	 var cu_dslike  = $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text();
	  
	  	   var new_dslike =parseInt(cu_dslike) +1;
	  	   $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text(new_dslike);

	  	   if (data.chang_dislike == 1) 
	  	   {
            var cu_like  = $('*[data-postid="'+post_id+'_l"]').find('.like_count').text();
	  
	  	   var new_like =parseInt(cu_like) - 1;
	  	   $('*[data-postid="'+post_id+'_l"]').find('.like_count').text(new_like);
	  	   }

	  	}

	  	if (data.disis_like ==0) 
	  	{
	  		$('*[data-postid="'+post_id+'_d"]').removeClass('btn-danger').addClass('btn-secondry');
	  		 var cu_dslike  = $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text();
	  
	  	   var new_dslike =parseInt(cu_dslike)-1;
	  	   $('*[data-postid="'+post_id+'_d"]').find('.dislike_count').text(new_dslike);
	  	}
	  	}
	  
});


});

