$(function () {  //event Document Ready
	'use strict';
	var logined = false; //check việc đã login phía client
	var visitorId = '';
	var base64 = null;
	var user_info;
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

	function show_user(json) {
		logined = true;
		user_info = json;
		//show info login thành công
		$('#user-info').html('Welcome ' + json.name)
		//hiện nút logout
		$('.cmd-logout').removeClass('no-display');
		//ẩn nút login
		$('.cmd-login').addClass('no-display');
	}
	var my_salt = '';

	function show_captcha(json) {
		if (json.captcha) {
			base64 = json.captcha;
			if ($('#img-captcha')) {
				$('#captcha-zone').removeClass("no-display");
				$('#img-captcha').attr("src", "data:image/png;base64," + base64);
				$('#img-captcha').unbind('click').click(function () {
					GenerateSalt();
				});
			}
		} else {
			base64 = null;
		}
	}
	function GenerateSalt() {
		$.post(api, { action: 'GenerateSalt' }, function (json) {
			if (json.salt) {
				my_salt = json.salt;
				console.log('Lấy được muối: ' + my_salt);
			}
			show_captcha(json);
		}, 'json');
	}
	function do_login() {
		//lấy tí muối
		GenerateSalt();
		// Hàm tính toán SHA1
		function sha1(input) {
			return CryptoJS.SHA1(input).toString(CryptoJS.enc.Hex);
		}
		// Hàm mã hóa mật khẩu
		function hashPassword(password, salt) {
			// Mã hóa: SHA1(SHA1(pw) + muối)
			return sha1(sha1(password) + salt);
		}
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
			title: "Đăng nhập",
			content: html_login_form,
			columnClass: 's',
			closeIcon: true,
			onContentReady: function () {
				if (base64 != null) {
					show_captcha({ captcha: base64 })
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
					text: 'Login',
					btnClass: 'btn-primary cmd-submit',
					action: function () {
						var login_data = {
							action: 'login',
							uid: $('#uid').val(),
							pwd: hashPassword($('#pwd').val(), my_salt),
							captcha: $('#txt-captcha').val(),
							fp: visitorId
						};
						if (login_data.uid == '') {
							bao_loi('Chưa nhập username', function () { $('#uid').focus(); });
							return false;
						}
						if ($('#pwd').val() == '') {
							bao_loi('Chưa nhập password', function () { $('#pwd').focus(); });
							return false;
						}
						if (base64 && login_data.captcha == '') {
							bao_loi('Chưa nhập captcha', function () { $('#txt-captcha').focus(); });
							return false;
						}
						var sending_dialog = $.confirm({
							title: "Đăng nhập",
							content: "đang gửi...",
							columnClass: 's',
							closeIcon: true,
							autoClose: 'ok|3000',
							buttons: {
								ok: {
									text: 'Close',
									keys: ['esc', 'c', 'x', 'enter'],
									btnClass: 'btn-danger nut-ok-sending',
									action: function () {
									}
								}
							},
							onContentReady: function () {
								$('.nut-ok-sending').focus();
							}
						});
						$.post(api, login_data, function (json) {
							if (json.salt) {
								my_salt = json.salt;
								console.log("Lấy đc muối mới: " + json.salt)
							}
							show_captcha(json);
							if (json.ok) {
								show_user(json);
								//đóng hộp thoại login lại
								sending_dialog.setTitle("Đăng nhập thành công!");
								sending_dialog.setContent("Chào mừng " + json.name + "<br>Lần đăng nhập trước: " + json.lastLogin);
								login_dialog.close();
							} else {
								//GenerateSalt(); //sinh muối mới, ko cần nữa vì đã cho muối vào phản hồi login sai
								sending_dialog.setTitle("Báo lỗi");
								sending_dialog.setContent(json.msg);
								//sending_dialog.onDestroy = function () {
								//	if (json.msg.indexOf('captcha') >= 0) {
								//		$('#txt-captcha').focus();
								//	} else if (json.msg.indexOf('password') >= 0) {
								//		$('#pwd').focus();
								//	} else if (json.msg.indexOf('user') >= 0) {
								//		$('#uid').focus();
								//	}
								//};
								logined = false;
								//ko đc đóng login
							}
						}, 'json');
						return false; //ko đóng hộp thoại login lại
					}
				},
				close: {
					text: 'Close',
					btnClass: 'btn-danger',
					action: function () {
					}
				},
			}

		})
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
	function do_logout() {
		$.post(api, { action: 'logout' }, function (json) {
			if (json.ok) {
				logined = false;
				//ẩn thông tin
				$('#user-info').html('');
				//ẩn nút logout
				$('.cmd-logout').addClass('no-display');
				$('.cmd-login').removeClass('no-display');
			}
		}, 'json');
	}
	function check_logined(fp) {
		$.post(api, { action: 'check_logined', fp: fp }, function (json) {
			if (json.ok) {
				//đây chính là thông tin user hợp lệ
				show_user(json);
			}
		}, 'json');
	}
	function load_fp(callback) {
		// Tải FingerprintJS
		FingerprintJS.load().then(fp => {
			// Lấy fingerprint của trình duyệt
			fp.get().then(json => {
				visitorId = json.visitorId;
				if (json.captcha) base64 = json.captcha; else base64 = null;
				callback(visitorId);
			});
		});
	}
	load_fp(function (fp) { check_logined(fp); });
	$('.cmd-login').click(function () { do_login(); });
	$('.cmd-logout').click(function () { do_logout(); });
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


});//callback trong js : giúp hàm đc tái sử dụng nhiều lần
//mỗi lần hậu xử lý khác nhau bởi callback

//callback : gọi ngược lại

//kỹ thuật: truyền 1 hàm vào làm tham số 1 hàm
//trong hàm : dùng tham số đó như 1 hàm : callback(json)