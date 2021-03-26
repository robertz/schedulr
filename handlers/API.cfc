component {

	private function taskList () {
		var res = [];
		cfschedule(action = "list", result = "tasks");
		tasks.each((task) => {
			var t = {};
			t.append(task);
			// format date and time in a cfschedule friendly format
			t.startdate = dateFormat(t.startdate, "yyyy-mm-dd");
			t.starttime = timeFormat(t.starttime, "h:mm tt");
			t.enddate = len(t.enddate) ? dateFormat(t.enddate, "yyyy-mm-dd") : "";
			t.endtime = len(t.endtime) ? timeFormat(t.endtime, "h:mm tt") : "";
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
		try{
			cfschedule(
				action = "update",
				task = rc.task,
				operation = "HTTPRequest",
				startDate = rc.startdate,
				startTime = rc.starttime,
				endDate = rc.enddate,
				endTime = rc.endtime,
				url = rc.url,
				resolveUrl = false,
				interval = rc.interval,
				publish = rc.keyExists("file") && rc.file.len() ? true : false,
				path = rc.keyExists("file") && rc.file.len() ? expandPath("./") & "logs" : "",
				file = rc.file
			);
			data.response.tasks.append(taskList(), true);
		}
		catch(any e){
			data['meta_data']['code'] = 500;
			data['meta_data']['status'] = "error";
			data['meta_data']['type'] = "error";
			data['meta_data']['message'] = "error";
			chron(type = "error", message = deserializeJSON(e));
		}
		return data;
	}

	function doTask (event, rc, prc) {
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