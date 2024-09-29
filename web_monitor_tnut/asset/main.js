'use strict';

let lib = {};
window.lib = lib;
function load(name, callback = null) {
	import('/asset/lib_'+name+'.js?rnd=5').then(module => {
		lib = lib || {};
		lib[name] = module;
		module.set_lib(lib);
		module.main();
		if (callback != null) callback();
	});
}
load('user', function () {
	load('phong');
	load('control');
});