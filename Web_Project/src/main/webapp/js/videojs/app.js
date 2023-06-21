//유튜브 재생목록:
//PLc_zRwwpj2yb7J4SSOZchx_5mxr7ZEf9p
//PLc_zRwwpj2ybP5wfTVPGPGg2E29LlO2n4

$(function() {

	var key = 'AIzaSyDjWnU8P3_R3R3fMC5-Ur1tvx_PBUJnyoc';
	var playlistId = 'PLc_zRwwpj2yb7J4SSOZchx_5mxr7ZEf9p';
	var URL = 'https://www.googleapis.com/youtube/v3/playlistItems';

	var options = {
		part: 'snippet',
		key: key,
		maxResults: 12,
		playlistId: playlistId
	}

	//let run function on page load
	loadVideos()

	//create above function
	function loadVideos() {
		$.getJSON(URL, options, function(data) {
			var id = data.items[0].snippet.resourceId.videoId;

			//run default video on load
			mainVideo(id);

			//run video list function
			videoList(data)
		});
	}

	//create default video on load
	function mainVideo(id) {
		$(".video_section").html(`
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/${id}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          `)
	}

	//create video list function
	function videoList(data) {
		$.each(data.items, function(i, item) {
			var thumb = item.snippet.thumbnails.medium.url;
			var title = item.snippet.title.substring(0, 50);
			var title_ = title.length > 45 ? title + '...' : title;
			var vid = item.snippet.resourceId.videoId;

			//inset video in the div
			$(".video_thumb .row").append(`
                <div class="col-6 col-md-6, col-lg-3">
                    <div class="item" data-key="${vid}">
                        <div class="thumb_">
                            <img src="${thumb}" alt="${title}">
                        </div>
                        <div class="vid_desc">
                            <h4>${title_}</h4>
                        </div>
                    </div>
                </div>
               
            `)

		})
	}

	//click event and add video in main video 
	$(".video_thumb").on("click", ".item", function() {
		$(this).addClass("active").siblings().removeClass("active");
		var id = $(this).attr("data-key");
		mainVideo(id);

	});
});