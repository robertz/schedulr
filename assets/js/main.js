new Vue({
	el: '#app',
	data() {
		return {
			tasks: []
		}
	},
	created() {
		this.loadTasks()
	},
	methods: {
		loadTasks: function () {
			fetch('/api/getTasks')
				.then(res => res.json())
				.then(res => {
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