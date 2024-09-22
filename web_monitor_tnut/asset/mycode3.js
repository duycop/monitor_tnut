$(function () {
	'use strict';
	const api = '/api.aspx';
	$(".toa-nha").draggable();
	const TNUT = {
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
	const TITLE = {
		1: 'Trống',
		2: 'Đang học',
		3: 'Sửa chữa',
	}
	const MAP = {};
	const THONG_KE = { 1: 0, 2: 0, 3: 0 };

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
	function draw_nha(key) {
		var day_nha = TNUT[key];
		var html = '<table class="table table-bordered">';
		html += '<tcaption>Giảng đường ' + key.toUpperCase() + '</tcaption>';
		for (var tang = day_nha.tang; tang >= 1; tang--) {
			html += '<tr>';
			for (var phong = 1; phong <= day_nha.phong; phong++) {
				var p = day_nha.id * 10000 + tang * 100 + phong;
				var item = MAP[p];
				var status = STATUS[item.status];
				var title = 'Phòng' + item.name + ': ' + TITLE[item.status];
				html += `<td class="phong-hoc ${status}" id="p${p}" data-key="${p}" title="${title}">`;
				html += (tang * 100 + phong);
				html += '</td>';
			}
			html += '</tr>';
		}
		$('#' + key).html(html);
	}
	function change_status(idPhong, status, callback) {
		$.post(api,
			{
				action: 'change_status',
				idPhong: idPhong,
				status: status
			},
			function (json) {
				if (json.ok) {
					//vẽ lại giao diện
					set_status('#p' + idPhong, json)
					MAP[idPhong] = json;
					thong_ke_lai();
					callback(json);
				} else {
					//bao_loi()
				}
			},
			'json');
	}
	//khi nào gọi hàm này?
	//khi click vào 1 phòng, phòng đang ở class nào?? .phong-hoc
	function get_history(idPhong) {
		$.post(api,
			{
				action: 'get_history',
				idPhong: idPhong
			},
			function (json) {
				if (json.ok) {
					//hậu xử lý ra html: đi ăn sáng đã: kệ nó quay
					//đã ăn xong, vào làm tiếp
					var html = '<div class="table-responsive">' +
						'<table class="table table-hover"><thead>' +
						'<tr class="table-info">' +
						'<th>STT</th>' +
						'<th>Trạng thái</th>' +
						'<th>Thời gian</th>' +
						'</tr>' +
						'</thead><tbody>';
					//show html ra 1 dialog
					if (json.data) {
						var stt = 0;
						for (var row of json.data) {
							html += '<tr>' +
								`<td>${++stt}</td>` +
								`<td>${TITLE[row.status]}</td>` +
								`<td>${row.time}</td>` +
								'</tr>';
						}
					} else {
						html += '<tr class="table-warning">' +
							`<td colspan=3>KHÔNG CÓ DỮ LIỆU LỊCH SỬ</td>` +
							'</tr>';
					}
					html += '</tbody></table></div>';

					var dialog = $.confirm({
						title: 'Lịch sử thay đổi trạng thái phòng: ' + MAP[idPhong].name,
						content: html,
						columnClass: 'm',
						closeIcon: true,
						buttons: {
							fix: {
								text: '<span title="Chuyển phòng này sang trạng thái bận">Đang Sửa</span>',
								btnClass: 'btn-danger',
								keys: ['b', 'f'],
								isHidden: MAP[idPhong].status == 3,
								action: function () {
									//code để chuyển phòng này sang trạng đang sửa
									change_status(idPhong, 3, function () {
										dialog.close();
									});
								}
							},
							hoc: {
								text: '<span title="Chuyển phòng này sang trạng thái học">Đang học</span>',
								btnClass: 'btn-blue',
								keys: ['h'],
								isHidden: MAP[idPhong].status == 2,
								action: function () {
									//code để chuyển phòng này sang trạng đang học
									change_status(idPhong, 2, function () {
										dialog.close();
									});
								}
							},
							free: {
								text: '<span title="Chuyển phòng này sang trạng phòng trống">Phòng trống</span>',
								btnClass: 'btn-warning',
								keys: ['t'],
								isHidden: MAP[idPhong].status == 1,
								action: function () {
									//code để chuyển phòng này sang trạng đang học
									change_status(idPhong, 1, function () {
										dialog.close();
									});
								}
							},
							Close: {
								text: 'Đóng lại',
								btnClass: 'btn-secondary',
								keys: ['esc','x'],
								action: function () {
									//ko làm gì
								}
							}
						}
					});
				} else {
					//bao loi
				}
			},
			'json');
	}

	function get_status(key, callback) {
		var day_nha = TNUT[key];
		$.post(api,
			{
				action: 'get_status',
				idDay: day_nha.id
			},
			function (json) {
				if (json.ok) {
					for (var item of json.data) {
						MAP[item.id] = item;
						THONG_KE[item.status]++;
					}
					callback(key);
				} else {
					//bao loi
				}
			},
			'json');
	}
	function thong_ke_lai() {
		THONG_KE[1] = THONG_KE[2] = THONG_KE[3] = 0;
		console.log(MAP)
		for (var key in MAP) {
			var item = MAP[key];
			THONG_KE[item.status]++;
		}
		show_thong_ke();
	}
	function show_thong_ke() {
		function boc(a, b, c) {
			return ` ${a}: <span class="badge rounded-pill ${b}">${c}</span>`;
		}
		var html = boc("Đang học", "bg-info", THONG_KE[2]) + boc("Trống", "bg-warning", THONG_KE[1]) + boc("Sửa", "bg-danger", THONG_KE[3]);
		$('#thong-ke').html(html);
	}

	var dem = 0;
	for (var key in TNUT) {
		get_status(key, function (key) {
			draw_nha(key);
			dem++; //vì get_status là hàm bất đồng bộ nên 1 lúc nó mới xong
			if (dem == 5) { //đã xong 5 toà nhà
				//thì mới đăng ký sự kiện click 1 thể
				$('.phong-hoc').click(function () {
					//alert('test click vào phòng học');
					//lấy id phòng:
					var id = $(this).data('key')
					get_history(id);
				});
				show_thong_ke();
			}
		});
	}


});