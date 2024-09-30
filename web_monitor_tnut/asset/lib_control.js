'use strict';
let lib = {};
export function set_lib(L) { lib = L; }

const api = '/api.aspx';

export const setting = {
	item_per_row: 3,
	buttons: {
		user: {
			name: '<i class="fa-solid fa-user"></i> Users',
			title: 'Quản lý user',
			class: 'btn btn-primary cmd-man-user',
			action: function (dialog, item) { lib.user.manager(dialog, item); }
		},
		setting: {
			name: '<i class="fa-solid fa-gear"></i> Setting',
			title: 'Quản lý cấu hình',
			class: 'btn btn-info cmd-man-setting',
			action: function (dialog, item) { lib.user.manager(dialog, item); }
		},
		setting2: {
			name: '<i class="fa-solid fa-gear"></i> Setting2',
			title: 'Quản lý cấu hình2',
			class: 'btn btn-primary cmd-man-setting2',
			action: function (dialog, item) { lib.user.manager(dialog, item); }
		},
		log: {
			name: '<i class="fa-solid fa-clock-rotate-left"></i> Log',
			title: 'Xem log hệ thống',
			class: 'btn btn-primary cmd-man-log',
			action: function (dialog, item) {
				lib.log.show_log();
			}
		}
	}
};

function show_control_panel() {
	function get_content(dialog) {
		function gen_button(key) {
			var item = setting.buttons[key];
			var title = item.title || '';
			return `<td align="center" class="space"><div class="d-grid"><button class="${item.class}" title="${title}" data-key="${key}">${item.name}</button></div></td>`;
		}
		var content = '<div class="table-responsive-sm"><table width="100%" class="table table-sm table-borderless table-control-panel"><tbody><tr>';
		var stt = 0;
		for (var key in setting.buttons) {
			content += gen_button(key);
			stt++;
			if (stt % setting.item_per_row == 0) {
				content += '</tr><tr>';
			}
		}
		content += '</tr><tbody></table></div>';
		content = content.replace('<tr></tr>', '');
		return content;
	}
	var dialog_control = $.confirm({
		title: 'CONTROL PANEL',
		icon: 'fa-solid fa-gear',
		type:'blue',
		content: get_content(),
		animation: 'rotateYR',
		closeAnimation: 'rotateYR',
		animationBounce: 1.5,
		animateFromElement: false,
		typeAnimated: false,
		closeIcon: true,
		columnClass: 'm',
		buttons: {
			ok: {
				text: '<i class="fa fa-circle-xmark"></i> Close',
				keys: ['esc', 'c', 'x', 'enter'],
				btnClass: 'btn-danger',
				action: function () {
				}
			}
		},
		onContentReady: function () {
			for (var key in setting.buttons) {
				var item = setting.buttons[key];
				var selector = 'button.' + item.class.replaceAll(' ', '.');
				$(selector).unbind('click');
				$(selector).click(function () {
					var key = $(this).data('key')
					var item = setting.buttons[key];
					item.action(dialog_control,item);
				});
			}
		},
	});
}
function show_control_button(ok) {
	if (ok) {
		$('.cmd-control-panel').removeClass('no-display').unbind('click').click(function () {
			show_control_panel();
		})
	} else {
		$('.cmd-control-panel').addClass('no-display');
	}
}
export function main() {
	show_control_button(lib.user.setting.logined);
}