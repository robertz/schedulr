component {

	function getTasks (event, rc, prc) {
		var data = {
			'meta_data': {
				'code': 200,
				'status': "success",
				'type': "success",
				'message': "success"
			},
			'response': {
				'tasks': []
			}
		};
		cfschedule(action = "list", result = "tasks");
		tasks.each((task) => {
			data.response.tasks.append(task);
		});
		return data;
	}

}