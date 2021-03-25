component {

	private function taskList () {
		var res = [];
		cfschedule(action = "list", result = "tasks");
		tasks.each((task) => {
			var t = {};
			t.append(task);
			// format date and time in a cfschedule friendly format
			t.starttime = timeFormat(t.starttime, "h:mm tt");
			t.startdate = dateFormat(t.startdate, "yyyy-mm-dd");
			// handle non-standard ports so they do not have to be entered each time
			if(t.port != 80 && t.port != 443) t.url = t.url.replace(t.url.listToArray("/")[2], t.url.listToArray("/")[2] & ":" & t.port);
			res.append(t);
		});
		return res;
	}

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
		data.response.tasks.append(taskList(), true);
		return data;
	}

	function postTask (event, rc, prc) {
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
		var res = {};
		cfschedule(
			action = "update",
			task = rc.task,
			operation = "HTTPRequest",
			startDate = rc.startdate,
			startTime = rc.starttime,
			url = rc.url,
			resolveUrl = false,
			interval = rc.interval,
			publish = rc.keyExists("file") && rc.file.len() ? true : false,
			path = rc.keyExists("file") && rc.file.len() ? expandPath("./") & "logs" : "",
			file = rc.file
		);
		data.response.tasks.append(taskList(), true);
		return data;
	}

	function runTask (event, rc, prc) {
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
		cfschedule(
			action = "run",
			task = rc.task
		);
		return data;
	}

	function alterTask (event, rc, prc) {
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
		cfschedule(action = rc.a, task = rc.task);
		data.response.tasks.append(taskList(), true);
		return data;
	}

}