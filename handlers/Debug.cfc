component {

	function index (event, rc, prc) {
		var jobs = "";
		cfschedule(action = "list", result = "jobs");

		writeDump(var = jobs, abort = 1);

		abort;
	}

	function update (event, rc, prc) {
		cfschedule(
			action = "update",
			task = "myTask",
			operation = "HTTPRequest",
			startDate = "3/23/2021",
			startTime = "7:00 AM",
			url = "https://www.google.com/",
			interval = "300",
			publish = "true",
			path = expandPath("./") & "logs",
			file = "myTask.txt"
		);
		abort;
	}

	function run (event, rc, prc) {
		cfschedule(action = "run", task="myTask");
		abort;
	}

	function delete (event, rc, prc) {
		cfschedule(action = "delete", task="myTask");
		abort;
	}

}