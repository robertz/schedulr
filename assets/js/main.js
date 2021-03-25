new Vue({
	el: '#app',
	data() {
		return {
			tasks: [],
			editor: {
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
			},
			isEditing: false
		}
	},
	created() {
		this.loadTasks()
	},
	computed: {

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
			fetch(`/api/alterTask/task/${task}/a/delete`)
				.then(res => res.json())
				.then(res => {
					this.tasks = res.response.tasks
				})
		},
		edit: function (idx) {
			this.editor = JSON.parse(JSON.stringify(this.tasks[idx]))
			this.isEditing = true
		},
		exe: function (task){
			fetch(`/api/runTask/task/${task}`)
		},
		loadTasks: function () {
			fetch('/api/getTasks')
				.then(res => res.json())
				.then(res => {
					this.tasks = res.response.tasks
				})
		},
		alterTask: function (idx) {
			let action = this.tasks[idx].paused ? 'resume' : 'pause'
			fetch(`/api/alterTask/task/${this.tasks[idx].task}/a/${action}`)
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