new Vue({
	el: '#app',
	data() {
		return {
			tasks: [],
			editor: {},
			isEditing: false
		}
	},
	created() {
		this.loadTasks()
	},
	computed: {
		editorValid: function () {
			// is the current state of the editor valid to update
			if(!('url' in this.editor)) return false

			// validate the url is valid
			function isValidHttpUrl(string) {
				let url;
				try {
					url = new URL(string);
				} catch (_) {
					return false;
				}
				return url.protocol === "http:" || url.protocol === "https:";
			}
			// compute yo
			return (
				this.editor.task.length &&
				this.editor.startdate.length &&
				this.editor.starttime.length &&
				isValidHttpUrl(this.editor.url)
			)
		}
	},
	methods: {
		add: function () {
			this.editor = {
				unique: false,
				proxyport: "",
				starttime: "",
				proxypassword: "",
				proxyuser: "",
				enddate: "",
				interval: "",
				startdate: "",
				path: "",
				url: "",
				proxyserver: "",
				paused: false,
				password: "",
				endtime: "",
				file: "",
				port: "",
				timeout: "",
				valid: "true",
				username: "",
				autoDelete: false,
				publish: false,
				task: "",
				resolveurl: false
			}
			this.isEditing = true
		},
		del: function (task) {
			fetch(`/api/doTask/task/${task}/a/delete`)
				.then(res => res.json())
				.then(res => {
					this.tasks = res.response.tasks
				})
		},
		edit: function (idx) {
			// clone the task and show the editor
			this.editor = JSON.parse(JSON.stringify(this.tasks[idx]))
			this.isEditing = true
		},
		exe: function (task){
			fetch(`/api/doTask/task/${task}/a/run`)
		},
		loadTasks: function () {
			fetch('/api/getTasks')
				.then(res => res.json())
				.then(res => {
					this.tasks = res.response.tasks
				})
		},
		doTask: function (idx) {
			let action = this.tasks[idx].paused ? 'resume' : 'pause'
			fetch(`/api/doTask/task/${this.tasks[idx].task}/a/${action}`)
				.then(res => res.json())
				.then(res => {
					this.tasks = res.response.tasks
				})
		},
		updateTask: function () {
			fetch('/api/postTask', {
				method: 'POST',
				cache: 'no-cache',
				headers: {
      				'Content-Type': 'application/json'
    			},
				body: JSON.stringify(this.editor)
			})
			.then(res => res.json())
			.then(res => {
				this.isEditing = false
				this.tasks = res.response.tasks
			})
		}
	},
	filters: {
		moment: function(value, format) {
			return new moment(value).format(format)
		}
	}
})
Vue.config.devtools = true