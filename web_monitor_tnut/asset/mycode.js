$(function () {
	const api = '/api.aspx';
	//$(".toa-nha").draggable();
	const SIZE = {
		a7: { tang: 3, phong: 4, id: 7 },
		a8: { tang: 3, phong: 4, id: 8 },
		a9: { tang: 3, phong: 5, id: 9 },
		a10: { tang: 5, phong: 5, id: 10 },
		a16: { tang: 7, phong: 5, id: 16 },
	};
	const STATUS = {
		1: 'free',
		2: 'hoc',
		3: 'fix',
	}
	//draw 1 dãy nhà: hình chữ nhật số tầng t, mỗi tầng có số phòng n
	function html_day_nha(day_nha) {
		var html = '<table class="table table-bordered no-display" id="day-nha">';
		for (var tang = SIZE[day_nha].tang; tang >= 1; tang--) {
			html += '<tr>';
			for (var phong = 1; phong <= SIZE[day_nha].phong; phong++) {
				var id = SIZE[day_nha].id * 10000 + tang * 100 + phong;
				html += `<td class="phong-hoc" id="p${id}">`;
				html += (tang * 100 + phong);
				html += '</td>';
			}
			html += '</tr>';
		}
		return html;
	}
	//test thử hàm trên
	$('.toa-nha').click(function () {
		var id = $(this)[0].id;
		var html = html_day_nha(id);
		//alert(id) //đúng id rồi
		//tải thông tin mỗi khi click vào dãy nhà
		function set_status(item, p) {
			if (p.status == 1) {
				$(item).removeClass(STATUS[2]).removeClass(STATUS[3]).addClass(STATUS[1]).attr('title', 'Phòng ' + p.name + ' đang không học');
			}
			else if (p.status == 2) {
				$(item).removeClass(STATUS[1]).removeClass(STATUS[3]).addClass(STATUS[2]).attr('title', 'Phòng ' + p.name + ' đang học');
			}
			else if (p.status == 3) {
				$(item).removeClass(STATUS[1]).removeClass(STATUS[2]).addClass(STATUS[3]).attr('title', 'Phòng ' + p.name + ' đang sửa chữa');
			}
		}
		function get_status() {
			$.post(api,
				{
					action: 'get_status',
					idDay: id.substring(1)
				},
				function (json) {
					if (json.ok) {
						for (var p of json.data) {
							set_status('#p' + p.id, p);
						}
						$('#day-nha').removeClass('no-display');
					} else {
						//bao loi
					}
				},
				'json');
		}
		$.confirm({
			title: 'Dãy nhà: ' + id.toUpperCase(),
			content: html,
			buttons: {
				Close: function () {
				},
			},
			onContentReady: function () {
				get_status();
			}
		});
	});
});