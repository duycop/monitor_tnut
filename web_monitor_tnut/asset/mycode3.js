﻿'use strict';

var logined = false; //check việc đã login phía client

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
	3: 'Đang sửa chữa nhé',
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
			var title = 'Phòng ' + item.name + ': ' + TITLE[item.status];
			html += `<td class="phong-hoc ${status}" id="p${p}" data-key="${p}" title="${title}">`;
			html += (tang * 100 + phong);
			html += '</td>';
		}
		html += '</tr>';
	}
	$('#' + key).html(html);
}
function change_status(idPhong, status, callback) {
	//phải logined ok thì mới đc change status of idPhòng
	if (!logined) {
		//thông báo: mày chưa login, ko đc thay đổi, có muốn login ko
		//nếu có thì gọi hàm login() => show dialog nhập uid+pwd
		$.confirm({
			title: "Báo lỗi",
			content: "Muốn thay đổi trạng thái thì cần login?",
			columnClass: 's',
			closeIcon: true,
			buttons: {

				yes: {
					text: 'Có login ngay',
					btnClass: 'btn-primary',
					keys: ['y', 'c'],
					action: function () {
						do_login();
					}
				},
				close: {
					text: 'Không',
					btnClass: 'btn-danger',
					keys: ['k', 'n'],
					action: function () {
					}
				},
			}
		})
		return; //để ko chạy phần dưới
	}
	$.post(api,
		{
			action: 'change_status',
			idPhong: idPhong,
			status: status
		},
		function (json) {
			if (json.ok) {
				//vẽ lại giao diện của html trong index
				set_status('#p' + idPhong, json)
				MAP[idPhong] = json;
				thong_ke_lai();
				callback(json);
			} else {
				logined = false;
				$.alert({ title: 'Báo lỗi', content: json.msg });
			}
		},
		'json');
}


function bao_loi(msg, callback) {
	$.alert({
		title: 'Báo lỗi',
		content: msg,
		autoClose: 'ok|3000',
		buttons: {
			ok: {
				text: 'OK',
				btnClass: 'btn-danger',
				keys: ['esc', 'c', 'x', 'enter'],
			}
		},
		onDestroy: function () {
			callback()
		}
	});
}
//khi nào gọi hàm này?
//khi click vào 1 phòng, phòng đang ở class nào?? .phong-hoc


function _get_history(idPhong, callback) {
	$.post(api,
		{
			action: 'get_history',
			idPhong: idPhong
		},
		function (json) {
			callback(json);
		}, 'json');
}
function get_history(idPhong) {
	function get_html_history(json) {
		var html;
		if (json.ok) {
			//hậu xử lý ra html: đi ăn sáng đã: kệ nó quay
			//đã ăn xong, vào làm tiếp
			html = '<div class="table-responsive">' +
				'<table class="table table-hover"><thead>' +
				'<tr class="table-info">' +
				'<th>STT</th>' +
				'<th>Trạng thái</th>' +
				'<th>Thời gian</th>' +
				'</tr>' +
				'</thead><tbody>';
			//show html ra 1 dialog
			if (json.data) {
				var stt = json.data.length;
				for (var row of json.data) {
					html += '<tr>' +
						`<td>${stt--}</td>` +
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
		} else {
			html = json.msg; //báo lỗi của api
			logined = false;
		}
		return html;
	}
	function update_history(json, dialog) {
		var html = get_html_history(json);
		dialog.setContent(html);
		var status = json.data[0].status;
		if (status == 1) {
			dialog.buttons.free.hide();
			dialog.buttons.hoc.show();
			dialog.buttons.fix.show();
		} else if (status == 2) {
			dialog.buttons.free.show();
			dialog.buttons.hoc.hide();
			dialog.buttons.fix.show();
		} else if (status == 3) {
			dialog.buttons.free.show();
			dialog.buttons.hoc.show();
			dialog.buttons.fix.hide();
		}
	}
	function show_history(json) {
		var html = get_html_history(json);
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
							_get_history(idPhong, function (json) { update_history(json, dialog); });
						});
						return false; // ko đóng
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
							_get_history(idPhong, function (json) { update_history(json, dialog); });
						});
						return false; // ko đóng
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
							_get_history(idPhong, function (json) { update_history(json, dialog); });
						});
						return false; // ko đóng
					}
				},
				Close: {
					text: 'Đóng lại',
					btnClass: 'btn-secondary',
					keys: ['esc', 'x'],
					action: function () {
						//ko làm gì
					}
				}
			}
		});

	};

	_get_history(idPhong, show_history)
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

function cap_nhat_trang_thai() {
	for (var key in TNUT) {
		get_status(key, function (key) {

		})
	}
}


export function main() {
	//F5 thì mất biết logined => ko có thông tin user, hide Logout
	//mỗi vào trang thì hỏi api xem cookie chứa sid có ok ko?

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
				thong_ke_lai();
				show_thong_ke();

				setInterval(function () {
					//cap_nhat_trang_thai();
				}, 20000);
			}
		});
	}
}

