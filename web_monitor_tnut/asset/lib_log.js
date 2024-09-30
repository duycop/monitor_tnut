'use strict';
let lib = {};
export function set_lib(L) { lib = L; }

const api = '/api.aspx';

function get_log_content(dialog) {
	$.post(api, { action: 'get_log' }, function (json) {
		var html = '';
		if (json.ok) {
			html = '<div class="table-responsive" style="height-max:100px">' +
				'<table class="table table-hover" id="table-view-log"><thead>' +
				'<tr class="table-info">' +
				'<th>STT</th>' +
				'<th>Key</th>' +
				'<th>Log message</th>' +
				'<th>Time</th>' +
				'</tr>' +
				'</thead><tbody>';
			//show html ra 1 dialog
			if (json.data) {
				var stt = 0;
				for (var row of json.data) {
					html += '<tr>' +
						`<td>${++stt}</td>` +
						`<td>${row.key}</td>` +
						`<td>${row.msg}</td>` +
						`<td>${row.time}</td>` +
						'</tr>';
				}
			} else {
				html += '<tr class="table-warning">' +
					`<td colspan=3>KHÔNG CÓ DỮ LIỆU LỊCH SỬ</td>` +
					'</tr>';
			}
			html += '</tbody></table></div>';
		} else html = json.msg;
		dialog.setContent(html);
		lib.toastr.tip('info', 'Tải log thành công', '^_^');
		lib.table.sort_table('#table-view-log', 'System Log', 10);
	}, 'json')
}
export function show_log() {
	var dialog_log = $.confirm({
		title: 'System Log',
		icon: 'fa-solid fa-clock-rotate-left',
		type: 'blue',
		content: function () { get_log_content(this) },
		animation: 'rotateYR',
		closeAnimation: 'rotateYR',
		animationBounce: 1.5,
		animateFromElement: false,
		typeAnimated: false,
		closeIcon: true,
		columnClass: 'xl',
		buttons: {
			reload: {
				text: '<i class="fa fa-clock-rotate-left"></i> Reload',
				keys: ['r'],
				btnClass: 'btn-info',
				action: function () {
					get_log_content(this);
					return false;
				}
			},
			ok: {
				text: '<i class="fa fa-circle-xmark"></i> Close',
				keys: ['esc', 'c', 'x', 'enter'],
				btnClass: 'btn-danger',
				action: function () {
				}
			}
		},
		onContentReady: function () {
			
		},
	});
}
export function main() {
	//show_log();
}