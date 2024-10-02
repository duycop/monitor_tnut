'use strict';
let lib = {};
export function set_lib(L) { lib = L; }
const api = '/api.aspx';
export const setting = {
	logined: false,
	fp: '',
	base64: null,
	user_info: {},
	my_salt: '',
	role: {}
}
function show_user(json) {
	setting.logined = true;
	setting.user_info = json;
	//show info login thành công
	$('#user-info').html('Welcome ' + json.name)
	//hiện nút logout
	$('.cmd-logout').removeClass('no-display');
	//ẩn nút login
	$('.cmd-login').addClass('no-display');
	lib.control.main();
}
function show_captcha(json) {
	if (json.captcha) {
		setting.base64 = json.captcha;
		if ($('#img-captcha')) {
			$('#captcha-zone').removeClass("no-display");
			$('#img-captcha').attr("src", "data:image/png;base64," + setting.base64);
			$('#img-captcha').unbind('click').click(function () {
				GenerateSalt();
			});
		}
	} else {
		setting.base64 = null;
	}
}
function GenerateSalt() {
	$.post(api, { action: 'GenerateSalt' }, function (json) {
		if (json.salt) {
			setting.my_salt = json.salt;
			console.log('Lấy được muối: ' + setting.my_salt);
		}
		show_captcha(json);
	}, 'json');
}
// Hàm tính toán SHA1
export function sha1(input) {
	return CryptoJS.SHA1(input).toString(CryptoJS.enc.Hex);
}
// Hàm mã hóa mật khẩu
export function hashPassword(password, salt) {
	// Mã hóa: SHA1(SHA1(pw) + muối)
	return sha1(sha1(password) + salt);
}
export function do_login() {
	//lấy tí muối
	GenerateSalt();
	//html có chứa login form
	var html_login_form = `<form class="was-validated">
  <div class="mb-3 mt-3">
    <input type="text" class="form-control uid" id="uid" placeholder="Enter username" name="uname" required>
	<span class="valid-feedback">Username đã nhập phải chính xác nhé</span>
    <span class="invalid-feedback">Hãy nhập username vào đi</span>
  </div>
  <div class="mb-3">
    <input type="password" class="form-control pwd" id="pwd" placeholder="Enter password" name="pswd" required>
	<span class="valid-feedback">Password nhập rồi nhưng phải đúng nhé.</span>
    <span class="invalid-feedback">Hãy nhập password vào đi</span>
  </div>
  <div class="no-display" id="captcha-zone">
	<img src="" id="img-captcha" class="pb-1" title="Click vào ảnh để tải nội dung mới" />
    <input type="text" class="form-control" id="txt-captcha" placeholder="Enter text in image" name="txt-captcha" required>
    <span class="valid-feedback">Captcha nhập giống ảnh nhé, click vào ảnh để tải nội dung mới</span>
    <span class="invalid-feedback">Hãy nhập chữ trong ảnh vào đi, click vào ảnh để tải nội dung mới</span>
  </div>
</form>`;
	var login_dialog = $.alert({
		title: 'Đăng nhập',
		icon: 'fa fa-key',
		type: 'blue',
		content: html_login_form,
		animation: 'rotateYR',
		closeAnimation: 'rotateYR',
		animationBounce: 1.5,
		animateFromElement: false,
		columnClass: 's',
		closeIcon: true,
		onContentReady: function () {
			if (setting.base64 != null) {
				show_captcha({ captcha: setting.base64 })
			}

			$('.jconfirm-holder').width($('.jconfirm-open').width());
			let self = this;
			var uidck = self.$content.find('.uid').val();
			if (uidck == '')
				self.$content.find('.uid').focus();
			else
				self.$content.find('.pwd').focus();
			self.$content.find('.uid').keyup(function (event) {
				if (event.keyCode === 13) {
					if (self.$content.find('.uid').val() == '')
						self.$content.find('.uid').focus();
					else
						self.$content.find('.pwd').focus();
				}
			});
			self.$content.find('.pwd').keyup(function (event) {
				if (event.keyCode === 13) {
					if (self.$content.find('.uid').val() == '')
						this.$content.find('.uid').focus();
					else if (self.$content.find('.pwd').val() == '')
						this.$content.find('.pwd').focus();
					else {
						let x = $.find('.cmd-submit');
						x[0].click();
					}
				}
			});
		},
		buttons: {

			yes: {
				text: '<i class="fa fa-circle-check"></i> Login',
				btnClass: 'btn-primary cmd-submit',
				action: function () {
					var login_data = {
						action: 'login',
						uid: $('#uid').val(),
						pwd: hashPassword($('#pwd').val(), setting.my_salt),
						captcha: $('#txt-captcha').val(),
						fp: setting.fp
					};
					if (login_data.uid == '') {
						bao_loi('Chưa nhập username', function () { $('#uid').focus(); });
						return false;
					}
					if ($('#pwd').val() == '') {
						bao_loi('Chưa nhập password', function () { $('#pwd').focus(); });
						return false;
					}
					if (setting.base64 && login_data.captcha == '') {
						bao_loi('Chưa nhập captcha', function () { $('#txt-captcha').focus(); });
						return false;
					}
					$.post(api, login_data, function (json) {
						if (json.salt) {
							setting.my_salt = json.salt;
							console.log("Lấy đc muối mới: " + json.salt)
						}
						show_captcha(json);
						if (json.ok) {
							show_user(json);
							//đóng hộp thoại login lại
							login_dialog.close();
							var content = 'Chào mừng ' + json.name + '<hr>Lần đăng nhập trước:<br><i class="fa-regular fa-clock"></i> ' + json.lastLogin;
							var title = 'Đăng nhập thành công!';
							lib.toastr.tip('info', title, content);
							$.confirm({
								title: title,
								content: content,
								icon: 'fa-solid fa-lock-open',
								columnClass: 's',
								type: 'blue',
								animation: 'rotateYR',
								closeAnimation: 'rotateYR',
								animationBounce: 1.5,
								animateFromElement: false,
								closeIcon: true,
								autoClose: 'ok|5000',
								buttons: {
									ok: {
										text: 'OK',
										keys: ['esc', 'c', 'x', 'enter'],
										btnClass: 'btn-info',
										action: function () {
											this.close();
										}
									}
								}
							});
						} else {
							//GenerateSalt(); //sinh muối mới, ko cần nữa vì đã cho muối vào phản hồi login sai
							bao_loi(json.msg, function () {
								if (json.msg.indexOf('captcha') >= 0) {
									$('#txt-captcha').focus();
								} else if (json.msg.indexOf('password') >= 0) {
									$('#pwd').focus();
								} else if (json.msg.indexOf('user') >= 0) {
									$('#uid').focus();
								}
							});
							setting.logined = false;
							//ko đc đóng login
						}
					}, 'json');
					return false; //ko đóng hộp thoại login lại
				}
			},
			close: {
				text: '<i class="fa fa-circle-xmark"></i> Close',
				btnClass: 'btn-danger',
				action: function () {
				}
			},
		}

	})
}
function bao_loi(msg, callback = null) {
	$.alert({
		title: 'Báo lỗi',
		content: msg,
		icon: 'fa-solid fa-triangle-exclamation',
		type: 'red',
		animation: 'rotateYR',
		closeAnimation: 'rotateYR',
		animationBounce: 1.5,
		animateFromElement: false,
		autoClose: 'ok|3000',
		buttons: {
			ok: {
				text: '<i class="fa fa-circle-xmark"></i> OK',
				btnClass: 'btn-danger',
				keys: ['esc', 'c', 'x', 'enter'],
			}
		},
		onDestroy: function () {
			if (callback != null) callback()
		}
	});
}
function do_logout() {
	$.post(api, { action: 'logout' }, function (json) {
		if (json.ok) {
			setting.logined = false;
			//ẩn thông tin
			$('#user-info').html('');
			//ẩn nút logout
			$('.cmd-logout').addClass('no-display');
			$('.cmd-login').removeClass('no-display');
			lib.control.main();
		}
	}, 'json');
}
function check_logined() {
	$.post(api, { action: 'check_logined', fp: setting.fp }, function (json) {
		if (json.ok) {
			//đây chính là thông tin user hợp lệ
			show_user(json);
		}
	}, 'json');
}
function load_fp(callback) {
	// Tải FingerprintJS
	FingerprintJS.load().then(fpm => {
		// Lấy fingerprint của trình duyệt
		fpm.get().then(json => {
			setting.fp = json.visitorId;
			setting.base64 = json.captcha ? json.captcha : null;
			callback();
		});
	});
}
function get_list_role() {
	var ok = false;
	var json_str = localStorage.getItem('get_list_role');
	if (json_str != null) {
		try {
			var json = JSON.parse(json_str);
			if (json.ok == 1) {
				setting.role = json.data;
				ok = true;
				console.log('load cache get_list_role');
			}
		} catch {
			ok = false;
		}
	}
	if (ok) return;//có rồi thì ko cần load
	$.post(api, { action: 'get_list_role' }, function (json) {
		if (json.ok) {
			localStorage.setItem('get_list_role', JSON.stringify(json));
			setting.role = json.data;
			console.log('load api get_list_role');
		}
	}, 'json');
}
export function main() {
	$('.cmd-login').click(function () { do_login(); });
	$('.cmd-logout').click(function () { do_logout(); });

	load_fp(check_logined);
	get_list_role();
}
function add_user(dialog_papa) {
	function form_add_user() {
		var all_option_roles = '';
		for (var item of setting.role) {
			if (item.id < setting.user_info.role)
				all_option_roles += '<option value="' + item.id + '">' + item.roleName + ' - ' + item.note + '</option>'
		}
		var html = `
			<div class="mb-3 mt-3">
			  <label for="nhap-uid" class="form-label">uid:</label>
			  <input type="text" class="form-control" id="nhap-uid" placeholder="Enter uid">
			</div>
			<div class="mb-3 mt-3">
			  <label for="nhap-pwd" class="form-label">Password:</label>
			  <input type="password" class="form-control" id="nhap-pwd" placeholder="Enter Password">
			</div>
			<div class="mb-3 mt-3">
			  <label for="nhap-fullname" class="form-label">Fullname:</label>
			  <input type="text" class="form-control" id="nhap-fullname" placeholder="Enter Fullname">
			</div>
			<div class="mb-3 mt-3">
			  <label for="nhap-role" class="form-label">Role:</label>
			  <select class="form-select" id="nhap-role">${all_option_roles}</select>
			</div>
			`;
		return html;
	}
	function do_add_user() {
		var data = {
			action: 'add_user',
			uid: $('#nhap-uid').val(),
			pwd: $('#nhap-pwd').val(),
			name: $('#nhap-fullname').val(),
			role: $('#nhap-role').val()
		}
		if (data.uid == '') {
			bao_loi('Chưa nhập uid', function () { $('#nhap-uid').focus(); });
			return;
		}
		if (data.pwd == '') {
			bao_loi('Chưa nhập pwd', function () { $('#nhap-pwd').focus(); });
			return;
		}
		if (data.name == '') {
			bao_loi('Chưa nhập name', function () { $('#nhap-name').focus(); });
			return;
		}

		$.post(api, data,
			function (json) {
				if (json.ok) {
					lib.toastr.tip('info', 'Thông báo', 'Đã add user thành công');
					get_list_user(dialog_papa); //tải lại ds user
					dialog_add.close(); //đóng thằng dialog_add lại
				} else {
					bao_loi(json.msg);//báo lỗi khi add_user
				}
			}, 'json'
		);//end $.post
	}
	var dialog_add = $.confirm({
		title: 'Add user',
		icon: 'fa-solid fa-user-plus',
		type: 'blue',
		content: form_add_user(this),
		animation: 'rotateYR',
		closeAnimation: 'rotateYR',
		animationBounce: 1.5,
		animateFromElement: false,
		columnClass: 's',
		closeIcon: true,
		buttons: {
			add: {
				text: '<i class="fa-solid fa-user-plus"></i> Add',
				btnClass: 'btn-primary',
				action: function () {
					do_add_user();
					return false; //ko đóng
				}
			},
			cancel: {
				text: '<i class="fa fa-circle-xmark"></i> Cancel',
				btnClass: 'btn-danger',
				action: function () {
				}
			}
		},
		onContentReady: function () {

		}
	});
}
function gen_html_list_user(json) {
	var html = '<div class="table-responsive-sm">' +
		'<table width="100%" class="table table-hover">' +
		'<thead><tr class="table-info">' +
		'<th>STT</th>' +
		'<th>Username</th>' +
		'<th>Full name</th>' +
		'<th>Role</th>' +
		'<th>Last Login</th>' +
		'<th>Action</th>' +
		'</tr></thead>' +
		'</thead><tbody>';
	if (json.ok) {
		if (json.data && json.data.length) {
			var stt = 0;
			for (var item of json.data) {
				var action = `
					<div class="dropdown">
					  <button type="button" class="btn btn-sm dropdown-toggle" data-bs-toggle="dropdown">
						Action ...
					  </button>
					  <ul class="dropdown-menu">
						<li><a href="#" class="dropdown-item cmd-action-user" data-action="edit" data-uid='${item.uid}'>Edit ${item.name}</a></li>
						<li><a href="#" class="dropdown-item cmd-action-user" data-action="delete" data-uid='${item.uid}'>Delete ${item.name}</a></li>
					  </ul>
					</div>
				`;
				html += '<tr>' +
					`<td nowarp>${++stt}</th>` +
					`<td nowarp>${item.uid}</th>` +
					`<td nowarp>${item.name}</th>` +
					`<td nowarp>${item.roleName}</th>` +
					`<td nowarp>${item.lastLogin}</th>` +
					`<td nowarp>${action}</th>` +
					'</tr>';
			}
		}
	} else {
		html += '<tr class="table-warning"><td colspan="5">Không có dữ liệu</td></tr>';
	}
	html += '</tbody></table></div>';
	return html;
}
function edit_user(uid){
	$.alert('code here: edit_user '+uid)
}
function delete_user(uid) {
	$.alert('code here: delete_user ' + uid)
}
function get_list_user(dialog) {
	$.post(api, { action: 'get_list_user', fp: setting.fp }, function (json) {
		if (json.ok) {
			var content = gen_html_list_user(json);
			dialog.setContent(content);
			$('.cmd-action-user').click(function () {
				var action = $(this).data('action');
				var uid = $(this).data('uid');
				if (action == 'edit') edit_user(uid);
				if (action == 'delete') delete_user(uid);
			});
		} else {
			dialog.setContent(json.msg);
		}
	}, 'json');
}
function show_list_user() {
	var content = 'Loading...'
	var dialog_list_user = $.confirm({
		title: 'User Manager',
		icon: 'fa-solid fa-users',
		type: 'blue',
		animation: 'rotateXR',
		closeAnimation: 'rotateXR',
		animationBounce: 1.5,
		animateFromElement: false,
		content: function () {
			get_list_user(this);
		},
		closeIcon: true,
		columnClass: 'l',
		buttons: {
			add: {
				text: '<i class="fa-solid fa-user-plus"></i> Add user',
				btnClass: 'btn-primary',
				action: function () {
					add_user(dialog_list_user);
					return false; //ko đóng
				}
			},
			close: {
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
export function manager(dialog, item) {
	//dialog.close();
	show_list_user();
}