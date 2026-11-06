function init_quizes() {
	global.quizes = [ //add your quiz object into this array
		obj_quiz1,
		obj_quiz2,
		//obj_quiz3
	]

	global.quiz_names = [];
	for (var i = 0; i < array_length(global.quizes); i++) {
		var inst = instance_create_depth(0, 0, -9999, global.quizes[i]);
		array_push(global.quiz_names, inst.bank_name);
		instance_destroy(inst);
	}
}