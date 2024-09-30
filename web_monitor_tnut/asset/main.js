'use strict';

let lib = {};
window.lib = lib;
function load(name, callback = null) {
	import('/asset/lib_'+name+'.js?r=1321').then(module => {
		lib = lib || {};
		lib[name] = module;
		module.set_lib(lib);
		module.main();
		if (callback != null) callback();
	});
}
load('user', function () {
	load('toastr');
	load('log');
	load('table');
	load('phong');
	load('control');
});