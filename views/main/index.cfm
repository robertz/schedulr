<div v-if="isEditing" class="mb-4">
	<div class="card">
		<div class="card-header">
			<p class="card-header-title">Task Editor</p>
		</div>
		<div class="card-content">
			<div class="content">
				<div class="columns">
					<div class="column is-6">
						<label for="editorTask" class="has-text-weight-bold">Task</label>
						<input id="editorTask" class="input" type="text" v-model="editor.task" />
						<label for="editorURL" class="has-text-weight-bold">URL</label>
						<input id="editorURL" class="input" type="url" v-model="editor.url" />
						<label for="editorFile" class="has-text-weight-bold">File</label>
						<input id="editorFile" class="input" type="text" v-model="editor.file" />
					</div>
					<div class="column is-6">
						<label for="editorStartDate" class="has-text-weight-bold">Start Date</label>
						<input id="editorStartDate" class="input" type="text" v-model="editor.startdate" />
						<label for="editorStartTime" class="has-text-weight-bold">Start Time</label>
						<input id="editorStartTime" class="input" type="text" v-model="editor.starttime" />
						<label for="editorEndDate" class="has-text-weight-bold">End Date</label>
						<input id="editorEndDate" class="input" type="text" v-model="editor.enddate" />
						<label for="editorEndTime" class="has-text-weight-bold">End Time</label>
						<input id="editorEndTime" class="input" type="text" v-model="editor.endtime" />
						<label for="editorInterval" class="has-text-weight-bold">Interval</label>
						<input id="editorInterval" class="input" type="text" v-model="editor.interval" />
					</div>
				</div>
				<div v-if="saveError" class="notification is-danger">
					<button class="delete" @click="saveError=false"></button>
					<strong>Uh oh!</strong> There was an error saving your data. Check your attributes and try again.
				</div>
				<div class="block">
					<input type="button" class="button is-success" value="Update" @click="updateTask" :disabled="!editorValid" />
					<input type="button" class="button is-danger" value="Cancel" @click="isEditing=false" />
				</div>
			</div>

		</div>
	</div>
</div>

<div class="table-container" v-if="tasks.length">
	<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Task</th>
				<th scope="col">URL</th>
				<th scope="col">File</th>
				<th scope="col">Interval</th>
				<th scope="col">Start Date</th>
				<th scope="col">End Date</th>
				<th scope="col">Paused</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="(tsk, idx) in tasks">
				<td>{{ tsk.task }}</td>
				<td>{{ tsk.url }}</td>
				<td>{{ tsk.file }}</td>
				<td>{{ tsk.interval }}</td>
				<td>{{ tsk.startdate }}</td>
				<td>{{ tsk.enddate }}</td>
				<td>{{ tsk.paused }}</td>
				<td>
					<i class="fas fa-edit" @click="edit(idx)"></i>
					<i class="fas fa-play" @click="exe(tsk.task)"></i>
					<i class="fas fa-pause" @click="doTask(idx)" v-bind:class="{ 'has-text-grey-light': !tsk.paused }"></i>
					<i class="fas fa-times" @click="del(tsk.task)"></i>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div>
	<input type="button" class="button is-primary" value="Add New" @click="add">
</div>
